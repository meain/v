# v
Quick access to recent files in Vim ( any vim fork ).

It opens the latest file with the filename containing the argument you have given.

**This depends on [MRU](https://github.com/vim-scripts/mru.vim) plugin in vim.**


# Installation
1. Install [MRU](https://github.com/vim-scripts/mru.vim) plugin for Vim
2. Put `v` somewhere in $PATH (e.g. /usr/local/bin/) or use this ( you still will have to install [MRU](https://github.com/vim-scripts/mru.vim) )

    ```
    git clone https://github.com/meain/v && chmod +x v/v && cp v/v /usr/local/bin/ && rm v
    ```

# Usage

Usage: `$ v <term>`

Example: `$ v readme`

###Extra : 

You could install `vv` to open the last edited vim file instatly. Install it using : 

```
git clone https://github.com/meain/v && chmod +x v/vv && cp v/vv /usr/local/bin/ && rm v
```


# Customize
Customization that you can do.

* You can change the number of entries that `v` will show if you use `v` without any arguments. You can change it in the script. Just change the variable `limit` in the beginning.

* You can change your editor ( to whichever vim fork )
    Change the varible vim to your favorite editor.
    Example ( for mvim ):

     ```shell
    [ "$vim" ] || vim=mvim
    ```

