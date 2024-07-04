#!/bin/env bash

. "$(dirname ${BASH_SOURCE})/../utilities/fail.sh"

function verify_application_existence() {
  if [[ $# -ne 1 ]]; then fail "Expected one argument, the name of the application"; fi

  local application_name="$1"

  if [[ ! -d "/Applications" ]]; then fail "Applications directory does not exist"; fi
  if [[ ! -d "/Applications/${application_name}" ]]; then fail "${application_name} does not exist"; fi
  if [[ ! -x "/Applications/${application_name}" ]]; then fail "${application_name} is not executable"; fi
}
