#!/bin/sh

IMAGE=ondrejsika/ondrejsika.com:deploy-$(git rev-parse --abbrev-ref HEAD)-$(git rev-parse --short HEAD)-$(date +%s)

docker build -t $IMAGE .
docker push $IMAGE

helm upgrade --install ondrejsika-com ondrejsika/one-image --set host=ondrejsika.com --set image=$IMAGE --set changeCause=$(git rev-parse --abbrev-ref HEAD)-$(git rev-parse --short HEAD)
