'''
    This script is used to aggregate the results of all the benchmarks into tables,
    as to reproduce the results in the paper.
'''

import os
import sys
import csv
from rich.console import Console
from rich.table import Table

script_dir = os.path.dirname(os.path.realpath(__file__))

sys.path.append(os.path.join(script_dir, '..', '..', '..',
                'scripts', 'measurements', 'benchmark'))
from aggregate import aggregate_result  # nopep8

map_arcs_conf_to_clock_freq = {
    'OLD 1x1': 150,
    'OLD 1x4': 150,
    'OLD 1x9': 150,
    'OLD 1x16': 150,
    'OLD 1x32': 150,
    'NEW 8x1': 150,
    'NEW 8x4': 150,
    'NEW 8x9': 150,
    'NEW 8x16': 150,
    'NEW 16x1': 150,
    'NEW 16x4': 150,
    'NEW 16x9': 100,
    'NEW 32x1': 150,
    'NEW 32x4': 100,
}

COMPILER_NAME_OLD = 'OLD_PYT'
COMPILER_NAME_NEW = 'NEW_CPP'

BENCHMARKS = [
    'protomata',
    'brill',
    'protomata4',
    'brill4',
]

MICRO_BENCHMARKS_REs_COUNT = 100
MICRO_BENCHMARKS_COMPILERS = [
    COMPILER_NAME_NEW,
]
MICRO_BENCHMARKS_ARCS_CONFIGURATIONS = [
    'OLD 1x1',
    'OLD 1x4',
    'OLD 1x9',
    'OLD 1x16',
    'OLD 1x32',
    'NEW 8x1',
    'NEW 8x4',
    'NEW 8x9',
    'NEW 8x16',
    'NEW 16x1',
    'NEW 16x4',
    'NEW 16x9',
    'NEW 32x1',
    'NEW 32x4',
]

OLD_COMPILER_BENCHMARKS_REs_COUNT = 200
OLD_COMPILER_BENCHMARKS_COMPILERS = [
    COMPILER_NAME_OLD,
    COMPILER_NAME_NEW,
]
OLD_COMPILER_BENCHMARKS_ARCS_CONFIGURATIONS = [
    'OLD 1x9',
    'OLD 1x16',
]

COMPLETE_BENCHMARKS_REs_COUNT = 200
COMPLETE_BENCHMARKS_COMPILERS = [
    COMPILER_NAME_NEW,
]
COMPLETE_BENCHMARKS_ON_SELECTED_ARCS_CONFIGURATIONS = [
    'OLD 1x9',
    'OLD 1x16',
    'NEW 8x1',
    'NEW 16x1',
    'NEW 32x1',
]


def get_csv_name(arc_name, benchmark_name, compiler_name, REs_count):
    return f'{arc_name}_{benchmark_name}_{compiler_name}_{REs_count}.csv'


def check_benchmark_results_existance(results_dir, arcs_configuration, REs_count, compilers):
    all_results_exist = True
    for benchmark in BENCHMARKS:
        for arc_conf in arcs_configuration:
            for compiler_name in compilers:
                benchmark_csv_path = os.path.join(
                    results_dir, get_csv_name(arc_conf, benchmark, compiler_name, REs_count))
                if not os.path.exists(benchmark_csv_path):
                    print(f'{benchmark_csv_path} does not exist.')
                    all_results_exist = False

    return all_results_exist


def aggregate_results_for_benchmarks_suite(map_arcs_conf_to_power, results_dir, suite_name, arcs_configurations, REs_count, compilers):
    if not check_benchmark_results_existance(results_dir, arcs_configurations, REs_count, compilers):
        print('Some benchmark results are missing for this suite, skipping.')
        return

    table = Table(title=suite_name)
    table.add_column("Benchmark", style="bold")
    table.add_column('Arc Conf', style="purple")
    table.add_column("Compiler", style="cyan")
    table.add_column("AVG µs/RE", style="magenta")
    table.add_column("AVG Wµs/RE", style="red")

    for benchmark in BENCHMARKS:
        for arc_conf in arcs_configurations:
            for compiler_name in compilers:
                benchmark_csv_path = os.path.join(
                    results_dir, get_csv_name(arc_conf, benchmark, compiler_name, REs_count))
                file_path, total_sum, avg_cc_re, total_timeout, total_fifo_full, other_errors, match_success_count, total_rows = aggregate_result(
                    benchmark_csv_path)
                avg_time_re = avg_cc_re / map_arcs_conf_to_clock_freq[arc_conf]
                avg_energy_re = avg_time_re * map_arcs_conf_to_power[arc_conf]
                table.add_row(benchmark, arc_conf, compiler_name,
                              str(avg_time_re), str(avg_energy_re))

    console = Console()
    console.print(table)


