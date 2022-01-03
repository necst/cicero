# here any import works
# e.g. import numpy as np
import numpy as np

def instr_mem_size(**kwargs) -> float:
    perf = 0.0
    isize = float(kwargs["PC_WIDTH"])
    perf = __helper_funct(isize)
    return -perf

def __helper_funct(isize):
    # Care the underscores '__' are mandatory for helper functions
    # This function won't show as a metric is here only for helping purposes
    return 2**isize
