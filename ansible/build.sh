#!/bin/bash

latest="2.7.9"
versions=( "2.7.7" "${ansible_latest}" )

for version in "${versions[@]}"; do
    docker build -t ${DOCKER_USERNAME}/${TOOL}:${version} --build-arg "ANSIBLE_VERSION=${version}" .
done

docker tag ${DOCKER_USERNAME}/${TOOL}:${latest} ${DOCKER_USERNAME}/${TOOL}:latest