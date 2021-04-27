#!/bin/sh
ln -sf $PWD/.gitignore_global $HOME/.gitignore_global
ln -sf $PWD/.vimrc $HOME/.vimrc
ln -sf $PWD/.zshrc $HOME/.zshrc
ln -sf $PWD/.gitconfig $HOME/.gitconfig
ln -nsf $PWD/.zsh.d $HOME/.zsh.d

git config --global core.excludesFile $HOME/.gitignore_global
git config --global commit.template $PWD/.commit_template
git config --global init.defaultBranch main

exec $SHELL -l
