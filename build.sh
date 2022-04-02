#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/utilities/fail.sh"
. "$(dirname "${BASH_SOURCE}")/utilities/applications/install_application_from_disk_image.sh"
. "$(dirname "${BASH_SOURCE}")/applications/vim/install.sh"

function configure_file() {
      configuration_file_directory="$1"
      content_path="${configuration_file_directory}/content"
      location_file_path="${configuration_file_directory}/location"
      validation_path="${configuration_file_directory}/validate.sh"
      configuration_path="${configuration_file_directory}/configure.sh"
      $(bash "${validation_path}" "${content_path}" "${Location_file_path}")
      if [[ $? -ne 0 ]]
      then
        . "${configuration_path}" "${content_path}" "${location_file_path}" || fail "Failed on line ${LINENO}"
        . "${validation_path}" "${content_path}" "${location_file_path}" || fail "Failed on line ${LINENO}"
        # TODO: process dependencies
      fi
}

application_directory="$(dirname "${BASH_SOURCE}")"

application_directories=(
  "$(dirname "${BASH_SOURCE}")/applications/Rectangle"
  "$(dirname "${BASH_SOURCE}")/applications/Spotify"
  "$(dirname "${BASH_SOURCE}")/applications/Intellij IDEA CE"
  "$(dirname "${BASH_SOURCE}")/applications/Pycharm CE"
  "$(dirname "${BASH_SOURCE}")/applications/Firefox"
  "$(dirname "${BASH_SOURCE}")/applications/Meld"
  "$(dirname "${BASH_SOURCE}")/applications/bash"
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


for (( i=0; i < ${#application_directories[@]}; i++ )); do
  application_directory=${application_directories[i]}
  configuration_directory="${application_directory}/configuration"
  if [[ -d "${configuration_directory}" ]];
  then
    while read -d '' filename; do
      configure_file "${filename}" < /dev/null
    done < <(find "${configuration_directory}" -maxdepth 1 -mindepth 1 -type d -print0)
  fi
done
