'''
    Aggregates the measurements from the CSV files that `measure.py` generates.
'''

import csv
import os
import sys
import csv


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

    csv_writer.writerow(
        [file_path, total_sum, total_timeout, total_fifo_full, other_errors, match_success_count, total_rows])


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print(f'Usage: {sys.argv[0]} <target_dir> <output_file>')
        sys.exit(1)
    target_dir = sys.argv[1]
    csv_writer = csv.writer(open(sys.argv[2], 'w'))
    csv_writer.writerow(
        ['file', 'total CC', 'timeout count', 'fifo_full count', 'other errors', 'Match=True count' , 'total rows'])
    # Iterate over the CSV files in the directory
    for filename in os.listdir(target_dir):
        if filename.endswith('.csv'):
            aggregate_result(os.path.join(target_dir, filename), csv_writer)
