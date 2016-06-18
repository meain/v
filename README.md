# v
Quick access to recent files in Vim ( any vim fork ).

If the query you given is not in the list of recent file it will load the file that matches your querry in the current directory if availabe.

`v`&nbsp; - It opens the latest file with the filename containing the argument you have given

`vv` - It opens the last edited file in vim

**This depends on [MRU](https://github.com/vim-scripts/mru.vim) plugin in vim.**


# Installation
1. Install [MRU](https://github.com/vim-scripts/mru.vim) plugin for Vim
2. Install/update `v` only :

    ```
    git clone https://github.com/meain/v && chmod +x v/v && cp v/v /usr/local/bin/ && rm v && echo 'Installed v'
    ```
    Install/update `vv` only :

    ```
    git clone https://github.com/meain/v && chmod +x v/vv && cp v/vv /usr/local/bin/ && rm v && echo 'Installed vv'
    ```

# Usage

## v
Usage: `$ v <term>`

Example: `$ v readme`
## vv
Usage: `$ vv`


# Customize
Customization that you can do.

* You can change the number of entries that `v` will show if you use `v` without any arguments. You can change it in the script. Just change the variable `limit` in the beginning.

* You can change your editor ( to whichever vim fork )
    Change the varible vim to your favorite editor.
    Example ( for mvim ):

    ```
    [ "$vim" ] || vim=mvim
    ```

* You can set the script to ignore certain files by adding in more to :
    ```
    ignorelist[0]=".git/MERGE_MSG"
    ignorelist[1]=".git/COMMIT_EDITMSG"
    ignorelist[2]=".git/index"
    ```
