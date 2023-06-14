'''
    This script runs the benchmarks on the FPGA board loading the bitstreams from the BITSTEAM_FOLDER.

    Assume the files in the bitstream folder are named as vectorial_w_{window_size}.bit for each window size.
'''

import os
import subprocess

# Folder containing the bitstreams
BITSTEAM_FOLDER = '/home/xilinx/src/vect_bitstreams'

# Benchmart to run: (benchmark_name, benchmark_strfile, benchmark_regfile)
BENCHMARKS = [('protomata', 'input_protomata_selected.txt', 'regular_expr.txt')]

# Boundaries of the regexes to run (e.g. run the first 100 regexes, then the next 100 => [0, 100, 200])
REGEX_BOUNDARIES = [0, 100]

# Window sizes to be considered
WINDOW_SIZES = [1, 2, 3]

def main():
    for benchmark_name, benchmark_strfile, benchmark_regfile in BENCHMARKS:
        for cur_window in WINDOW_SIZES:
            bitstream_file = os.path.join(BITSTEAM_FOLDER, f'vectorial_w_{cur_window}.bit')
            for i in range(len(REGEX_BOUNDARIES)-1):
                start_boundary = REGEX_BOUNDARIES[i]
                end_boundary = REGEX_BOUNDARIES[i+1]

                print('Running ' + benchmark_name + ' with ' + bitstream_file + ' from ' + str(start_boundary) + ' to ' + str(end_boundary))
                subprocess.run([
                    'python3', 'measure.py', '-copro', '-bitstream', bitstream_file,
                    '-benchmark=' + benchmark_name, '-strfile=' + benchmark_strfile,
                    '-regfile=' + benchmark_regfile, '-format=pcre',
                    '-skipException', '-window_value=' + str(cur_window),
                    '-copro_not_check', '-startreg=' + str(start_boundary),
                    '-endreg=' + str(end_boundary)], check=True)

if __name__ == '__main__':
    main()