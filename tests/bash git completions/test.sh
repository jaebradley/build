#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../utilities/fail.sh"

function main() {
  location_path="$HOME/.bash/git-prompt.sh"

  if [[ ! -e "${location_path}" ]]; then fail ""${location_path}" does not exist"; fi
  if [[ ! -r "${location_path}" ]]; then fail ""${location_path}" is not readable"; fi
  if [[ ! -w "${location_path}" ]]; then fail ""${location_path}" is not writable"; fi
  if [[ ! -x "${location_path}" ]]; then fail ""${location_path}" is not executable"; fi
}

main
