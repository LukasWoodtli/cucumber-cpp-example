#!/bin/bash

set -u
set -e

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$THIS_SCRIPT_DIR/.."

rm -rf build
mkdir build
cd build
cmake ..
make -j4

./CalculatorSteps &
cucumber ../features

