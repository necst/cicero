'''
    Utility script for `test_top.py`

    Can also be used standalone to launch a single benchmark for Cicero.
'''

import tqdm
import csv
from pynq import Overlay
import sys
import re2_driver
import time


def measure_catch_ctrl_c(
        progress_message: str,
        bitstream_file_path: str,
        strings_file_path: str,
        regexes_file_path: str,
        output_file_path: str,
        compile_callback,
        regexes_count: int = -1,
        inputs_count: int = -1
):
    try:
        measure(
            progress_message=progress_message,
            bitstream_file_path=bitstream_file_path,
            strings_file_path=strings_file_path,
            regexes_file_path=regexes_file_path,
            output_file_path=output_file_path,
            compile_callback=compile_callback,
            regexes_count=regexes_count,
            inputs_count=inputs_count
        )
    except KeyboardInterrupt:
        print("Caught KeyboardInterrupt, skipping the rest of the test. Press Ctrl+C again to exit")
        try:
            time.sleep(2)
        except KeyboardInterrupt:
            print("Ok, exiting now.")
            sys.exit(1)


def measure(
        progress_message: str,
        bitstream_file_path: str,
        strings_file_path: str,
        regexes_file_path: str,
        output_file_path: str,
        compile_callback,
        regexes_count: int = -1,
        inputs_count: int = -1
):
    '''
    Run a measurement with the given parameters.

    Args:
        progress_message (str): The message to display in the progress bar of the regex.
        bitstream_file_path (str): The path to the bitstream file to use.
        strings_file_path (str): The path to the file containing the strings to search for. (one per line)
        regexes_file_path (str): The path to the file containing the regular expressions to search for. (one per line)
        output_file_path (str): The path to the file where the results will be written. (csv_file)
        compile_callback (function): The function to call to compile the regex. Output format is two bytes per line in hex format.
        regexes_count (int): Number of regex to execute. -1 means all. Only the first <regexex_count> regexes in the file will be executed.
        inputs_count (int): Number of inputs to execute. -1 means all. Only the first <inputs_count> inputs in the file will be executed.

    Output file format:
    <regex0>
    <input0>,<has_accepted_0>,<clock_cycles_0>
    <input1>,<has_accepted_1>,<clock_cycles_1>
    ...
    <regex1>
    <input0>,<has_accepted_0>,<clock_cycles_0>
    <input1>,<has_accepted_1>,<clock_cycles_1>
    ...
    '''

    # STEP 1: Load the bitstream
    re2_coprocessor = Overlay(bitstream_file_path)
    # re2_coprocessor.cicero_core_0.debug = True

    # STEP 2: Open output file
    csv_writer = csv.writer(open(output_file_path, 'w'))

    # STEP 3: Load regexes
    if regexes_count == -1:
        regexes = open(regexes_file_path, 'r').read().split('\n')[:-1]
    else:
        with open(regexes_file_path) as input_file:
            regexes = [next(input_file).strip('\n')
                       for _ in range(regexes_count)]

    # STEP 3.2 Load strings
    with open(strings_file_path, 'rb') as file:
        content = file.read()
        string_inputs = content.split(b'\n')[:-1]
        if inputs_count != -1:
            string_inputs = string_inputs[:inputs_count]

    for regex_index, regex in enumerate(tqdm.tqdm(regexes, desc=progress_message)):
        # Step 4.0: Write in the CSV a line for the regex
        csv_writer.writerow([regex])

        # STEP 4.1: Compile the regex
        try:
            compiled_regex = compile_callback(regex)
        except Exception as e:
            print(f"Error while compiling regex: {e}\nRegex was: '{regex}'")
            continue
        re2_coprocessor.cicero_core_0.reset()
        # Step 4.1.2: Match a test string, and check execution
        try:
            accept_result = re2_coprocessor.cicero_core_0.load_and_run(
                compiled_regex.split('\n'), "test input")
        except Exception as e:
            print(
                f"Error while matching regex on test string: {e}\nRegex was: '{regex}'")

        for string_index, string in enumerate(tqdm.tqdm(string_inputs, desc=f"Progress for regex number {regex_index}")):
            # STEP 4.2: Match all the strings
            re2_coprocessor.cicero_core_0.reset()
            try:
                accept_result = re2_coprocessor.cicero_core_0.load_only_string_and_run(
                    compiled_regex,
                    string,
                    double_check=False
                )
            except Exception as e:
                if len(e.args) == 1 and e.args[0] == 'probably fifo full':
                    csv_writer.writerow([string_index, 0, -1, str(e)])
                elif len(e.args) == 2 and e.args[0] == 'Error while waiting':
                    csv_writer.writerow([string_index, 0, -2, str(e)])
                else:
                    print(
                        f"Error while matching regex on string: {e}\nRegex was: '{regex}'\nString was: '{string}'")
                    csv_writer.writerow([string_index, 0, -3, str(e)])
                continue
            cc_number = re2_coprocessor.cicero_core_0.read_elapsed_clock_cycles()
            csv_writer.writerow([string_index, 1 if accept_result else 0, cc_number])


if __name__ == '__main__':
    if len(sys.argv) != 8:
        print(
            f"Usage: {sys.argv[0]} <bitstream_file_path> <strings_file_path> <regexes_file_path> <output_file_path> <compiler_path> <regexes_count> <inputs_count>")
        sys.exit(1)

    bitstream_file_path = sys.argv[1]
    strings_file_path = sys.argv[2]
    regexes_file_path = sys.argv[3]
    output_file_path = sys.argv[4]
    compiler_path = sys.argv[5]
    regexes_count = int(sys.argv[6])
    inputs_count = int(sys.argv[7])

    sys.path.append(compiler_path)
    try:
        import re2compiler
    except ImportError:
        print(f'Could not import cicero compiler from {compiler_path}')
        sys.exit(1)
    # Try a little compilation
    re2compiler.compile(data='this|that', O1=True)

    def compiler_callback(regex):
        return re2compiler.compile(data=regex, O1=True)
    measure_catch_ctrl_c(
        progress_message="Regex Progress",
        bitstream_file_path=bitstream_file_path,
        strings_file_path=strings_file_path,
        regexes_file_path=regexes_file_path,
        output_file_path=output_file_path,
        compile_callback=compiler_callback,
        regexes_count=regexes_count,
        inputs_count=inputs_count
    )
