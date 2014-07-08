#!/bin/bash

#ln -s ${PWD}/bash_profile ~/.bash_profile
#ln -s ${PWD}/zshrc ~/.zshrc
ln -s ${PWD}/vimrc ~/.vimrc
ln -s ${PWD}/ackrc ~/.ackrc

if ! [ -L "$HOME/bin" ]; then
    ln -s ${PWD}/bin ~/bin
else
    echo "$HOME/bin already linked"
fi

source ${PWD}/private/bitbucket.sh

chmod a+x ~/bin/*
