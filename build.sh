#!/bin/bash

. "$(dirname ${BASH_SOURCE})/utilities/applications/install_application_from_disk_image.sh"

install_application_from_disk_image "https://github.com/rxhanson/Rectangle/releases/download/v0.49/Rectangle0.49.dmg" "Rectangle.app"
if [[ $? -ne 0 ]]; then fail "Failed to install Rectangle.app"; fi

install_application_from_disk_image "https://download.scdn.co/Spotify-10.10.dmg" "Spotify.app"
if [[ $? -ne 0 ]]; then fail "Failed to install Spotify.app"; fi
