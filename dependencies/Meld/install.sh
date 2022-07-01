#!/bin/bash

. "$(dirname ${BASH_SOURCE})/../../utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/../../utilities/applications/install_application_from_disk_image.sh"

name="Meld.app"
install_application_from_disk_image "https://github.com/yousseb/meld/releases/download/osx-18/meldmerge.dmg" "${name}"  || fail "Failed to install ${name}"

