#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../../env.sh

echo "Installing vim-csharp"
pushd $BUNDLE &>/dev/null
checkinstall "vim-csharp"
if [ -z $YESNO ] || [ $YESNO == "y" ]; then
        storetobackup vim-csharp 
        git clone git://github.com/OrangeT/vim-csharp.git
        echo "$DONE"

        appendfiles "vimrc-*" $DIR
fi
popd &>/dev/null

