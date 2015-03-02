#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../env.sh

COLORS=~/.vim/colors

mkdir -p $COLORS
pushd $COLORS
rm -f badwolf.vim
if wget https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim
then
        echo "Copied badwolf.vim $DONE"
else
        echo "$FAILED to copy badwolf.vim"
fi
popd
