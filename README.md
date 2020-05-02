# v
Quick access to recent files in Vim ( any vim fork ).

Idea stolen from [rupa/v](https://github.com/rupa/v) but it only support original vim.

If the query you given is not in the list of recent file it will load the file that matches your querry in the current directory if availabe.

`v`&nbsp; - It opens the latest file with the filename containing the argument you have given

`vv` - It opens the last edited file in vim

**This depends on [MRU](https://github.com/vim-scripts/mru.vim) plugin in vim.**


# Installation
1. Install [MRU](https://github.com/vim-scripts/mru.vim) plugin for Vim
2. Install `v/vv` by adding it to a location in your $PATH variable and making it excecutable

# Usage

## v
Usage: `$ v <term>`

Example: `$ v readme`
## vv
Usage: `$ vv`


# Customize

Maybe you might wanna add more items to `IGNORE_LIST` var in `v`.
