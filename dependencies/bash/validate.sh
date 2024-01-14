#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../utilities/fail.sh"

installation_path="$1"

if [[ ! -e "${installation_path}" ]]; then fail ""${installation_path}" does not exist"; fi
if [[ ! -x "${installation_path}" ]]; then fail ""${installation_path}" is not executable"; fi

