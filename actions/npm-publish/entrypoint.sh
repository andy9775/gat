#!/bin/bash

# source: https://github.com/actions/npm
NPM_CONFIG_USERCONFIG="$HOME/.npmrc"
NPM_REGISTRY_URL="registry.npmjs.org"

printf "//$NPM_REGISTRY_URL/:_authToken=$NPM_TOKEN\nregistry=$NPM_REGISTRY_URL" > "$NPM_CONFIG_USERCONFIG"
chmod 0600 "$NPM_CONFIG_USERCONFIG"

cd $GITHUB_WORKSPACE
node /index.js
npm publish --access public