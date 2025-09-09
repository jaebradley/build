#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../utilities/fail.sh"

function main() {
  if [[ "3" != "$#" ]]; then fail "Expected three arguments: a source binary URL, a target destination, and the dependency path"; fi
  local -r target="$2"
  local -r dependency_path="$3"

  local -r content_file_path="${dependency_path}/content"
  if [[ ! -f "${content_file_path}" ]]; then print "Expected a file at ${content_file_path}" && exit 255; fi
  if [[ ! -r "${content_file_path}" ]]; then print "Expected readable content at ${content_file_path}" && exit 255; fi

  cp -v "${content_file_path}" "${target}"
  if [[ "0" != "$?" ]]; then print "Could not copy file from ${content_file_path} to ${target}" && exit 255; fi
}

main "$@"
