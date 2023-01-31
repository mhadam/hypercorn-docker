#!/usr/bin/env bash

set -e

tag="mhadam/hypercorn:$NAME"
DOCKERFILE="$NAME"

if [ "$NAME" == "latest" ]
then
    DOCKERFILE="python3.11"
fi

docker build -t "$tag" --file "./images/${DOCKERFILE}.dockerfile" "./images/"
