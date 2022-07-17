#!/bin/sh

directory_path="$(dirname "${BASH_SOURCE}")"
if [[ "0" != "$?" ]]; then echo "could not calculate directory path for ${BASH_SOURCE}" && exit 255; fi

. "${directory_path}/../../utilities/fail.sh"
if [[ "0" != "$?" ]]; then echo "could not import utility on ${LINENO}" && exit 255; fi

install() {
  if [[ "3" != "$#" ]]; then fail "Expected three arguments: a source binary URL, a target destination, and the dependency path"; fi

  local -r source="$1"
  local -r jdk_path="/Library/Java/JavaVirtualMachines/jdk-18.0.1.1.jdk"
  if [[ -d "${jdk_path}" ]]; then fail "${jdk_path} is already installed"; fi

  local hashed_disk_image_url
  hashed_disk_image_url=$(md5 -q -s "${source}")
  if [[ "0" != "$?" ]]; then fail "Error on line ${LINENO}"; fi

  local -r temporary_directory="/tmp/${hashed_disk_image_url}"
  mkdir -p "${temporary_directory}" || fail "Error on line ${LINENO}"
  local -r image_path="${temporary_directory}/_"
  curl -L "${disk_image_url}" --output "${image_path}" || fail "Error on line ${LINENO}"

  hdiutil verify "${image_path}" || fail "${application_name} image failed verification"

  local mount_directory_path
  hash_of_hashed_disk_image_url=$(md5 -q -s "${hashed_disk_image_url}")  mount_directory_path="/tmp/${hash_of_hashed_disk_image_url}"
  if [[ "0" != "$?" ]]; then fail "Error on line ${LINENO}"; fi

  mkdir -p "${mount_directory_path}" || fail "Error on line ${LINENO}"
  hdiutil attach "${image_path}" -mountpoint "${mount_directory_path}" -readonly -nokernel -verify -noignorebadchecksums -noautoopen || fail "Failed to attach ${source} image"

  ls -la "${mount_directory_path}"

  local expected_application_path="${mount_directory_path}/jdk-18.0.1.1.jdk"
  if [[ ! -d "${expected_application_path}" ]]; then fail "Expected application ${expected_application_path} is not a directory"; fi
  if [[ ! -x "${expected_application_path}" ]]; then fail "Expected application ${expected_application_path} is not executable"; fi

  cp -R "${expected_application_path}" "/Library/Java/JavaVirtualMachines/jdk-18.0.1.1.jdk" || fail "Error on line ${LINENO}"
  chmod 711 "${application_path}" || fail "Error on line ${LINENO}"

  hdiutil detach "/private${mount_directory_path}" || fail "Error on line ${LINENO}"

  rm -rf "${temporary_directory}" || fail "Error on line ${LINENO}"
  rm -rf "${mount_directory_path}" || fail "Error on line ${LINENO}"
}

install "$@"

