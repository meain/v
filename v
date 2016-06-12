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

# Get the data in the file to list
while IFS= read line
do
    ln=$((ln+1))
    if (("$ln">1)); then
        list["$ln"]="$line"
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
