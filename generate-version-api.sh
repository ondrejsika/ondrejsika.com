#!/bin/sh

mkdir -p _site/api
slu static-api version > _site/api/version.json
