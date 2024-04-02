'''
    [!] This is specific for the Brill benchmark and was specifically built for fixing a problem in the Python compiler, that interpreted `\/` as `match \` plus `match /` instead of just `match /`. Also, it escapes the parenthesis (some of them appear invalid otherwise???)

    This script filters and transforms the regexes.

    Filters out regexes that contain a '$' sign in the middle, because they are not supported by the compilers
    Transforms {"*?", "+?", "??"} into {"*", "+", "?"}
'''

import re
import sys


def main():
    if len(sys.argv) != 3:
        print('Usage: python for_brill.py input_file output_file')
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
                remove_slash = line[1:-2]  # remove both slash and '\n' at end
            else:
                remove_slash = line[:-1]  # remove '\n' at end
            # Filter out the ones that contains a '$' sign in the middle
            try:
                if remove_slash.index('$') != len(remove_slash):
                    print(f'Skipping regex with dollar: "{remove_slash}"')
                    total_skipped += 1
                    continue
            except ValueError:
                pass

            # [! BRILL_SPECIFIC] Escape all the parenthesis
            remove_slash = remove_slash.replace('(', '\\(').replace(')', '\\)')

            # [! BRILL_SPECIFIC] De-Escapes slash
            remove_slash = remove_slash.replace('\\/', '/')

            # Replace {"*?", "+?", "??"} with {"*", "+", "?"}
            remove_slash = remove_slash.replace(
                '*?', '*').replace('+?', '+').replace('??', '?')

            # Filter out invalid ones????
            try:
                re.compile(remove_slash)
            except re.error:
                print(f'Skipping invalid regex: "{remove_slash}"\nOriginally it was: "{line[:-1]}"')
                total_skipped += 1
                continue
            outfile.write(remove_slash + '\n')

    print(f'Total regexes: {total_regexes}')
    print(f'Total skipped: {total_skipped} ')
    print(f'Skipped percentage: {total_skipped / total_regexes * 100}%')


if __name__ == '__main__':
    main()
