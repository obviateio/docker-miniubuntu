#!/bin/bash
USERNAME="shakataganai"
TODAY=`date +%Y%m%d`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
NAME="$(cut -d- -f2- <<< ${PWD##*/})"

if [ -z "$TRAVIS" ]; then    
    echo "LOCAL Build -- $NAME:latest"
    docker build . -t $USERNAME/$NAME:latest
else
    echo "CI/CD Build -- $NAME:$TODAY"
    docker build . --no-cache=true -t $USERNAME/$NAME:$TODAY
    docker tag $USERNAME/$NAME:$TODAY  $USERNAME/$NAME:latest
    docker push $USERNAME/$NAME:$TODAY
    docker push $USERNAME/$NAME:latest
fi