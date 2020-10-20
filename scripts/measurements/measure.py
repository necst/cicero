
import csv
import os 
import argparse
import sys
from   tqdm import tqdm

class regular_expression_measurer():
    def __init__(self, name):
        super().__init__()
        self.name = name

    def get_name(self):
        return self.name

    def execute(self, regex, string, O1=True, allow_prefix=True, full_match=True, debug=False):
        raise NotImplementedError()

class re2copro_measurer(regular_expression_measurer):
    def __init__(self, bitstream_filepath):
        super().__init__("re2copro")
        self.bitstream_filepath = bitstream_filepath
        
    
    def execute(self, regex, string, O1=True, allow_prefix=True, full_match=True, debug=False):
        import sys
        sys.path.append('../driver')
        import re2_driver
        import pynq
        from pynq import Overlay
        re2_coprocessor = Overlay(self.bitstream_filepath)

        #freq                = 90_000_000
        if debug:
            print('string', string, ' regex:',regex)
        has_accepted = re2_coprocessor.re2_copro_0.compile_and_run(r, line, allow_prefix=allow_prefix,full_match=full_match, O1=O1 )
        cc_number =  re2_coprocessor.re2_copro_0.read_elapsed_clock_cycles()
        if debug:
            print('status:', re2_coprocessor.re2_copro_0.get_status(),
            'time re2coprocessor', cc_number, 'clock', 'cycles' if cc_number > 1 else 'cycle')
        return cc_number

class re_measurer(regular_expression_measurer):
    def __init__(self):
        super().__init__("re")

    def execute(self, regex, string, O1=True, allow_prefix=True, full_match=True, debug=False):
        import test_re
        min_time_re = test_re.time_allow_prefix_match(r, line, perf_counter=True)
        if debug:
            print('minimum time', min_time_re, 'ns')
        return min_time_re

class emulated_re2_copro_asap_measurer(regular_expression_measurer):
    def __init__(self):
        super().__init__("emulated_re2copro_asap")
    
    def execute(self, regex, string, O1=True, allow_prefix=True, full_match=True, debug=False):
        import sys
        sys.path.append('../../re2compiler')
        import emulate_execution
        cc = emulate_execution.cc_asap_allow_prefix_match(r, line, perf_counter=True)
        if debug:
            print('minimum cc', cc)
        return cc


class emulated_re2_copro_measurer(regular_expression_measurer):
    def __init__(self):
        super().__init__("emulated_re2copro")

    
    def execute(self, regex, string, O1=True, allow_prefix=True, full_match=True, debug=False):
        import sys
        sys.path.append('../../re2compiler')
        import emulate_execution
        cc = emulate_execution.cc_allow_prefix_match(r, line)
        if debug:
            print('minimum cc', cc)
        return cc

class cmd_measurer(regular_expression_measurer):
    def __init__(self, name, program, batch_length=1000, num_of_batches=10):
        super().__init__(name)
        self.program        = program
        self.batch_length   = batch_length
        self.num_of_batches = num_of_batches

    def execute(self, regex, string, O1=True, allow_prefix=True, full_match=True, debug=False):
        res = [ self._execute(regex, string, O1=O1, allow_prefix=allow_prefix, full_match=full_match, debug=debug) for i in range(self.num_of_batches)]
        return sum(res)/len(res)

    def _execute(self, regex, string, O1=True, allow_prefix=True, full_match=True, debug=False):
        from subprocess import run, CalledProcessError, PIPE
        num_times   = self.batch_length
        
        arguments   = f"time -p {self.program} \"{regex}\" \"{string}\" {num_times}"

        if sys.version_info[0] > 4 or (sys.version_info[0] == 3 and sys.version_info[1] >= 7):
            sub = run(arguments, capture_output=True, shell=True, check=False)
        else:
            sub = run(arguments,                      shell=True, check=False, stdout=PIPE, stderr=PIPE)

        if(sub.returncode != 0):
            if(sub.returncode ==1): 
                pass #grep returns an error code to signal a non-match
            else:
                print("error!")
                print('out->', sub.stdout)
                print('err->', sub.stderr)
                exit(sub.returncode)

        import re

        stderr = (sub.stderr.decode())
        
        res     = re.findall('real (\d+\.\d+)\nuser (\d+\.\d+)\nsys (\d+\.\d+)\n', stderr)
        if debug: 
            print('err->',type(sub.stderr), sub.stderr)
            print(len(res), res)

        if len(res) <1 or  (len(res)> 0 and len(res[0]) < 3) :
            exit(1)
        real    = float(res[0][0])
        user    = float(res[0][1])
        system  = float(res[0][2])

        return user*1_000_000_000/num_times
    
