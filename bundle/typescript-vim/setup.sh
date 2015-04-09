#!/bin/bash
if [[ "$*" =~ .*\-\-typescript.* ]]
then

        DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
        source $DIR/../../env.sh

        echo "Installing typescript-vim"
        pushd $BUNDLE &>/dev/null
        checkinstall "typescript-vim"
        if [ -z $YESNO ] || [ $YESNO == "y" ]; then
                storetobackup typescript-vim
                git clone https://github.com/leafgarland/typescript-vim
                echo "$DONE"
                appendfiles "vimrc-*" $DIR
        fi
        popd &>/dev/null

fi
