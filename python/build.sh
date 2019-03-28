#!/bin/bash

docker build -t ${TOOL} .
docker tag ${TOOL} ${TOOL}:latest
docker tag ${TOOL} ${TOOL}:3.7