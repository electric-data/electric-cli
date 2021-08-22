#!/bin/sh

set -e
set -x

python setup.py sdist
python setup.py bdist_pex --bdist-all

pyoxidizer run
