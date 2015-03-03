#!/bin/bash

# Script directory
DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../env.sh

TEMPFILE=$TMPDIR/vimrcexisting.tmp
VIMRC2=~/.vimrc2
AUTOLOAD=~/.vim/autoload

echo "Saving old configuration to $TEMPFILE"
echo "\"OLD CONFIGURATION as of `date`" 1>$TEMPFILE
while read -r line
do
       echo "\"$line" 1>>$TEMPFILE
done < $VIMRC 
echo $DONE

# Go to script directory
pushd $DIR &>/dev/null

rm -rf $VIMRC2
FILES="vimrc-*"
for f in $FILES
do
    echo "Copying $f to $VIMRC2"
    cat $f 1>>$VIMRC2
    echo $DONE 
done

# Leave script directory
popd &>/dev/null

echo "Appending commented out old configuration to $VIMRC2"
cat $TEMPFILE 1>>$VIMRC2 
rm -rf $TEMPFILE
echo $DONE


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

