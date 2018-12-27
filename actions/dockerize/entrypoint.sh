#!/bin/sh
# login, build and push the docker image
set -e

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD $DOCKER_REGISTRY_URL

# ================================== build version ==================================
if [[ $GITHUB_EVENT_NAME == "release" ]]; then
  # X.Y.Z
  VERSION=${GITHUB_REF##*/v}
else
  VERSION="latest"
fi
TAG="andy9775/gat:$VERSION"

echo "building ${TAG}..."
docker build -t $TAG $GITHUB_WORKSPACE

echo "pushing ${TAG}..."
docker push $TAG

# ====================================== tag latest ======================================
if [[ $VERSION != "latest" ]]; then
  LATEST_TAG="andy9775/gat:latest"

  echo "tagging ${LATEST_TAG}..."
  docker tag $TAG $LATEST_TAG

  echo "pushing ${LATEST_TAG}..."
  docker push $LATEST_TAG
fi
