#!/bin/bash
today=`date +%Y%m%d`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
echo "Building minibuntu:$today"

docker build . --no-cache=true -t shakataganai/miniubuntu:$today
docker tag shakataganai/miniubuntu:$today  shakataganai/miniubuntu:latest
docker push shakataganai/miniubuntu:$today
docker push shakataganai/miniubuntu:latest

