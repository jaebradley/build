#!/bin/bash

. "$(dirname ${BASH_SOURCE})/../../utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/../../utilities/applications/install_application_from_disk_image.sh"

name="Rectangle.app"
install_application_from_disk_image "https://github.com/rxhanson/Rectangle/releases/download/v0.49/Rectangle0.49.dmg" "${name}"  || fail "Failed to install ${name}"

