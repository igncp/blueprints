#!/usr/bin/env bash

set -e

if test -n "$(sudo docker container ls -a | grep blueprints-magento2)"; then
  sudo docker stop blueprints-magento2
  sudo docker start blueprints-magento2
  sudo docker exec -it blueprints-magento2 /bin/bash
  exit 0
fi

sudo docker run \
  -v "$(pwd)/files:/home/ubuntu/files" \
  -it \
  --name blueprints-magento2 \
  -p 5000:80 \
  -p 5050:5050 \
  blueprints-magento2 \
  /bin/bash
