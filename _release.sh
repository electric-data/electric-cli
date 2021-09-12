#!/bin/sh

set -e
set -x

version=$(<VERSION)

twine upload dist/electric-cli-$version.tar.gz
