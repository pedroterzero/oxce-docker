#!/bin/bash

if [ ! -f VERSION ]; then
    echo "Error: VERSION file not found"
    exit 1
fi

VERSION=$(cat VERSION)
if [ "$VERSION" = "" ]; then
    echo "Error: could not get latest version"
    exit 1
fi

BASE=https://openxcom.org/oxce/release
LATEST_FULL=$(wget -qO - "${BASE}/?C=M;O=D" | grep -- '-bionic-x86_64.7z' | head -n1 | sed 's/.*<a href="//' | cut -d'"' -f1)

if [ "$LATEST_FULL" = "" ]; then
    echo "Error: could not get latest version"
    exit 1
fi

LATEST=$(echo "$LATEST_FULL" | cut -d'-' -f2)

if [ "$LATEST" = "$VERSION" ]; then
    echo "Latest version is $LATEST, VERSION file says $VERSION, no update"
else
    echo "Latest version is $LATEST, VERSION file says $VERSION, update available"
    echo '::set-output name=DO_UPDATE::1'
fi

