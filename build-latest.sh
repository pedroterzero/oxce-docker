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

sed -i "s/image: oxce:[0-9.]*/image: oxce:$VERSION/" docker-compose.yml
docker-compose build
docker tag oxce:"$VERSION" oxce:latest