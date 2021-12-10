#!/bin/bash

ls -la /Applications/

if [[ ! -d "/Applications/Spotify.app" ]]; then echo "Spotify application does not exist" && exit 255; fi
if [[ ! -x "/Applications/Spotify.app" ]]; then echo "Spotify application is not executable" && exit 255; fi