#https://www.embedded.com/tutorial-techniques-for-measuring-execution-time-and-real-time-performance-part-1/
class grep_measurer(cmd_measurer):
    def __init__(self, batch_length=50      , num_of_batches=10):
        super().__init__("grep", "./test_grep.sh", batch_length=batch_length, num_of_batches=num_of_batches )

class re2_measurer(cmd_measurer):
    def __init__(self, batch_length=500_000 , num_of_batches=20):
        super().__init__("re2", "./test_re2.o" , batch_length=batch_length, num_of_batches=num_of_batches )

class re2_chrono_measurer(regular_expression_measurer):
    def __init__(self, batch_length=80_000 ):
        super().__init__(" [ re2_chrono_exe, re2_chrono_compile]" )
        self.batch_length 	= batch_length


    def execute(self, regex, string, O1=True, allow_prefix=True, full_match=True, debug=False):
        from subprocess import run, CalledProcessError, PIPE
        num_times   = self.batch_length
        
        arguments   = f"./test_re2_chrono.o \"{regex}\" \"{string}\" {num_times}"

        if sys.version_info[0] > 4 or (sys.version_info[0] == 3 and sys.version_info[1] >= 7):
            sub = run(arguments, capture_output=True, shell=True, check=False)
        else:
            sub = run(arguments,                      shell=True, check=False, stdout=PIPE, stderr=PIPE)

        if(sub.returncode != 0):
            if(sub.returncode ==1): 
                pass #grep returns an error code to signal a non-match
            else:
                print("error!")
                print('out->', sub.stdout)
                print('err->', sub.stderr)
                exit(sub.returncode)

        import re

        stdout = sub.stdout.decode()
        
        res     = re.findall('Execution \d+ iterations?: avg time taken (\d+\.\d+)', stdout)

        if debug: 
            print('stdout->',type(sub.stdout), sub.stdout)
            print(len(res), res)

        if len(res) <1 or  (len(res)> 0 and len(res[0]) < 1) :
            exit(1)
        exec    = float(res[0])
        if debug:
            print(exec)

        res     = re.findall('Compilation \d+ iterations?: avg time taken (\d+\.\d+)', stdout)

        if debug: 
            print('stdout->',type(sub.stdout), sub.stdout)
            print(len(res), res)

        if len(res) <1 or  (len(res)> 0 and len(res[0]) < 1) :
            exit(1)

        compilation    = float(res[0])
        if debug:
            print(compilation)

        return [exec, compilation]


