#!/bin/env bash

. "$(dirname ${BASH_SOURCE})/../utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/utilities/verify_application_existence.sh"


main() {
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
