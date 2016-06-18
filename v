#!/bin/bash

# Customize
# -----------------------
limit=20
[ "$vim" ] || vim=nvim
ignorelist[0]=".git/"
ignorelist[1]="/private/var/folders/nc"
# -----------------------

file="$HOME/.vim_mru_files"
ln=0
n=0
flag=0
igflag=0
lfile=""

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
            line=`echo "$line" | tr '[:upper:]' '[:lower:]'`
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
        # echo "No recent file that matches!"
        # Get the data in the file to list
         find . -maxdepth 1 -type f -exec grep -Iq . {} \; -and -print > "$HOME/.cur_dir_files"
        filex="$HOME/.cur_dir_files"
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
                    line=`echo "$line" | tr '[:upper:]' '[:lower:]'`
                    list["$ln"]="$line"
                fi
            fi
        done <"$filex"

        # remove the file list
        rm "$HOME/.cur_dir_files"

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
