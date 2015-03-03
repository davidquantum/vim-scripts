#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../../env.sh

echo "Installing Omnisharp.net"
pushd $BUNDLE &>/dev/null
if [ -d "omnisharp-vim" ];
then
        echo "omnisharp-vim already exists. Do you want to get the latest [y/n]?"
        read -n 1 YESNO 
fi

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

