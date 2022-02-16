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

docker pull ubuntu:18.04
docker-compose build
docker tag pedroterzero/oxce:latest pedroterzero/oxce:"$VERSION"