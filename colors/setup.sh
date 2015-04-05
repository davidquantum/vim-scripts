#!/bin/bash
DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../env.sh

pushd $DIR &>/dev/null
if [ -z $1 ]; then
        echo "Setting up default (`cat default`) color scheme"
        SCHEME=`cat default`
else
        echo "Setting up $1 color scheme"
        SCHEME=$1
fi


if [ "$(uname)" == "Darwin" ]; then
        sed -i '' "/END_COMMON/a\\
        colorscheme $SCHEME\\
        " $VIMRCDST
else
        sed -i "/END_COMMON/a\
                colorscheme $SCHEME" $VIMRCDST

fi

DEFAULT="setup-$SCHEME.sh"
./$DEFAULT

echo "Color scheme setup $DONE"

popd $DIR &>/dev/null
