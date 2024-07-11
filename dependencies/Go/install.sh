#!/bin/env bash

directory_path="$(dirname "${BASH_SOURCE}")"
if [[ "0" != "$?" ]]; then echo "could not calculate directory path for ${BASH_SOURCE}" && exit 255; fi

. "${directory_path}/../../utilities/fail.sh"
if [[ "0" != "$?" ]]; then echo "could not import utility on ${LINENO}" && exit 255; fi

install() {
  if [[ "3" != "$#" ]]; then fail "Expected three arguments: a source binary URL, a target destination, and the dependency path"; fi

  local -r source="$1"
  local -r target="$2"

  local hashed_disk_image_url
  hashed_disk_image_url=$(md5 -q -s "${source}")
  if [[ "0" != "$?" ]]; then fail "Error on line ${LINENO}"; fi

  local -r temporary_directory="/tmp/${hashed_disk_image_url}"
  mkdir -p "${temporary_directory}" || fail "Error on line ${LINENO}"
  chmod -R 777 "${temporary_directory}" || fail "Error on line ${LINENO}"

  local -r pkg_path="${temporary_directory}/${hashed_disk_image_url}.pkg"
  curl -L "${source}" --output "${pkg_path}" || fail "Error on line ${LINENO}"

  ls -la "${temporary_directory}" || fail "Error on line ${LINENO}"
  sudo installer -package "${pkg_path}" -target "${target}" || fail "Error on line ${LINENO}"

  rm -rf "${temporary_directory}" || fail "Error on line ${LINENO}"
}

install "$@"
