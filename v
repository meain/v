#!/bin/bash
file="$HOME/.vim_mru_files"
ln=0

# Get the data in the file to list
while IFS= read line
do
    ln=$((ln+1))
    if (("$ln">1)); then
        list["$ln"]="$line"
    fi
done <"$file"

# Work on the list of files available
for i in "${list[@]}"
do
    bn=`basename "$i" | grep "$1"`
    if [ ! -z "$bn" -a "$bn" != " " ]; then
        nvim "$i"
    fi
done
