# Artifact Evaluation

## Abstract

This document provides all the information about the artifact to reproduce the main findings of the paper and potentially modify the proposed work for further experiments. The SW/HW setup comprehends two different environments to reproduce all the main results. The x86 machine is used for experiments on the compilation flow (i.e., average compilation time, code size, code locality) and bitstream generation (i.e., FPGA resource usage and total on-chip power). A Docker container is provided with all the dependencies installed to reproduce the result on the compilation, simplifying the procedure. Then, the Ultra96-V2 board is essential to execute the REs benchmarks on the different architecture implementations and reproduce the relative results (i.e., average runtime to match a RE and average energy used to match a RE).

## Artifact check-list (meta-information)

- Compilation: C++, CMAKE, LLVM/MLIR 16, Antlr4, bash
- Data set: [Automatazoo](https://github.com/tjt7a/AutomataZoo)
- Run-time environment: Python3, PYNQ 3.0.1
- Hardware: Ultra96-v2 FPGA board; x86 Machine
- Metrics: average compilation time (microsecond), code locality, average code size, FPGA resource usage (\%), total on-chip power (W), average runtime to match a RE (microsecond), average energy used to match a RE (Wmicrosecond)
- Output: textual tables and PNG figure
- Experiments: Replicate Figures 8, 9, 10, 11, 12, 13, 14, 15; Table 5
- How much disk space required (approximately)?: 5GB
- How much time is needed to prepare workflow (approximately)?: 30 min
- How much time is needed to complete experiments (approximately)?: 48 hours
- Publicly available?: Yes
- Code licenses (if publicly available)?: MIT License
- Data licenses (if publicly available)?: Refer to single benchmarks licenses
- Archived (provide DOI)?: 10.5281/zenodo.13345346

## Description

### How delivered

Available on Github at [https://github.com/necst/cicero](https://github.com/necst/cicero); Zenodo at [https://doi.org/10.5281/zenodo.13345346](https://doi.org/10.5281/zenodo.13345346)

### Hardware dependencies

Two hardware devices are needed:

1. x86 Machine to evaluate code size, compilation time, and code locality metrics of **OLD** and **NEW** compilers.
2. Avnet Ultra96-V2 FPGA board to execute RE benchmarks on the evaluated **OLD** and **NEW** Cicero architectures.

### Software dependencies

1. **x86 Machine**: (Required for comparison of static compilers metrics) Ubuntu 22.04, Docker. (Optional, only to build bitstreams) Vivado 2019.2, python3, zip, and unzip. For simplicity, the comparison of static compilers metrics is automated within a provided Docker container. Otherwise, dependencies can be installed manually in a Ubuntu 22.04 host by running the commands within `cicero_compiler_cpp/Docker/Dockerfile`. Dependencies include g++, CMAKE, LLVM/MLIR 16, Antlr4; and some python libraries: rich, tqdm, matplotlib, ply.
2. **Avnet Ultra96-V2 FPGA board**: PYNQ image version 3.0.1; g++, CMAKE, LLVM/MLIR 16, Antlr4; Python dependencies: rich, tqdm, matplotlib.

### Data sets

[Automatazoo](https://github.com/tjt7a/AutomataZoo). Data sets are already included with the rest of the provided artifact. They both enclose the REs to execute and the data to analyze.

## Installation

### x86 Machine

This setup is based on a Docker container to simplify the evaluation process. Follow [https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/) for instruction regarding Docker installations on the evaluation machine. Then, use the following command to clone the code repository and its submodules:

```bash
git clone --recursive https://github.com/necst/cicero
```

### Ultra96 v2 FPGA

Pre-build PYNQ images are available from the [official website](https://www.pynq.io/boards.html). Instruction to load the image on the SD card are available in the [official documentation](https://pynq.readthedocs.io/en/latest/appendix/sdcard.html?highlight=image%20). For further information on the board usage refer to the [official guide](https://ultra96-pynq.readthedocs.io/en/latest/index.html). Once the board is powered on, clone the code repository and install required python dependencies:

```bash
git clone --recursive https://github.com/necst/cicero
pip install rich==11.2.0 tqdm==4.64.0 matplotlib==3.5.1

# Install C++ dependencies
mkdir -p /etc/apt/sources.list.d
apt-get update && apt-get install -y ca-certificates gnupg
apt-key adv --recv-key --keyserver keyserver.ubuntu.com 15CF4D18AF4F7421
echo 'deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-16 main' > /etc/apt/sources.list.d/llvm.list
apt-get update && apt-get install -y libmlir-16-dev mlir-16-tools llvm-16-dev antlr4 libantlr4-runtime-dev cmake clang-16
```

## Experiment workflow

### x86 Machine

To replicate Figures 8, 9, 10, 11, 12, 13, 14, 15 and Table 5, an automatic script which executes benchmarks in a Docker container is provided, and can be executed as follows:

```bash
sudo bash scripts/artifact_evaluation/compare_compilers_static_stats/run_benchmarks.sh
```

Results are both printed to console as raw textual tables and plotted to PNG files in `scripts/artifact_evaluation/compare_compilers_static_stats/script_within_docker/fig*.png`.

Pre-built `bitstreams` are provided in the `bitstreams` folder together with the FPGA resource usage and total on-chip power to reproduce Figures 8 and 9 raw data (i.e., `bitstreams/cicero_confs_usage_power.CSV`), simplifying the reproduction process. Optionally, `bitstreams` can be generated from source. An automatic script generates the `bitstreams`, extracts the static metrics (i.e., board usage and total on-chip power), and, finally, puts the generated files in the `bitstreams` folder. The script can be executed as follows:

```bash
bash scripts/artifact_evaluation/generate_bitstreams_and_extract_metrics.bash
```

Note that before running the synthesis script, Python variables in `scripts/synth/synth.py` should be updated. In particular, `VIVADO_SOURCE` must be changed with the current Vivado installation path; and `MAX_WORKERS` can be changed if you want to run multiple `bitstream` generations in parallel.

### Avnet Ultra96-V2 FPGA board

The first step is building the compiler:

```bash
cd cicero_compiler_cpp
mkdir build
cd build
cmake .. -DBUILD_TESTING=OFF -DCMAKE_CXX_COMPILER=$(which clang++-16) -DMLIR_DIR=/usr/lib/llvm-16/lib/cmake/mlir
cmake --build .
```

To replicate Figures 10, 11, 12, 13, 14, 15 and Table 5, you first need to run all the required benchmarks. An automated script is provided, it schedules in batches all the benchmarks and saves the results in CSV files. The script must be run as root:

```bash
sudo bash scripts/artifact_evaluation/benchmarks/run_all_benchmarks.sh
```

Once all the benchmarks are completed, a script is provided to automatically aggregate the intermediate results:

```bash
python3 scripts/artifact_evaluation/benchmarks/aggregate_benchmarks_results.py
```

Results are plotted as PNG images in `scripts/artifact_evaluation/benchmarks/fig*.png` (Figures 10, 11, 12, 13, 14, 15) and to console as raw textual tables (Table 5).

## Evaluation and expected result

All the results are printed as raw textual tables, and some are plotted as graphs in PNG images for better visualization of the trends. Compilation times can differ based on the CPU used, but general trends can be reproduced. RE-matching on the FPGA should have near-identical processing times thanks to the stability of the hardware environment. If bitstreams are re-generated from source, board usages and total on-chip power may vary slightly due to inherent randomness in the synthesis process.

## Methodology

Submission, reviewing and badging methodology:

- [http://cTuning.org/ae/submission-20190109.html](http://cTuning.org/ae/submission-20190109.html)
- [http://cTuning.org/ae/reviewing-20190109.html](http://cTuning.org/ae/reviewing-20190109.html)
- [https://www.acm.org/publications/policies/artifact-review-badging](https://www.acm.org/publications/policies/artifact-review-badging)

