#!/bin/sh

mkdir -p _site/api
slu static-api version -e "CI_COMMIT_TITLE=$CI_COMMIT_TITLE" > _site/api/version.json
