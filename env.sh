#!/bin/bash
VIMRC=~/.vimrc
VIMRCDST=~/.vimrc
TMPDIR=/tmp/tmpvimfiles
BUNDLE=~/.vim/bundle

RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
RESET=`tput sgr0`
DONE="${GREEN}DONE${RESET}"
FAILED="${RED}FAILED${RESET}"

mkdir -p $TEMPDIR

function storetobackup {
    echo "Backing up $1 to $TMPDIR"
    rm -rf $TMPDIR/$1

    if mv "$1" $TMPDIR
    then
            echo "$DONE"
    else
            echo "${YELLOW}No file found for backup${RESET}"
    fi
}

function restorefrombackup {
    echo "Trying to restore $TMPDIR/$1 to $2"
    if mv "$TMPDIR/$1" $2
    then
            echo "$DONE"
    else
            echo "${YELLOW}No backup found${RESET}"
    fi
}
    
function checkinstall {
    if [ -d "$1" ];
    then
            echo "$1 already exists. Do you want to get the latest [y/n]?"
            read -n 1 YESNO 
    else
            YESNO="y"
    fi
}
