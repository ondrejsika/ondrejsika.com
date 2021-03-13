#!/bin/sh

IMAGE_BASE=ondrejsika/ondrejsika.com
IMAGE_DEPLOYMENT=$IMAGE_BASE:deploy-$(git rev-parse --abbrev-ref HEAD)-$(git rev-parse --short HEAD)-$(date +%s)

docker build -t $IMAGE_BASE .
docker tag $IMAGE_BASE $IMAGE_DEPLOYMENT
docker push $IMAGE_BASE
docker push $IMAGE_DEPLOYMENT

helm upgrade --install ondrejsika-com ondrejsika/one-image --set host=ondrejsika.com --set image=$IMAGE_DEPLOYMENT --set changeCause=$(git rev-parse --abbrev-ref HEAD)-$(git rev-parse --short HEAD)
