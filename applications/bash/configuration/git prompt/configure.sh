#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../../../utilities/fail.sh"

location_file_path="$2"
echo "location file path is ${location_file_path}"

location_path=$(cat "${location_file_path}")
directory_path="$(dirname "${location_path}")"
file_name="$(basename "${location_path}")"

mkdir -p "${directory_path}" || fail "Failed to create directory ${directory_path}"

version_info="$(git version)"
version="$(awk '{ print $3 }' <<< ${version_info})"
prompt_url="https://raw.githubusercontent.com/git/git/v${version}/contrib/completion/git-prompt.sh"

curl -f -o "${location_path}" "${prompt_url}" || fail "Failed to output git prompt to ${location_path}"
chmod 755 "${location_path}" || fail "Unable to set permissions for "${location_path}""
echo "${location_path}"
