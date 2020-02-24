#!/usr/bin/env bash
set -e

. versions.sh

buildVersions=( "$@" )
if [ ${#buildVersions[@]} -gt 0 ]; then
    versions=()
    for buildVersion in "${buildVersions[@]}"; do
        versions[$buildVersion]=1;
    done
fi

#echo ${!versions[@]};exit;

for version in "${!versions[@]}"; do
    tag=`date +%F`
    #time docker pull php:$version-fpm
    time docker build --pull --tag phpfpm-ffmpeg-$version:$tag versions/$version | tee tmp/build-$version.log
    time docker tag phpfpm-ffmpeg-$version:$tag phpfpm-ffmpeg-$version:latest
done
