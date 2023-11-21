#!/bin/bash

LATEST=$(ls -t | grep ^Extended)
if [ "$LATEST" = "" ]; then
    echo "Error: could not get latest file"
    exit 1
fi

VERSION=$(echo "$LATEST" | cut -d'-' -f2)
if [ "$VERSION" = "" ]; then
    echo "Error: could not get latest version number"
    exit 1
fi

echo "$VERSION" >> VERSION

docker build -t linuxdeploy appimage
docker run \
 --privileged \
 --rm \
 -v "$PWD:/app/vol":ro \
 -v "$PWD/out:/app/out" \
 -it \
 linuxdeploy \
 bash -c "vol/build-appimage-in-container.sh"
