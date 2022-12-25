#!/bin/bash
# Overwrite current nvim configuration with that in git.

cp -R ~/.config/nvim/ .
rm -rf nvim/plugin/packer_compiled.lua
