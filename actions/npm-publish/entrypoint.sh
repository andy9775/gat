#!/bin/bash

if [[ $GITHUB_EVENT_NAME == "release" ]]; then

  # ====================================== config ======================================
  # source: https://github.com/actions/npm
  NPM_CONFIG_USERCONFIG="$HOME/.npmrc"
  NPM_REGISTRY_URL="registry.npmjs.org"

  printf "registry=https://$NPM_REGISTRY_URL" >> "$NPM_CONFIG_USERCONFIG"
  printf "\n" >> "$NPM_CONFIG_USERCONFIG"
  printf "//$NPM_REGISTRY_URL/:_authToken=$NPM_TOKEN" >> "$NPM_CONFIG_USERCONFIG"
  chmod 0600 "$NPM_CONFIG_USERCONFIG"

  # ====================================== publish ======================================
  VERSION=${GITHUB_REF##*/v}

  cd $GITHUB_WORKSPACE
  echo "publishing version $VERSION"

  yarn install

  # yarn has bugs publishing without interactions - use npm
  # don't create a git tag
  npm config set git-tag-version false
  npm version $VERSION
  npm publish --access public
fi