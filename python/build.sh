#!/bin/bash

docker build -t ${TOOL} .
docker tag ${TOOL} ${DOCKER_USERNAME}/${TOOL}:latest
docker tag ${TOOL} ${DOCKER_USERNAME}/${TOOL}:3.7