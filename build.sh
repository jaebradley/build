#!/bin/bash

. "$(dirname ${BASH_SOURCE})/utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/utilities/applications/install_application_from_disk_image.sh"

declare -A disk_image_urls_by_application_name=(
  ["Rectangle.app"]="https://github.com/rxhanson/Rectangle/releases/download/v0.49/Rectangle0.49.dmg"
  ["Spotify.app"]="https://download.scdn.co/Spotify-10.10.dmg"
)

for application_name in "${!disk_image_urls_by_application_name[@]}"
do
  disk_image_url="${disk_image_urls_by_application_name[$application_name]}"
  echo "Disk image url is ${disk_image_url} for ${application_name}"
  install_application_from_disk_image "${disk_image_url}" "${application_name}"
done


  if [[ $? -ne 0 ]]; then fail "Failed to install Rectangle.app"; fi

install_application_from_disk_image  if [[ $? -ne 0 ]]; then fail "Failed to install Spotify.app"; fi
