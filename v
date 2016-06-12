#!/bin/bash

# Customize
# -----------------------
limit=20
[ "$vim" ] || vim=nvim
# -----------------------
file="$HOME/.vim_mru_files"
ln=0
n=0
flag=0
igflag=0
lfile=""
ignorelist[0]=".git/MERGE_MSG"
ignorelist[1]=".git/COMMIT_EDITMSG"
ignorelist[2]=".git/index"

if ! [ -f "$file" ];
then
   echo "Make sure you have installed MRU plugin for vim. See README."
   exit 1
fi

# Get the data in the file to list
while IFS= read line
do
    ln=$((ln+1))
    if (("$ln">1)); then
        for z in "${ignorelist[@]}"
        do
            if [[ "$line" =~ "$z" ]]; then
                igflag=1
            fi
        done
        if (("$igflag" == 1));
        then
            igflag=0
        else
            list["$ln"]="$line"
        fi
    fi
done <"$file"

# Work on the list of files available
if [ ! -z "$1" -a "$1" != " " ]
then
    for i in "${list[@]}"
    do
        bn=`basename "$i" | grep "$1"`
        if [ ! -z "$bn" -a "$bn" != " " ]; then
            $vim "$i"
            flag=1
            break
        fi
    done
    if (("$flag" ==  0)); then
        echo "No recent file that matches!"
    fi
else
    echo "List of recent files"
    echo "--------------------"
    for i in "${list[@]}"
    do
        echo "$i"
        n=$((n+1))
        if (("$n">"$limit")); then
            break
        fi
    done
fi
