#!/bin/bash
set -e

# cd to script's directory, and then root of project
cd "$(dirname "$0")"
cd ..
cd ..
cd ..

proj_root="$(pwd)"

# STEP1: Build container
docker build -t cicero_compilers_benchmarks $proj_root/cicero_compiler_cpp/Docker

docker_scripts_dir="/app/scripts/artifact_evaluation/compare_compilers_static_stats/script_within_docker"

docker run -ti -v $proj_root:/app cicero_compilers_benchmarks /bin/bash $docker_scripts_dir/entry.sh