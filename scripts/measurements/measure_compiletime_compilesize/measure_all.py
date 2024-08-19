'''
    This file is used to measure the compile time and compile size of all these combinations:
    - Different benchmarks
    - Different compilers
    - Different optimizations (ON|OFF)
'''

import csv
import statistics
import time
import tqdm
import sys
import os
from enum import Enum

OUTPUT_FILENAME = 'all_compiletime_compilesize.csv'

script_path = os.path.dirname(os.path.realpath(__file__))
project_root = os.path.abspath(os.path.join(script_path, os.pardir, os.pardir, os.pardir))
REs_dir = os.path.join(script_path, os.pardir, 'benchmark', 'REs')

BENCHMARKS = [
    # (Benchmark name, benchmark file)
    ('protomata', os.path.join(REs_dir, 'autozoo_protomata.regex')),
    ('brill', os.path.join(REs_dir, 'autozoo_brill.regex')),
    ('protomata4', os.path.join(REs_dir, 'autozoo_protomata4.regex')),
    ('brill4', os.path.join(REs_dir, 'autozoo_brill4.regex')),
]

COMPILERS = [
    # (Compiler name, compiler path)
    ('NEW_CPP', os.path.join(project_root, 'cicero_compiler_cpp')),
    ('OLD_PYT', os.path.join(project_root, 'cicero_compiler')),
]

OPTIMIZATIONS = [
    # (Optimization name, optimization flag)
    ('O0', False),
    ('O1', True)
]


def check_script_arguments():
    for benchmark in BENCHMARKS:
        if not os.path.isfile(benchmark[1]):
            print(f"File {benchmark[1]} does not exist.")
            quit(1)
    for compiler in COMPILERS:
        sys.path.append(compiler[1])
        try:
            import re2compiler
        except ImportError:
            print(f'Could not import cicero compiler from {compiler[1]}')
            sys.exit(1)
        # Try a little compilation
        re2compiler.compile(data='this|that', O1=True)
        sys.path.pop()
        del re2compiler
        del sys.modules['re2compiler']


def print_summary():
    print('-------------------')
    for (compiler_name, _) in COMPILERS:
        for (benchmark_name, __) in BENCHMARKS:
            for (optimization_name, ___) in OPTIMIZATIONS:
                print(f'\t{compiler_name}-{benchmark_name}-{optimization_name}')
    print('-------------------')


class CiceroOpCodes(Enum):
    ACCEPT = 0
    SPLIT = 1
    MATCH_CHAR = 2
    JUMP = 3
    END_WITHOUT_ACCEPTING = 4
    MATCH_ANY = 5
    ACCEPT_PARTIAL = 6
    NOT_MATCH_CHAR = 7


def compute_code_locality(code):
    '''
        Compute the code locality of a compiled regex.
        Code locality is defined by the sum of the jump/split offsets of the compiled regex.
        For example:
            - at address 4 we have a jump to address 10 => offset = 10 - 4 = 6
            - at address 7 we have a split(8, 20) => offset = 20 - 7 = 13
    '''
    lines = code.split('\n')
    if lines[-1] == '':
        lines = lines[:-1]
    total_offset = 0
    for instruction_addr, line in enumerate(lines):
        # line must begin with 0x
        if not line.startswith('0x'):
            raise Exception(
                f'Invalid line in compiled regex: lines[{instruction_addr}] = {line}\nCode: "{code}"')
        instruction = int(line, 16)
        op_code = instruction >> 13
        argument = instruction & 0x1FFF
        if op_code == CiceroOpCodes.JUMP.value or op_code == CiceroOpCodes.SPLIT.value:
            total_offset += abs(instruction_addr - argument)
    return total_offset


def calculate_statistics(values):
    '''
        Calculate:
        - Average
        - Minimum
        - Maximum
        - Quantiles (25%, 50%, 75%)
        - Sum
    '''
    return (statistics.mean(values), min(values), max(values), statistics.quantiles(values, n=4), sum(values))


