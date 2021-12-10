#!/bin/bash

ls -la /Applications/

if [[ -d "/Applications/Spotify.app" ]]; then echo "Spotify application does not exist" && exit 255; fi
