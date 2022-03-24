#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../../../utilities/fail.sh"

content_path="$1"
location_file_path="$2"

location_path="$(cat "${location_file_path}")"
if [[ ! -e "${location_path}" ]]; then fail ""${location_path}" does not exist"; fi
if [[ ! -r "${location_path}" ]]; then fail ""${location_path}" is not readable"; fi
if [[ ! -w "${location_path}" ]]; then fail ""${location_path}" is not writable"; fi
if [[ ! -x "${location_path}" ]]; then fail ""${location_path}" is not executable"; fi

