#!/bin/sh

# setup the env functions
mv ./genv.sh /bin/genv # get env value
mv ./senv.sh /bin/senv # set env value
mv ./load_env.sh /bin/load_env # autoload env value into session

load_env
