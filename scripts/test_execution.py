import timeit
#global regex 

def do_match(regex, string):     
    res = regex.match(string, pos=0)
    print (res) 
    return not( res is None)
def do_full_match(regex, string):      
    res = regex.full_match(string, pos=0)
    print(res)
    return not( res is None)
def do_ignore_prefix_match(regex, string):  
    res = regex.search(string, pos=0)
    print(res)    
    return not( res is None)

def prepare(regex_string):
    import re
          
    regex = re.compile(regex_string)
    return regex

repeat          = 1_000
number_of_batch = 1_000
scale           = 1_000_000_000
def time_full_match(regex, string, debug=False):
    secs = timeit.repeat(f"res = not(regex.fullmatch('{string}',pos=0)) is None", f"import re\nregex = re.compile('{regex}')",number=number_of_batch , repeat=repeat)
    if debug:
        do_full_match(prepare(regex), string)
    
    return min(secs)*scale/number_of_batch, sum(secs)/len(secs)*scale/number_of_batch

def time_match(regex, string, debug=False):
    secs = timeit.repeat(f"res = not(regex.match('{string}',pos=0)) is None", f"import re\nregex = re.compile('{regex}')", number=number_of_batch , repeat=repeat)
    if debug:
        do_match(prepare(regex), string)
    return min(secs)*scale/number_of_batch, sum(secs)/len(secs)*scale/number_of_batch

def time_ignore_prefix_match(regex, string, debug=False):
    secs = timeit.repeat(f"res = not(regex.search('{string}',pos=0)) is None", f"import re\nregex = re.compile('{regex}')", number=number_of_batch , repeat=repeat)
    if debug:
            do_ignore_prefix_match(prepare(regex), string)
    return min(secs)*scale/number_of_batch, sum(secs)/len(secs)*scale/number_of_batch


if __name__ == "__main__":
    string = 'b'+'a'*8
    regex  = 'a?a?a?a?aaaa'
    
    print('res', do_match(prepare(regex),string))
    secs = timeit.repeat(f"res = not(regex.match('{string}',pos=0)) is None", f"import re\nregex = re.compile('{regex}')", number=number_of_batch, repeat=repeat)

    #print( secs)
    print('took minimum \t' ,min(secs)*scale/number_of_batch, 'ns')
    print('took avg \t'     ,sum(secs)/len(secs)*scale/number_of_batch, 'ns')