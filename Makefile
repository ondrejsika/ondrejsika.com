DOCKER_IMAGE_BASE = docker.pkg.github.com/ondrejsika/ondrejsika.com
DOCKER_IMAGE_BUILD_ENV = $(DOCKER_IMAGE_BASE)/build-env:2021-04-23
DOCKER_IMAGE_STATIC_SITE = $(DOCKER_IMAGE_BASE)/static-site

fmt:
	yarn run prettier-write

fmt-check:
	yarn run prettier-check

setup-git-hooks:
	rm -rf .git/hooks
	(cd .git && ln -s ../.git-hooks hooks)

docker-build-env-image:
	docker build \
		--pull \
		--target build-env \
		--tag $(DOCKER_IMAGE_BUILD_ENV) \
		.
	docker push $(DOCKER_IMAGE_BUILD_ENV)

docker-image:
	docker build \
		--pull \
		--tag $(DOCKER_IMAGE_STATIC_SITE) \
		.
	docker push $(DOCKER_IMAGE_STATIC_SITE)
	docker run -p 80:80 $(DOCKER_IMAGE_STATIC_SITE)

