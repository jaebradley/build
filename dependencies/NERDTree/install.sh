#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../utilities/fail.sh"

function main() {
  if [[ "3" != "$#" ]]; then fail "Expected three arguments: a source binary URL, a target destination, and the dependency path"; fi
  local -r source="$1"
  local -r target="$2"

  git --version
  if [[ $? -ne 0 ]]; then fail "Error on line ${LINENO}"; fi

  git clone ${source} "${target}"
  if [[ $? -ne 0 ]]; then fail "Error on line ${LINENO}"; fi
}

main "$@"
