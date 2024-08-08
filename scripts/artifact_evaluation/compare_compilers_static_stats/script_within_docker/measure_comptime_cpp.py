import os
import subprocess
import csv
import tqdm

OUTPUT_FILENAME = "compiletime_new_compiler.csv"

script_path = os.path.dirname(os.path.realpath(__file__))
proj_path = os.path.abspath(os.path.join(script_path, os.pardir, os.pardir, os.pardir, os.pardir))

ciceroc_measure_path = os.path.join(proj_path, "cicero_compiler_cpp", "build", "ciceroc-measure")

benchmarks_dir = os.path.join(proj_path, "scripts", "measurements", "benchmark", "REs")

BENCHMARKS = [
    ("protomata", "autozoo_protomata.regex"),
    ("brill", "autozoo_brill.regex"),
    ("protomata4", "autozoo_protomata4.regex"),
    ("brill4", "autozoo_brill4.regex"),
]

def run_ciceroc_measure(benchmark: str, opt_enabled: bool) -> int:
    benchmark_path = os.path.join(benchmarks_dir, benchmark)
    cmd = [ciceroc_measure_path, benchmark_path, str(opt_enabled)]
    output = subprocess.check_output(cmd).decode("utf-8")
    return int(output.split("\n")[0])

if __name__ == '__main__':
    # Warmup run on all benchmarks with and without optimizations
    for _, benchmark in tqdm.tqdm(BENCHMARKS, desc='Warming up'):
        run_ciceroc_measure(benchmark, False)
        run_ciceroc_measure(benchmark, True)

    # Create a CSV file for writing the results
    benchmark_and_opts = []
    for bench_name, bench_file in BENCHMARKS:
        for opt_enabled in [False, True]:
            benchmark_and_opts.append((bench_name, bench_file, opt_enabled))
    with open(OUTPUT_FILENAME, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(['benchmark', 'opt_enable', 'avg_time'])

        # For each benchmark/opt_enable, do 10 runs and get the average
        for bench_name, bench_file, opt_enabled in tqdm.tqdm(benchmark_and_opts, desc='Measuring'):
            total_time = 0
            for _ in range(10):
                total_time += run_ciceroc_measure(bench_file, opt_enabled)
            avg_time = total_time / 10

            # Write the results to the CSV file
            writer.writerow([bench_name, opt_enabled, avg_time])
