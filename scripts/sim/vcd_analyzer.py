
from collections import deque
import json
import sys
import re
from typing import Text
from vcdvcd import VCDVCD
import numpy as np
import matplotlib
import matplotlib.pyplot as plt


HIERARCHY_DELIMITER = '.'

def lower_hierarchy(path, subPath):
    
    return path+HIERARCHY_DELIMITER+subPath

def raise_hierarchy(path, n=1):
    while n > 0:
        new_path_index = path.rfind(HIERARCHY_DELIMITER)
        path = path[:new_path_index]
        n -=1
    return path

def getSignalsByRegex(vcd, reg_string):
    regex = re.compile(reg_string)
    return vcd[regex]

def getEngines(vcd):
    reg    = re.compile(".*anEngine\.clk$")
    return  vcd[reg]

def getModule(vcd, module_name):
    reg     = re.compile(f".*{module_name}$")
    return  vcd[reg]
    

def getClockPeriod(vcd):
    clk_signal = getSignalsByRegex(vcd, ".*clk")[0]
    clk_signal = vcd[clk_signal].tv
    clk_period = (clk_signal[2][0] - clk_signal[1][0])*2
    return clk_period

def remove_non_maximal_scopes(scopes):
    i=0
    j=0
    while i +1 < len(scopes):
        e = scopes[i]
        j = i+1
        while(j< len(scopes)):
            if scopes[j].find(e) >= 0:
                del scopes[j]
            else:
                j+=1
        i+=1
    return scopes

if len(sys.argv) > 1:
    vcd_path = sys.argv[1]
else:
    #vcd_path = "C:\\Users\\danie\\Documents\\GitHub\\regex_coprocessor_safe\\proj\\regex_copro\\regex_copro.sim\\sim_1\\behav\\xsim\\test.vcd"
    vcd_path = "test4_regex22_string1.vcd"
    #vcd_path = "test_1.vcd"
    #print('Give me a vcd file to parse')
    #sys.exit(-1)

vcd = VCDVCD(
        vcd_path,
        store_tvs=True,
        store_scopes=True
        )        
#for s in vcd.signals:
#    print(s)

clk_period = getClockPeriod(vcd)
print(f'clock: {clk_period} {vcd.timescale["unit"]}')

copro      = vcd[re.compile('.*a_regex_coprocessor$')]
cur_state  = copro[re.compile('cur_state.*$')]
#print(cur_state.tv)

REGEX_COPRO_S_IDLE                          =0
REGEX_COPRO_S_FETCH_1ST_CC                  =1
REGEX_COPRO_S_FETCH_NEXT_CC                 =2
REGEX_COPRO_S_NO_FETCH_NEXT_CC              =3
REGEX_COPRO_S_EXEC                          =4
REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING   =5
REGEX_COPRO_S_COMPLETE_ACCEPTING            =6
REGEX_COPRO_S_ERROR                         =7

fetch_states  = [REGEX_COPRO_S_FETCH_1ST_CC, REGEX_COPRO_S_FETCH_NEXT_CC,REGEX_COPRO_S_NO_FETCH_NEXT_CC]
fetch_instant = list(map(lambda x: x[0],filter(lambda x: x[1] != 'x' and int(x[1],2) in fetch_states,  cur_state.tv)))
start_exe     = fetch_instant[ 0]
end_exe       = fetch_instant[-1]
duration_exe  = end_exe-start_exe
duration_exe_cc = duration_exe//clk_period
start_end_cc  = list(zip(fetch_instant[:-2],fetch_instant[1:-1] ))
#engines = getEngines(vcd)
#print(engines[0][re.compile('.*a_cache.clk$')])

engine_scopes = vcd[re.compile('.*anEngine$')]
engine_scopes = remove_non_maximal_scopes(engine_scopes)
executed_instructions = []

exe_per_engine = np.zeros((len(fetch_instant)-2, len(engine_scopes)))

