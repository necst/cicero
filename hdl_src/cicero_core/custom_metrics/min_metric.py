# here any import works
# e.g. import numpy as np
import numpy as np

def min_perf_metric(**kwargs) -> float:
    perf = 0.0
    freq = float(kwargs["frequency"])
    nc = float(kwargs["BB_N"])
    time = 0.0
    time = __time_worst(freq)
    perf = (1/time)*8*np.log(nc)
    return perf

def __maxim_perf(a):
    # Care the underscores '__' are mandatory for helper functions
    # This function won't show as a metric is here only for helping purposes
    return a + 1000

def __time_worst(freq):
    #assuming mhz as input
    return float(1/(freq/1000))
