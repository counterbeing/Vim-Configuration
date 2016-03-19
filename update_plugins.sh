#!/usr/bin/env bash

snapshot_dir="$HOME/.vim/plug_snapshots"
mkdir -p "${snapshot_dir}"
timestamp=`date +%Y-%m-%d:%H:%M:%S`

# Upgrade plug.vim
# Update all of plugins
# Create a snapshot that will need to be checked into git, this allows us to revert when something goes wrong.
# Quit vim

vim +PlugUpgrade +PlugUpdate +"PlugSnapshot! ~/.vim/plug_snapshots/${timestamp}_plug_snapshot.vim" +qall;

# Remove old snapshots if there are more than five
# the `command` keyword allows us to run `ls` without any of the flags
# that might be aliased into the default.

# cd "${snapshot_dir}"; command ls -tr | head -n 9 | xargs rm
cd "${snapshot_dir}"; (command ls -t | head -n 5; command ls) | sort | uniq -u | xargs rm
