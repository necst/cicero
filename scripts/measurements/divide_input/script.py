'''
    Given a file as input, divide its content into many lines, each of which of a given length and a `stride` to describe the distance between the start of two consecutive lines.
    For example, given "abcdefgh" as input, with a line length of 3 and a stride of 2, the output will be: "abc\n", "cde\n", "efg\n".

    Used to divide the benchmark inputs into multiple lines
'''

import sys

def divide_input(file_path, line_length, stride):
    with open(file_path, 'rb') as f:
        content = f.read()
    lines = [content[i:i+line_length] for i in range(0, len(content), stride)]
    return lines

if __name__ == '__main__':
    if len(sys.argv) != 5:
        print(f'Usage: {sys.argv[0]} <path_to_input_file> <path_to_output_file> <line_length> <stride>')
        sys.exit(1)
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    line_length = int(sys.argv[3])
    stride = int(sys.argv[4])
    lines = divide_input(input_file, line_length, stride)

    with open(output_file, 'wb') as f:
        for line in lines:
            f.write(line + b'\n')