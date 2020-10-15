import timeit
import time

def do_match(regex, string):     
    res = regex.match(string, pos=0)
    print (res) 
    return not( res is None)
def do_full_match(regex, string):      
    res = regex.full_match(string, pos=0)
    print(res)
    return not( res is None)
def do_allow_prefix_match(regex, string):  
    res = regex.search(string, pos=0)
    print(res)    
    return not( res is None)

def prepare(regex_string):
    import re
          
    regex = re.compile(regex_string)
    return regex

repeat          = 20
number_of_batch = 100_000
to_ns           = 1_000_000_000

def time_full_match(regex_string, string, debug=False, perf_counter=False):
    if perf_counter:
        timer = time.perf_counter
    else:
        timer = time.process_time
    secs = timeit.repeat(f"res = not(regex.fullmatch('{string}',pos=0)) is None", f"import re\nregex = re.compile('{regex_string}')", timer=timer ,number=number_of_batch , repeat=repeat)
    if debug:
        do_full_match(prepare(regex_string), string)
    
    return min(secs)/number_of_batch*to_ns

def time_match(regex_string, string, debug=False, perf_counter=False):
    if perf_counter:
        timer = time.perf_counter
    else:
        timer = time.process_time
    secs = timeit.repeat(f"res = not(regex.match('{string}',pos=0)) is None", f"import re\nregex = re.compile('{regex_string}')", timer=timer , number=number_of_batch , repeat=repeat)
    if debug:
        do_match(prepare(regex_string), string)

    return min(secs)/number_of_batch*to_ns

def time_allow_prefix_match(regex_string, string, debug=False, perf_counter=False):
    if perf_counter:
        timer = time.perf_counter
    else:
        timer = time.process_time
    secs = timeit.repeat(f"res = not(regex.search('{string}',pos=0)) is None", f"import re; regex = re.compile('{regex_string}')", timer=timer , number=number_of_batch , repeat=repeat)
    if debug:
            do_allow_prefix_match(prepare(regex_string), string)

    return min(secs)/number_of_batch*to_ns


if __name__ == "__main__":
    string = 'MSIIGATRLQNDKSDTYSAGPCYAGGCSAFTPRGTCGKDWDLGEQTCASGFCTSQPLCARIKKTQVCGLRYSSKGKDPLVSAEWDSRGAPYVRCTYDADLIDTQAQVDQFVSMFGESPSLAERYCMRGVKNTAGELVSRVSSDADPAGGWCRKWYSAHRGPDQDAALGSFCIKNPGAADCKCINRASDPVYQKVKTLHAYPDQCWYVPCAADVGELKMGTQRDTPTNCPTQVCQIVFNMLDDGSVTMDDVKNTINCDFSKYVPPPPPPKPTPPTPPTPPTPPTPPTPPTPPTPRPVHNRKVMFFVAGAVLVAILISTVRW'
    regex_string  = '(C|X).(D|B|N|B|X)(....)?(F|Y|X).(C|X).(C|X) '
    perf_counter = False
    byte_str     = True
    print(regex_string)
    print(bytes(string,'utf-8'))
    if perf_counter:
        timer = time.perf_counter
    else:
        timer = time.process_time
    print('res', do_allow_prefix_match(prepare(regex_string),string))
    secs = timeit.repeat(f"res = not(regex.search('{string}',pos=0)) is None", f"import re\nregex = re.compile('{regex_string}')", timer=timer , number=number_of_batch, repeat=repeat)

    print( secs)
    print('took minimum \t' ,min(secs)/number_of_batch*to_ns, 'ns')
    print('took avg \t'     ,sum(secs)/len(secs)/number_of_batch*to_ns, 'ns')