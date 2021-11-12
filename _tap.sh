#!/bin/sh

set -e
set -x

rm -rf .relenv
virtualenv --python=/usr/local/bin/python3.9 .relenv

./.relenv/bin/pip install -r requirements.txt
./.relenv/bin/python setup.py develop
./.relenv/bin/pip freeze > .relenv/deps.txt

./venv/bin/python _tap_formula.py > .relenv/electricdb-cli.rb
mv .relenv/electricdb-cli.rb ../homebrew-tap/Formula/electric-cli.rb

rm -rf .relenv
