'''
    This script is meant to run benchmarks for Cicero.
    Provide below:
        - A folder containing the bitstreams
        - List of bitstreams to use
        - A list of benchmarks to run (inputs, and regexes files: one per line)
        - A list of compilers to use

    Saves the results in a csv file alongside each bitstream file, appending the benchmark and compiler names.
'''

import os
import sys
import measure
import time
import csv
from rich.console import Console
from rich.table import Table

from bench_config import BENCHMARKS, BITSTEAM_FOLDER, BITSTREAMS, COMPILERS, INPUT_COUNT, REGEX_COUNT

# Before starting, make sure all the compilers paths are correct, and all input files are correct
def check_script_arguments() -> bool:
    # Check benchmark files exist
    for (_, benchmark_input, benchmark_regexes) in BENCHMARKS:
        if not os.path.isfile(benchmark_input):
            print(f"File {benchmark_input} does not exist")
            return False
        if not os.path.isfile(benchmark_regexes):
            print(f"File {benchmark_regexes} does not exist")
            return False

    # Check compilers exist
    for (_, compiler_path) in COMPILERS:
        sys.path.append(compiler_path)
        try:
            import re2compiler
        except ImportError:
            print(f'Could not import cicero compiler from {compiler_path}')
            return False
        # Try a little compilation
        try:
            re2compiler.compile(data='this|that', O1=True)
        except Exception as e:
            print('???? Could not compile a simple regex ????')
            print(e)
            return False
        sys.path.pop()
        del re2compiler
        del sys.modules['re2compiler']

    # Check bitstreams exist
    for bitstream_file in BITSTREAMS:
        if not bitstream_file.endswith('.bit'):
            print(f"Bitstream file '{bitstream_file}' does not end with .bit")
            return False
        bitstream_file_path = os.path.join(BITSTEAM_FOLDER, bitstream_file)
        bitstream_metadata_file_path = os.path.join(
            BITSTEAM_FOLDER, bitstream_file.replace('.bit', '.hwh'))
        if not os.path.isfile(bitstream_file_path):
            print(f"File {bitstream_file_path} does not exist")
            return False
        if not os.path.isfile(bitstream_metadata_file_path):
            print(f"File {bitstream_metadata_file_path} does not exist")
            return False

    return True


def print_summary():
    # Print all the combinations of benchmarks, compilers, and bitstreams
    table = Table(title="Benchmarks")
    table.add_column('Name', style="bold")
    table.add_column("Compiler", style="cyan")
    table.add_column("Architecture", style="magenta")
    for (compiler_name, _) in COMPILERS:
        for (benchmark_name, _, __) in BENCHMARKS:
            for filename in BITSTREAMS:
                if not filename.endswith('.bit'):
                    continue
                table.add_row(benchmark_name, compiler_name, filename)
    console = Console()
    console.print(table)
    console.print(f'REGEX_COUNT: {REGEX_COUNT}; INPUT_COUNT: {INPUT_COUNT}')


def main():
    # Check user is root
    if os.geteuid() != 0:
        print("Please run as root")
        quit(1)
    if not check_script_arguments():
        print("Fix script arguments before running")
        quit(1)

    print_summary()
    print("Starting in 10 seconds...")
    sys.stdout.flush()
    time.sleep(10)
    measure_timings_file = open('measure_timings.csv', 'w')
    measure_timings_csv_writer = csv.writer(measure_timings_file)
    total_benchmarks_run = len(BITSTREAMS) * len(BENCHMARKS) * len(COMPILERS)
    benchmarks_executed = 0
    for (compiler_name, compiler_path) in COMPILERS:
        sys.path.append(compiler_path)
        try:
            import re2compiler
        except ImportError:
            print(
                f'???? Could not import cicero compiler from {compiler_path} ???? Should have caught this earlier. Skipping this compiler.')
            sys.path.pop()
            continue

        for benchmark_name, benchmark_strfile, benchmark_regfile in BENCHMARKS:
            for filename in BITSTREAMS:
                if not filename.endswith('.bit'):
                    print(f"???? Skipping {filename} because it does not end with .bit ???? Should have caught this earlier. Skipping this bitstream.")

                bitstream_file = os.path.join(BITSTEAM_FOLDER, filename)

                def compiler_callback(regex):
                    return re2compiler.compile(data=regex, O1=True)

                benchmarks_executed += 1
                print("Running {0} with {1} on {2}. {3}/{4}".format(
                    benchmark_name, compiler_name, bitstream_file, benchmarks_executed, total_benchmarks_run))
                start_time = time.time()
                measure.measure_catch_ctrl_c(
                    progress_message="{0}-{1}-{2}({3}/{4})".format(
                        benchmark_name, compiler_name, filename, benchmarks_executed, total_benchmarks_run),
                    bitstream_file_path=bitstream_file,
                    strings_file_path=benchmark_strfile,
                    regexes_file_path=benchmark_regfile,
                    output_file_path=bitstream_file.replace(
                        '.bit', f"_{benchmark_name}_{compiler_name}_{REGEX_COUNT}.csv"),
                    compile_callback=compiler_callback,
                    regexes_count=REGEX_COUNT,
                    inputs_count=INPUT_COUNT
                )
                end_time = time.time()
                measure_timings_csv_writer.writerow(
                    [benchmark_name, compiler_name, filename, time.strftime("%H:%M:%S", time.gmtime(end_time - start_time))])
                measure_timings_file.flush()

        # Release compiler
        sys.path.pop()
        del re2compiler
        del sys.modules['re2compiler']

    measure_timings_file.close()

if __name__ == '__main__':
    main()
