#!/bin/bash

git pull origin master

function doIt() {
    cp .vimrc "$HOME/.vimrc"
    mkdir -p "$HOME/.vim"
    cp coc-settings.json "$HOME/.vim/coc-settings.json"

    if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    vim +PlugUpgrade +PlugUpdate +PlugClean!
}
if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt
