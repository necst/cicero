'''
    This script filters and transforms the regexes.

    Filters out regexes that contain a '$' or '^' sign in the middle, because they are not supported by the compilers
    Transforms {"*?", "+?", "??"} into {"*", "+", "?"}, and "{a,b}?" into "{a,b}".
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
            # Remove the slash at the begin and end, if present
            if line[0] == '/':
                line = line[1:-2] # remove both slash and '\n' at end
            else:
                line = line[:-1] # remove '\n' at end
            
            # If the line begins with '(' and ends with ')', remove them
            if line[0] == '(' and line[-1] == ')':
                line = line[1:-1]


            # Filter out the ones that contains a '$' sign in the middle
            try:
                if line.index('$') != len(line) - 1:
                    print(f'Skipping regex with dollar: "{line}"')
                    total_skipped += 1
                    continue
            except ValueError:
                pass
            # Filter out the ones that contains a '^' sign in the middle (do not skip the ones with '[' before '^')
            try:
                caret_index = line.index('^')
                if caret_index != 0 and line[caret_index - 1] != '[':
                    print(f'Skipping regex with caret: "{line}"')
                    total_skipped += 1
                    continue
            except ValueError:
                pass

            # Remove empty
            if len(line) == 0:
                print(f'Skipping empty regex, original was: "{line[:-1]}"')
                total_skipped += 1
                continue

            # Replace {"*?", "+?", "??"} with {"*", "+", "?"}
            line = line.replace('*?', '*').replace('+?', '+').replace('??', '?')

            # Replace "{a,b}?" with "{a,b}"
            line = line.replace('}?', '}')

            # Filter out invalid ones????
            try:
                re.compile(line)
            except re.error:
                print(f'Skipping invalid regex: "{line}"\nOriginally it was: "{line[:-1]}"')
                total_skipped += 1
                continue
            outfile.write(line + '\n')

    print(f'Total regexes: {total_regexes}')
    print(f'Total skipped: {total_skipped} ')
    print(f'Skipped percentage: {total_skipped / total_regexes * 100:.2f}%')


if __name__ == '__main__':
    main()
