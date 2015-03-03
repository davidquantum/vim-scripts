#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../env.sh

COLORS=~/.vim/colors

mkdir -p $COLORS
pushd $COLORS
storetobackup badwolf.vim
if wget https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim
then
        echo "$DONE"
else
        echo "$FAILED"
        restorefrombackup badwolf.vim "`pwd`"
fi
popd
