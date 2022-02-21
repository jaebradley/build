#!/bin/bash

. "$(dirname ${BASH_SOURCE})/utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/utilities/applications/install_application_from_disk_image.sh"
. "$(dirname ${BASH_SOURCE})/applications/vim/install.sh"

application_directories=(
  "$(dirname ${BASH_SOURCE})/applications/Rectangle"
  "$(dirname ${BASH_SOURCE})/applications/Spotify"
  "$(dirname ${BASH_SOURCE})/applications/Intellij IDEA CE"
  "$(dirname ${BASH_SOURCE})/applications/Pycharm CE"
  "$(dirname ${BASH_SOURCE})/applications/Firefox"
  "$(dirname ${BASH_SOURCE})/applications/Meld.app"
)

required_application_files=(
  "dependencies"
  "install.sh"
  "installation_path"
  "validate.sh"
)

for (( i=0; i < ${#application_directories[@]}; i++ )); do
  application_directory=${application_directories[i]}
  for (( j=0; j < ${#required_application_files[@]}; j++ )); do
    application_file="${application_directory}/${required_application_files[j]}"
    if [[ ! -f "${application_file}" ]]; then fail "${application_file} is not a regular file"; fi
    if [[ ! -r "${application_file}" ]]; then fail "${application_file} is not readable"; fi

    # read dependencies and install those first
    # call validate - if exit code is 0, don't install
    # if exit code != 0, install and then validate
    installation_path=$(cat "${application_directory}/installation_path")

    $(bash "${application_directory}/validate.sh" "${installation_path}")
    if [[ $? -ne 0 ]]
    then
      . "${application_directory}/install.sh" || fail "Failed on line ${LINENO}"
      . "${application_directory}/validate.sh" "${installation_path}" || fail "Failed on line ${LINENO}"
    fi
  done
done
