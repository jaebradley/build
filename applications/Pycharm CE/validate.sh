#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../utilities/fail.sh"

if [[ "$#" -ne 1 ]]; then fail "Expected exactly one argument, the installation path"; fi

installation_path="$1"
if [[ ! -d "${installation_path}" ]]; then fail "${installation_path} is not a directory"; fi
if [[ ! -x "${installation_path}" ]]; then fail "${installation_path} is not executable"; fi
