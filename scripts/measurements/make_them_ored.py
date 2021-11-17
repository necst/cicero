##Create a combination of in | regex starting from the one given in input
import csv
import os 
import argparse
import sys
from itertools import combinations
arg_parser = argparse.ArgumentParser(description='test regular expression matching')
arg_parser.add_argument('-maxstrlen'		, type=int , help='max length of string. to restrict string size'	            		, default=1024)
arg_parser.add_argument('-startreg'		    , type=int , help='index first reg.to restrict num of regexp'	                		, default=0   )
arg_parser.add_argument('-endreg'		    , type=int , help='index end reg.to restrict num of regexp'		                		, default=None)
arg_parser.add_argument('-n'		   		, type=int , help='take n regexes'	                                					, default=None)
arg_parser.add_argument('-regfile'		    , type=str , help='file containing regular expressions'    	                      		, default='protomata.regex'  )
arg_parser.add_argument('-format'	        , type=str , help='regex input format'                                					, default='pythonre')
arg_parser.add_argument('-rank'             , type=int , help='rank of combination'							        				, default=2)
arg_parser.add_argument('-decreasing'       , help='order regexes decreasing '                     			 ,action='store_true'   , default=False)

args = arg_parser.parse_args()

regex_lines = []
#open regex file 
with open(args.regfile, 'r') as fin:
	regex_lines = fin.readlines()[args.startreg:args.endreg]

	if args.n :
		regex_lines = sorted(regex_lines,key = len, reverse=args.decreasing )[0:args.n]

	import sys
	sys.path.append('../../cicero_compiler')
	from helper import normalize_regex_input, pcre_to_python
	pcre = (args.format == 'pcre')
	if pcre:
		regex_lines = map(lambda r: pcre_to_python(r), regex_lines)
	else:
		regex_lines = map(lambda r:r[:-1], regex_lines)
		
	regex_lines 	= map( lambda r: normalize_regex_input(r),regex_lines)
	regex_res 	 	= []
	regex_tuples 	= combinations(regex_lines,args.rank)
	for regex_tuple in regex_tuples:
		regex_res.append( ('/' if pcre else '')+'('+")|(".join(regex_tuple)+')'+ ('/' if pcre else '')+'\n')
	name,ext = args.regfile.split('.')
	foutname = name + str(args.rank) +'.'+ ext
	with open(foutname, 'w') as fout:
		fout.writelines(regex_res)



