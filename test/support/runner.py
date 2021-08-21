"""Patch test env."""

from click import testing
from sparse.main import cli

class CliRunner(testing.CliRunner):
    def __init__(self, **kwargs):
        env = {'SPARSE_IS_TESTING': str(True)}

        for key, value in kwargs.items():
            env["SPARSE_{0}".format(key.upper())] = str(value)

        super(CliRunner, self).__init__(env=env)

def invoke(*args, **kwargs):
    runner = CliRunner()

    return runner.invoke(cli, list(args), **kwargs)
