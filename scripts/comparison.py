import re2_driver
import pynq
from pynq import Overlay
from test_execution import time_full_match, time_match, time_ignore_prefix_match
import argparse

arg_parser = argparse.ArgumentParser(description='Test re2coprocessor(https://github.com/DanieleParravicini/regex_coprocessor).')
arg_parser.add_argument('-full_match'	    , 			help='requires that regular expression matches the entire string'																, default=False, action='store_true')
arg_parser.add_argument('-ignore_prefix'    , 			help='do not pose any constraint on where the regular expression starts matching the string. Corresponds to .*<your_regex>'	    , default=False, action='store_true')	
args = arg_parser.parse_args()

re2_coprocessor = Overlay('re2_coprocessor.bit')
regex_string        = 'a?a?bb'
string              = 'b'+'a'*8
print('regex', regex_string, 'string', string)
freq                = 100_000_000
has_accepted = re2_coprocessor.re2_copro_0.compile_and_run(regex_string, string, full_match=args.full_match,ignore_prefix=args.ignore_prefix )
cc_number =  re2_coprocessor.re2_copro_0.read_elapsed_clock_cycles()
print('clock cycles taken:', cc_number)
print('status:', re2_coprocessor.re2_copro_0.get_status())
time = cc_number*1/freq*1_000_000_000
print('time re2coprocessor', time, 'ns')
if args.full_match:
    min_time,avg_time = time_full_match(regex_string, string)
elif args.ignore_prefix:
    min_time,avg_time = time_ignore_prefix_match(regex_string, string)
else:
    min_time,avg_time = time_match(regex_string, string)
print('time python re module min:', min_time, 'avg:',avg_time, 'ns')