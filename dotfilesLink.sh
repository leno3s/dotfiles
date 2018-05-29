#!/bin/sh
DOTFILES=~/git/dotfiles/
ln -sf $DOTFILES/dotfiles/.vimrc $HOME/.vimrc
ln -sf $DOTFILES/.bash_profile $HOME/.bash_profile
ln -sf $DOTFILES/dotfiles/.zshrc $HOME/.zshrc
ln -sf $DOTFILES/dotfiles/zshenv $HOME/.zshenv
ln -sf $DOTFILES/dotfiles/.latexmkrc $HOME/.latexmkrc

