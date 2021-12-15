#!/usr/bin/env bash
set -eux

mkdir -p $PREFIX/etc/bash_completion.d;
cp etc/hub.bash_completion.sh $PREFIX/etc/bash_completion.d/hub.sh

if [[ "$target_platform" == "osx-arm64" ]]; then  
  go build -v .
  mkdir -p ${PREFIX}/bin
  install hub ${PREFIX}/bin
fi

if [[ "$target_platform" != "osx-arm64" ]]; then
  go install -v .
fi
