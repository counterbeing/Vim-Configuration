#!/usr/bin/env bash

mkdir -p ~/.vim/plug_snapshots
timestamp=`date +%Y-%m-%d:%H:%M:%S`

# Upgrade plug.vim
# Update all of plugins
# Create a snapshot that will need to be checked into git, this allows us to revert when something goes wrong.
# Quit vim

vim +PlugUpgrade +PlugUpdate +"PlugSnapshot! ~/.vim/plug_snapshots/${timestamp}_plug_snapshot.vim" +qall;
