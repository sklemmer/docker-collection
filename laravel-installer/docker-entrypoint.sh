#!/usr/bin/env bash

isCommand() {
  for cmd in \
    "help" \
    "list" \
    "new"

  do
    if [[ -z "${cmd#"$1"}" ]]; then
      return 0
    fi
  done

  return 1
}

export PATH="${PATH}:${COMPOSER_HOME}/vendor/bin"

# check if the first argument passed in looks like a flag
if [[ "$(printf %c "$1")" = '-' ]]; then
  set -- /sbin/tini -- laravel "$@"
# check if the first argument passed in is laravel
elif [[ "$1" = 'laravel' ]]; then
  set -- /sbin/tini -- "$@"
# check if the first argument passed in matches a known command
elif isCommand "$1"; then
  set -- /sbin/tini -- laravel "$@"
fi

exec "$@"