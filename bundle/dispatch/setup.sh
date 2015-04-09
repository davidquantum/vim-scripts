#!/bin/bash

if [[ "$*" =~ .*\-\-csharp.* ]]
then
        DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
        source $DIR/../../env.sh

        echo "Installing vim-dispatch"
        pushd $BUNDLE &>/dev/null
        checkinstall "vim-dispatch"
        if [ -z $YESNO ] || [ $YESNO == "y" ]; then
                storetobackup vim-dispatch
                git clone git://github.com/tpope/vim-dispatch.git
                echo "$DONE"
        fi
        popd &>/dev/null
fi
