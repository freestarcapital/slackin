#!/usr/bin/env bash

tag=${1:-latest}
registryUrl="us.gcr.io/freestar-157323/slackin"

echo "Building $tag"

# Build the main application Dockerfile
docker build -t "slackin:$tag" .
docker tag "slackin:$tag" "$registryUrl:$tag"

# Push to gcloud container registry
gcloud docker -- push "$registryUrl:$tag"
