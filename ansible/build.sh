#!/bin/bash

latest="2.7.9"
versions=( "2.7.7" "${ansible_latest}" )

for version in "${versions[@]}"; do
    docker build -t ${TOOL}:${version} --build-arg "ANSIBLE_VERSION=${version}" .
done

docker tag ${TOOL}:${latest} ${TOOL}:latest