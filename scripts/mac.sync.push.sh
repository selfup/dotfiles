#!/usr/bin/env bash
#############################################################
# Sync Dotfiles for Mac in case of emergency - Mojave 10.14.6
#######################
# Use at your own risk!
#######################

if [[ -d mac ]]
then
  if [[ -f mac/.bash_profile ]]
  then
    cp mac/.bash_profile $HOME/.bash_profile

    source $HOME/.bash_profile
  fi
fi
