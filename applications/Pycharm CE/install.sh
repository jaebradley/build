#!/bin/bash

. "$(dirname ${BASH_SOURCE})/../../utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/../../utilities/applications/install_application_from_disk_image.sh"

name="Pycharm CE.app"
install_application_from_disk_image "https://download.jetbrains.com/python/pycharm-community-2021.3-aarch64.dmg?_gl=1*15mf13t*_ga*MTM3MDUzODQ0NS4xNjM5NjAwOTMy*_ga_V0XZL7QHEB*MTYzOTYwMDkzMi4xLjEuMTYzOTYwMDkzNi41Ng..&_ga=2.139141491.1583443186.1639600933-1370538445.1639600932" "${name}"  || fail "Failed to install ${name}"
