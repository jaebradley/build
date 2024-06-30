#!/bin/bash/

. "$(dirname "${BASH_SOURCE}")/../../../../utilities/fail.sh"

function main() {
  local targetDirectory="${HOME}/.completions/bash"
  local filePath="${targetDirectory}/git"

  if [[ -f "${filePath}" ]]; then fail "File at ${filePath} already exists" && exit 0; fi

  mkdir -p "${targetDirectory}"
  if [[ $? -ne 0 ]]; then fail "Error on line ${LINENO}"; fi

  local gitVersionInformation=$(git --version)
  if [[ $? -ne 0 ]]; then fail "Error on line ${LINENO}"; fi

  local version=$(awk '{ print $3 }' <<< "${gitVersionInformation}")
  if [[ $? -ne 0 ]]; then fail "Error on line ${LINENO}"; fi

  curl -L "https://raw.githubusercontent.com/git/git/v${version}/contrib/completion/git-completion.bash" --output "${filePath}"
  if [[ $? -ne 0 ]]; then fail "Error on line ${LINENO}"; fi

  chmod 755 "${filePath}"
  if [[ $? -ne 0 ]]; then fail "Error on line ${LINENO}"; fi
}

main
