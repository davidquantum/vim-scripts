#!/bin/bash
DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../env.sh

if [ -z $1 ]; then
        echo "Setting up default (`cat default`) color scheme"
        SCHEME=`cat default`
else
        echo "Setting up $1 color scheme"
        SCHEME=$1
fi

DEFAULT="setup-$SCHEME.sh"
./$DEFAULT

echo "Color scheme setup $DONE"
sed -i '' "/END_COMMON/a\\
colorscheme $SCHEME\\
" $VIMRCDST
