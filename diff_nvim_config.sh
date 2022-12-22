#!/bin/bash
# Check for any differences in the git configuration and your local nvim configuration.

diff -bur nvim/ ~/.config/nvim/ | nvim -R  -
