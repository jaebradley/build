#!/bin/bash

. "$(dirname ${BASH_SOURCE})/../../fail.sh"

function create_temporary_directory() {
  local id
  id=$(uuidgen) || fail "Error on ${LINENO}"

  local path="/tmp/${id}"
  mkdir -p "${path}" || fail "Error on ${LINENO}"
  (echo "${path}" && exit 0) || fail "Error on ${LINENO}"
}
