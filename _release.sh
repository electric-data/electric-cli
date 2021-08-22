#!/bin/sh

set -e
set -x

version=$(<VERSION)

twine upload dist/sparse-cli-$version.tar.gz
