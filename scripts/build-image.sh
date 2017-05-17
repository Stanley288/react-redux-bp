#!/bin/sh

set -eo pipefail

echo "--- Building app"
yarn install
yarn run build

echo "--- Building docker image"
docker build \
  --pull \
  --tag cityofsurrey/mysurrey-app \
  .
