
The main script is measure.py
it's only requirement at the moment is the tqdm library that I exploited to show a
progressbar and a rough estimate of completion time.
It can be installed by recalling:
	python -m pip install -r requirements.txt

/* skip: Alternative:
	pip install tqdm
*/
/*skip: description
The scritp opens input_protomata_selected.txt, regular_expr.txt, which containts
the input string and the regular expressions to be matched against and the supply
them to a specific as instance of a regular_expression_measurer subclass which 
estimates (in the most appropriate way) the time taken to match a regex inside a
 string.
*/ 
long story short you request to time a certain regex matching mechanism by adding
a parameter to python measure.py:

available:              
-py'		                   , help='measure time taken by python re module'                            
-copro'		               	   , help='measure clock cycles taken by copro. you have to look at -bitstream and -do_not_optimize'                            
-coprocompiler'		       	   , help='measure time taken by copro compiler. you have to look at -do_not_optimize'                   
-simre2coproasap'		       , help='measure clock cycles taken by emulated re2copro.'        
-simre2copro'	               , help='measure clock cycles taken by emulated re2copro.'        
-re2'	                       , help='measure time taken by re2 using time.'                              
-re2chrono'                    , help='measure time taken by re2 using chrono (distinguished between match and "compilation").'                 
-grep'	                       , help='measure time taken by grep using time.'                              

/* skip: additional  measure.py arguments:

-startstr'		    		   , help='index first str.to restrict num of strings'	                                    
-endstr'		    		   , help='index end string. to restrict num of strings'	                                    
-startreg'		    		   , help='index first reg. to restrict num of regex'	                                    
-endreg'		    		   , help='index end reg. to restrict num of regex'	
-debug'	                       , help='execute in debug mode. print debug messages'                                   
-strfile'		    		   , help='file containing strings'  	                        
-regfile'		    		   , help='file containing regular expressions'    	                        
-bitstream'				       , help='only for copro: coprocessor bitstream file'    	                
-copro_not_check'              , help='only for copro: disable check against a golden model(python re).'     						        
-do_not_optimize'	           , help='only for copro and coprocompiler: do not optimize recopro code'  
some of them have default values you can read it directly in measure.py
*/
example:	
to measure time taken by re2compiler with chrono and recoprocessor compile time use
	python measure.py -re2chrono -coprocompiler
The measurements would be put in a csv file named measure_.*.csv

/* skip: measure__O1.csv example:
string;MAFSAEDVLKEYDRRRRMEALLLSLYYPNDRKLLDYKEWSPPRVQVECPKAPVEWNNPPSEKGLIVGHFSGIKYKGEKAQASEVDVNKMCCWVSKFKDAMRRYQGIQTCKIPGKVLSDLDAKIKAYNLTVEGVEGFVRYSRVTKQHVAAFLKELRHSKQYENVNLIHYILTDKRVDIQHLEKDLVKDFKALVESAHRMRQGHMINVKYILYQLLKKHGHGPDGPDILTVKTGSKGVLYDDSFRKIYTDLGWKFTPL;;
regex;result;re2copro_compiler;re2_chrono_exe;re2_chrono_compile
(((R|K|X)(R|K|X))?.(S|T|X));UNK;1612754.1999999266;6261.85;17981.81
(S|T|X)(..)?(D|B|E|Z|X);UNK;1453715.9999999858;5645.66;15410.5
(C|X).(D|B|N|B|X)(....)?(F|Y|X).(C|X).(C|X);UNK;4100195.800000165;9034.52;41999.66
*/

NOTE for re2: before running measure.py you should:
i) compile compile and install re2  
	(partly taken from https://github.com/google/re2/wiki/Install )
	$ git clone https://code.googlesource.com/re2
	$ cd re2
	$ make
	$ make install

ii.a) if you plan to use -re2 -> compile test_re2.cpp      
	$ source prepare_re2_test.sh
	a simple script that will:
	- compile test_re2.cpp into test_re2.o
	- override LD_LIBRARY_PATH variable with /usr/local/lib/ to let the linker locate re2lib\d.so
	  NOTE that LD_LIBRARY_PATH may need to be rewritten after restarting your machine.

ii.b) if you plan to use -re2chrono 
	ii.b.1) compile and run chrono_overhead.cpp
			$ g++ chrono_overhead.cpp
			$ ./a.out
			it will inform you on the available clock and characteristics. 
			annotate the one with highest num/den that is steady
			substitute in test_re2_chrono.cpp  std::chrono::steady_clock:: 
			with std::chrono::system_clock:: 
			or   std::chrono::high_resolution_clock::
			if they provide higher accuracy and steadyness

	ii.b.2) compile test_re2_chrono.cpp.
			$ source prepare_re2_test.sh
			a simple script that will:
			- compile test_re2_chrono.cpp into test_re2_chrono.o
			- override LD_LIBRARY_PATH variable with /usr/local/lib/ to let the linker locate re2lib\d.so
			NOTE that LD_LIBRARY_PATH may need to be rewritten after restarting your machine.

