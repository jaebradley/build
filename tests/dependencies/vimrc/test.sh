#!/bin/bash

. "$(dirname ${BASH_SOURCE})/../utilities/fail.sh"

function main() {

  # TODO: @jaebradley pass this expected location path as a function parameter
  local location_path="$HOME/.vimrc"

  if [[ ! -e "${location_path}" ]]; then fail ""${location_path}" does not exist"; fi
  if [[ ! -r "${location_path}" ]]; then fail ""${location_path}" is not readable"; fi
  if [[ ! -w "${location_path}" ]]; then fail ""${location_path}" is not writable"; fi
  if [[ ! -x "${location_path}" ]]; then fail ""${location_path}" is not executable"; fi

  # TODO: @jaebradley do a content hash check as well
}

main
