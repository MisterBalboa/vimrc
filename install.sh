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
fi

cd $HOME

if [ ! -d "$HOME/.fzf" ]
then
  echo 'installing fuzzy finder'
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

if [ ! -d "$HOME/vim_tmp" ]
then
  mkdir ~/vim_tmp
fi

touch ~/.vimrc
cat $HOME/vimrc/vim_config_file > ~/.vimrc

if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

if [ -f ~/.zshrc ]
then
  source ~/.zshrc
fi
