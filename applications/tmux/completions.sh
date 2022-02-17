#!/bin/bash/

function installCompletions() {
  local targetDirectory="${HOME}/.completions/bash"
  local filePath="${targetDirectory}/tmux.bash"

  if [[ -f "${filePath}" ]]; then echo "File at ${filePath} already exists" && exit 0; fi

  mkdir -p "${targetDirectory}"
  if [[ $? -ne 0 ]]; then echo "Error on line ${LINENO}" && exit 255; fi

  curl -L "https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux" --output "${filePath}"
  if [[ $? -ne 0 ]]; then echo "Error on line ${LINENO}" && exit 255; fi

  chmod 755 "${filePath}"
  if [[ $? -ne 0 ]]; then echo "Error on line ${LINENO}" && exit 255; fi
}

installCompletions
