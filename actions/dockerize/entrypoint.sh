#!/bin/sh
# login, build and push the docker image
set -e

if [[ $GITHUB_EVENT_NAME == "release" ]]; then
  docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD $DOCKER_REGISTRY_URL
  
  # ================================== build version ==================================
  # X.Y.Z
  VERSION=${GITHUB_REF##*/v}
  TAG="andy9775/gat:$VERSION"

  echo "building ${TAG}..."
  docker build -t $TAG $GITHUB_WORKSPACE

  echo "pushing ${TAG}..."
  docker push $TAG

  # ====================================== tag latest ======================================
  LATEST_TAG="andy9775/gat:latest"

  echo "tagging ${LATEST_TAG}..."
  docker tag $TAG $LATEST_TAG

  echo "pushing ${LATEST_TAG}..."
  docker push $LATEST_TAG
else
  echo "not a release"
  exit 1
fi
