#!/usr/bin/env bash
set -ex

. versions.sh

buildVersions=( "$@" )
if [ ${#buildVersions[@]} -gt 0 ]; then
    versions=()
    for buildVersion in "${buildVersions[@]}"; do
        versions[$buildVersion]=1;
    done
fi

TMPBUILD=tmp/build
tag=`date +%F`
rm -rdf $TMPBUILD
mkdir -p $TMPBUILD
for version in "${!versions[@]}"; do
    PHPVersion="$version"
    cp -rav versions/$version/* $TMPBUILD/
    sed -i -e "1s|.*|FROM phpfpm-$PHPVersion|" $TMPBUILD/Dockerfile
    time docker build --tag phpfpm-ffmpeg-$version:$tag $TMPBUILD | tee tmp/build-$version.log
    time docker tag phpfpm-ffmpeg-$version:$tag phpfpm-ffmpeg-$version:latest
done
