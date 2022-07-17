#!/bin/bash

directory_path="$(dirname "${BASH_SOURCE}")"
if [[ "0" != "$?" ]]; then echo "Could not calculate directory path for ${BASH_SOURCE}" && exit 255; fi

. "${directory_path}/../../utilities/fail.sh"
if [[ "0" != "$?" ]]; then echo "Could not import utility on ${LINENO}" && exit 255; fi

. "${directory_path}/../../utilities/applications/install_application_from_disk_image.sh"
if [[ "0" != "$?" ]]; then fail "Could not import utility on ${LINENO}"; fi

install() {
  if [[ "3" != "$#" ]]; then fail "Expected three arguments: a source binary URL, a target destination, and the dependency path"; fi

  local -r source="$1"
  local -r name="Spotify.app"

  install_application_from_disk_image "${source}" "${name}" 
  if [[ "0" != "$?" ]]; then fail "Failed to install ${name}"; fi
}

install "$@"
