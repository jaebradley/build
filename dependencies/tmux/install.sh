#!/bin/bash

. "$(dirname "${BASH_SOURCE}")/../../utilities/fail.sh"

install() {
  if [[ "3" != "$#" ]]; then fail "Expected three arguments: a source binary URL, a target destination, and the dependency path"; fi
  local -r source_url="${1}"
  local -r target_path="${2}"

  hashed_source_url=$(md5 -s "${source_url}")
  if [[ "0" != "$?" ]]; then fail "Could not hash source URL ${source_url} on line ${LINENO}"; fi

  local -r working_directory="/tmp/${hashed_source_url}"
  mkdir -p "${working_directory}" || fail "Error on line ${LINENO}"
  pushd "${working_directory}" || fail "Error on line ${LINENO}"

  curl -OL "${source_url}" || fail "Error on line ${LINENO}"
  tar xzf "tmux-3.5a.tar.gz" || fail "Error on line ${LINENO}"
  cd "./tmux-3.5a.tar.gz" || fail "Error on line ${LINENO}"

  LDFLAGS="-L/usr/local/lib" CPPFLAGS="-I/usr/local/include" LIBS="-lresolv" ./configure --prefix="${target_path}" || fail "Error on line ${LINENO}"
  make || fail "Error on line ${LINENO}"
  make install || fail "Error on line ${LINENO}"

  popd "${working_directory}" || fail "Error on line ${LINENO}"
}

install "$@"