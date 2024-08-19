'''
    This code generates a CSV file that compares the number of lines of code in each file in a set of directories.
    The output CSV file contains the number of lines of code for each file for each directory.
'''

import csv
import os

FILES_COUNT = 2380

script_path = os.path.dirname(os.path.abspath(__file__))

folders = [folder for folder in os.listdir(
    script_path) if os.path.isdir(os.path.join(script_path, folder))]


def main():
    with open(os.path.join(script_path, 'output.csv'), 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['filename'] + folders)

        for file in [f'regex_{i}.txt' for i in range(FILES_COUNT)]:
            row = [file]
            for folder in folders:
                folder_path = os.path.join(script_path, folder)
                file_path = os.path.join(folder_path, file)
                with open(file_path, 'r') as f:
                    lines = f.readlines()
                    row.append(len(lines))
            writer.writerow(row)


if __name__ == '__main__':
    main()
