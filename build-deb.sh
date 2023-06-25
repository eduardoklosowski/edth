#!/bin/bash -eux

# Config

source config


# Clean

rm -rf output/deb


# Build

mkdir -p output/deb/DEBIAN
envsubst < deb-control > output/deb/DEBIAN/control

mkdir -p output/deb/usr/share/themes
cp -r EdTh output/deb/usr/share/themes

dpkg-deb --root-owner-group -Zxz -z9 -Sextreme --build output/deb output
