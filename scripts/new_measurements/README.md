# New measurements

This folder contains scripts to generate the measurements for Cicero.

## Usage

### Data Sources

The regexes and inputs used in the benchmarks are taken from the following sources:

1. [PowerEN](https://github.com/jackwadden/ANMLZoo/tree/master/PowerEN)
2. [Brill](https://github.com/jackwadden/ANMLZoo/tree/master/Brill)
3. [Protomata](https://github.com/jackwadden/ANMLZoo/tree/master/Protomata)
4. [Dotstar](https://github.com/jackwadden/ANMLZoo/blob/master/Dotstar/)

### Preprocessing

First, we need to preprocess the benchmark inputs and regexes.

The `divide_input` folder contains the script to divide big inputs into smaller chunks, which can be loaded into Cicero's memory.

The `regex_transform` folder contains the script to filter out regexes that are not supported by Cicero, and transform the regexes into the format supported by the compiler.

The `alternate_regexes` folder contains the script that selects a subset of the regexes, and alternates N of them toghether. This is used to better benchmark multi-engine configurations.

### Benchmarking

The `measure_compiletime_compilesize` folder contains the script to measure the compile time, compile size, and code locality of the compiler for any set of regex. These should have been preprocessed by the `regex_transform` script. `plot.py` can be used to plot the results.

The `benchmark` folder contains the scripts to run the benchmarks on the board and process the results. In particular:

1. `measure.py` can execute a specified benchmark, with a specific compiler
2. `test_top.py` instead can execute sequentially many combinations of benchmarks and compilers
3. `aggregate.py` aggregates the results of the benchmarks, providing a summary of the results
4. `check_results.py` checks that the results of a benchmark are correct, by comparing each result with the results provided by the `re` python module
