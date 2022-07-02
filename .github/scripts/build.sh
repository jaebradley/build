#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../utilities/fail.sh"

chmod +x "$HOME/.bashrc"
rm -f "$HOME/.bashrc" || fail "Could not delete bashrc file"

. "$(dirname "${BASH_SOURCE}")/../../build.sh" "$(dirname "${BASH_SOURCE}")/../../"

