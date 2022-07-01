#!/bin/bash

. "$(dirname ${BASH_SOURCE})/../../utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/../../utilities/applications/install_application_from_disk_image.sh"

name="Spotify.app"
install_application_from_disk_image "https://download.scdn.co/Spotify-10.10.dmg" "${name}"  || fail "Failed to install ${name}"
