#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/utilities/fail.sh"

function main() {
  if [[ "$#" != "1" ]]; then fail "Expected exactly one argument - the directory to install dependencies in"; fi

  local -r installation_directory_path="$1"

  command -v "git" || fail "git is not installed"

  # TODO: add check to see if the bash-dependency-manager already exists
  git clone https://github.com/jaebradley/bash-dependency-manager.git || fail "Could not clone bash dependency manager"

  . bash-dependency-manager/install.sh "${installation_directory_path}"
  if [[ "0" != "$?" ]]; then fail "Unable to install dependencies"; fi
}

main $(pwd)
