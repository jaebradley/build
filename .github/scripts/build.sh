#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../utilities/fail.sh"

chmod +x "$HOME/.bashrc" || fail "Could not make bashrc file executable"
rm -f "$HOME/.bashrc" || fail "Could not delete bashrc file"

script_path="$(dirname "${BASH_SOURCE}")/../../build.sh"
dependencies_directory_path="$(dirname "${BASH_SOURCE}")/../../"

. "${script_path}" "${dependencies_directory_path}"  || fail "Unable to execute build script: ${script_path} on dependencies directory: ${dependencies_directory_path}"
if [[ "0" != "$?" ]]; then fail "Unable to execute build script: ${script_path} on dependencies directory: ${dependencies_directory_path}"; fi

