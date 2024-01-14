#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../../../utilities/fail.sh"

location_path="$HOME/.bashrc"

if [[ ! -e "${location_path}" ]]; then fail ""${location_path}" does not exist"; fi
if [[ ! -r "${location_path}" ]]; then fail ""${location_path}" is not readable"; fi
if [[ ! -w "${location_path}" ]]; then fail ""${location_path}" is not writable"; fi
if [[ ! -x "${location_path}" ]]; then fail ""${location_path}" is not executable"; fi

