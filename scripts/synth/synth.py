'''
    This script copies the files from hdl_src/rtl to a different build folder for each window size,
    and optionally runs the synthesis.
'''

import os
import shutil
import subprocess
import sys
import re
import time
import concurrent.futures
from rich.console import Console
from rich.table import Table

try:
    import send_message
except ImportError:
    print('Optional file "send_message" not found, messages will only be printed to console.')
    class DummyMessageSender:
        @staticmethod
        def send_msg(msg):
            pass
    send_message = DummyMessageSender


# Number of configurations to be built in parallel (None to use all available cores)
MAX_WORKERS = 1

CONFIGURATIONS = [
    # (cc_id_bits, bb_n, is_vectorial)
]

for is_vectorial in [True]:
    for cc_id_bits in [4, 5]:
        for bb_n in [1, 4, 9, 16]:
            CONFIGURATIONS.append((cc_id_bits, bb_n, is_vectorial))

VIVADO_SOURCE = "/new_xilinx/software/Vivado/2019.2/settings64.sh"

if len(sys.argv) != 3:
    print(f"Usage: {sys.argv[0]} <CREATING> <SYNTHESIS>")
    print("\tCREATING: True or False")
    print("\tSYNTHESIS: True or False")
    sys.exit(1)

SYNTHESIS = sys.argv[2] == "True"
CREATING = sys.argv[1] == "True"


def copy_files(src_dir, dst_dir):
    for filename in os.listdir(src_dir):
        src_path = os.path.join(src_dir, filename)
        if os.path.isfile(src_path):
            shutil.copy(src_path, dst_dir)
        elif os.path.isdir(src_path):
            copy_files(src_path, dst_dir)

script_path = os.path.abspath(__file__)
repo_path = script_path
for i in range(3):
    repo_path = os.path.dirname(repo_path)

def process_configuration(configuration):
    try:
        cc_id_bits, bb_n, is_vectorial = configuration
        print(f'[cc_id_bits: {cc_id_bits}, bb_n: {bb_n}, is_vectorial: {is_vectorial}]: Starting...')
        window_folder = os.path.join(repo_path, 'builds', f"{'vect' if is_vectorial else 'base'}_cc_id_{cc_id_bits}_bb_n_{bb_n}")
        os.makedirs(window_folder, exist_ok=True)

        src_folder = os.path.join(window_folder, "src")
        os.makedirs(src_folder, exist_ok=True)

        if CREATING:
            copy_files(os.path.join(repo_path, 'hdl_src', 'rtl'), src_folder)

            axi_top_file_path = f"{src_folder}/AXI_top.sv"
            with open(axi_top_file_path, "r") as f:
                content = f.read()
            content = re.sub(
                r"parameter BB_N\s*=\s*[0-9]*", f"parameter BB_N = {bb_n}", content)
            content = re.sub(
                r"parameter CC_ID_BITS\s*=\s*[0-9]*", f"parameter CC_ID_BITS = {cc_id_bits}", content)
            with open(axi_top_file_path, "w") as f:
                f.write(content)
            
            if is_vectorial is False:
                engine_interfaced_file_path = f"{src_folder}/engine_interfaced.sv"
                with open(engine_interfaced_file_path, "r") as f:
                    content = f.read()
                content = content.replace("vectorial_engine", "engine")
                with open(engine_interfaced_file_path, "w") as f:
                    f.write(content)

        shutil.copy(os.path.join(os.path.dirname(script_path), "vivado_synth.tcl"), window_folder)
        tcl_path = os.path.join(window_folder, "vivado_synth.tcl")

        if SYNTHESIS:
            build_folder = os.path.join(window_folder, "u96_single_1")
            os.makedirs(build_folder, exist_ok=True)
            print(f'Logging synth to {src_folder}/synth.log')
            with open(os.path.join(window_folder, 'synth.log'), "w") as f:
                start_time = time.time()

                subprocess.run(
                    ["bash", "-c", f"source {VIVADO_SOURCE} && vivado -mode batch -source {tcl_path} -tclargs {build_folder} 1 {src_folder} single"], check=True, stdout=f)

                elapsed_time = time.time() - start_time

                message = f"[cc_id_bits: {cc_id_bits}, bb_n: {bb_n}, is_vectorial: {is_vectorial}]: synth finished in {time.strftime('%H:%M:%S', time.gmtime(elapsed_time))}"
                print(message)

                try:
                    send_message.send_msg(message)
                except e:
                    print('error sending message', e)
    except Exception as e:
        message = f"Error in configuration {configuration}: {e}"
        print(message)
        send_message.send_msg(message)


def main():

    # Print rich table with configurations
    table = Table(title="Configurations")
    table.add_column("cc_id_bits", style="cyan")
    table.add_column("bb_n", style="magenta")
    table.add_column("is_vectorial", style="green")
    for cc_id_bits, bb_n, is_vectorial in CONFIGURATIONS:
        table.add_row(str(cc_id_bits), str(bb_n), str(is_vectorial))
    console = Console()
    console.print(table)

    print(f'MAX_WORKERS: {MAX_WORKERS}; CREATING: {CREATING}; SYNTHESIS: {SYNTHESIS}\nStarting in 10 seconds...')

    if SYNTHESIS:
        try:
            time.sleep(10)
        except KeyboardInterrupt:
            print('Cancelled by user, quitting...')
            return

    with concurrent.futures.ProcessPoolExecutor(max_workers=MAX_WORKERS) as executor:
        futures = [executor.submit(process_configuration, config) for config in CONFIGURATIONS]
        concurrent.futures.wait(futures)


if __name__ == "__main__":
    main()
    if SYNTHESIS:
        send_message.send_msg('Finished')