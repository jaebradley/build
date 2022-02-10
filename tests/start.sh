#!/bin/bash

. "$(dirname ${BASH_SOURCE})/../utilities/fail.sh"

ls -la /Applications/

function verify_application_existence() {
  if [[ $# -ne 1 ]]; then fail "Expected one argument, the name of the application"; fi

  local application_name="$1"

  if [[ ! -d "/Applications/${application_name}" ]]; then fail "${application_name} does not exist"; fi
  if [[ ! -x "/Applications/${application_name}" ]]; then fail "${application_name} is not executable"; fi

}

for application_name in "Spotify.app" "Rectangle.app" "Intellij IDEA CE.app" "Pycharm CE.app" "Firefox.app" "Meld.app"
do
  verify_application_existence "${application_name}"
done
