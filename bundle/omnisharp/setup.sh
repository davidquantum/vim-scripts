#!/bin/bash

if [[ "$*" =~ .*\-\-csharp.* ]]
then
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

                if [[ "$*" =~ .*\-\-roslyn.* ]]
                then
                        pushd omnisharp-roslyn &>/dev/null
                        ./build.sh
                        popd &>/dev/null
                        popd &>/dev/null
                        appendfiles "roslyn" $DIR

                else
                        pushd server &>/dev/null
                        xbuild
                        popd &>/dev/null
                        popd &>/dev/null
                        appendfiles "legacy" $DIR
                fi
                echo "$DONE"
                appendfiles "vimrc-*" $DIR
        fi
        popd &>/dev/null
fi

