#!/bin/bash
set -e

# pass through the root directory that the env shell scripts have been placed in
# default to the working directory
ROOT_DIR=${1:-"$(pwd)"}

# setup the env functions
# get env value
mv "${ROOT_DIR}/genv.sh" /bin/genv 
# set env value
mv "${ROOT_DIR}/senv.sh" /bin/senv 
# autoload env value into session
mv "${ROOT_DIR}/load_env.sh" /bin/load_env 
