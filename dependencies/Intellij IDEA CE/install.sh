#!/bin/sh

directory_path="$(dirname "${bash_source}")"
if [[ "0" != "$?" ]]; then echo "could not calculate directory path for ${bash_source}" && exit 255; fi

. "${directory_path}/../../utilities/fail.sh"
if [[ "0" != "$?" ]]; then echo "could not import utility on ${lineno}" && exit 255; fi

. "${directory_path}/../../utilities/applications/install_application_from_disk_image.sh"
if [[ "0" != "$?" ]]; then fail "could not import utility on ${lineno}"; fi

install() {
  if [[ "3" != "$#" ]]; then fail "Expected three arguments: a source binary URL, a target destination, and the dependency path"; fi

  local -r source="$1"
  local -r name="Intellij IDEA CE.app"

  install_application_from_disk_image "${source}" "${name}" 
  if [[ "0" != "$?" ]]; then fail "Failed to install ${name}"; fi
}

install "$@"
