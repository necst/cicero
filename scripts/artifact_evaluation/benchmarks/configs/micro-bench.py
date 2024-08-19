'''
    Configuration file for the micro-benchmarks: first 100 REs and Inputs from AutoZoo Brill(4)/Protomata(4) on NEW compiler
'''


import os

# Number of regexes to run for each input (-1 for all)
REGEX_COUNT = 100
# Number of inputs to match (-1 for all)
INPUT_COUNT = 100

# Folder containing the bitstreams
script_dir = os.path.dirname(os.path.abspath(__file__))
BITSTEAM_FOLDER = os.path.join(script_dir, '..', '..', '..', 'bitstreams')

# Bitstreams to use
BITSTREAMS = [
    # 'bitstream file name (.bit file)'
    # 'OLD 1x1.bit',
]
import glob
BITSTREAMS = [os.path.basename(f) for f in glob.glob(os.path.join(BITSTEAM_FOLDER, '*.bit'))]

# Benchmart to run
BENCHMARKS = [
    # ('benchmark_name', 'input_strings_path', 'input_regexes_path')
    ('brill', 'INs/autozoo_brill.input', 'REs/autozoo_brill.regex'),
    ('protomata', 'INs/autozoo_protomata.input', 'REs/autozoo_protomata.regex'),
    ('brill4', 'INs/autozoo_brill.input', 'REs/autozoo_brill4.regex'),
    ('protomata4', 'INs/autozoo_protomata.input', 'REs/autozoo_protomata4.regex'),
]

COMPILERS = [
    # (Compiler name, compiler path)
    ('NEW_CPP', os.path.join(script_dir, '..', '..', '..', 'cicero_compiler_cpp')),
]