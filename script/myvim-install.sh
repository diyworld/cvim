#!/bin/bash

#step1: You should install vim8 first
#step2: sudo apt-get install global
#step3: Run this script

CURPATH=$(cd "$(dirname "$0")"; pwd)
HOMEPATH=$HOME

echo $CURPATH
echo $HOMEPATH

#备份目录 .vim
if [ -d "$HOMEPATH/.vim" ]; then
    mv $HOMEPATH/.vim $HOMEPATH/.vim.bak
fi
tar -xjvf $CURPATH/cvim.tar.bz2 -C $HOMEPATH > /dev/null

#备份文件 .vimrc
if [ -f "$HOMEPATH/.vimrc" ]; then
    mv $HOMEPATH/.vimrc $HOMEPATH/.vimrc.bak
fi
cp $HOMEPATH/.vim/cvim/vimrc $HOMEPATH/.vimrc


