#!/bin/bash

. "$(dirname ${BASH_SOURCE})/,,/../utilities/fail.sh"

function install_tldr() {
  command -v "npm" || fail "npm is not installed"
  npm -g install tldr || fail "Error on line ${LINENO}"
}
