#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/utilities/fail.sh"

main() {
  if [[ "$#" != "1" ]]; then fail "Expected exactly one argument - the directory to install dependencies in"; fi

  local installation_directory_path="$1"

  which git || fail "git is not installed"

  git checkout https://github.com/jaebradley/bash-dependency-manager.git

  bash bash-dependency-manager/install.sh "${installation_directory_path}"
}

main "$1"
