#!/bin/bash

directory_path="$(dirname "${BASH_SOURCE}")"
if [[ "0" != "$?" ]]; then echo "Could not calculate directory path for ${BASH_SOURCE}" && exit 255; fi

. "${directory_path}/../../utilities/fail.sh"
if [[ "0" != "$?" ]]; then echo "Could not import utility on ${LINENO}" && exit 255; fi

main() {
  # Github workflows already have a .bashrc file
  local -r bashrc_path="$HOME/.bashrc"

  chmod +x "${bashrc_path}" || fail "Could not make bashrc file executable"
  rm -f "${bashrc_path}" || fail "Could not delete bashrc file"

  local -r script_path="${directory_path}/../../build.sh"
  local -r dependencies_directory_path="${directory_path}/../../"

  . "${script_path}" "${dependencies_directory_path}"
  if [[ "0" != "$?" ]]; then fail "Unable to execute build script: ${script_path} on dependencies directory: ${dependencies_directory_path}"; fi
}

main

