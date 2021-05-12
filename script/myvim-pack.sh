#!/bin/bash

#打包 cvim-install.tar.bz2

CURPATH=$(cd "$(dirname "$0")"; pwd)
HOMEPATH=$HOME
TMPPATH=/tmp

#echo $CURPATH
#echo $HOMEPATH
#echo $TMPPATH

cd $HOMEPATH
cp -f .vimrc .vim/cvim/vimrc
tar -cjf cvim.tar.bz2 .vim > /dev/null

mkdir -p $TMPPATH/cvim-pack
mv cvim.tar.bz2 $TMPPATH/cvim-pack
cp -f .vim/cvim/script/cvim-install.sh $TMPPATH/cvim-pack

cd $TMPPATH
tar -cjf cvim-pack.tar.bz2 cvim-pack > /dev/null

mv cvim-pack.tar.bz2 $CURPATH
rm -rf ./cvim-pack


