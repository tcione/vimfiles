#!/bin/bash

git pull origin master

function doIt() {
    rsync --exclude ".git/" \
      --exclude ".DS_Store" \
      --exclude "bootstrap.sh" \
      --exclude "README.md" \
      --exclude "LICENSE-MIT.txt" \
      --exclude "autoload/" \
      --exclude "plugin/" \
      -av --no-perms . ~

    if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    vim +PlugUpgrade +PlugUpdate +PlugClean!
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt
