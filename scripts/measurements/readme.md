This directory contains the necessary tools to test the effectiveness of regex copro.

The main script is [measure.py](measure.py)

## Setup
Requirements are listed inside requirements.txt file and can be installed by recalling:
	python -m pip install -r requirements.txt

## Description
[measure.py](measure.py) employs [input_protomata_selected.txt](input_protomata_selected.txt), [regular_expr.txt](regular_expr.txt), which contain the input strings and the regular expressions respectively.

It then instance a specific subclass of regular_expression_measurer subclass which 
estimates (in the most appropriate way) the time taken to match a regex inside a
 string. (Note if you have to add another term of comparison is advisable to provide a new extension to regular_expression_measurer class)

Long story short you request to measure a certain regex matching mechanism by adding a certain parameter to python [measure.py](measure.py):

Parameter	 	 | What does 
---------------------|----               
***-py***		         	 |measure time taken by python re module                            
***-copro***           	 |measure clock cycles taken by copro. you have to look at -bitstream and -do_not_optimize                         
***-coprocompiler***		 |measure time taken by copro compiler. you have to look at -do_not_optimize                  
***-simre2coproasap***	 |measure clock cycles taken by emulated re2copro.        
***-simre2copro***     |measure clock cycles taken by emulated re2copro.       
***-re2***	             |measure time taken by re2 using time.                              
***-re2chrono***           |measure time taken by re2 using chrono (distinguished between match and "compilation").                 
***-grep***	             |measure time taken by grep using time.                
-startstr		    |index first str.to restrict num of strings	                                    
-endstr			 	|index end string. to restrict num of strings	                                    
-startreg			|index first reg. to restrict num of regex	                                    
-endreg				|index end reg. to restrict num of regex	
-debug	            |execute in debug mode. print debug messages                                   
-strfile			|file containing strings  	                        
-regfile			|file containing regular expressions    	                        
-bitstream			|only for copro: coprocessor bitstream file    	                
-copro_not_check    |only for copro: disable check against a golden model(python re).     						        
-do_not_optimize	|only for copro and coprocompiler: do not optimize recopro code  
-format				| \[pythonre\|pcre\] specifies the regex input format
-benchmark				| Name of the benchmark, needed for result saving purposes 
some of them have already default values you can read it directly in [measure.py](measure.py) via `measure.py --h`

Measurements are put in a csv file named measure_***.\****.csv


### Example:	

to measure time taken by re2 with chrono and the re2compiler measured with python time type

``` python measure.py -re2chrono -coprocompiler```

### Example output:

string: MAFSAEDVLKEYDRRRRMEALLLSLYYPNDRKLLDYKEWSPPRVQVECPKAPVEWNNPPSEKGLIVGHFSGIKYKGEKAQASEVDVNKMCCWVSKFKDAMRRYQGIQTCKIPGKVLSDLDAKIKAYNLTVEGVEGFVRYSRVTKQHVAAFLKELRHSKQYENVNLIHYILTDKRVDIQHLEKDLVKDFKALVESAHRMRQGHMINVKYILYQLLKKHGHGPDGPDILTVKTGSKGVLYDDSFRKIYTDLGWKFTPL

regex|result|re2copro_compiler|re2_chrono_exe|re2_chrono_compile
--|--|--|--|--
`(((R\|K\|X)(R\|K\|X))?.(S\|T\|X))`|UNK|1612754.1999999266|6261.85|17981.81
`(S\|T\|X)(..)?(D\|B\|E\|Z\|X)`|UNK|1453715.9999999858|5645.66|15410.5
`(C\|X).(D\|B\|N\|B\|X)(....)?(F\|Y\|X).(C\|X).(C\|X)`|UNK|4100195.800000165|9034.52|41999.66

You can find more in [examples](examples)

### Regular expressions considered 

