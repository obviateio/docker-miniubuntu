#!/bin/bash
DEFAULT="miniubuntu"
TODAY=`date +%Y%m%d`

if [ -z "$1" ]; then
    echo "LOCAL Build -- $DEFAULT:latest"
    docker build . -t $DEFAULT:latest
else
    echo "CI/CD Build -- $1:$TODAY"
    docker build . --no-cache=true -t $1:$TODAY
    docker tag $1:$TODAY  $1:latest
    docker push $1:$TODAY
    docker push $1:latest
fi