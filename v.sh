#!/bin/bash
file="$HOME/.vim_mru_files"
ln=-2
# Just displaying the input 
echo "$1"

# Get the data in the file to list
while IFS= read line
do
    ln=$((ln+1))
    # echo "$ln"
    if (("$ln">1)); then
        # echo "$line"
        list["$ln"]="$line"
    fi
done <"$file"

# Work on the list of files available
for i in "${list[@]}"
do
    echo "$i"
done
