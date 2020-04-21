#!/usr/bin/env bash
set -eux

etc_conda=$PREFIX/etc/conda;
for F in activate deactivate; do
  mkdir -p $etc_conda/$F.d;
  cp -v $RECIPE_DIR/alias/$F.sh $etc_conda/$F.d/hub.sh;
done;