REs with id 1-11 are taken from [Automata/protomata](https://github.com/jackwadden/ANMLZoo/tree/master/Protomata) 

id           	|# re combined | re
----------------|--------------|-------
`1         ` 	| 1            |`(((R\|K\|X)(R\|K\|X))?.(S\|T\|X))`
`2         ` 	| 1            |`(S\|T\|X)(..)?(D\|B\|E\|Z\|X)`
`3         ` 	| 1            |`(C\|X).(D\|B\|N\|B\|X)(....)?(F\|Y\|X).(C\|X).(C\|X)`
`4         ` 	| 1            |`(C\|X)(.....?)?(C\|X)(C\|X)(S\|X)(..)?(G\|X).(C\|X)(G\|X)(....?)?(F\|Y\|W\|X)(C\|X)`
`5         ` 	| 1            |`(C\|X)(..(..)?)?(C\|X)(...)?(L\|I\|V\|M\|F\|Y\|W\|C\|X)(........)?(H\|X)(...(..)?)?(H\|X)`
`6         ` 	| 1            |`((L\|I\|V\|M\|F\|E\|Z\|X)(F\|Y\|X)(P\|X)(W\|X)(M\|X)(K\|R\|Q\|Z\|T\|A\|X))`
`7         ` 	| 1            |`((L\|X)(M\|X)(A\|X)(E\|Z\|Q\|Z\|X)(G\|X)(L\|X)(Y\|X)(N\|B\|X))`
`8         ` 	| 1            |`((R\|X)(P\|X)(C\|X)(..........)?(C\|X)(V\|X)(S\|X))`
`9         ` 	| 1            |`(R\|K\|X)(...?)?(D\|B\|E\|Z\|X)(...?)?(Y\|X)`
`10        ` 	| 1            |`.(G\|X)(R\|K\|X)(R\|K\|X)`
`11        ` 	| 1            |`(S\|T\|X).(R\|K\|X)`
`(10\|11)   ` 	| 2            |`(.(G\|X)(R\|K\|X)(R\|K\|X))\|((S\|T\|X).(R\|K\|X))`
`(7\|8)     ` 	| 2            |`((L\|X)(M\|X)(A\|X)(E\|Z\|Q\|Z\|X)(G\|X)(L\|X)(Y\|X)(N\|B\|X))\|((R\|X)(P\|X)(C\|X)(..........)?(C\|X)(V\|X)(S\|X))`
`(8\|9)     ` 	| 2            |`((R\|X)(P\|X)(C\|X)(..........)?(C\|X)(V\|X)(S\|X))\|((R\|K\|X)(...?)?(D\|B\|E\|Z\|X)(...?)?(Y\|X))`
`(7\|9)     ` 	| 2            |`((L\|X)(M\|X)(A\|X)(E\|Z\|Q\|Z\|X)(G\|X)(L\|X)(Y\|X)(N\|B\|X))\|((R\|K\|X)(...?)?(D\|B\|E\|Z\|X)(...?)?(Y\|X))`
`(7\|8\|9)   `  | 3            |`((L\|X)(M\|X)(A\|X)(E\|Z\|Q\|Z\|X)(G\|X)(L\|X)(Y\|X)(N\|B\|X))\|((R\|X)(P\|X)(C\|X)(..........)?(C\|X)(V\|X)(S\|X))\|((R\|K\|X)(...?)?(D\|B\|E\|Z\|X)(...?)?(Y\|X))`
`(8\|9\|11)  `  | 3            |`((R\|X)(P\|X)(C\|X)(..........)?(C\|X)(V\|X)(S\|X))\|((R\|K\|X)(...?)?(D\|B\|E\|Z\|X)(...?)?(Y\|X))\|((S\|T\|X).(R\|K\|X))`
`(9\|10\|11) `  | 3            |`((R\|K\|X)(...?)?(D\|B\|E\|Z\|X)(...?)?(Y\|X))\|(.(G\|X)(R\|K\|X)(R\|K\|X))\|((S\|T\|X).(R\|K\|X))`
`(4\|5\|8)   `  | 3            |`((C\|X)(.....?)?(C\|X)(C\|X)(S\|X)(..)?(G\|X).(C\|X)(G\|X)(....?)?(F\|Y\|W\|X)(C\|X))\|((C\|X)(..(..)?)?(C\|X)(...)?(L\|I\|V\|M\|F\|Y\|W\|C\|X)(........)?(H\|X)(...(..)?)?(H\|X))\|((R\|X)(P\|X)(C\|X)(..........)?(C\|X)(V\|X)(S\|X))`
`(4\|5\|8\|10)` | 4            |`((C\|X)(.....?)?(C\|X)(C\|X)(S\|X)(..)?(G\|X).(C\|X)(G\|X)(....?)?(F\|Y\|W\|X)(C\|X))\|((C\|X)(..(..)?)?(C\|X)(...)?(L\|I\|V\|M\|F\|Y\|W\|C\|X)(........)?(H\|X)(...(..)?)?(H\|X))\|((R\|X)(P\|X)(C\|X)(..........)?(C\|X)(V\|X)(S\|X))\|(.(G\|X)(R\|K\|X)(R\|K\|X))`
`(5\|9\|8\|7) ` | 4            |`((C\|X)(..(..)?)?(C\|X)(...)?(L\|I\|V\|M\|F\|Y\|W\|C\|X)(........)?(H\|X)(...(..)?)?(H\|X))\|((R\|K\|X)(...?)?(D\|B\|E\|Z\|X)(...?)?(Y\|X))\|(((R\|X)(P\|X)(C\|X)(..........)?(C\|X)(V\|X)(S\|X)))\|(((L\|X)(M\|X)(A\|X)(E\|Z\|Q\|Z\|X)(G\|X)(L\|X)(Y\|X)(N\|B\|X)))`
`(3\|4\|5\|7) ` | 4            |`((C\|X).(D\|B\|N\|B\|X)(....)?(F\|Y\|X).(C\|X).(C\|X))\|((C\|X)(.....?)?(C\|X)(C\|X)(S\|X)(..)?(G\|X).(C\|X)(G\|X)(....?)?(F\|Y\|W\|X)(C\|X))\|((C\|X)(..(..)?)?(C\|X)(...)?(L\|I\|V\|M\|F\|Y\|W\|C\|X)(........)?(H\|X)(...(..)?)?(H\|X))\|(((L\|X)(M\|X)(A\|X)(E\|Z\|Q\|Z\|X)(G\|X)(L\|X)(Y\|X)(N\|B|X)))`

## Setup specific  
### Download automatazoo
1) Open python
 ```	$ python3```