def aggregate_print_table_for_microbench(map_arcs_conf_to_power, results_dir):
    table = Table(
        title="[Table 5] Average energy per RE execution (Wµs) for each micro-benchmark and architecture configuration, and overall average.")
    table.add_column("Configuration", style="bold")
    table.add_column('PROTOMATA', style="magenta")
    table.add_column("BRILL", style="cyan")
    table.add_column("PROTOMATA4", style="magenta")
    table.add_column("BRILL4", style="red")
    table.add_column("AVG", style="purple")

    for arc_conf in MICRO_BENCHMARKS_ARCS_CONFIGURATIONS:
        cur_row_total_energy = 0
        new_row = [arc_conf]
        for benchmark in BENCHMARKS:
            benchmark_csv_path = os.path.join(
                results_dir, get_csv_name(arc_conf, benchmark, MICRO_BENCHMARKS_COMPILERS[0], MICRO_BENCHMARKS_REs_COUNT))
            file_path, total_sum, avg_cc_re, total_timeout, total_fifo_full, other_errors, match_success_count, total_rows = aggregate_result(
                benchmark_csv_path)
            avg_time_re = avg_cc_re / map_arcs_conf_to_clock_freq[arc_conf]
            avg_energy_re = avg_time_re * map_arcs_conf_to_power[arc_conf]
            new_row.append(str(avg_energy_re))

            cur_row_total_energy += avg_energy_re

        new_row.append(str(cur_row_total_energy / len(BENCHMARKS)))
        table.add_row(*new_row)

    console = Console()
    console.print(table)


def aggregate_print_table_for_compilers_compare(results_dir):
    table = Table(
        title='[Fig. 11] Compilers impact on the old architecture with 9 and 16 cores considering the average execution times per RE for each benchmark.')
    table.add_column("Compiler", style="bold")
    table.add_column("Benchmark", style="purple")
    table.add_column('Arc Conf', style="cyan")
    table.add_column("AVG µs/RE", style="magenta")

    for benchmark in BENCHMARKS:
        for arc_conf in OLD_COMPILER_BENCHMARKS_ARCS_CONFIGURATIONS:
            for compiler in OLD_COMPILER_BENCHMARKS_COMPILERS:
                benchmark_csv_path = os.path.join(
                    results_dir, get_csv_name(arc_conf, benchmark, compiler, OLD_COMPILER_BENCHMARKS_REs_COUNT))
                file_path, total_sum, avg_cc_re, total_timeout, total_fifo_full, other_errors, match_success_count, total_rows = aggregate_result(
                    benchmark_csv_path)
                avg_time_re = avg_cc_re / map_arcs_conf_to_clock_freq[arc_conf]
                table.add_row(compiler, benchmark, arc_conf, str(avg_time_re))

    console = Console()
    console.print(table)


