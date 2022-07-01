#!/bin/bash

. "$(dirname ${BASH_SOURCE})/../../utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/../../utilities/applications/install_application_from_disk_image.sh"

name="Firefox.app"
install_application_from_disk_image "https://download-installer.cdn.mozilla.net/pub/firefox/releases/96.0/mac/en-US/Firefox%2096.0.dmg" "${name}"  || fail "Failed to install ${name}"

