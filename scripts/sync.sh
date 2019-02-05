#!/usr/bin/env bash

# Sync Dotfiles in linux dir to actual dotfiles in $HOME

# Use at your own risk!

set -e

IN_DOCS_DIR=$(pwd | grep '/Documents/dotfiles' || echo '')
IN_SCRIPTS_DIR=$(pwd | grep '/Documents/dotfiles/scripts' || echo '')

if [[ $IN_DOCS_DIR == "" || $IN_SCRIPTS_DIR != "" ]]
then
    echo "NOT IN CORRECT DIRECTORY PLEASE READ THE README"
    exit 1
fi

if [[ -f $HOME/.tmux.conf ]] && [[ $TMUX == "1" ]]
then
    echo "\
    Backing up tmux config"

    cp $HOME/.tmux.conf $HOME/.tmux.old.conf.bak
    
    echo "
    Previous tmux config is now here: $HOME/.tmux.old.conf.bak"

    cp linux/.*.conf $HOME

    echo "
    tmux conf synced!"
fi

if [[ $GIT_CONFIG == "1" ]]
then
    cp linux/.gitconfig $HOME/.gitconfig

    echo "**** Please update $HOME/.gitconfig!"
fi

cp -rp ./linux/.bash* $HOME

echo "**** dotfiles synced!

     first time? $ source ~/.bashrc
     not first time? $ bgo"
