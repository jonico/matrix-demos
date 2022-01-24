#!/bin/bash

. .pscale/cli-helper-scripts/export-db-connection-string.sh "parallel-connection-test"
. .pscale/cli-helper-scripts/set-db-url.sh

echo "Pulling needed docker container, this will only take some seconds the first time you run this script ..."
docker pull ghcr.io/jonico/actions-runner:ps
echo "Killing and removing any docker containers from previous runs ..."
docker kill $(docker ps -q --filter name=Parallel-Connection-Test)
docker rm $(docker ps -a -q --filter name=Parallel-Connection-Test)

act workflow_dispatch \
    -P ps-runner=ghcr.io/jonico/actions-runner:ps  \
    -e test-parameters.json \
    -a "${GITHUB_USER}" \
    -W .github/workflows/parallel-connection-test.yml  \
    -s DATABASE_URL="$DATABASE_URL" \
    -b
