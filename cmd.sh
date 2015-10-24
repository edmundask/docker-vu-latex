#!/bin/sh

exec docker run --rm -i -v $PWD:/data edmundask/vu-latex "$@"
