#!/usr/bin/env bash
set -e

. versions.sh


for version in "${!versions[@]}"; do
    Dockerfile=versions/$version/Dockerfile
    PHPVersion="$version"

    echo "Updating $version"
    rm -rf versions/$version
    mkdir -p versions/$version
    cp -r README.md template/* versions/$version/

    sed -i \
      -e 's/{{ PHP_VERSION }}/'$PHPVersion'/g' \
      $Dockerfile
    
done
