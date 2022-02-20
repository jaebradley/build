
#!/bin/bash

. "$(dirname ${BASH_SOURCE})/../../utilities/fail.sh"
. "$(dirname ${BASH_SOURCE})/../../utilities/applications/install_application_from_disk_image.sh"

name="Intellij IDEA CE.app"
install_application_from_disk_image "https://download.jetbrains.com/idea/ideaIC-2021.2.3-aarch64.dmg?_gl=1*1oiw9gx*_ga*MTE1Mjg2MDU0OS4xNjM3MTIwNzM5*_ga_V0XZL7QHEB*MTYzNzEyMDc2Mi4xLjEuMTYzNzEyMDk0MS4w&_ga=2.235293319.74824018.1637120739-1152860549.1637120739" "${name}"  || fail "Failed to install ${name}"
