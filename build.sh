#!/usr/bin/env bash

tag=${1:-latest}
registryUrl="us.gcr.io/freestar-157323/slackin-app"

echo "Building $tag"

# Build the main application Dockerfile
docker build -t "slackin-app:$tag" .
docker tag "slackin-app:$tag" "$registryUrl:$tag"

# Push to gcloud container registry
gcloud docker -- push "$registryUrl:$tag"