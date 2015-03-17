#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/env.sh

if [ "$1" == "--help" ]
then
        echo "Installs common helpful packages and corresponding .vimrc"
        echo "Allowed arguments are:"
        echo "--help    -  shows this screen"
        echo "--csharp  -  in addition to basic packages adds also C# and Omnisharp support"
        echo "--clean   -  only cleans all existing packages from .vim and .vimrc"
        exit 0
else
        echo "Cleaning all existing vim settings. A backup is made to $TMPDIR. you want to continue [y/n]?"
        read -n 1 YESNO 
        if [ "$YESNO" == "n" ]
        then
                exit 0
        fi

        rm -rf $TMPDIR
        storetobackup $BUNDLE
        storetobackup $VIMRC

        if [ "$1" == "--clean" ]
        then
                exit 0
        fi

        ./common/setup.sh
        ./colors/setup.sh

        if [ "$1" == "--csharp" ]; then

                ./bundle/omnisharp/setup.sh
                ./bundle/vim-csharp/setup.sh
                ./bundle/dispatch/setup.sh
        fi

        ./bundle/ctrlp/setup.sh
        ./bundle/gundo/setup.sh
        ./bundle/nerdtree/setup.sh
        ./bundle/airline/setup.sh
fi




