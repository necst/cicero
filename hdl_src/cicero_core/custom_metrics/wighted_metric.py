# here any import works
# e.g. import numpy as np
import numpy as np


def perf_over_lut_metric(**kwargs) -> float:
    # only one metric per file is admitted
    # if you want another custom metric create a new file
    #print(kwargs)
    maxperf = 0.0
    minperf = 0.0
    freq = float(kwargs["frequency"])
    nc = float(kwargs["BB_N"])
    w = float(kwargs["CC_ID_BITS"])
    lut = float(kwargs["CLB LUTs*"])
    #lut = float(kwargs["CLB Registers"])
    maxperf = __max_perf(freq, nc, w)
    minperf = __min_perf(freq,nc)
    perf = np.array([maxperf,minperf])
    return -float(np.average(perf)/lut)

def __max_perf(freq,ncore,window):
    # Care the underscores '__' are mandatory for helper functions
    # This function won't show as a metric is here only for helping purposes
    time = __time_opt(freq,window)
    return float((1/time)*8*ncore*np.log(ncore))

def __time_opt(freq,window):
    return float(1/(freq/1000)/(2**window-1))


def __min_perf(freq,nc):
    time = 0.0
    time = __time_worst(freq)
    return (1/time)*8*nc*np.log(nc)

def __time_worst(freq):
    #assuming mhz as input
    return float(1/(freq/1000))