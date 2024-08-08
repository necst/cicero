import os
import csv
from rich.console import Console
from rich.table import Table

script_path = os.path.dirname(os.path.realpath(__file__))

if __name__ == '__main__':

    results = []
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

            results.append((comp, bench, opt, avg_time, avg_size, avg_codelocality))

    with open(os.path.join(script_path, 'compiletime_new_compiler.csv'), 'r') as file:
        reader = csv.reader(file)
        # Skip header
        next(reader)
        for row in reader:
            bench = row[0]
            opt = row[1] == 'True'
            avg_time = round(float(row[2]))

            res['NEW_CPP'][bench][opt][0] = avg_time

            # Substitute the average time within `results`
            for i, result in enumerate(results):
                if result[0] == 'NEW_CPP' and result[1] == bench and result[2] == opt:
                    results[i] = (result[0], result[1], result[2], avg_time, result[4], result[5])
                    break
            else:
                print(f"??? Could not find {bench} {opt} in the first file ???")
                quit(1)

    table = Table(title='[Fig 8, 9, 10] Compile time, instruction count and code locality of the new compiler compared to the old compiler')
    table.add_column("Compiler", style="bold")
    table.add_column("Benchmark", style="cyan")
    table.add_column('Opt Enabled?', style="purple")
    table.add_column("AVG compile time (microsec)", style="red")
    table.add_column("AVG instruction count ", style="green")
    table.add_column("AVG code locality ", style="magenta")

    for benchmark in ['protomata', 'brill', 'protomata4', 'brill4']:
        for comp in ['OLD_PYT', 'NEW_CPP']:
            for opt in [False, True]:
                table.add_row(comp, benchmark, str(opt), *map(str, res[comp][benchmark][opt]))
        table.add_row()

    # for result in results:
    #     table.add_row(*map(str, result))

    console = Console()
    console.print(table)