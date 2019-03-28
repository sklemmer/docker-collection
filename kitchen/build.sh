#!/bin/bash

latest="stable"
versions=( "${latest}" )

for version in "${versions[@]}"; do
    docker build -t ${TOOL}:${version} --build-arg "DOCKER_VERSION=${version}" .
done

docker tag ${TOOL}:${latest} ${TOOL}:latest