'''
    Given a file as input, divide its content into many lines, each of which of a given length.

    Used to divide the benchmark inputs into multiple lines
'''

import sys

def divide_input(file_path, line_length):
    with open(file_path, 'r') as f:
        content = f.read()
    lines = [content[i:i+line_length] for i in range(0, len(content), line_length)]
    return lines

if __name__ == '__main__':
    if len(sys.argv) != 4:
        print(f'Usage: {sys.argv[0]} <path_to_input_file> <path_to_output_file> <line_length>')
        sys.exit(1)
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    line_length = int(sys.argv[3])
    lines = divide_input(input_file, line_length)
    with open(output_file, 'w') as f:
        for line in lines:
            f.write(line + '\n')