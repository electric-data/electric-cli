![Status](https://img.shields.io/badge/status-alpha-red.svg)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE.md)
[![CircleCI](https://circleci.com/gh/sparse-data/sparse-cli/tree/main.svg?style=shield&circle-token=67d43361b7c2aa039a0eef39d3617a9f481e54c5)](https://circleci.com/gh/sparse-data/sparse-cli/tree/main)

# Sparse CLI

The Sparse CLI is the command line utility for the [Sparse](https://sparsedata.net) geo-distributed database hosting service. It's developed in Python and the code is published under the [MIT License](https://github.com/sparse-data/sparse-cli/blob/master/LICENSE) at [github.com/sparse-data/sparse-cli](https://github.com/sparse-data/sparse-cli).

## Develop

You can install the CLI for local development by installing the dependencies into a Python3 environment and developing the egg:

```sh
pip install -r requirements.txt
python setup.py develop
```

This will install a `sparse` binary in your local Python environment's bin folder. You can check that this is on your path with e.g.:

```sh
which sparse
```

## Usage

Run the `sparse` command without arguments or with the `--help` flag for usage information:

```sh
sparse --help
```

You can drill down into usage information for the resources / command groups and for individual commands, e.g.:

```sh
sparse auth --help
sparse auth login --help
```

Further [documentation is available on the Sparse website](https://sparsedata.net/docs).

## Test

Running the tests requires `nose` and `coverage`, included in the `maintainer-requirements.txt`.

Then, run e.g.:

```sh
nosetests --with-coverage --cover-package sparse
```
