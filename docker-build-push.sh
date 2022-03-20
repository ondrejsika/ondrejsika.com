#!/bin/sh

IMAGE_BASE=ondrejsika/ondrejsika.com
IMAGE_DEPLOYMENT=$IMAGE_BASE:$(git rev-parse --abbrev-ref HEAD)-$(git rev-parse --short HEAD)-$(date +%s)

docker build --platform linux/amd64 -t $IMAGE_BASE -t $IMAGE_DEPLOYMENT --build-arg CI_COMMIT_TITLE="$(git show -s --format=%s)" .
docker push $IMAGE_BASE
docker push $IMAGE_DEPLOYMENT
