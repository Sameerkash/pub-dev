#!/usr/bin/env bash

set -e

if [[ -z "$1" ]];
then
  echo "Target directory argument is missing."
  exit 1
fi

if [[ -z "$2" ]];
then
  echo "Flutter version argument is missing."
  exit 1
fi

mkdir -p "$1"
cd "$1"
git clone -b "$2" --single-branch https://github.com/flutter/flutter.git flutter

# Removing the .git folder turns off Flutter auto-upgrade checks (and ever-increasing git directory).
rm -rf ./flutter/.git

# Downloads the Dart SDK and disables analytics tracking – which we always want.
# This will add 400 MB.
./flutter/bin/flutter config --no-analytics
