# New measurements

This folder contains scripts to generate the measurements for Cicero.

## Usage

We suggest using `collect_re_inputs.sh` to download the benchmarks and preprocess them automatically.

Alternatively, manually download them and run the preprocessing scripts listed below. Example usages are provided in `collect_re_inputs.sh`, otherwise you can run the scripts with no arguments to see the usage.

### Data Sources

The regexes and inputs used in the benchmarks are taken from the following sources:

1. Brill
    - [Inputs](https://github.com/tjt7a/AutomataZoo/raw/master/Brill/code/input.txt)
    - [Regexes](https://raw.githubusercontent.com/tjt7a/AutomataZoo/master/Brill/code/regex.txt)
2. Protomata
    - [Inputs](https://github.com/tjt7a/AutomataZoo/raw/master/Protomata/benchmarks/inputs/30k_prots.input)
    - [Regexes](https://github.com/tjt7a/AutomataZoo/raw/master/Protomata/code/protomata_noslash.regex)

### Preprocessing

First, we need to preprocess the benchmark inputs and regexes.

The `divide_input` folder contains the script to divide big inputs into smaller chunks, which can be loaded into Cicero's memory.

The `regex_transform` folder contains the script to filter out regexes that are not supported by Cicero, and transform the regexes into the format supported by the compiler.

The `alternate_regexes` folder contains the script that selects a subset of the regexes, and alternates N of them toghether. This is used to better benchmark multi-engine configurations.

### Benchmarking

The `measure_compiletime_compilesize` folder contains the script to measure the compile time*, compile size, and code locality of the compiler for any set of regex. These should have been preprocessed by the `regex_transform` script. `plot.py` can be used to plot the results.

The `benchmark` folder contains the scripts to run the benchmarks on the board and process the results. In particular:

1. `measure.py` can execute a specified benchmark, with a specific compiler
2. `test_top.py` instead can execute sequentially many combinations of benchmarks and compilers
3. `aggregate.py` aggregates the results of the benchmarks, providing a summary of the results
4. `check_results.py` checks that the results of a benchmark are correct, by comparing each result with the results provided by the `re` python module

*Compile time for the C++ compilers are very pessimistic, since a new process is spawned for each compilation, while the Python compiler is used as a module. For a more accurate compile time of the C++ compiler, use its own internal benchmark (`ciceroc-measure`)