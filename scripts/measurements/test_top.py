'''
    This script runs the benchmarks on the FPGA board loading the bitstreams from the BITSTEAM_FOLDER.
    Saves the result in a csv file with the same name as the bitstream file, appending the benchmark name.
'''

import os
import subprocess

# Folder containing the bitstreams
BITSTEAM_FOLDER = '/home/xilinx/src/vect_bitstreams'

# Benchmart to run: (benchmark_name, benchmark_strfile, benchmark_regfile)
BENCHMARKS = [
    ('protomata_selected', 'input_protomata_selected.txt', 'regular_expr.txt')]


def main():
    for benchmark_name, benchmark_strfile, benchmark_regfile in BENCHMARKS:
        for filename in os.listdir(BITSTEAM_FOLDER):
            if not filename.endswith('.bit'):
                continue

            bitstream_file = os.path.join(BITSTEAM_FOLDER, filename)

            print('Running ' + benchmark_name + ' with ' + bitstream_file)
            subprocess.run([
                'python3', 'measure.py', '-copro', '-bitstream', bitstream_file,
                '-benchmark=' + benchmark_name, '-strfile=' + benchmark_strfile,
                '-regfile=' + benchmark_regfile, '-format=pcre',
                '-skipException',
                '-copro_not_check', '-output_name', bitstream_file.replace('.bit', "_" + benchmark_name + '.csv')], check=True)


if __name__ == '__main__':
    main()