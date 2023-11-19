'''
    This script is used to plot the output of `measure_all.py`
'''

import csv
import matplotlib.pyplot as plt


def do_box_plot(data_offsets: int, data_multiplier: int, title: str):
    # open the CSV file
    with open('/home/andrea/src/cicero_scripts/measure_compiletime_compilesize/all_compiletime_compilesize.csv', 'r') as file:
        # create a CSV reader object
        reader = csv.reader(file)

        # skip the header row
        next(reader)

        # create a list of dictionaries for each box
        boxes = []
        for row in reader:
            box = {
                'label': f'{row[0][0:3]}-{row[1][0:5]}-{row[2]}',
                'med': float(row[7+ data_offsets]) * data_multiplier,
                'q1': float(row[6+ data_offsets]) * data_multiplier,
                'q3': float(row[8+ data_offsets]) * data_multiplier,
                'whislo': float(row[4+ data_offsets]) * data_multiplier,
                'whishi': float(row[5+ data_offsets]) * data_multiplier,
                'fliers': []
            }
            boxes.append(box)

    # create the box plot
    fig, ax = plt.subplots()

    # add each box to the plot
    for i, box in enumerate(boxes, start=1):
        ax.bxp([box], positions=[i])

    plt.title(title)

    # show the plot
    plt.show()

do_box_plot(0, 1000, 'Compile time (ms) of a regex divided by compiler, benchmark, and with optimizations on/off')
do_box_plot(7, 1, 'Compile size (in line of code) of a regex divided by compiler, benchmark, and with optimizations on/off')
