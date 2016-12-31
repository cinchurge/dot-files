#! /bin/bash

set -vex

mydir=$(/bin/pwd -P)

ln -sf $mydir/.vimrc ~/.vimrc
ln -sf $mydir/.bashrc ~/.bashrc
