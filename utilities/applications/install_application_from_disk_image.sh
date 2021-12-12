#!/bin/bash

. "$(dirname ${BASH_SOURCE})/../fail.sh"

function install_application_from_disk_image() {
  if [[ $# -ne 2 ]]; then fail "Expected two arguments, the disk image URL and the name of the application"; fi
  local application_name="$2"

  local application_path="/Applications/${application_name}"
  if [[ -d "${application_path}" ]]; then echo "${application_name} is already installed" && return 0; fi

  local temporary_directory

  local disk_image_url="$1"
  local hashed_disk_image_url
  hashed_disk_image_url=$(md5 -q -s "${disk_image_url}") || fail "Error on line ${LINENO}"
  local temporary_directory="/tmp/${hashed_disk_image_url}"
  mkdir -p "${temporary_directory}" || fail "Error on line ${LINENO}"
  local image_path="${temporary_directory}/_"
  curl -L "${disk_image_url}" --output "${image_path}" || fail "Error on line ${LINENO}"

  hdiutil verify "${image_path}" || fail "${application_name} image failed verification"

  local mount_directory_path
  hash_of_hashed_disk_image_url=$(md5 -q -s "${hashed_disk_image_url}") || fail "Error on line ${LINENO}"
  mount_directory_path="/tmp/${hash_of_hashed_disk_image_url}"
  mkdir -p "${mount_directory_path}" || fail "Error on line ${LINENO}"
  hdiutil attach "${image_path}" -mountpoint "${mount_directory_path}" -readonly -nokernel -verify -noignorebadchecksums -noautoopen || fail "Failed to attach ${application_name} image"

  local expected_application_path="${mount_directory_path}/${application_name}"
  if [[ ! -d "${expected_application_path}" ]]; then fail "Expected application ${expected_application_path} is not a directory"; fi
  if [[ ! -x "${expected_application_path}" ]]; then fail "Expected application ${expected_application_path} is not executable"; fi

  cp -R "${expected_application_path}" "/Applications/" || fail "Error on line ${LINENO}"
  chmod 711 "${application_path}" || fail "Error on line ${LINENO}"

  hdiutil detach "/private${mount_directory_path}" || fail "Error on line ${LINENO}"

  rm -rf "${temporary_directory}" || fail "Error on line ${LINENO}"
  rm -rf "${mount_directory_path}" || fail "Error on line ${LINENO}"

  return 0
}
