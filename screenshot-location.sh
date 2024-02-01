#!/bin/bash

SCREENDIR=$HOME/Documents/SCreenshots
if [ $# -ne 0 ]
then
    SCREENDIR=$1
fi
mkdir -p $SCREENDIR

defaults write com.apple.screencapture location $SCREENDIR
killall SystemUIServer
