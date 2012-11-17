#!/bin/sh
if ! [ -d $HOME/.rbenv ]; then
  git clone git://github.com/sstephenson/rbenv.git $HOME/.rbenv
fi

if ! [ -d $HOME/.rbenv/plugins/ruby-build ]; then
  git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv rehash

if ! [[ $(rbenv version) =~ ^1\.9\.3-p327 ]]; then
  rbenv install 1.9.3-p327
  rbenv global 1.9.3-p327
  rbenv rehash
fi

if [[ -z $(gem list bundler | grep bundler) ]]; then
  gem install bundler
  rbenv rehash
fi

bundle install --path=vendor/bundle
