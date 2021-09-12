#!/bin/sh

set -e
set -x

rm -rf .relenv
virtualenv --python=/usr/local/bin/python3.9 .relenv

./.relenv/bin/pip install -r requirements.txt
./.relenv/bin/python setup.py develop
./.relenv/bin/pip freeze > .relenv/deps.txt

python _tap_formula.py > .relenv/electric-cli.rb
mv .relenv/electric-cli.rb ../homebrew-tap/Formula/electric-cli.rb

rm -rf .relenv
