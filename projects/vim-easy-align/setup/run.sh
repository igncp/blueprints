#!/usr/bin/env bash

set -e

if test -n "$(sudo docker container ls -a | grep blueprints-vim-easy-align)"; then
  sudo docker stop blueprints-vim-easy-align
  sudo docker start blueprints-vim-easy-align
  sudo docker exec -it blueprints-vim-easy-align /bin/bash
  exit 0
fi

sudo docker run \
  -it \
  --name blueprints-vim-easy-align \
  -v $(pwd)/..:/project \
  blueprints-vim-easy-align \
  /bin/bash
