#!/bin/sh
# login, build and push the docker image
set -e

TAG="andy9775/gat:latest"

echo "logging ${DOCKER_USERNAME} into ${DOCKER_REGISTRY_URL}..."
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD $DOCKER_REGISTRY_URL

echo "building ${TAG} in ${GITHUB_WORKSPAC}..."
docker build -t $TAG $GITHUB_WORKSPACE

echo "pushing ${TAG}..."
docker push $TAG