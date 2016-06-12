# v
Quick access to recent files in Vim.

It opens the latest file with the filename containing the argument you have given.

**This depends on [MRU](https://github.com/vim-scripts/mru.vim) plugin in vim.**


# Installation
1. Install [MRU](https://github.com/vim-scripts/mru.vim) plugin for Vim
2. Put `v` somewhere in $PATH (e.g. /usr/local/bin/).

# Usage

Usage: `$ v <term>`

Example: `$ v readme`

# Customize
You have one small customization that you can do.

You can change the number of entries that `v` will show if you use `v` without any arguments

`$ v`

You can change it in the script. Just change the variable `limit` in the beginning.
