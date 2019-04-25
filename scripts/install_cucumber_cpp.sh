#!/bin/bash

set -u
set -e

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


CUCUMBER_INSTALL_DIR="$THIS_SCRIPT_DIR/../third-party/install/cucumber-cpp"
CUCUMBER_SOURCE_DIR="$THIS_SCRIPT_DIR/../third-party/cucumber-cpp"

mkdir -p "$CUCUMBER_INSTALL_DIR"

cd "$CUCUMBER_SOURCE_DIR"

git submodule init
git submodule update

rm -rf build
mkdir build
cd build

cmake -DCUKE_ENABLE_EXAMPLES=ON \
      -DCMAKE_INSTALL_PREFIX=$CUCUMBER_INSTALL_DIR \
      -DBUILD_SHARED_LIBS=ON \
      -DCUKE_DISABLE_BOOST_TEST=ON \
      -DCUKE_DISABLE_E2E_TESTS=ON \
      -DCUKE_DISABLE_GTEST=ON \
      -DCUKE_DISABLE_QT=ON \
      -DCUKE_ENABLE_EXAMPLES=ON \
      ..

make -j4
make -j4 test

make -j4 install

