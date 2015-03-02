#!/bin/bash
VIMRC=~/.vimrc
VIMRCDST=~/.vimrc2
TMPDIR=/tmp/tmpvimfiles
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
DONE="${GREEN}DONE${RESET}"
FAILED="${RED}FAILED${RESET}"

mkdir -p $TEMPDIR
