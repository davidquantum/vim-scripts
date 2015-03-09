#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../../env.sh

echo "Installing nerdtree"
pushd $BUNDLE &>/dev/null
checkinstall "nerdtree"
if [ -z $YESNO ] || [ $YESNO == "y" ]; then
        storetobackup nerdtree
        git clone https://github.com/scrooloose/nerdtree.git
        echo "$DONE"

        appendfiles "vimrc-*" $DIR
fi
popd &>/dev/null

