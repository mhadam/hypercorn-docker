#!/usr/bin/env bash

set -e

tag="mhadam/hypercorn:$NAME"
DOCKERFILE="$NAME"

if [ "$NAME" == "latest" ]
then
    DOCKERFILE="python3.11"
fi

if [ "$NAME" == "slim" ]
then
    DOCKERFILE="python3.11-slim"
fi

docker build -t "$tag" --file "./images/${DOCKERFILE}.dockerfile" "./images/"
