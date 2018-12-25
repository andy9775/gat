#!/bin/bash

cd $GITHUB_WORKSPACE
node /index.js
yarn publish --non-interactive --access public