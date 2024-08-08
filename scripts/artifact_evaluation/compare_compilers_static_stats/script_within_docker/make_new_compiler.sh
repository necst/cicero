#!/bin/bash
set -e

# Assume repo to be cloned here
proj_root=/app

# cd to cicero_compiler_cpp directory
cd $proj_root/cicero_compiler_cpp
mkdir build -p
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=$(which clang++-16) -DMLIR_DIR=/usr/lib/llvm-16/lib/cmake/mlir
cmake --build .