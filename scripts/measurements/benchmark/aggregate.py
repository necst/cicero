'''
    Aggregates the measurements from the CSV files that `measure.py` generates.
'''

import csv
import sys
import csv
import glob


def aggregate_result(file_path: str, csv_writer: csv.writer) -> None:
    total_rows = 0
    total_sum = 0
    total_timeout = 0
    total_fifo_full = 0
    other_errors = 0
    match_success_count = 0

    # Open the CSV file
    with open(file_path, 'r') as csv_file:
        # Create a CSV reader object
        csv_reader = csv.reader(csv_file)

        # Iterate over the rows in the CSV file
        for row in csv_reader:
            # If the row contains a single column, then skip it (it's the regex)
            if len(row) != 1:
                total_rows += 1
                match_success_count += int(row[1])
                total_cc = int(row[2])
                if total_cc == -1:
                    total_fifo_full += 1
                elif total_cc == -2:
                    total_timeout += 1
                elif total_cc == -3:
                    other_errors += 1
                else:
                    total_sum += int(row[2])

    avg_cc_re = total_sum / (total_rows - total_timeout - total_fifo_full - other_errors)
    csv_writer.writerow(
        [file_path, total_sum, avg_cc_re, total_timeout, total_fifo_full, other_errors, match_success_count, total_rows])


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print(f'Usage: {sys.argv[0]} <output_file> <csv_pattern>\n\tExample: {sys.argv[0]} output.csv "measurements/*.csv"')
        sys.exit(1)
    output_file = sys.argv[1]
    csv_pattern = sys.argv[2]
    csv_files = sorted(glob.glob(csv_pattern))
    csv_writer = csv.writer(open(output_file, 'w'))
    print('-----------------------------------', file=sys.stderr)
    print(f'Aggregating {len(csv_files)} CSV files:', file=sys.stderr)
    for i, csv_file in enumerate(csv_files):
        print(f'\t{i+1} - {csv_file}', file=sys.stderr)
    print('-----------------------------------', file=sys.stderr)
    csv_writer.writerow(
        ['file', 'total CC', 'AVG CC/RE', 'timeout count', 'fifo_full count', 'other errors', 'Match=True count', 'total rows'])
    # Iterate over the CSV files
    for csv_file in csv_files:
        aggregate_result(csv_file, csv_writer)
