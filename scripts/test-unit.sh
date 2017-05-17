#!/bin/bash

set -eo pipefail

echo "--- Linting"
npm run lint

echo "--- Unit testing"
npm run test:unit

echo "--- Dependencies security testing"
npm run test:dependencies
