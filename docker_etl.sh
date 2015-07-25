#!/bin/sh
#
# Transport all DockerHub images to Private Docker Registry
#
$USER="myuser"
$REGISTRY="my-private-registry:5000"

docker images | grep $USER | grep -E "^[a-z0-9]" | awk '{print $1":"$2}' | cut -d'/' -f2 | xargs -I{} docker tag $USER/{} $REGISTRY/{}
docker images | grep $REGISTRY | awk '{print $1":"$2}' | xargs -I{} docker push {}

