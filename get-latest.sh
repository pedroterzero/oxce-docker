#!/bin/bash

BASE=https://openxcom.org/oxce/release
VERSION=$(wget -qO - "${BASE}/?C=M;O=D" | grep -- '-bionic-x86_64.7z' | head -n1  | sed 's/.*<a href="//' | cut -d'"' -f1)

if [ "$VERSION" = "" ]; then
    echo "Error: could not get latest version"
    exit 1
fi

# already exists?
if [ -f "$VERSION" ]; then
    echo "${VERSION} already exists"
else
  wget -qO "$VERSION" "${BASE}/${VERSION}"
fi

rm -rf oxce
mkdir oxce
7z x "$VERSION" -ooxce
