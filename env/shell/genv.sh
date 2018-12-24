#!/bin/bash

ENV_PATH=${GAT_ENV_PATH:-$HOME}
# specify the environment variable file
ENV_SOURCE="${ENV_PATH}/.envgat"

# helper to read an environment variable
function genv(){
  _RESULT=""
  if [[ $1 ]]; then
    if [[ -e $ENV_SOURCE ]]; then
      while read line
      do
        if [[ $line ]]; then
          remainder="$line"
          _export="${remainder%% *}"; remainder="${remainder#* }"
          key="${remainder%%=*}"; remainder="${remainder#*=}"
          value="${remainder%%=*}"; remainder="${remainder#*=}"
          if [[ $key == $1 ]]; then
            _RESULT=$value
          fi
        fi
      done < $ENV_SOURCE
    fi
  fi
  # Return last set value
  echo $_RESULT
}
genv $1