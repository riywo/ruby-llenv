#!/bin/sh
if ! [ -d "$HOME/nvm" ]; then
  git clone git://github.com/creationix/nvm.git "$HOME/nvm"
fi

source "$HOME/nvm/nvm.sh"

if ! [ -d "$HOME/nvm/v0.9.3" ]; then
  nvm install v0.9.3
fi

nvm use v0.9.3
npm install
