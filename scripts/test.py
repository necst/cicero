import test_execution
import csv
import os 
import argparse

arg_parser = argparse.ArgumentParser(description='test regular expression matching')
arg_parser.add_argument('-startstr'		    , type=int , help='index first str.'	                                    , default=0   )
arg_parser.add_argument('-endstr'		    , type=int , help='index end string.'	                                    , default=None)
arg_parser.add_argument('-startreg'		    , type=int , help='index first reg.'	                                    , default=0   )
arg_parser.add_argument('-endreg'		    , type=int , help='index end reg.'		                                    , default=None)
arg_parser.add_argument('-testpy'		               , help='measure time taken by python', action='store_true'		, default=False)
arg_parser.add_argument('-testcopro'		           , help='measure time taken by copro.', action='store_true'		, default=False)
arg_parser.add_argument('-testre2py'		           , help='measure time taken by a self-made python module.'        , action='store_true'		, default=False)
arg_parser.add_argument('-testsimre2'		           , help='measure minimum clock cycles taken by emulated re2copro.', action='store_true'		, default=False)
arg_parser.add_argument('-strfile'		    , type=str , help='file containing test input'  	                        , default='test5.input')
arg_parser.add_argument('-regfile'		    , type=str , help='file containing test reg'    	                        , default='test2.reg')
arg_parser.add_argument('-bitstream'		, type=str , help='bitstream file of the coprocessor'    	                , default='re2_coprocessor4bbP110.bit')
arg_parser.add_argument('-do_not_optimize'	, help='do not optimize recopro code'    ,action='store_true'               , default=False)

args = arg_parser.parse_args()
optimize_str = 'O1' if not args.do_not_optimize else ''
bitstream_filename = os.path.basename(args.bitstream)[:-4]
with open(f'log_{bitstream_filename}_{optimize_str}.csv', 'w', newline='') as csvfile:
    fout = csv.writer(csvfile, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    with open(args.strfile, 'r', errors='ignore') as f:
        lines = f.readlines()[args.startstr:args.endstr]
        for line in lines:
            print('len', len(line),'->', bytes(line,'utf-8'))
            line = line[:-1]
            fout.writerow(['string', line, '', ''])
            fout.writerow(['regex', 'result','copro',  'python re'])
            with open(args.regfile) as f:
                for r in f.readlines()[args.startreg:args.endreg]:
                    r = r[:-1]
                    print('regex', r,'\nstring', line)
                    try:
                        min_time_copro = 0
                        has_accepted   = 'UNK'
                        if args.testcopro:
                            import re2_driver
                            import pynq
                            from pynq import Overlay
                            re2_coprocessor = Overlay(args.bitstream)
                            
                            
                            #freq                = 90_000_000
                            has_accepted = re2_coprocessor.re2_copro_0.compile_and_run(r, line, allow_prefix=True, O1=(not args.do_not_optimize) )
                            cc_number =  re2_coprocessor.re2_copro_0.read_elapsed_clock_cycles()
                            print('clock cycles taken:', cc_number)
                            print('status:', re2_coprocessor.re2_copro_0.get_status())
                            min_time_copro = cc_number#*1/freq*1_000_000_000
                            print('time re2coprocessor', min_time_copro, 'cc')
                        min_time_re = 0
                        if args.testpy:
                            min_time_re = test_execution.time_allow_prefix_match(r, line, perf_counter=True)
                            print('minimum time', min_time_re, 'ns')
                        if args.testre2py:
                            import sys
                            sys.path.append('../re2compiler')
                            import emulate_execution
                            min_time_re = emulate_execution.time_allow_prefix_match(r, line, perf_counter=True)
                            print('minimum time', min_time_re, 'ns')
                        if args.testsimre2:
                            import sys
                            sys.path.append('../re2compiler')
                            import emulate_execution
                            min_time_re = emulate_execution.cc_allow_prefix_match(r, line)
                            print('minimum cc', min_time_re)


                        fout.writerow([r,has_accepted,  min_time_copro,  min_time_re,' '])
                    except Exception as exc:
                        raise exc
                        print('error',r,exc)
                    



