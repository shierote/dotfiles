#!/bin/sh
ln -sf $PWD/.vimrc $HOME/.vimrc
ln -sf $PWD/.zshrc $HOME/.zshrc
ln -nsf $PWD/.zsh.d $HOME/.zsh.d

# Git
ln -sf $PWD/.gitignore_global $HOME/.gitignore_global
ln -sf $PWD/.commit_template $HOME/.commit_template
ln -sf $PWD/.gitconfig $HOME/.gitconfig

exec $SHELL -l
