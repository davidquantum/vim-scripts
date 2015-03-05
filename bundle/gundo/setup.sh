#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../../env.sh

echo "Installing Gundo"
pushd $BUNDLE &>/dev/null
checkinstall "gundo"
if [ -z $YESNO ] || [ $YESNO == "y" ]; then
        storetobackup gundo
        git clone http://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
        echo "$DONE"

        appendfiles "vimrc-*" $DIR
fi
popd &>/dev/null

