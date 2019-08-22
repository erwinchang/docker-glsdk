#!/bin/bash

export PATH=${PATH}:/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin
export TT_DWORK=${WORK_DIR}

alias dwork='cd ${WORK_DIR}'
echo ""
echo "command list"
echo "dwork: cd workspace dir"
echo ""
dwork
