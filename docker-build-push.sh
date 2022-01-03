#!/bin/sh

IMAGE_BASE=ondrejsika/ondrejsika.com
IMAGE_DEPLOYMENT=$IMAGE_BASE:$(git rev-parse --abbrev-ref HEAD)-$(git rev-parse --short HEAD)-$(date +%s)

docker build -t $IMAGE_BASE -t $IMAGE_DEPLOYMENT .
docker push $IMAGE_BASE
docker push $IMAGE_DEPLOYMENT
