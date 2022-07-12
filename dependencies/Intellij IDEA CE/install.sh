#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../utilities/fail.sh"
. "$(dirname "${BASH_SOURCE}")/../../utilities/applications/install_application_from_disk_image.sh"

install() {
  if [[ "3" != "$#" ]]; then fail "Expected three arguments: a source binary URL, a target destination, and the dependency path"; fi

  local -r source="$1"
  local -r name="Intellij IDEA CE.app"

  install_application_from_disk_image "${source}" "${name}" 
  if [[ "0" != "$?" ]]; then fail "Failed to install ${name}"; fi
}

install "$@"
