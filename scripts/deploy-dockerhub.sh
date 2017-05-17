#!/bin/bash

set -eo pipefail

source ./scripts/utils.sh

VERSION=$(package_version)

echo "--- Building docker image"
docker build \
  --pull \
  --tag cityofsurrey/mysurrey-app:${VERSION} \
  .

echo "--- Tagging docker image with version ${VERSION}"
docker tag \
  cityofsurrey/mysurrey-app:${VERSION} \
  cityofsurrey/mysurrey-app

echo "--- Pushing docker image to Dockerhub"
docker push cityofsurrey/mysurrey-app
