#!/bin/bash

original_path=$(pwd)

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
fi

cd $HOME

if [ ! -d "$HOME/.fzf" ]
then
  echo 'installing fuzzy finder'
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  $HOME/.fzf/install
fi

echo 'installing custom vim config...'
if [ ! -d "$HOME/vim_tmp" ]
then
  mkdir $HOME/vim_tmp
fi

touch $HOME/.vimrc

cd $original_path
cat ./.vimrc_slim > $HOME/.vimrc

if [ -f $HOME/.bashrc ]
then
  source $HOME/.bashrc
fi

if [ -f $HOME/.zshrc ]
then
  source $HOME/.zshrc
fi
