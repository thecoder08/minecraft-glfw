#!/bin/bash
set -e
rm -rf minecraft-wayland-one-nineteen
wget https://github.com/DanShaders/minecraft-wayland/archive/refs/heads/one-nineteen.zip
unzip one-nineteen.zip
rm one-nineteen.zip
cd minecraft-wayland-one-nineteen
wget https://github.com/glfw/glfw/archive/3eaf1255b29fdf5c2895856c7be7d7185ef2b241.tar.gz
tar -xvf 3eaf1255b29fdf5c2895856c7be7d7185ef2b241.tar.gz
rm 0008-Wayland-Add-support-for-wp_fractional_scale_v1.patch
srcdir=$(pwd)
. PKGBUILD
prepare
build
cd "$srcdir/glfw-$_pkggit"/build-wayland
make -j $(nproc)
echo GLFW built in "$srcdir/glfw-$_pkggit"/build-wayland/src/libglfw.so.3.4
