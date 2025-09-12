#!/bin/bash

directory_path="$(dirname "${BASH_SOURCE}")"
if [[ "0" != "$?" ]]; then echo "could not calculate directory path for ${BASH_SOURCE}" && exit 255; fi

. "${directory_path}/../../utilities/fail.sh"
if [[ "0" != "$?" ]]; then echo "could not import utility on ${LINENO}" && exit 255; fi

install() {
  if [[ "3" != "$#" ]]; then fail "Expected three arguments: a source binary URL, a target destination, and the dependency path"; fi

  local -r source="$1"
  local -r target_file_path="$2"

  curl -L "${source}" --output "${target_file_path}" || fail "Error on line ${LINENO}"
  chmod 111 "${target_file_path}" || fail "Error on line ${LINENO}"
}

install "$@"