#!/bin/env bash

. "$(dirname ${BASH_SOURCE})/../utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/utilities/verify_application_existence.sh"


main() {
  for application_name in "Spotify.app" "Rectangle.app" "Intellij IDEA CE.app" "Pycharm CE.app" "Firefox.app" "Meld.app"
  do
    verify_application_existence "${application_name}"
  done

  export PATH=$PATH:/usr/local/go/bin
  local go_existence_check_output
  go_existence_check_output="$(type -p "go")"
  if [[ "0" != "$?" ]]; then fail "Error on line ${LINENO}"; fi

  export PATH=$PATH:~/.cargo/bin
  local rust_existence_check_output
  rust_existence_check_output="$(type -p "rustc")"
  if [[ "0" != "$?" ]]; then fail "Error on line ${LINENO}"; fi

  local -r nerdtree_plugin_location="~/.vim/pack/vendor/start/nerdtree"
  if [[ ! -e "${nerdtree_plugin_location}" ]]; then fail "${nerdtree_plugin_location} does not exist"; fi
  if [[ ! -r "${nerdtree_plugin_location}" ]]; then fail "${nerdtree_plugin_location} is not readable"; fi
  if [[ ! -w "${nerdtree_plugin_location}" ]]; then fail "${nerdtree_plugin_location} is not writable"; fi

  local -r jq_file_path="/usr/local/bin/jq"
  if [[ ! -e "${jq_file_path}" ]]; then fail "${jq_file_path} does not exist"; fi
  if [[ ! -x "${jq_file_path}" ]]; then fail "${jq_file_path} is not executable"; fi

  command -v "jq"
  if [[ "0" != "$?" ]]; then fail "Error on line ${LINENO}"; fi
}

main
