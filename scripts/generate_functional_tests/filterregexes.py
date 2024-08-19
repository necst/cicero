'''
    This script reads a file containing regular expressions, modifies and filters them, and writes the filtered expressions to a new file.
    Input file is, relative to script, '../measurements/protomata4.regex'
    Output file is, relative to script, './protomata_filtered.txt'
'''

import os


def modify_line(line: str):
    if line[0] == '/':
        line = line[1:]
    if line[-1] == '/':
        line = line[:-1]
    return line.strip()


def filter_line(line):
    # We only support '^' at the beginning of the regex
    hat_index_from_back = line.rfind('^')
    if hat_index_from_back == 0:
        if line[1] != '(':
            return False
    elif hat_index_from_back > 0:
        return False
    return True


script_path = os.path.dirname(os.path.abspath(__file__))


def main():
    with open(os.path.join(script_path, '..', 'measurements', 'protomata4.regex'), "r") as f:
        lines = f.readlines()
        modified_lines = [modify_line(line) for line in lines]
        filtered_lines = list(filter(filter_line, modified_lines))
        print(
            f'Originally has {len(lines)} lines, now have {len(filtered_lines)} lines')
        with open(os.path.join(script_path, 'protomata_filtered.txt'), "w") as outf:
            outf.write('\n'.join(filtered_lines))


if __name__ == '__main__':
    main()
