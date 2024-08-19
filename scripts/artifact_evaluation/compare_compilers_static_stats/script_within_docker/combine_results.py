import os
import csv
import sys
from rich.console import Console
from rich.table import Table

script_path = os.path.dirname(os.path.realpath(__file__))

root_path = os.path.abspath(os.path.join(script_path, '..', '..', '..', '..'))
sys.path.append(os.path.join(root_path, 'scripts',
                'artifact_evaluation', 'benchmarks'))
from aggregate_benchmarks_results import plot_grouped_bar  # nopep8

BENCHMARKS = ['protomata', 'brill', 'protomata4', 'brill4']

if __name__ == '__main__':

    res = {}

    with open(os.path.join(script_path, 'all_compiletime_compilesize.csv'), 'r') as file:
        reader = csv.reader(file)
        # Skip header
        next(reader)
        for row in reader:
            comp = row[0]
            bench = row[1]
            opt = row[2] == 'O1'
            avg_time = round(float(row[3]) * 1000 * 1000)
            avg_size = round(float(row[10]))
            avg_codelocality = round(float(row[17]))

            if comp not in res:
                res[comp] = {}
            if bench not in res[comp]:
                res[comp][bench] = {}
            res[comp][bench][opt] = [avg_time, avg_size, avg_codelocality]

    with open(os.path.join(script_path, 'compiletime_new_compiler.csv'), 'r') as file:
        reader = csv.reader(file)
        # Skip header
        next(reader)
        for row in reader:
            bench = row[0]
            opt = row[1] == 'True'
            avg_time = round(float(row[2]))

            res['NEW_CPP'][bench][opt][0] = avg_time

    table = Table(
        title='[Fig 8, 9, 10] Compile time, instruction count and code locality of the new compiler compared to the old compiler')
    table.add_column("Compiler", style="bold")
    table.add_column("Benchmark", style="cyan")
    table.add_column('Opt Enabled?', style="purple")
    table.add_column("AVG compile time (microsec)", style="red")
    table.add_column("AVG instruction count ", style="green")
    table.add_column("AVG code locality ", style="magenta")

    for benchmark in BENCHMARKS:
        for comp in ['OLD_PYT', 'NEW_CPP']:
            for opt in [False, True]:
                table.add_row(comp, benchmark, str(opt), *
                              map(str, res[comp][benchmark][opt]))
        table.add_row()

    console = Console()
    console.print(table)

    data_for_plot_time = {}
    data_for_plot_codesize = {}
    data_for_plot_codelocality = {}
    for comp in ['OLD_PYT', 'NEW_CPP']:
        for opt in [False, True]:
            group_name = comp[:3] + (" w/" if opt else " w/o") + " opt"
            data_for_plot_time[group_name] = []
            data_for_plot_codesize[group_name] = []
            data_for_plot_codelocality[group_name] = []
            for benchmark in BENCHMARKS:
                data_for_plot_time[group_name].append(
                    res[comp][benchmark][opt][0])
                data_for_plot_codesize[group_name].append(
                    res[comp][benchmark][opt][1])
                data_for_plot_codelocality[group_name].append(
                    res[comp][benchmark][opt][2])

        #             plot_grouped_bar(data_for_plot, labels, os.path.join(
        # script_dir, 'fig11.png'), fig11title, 'Avg RE matching time', figsize=(10, 7))

    plot_grouped_bar(data_for_plot_codesize, BENCHMARKS, os.path.join(script_path, 'fig8.png'),
                     '[Fig 8] Instruction count comparison of the new and old compilers w/ and w/o optimizations', 'Avg instruction count per RE')
    plot_grouped_bar(data_for_plot_time, BENCHMARKS, os.path.join(script_path, 'fig9.png'),
                     '[Fig 9] Compile Time comparison of the new and old compilers w/ and w/o optimizations', 'Avg compile time (microsec) per RE', y_logscale=True)
    plot_grouped_bar(data_for_plot_codelocality, BENCHMARKS, os.path.join(script_path, 'fig10.png'),
                     '[Fig 8] Code Locality comparison of the new and old compilers w/ and w/o optimizations', 'Avg code locality per RE', y_logscale=True)
