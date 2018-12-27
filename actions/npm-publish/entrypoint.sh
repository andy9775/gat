#!/bin/bash

if [[ $GITHUB_EVENT_NAME == "release" ]]; then

  # ====================================== config ======================================
  # source: https://github.com/actions/npm
  NPM_CONFIG_USERCONFIG="$HOME/.npmrc"
  NPM_REGISTRY_URL="http://registry.npmjs.org"

  printf "//$NPM_REGISTRY_URL/:_authToken=$NPM_TOKEN\nregistry=$NPM_REGISTRY_URL" > "$NPM_CONFIG_USERCONFIG"
  chmod 0600 "$NPM_CONFIG_USERCONFIG"

  # ====================================== publish ======================================
  VERSION=${GITHUB_REF##*/v}

  npm config set git-tag-version false

  cd $GITHUB_WORKSPACE
  echo "publishing version $VERSION"
  npm version $VERSION
  # create root index.js file
  node $GITHUB_WORKSPACE/actions/npm-publish/index.js
  npm publish --access public
fi