'''
    Configuration file for the benchmarks on the old compiler:
    1. All REs/Inputs from AutoZoo Brill(4)/Protomata(4)
    2. OLD compiler only
    3. OLD 1x9 and OLD 1x16 bitstreams
'''


import os

# Number of regexes to run for each input (-1 for all)
REGEX_COUNT = 10000
# Number of inputs to match (-1 for all)
INPUT_COUNT = 10000

# Folder containing the bitstreams
script_dir = os.path.dirname(os.path.abspath(__file__))
BITSTEAM_FOLDER = os.path.join(script_dir, '..', '..', '..', 'bitstreams')

# Bitstreams to use
BITSTREAMS = [
    # 'bitstream file name (.bit file)'
    'OLD 1x9.bit',
    'OLD 1x16.bit',
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
    ('OLD_PYT', os.path.join(script_dir, '..', '..', '..', 'cicero_compiler')),
]