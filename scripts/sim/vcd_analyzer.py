
from collections import deque
import json
import sys
import re
from typing import Text
from vcdvcd import VCDVCD
import bisect
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
	vcd_path = "C:\\Users\\danie\\Documents\\GitHub\\regex_coprocessor_safe\\proj\\regex_copro\\regex_copro.sim\\sim_1\\behav\\xsim\\test.vcd"
	#vcd_path = "test4_regex22_string1.vcd"
	#vcd_path = "test2x2_regex22_string1.vcd"
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
cli		   = False
full_screen= False
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
#list instruction loaded on the engines
for cc_i, (start_cc, end_cc) in enumerate(start_end_cc):
	if cli:
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
		if cli:
			print(f'\tEngine_{e_i} executed {len(valid_data)} instruction{ "s" if len(valid_data)> 1 else ""}')

def press_handler_creator(draw_graph_i, num_graphs):
	graph_number = 0
	 
	def press(event):
		nonlocal graph_number
		nonlocal num_graphs

		#print('press', event.key)
		sys.stdout.flush()
		if event.key == 'right' or event.key == 'down' :
			if(graph_number == num_graphs-1):
				fig = plt.figure(0)
				fig.text(0,0,"last available graph")
				plt.draw()
				plt.pause(0.001)
			else:
				graph_number += 1
				#clear previous fig
				fig = plt.figure(0)
				fig.clf()
				draw_graph_i(graph_number)
				#set full screen
				#fig.canvas.manager.full_screen_toggle()
				#add event keypress
				fig.canvas.mpl_connect('key_press_event', press)
				fig.tight_layout()
				plt.draw()
				plt.pause(0.001)
		elif (event.key == 'left' or event.key == 'up') :
			if( graph_number == 0):
				fig = plt.figure(0)
				fig.text(0,0,"first available graph")
				plt.draw()
				plt.pause(0.001)
			else: 
				graph_number += -1
				#clear previous fig
				fig = plt.figure(0)
				fig.clf()
				draw_graph_i(graph_number)
				#set full screen
				#fig.canvas.manager.full_screen_toggle()
				#add event keypress
				#fig.canvas.mpl_connect('key_press_event', press)
				fig.tight_layout()
				plt.draw()
				plt.pause(0.001)
		elif event.key in [ 'ctrl+c','escape']:
			fig = plt.figure(0)
			plt.close(fig)
			
	return press

