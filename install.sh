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
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  exit
fi

echo 'installing fuzzy finder'
cd ../ && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

mkdir ~/vim_tmp
touch ~/.vimrc
cat vim_config_file > ~/.vimrc

if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

if [ -f ~/.zshrc ]
then
  source ~/.zshrc
fi
