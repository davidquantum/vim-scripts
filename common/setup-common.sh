#!/bin/bash

# Script directory
DIR=$( pushd "$( dirname "$0" )" &>/dev/null && pwd && popd &>/dev/null)

#if [[ $0 =~ ".*-(^[\-]+).sh" ]]; then
#        SCRIPT_SUFFIX="${BASH_REMATCH[1]}"
#        echo "Found $SCRIPT_SUFFIX"
#fi

TEMPFILE=/tmp/vimrcexisting.tmp
VIMRC=~/.vimrc
VIMRC2=~/.vimrc2

rm -rf $VIMRC2

echo "\"OLD CONFIGURATION as of `date`" 1>$TEMPFILE
while read -r line
do
       echo "\"$line" 1>>$TEMPFILE
done < $VIMRC 

# Go to script directory
pushd $DIR &>/dev/null

FILES="vimrc-*"
for f in $FILES
do
    cat $f 1>>$VIMRC2
done

# Leave script directory
popd &>/dev/null

cat $TEMPFILE 1>>$VIMRC2 
rm -rf $TEMPFILE

