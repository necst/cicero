'''
    This script is meant to read the output of the benchmark of `test_top.py` and
    to verify that the results are correct.
'''
import sys
import csv
import re
import tqdm

def main():
    
    if len(sys.argv) != 3:
        print('Usage: python3 check_results.py <csv_input_file> <input_file>')
        quit(1)

    CSV_INPUT_FILE = sys.argv[1]
    INPUTS_FILE = sys.argv[2]
    with open(INPUTS_FILE, 'r') as f:
        inputs = f.readlines()
    
    with open(CSV_INPUT_FILE) as f:
        csv_lines_count = len(f.readlines())

    current_regex = None
    current_regex_string = None
    current_regex_index = -1
    incorrect_count = 0
    with open(CSV_INPUT_FILE) as f:
        csv_file = csv.reader(f)
        for row in tqdm.tqdm(csv_file, desc='Checking results', total=csv_lines_count):
            if len(row) == 1:
                current_regex_index += 1
                current_regex = re.compile(row[0])
                current_regex_string = row[0]
            elif len(row) == 3:
                input_index = int(row[0])
                if row[1] == '1':
                    match_result = True
                elif row[1] == '0':
                    match_result = False
                else:
                    print('Invalid row[1]: ', row[1])
                
                input_str = inputs[input_index][:-1]
                matches = current_regex.findall(input_str)
                python_match_result = len(matches) != 0

                if python_match_result != match_result:
                    incorrect_count += 1
                    print(f"-----\nMatches={matches}\nCSV file had incorrect value!!!\nRegex[{current_regex_index}]='{current_regex_string}'\nInput[{input_index}]='{input_str}'\nExpected={python_match_result}; Actual={match_result}\n-----")
            elif len(row) == 4:
                'Error row, skip'
                pass
            else:
                print("Invalid row in csv: ", str(row))
    print("Incorrect count = ", incorrect_count)

if __name__ == '__main__':
    main()
