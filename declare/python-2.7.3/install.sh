#!/bin/sh
if ! [ -f "$HOME/.pythonbrew/etc/bashrc" ]; then
  curl -kL http://xrl.us/pythonbrewinstall | bash
fi

source "$HOME/.pythonbrew/etc/bashrc"

if ! [[ "$PYTHONPATH" =~ Python-2.7.3  ]]; then
  pythonbrew install 2.7.3
  pythonbrew switch 2.7.3
fi

if ! [ -f "$HOME/.pythonbrew/pythons/Python-2.7.3/bin/virtualenvwrapper.sh" ]; then
  pip install virtualenv virtualenvwrapper
fi

source "$HOME/.pythonbrew/pythons/Python-2.7.3/bin/virtualenvwrapper.sh"

if ! [ -d "$HOME/.virtualenvs/env" ]; then
  mkvirtualenv env
fi

workon env
pip install -r requirements.txt
