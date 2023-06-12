'''
    This script generates the input and regex files to be run by AXI_top_tb_from_compiled.sv
'''

import sys
import os

# Get the path of the script
script_path = os.path.dirname(os.path.abspath(__file__))

# Include re2compiler
sys.path.append(os.path.join(script_path, "..", "..", "cicero_compiler"))
import re2compiler

if len(sys.argv) != 3:
    print("Usage: python generate.py <input> <regex>")
    sys.exit(1)

input_str = sys.argv[1]
input_regex = sys.argv[2]

# Compile the regex
compiled_regex = re2compiler.compile(data=input_regex)

with open("input.csv", "w") as input_file:
    byte_list = input_str.encode('ascii', 'replace')+ b'\0' 
    for b in byte_list:
        input_file.write(str(int(b))+'\n')

with open("regex.txt", "w") as regex_file:
    regex_file.write(compiled_regex)