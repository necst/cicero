filepath = 'string.csv'
string = input('input string>')
byte_list = string.encode('ascii', 'replace')+ b'\0' 
with open(filepath, 'w') as f:
    for b in byte_list:
        f.write(str(int(b))+'\n')