#!/bin/bash
#has to be executed with source in order to set LD_LIBRARY_PATH variable 
# to locate .so
LD_LIBRARY_PATH=/usr/local/lib/
export LD_LIBRARY_PATH
g++ test_re2.cpp -o test_re2.o -lre2