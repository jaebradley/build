#!/bin/bash

. "$(dirname ${BASH_SOURCE})/utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/utilities/applications/install_application_from_disk_image.sh"

disk_image_urls=(
  "https://github.com/rxhanson/Rectangle/releases/download/v0.49/Rectangle0.49.dmg"
  "https://download.scdn.co/Spotify-10.10.dmg"
)

application_names=(
  "Rectangle.app"
  "Spotify.app"
)

if [[ ${#disk_image_urls[@]} -ne ${#application_names[@]} ]]; then fail "Error on line ${LINENO}"; fi

for (( i=0; i < ${#disk_image_urls[@]}; i++ )); do
  disk_image_url=${disk_image_urls[i]}
  application_name=${application_names[i]}
  echo "Disk image url is ${disk_image_url} for ${application_name}"
  install_application_from_disk_image "${disk_image_url}" "${application_name}"
  if [[ $? -ne 0 ]]; then fail "Failed to install ${application_name}"; fi
done
