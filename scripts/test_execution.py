import timeit

def f(regex_string, string):
    import re
    regex            = re.compile(regex_string)
    return not(regex.fullmatch(string, pos=0) is None)
secs = timeit.timeit(lambda : f('a?a?a?a?a*', 'aaaaaaa'), number=10000)
print('took',secs, 's')