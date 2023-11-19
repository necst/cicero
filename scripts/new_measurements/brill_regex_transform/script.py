'''
    This script filters and transforms the regexes from the Brill benchmark.

    Filters out regexes that contain a '$' sign in the middle, because they are not supported by the compilers
    Transforms {"*?", "+?", "??"} into {"*", "+", "?"}
'''

import re
import sys


def main():
    if len(sys.argv) != 3:
        print('Usage: python script.py input_file output_file')
        sys.exit(1)

    INPUT_FILE = sys.argv[1]
    OUTPUT_FILE = sys.argv[2]

    total_skipped = 0
    # Open the input and output files
    with open(INPUT_FILE, 'r') as infile, open(OUTPUT_FILE, 'w') as outfile:
        # Iterate over each line in the input file
        lines = infile.readlines()
        total_regexes = len(lines)
        for line in lines:
            # Remove the first and last character and write to the output file
            remove_slash = line[1:-2]
            # Filter out the ones that contains a '$' sign in the middle
            try:
                if remove_slash.index('$') != len(remove_slash):
                    print(f'Skipping regex: "{remove_slash}"')
                    total_skipped += 1
                    continue
            except ValueError:
                pass

            # Escape all the parenthesis
            remove_slash = remove_slash.replace('(', '\\(').replace(')', '\\)')

            # Replace {"*?", "+?", "??"} with {"*", "+", "?"}
            remove_slash = remove_slash.replace('*?', '*').replace('+?', '+').replace('??', '?')

            # Filter out invalid ones????
            try:
                re.compile(remove_slash)
            except re.error:
                print(f'Skipping invalid regex: "{remove_slash}"')
                total_skipped += 1
                continue
            outfile.write(remove_slash + '\n')

    print(f'Total regexes: {total_regexes}')
    print(f'Total skipped: {total_skipped} ')
    print(f'Skipped percentage: {total_skipped / total_regexes * 100}%')


if __name__ == '__main__':
    main()