#!/bin/bash

script_dir=$(dirname "$(readlink -f "$0")")
configs_dir="$script_dir/configs"

benchmark_dir="$script_dir/../../measurements/benchmark"
TARGET_CONFIG_NAME="bench_config.py"

BENCHMARKS=(
    "micro-bench.py"
    "old-compiler.py"
    "complete-benchmarks-on-selected.py"
)

# Make sure cicero_compiler_cpp was built
ciceroc_bin="$script_dir/../../../cicero_compiler_cpp/build/ciceroc"
if [ ! -f $ciceroc_bin ]; then
    echo "$ciceroc_bin not found"
    echo "cicero_compiler_cpp must be built. Please follow latest instructions in scripts/artifact_evaluation/AE.md for building it."
    exit 1
fi

# Run the benchmarks
for benchmark in "${BENCHMARKS[@]}"; do
    echo "Running benchmark $benchmark"
    # copy the benchmark config file to the benchmark folder
    cp "$configs_dir/$benchmark" "$benchmark_dir/$TARGET_CONFIG_NAME"
    cd $benchmark_dir
    # run the benchmark
    python3 "test_top.py"
    cd $script_dir
done

echo "All benchmarks finished"

# Copy back the original config file
ORIGINAL_CONFIG="original_config.py"
cp "$configs_dir/$ORIGINAL_CONFIG" "$benchmark_dir/$TARGET_CONFIG_NAME"
