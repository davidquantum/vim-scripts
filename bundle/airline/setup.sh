#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../../env.sh

echo "Installing vim-airline"
pushd $BUNDLE &>/dev/null
checkinstall "vim-airline"
if [ -z $YESNO ] || [ $YESNO == "y" ]; then
        storetobackup vim-airline 
        git clone https://github.com/bling/vim-airline
        echo "$DONE"

        appendfiles "vimrc-*" $DIR
fi
popd &>/dev/null

