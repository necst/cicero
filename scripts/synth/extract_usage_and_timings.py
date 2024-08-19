'''
    This script automatically extracts from the build directories the maximum clock frequency,
    Total On-Chip Power (W), and the board utilization percentages of CLB LUTs, CLB Registers,
    and Block RAM Tiles.
'''

import os
import re
import csv
import glob
import sys
import csv

def extract_data(pattern, file):
    with open(file, 'r') as f:
        for line in f:
            if re.search(pattern, line):
                return re.sub(r'\s+', ',', line.strip())
    return None

def find_single_file(pattern, path):
    # Use glob
    matches =  glob.glob(f"{path}/**/{pattern}", recursive=True)

    if len(matches) != 1:
        print(f"Expected 1 file matching {pattern} in {path}, found {len(matches)}")
        for match in matches:
            print(f'\t{match}')
        raise Exception()

    return matches[0]

def extract_file_section(file_content, begin_section, end_section):
    begin_index = file_content.find(begin_section)
    if begin_index == -1:
        print(f"Could not find the begin section ({begin_section}) in the file")
        raise Exception()
    end_index = file_content.find(end_section)
    if end_index == -1:
        print(f"Could not find the end section ({end_section}) in the file")
        raise Exception()
    return file_content[begin_index:end_index]

def extract_from_table(file_lines, row_name, columns_in_row, target_column_index):
    for line in file_lines:
        if row_name in line:
            splitted_line = line.split('|')
            if len(splitted_line) != columns_in_row:
                print(f"The line does not contain a correct number of elements ({len(splitted_line)} != {columns_in_row})")
                raise Exception()
            return splitted_line[target_column_index].strip()

def synth_res_zynq(build_folder):

    timing_file = find_single_file("*_timing_summary_postroute_physopted.rpt", build_folder)
    util_file = find_single_file("*_utilization_placed.rpt", build_folder)
    power_file = find_single_file("*wrapper_power_routed.rpt", build_folder)

    # Find Worst Negative Slack (WNS) and clock period
    with open(timing_file, 'r') as file:
        content = file.read()

        # Extract from the content, the table containing the WNS
        wns_lines = extract_file_section(content, "Design Timing Summary", "Clock Summary").split('\n')

        # Find the line containing the WNS
        wns_line = -1
        for i, line in enumerate(wns_lines):
            if "WNS(ns)" in line:
                wns_line = i
                break
        if wns_line == -1:
            print("Could not find the WNS in the timing file ({timing_file})\n{content}")
            raise Exception()

        # Extract the WNS from the line below (2 lines below the one containing "WNS")
        target_line = wns_line + 2
        splitted_target_line = wns_lines[target_line].split()
        if len(splitted_target_line) != 12:
            print(f"The lines after the one that contains WNS does not contain a correct number of elements ({len(splitted_target_line)} != 12)")
        wns = float(splitted_target_line[0])

        # Extract the clock period (first reference to)
        clock_period_lines = extract_file_section(content, "Clock Summary", "Intra Clock Table").split('\n')
        clock_period = None
        for line in clock_period_lines:
            if 'clk_pl_0' in line:
                splitted_clock_line = line.split()
                if len(splitted_clock_line) != 5:
                    print(f"The clock line does not contain a correct number of elements ({len(splitted_clock_line)} != 5)")
                clock_period = float(splitted_clock_line[3])
                break
        if clock_period is None:
            print("Could not find the clock period in the timing file ({timing_file})")
            raise Exception()


    # clock_period and wns are in ns -> frequency in GHz -> multiply by 1000 to get MHz
    clock_max_frequency = (1 / (clock_period - wns)) * 1000

    with open(util_file, 'r') as file:
        file_lines = file.read().split('\n')
        CLB_LUTS = extract_from_table(file_lines, "CLB LUTs", 7, 5)
        CLB_REG = extract_from_table(file_lines, "CLB Registers", 7, 5)
        BRAM = extract_from_table(file_lines, "Block RAM Tile", 7, 5)

    with open(power_file, 'r') as file:
        file_lines = file.read().split('\n')
        total_power = extract_from_table(file_lines, "Total On-Chip Power (W)", 4, 2)

    return CLB_LUTS, CLB_REG, BRAM, total_power, clock_max_frequency

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python extract_usage_and_timings.py <build_directories> <output_csv>")
        exit(1)

    glob_pattern = sys.argv[1]
    output_csv = sys.argv[2]

    directories = glob.glob(glob_pattern)
    directories.sort()

    rows = []
    for directory in directories:
        try:
            CLB_LUTS, CLB_REG, BRAM, total_power, clock_max_frequency = synth_res_zynq(directory)
            rows.append([os.path.basename(directory), CLB_LUTS, CLB_REG, BRAM, total_power, clock_max_frequency])
        except Exception as e:
            print(f"Error while processing {directory}, skipping...")
            print(e)
    with open(output_csv, "w", newline="") as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(["Build Directory", "CLB LUTS (%)", "CLB REG (%)", "BRAM (%)", "Total On-Chip Power (W)", "Clock Max Frequency (MHz)"])
        writer.writerows(rows)
