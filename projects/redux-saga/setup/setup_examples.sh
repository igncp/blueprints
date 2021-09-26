#!/usr/bin/env bash

set -e

mkdir -p untracked

cd untracked

if [ ! -d redux-saga ]; then
  git clone https://github.com/redux-saga/redux-saga.git
  (cd redux-saga && git reset --hard 10fc193)
fi

cd redux-saga

if [ ! -d node_modules ]; then
  yarn
fi

echo "Setup complete"
