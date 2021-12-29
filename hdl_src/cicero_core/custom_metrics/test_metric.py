# here any import works
# e.g. import numpy as np
import numpy as np


def max_perf_metric(**kwargs) -> float:
    # only one metric per file is admitted
    # if you want another custom metric create a new file
    #print(kwargs)
    perf = 0.0
    freq = float(kwargs["frequency"])
    nc = float(kwargs["BB_N"])
    w = float(kwargs["CC_ID_BITS"])
    perf = __max_perf(freq, nc, w)
    return perf

def __maxim_perf(a):
    # Care the underscores '__' are mandatory for helper functions
    # This function won't show as a metric is here only for helping purposes
    return a + 1000

def __max_perf(freq,ncore,window):
    time = __time_opt(freq,window)
    return float((1/time)*8*np.log(ncore))

def __time_opt(freq,window):
    return float(1/(freq/1000)/(2**window-1))
