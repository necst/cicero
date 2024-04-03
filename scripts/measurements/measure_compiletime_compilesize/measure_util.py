'''
    This script is used to measure the compile time and compile size of the cicero compiler.
'''

import sys
import time
import statistics
import tqdm
import pathlib

# argv[1] is the path to the cicero compiler
# argv[2] is the path to the file with the regexes, one regex per line

if len(sys.argv) != 3:
    print(f'Usage: {sys.argv[0]} <path_to_cicero_compiler> <path_to_regex_file>')
    sys.exit(1)

CICERO_PATH = sys.argv[1]
REGEX_FILE = sys.argv[2]



def main():
    # Try to import the cicero compiler
    sys.path.append(CICERO_PATH)
    try:
        import re2compiler
    except ImportError:
        print(f'Could not import cicero compiler from {CICERO_PATH}')
        sys.exit(1)
    
    # Read the regexes from the file
    regexes = []
    with open(REGEX_FILE, 'r') as f:
        for line in f:
            regexes.append(line.strip())
    
    # Write file name without path
    print("Regex file: " + pathlib.Path(REGEX_FILE).name)

    
    time_before_compile = time.time()
    # Compile the regexes
    compiled_regexes = []
    for regex in tqdm.tqdm(regexes, desc='Compiling regexes'):
        compiled_regexes.append(re2compiler.compile(data=regex, O1=True))
    
    time_after_compile = time.time()
    
    # COMPILE TIME:
    # Total time
    # Average time per regex
    total_time = time_after_compile - time_before_compile
    avg_time = total_time / len(regexes)
    print(f'Total compiler time: {total_time} seconds')
    print(f'Average compile time per regex: {avg_time} seconds')

    # OUTPUT SIZE:
    # 1. Average
    # 2. Minimum
    # 3. Maximum
    # 4. Total
    # 5. variance
    # Size is calculated as the number of lines
    sizes = [regex.count('\n') for regex in compiled_regexes]
    avg_size = statistics.mean(sizes)
    min_size = min(sizes)
    max_size = max(sizes)
    total_size = sum(sizes)
    quantiles = statistics.quantiles(sizes, n=4)

    print(f'Average size: {avg_size}')
    print(f'Minimum size: {min_size}')
    print(f'Maximum size: {max_size}')
    print(f'Total size: {total_size}')
    print(f'Quantiles: {quantiles}')

if __name__ == '__main__':
    main()
