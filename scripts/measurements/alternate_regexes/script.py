'''
    Given a file with a regex in each line, alternate N of them for M times.
'''

import sys
import random

def divide_input(file_path, line_length):
    with open(file_path, 'rb') as f:
        content = f.read()
    lines = [content[i:i+line_length] for i in range(0, len(content), line_length)]
    return lines

if __name__ == '__main__':
    if len(sys.argv) != 5:
        print(f'Usage: {sys.argv[0]} <path_to_regexes_file> <path_to_output_file> <output_regex_count> <alternation_regex_count>')
        sys.exit(1)
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    output_regex_count = int(sys.argv[3])
    alternation_regex_count = int(sys.argv[4])
    with open(input_file, 'r') as in_f:
        with open(output_file, 'w') as out_f:
            input_lines = in_f.read().splitlines()
            for i, line in enumerate(input_lines):
                # Remove the '^' from the beginning of each regex
                if line[0] == '^':
                    input_lines[i] = line[1:]

            # Repeat for each desired output regex
            for _ in range(output_regex_count):
                # Pick N random regexes from input_lines and write them to the output file
                alternation_regexes = random.choices(input_lines, k=alternation_regex_count)
                out_f.write('|'.join(alternation_regexes) + '\n')