2) Execute the following the preamble of re2compiler/test_\[brill\|clamAV\|protomata\|snort\].py
 ```
import os
import urllib.request

path_regex = "brill.regex"
path_input = "brill.input"
if not os.path.exists(path_regex):
    with urllib.request.urlopen("https://raw.githubusercontent.com/jackwadden/ANMLZoo/master/Brill/regex/brill.1chip.regex") as response:
        html = response.read()
        with open(path_regex,'w') as f:
            f.write(html.decode('utf-8'))

if not os.path.exists(path_input):
    with urllib.request.urlopen("https://github.com/tjt7a/AutomataZoo/blob/master/Brill/benchmarks/inputs/brown_corpus.txt?raw=true") as response:
        html = response.read()
        with open(path_input,'wb') as f:
            f.write(html)

path_regex = "clamAV.regex"
path_input = "clamAV.input"
if not os.path.exists(path_regex):
    with urllib.request.urlopen("https://raw.githubusercontent.com/jackwadden/ANMLZoo/master/ClamAV/regex/515_nocounter.1chip.anml") as response:
        html = response.read()
        with open(path_regex,'w') as f:
            f.write(html.decode('utf-8'))

if not os.path.exists(path_input):
    with urllib.request.urlopen("https://github.com/jackwadden/ANMLZoo/blob/master/ClamAV/inputs/vasim_1MB.input?raw=true") as response:
        html = response.read()
        with open(path_input,'wb') as f:
            f.write(html)


path_regex = "protomata.regex"
path_input = "protomata.input"
if not os.path.exists(path_regex):
    with urllib.request.urlopen("https://raw.githubusercontent.com/tjt7a/AutomataZoo/master/Protomata/code/protomata.regex") as response:
        html = response.read()
        with open(path_regex,'w') as f:
            f.write(html.decode('utf-8'))

if not os.path.exists(path_input):
    with urllib.request.urlopen("https://raw.githubusercontent.com/tjt7a/AutomataZoo/master/Protomata/benchmarks/inputs/30k_prots.input") as response:
        html = response.read()
        with open(path_input,'wb') as f:
            f.write(html)

path_regex = "snort.regex"
path_input = "snort.input"
if not os.path.exists(path_regex):
    with urllib.request.urlopen("https://raw.githubusercontent.com/jackwadden/ANMLZoo/master/Snort/regex/snort.1chip.regex") as response:
        html = response.read()
        with open(path_regex,'w') as f:
            f.write(html.decode('utf-8'))

            
if not os.path.exists(path_input):
    with urllib.request.urlopen("https://github.com/tjt7a/AutomataZoo/blob/master/Snort/benchmarks/inputs/wrccdc2012.pcap?raw=true") as response:
        html = response.read()
        with open(path_input,'wb') as f:
            f.write(html)
```
### RE2: before running measure.py you should:
1) compile compile and install re2 (partly taken from [RE2 guides](https://github.com/google/re2/wiki/Install) )

	```$ git clone https://code.googlesource.com/re2```

	```$ cd re2```

	```$ make```

	```$ make install```

	1) if you plan to use -re2 -> compile test_re2.cpp      

		```$ source prepare_re2_test.sh```

		this is a simple script that will:
		- compile test_re2.cpp into test_re2.o
		- override LD_LIBRARY_PATH variable with /usr/local/lib/ to let the linker 	locate re2lib\d.so
		  NOTE that LD_LIBRARY_PATH may need to be rewritten after restarting your 	machine.

	2) if you plan to use -re2chrono 
		1) compile and run chrono_overhead.cpp

			```$ g++ chrono_overhead.cpp```

			```$ ./a.out```

			This will inform you on the available clock and characteristics. 
			annotate the one with highest num/den that is steady
			substitute in test_re2_chrono.cpp  `std::chrono::steady_clock::`
			with `std::chrono::system_clock:: `
			or   `std::chrono::high_resolution_clock::`
			if they provide higher accuracy and steadyness

		2) compile test_re2_chrono.cpp.

			```$ source prepare_re2_test.sh```

			this is a simple script that will:
			- compile test_re2_chrono.cpp into test_re2_chrono.o
			- override LD_LIBRARY_PATH variable with /usr/local/lib/ to let the linker locate re2lib\d.so
			NOTE that LD_LIBRARY_PATH may need to be rewritten after restarting your machine.

			``` $ source prepare_re2_chrono.sh ```
### Generate different combination of ored regexp:
Use the `make_them_ored.py` script using the -rank parameter to indicate how many regex to combine, and if necessary -n to limit the number of regular expressions to be put in or. You can combine the longest n-regexes or the n-shortest together. By default the shortest would be considered. Instead, use -decreasing to order the regexes to pick the longest. Use -regfile to specify input file and format as for measure.py .
``` $ python .\make_them_ored.py -regfile='protomata.regex' -rank=4 -n=20 -format='pcre' -decreasing ```

### Example run:

``` $ python3 measure.py -re2chrono -regfile="regular_expr.txt" -strfile="protomata.input" ```

``` $python3 measure.py -re2chrono -strfile="protomata.input" -regfile="protomata.regex" -skipExce -format=pcre -benchmark="protomata"```

