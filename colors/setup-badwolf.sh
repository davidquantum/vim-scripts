#!/bin/bash

DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../env.sh

COLORS=~/.vim/colors

mkdir -p $COLORS
pushd $COLORS
storetobackup badwolf.vim
if wget https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim
then
        if [ "$(uname)" == "Darwin" ]; then
                echo "Detected Mac.."
        else
                sed -i '/END_COMMON/a\
                if $TERM == "xterm-256color" || $TERM == "screen-256color" || $TERM == "xterm"\
                    set t_Co=256\
                endif' $VIMRCDST
        fi

        echo "$DONE"
else
        echo "$FAILED"
        restorefrombackup badwolf.vim "`pwd`"
fi
popd
