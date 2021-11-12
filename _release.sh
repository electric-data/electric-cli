#!/bin/sh

set -e
set -x

version=$(<VERSION)

twine upload dist/electricdb-cli-$version.tar.gz