arg_parser = argparse.ArgumentParser(description='test regular expression matching')
arg_parser.add_argument('-startstr'		    , type=int , help='index first str.'	                                                                , default=0   )
arg_parser.add_argument('-endstr'		    , type=int , help='index end string.'	                                                                , default=None)
arg_parser.add_argument('-startreg'		    , type=int , help='index first reg.'	                                                                , default=0   )
arg_parser.add_argument('-endreg'		    , type=int , help='index end reg.'		                                                                , default=None)
arg_parser.add_argument('-py'		                   , help='measure time taken by python'                             , action='store_true'      , default=False)
arg_parser.add_argument('-copro'		               , help='measure time taken by copro.'                             , action='store_true'      , default=False)
arg_parser.add_argument('-simre2coproasap'		       , help='measure clock cycles taken by emulated re2copro.'         , action='store_true'		, default=False)
arg_parser.add_argument('-simre2copro'	               , help='measure clock cycles taken by emulated re2copro.'         , action='store_true'		, default=False)
arg_parser.add_argument('-re2'	                       , help='measure time taken by re2.'                               , action='store_true'      , default=False)
arg_parser.add_argument('-re2chrono'                   , help='measure time taken by re2.'                               , action='store_true'      , default=False)
arg_parser.add_argument('-grep'	                       , help='measure time taken by re2.'                               , action='store_true'      , default=False)
arg_parser.add_argument('-strfile'		    , type=str , help='file containing test input'  	                                                    , default='input_protomata_selected.txt')
arg_parser.add_argument('-regfile'		    , type=str , help='file containing test reg'    	                                                    , default='regular_expr.txt')
arg_parser.add_argument('-bitstream'		, type=str , help='coprocessor bitstream file'    	                                                    , default='')
arg_parser.add_argument('-do_not_optimize'	           , help='do not optimize recopro code'                             ,action='store_true'       , default=False)
arg_parser.add_argument('-debug'	                   , help='execute in debug mode'                                    ,action='store_true'       , default=False)
 
args = arg_parser.parse_args()

optimize_str = "" if args.do_not_optimize else '_O1' 
bitstream_filename = ""  if not args.copro else os.path.basename(args.bitstream)[:-4]

#any program and coprocessors have a specific method
# to measure the time taken to complete a match.
# These methods are encapsulated into an instance of measurer subclass,
# which expose a method(execute()) to measure time required to match.  
# measurer_list is filled by measurer depending on user requests.
measurer_list = []
if args.copro:
    measurer_list.append(re2copro_measurer(args.bitstream))
if args.py:
    measurer_list.append(re_measurer())
if args.simre2coproasap:
    measurer_list.append(emulated_re2_copro_asap_measurer())
if args.simre2copro:
    measurer_list.append(emulated_re2_copro_measurer())
if args.re2:
    measurer_list.append(re2_measurer())
if args.re2chrono:
    measurer_list.append(re2_chrono_measurer())
if args.grep:
    measurer_list.append(grep_measurer())
str_lines   = []
#read string file
with open(args.strfile, 'r', errors='ignore') as f:
    str_lines = f.readlines()[args.startstr:args.endstr]
regex_lines = []
#open regex file 
with open(args.regfile, 'r',) as f:
    regex_lines = f.readlines()[args.startreg:args.endreg]

total_number_of_executions = len(str_lines)*len(regex_lines)*len(measurer_list)
progress_bar               = tqdm(total=total_number_of_executions)

#open log file
with open(f'measure_{bitstream_filename}{optimize_str}.csv', 'w', newline='') as csvfile:
    fout = csv.writer(csvfile, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    #foreach string 
    for l_number, line in enumerate(str_lines):
        #print('len', len(line),'->', bytes(line,'utf-8'))
        #eliminate end of line
        line = line[:-1]
        #write in csv current string and caption
        fout.writerow(['string', line, '', ''])
        names = [e.get_name() for e in measurer_list]
        fout.writerow(['regex', 'result', *names])
        
        #foreach regex
        for r_number, r in enumerate(regex_lines):
            #result todo: report regex match result.
            has_accepted = "UNK"
            #eliminate end of line from regex
            r            = r[:-1]
            results      = [ ]
            
            for e_number, e in enumerate(measurer_list):
                
                
                try:
                    result = None
                    result = e.execute(regex=r, string=line, full_match = False, allow_prefix=True, O1=True, debug=args.debug )   
                except Exception as exc:
                    raise exc
                    print('error while executing regex', r,'\nstring [', len(line), 'chars]', line, exc)
                progress_bar.update(1)
                
                results.append(result)
            fout.writerow([r,has_accepted,  *results ])
                    



