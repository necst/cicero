import csv
import pandas as pd
import numpy as np 
import argparse


parser = argparse.ArgumentParser(description='CICERO output parsing script')
parser.add_argument("-irf", "--input_res_file", help="missile fuzuca", type=str, required=True)
parser.add_argument("-gv", "--giovanna", help="offset a partire da dx nella riga res regex 1 per re2 0  per copro", type=int, required=True)
parser.add_argument("-orf", "--output_res_file", help="missile fuzuca", type=str, required=True)
parser.add_argument("-copro", "--convert_cc",action='store_true', help="convert cc into freq")
parser.add_argument("-freq", "--target_freq", help="copro freq", type=int, default=214)

args = parser.parse_args()

re_avg_list = []
state = 0
char_count = 0
line_count = 0
init_decrement=3
giovanna=args.giovanna# 1#offset a partire da dx nella riga res regex 1 per re2 0  per copro
maximum_unmatched_time = 0
with open(args.input_res_file) as csv_file: #'measure_pcrebrill_queue_1_O1.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    for row in csv_reader:
        #if line_count == 1:
            #print( row[-1] )
            #print("missile fuzuca") 

        if state == 0:
            if "string:" in row[0]:
                char_count = 0 #i-1 * init_decrement
                for i in range(1,len(row)-2):
                    char_count += len(row[i])
                #print(f' toto count {char_count}')
                state = 1
                re_avg_list.append(list())
                #print(row[1])
                #print(len(row))
                #print(len(row[1]))
                continue
                #line_count +=1
            else:
                line_count = 0
                time=row[-giovanna-1]
                match=row[-giovanna-2]
                if match != 'False' and match != 'True':
                    continue
                if args.convert_cc:
                    if time.isdecimal() :
                        maximum_unmatched_time = float(time) if maximum_unmatched_time < float(time) else maximum_unmatched_time
                    else:
                        print("misselfuzuca")
                        time = maximum_unmatched_time
                    time = float(time)*1000/args.target_freq
                    #print("IL COPRO")
                else:
                    time = float(time)
                re_avg_list[-1].append((time, char_count if match == 'False' else char_count//2))

        if state == 1:
            state = 0
            line_count += 1
            continue


################
#aggregation
###############
avg_time_w = 0
avg_time = 0
denom = 0
regex_weighted_time = []
regex_avg_time = []
thr_avg_regex = []
for i in range(len(re_avg_list[0])):
        avg_time = 0
        avg_time_w = 0
        denom = 0
        for j in range(len(re_avg_list)):
           avg_time_w += re_avg_list[j][i][0]*re_avg_list[j][i][1]

           avg_time += re_avg_list[j][i][0]

           denom += re_avg_list[j][i][1]
           
        regex_weighted_time.append(avg_time_w/denom)

        regex_avg_time.append(avg_time/len(re_avg_list))

        thr_avg_regex.append(denom/avg_time)

with open(args.output_res_file,"w") as f:
    print("Weighted_AVG_Time[ns],AVG_Time[ns],Thr_AVG_RE[char/ns]",file=f)
    for i in range(len(regex_weighted_time)):
        print(f'{regex_weighted_time[i]},{regex_avg_time[i]},{thr_avg_regex[i]}',file=f)

