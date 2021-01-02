#!/bin/bash

if [ $(uname -s) = "Darwin" ]
then
  echo "Installing vimplug for MacOS..."
  curl -fLos ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ $(uname -s) = "Linux" ]
then
  echo "Installing vimplug for Linux..."
  sh -s -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

echo 'installing fuzzy finder'
cd ../ && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cd vimrc && cat vimrc > ~/.vimrc

if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

if [ -f ~/.zshrc ]
then
  source ~/.zshrc
fi
