#!/bin/sh
ln -sf $PWD/.gitignore_global $HOME/.gitignore_global
ln -sf $PWD/.vimrc $HOME/.vimrc
ln -sf $PWD/.zshrc $HOME/.zshrc
ln -sf $PWD/.zsh.d $HOME/.zsh.d
ln -sf $PWD/.gitconfig $HOME/.gitconfig

git config --global commit.template $PWD/.commit_template

exec $SHELL -l
