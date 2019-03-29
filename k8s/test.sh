#!/bin/bash

tools=(
    "kubectl version"
    "helm version -c"
    "kubens -h"
    "kubectx -h"
    "helmsman -v"
    )

for t in "${tools[@]}"; do
    docker run -it ${DOCKER_USERNAME}/${TOOL}:latest ${t}
done