for cc_i, (start_cc, end_cc) in enumerate(start_end_cc):
    print(f'Fetch {cc_i}')
    for e_i,e in enumerate(engine_scopes):
        
        in_boundle = vcd[e]['in']
        #print(in_boundle.subElements)
        #print(in_boundle.name)
        valid_data_ready_boundle = zip(in_boundle['valid'][start_cc:end_cc:clk_period], in_boundle['ready'][start_cc:end_cc:clk_period], in_boundle[re.compile('data.*')][start_cc:end_cc:clk_period])
        valid_data_ready         = filter(lambda x: x[0]=='1' and x[1]=='1' and x[2] != 'x', valid_data_ready_boundle)
        valid_data               = list(map(lambda x: x[2], valid_data_ready))

        for d in valid_data:
            #print(d)
            value = int(d,2)
            pc    = value //2
            pc_is_directed_to_current = value %2
            executed_instructions.append((pc_is_directed_to_current,pc))
        exe_per_engine[cc_i, e_i] = len(valid_data)
        print(f'\tEngine_{e_i} executed {len(valid_data)} instruction{ "s" if len(valid_data)> 1 else ""}')

def plot_engine_valid_in(engine_scopes, fetch_instant):
    fig, axes = plt.subplots(max(len(engine_scopes),2), sharex=True, sharey=True)
    for e_i,e in enumerate(engine_scopes):
        #in
        in_boundle = vcd[e]['in']
        in_valid_ready_boundle = list(map(lambda x: x[0]=='1' and x[1]=='1' , zip(in_boundle['valid'][start_exe:end_exe:clk_period] , in_boundle['ready'][start_exe:end_exe:clk_period])))
        #out
        out_boundle = vcd[e]['out']
        out_valid_ready_boundle = list(map(lambda x: x[0]=='1' and x[1]=='1', zip(out_boundle['valid'][start_exe:end_exe:clk_period], out_boundle['ready'][start_exe:end_exe:clk_period])))
        
        #plot valid&ready input signal
        axes[e_i].axhline(0, color='.5')
        plot_digital_signal(axes[e_i], np.arange(start_exe,end_exe,clk_period), in_valid_ready_boundle, label="in")

        offset = 1.5
        axes[e_i].axhline(offset, color='.5')
        plot_digital_signal(axes[e_i], np.arange(start_exe,end_exe,clk_period), offset+np.array(out_valid_ready_boundle),label='out', colour='blue')

        for f in fetch_instant:
            axes[e_i].axvline(f, color='g')
        
        latency_signal = list(map(lambda x: int(x,2),in_boundle[re.compile('latency.*')][start_exe:end_exe:clk_period]))
        axes[e_i].step(np.arange(start_exe,end_exe,clk_period), offset*2+np.array(latency_signal), label='latency_in')
    
        axes[e_i].set_ylabel(f'Engine_{e_i}')
        
    axes[0].legend()
    plt.show()

def plot_digital_signal(ax, x,y, clock_ticks=True, colour='r', label=''):
    ax.axhline(0, color='.5')
    if(clock_ticks):
        for a_x in x:
            ax.axvline(a_x, color='.5', linestyle='--', linewidth=0.5)
    ax.step(x, y, colour, label=label)
        
plot_engine_valid_in(engine_scopes, fetch_instant)

def plotHeatmap(heatmap, x_labels, y_labels ):
    fig, ax = plt.subplots()
    im = ax.imshow(heatmap)
    ax.set_xticks(np.arange(len(x_labels)))
    ax.set_yticks(np.arange(len(y_labels)))
    ax.set_yticklabels(['ch_' +str(e) for e in range(len(y_labels))])
    ax.set_xticklabels(['eng_'+str(e) for e in range(len(x_labels))])
    # Rotate the tick labels and set their alignment.
    plt.setp(ax.get_xticklabels(), rotation=45, ha="right",
         rotation_mode="anchor")
    # Loop over data dimensions and create text annotations.
    for i in range(len(y_labels)):
        for j in range(len(x_labels)):
            if heatmap[i, j] > 0:
                ax.text(j, i,f'{heatmap[i, j]} ({int(100*heatmap[i, j]/sum(heatmap[i,:])) }%)',ha="center", va="center", color="w")
    ax.set_title("Instructions executed by each Engine per each character")
    fig.tight_layout()
    plt.show()

plotHeatmap(exe_per_engine,engine_scopes, start_end_cc)

BramScope = vcd[re.compile('.*a?(b|B)ram$')]
#print(BramScope)
valid_data_ready_boundle = BramScope['r_valid'][start_exe:end_exe:clk_period]
valid_data_ready         = list(filter(lambda x: x[0]=='1', valid_data_ready_boundle))
print(f'Memory utilization: {len(valid_data_ready)} / {duration_exe_cc} cc ({len(valid_data_ready)*clk_period/vcd.endtime}% )')

print(f'~ CPI {duration_exe_cc//len(executed_instructions)} ')