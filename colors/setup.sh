#!/bin/bash
DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)
source $DIR/../env.sh

if [ -z $1 ]; then
        echo "Setting up default (`cat default`) color scheme"
        DEFAULT="setup-`cat default`.sh"
else
        echo "Setting up $1 color scheme"
        DEFAULT="setup-$1.sh"
fi
echo "Color scheme setup $DONE"
./$DEFAULT
