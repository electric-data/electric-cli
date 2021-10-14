"""Dynamically generate the contents of the `electric-db/tap/electric-cli` brew formula."""

import pymustache
import subprocess

with open('VERSION') as f:
    version = f.read().strip()

with open('.relenv/deps.txt') as f:
    deps = f.readlines()

with open('_tap_formula.rb.tmpl') as f:
    template = f.read()

def sha_hash(file_path):
    out = subprocess.check_output(['openssl', 'dgst', '-sha256', file_path])

    return out.decode('utf-8').strip().split(' ')[-1]

def download_url(package_name, version):
    first_letter = package_name[0:1]

    return f'https://pypi.io/packages/source/{ first_letter }/{ package_name }/{ package_name}-{version}.tar.gz'

def render():
    context = {
        'version': version,
        'url': download_url('electric-db-cli', version),
        'hash': sha_hash(f'dist/electric-db-cli-{version}.tar.gz'),
        'resources': []
    }

    for dep in deps:
        if dep.startswith('electric') or dep.startswith('-e'):
            continue

        dep = dep.strip()
        dep_parts = dep.split('==')
        dep_name = dep_parts[0]
        dep_version = dep_parts[1]

        dep_url = download_url(dep_name, dep_version)
        download_path = f'./.relenv/{dep_name}'

        subprocess.run(['wget', dep_url, '-qO', download_path])
        dep_hash = sha_hash(download_path)

        resource = {
            'name': dep_name,
            'url': dep_url,
            'hash': dep_hash
        }

        context['resources'].append(resource)

    return pymustache.render(template, context).strip()

def main():
    output = render()

    print(output)

if __name__ == '__main__':
    main()
