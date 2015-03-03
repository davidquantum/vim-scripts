#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../../env.sh

echo "Installing Omnisharp.net"
pushd $BUNDLE &>/dev/null
checkinstall "omnisharp-vim"
if [ -z $YESNO ] || [ $YESNO == "y" ]; then
        storetobackup omnisharp-vim
        git clone https://github.com/OmniSharp/omnisharp-vim.git
        cd omnisharp-vim
        git submodule update --init --recursive
        cd server
        xbuild
        echo "$DONE"
fi
popd &>/dev/null