def aggregate_print_table_for_complete_bench(map_arcs_conf_to_power, results_dir):
    table14 = Table(
        title='[Fig. 14] RE execution speedup normalized against the OLD 1x9')
    table14.add_column("Benchmark", style="bold")
    table14.add_column('Arc Conf', style="cyan")
    table14.add_column("AVG µs/RE Speedup VS OLD 1x9", style="magenta")

    table15 = Table(
        title='[Fig. 15] Energy efficiency improvements normalized against the OLD 1x9')
    table15.add_column("Benchmark", style="bold")
    table15.add_column('Arc Conf', style="cyan")
    table15.add_column("AVG Wµs/RE Speedup VS OLD 1x9", style="magenta")

    baseline_time = None
    baseline_energy = None

    for benchmark in BENCHMARKS:
        for arc_conf in COMPLETE_BENCHMARKS_ON_SELECTED_ARCS_CONFIGURATIONS:
            benchmark_csv_path = os.path.join(
                results_dir, get_csv_name(arc_conf, benchmark, COMPLETE_BENCHMARKS_COMPILERS[0], COMPLETE_BENCHMARKS_REs_COUNT))
            file_path, total_sum, avg_cc_re, total_timeout, total_fifo_full, other_errors, match_success_count, total_rows = aggregate_result(
                benchmark_csv_path)
            avg_time_re = avg_cc_re / map_arcs_conf_to_clock_freq[arc_conf]

            if os.path.basename(file_path).startswith('OLD 1x9'):
                baseline_time = avg_time_re
                baseline_energy = avg_time_re * \
                    map_arcs_conf_to_power[arc_conf]

            time_speedup = avg_time_re / baseline_time
            table14.add_row(benchmark, arc_conf, str(time_speedup))

            avg_energy_re = avg_time_re * map_arcs_conf_to_power[arc_conf]
            energy_speedup = baseline_energy / avg_energy_re
            table15.add_row(benchmark, arc_conf, str(energy_speedup))

    console = Console()
    console.print(table14)
    console.print(table15)


if __name__ == '__main__':

    if len(sys.argv) == 1:
        results_dir = os.path.join(script_dir, '..', '..', '..', 'bitstreams')
    elif len(sys.argv) == 2:
        results_dir = sys.argv[1]
    else:
        print("Usage: python aggregate_benchmarks_results.py <results_dir>")
        sys.exit(1)

    map_arcs_conf_to_power = {}

    with open(os.path.join(script_dir, '..', '..', '..', 'bitstreams', 'cicero_confs_usage_power.CSV'), 'r') as f:
        csv_reader = csv.reader(f)
        # Skip first row
        next(csv_reader)
        for row in csv_reader:
            # Column 0 is conf name; column 4 is 'Total On-Chip Power (W)'
            map_arcs_conf_to_power[row[0]] = float(row[4])

    table = Table(
        title='Power consumption estimation for each architecture configuration')
    table.add_column('Arc Conf', style="bold")
    table.add_column("Total On-Chip Power (W)", style="magenta")

    for arc_conf, power in map_arcs_conf_to_power.items():
        table.add_row(arc_conf, str(power))

    console = Console()
    console.print(table)

    aggregate_results_for_benchmarks_suite(map_arcs_conf_to_power,
                                           results_dir, 'MICRO_BENCHMARKS (AVG Wµs/RE for Table 5)', MICRO_BENCHMARKS_ARCS_CONFIGURATIONS, MICRO_BENCHMARKS_REs_COUNT, MICRO_BENCHMARKS_COMPILERS)
    aggregate_results_for_benchmarks_suite(map_arcs_conf_to_power,
                                           results_dir, 'OLD_COMPILER_BENCHMARKS (AVG µs/RE for Fig 11)', OLD_COMPILER_BENCHMARKS_ARCS_CONFIGURATIONS, OLD_COMPILER_BENCHMARKS_REs_COUNT, OLD_COMPILER_BENCHMARKS_COMPILERS)
    aggregate_results_for_benchmarks_suite(map_arcs_conf_to_power,
                                           results_dir, 'COMPLETE_BENCHMARKS (AVG µs/RE for Fig 14; AVG Wµs/RE for Fig 15)', COMPLETE_BENCHMARKS_ON_SELECTED_ARCS_CONFIGURATIONS, COMPLETE_BENCHMARKS_REs_COUNT, COMPLETE_BENCHMARKS_COMPILERS)

    aggregate_print_table_for_microbench(map_arcs_conf_to_power, results_dir)
    aggregate_print_table_for_compilers_compare(results_dir)
    aggregate_print_table_for_complete_bench(
        map_arcs_conf_to_power, results_dir)
