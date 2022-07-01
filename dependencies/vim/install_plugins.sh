#!/bin/bash

. "$(dirname ${BASH_SOURCE})/../../utilities/fail.sh"

function install_plugin() {
  which -s git || fail "git is not installed"
  if [[ -d "$2" ]]
  then
    echo "Plugin from repository $1 is already installed in directory named $2"
  else
    git clone "$1" "$2" || fail "Unable to clone from repository with url: $1"
  fi
}


function add_plugins() {
  local plugins_directory="$HOME/.vim/pack/plugins/start/"

  mkdir -p "${plugins_directory}"  || fail "Unable to create plugins directory"
  pushd "${plugins_directory}" > /dev/null || fail "Failed on line: ${LINENO}"
  install_plugin "https://github.com/preservim/nerdtree" "nerdtree"
  popd > /dev/null || fail "Failed on line: ${LINENO}"
}

