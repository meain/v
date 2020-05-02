#!/bin/sh

set -e

MRU_FILE="$HOME/.vim_mru_files"
IGNORE_LIST=".git|node_modules|/tmp|/private/var/folders/nc"

[ ! -f "$MRU_FILE" ] && echo "Setup MRU plugin for vim. Check README for more info." && exit 1

if [ -n "$1" ];then
   # mru files
   FILE="$(tail -n+2 "$MRU_FILE" | grep -vE "($IGNORE_LIST)" | grep "$1" | head -n1)"
   [ -n "$FILE" ] && "$EDITOR" "$FILE" && exit 0

   # local dir files
   FILE="$(find . -type f -maxdepth 1| grep -vE "($IGNORE_LIST)" | grep "$1" | head -n1)"
   [ -n "$FILE" ] && "$EDITOR" "$FILE" && exit 0
fi

echo "List of recent files"
echo "--------------------"
tail -n+2 "$MRU_FILE"
