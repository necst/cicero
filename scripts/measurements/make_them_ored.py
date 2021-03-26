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
arg_parser.add_argument('-uppern'		    , type=int , help='take n out of the longest'	                                		, default=None)
arg_parser.add_argument('-regfile'		    , type=str , help='file containing regular expressions'    	                      		, default='protomata.regex'  )
arg_parser.add_argument('-skipException'	           , help='skip exceptions'                              ,action='store_true'   , default=False)
arg_parser.add_argument('-format'	        , type=str , help='regex input format'                                					, default='pythonre')
arg_parser.add_argument('-rank'             , type=int , help='rank of combination'							        				, default=2)
args = arg_parser.parse_args()

regex_lines = []
#open regex file 
with open(args.regfile, 'r') as fin:
	regex_lines = fin.readlines()[args.startreg:args.endreg]

	if args.uppern :
		regex_lines = sorted(regex_lines,key = len, reverse=True )[0:args.uppern]

	import sys
	sys.path.append('../../re2compiler')
	from helper import normalize_regex_input, pcre_to_python
	if args.format=='pcre':
		regex_lines = map(lambda r: pcre_to_python(r), regex_lines)
	else:
		regex_lines = map(lambda r:r[:-1], regex_lines)
		
	regex_lines 	= map( lambda r: normalize_regex_input(r),regex_lines)
	regex_res 	 	= []
	regex_tuples 	= combinations(regex_lines,args.rank)
	for regex_tuple in regex_tuples:
		regex_res.append( '('+")|(".join(regex_tuple)+')\n')
	name,ext = args.regfile.split('.')
	foutname = name + str(args.rank) +'.'+ ext
	with open(foutname, 'w') as fout:
		fout.writelines(regex_res)



