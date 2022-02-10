#!/bin/bash

. "$(dirname ${BASH_SOURCE})/utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/utilities/applications/install_application_from_disk_image.sh"
. "$(dirname ${BASH_SOURCE})/applications/vim/install.sh"

disk_image_urls=(
  "https://github.com/rxhanson/Rectangle/releases/download/v0.49/Rectangle0.49.dmg"
  "https://download.scdn.co/Spotify-10.10.dmg"
  "https://download.jetbrains.com/idea/ideaIC-2021.2.3-aarch64.dmg?_gl=1*1oiw9gx*_ga*MTE1Mjg2MDU0OS4xNjM3MTIwNzM5*_ga_V0XZL7QHEB*MTYzNzEyMDc2Mi4xLjEuMTYzNzEyMDk0MS4w&_ga=2.235293319.74824018.1637120739-1152860549.1637120739"
  "https://download.jetbrains.com/python/pycharm-community-2021.3-aarch64.dmg?_gl=1*15mf13t*_ga*MTM3MDUzODQ0NS4xNjM5NjAwOTMy*_ga_V0XZL7QHEB*MTYzOTYwMDkzMi4xLjEuMTYzOTYwMDkzNi41Ng..&_ga=2.139141491.1583443186.1639600933-1370538445.1639600932"
  "https://download-installer.cdn.mozilla.net/pub/firefox/releases/96.0/mac/en-US/Firefox%2096.0.dmg"
  "https://github.com/yousseb/meld/releases/download/osx-18/meldmerge.dmg"
)

application_names=(
  "Rectangle.app"
  "Spotify.app"
  "Intellij IDEA CE.app"
  "Pycharm CE.app"
  "Firefox.app"
  "Meld.app"
)

if [[ ${#disk_image_urls[@]} -ne ${#application_names[@]} ]]; then fail "Error on line ${LINENO}"; fi

for (( i=0; i < ${#disk_image_urls[@]}; i++ )); do
  disk_image_url=${disk_image_urls[i]}
  application_name=${application_names[i]}
  install_application_from_disk_image "${disk_image_url}" "${application_name}"
  if [[ $? -ne 0 ]]; then fail "Failed to install ${application_name}"; fi
done
