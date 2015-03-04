#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../../env.sh

echo "Installing CtrlP"
pushd $BUNDLE &>/dev/null
checkinstall "ctrlp.vim"
if [ -z $YESNO ] || [ $YESNO == "y" ]; then
        storetobackup ctrlp.vim
        git clone https://github.com/kien/ctrlp.vim.git
        echo "$DONE"
fi
popd &>/dev/null

