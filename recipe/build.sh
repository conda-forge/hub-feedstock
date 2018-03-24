#!/usr/bin/env bash

set windows=
if [[ $OS == Windows* ]]; then
    windows=1
    export PATH=${LIBRARY_BIN}:$PATH
fi

script/build
chmod +x script/install.sh

export prefix=$PREFIX
if [ ! -z ${windows} ]; then
   cp bin/hub.exe $LIBRARY_BIN
else
   cp bin/hub $PREFIX/bin

   for i in activate deactivate; do
       mkdir -p $PREFIX/etc/conda/${i}.d
       cp $RECIPE_DIR/${i}.sh $PREFIX/etc/conda/${i}.d/${PKG_NAME}.sh
   done
fi
