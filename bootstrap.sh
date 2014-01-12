#!/bin/bash

#ln -s ${PWD}/bash_profile ~/.bash_profile
ln -s ${PWD}/zshrc ~/.zshrc
ln -s ${PWD}/vimrc ~/.vimrc

echo i

if ! [ -L "$HOME/bin" ]; then
    ln -s ${PWD}/bin ~/bin
else
    echo "$HOME/bin a;ready linked"
fi

chmod a+x ~/bin/*
