#!/bin/bash

# Script directory
DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../env.sh

AUTOLOAD=~/.vim/autoload

# Go to script directory
pushd $DIR &>/dev/null
storetobackup "$VIMRC"
rm -rf $VIMRCDST
FILES="vimrc-*"
for f in $FILES
do
    echo "Copying $f to $VIMRCDST"
    cat $f 1>>$VIMRCDST
    echo $DONE 
done

# Leave script directory
popd &>/dev/null


mkdir -p $AUTOLOAD
pushd $AUTOLOAD &>/dev/null

echo "Creating pathogen autoload"
storetobackup pathogen.vim
if wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
then
    echo $DONE
else
    echo $FAILED 
    restorefrombackup pathogen.vim "`pwd`"
fi
popd &>/dev/null

echo "Initializing bundle"
mkdir -p $BUNDLE

