#!/usr/bin/env bash

# Prepare GOPATH layout for build:
# https://github.com/github/hub/issues/1779
export GOPATH=`pwd`
mkdir -p src/github.com/github
ln -s `pwd` src/github.com/github/hub

set windows=
if [[ $OS == Windows* ]]; then
    windows=1
    export PATH=${LIBRARY_BIN}:$PATH
else
    export GOPATH=${SRC_DIR}
fi
pushd $GOPATH/src/github.com/github/hub

script/build
chmod +x script/install.sh

export prefix=$PREFIX
if [ ! -z ${windows} ]; then
   mkdir -p $LIBRARY_BIN
   cp bin/hub.exe $LIBRARY_BIN
else
   mkdir -p $PREFIX/bin
   cp bin/hub $PREFIX/bin

   for i in activate deactivate; do
       mkdir -p $PREFIX/etc/conda/${i}.d
       cp $RECIPE_DIR/${i}.sh $PREFIX/etc/conda/${i}.d/${PKG_NAME}.sh
   done
fi
