'''
    Run this script to parse the output of AXI_top_tb_multiple_tests_from_csv

    Copy paste the outputs of the testbench into some files and put them into a folder,
    then run this script with that folder as argument. It will parse the results and
    aggregate them.
'''
import sys
import os
from itertools import zip_longest

BEGIN_DELIMITER = '++++ BEGIN TESTBENCH ++++'
END_DELIMITER = '++++ END TESTBENCH ++++'

def parse_result():
    first_line = input()

    if first_line == END_DELIMITER:
        return False, None, None
    
    input_number = int(first_line.split(' ')[1])
    cc_taken = int(input().split(' ')[-1])

    return True, input_number, cc_taken


def main():
    if len(sys.argv) != 2:
        print(f'Usage: {sys.argv[0]} <folder>')
        return
    
    target_folder = sys.argv[1]

    # Check it is a folder
    if not os.path.isdir(target_folder):
        print(f'{target_folder} is not a folder')
        return
    
    # iterate over all files in the folder
    for filename in os.listdir(target_folder):        
        # Open the file
        with open(os.path.join(target_folder, filename), 'r') as f:
            lines = f.readlines()
            if lines[0].strip() != BEGIN_DELIMITER:
                print(f'Invalid file {filename}')
                continue
            total_cc_taken = 0
            for first_line, second_line in zip_longest(lines[1::2], lines[2::2]):
                if first_line == END_DELIMITER:
                    break

                input_number = int(first_line.split()[1])
                cc_taken = int(second_line.split()[-1])

                total_cc_taken += cc_taken
            
            print(f'{filename} took {total_cc_taken} cycles')


if __name__ == '__main__':
    main()