
import json
import sys
import re
from vcdvcd import VCDVCD
import matplotlib
import matplotlib.pyplot as plt


if len(sys.argv) > 1:
    vcd_path = sys.argv[1]
else:
    #vcd_path = "C:\\Users\\danie\\Documents\\GitHub\\regex_coprocessor_safe\\proj\\regex_copro\\regex_copro.sim\\sim_1\\behav\\xsim\\test.vcd"
    vcd_path = "test.vcd"
    #print('Give me a vcd file to parse')
    #sys.exit(-1)
signal_regexp = [".*anEngine.in.*valid"]
signal_exact  = []
# Do the parsing.
vcd         = VCDVCD(vcd_path, only_sigs=True)
all_signals = vcd.signals
selected_signals = []
for aSignal in all_signals:
    for reg in signal_regexp:
        r = re.compile(reg)
        if ( r.search(aSignal)):
            selected_signals.append(aSignal)
    if aSignal in signal_exact:
        selected_signals.append(aSignal)

vcd = VCDVCD(
        vcd_path,
        signals=selected_signals,
        store_tvs=True
        )        

# Get a signal by human readable name.
for aSignalName in selected_signals:
    signal = vcd[aSignalName]
    t    = range(1,10)
    s    = signal[1:10]
    print(aSignalName,)
    fig, ax = plt.subplots()
    ax.plot(t, s)

    plt.show()
