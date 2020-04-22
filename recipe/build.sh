#!/usr/bin/env bash
set -eux

mkdir -p $PREFIX/etc/bash_completion.d;
cp etc/hub.bash_completion.sh $PREFIX/etc/bash_completion.d/hub.sh

go install -v .
