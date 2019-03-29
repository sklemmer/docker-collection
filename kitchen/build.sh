#!/bin/bash

latest="stable"
versions=( "${latest}" )

for version in "${versions[@]}"; do
    docker build -t ${DOCKER_USERNAME}/${TOOL}:${version} --build-arg "DOCKER_VERSION=${version}" .
done

docker tag ${DOCKER_USERNAME}/${TOOL}:${latest} ${DOCKER_USERNAME}/${TOOL}:latest