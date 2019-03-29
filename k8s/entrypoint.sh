#!/usr/bin/env bash
set -Eeuo pipefail

if [[ ! -d "/root/.helm" ]]; then
  cp -R /.helm /root/.helm/
fi

# FROM bash /usr/local/bin/docker-entrypoint.sh
# first arg is `-f` or `--some-option`
# or there are no args
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
        # docker run bash -c 'echo hi'
        exec bash "$@"
fi

exec "$@"