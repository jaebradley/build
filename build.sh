#!/bin/bash

. "$(dirname ${BASH_SOURCE})/utilities/fail.sh"

main() {
  if [[ "$#" != "1" ]]; then fail "Expected exactly one argument - the directory to install dependencies in"; fi

  local -r installation_directory_path="$1"

  which git || fail "git is not installed"

  git clone https://github.com/jaebradley/bash-dependency-manager.git || fail "Could not clone directory"

  . bash-dependency-manager/install.sh "${installation_directory_path}"
  if [[ "0" != "$?" ]]; then fail "Unable to install dependencies"; fi
}

main $(pwd)
