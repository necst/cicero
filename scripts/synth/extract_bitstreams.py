'''
    This script is used to extract .bit and .hwh files from a directory and zip them into a single file.
    Useful for copying the bitstream to the FPGA board.
'''

import glob
import zipfile
import os
import argparse

def zip_bit_and_hwh_files(input_dirs, output_zip):
    with zipfile.ZipFile(output_zip, 'w') as zf:
        for directory in input_dirs:
            for extension in ['.bit', '.hwh']:
                matches = glob.glob(os.path.join(directory, f'**/*{extension}'), recursive=True)
                if len(matches) != 1:
                    print(f'Found {len(matches)} {extension} files in {directory}, only expected one.')
                    exit(-1)
                for filename in glob.glob(os.path.join(directory, f'**/*{extension}'), recursive=True):
                    print(filename)
                    zf.write(filename, arcname=os.path.basename(filename))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Zip .bit and .hwh files from directories matching a pattern.')
    parser.add_argument('pattern', help='Glob pattern for directories to search.')
    parser.add_argument('output_zip', help='Output zip file.')
    args = parser.parse_args()

    input_dirs = glob.glob(args.pattern)
    # Filter non-directories
    input_dirs = [d for d in input_dirs if os.path.isdir(d)]
    print("Input directories:")
    for directory in input_dirs:
        print(f'\t{directory}')
    
    copy_operations = [
        # (source_filepath, destination_filename)
    ]

    for directory in input_dirs:
        copy_operations_temp = []
        EXTENSIONS = ['.bit', '.hwh']
        for extension in EXTENSIONS:
            matches = glob.glob(os.path.join(directory, f'**/*{extension}'), recursive=True)
            if len(matches) != 1:
                print(f'Found {len(matches)} {extension} files in {directory}, only expected one. Skipping {directory}.')
                continue
            copy_operations_temp.append((matches[0], os.path.basename(directory) + extension))
        # This is to check that all files were found
        if len(copy_operations_temp) == len(EXTENSIONS):
            copy_operations.extend(copy_operations_temp)

    # Sort the copy operations by destination filename
    copy_operations.sort(key=lambda x: x[1])

    with zipfile.ZipFile(args.output_zip, 'w') as zf:
        for source, destination in copy_operations:
            print(f"Copying '{source}' to '{destination}'")
            zf.write(source, arcname=destination)
    
    print(f'Zipped {len(copy_operations)} files to {args.output_zip}')