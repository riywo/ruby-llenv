#!/bin/sh
if ! [ -f $HOME/perl5/perlbrew/etc/bashrc ]; then
  curl -kL http://install.perlbrew.pl | bash
fi

source $HOME/perl5/perlbrew/etc/bashrc

if [ "$PERLBREW_PERL" != "perl-5.16.2" ]; then
  perlbrew install perl-5.16.2 -n -j 2
  perlbrew switch perl-5.16.2
fi

if [ -z "$(which cpanm)" ]; then
  perlbrew install-cpanm
fi

cpanm -v -l local --installdeps .
