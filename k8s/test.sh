#!/bin/bash

tools=( "kubectl version" "helm version" "kubens" "kubectx" )

for t in $(tools); do
    docker run -it ${TOOL}:latest ${t}
done
