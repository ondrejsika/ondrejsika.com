IMAGE = ondrejsika/ondrejsika.com
IMAGE_GHCR = ghcr.io/ondrejsika/ondrejsika.com
IMAGE_DEPLOYMENT = $(IMAGE):$(shell git rev-parse --abbrev-ref HEAD)-$(shell git rev-parse --short HEAD)-$(shell date +%s)
IMAGE_BUILD_ENV = ondrejsika/ondrejsika.com-build-env

default: docker-build-and-push

dev:
	bundler exec jekyll serve --host 0.0.0.0

docker-build-and-push:
	@make docker-build IMAGE_DEPLOYMENT=$(IMAGE_DEPLOYMENT)
	@make docker-push IMAGE_DEPLOYMENT=$(IMAGE_DEPLOYMENT)

docker-build:
	docker build --platform linux/amd64 -t $(IMAGE) -t $(IMAGE_GHCR) -t $(IMAGE_DEPLOYMENT) --build-arg CI_COMMIT_TITLE="$(shell git show -s --format=%s)" .

docker-push:
	docker push $(IMAGE)
	docker push $(IMAGE_GHCR)
	docker push $(IMAGE_DEPLOYMENT)

docker-build-and-push-build-env:
	@make docker-build-build-env
	@make docker-push-build-env

docker-build-build-env:
	docker build --platform linux/amd64 -t $(IMAGE_BUILD_ENV) --target build-env .

docker-push-build-env:
	docker push $(IMAGE_BUILD_ENV)

pull-build-env:
	docker pull $(IMAGE_BUILD_ENV)
