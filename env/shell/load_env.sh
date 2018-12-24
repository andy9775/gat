#!/bin/sh

ENV_PATH=${GAT_ENV_PATH:-$HOME}
# specify the environment variable file
ENV_SOURCE="${ENV_PATH}/.envgat"

function _onLoad() {
  # create the environment file if none exists
  if [[ ! -e $ENV_SOURCE ]]; then
    mkdir -p $ENV_PATH
    touch $ENV_SOURCE
  fi
  # load the env variables
  echo "Loading GitHub Action Tools env into session..."
  source $ENV_SOURCE
}

# automatically load the env variables into the shell

if [[ -e $GAT_ENV_AUTOLOAD  == true ]]; then
  _onLoad
fi
