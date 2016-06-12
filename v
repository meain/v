#!/bin/bash

# Customize
# -----------------------
limit=13 #lucky number
# -----------------------

file="$HOME/.vim_mru_files"
ln=0

# Get the data in the file to list
while IFS= read line
do
    ln=$((ln+1))
    if (("$ln">1)); then
        list["$ln"]="$line"
    fi
    if (("$ln">"$limit")); then
        break
    fi
done <"$file"

# Work on the list of files available
if [ ! -z "$1" -a "$1" != " " ]
then
    for i in "${list[@]}"
    do
        bn=`basename "$i" | grep "$1"`
        if [ ! -z "$bn" -a "$bn" != " " ]; then
            nvim "$i"
            break
        fi
    done
else
    echo "What do you like to search?"
    for i in "${list[@]}"
    do
            echo "$i"
    done
fi
