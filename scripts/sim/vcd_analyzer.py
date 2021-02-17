
import json
import sys
import re
from vcdvcd import VCDVCD
import matplotlib
import matplotlib.pyplot as plt

def raise_hierarchy(path):
    delimiter = '.'
    new_path_index = path.rfind(delimiter)
    return path[:new_path_index]

def getSignalByRegex(vcd, reg):
    l    = []
    flag = True
    r    = re.compile(reg)
    for aSignal in vcd.signals:
        #print(r.search(aSignal))
        if ( r.search(aSignal)):
            l.append(aSignal)
            #print(aSignal)
    if len(l)==0:
        return None
    return l

if len(sys.argv) > 1:
    vcd_path = sys.argv[1]
else:
    vcd_path = "C:\\Users\\danie\\Documents\\GitHub\\regex_coprocessor_safe\\proj\\regex_copro\\regex_copro.sim\\sim_1\\behav\\xsim\\test.vcd"
    #vcd_path = "test copy.vcd"
    #print('Give me a vcd file to parse')
    #sys.exit(-1)

vcd = VCDVCD(
        vcd_path,
        store_tvs=True
        )        
#for s in vcd.signals:
#    print(s)
signal_regexp = [".*anEngine\.in\.valid"]
signal_exact  = []
# Do the parsing.
selected_signals = []
for regex in signal_regexp:
    for s in getSignalByRegex(vcd, regex):
        selected_signals.append(s)
for aSignal in vcd.signals:
    if aSignal in signal_exact:
        selected_signals.append(aSignal)

clk_signal = getSignalByRegex(vcd, ".*clk")[0]
clk_signal = vcd[clk_signal].tv

clk_period = (clk_signal[2][0] - clk_signal[1][0])*2
print('clock:', clk_period)



#print("AVAILABLE SIGNALS")
#print('\n'.join(vcd.signals))
# Get a signal by human readable name.
instruction_executed = []
last_time_executed   = 0
first_time_executed  = 0
never_executed       = True

for aSignalName in selected_signals:
    signal              = vcd[aSignalName]
    instants_when_valid = map(lambda x: x[0],filter(lambda x: x[1] =='1', enumerate(signal[::clk_period])))

    print(aSignalName)
    group_bundle     = raise_hierarchy(aSignalName)
    group_bundle     = re.escape(group_bundle)

    print(group_bundle)
    data_signal_name = getSignalByRegex(vcd, group_bundle+"\.data.*")
    data_signal_name = data_signal_name[0]
    data_signal      = vcd[data_signal_name]

    for instant in instants_when_valid:
        if data_signal[instant*clk_period] in ['x','z']:
            continue
        value = int(data_signal[instant*clk_period],2)

        if never_executed:
            never_executed = False
            first_time_executed = instant*clk_period
            last_time_executed  = instant*clk_period
        else:
            first_time_executed = min(first_time_executed ,instant*clk_period)
            last_time_executed  = max(last_time_executed  ,instant*clk_period)
        #lsb indicate is directed to current
        pc                = value//2
        is_for_current_pc = value %2
        instruction_executed.append((is_for_current_pc,pc))
    #v   = signal[0:]
    #d   = data_signal[0:]
    #fig, ax = plt.subplots(2)
    #ax[0].plot( d)
    #ax[1].plot( v)
    #plt.show()


print('instructions executed')
for instr in instruction_executed:
    print(instr)
print('~ cpi:', len(instruction_executed)*clk_period/(last_time_executed-first_time_executed))