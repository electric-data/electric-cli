#!/bin/sh

set -e
set -x

version=$(<VERSION)

twine upload dist/electric-data-cli-$version.tar.gz
