#!/bin/sh
source "$HOME/nvm/nvm.sh"
nvm use v0.9.3 > /dev/null
export PATH="./node_modules/.bin:$PATH"

exec "$@"
