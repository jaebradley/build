#!/bin/bash

function install_nvm() {
  # https://apple.stackexchange.com/a/13019/449731
  touch "$HOME/.bash_profile"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  source "$HOME/.bash_profile"
}
