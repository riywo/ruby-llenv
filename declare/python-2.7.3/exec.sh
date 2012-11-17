#!/bin/sh
source "$HOME/.pythonbrew/etc/bashrc"
source "$HOME/.pythonbrew/pythons/Python-2.7.3/bin/virtualenvwrapper.sh"
workon env

exec "$@"
