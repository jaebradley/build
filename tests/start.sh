#!/bin/env bash

. "$(dirname ${BASH_SOURCE})/../utilities/fail.sh"

function verify_application_existence() {
  if [[ $# -ne 1 ]]; then fail "Expected one argument, the name of the application"; fi

  local application_name="$1"

  if [[ ! -d "/Applications/${application_name}" ]]; then fail "${application_name} does not exist"; fi
  if [[ ! -x "/Applications/${application_name}" ]]; then fail "${application_name} is not executable"; fi
}

main() {
  ls -la /Applications/ || fail "Error on ${LINENO}"

  for application_name in "Spotify.app" "Rectangle.app" "Intellij IDEA CE.app" "Pycharm CE.app" "Firefox.app" "Meld.app"
  do
    verify_application_existence "${application_name}"
  done

  local go_existence_check_output
  go_existence_check_output="$(type -p "go")"

  local rust_existence_check_output
  rust_existence_check_output="$(type -p "rustc")"

  if [[ "0" != "$?" ]]; then fail "Error on ${LINENO}"; fi
  if [[ "go is /usr/local/go/bin " != "${go_existence_check_output}" ]]; then fail "Error on ${LINENO}"; fi
}
