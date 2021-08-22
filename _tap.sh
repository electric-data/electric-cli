#!/bin/sh

set -e
set -x

rm -rf .relenv
virtualenv --python=/usr/local/bin/python3.9 .relenv

./.relenv/bin/pip install -r requirements.txt
./.relenv/bin/python setup.py develop
./.relenv/bin/pip freeze > .relenv/deps.txt

python _tap_formula.py > .relenv/sparse-cli.rb
mv .relenv/sparse-cli.rb ../homebrew-tap/Formula/sparse-cli.rb

rm -rf .relenv