def main():
    # Before starting, make sure all the compilers paths are correct, and all input files are correct
    check_script_arguments()

    print_summary()

    print('Starting in 10 seconds...')
    try:
        time.sleep(10)
    except KeyboardInterrupt:
        print('Keyboard interrupt detected, quitting.')
        quit(-1)

    output_file = open(OUTPUT_FILENAME, 'w')
    output_writer = csv.writer(output_file)
    output_writer.writerow(['Compiler', 'Benchmark', 'Optimization', 'Compile time (avg)', 'Compile time (min)', 'Compile time (max)', 'Compile time (25% quantile)', 'Compile time (50% quantile)', 'Compile time (75% quantile)',
                            'Compile time (sum)', 'Compile size (avg)', 'Compile size (min)', 'Compile size (max)', 'Compile size (25% quantile)', 'Compile size (50% quantile)', 'Compile size (75% quantile)', 'Compile size (sum)', 'Code locality (avg)', 'Code locality (min)', 'Code locality (max)', 'Code locality (25% quantile)', 'Code locality (50% quantile)', 'Code locality (75% quantile)', 'Code locality (sum)'])

    for compiler in COMPILERS:
        sys.path.append(compiler[1])
        try:
            import re2compiler
        except ImportError:
            print(
                f'???? Could not import cicero compiler from {compiler[1]} ???? Should have caught this earlier. Skipping this compiler.')
            sys.path.pop()
            continue

        for benchmark in BENCHMARKS:
            for optimization in OPTIMIZATIONS:
                print(
                    f'Compiler: {compiler[0]} | Optimization: {optimization[0]} | Benchmark: {benchmark[0]}')
                print(
                    f'Compiler path: {compiler[1]} | Benchmark file: {benchmark[1]}')

                regexes = []
                with open(benchmark[1], 'r') as f:
                    for line in f:
                        regexes.append(line[:-1])

                # Compile the regexes, while keeping the compile time and size of each regex
                compiled_regexes_times = []
                compiled_regexes_sizes = []
                compiled_regexes_code_locality = []

                for regex in tqdm.tqdm(regexes, desc='Compiling regexes'):
                    time_before_compile = time.time()
                    try:
                        compiled_regex = re2compiler.compile(
                            data=regex, O1=optimization[1])
                    except:
                        print(f'Error while compiling regex (regex is probably too large to fit cicero memory): "{regex}"')
                        continue
                    compiled_regexes_times.append(
                        time.time() - time_before_compile)
                    # Size is calculated as the number of lines
                    compiled_regexes_sizes.append(compiled_regex.count('\n'))
                    # Code locality
                    compiled_regexes_code_locality.append(
                        compute_code_locality(compiled_regex))

                # COMPILE TIME:
                time_avg, time_min, time_max, [time_quantile_25, time_quantile_50,
                                               time_quantile_75], time_sum = calculate_statistics(compiled_regexes_times)
                # OUTPUT SIZE:
                size_avg, size_min, size_max, [size_quantile_25, size_quantile_50,
                                               size_quantile_75], size_sum = calculate_statistics(compiled_regexes_sizes)

                # CODE LOCALITY:
                code_locality_avg, code_locality_min, code_locality_max, [code_locality_quantile_25, code_locality_quantile_50,
                                                                          code_locality_quantile_75], code_locality_sum = calculate_statistics(compiled_regexes_code_locality)

                output_writer.writerow([compiler[0], benchmark[0], optimization[0], time_avg, time_min, time_max, time_quantile_25, time_quantile_50,
                                        time_quantile_75, time_sum, size_avg, size_min, size_max, size_quantile_25, size_quantile_50, size_quantile_75, size_sum, code_locality_avg, code_locality_min, code_locality_max, code_locality_quantile_25, code_locality_quantile_50, code_locality_quantile_75, code_locality_sum])

        sys.path.pop()
        del re2compiler
        del sys.modules['re2compiler']


if __name__ == '__main__':
    main()
