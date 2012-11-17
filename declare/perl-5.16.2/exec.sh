#!/bin/sh
source $HOME/perl5/perlbrew/etc/bashrc
export PERL5OPT="-Mlib=./local/lib/perl5"
export PATH="./local/bin:$PATH"

exec "$@"
