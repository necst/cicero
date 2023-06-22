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

WINDOWS = [1, 2]

VIVADO_SOURCE = "/new_xilinx/software/Vivado/2019.2/settings64.sh"

if len(sys.argv) != 3:
    print("Usage: python3 create_folder_and_synth.py <CREATING> <SYNTHESIS>")
    print("CREATING: True or False")
    print("SYNTHESIS: True or False")
    sys.exit(1)

SYNTHESIS = sys.argv[2] == "True"
CREATING = sys.argv[1] == "True"


def is_square(n):
    return n > 0 and (n**0.5).is_integer()


def copy_files(src_dir, dst_dir):
    for filename in os.listdir(src_dir):
        src_path = os.path.join(src_dir, filename)
        if os.path.isfile(src_path):
            shutil.copy(src_path, dst_dir)
        elif os.path.isdir(src_path):
            copy_files(src_path, dst_dir)


def main():

    script_path = os.path.dirname(os.path.abspath(__file__))

    for w in WINDOWS:
        print(f'++++ window={w} ++++')

        window_folder = os.path.join(script_path, f"build_ccid_{w}")
        os.makedirs(window_folder, exist_ok=True)

        src_folder = os.path.join(window_folder, "src")
        os.makedirs(src_folder, exist_ok=True)

        if CREATING:
            copy_files("hdl_src/rtl", src_folder)

            axi_top_file_path = f"{src_folder}/AXI_top.sv"
            with open(axi_top_file_path, "r") as f:
                content = f.read()
            content = re.sub(
                r"parameter BB_N\s*=\s*[0-9]*", f"parameter BB_N = 1", content)
            content = re.sub(
                r"parameter CC_ID_BITS\s*=\s*[0-9]*", f"parameter CC_ID_BITS = {w}", content)
            with open(axi_top_file_path, "w") as f:
                f.write(content)

        tcl_path = os.path.join(script_path, "script.tcl")
        shutil.copy(tcl_path, src_folder)

        if SYNTHESIS:
            build_folder = os.path.join(window_folder, "u96_single_1")
            os.makedirs(build_folder, exist_ok=True)
            print('Logging synth to synth.log')
            with open(os.path.join(window_folder, 'synth.log'), "w") as f:
                start_time = time.time()

                subprocess.run(
                    ["bash", "-c", f"source {VIVADO_SOURCE} && vivado -mode batch -source {tcl_path} -tclargs {build_folder} 1 {src_folder} single"], check=True, stdout=f)

                elapsed_time = time.time() - start_time
                print(
                    f"Elapsed time: {time.strftime('%H:%M:%S', time.gmtime(elapsed_time))}")


if __name__ == "__main__":
    main()
