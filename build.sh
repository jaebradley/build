#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/utilities/fail.sh"

main() {
  if [[ "$#" != "1" ]]; then fail "Expected exactly one argument - the directory to install dependencies in"; fi

  local installation_directory_path="$1"

  echo "Installation directory path is ${installation_directory_path}"
  ls -la ${installation_directory_path}

  which git || fail "git is not installed"

  git clone https://github.com/jaebradley/bash-dependency-manager.git

  . bash-dependency-manager/install.sh "${installation_directory_path}" || fail "Unable to install dependencies"
}

main "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
