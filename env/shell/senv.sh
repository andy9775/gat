#!/bin/bash

ENV_PATH=${GAT_ENV_PATH:-$HOME}
# specify the environment variable file
ENV_SOURCE="${ENV_PATH}/.envgat"

# set the environment variable
function senv(){
    # create the environment file if none exists
  if [[ ! -e $ENV_SOURCE ]]; then
    mkdir -p $ENV_PATH
    touch $ENV_SOURCE
  fi
  
  # simple implementation - append to the .envgat file. 
  # duplicate variables are ignored and not removed
  if [[ $1 && $2 ]]; then
    echo "export $1=$2" >> $ENV_SOURCE
  else
    echo "No key/value passed to senv. Provided: key=$1 value=$2"
    exit 1 
  fi
}

senv $1 $2