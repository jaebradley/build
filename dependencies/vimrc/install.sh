#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../utilities/fail.sh"

function main() {
  if [[ "3" != "$#" ]]; then fail "Expected three arguments: a source binary URL, a target destination, and the dependency path"; fi
}

main "$@"
