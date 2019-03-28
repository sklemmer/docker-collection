#!/bin/bash

tools=(
    "kubectl version"
    "helm version -c"
    "kubens -h"
    "kubectx -h"
    "helmsman -v"
    )

for t in $(tools); do
    docker run -it ${TOOL}:latest ${t}
done
