#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../../../utilities/fail.sh"

content_path="$1"
location_path="$HOME/.bashrc"

directory_path="$(dirname "${location_path}")"
file_name="$(basename "${location_path}")"

mkdir -p "${directory_path}" || fail "Failed to create directory ${directory_path}"
cp -n "${content_path}" "${location_path}" || fail "Failed to copy content from ${content_path} to ${location_path}"
chmod 755 "${location_path}" || fail "Unable to set permissions for "${location_path}""
