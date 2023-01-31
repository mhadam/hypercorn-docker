#! usr/bin/env bash

set -e

tag="mhadam/hypercorn:$NAME"

bash scripts/docker-build.sh
bash scripts/docker-login.sh

docker push "$tag"
