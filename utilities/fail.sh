#!/bin/bash

function fail() {
  if [[ "$1" != "" ]]; then echo "$1"; fi
  exit 255
}