def plot_engine_valid_in(engine_scopes, fetch_instant):
	
	engine_data = {}
	for e_i,e in enumerate(engine_scopes):
		#in
		in_boundle = vcd[e]['in']
		in_validANDready_boundle = list(map(lambda x: x[0]=='1' and x[1]=='1' , zip(in_boundle['valid'][start_exe:end_exe:clk_period] , in_boundle['ready'][start_exe:end_exe:clk_period])))
		#out
		out_boundle = vcd[e]['out']
		out_validANDready_signal = list(map(lambda x: x[0]=='1' and x[1]=='1', zip(out_boundle['valid'][start_exe:end_exe:clk_period], out_boundle['ready'][start_exe:end_exe:clk_period])))
		
		latency_signal 			 = list(map(lambda x: int(x,2),in_boundle[re.compile('latency.*')][start_exe:end_exe:clk_period]))
		#plot valid&ready input signal
		engine_data[e] = {}
		engine_data[e]['in'        ] 	 = in_validANDready_boundle
		engine_data[e]['out'       ] 	 = out_validANDready_signal
		engine_data[e]['latency_in'] 	 = latency_signal

	fetch_instant_data = list(map(lambda x: (x-start_exe)//clk_period ,fetch_instant))
	
	memory_data = list(map(lambda x: x[0]=='1', vcd[re.compile('.*a?(b|B)ram$')]['r_valid'][start_exe:end_exe:clk_period]))

	n_elements_per_subPlot = 100
	tot_number_of_subgraph = ((end_exe-start_exe)//clk_period)//n_elements_per_subPlot
	
	def plot_i_esim(i):
		nonlocal memory_data
		nonlocal engine_data
		nonlocal fetch_instant_data
		nonlocal n_elements_per_subPlot
		offset = 1.5
		fig = plt.figure(0)
		fig.clf()

		start_exe = i*n_elements_per_subPlot
		end_exe   = (i+1)*n_elements_per_subPlot
		n_engines = len(engine_data.keys())
		f_start = bisect.bisect_left(fetch_instant_data,start_exe)
		for e_i,e in enumerate(engine_data):
			if e_i == 0:
				ax = fig.add_subplot(n_engines+1,1,(e_i+2))
			else:
				ax = fig.add_subplot(n_engines+1,1,(e_i+2), sharex=ax, sharey=ax)
			#display instruction in/out and latency reported for each engine
			ax.axhline(0, color='.5')
			plot_digital_signal(ax, np.arange(start_exe,end_exe,1), engine_data[e]['in'     ][start_exe:end_exe], label="in")
			
			ax.axhline(offset, color='.5')
			plot_digital_signal(ax, np.arange(start_exe,end_exe,1), offset+np.array(engine_data[e]['out'    ][start_exe:end_exe]),label='out', colour='blue')

			ax.axhline(offset*2, color='.5')
			ax.step(np.arange(start_exe,end_exe,1), offset*2+np.array(engine_data[e]['latency_in'    ][start_exe:end_exe]), label=f'latency_in + {offset*2}')
		
			#mark each time we moved to a new char
			for f in fetch_instant_data[f_start:]:
				if f >= start_exe and f < end_exe:
					#print(f)
					ax.axvline(f, color='g')
				else:
					break
			ax.set_ylabel(f'Engine_{e_i}')
			if e_i == 0:
				plt.legend( loc='upper left')

		#Memory utilization
		ax = fig.add_subplot(n_engines+1,1,1, sharex=ax)
		plot_digital_signal(ax, np.arange(start_exe,end_exe,1), memory_data[start_exe:end_exe] ,label='memory_req', colour='blue')
		#Add a textual repr
		for start_ch, end_ch in zip(fetch_instant_data[f_start:], fetch_instant_data[f_start+1:]):
			if start_ch >= start_exe and start_ch < end_exe:
				#print(f)
				ax.axvline(start_ch, color='g')
				memory_line_in_period = memory_data[start_ch:end_ch]
				memory_request        = sum(memory_line_in_period)
				ax.text((start_ch+end_ch)//2, 0.5,f'{memory_request} ({int(100*memory_request/(end_ch-start_ch))}%)',ha="center", va="center")
				
			else:
				break
		ax.set_yticks([0,1])
		ax.set_ylabel('Memory access')

		fig.tight_layout()
		fig.canvas.set_window_title(f'engines: {vcd_path}')
		plt.legend( loc='upper left')
		plt.draw()
		plt.pause(0.001)


	fig = plt.figure(0)
	fig.clf()
	plot_i_esim(0)
	press_handler = press_handler_creator(plot_i_esim,tot_number_of_subgraph)
	#print(press_handler)
	if(full_screen):
		fig.canvas.manager.full_screen_toggle()
	fig.canvas.mpl_connect('key_press_event', press_handler)
	fig.tight_layout()
	plt.draw()
	plt.pause(0.001)
	input("press a key to close")


def plot_cpu_valid_in(vcd, fetch_instant):
	cpu_scopes = vcd[re.compile('.*regex_cpu$')]
	cpu_scopes = remove_non_maximal_scopes(cpu_scopes)
	
	engine_data = {}
	for e_i,e in enumerate(cpu_scopes):
		
		#in
		in_boundle = list(zip(vcd[e]['input_pc_valid'][start_exe:end_exe:clk_period], vcd[e]['input_pc_ready'][start_exe:end_exe:clk_period], vcd[e][re.compile('input_pc\[.*')][start_exe:end_exe:clk_period]))
		in_validANDready_boundle 	 = list(map(lambda x: x[0]=='1' and x[1]=='1', in_boundle ))
		in_validANDnot_ready_boundle = list(map(lambda x: x[0]=='1' and x[1]=='0', in_boundle ))
		#out
		out_boundle = zip(vcd[e]['output_pc_valid'][start_exe:end_exe:clk_period], vcd[e]['output_pc_ready'][start_exe:end_exe:clk_period], vcd[e][re.compile('output_pc\[.*')][start_exe:end_exe:clk_period])
		out_validANDready_signal = list(map(lambda x: x[0]=='1' and x[1]=='1', out_boundle))
		#plot valid&ready input signal
		engine_data[e] = {}
		engine_data[e]['in'        ] 	 = in_validANDready_boundle
		engine_data[e]['in_valid'  ]	 = in_validANDnot_ready_boundle
		engine_data[e]['out'       ] 	 = out_validANDready_signal

	fetch_instant_data = list(map(lambda x: (x-start_exe)//clk_period ,fetch_instant))
	
	memory_data = list(map(lambda x: x[0]=='1', vcd[re.compile('.*a?(b|B)ram$')]['r_valid'][start_exe:end_exe:clk_period]))

	n_elements_per_subPlot = 100
	tot_number_of_subgraph = ((end_exe-start_exe)//clk_period)//n_elements_per_subPlot
	
	def plot_i_esim(i):
		nonlocal memory_data
		nonlocal engine_data
		nonlocal fetch_instant_data
		nonlocal n_elements_per_subPlot
		offset = 1.5
		fig = plt.figure(0)
		fig.clf()

		start_exe = i*n_elements_per_subPlot
		end_exe   = (i+1)*n_elements_per_subPlot
		n_engines = len(engine_data.keys())
		f_start = bisect.bisect_left(fetch_instant_data,start_exe)
		for e_i,e in enumerate(engine_data):
			if e_i == 0:
				ax = fig.add_subplot(n_engines+1,1,(e_i+2))
			else:
				ax = fig.add_subplot(n_engines+1,1,(e_i+2), sharex=ax, sharey=ax)
			#display instruction in/out and latency reported for each engine
			ax.axhline(0, color='.5')
			plot_digital_signal(ax, np.arange(start_exe,end_exe,1), engine_data[e]['in_valid'][start_exe:end_exe], label="in_valid_and_!ready", fill=True, colour='orange')
			plot_digital_signal(ax, np.arange(start_exe,end_exe,1), engine_data[e]['in'     ][start_exe:end_exe], label="in")
			
			ax.axhline(offset, color='.5')
			plot_digital_signal(ax, np.arange(start_exe,end_exe,1), offset+np.array(engine_data[e]['out'    ][start_exe:end_exe]),label='out', colour='blue')

			#mark each time we moved to a new char
			for f in fetch_instant_data[f_start:]:
				if f >= start_exe and f < end_exe:
					#print(f)
					ax.axvline(f, color='g')
				else:
					break
			ax.set_ylabel(f'Engine_{e_i}')
			if e_i == 0:
				plt.legend( loc='upper left')

		#Memory utilization
		ax = fig.add_subplot(n_engines+1,1,1, sharex=ax)
		plot_digital_signal(ax, np.arange(start_exe,end_exe,1), memory_data[start_exe:end_exe] ,label='memory_req', colour='blue')
		#Add a textual repr
		for start_ch, end_ch in zip(fetch_instant_data[f_start:], fetch_instant_data[f_start+1:]):
			if start_ch >= start_exe and start_ch < end_exe:
				#print(f)
				ax.axvline(start_ch, color='g')
				memory_line_in_period = memory_data[start_ch:end_ch]
				memory_request        = sum(memory_line_in_period)
				ax.text((start_ch+end_ch)//2, 0.5,f'{memory_request} ({int(100*memory_request/(end_ch-start_ch))}%)',ha="center", va="center")
				
			else:
				break
		ax.set_yticks([0,1])
		ax.set_ylabel('Memory access')

		fig.tight_layout()
		fig.canvas.set_window_title(f'cpus: {vcd_path}')
		plt.legend( loc='upper left')
		plt.draw()
		plt.pause(0.001)


	fig = plt.figure(0)
	fig.clf()
	plot_i_esim(0)
	press_handler = press_handler_creator(plot_i_esim,tot_number_of_subgraph)
	#print(press_handler)
	if(full_screen):
		fig.canvas.manager.full_screen_toggle()
	fig.canvas.mpl_connect('key_press_event', press_handler)
	fig.tight_layout()
	plt.draw()
	plt.pause(0.001)
	input("press a key to close")


def plot_digital_signal(ax, x,y, clock_ticks=True, colour='r', label='', fill =False):
	ax.axhline(0, color='.5')
	if(clock_ticks):
		for a_x in x:
			ax.axvline(a_x, color='.5', linestyle='--', linewidth=0.5)
	ax.step(x, y, colour, where="post", label=label)

	if fill:
		ax.fill_between(x,y,0,color=colour, alpha=0.3,  step="post")

plot_cpu_valid_in(vcd, fetch_instant)
plot_engine_valid_in(engine_scopes, fetch_instant)

def plotLargeHeatmap(heatmap, x_labels, y_labels):
	n_elements_per_subPlot = 8
	tot_number_of_subgraph = len(y_labels)//n_elements_per_subPlot
	def plot_i_esim(i):
		subplotHeatmap(heatmap, x_labels, y_labels, i, n_elements_per_subPlot, reuse_fig=True, block=False)

	fig = plt.figure(0)
	fig.clf()
	fig.canvas.set_window_title(vcd_path)
	plot_i_esim(0)
	press_handler = press_handler_creator(plot_i_esim,tot_number_of_subgraph)
	#print(press_handler)
	if(full_screen):
		fig.canvas.manager.full_screen_toggle()
	fig.canvas.mpl_connect('key_press_event', press_handler)
	fig.tight_layout()
	plt.draw()
	plt.pause(0.001)
	input("press a key to close")

def subplotHeatmap(heatmap, x_labels, y_labels, i, n , reuse_fig=False, block=True):
	start_y,end_y 	= i*n, (i+1)*n
	sub_heatmap 	= heatmap[start_y:end_y,:]
	y_sub_labels 	= y_labels[start_y:end_y]
	plotHeatmap(sub_heatmap, x_labels,y_sub_labels, reuse_fig=reuse_fig, block=block)

def plotHeatmap(heatmap, x_labels, y_labels, reuse_fig=False , block=True):
	if reuse_fig:
		fig = plt.figure(0)
		fig.clf()
		ax  = fig.add_subplot(1,1,1)
	else:
		fig, ax = plt.subplots()
	im = ax.imshow(heatmap)
	ax.set_xticks(np.arange(len(x_labels)))
	ax.set_yticks(np.arange(len(y_labels)))
	ax.set_yticklabels(y_labels)
	ax.set_xticklabels(x_labels)
	# Rotate the tick labels and set their alignment.
	plt.setp(ax.get_xticklabels(), rotation=45, ha="right",
		 rotation_mode="anchor")
	# Loop over data dimensions and create text annotations.
	for y in range(len(y_labels)):
		for x in range(len(x_labels)):
			if heatmap[y, x] > 0:
				ax.text(x, y,f'{heatmap[y, x]} ({int(100*heatmap[y, x]/sum(heatmap[y,:])) }%)',ha="center", va="center")
	ax.set_title("Instructions executed by each Engine per each character")
	fig.tight_layout()
	if block:
		plt.show()
	else:
		plt.draw()
		plt.pause(0.001)


plotLargeHeatmap(exe_per_engine, [ f'Eng_{i}' for i,_ in enumerate(engine_scopes)], [ f'char_{i}' for i,_ in enumerate(start_end_cc)])

BramScope = vcd[re.compile('.*a?(b|B)ram$')]
#print(BramScope)
valid_data_ready_boundle = BramScope['r_valid'][start_exe:end_exe:clk_period]
valid_data_ready         = list(filter(lambda x: x[0]=='1', valid_data_ready_boundle))
print(f'Memory utilization: {len(valid_data_ready)} / {duration_exe_cc} cc ({int(100*len(valid_data_ready)*clk_period/vcd.endtime)}% )')

print(f'~ CPI {round(duration_exe_cc/len(executed_instructions),2)} ')