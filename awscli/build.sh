#!/bin/bash

docker build -t ${TOOL} .
docker tag ${TOOL} ${TOOL}:latest