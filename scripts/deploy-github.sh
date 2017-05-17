#!/bin/bash

set -eo pipefail

source ./scripts/utils.sh

VERSION=v$(package_version)
NPM_CONFIG_LOGLEVEL=error

npm install --global conventional-github-releaser

echo "--- Tagging current commit"
git tag --force ${VERSION}
git push --tags

echo "--- Releasing to Github"
conventional-github-releaser \
  --token $GITHUB_RELEASE_ACCESS_TOKEN \
  --preset angular
