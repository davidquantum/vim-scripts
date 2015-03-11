#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../../env.sh

echo "Installing Omnisharp.net"
pushd $BUNDLE &>/dev/null
checkinstall "omnisharp-vim"
if [ -z $YESNO ] || [ $YESNO == "y" ]; then
        storetobackup omnisharp-vim
        git clone https://github.com/OmniSharp/omnisharp-vim.git
        pushd omnisharp-vim &>/dev/null
        git submodule update --init --recursive
        pushd server &>/dev/null
        xbuild
        popd &>/dev/null
        popd &>/dev/null

        echo "$DONE"

        appendfiles "vimrc-*" $DIR
fi
popd &>/dev/null

