#!/bin/sh

set -e
set -x

version=$(<VERSION)

twine upload dist/electric-db-cli-$version.tar.gz
