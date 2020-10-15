import pynq
from pynq import Overlay
from pynq import MMIO
from pynq import DefaultIP
from enum import Enum
from math import log2, ceil
import re
import time

class RE2_COPROCESSOR_COMMANDS(Enum):
    NOP                             = 0x0000_0000 
    WRITE                           = 0x0000_0001 
    READ                            = 0x0000_0002 
    START                           = 0x0000_0003 
    RESET                           = 0x0000_0004 
    READ_ELAPSED_CC                 = 0x0000_0005
    RESTART                         = 0x0000_0006

class RE2_COPROCESSOR_STATUS(Enum):
    IDLE                         = 0x0000_0000 
    RUNNING                      = 0x0000_0001 
    ACCEPTED                     = 0x0000_0002 
    REJECTED                     = 0x0000_0003 
    ERROR                        = 0x0000_0004 

class RE2_COPROCESSOR_REGISTER_OFFSET(Enum):
    DATA_IN   = 0
    ADDRESS   = 4
    START_CC  = 8
    CMD       = 12
    STATUS    = 16
    DATA_O    = 20

class re2_driver(DefaultIP):
    debug                               = False
    verbose                             = False
    word_size_in_bytes                  = 4
    def __init__(self, description):
        super().__init__(description=description)

    bindto = ['xilinx.com:user:re2_copro:1']

    def write_data_in(self, i):
        self.write(RE2_COPROCESSOR_REGISTER_OFFSET.DATA_IN.value, i)

    def read_data_in(self):
        return self.read(RE2_COPROCESSOR_REGISTER_OFFSET.DATA_IN.value)

    def write_address(self, i):
        self.write(RE2_COPROCESSOR_REGISTER_OFFSET.ADDRESS.value, i//self.word_size_in_bytes)

    def read_address(self):
        return self.read(RE2_COPROCESSOR_REGISTER_OFFSET.ADDRESS.value)

    def write_start_cc(self, i):
        self.write(RE2_COPROCESSOR_REGISTER_OFFSET.START_CC.value, i)
    
    def read_start_cc(self):
        return self.read(RE2_COPROCESSOR_REGISTER_OFFSET.START_CC.value)
    
    def write_cmd(self, i:RE2_COPROCESSOR_COMMANDS):
        self.write(RE2_COPROCESSOR_REGISTER_OFFSET.CMD.value, i.value)
    
    def read_cmd(self):
        return self.read(RE2_COPROCESSOR_REGISTER_OFFSET.CMD.value)

    def read_status(self):
        return RE2_COPROCESSOR_STATUS(self.read(RE2_COPROCESSOR_REGISTER_OFFSET.STATUS.value))
    
    def read_data_o(self):
        return self.read(RE2_COPROCESSOR_REGISTER_OFFSET.DATA_O.value)

    def __code_to_bytes(self, code):
        list_bytes_big_endian = []
        for line in code:
            tmp = re.findall(r'(\d+) ; (\d+)\n?',line)
            
            if self.debug:
                print(line, tmp)
            if len(tmp) < 1:
                continue

            assert all( int(x)<=255 for x in tmp[0])
            list_bytes_big_endian += bytes([int(tmp[0][1])]) + bytes([int(tmp[0][0])])
        return list_bytes_big_endian
    
    def __string_to_byte(self, string):
        #tobytes add terminator
        return string.encode('ascii', 'replace')+ b'\0' 

    def load_code(self, code):
        list_bytes_big_endian = self.__code_to_bytes(code)
        return self.__write_bytes(list_bytes_big_endian,0, "BIG")
        
    def load_string(self, string, start_address):
        list_bytes_big_endian = self.__string_to_byte(string)
        return self.__write_bytes(list_bytes_big_endian, start_address, "BIG")

    def __write_bytes(self, bytes_list, starting_address=0, endianness = "BIG"):
        byteorder   = 'little' if endianness == "BIG" else 'big'
        address     = starting_address
        flag        = True
        #write 32 bits at a time
        #hence 4 bytes
        write_width = self.word_size_in_bytes
        for string_offset in range(0,len(bytes_list), write_width):
            to_write        = bytes_list[string_offset: string_offset+write_width]
            #byteorder start with Least Significant Bytes
            to_write_int    = int.from_bytes(to_write, byteorder=byteorder, signed=False) 
            if self.debug:
                print('@ ', address,' written ',to_write,'->', to_write_int)
            self.write_address(address       )
            self.write_data_in(to_write_int  )
            if(flag):
                flag = False
                self.write_cmd(RE2_COPROCESSOR_COMMANDS.WRITE)

            address+=write_width
        
        self.write_cmd(RE2_COPROCESSOR_COMMANDS.NOP)
        return address
    
    def verify_code(self, code):
        list_bytes_big_endian = self.__code_to_bytes(code)
        return self.__verify_bytes(list_bytes_big_endian,0, "BIG")
        
    def verify_string(self, string, start_address):
        list_bytes_big_endian = self.__string_to_byte(string)
        return self.__verify_bytes(list_bytes_big_endian, start_address, "BIG")

    def __verify_bytes(self, bytes_list, starting_address=0, endianness = "BIG"):
        byteorder   = 'little' if endianness == "BIG" else 'big'
        address     = starting_address
        flag        = True
        
        #read 32 bit a at time
        read_width  = self.word_size_in_bytes
        for string_offset in range(0,len(bytes_list), +read_width):
            expected_to_read    = bytes_list[string_offset: string_offset+read_width]
            #byteorder start with Least Significant Bytes
            expected_to_read_int= int.from_bytes(expected_to_read, byteorder=byteorder, signed=False) 
            self.write_address(address)
            if(flag):
                flag = False
                self.write_cmd(RE2_COPROCESSOR_COMMANDS.READ)
            read = self.read_data_o()
            if self.debug:
                print('@ ', address,' read ', read,' expected ', expected_to_read_int)
            assert read == expected_to_read_int, ("@ "+str(address)+" data mismatch "+str(read)+" !== "+str(expected_to_read_int))
            address +=read_width
        
        self.write_cmd(RE2_COPROCESSOR_COMMANDS.NOP)
        return 1

    def start(self, start_string_address):
        self.write_start_cc( start_string_address      )
        self.write_cmd( RE2_COPROCESSOR_COMMANDS.START )
        self.write_cmd( RE2_COPROCESSOR_COMMANDS.NOP   )

    def wait_complete(self):
        status = self.read_status()
        while( status == RE2_COPROCESSOR_STATUS.RUNNING):
            status = self.read_status()

        if(status == RE2_COPROCESSOR_STATUS.ERROR):
            raise RuntimeError('probably fifo full')
        return status == RE2_COPROCESSOR_STATUS.ACCEPTED
    
    def get_status(self):
        return self.read_status()

    def read_elapsed_clock_cycles(self):
        self.write_cmd(RE2_COPROCESSOR_COMMANDS.READ_ELAPSED_CC)
        cc = self.read_data_o()
        self.write_cmd(RE2_COPROCESSOR_COMMANDS.NOP)
        return cc
    
    def reset(self):
        self.write_cmd(RE2_COPROCESSOR_COMMANDS.RESET)
        self.write_cmd(RE2_COPROCESSOR_COMMANDS.NOP)
        return True

    def compile_and_run(self, regex_string, string, double_check =True,allow_prefix=True, full_match=False, O1=True ):
        
        try:
            
            import os.path
            code_output_file = regex_string+('_ignore_' if allow_prefix else '')+('_full_match_' if full_match else '')+('_O1_' if O1 else '')+'.out'
            code_output_file = code_output_file.replace('/', u'\u2215')
            if len(code_output_file) > 255:
                code_output_file = None

            if code_output_file and  os.path.exists(code_output_file) :
                if self.verbose or self.debug :
                    print('reusing previous compilation')
                code = ''
                with open(code_output_file,'r') as f:
                    code = f.read()
            else:
                import sys
                sys.path.append('../../re2compiler')
                import re2compiler
                if self.verbose or self.debug :
                    print('start compilation')
                code = re2compiler.compile(data=regex_string,o=code_output_file, O1=O1,allow_prefix=allow_prefix, full_match=full_match)
                if self.verbose or self.debug :
                    print('end compilation')
            code = code.split('\n')
            res  = self.load_and_run( code , string)
            if double_check:
                import re
                regex            = re.compile(regex_string)
                if full_match:
                    golden_model_res = not(regex.fullmatch(string, pos=0) is None)
                elif allow_prefix:
                    golden_model_res = not(regex.search(string, pos=0) is None)
                else:
                    golden_model_res = not(regex.match(string, pos=0) is None)
                assert golden_model_res == res, f'Mismatch between golden model {golden_model_res} and regex coprocessor {res}!'
                if self.debug:
                    print('golden model agrees')
            return res
        except Exception as exc:
            print(exc)
            raise exc
        
        

    def run(self, code_filename, string):
        code = None
        
        with open(code_filename) as f:
            code = f.readlines()
        if code :
            return self.load_and_run(code, string )

    def load_and_run(self, code, string):
        if ( self.get_status() in [RE2_COPROCESSOR_STATUS.REJECTED, RE2_COPROCESSOR_STATUS.ACCEPTED]):
            self.write_cmd(RE2_COPROCESSOR_COMMANDS.RESTART)
            if debug:
                print('restart sent')

        code_address_end        = self.load_code(code)
        string_address_start    = ceil(code_address_end/self.word_size_in_bytes)*self.word_size_in_bytes
        _                       = self.load_string(string,string_address_start)
        if self.verbose or self.debug :
            print("Verifying code..."   , 'OK' if self.verify_code(code)                           else 'KO')
            print("Verifying string..." , 'OK' if self.verify_string(string, string_address_start) else 'KO')
        self.start(string_address_start)
        has_accepted = self.wait_complete()
        if self.verbose or self.debug :
            print("re2 coprocesssor has", "accepted" if has_accepted == 1 else "rejected")
        return has_accepted   
    

if __name__ == "__main__":
    debug = False
    #IP_BASE_ADDRESS = 0x43C00000 or equivalently 1136656384
    #ADDRESS_RANGE   = 6*4
    re2_coprocessor = Overlay('../bitstreams/re_copro16BBP_150.bit')
    if debug :
        print('test:',re2_coprocessor.ip_dict)
    re2_coprocessor.re2_copro_0.verbose     = True
    cc_number =  re2_coprocessor.re2_copro_0.read_elapsed_clock_cycles()
    print('status:', re2_coprocessor.re2_copro_0.get_status())
    time.sleep(1)
    
    regex_string        = '(R|K|X)(...?)?(D|B|E|Z|X)(...?)?(Y|X)'
    
    string_to_accept    = "MSIIGATRLQNDKSDTYSAGPCYAGGCSAFTPRGTCGKDWDLGEQTCASGFCTSQPLCARIKKTQVCGLRYSSKGKDPLVSAEWDSRGAPYVRCTYDADLIDTQAQVDQFVSMFGESPSLAERYCMRGVKNTAGELVSRVSSDADPAGGWCRKWYSAHRGPDQDAALGSFCIKNPGAADCKCINRASDPVYQKVKTLHAYPDQCWYVPCAADVGELKMGTQRDTPTNCPTQVCQIVFNMLDDGSVTMDDVKNTINCDFSKYVPPPPPPKPTPPTPPTPPTPPTPPTPPTPPTPRPVHNRKVMFFVAGAVLVAILISTVRW"
    string_to_reject    = "a"*15+"b"
    #test to accept

    has_accepted = re2_coprocessor.re2_copro_0.compile_and_run(regex_string, string_to_accept)
    cc_number =  re2_coprocessor.re2_copro_0.read_elapsed_clock_cycles()
    print('clock cycles taken:', cc_number)
    print('status:', re2_coprocessor.re2_copro_0.get_status())
    assert has_accepted == True, 'test failed'
    
    #re2_coprocessor.re2_copro_0.reset()
    #
    has_accepted = re2_coprocessor.re2_copro_0.compile_and_run(regex_string, string_to_reject)
    cc_number =  re2_coprocessor.re2_copro_0.read_elapsed_clock_cycles()
    print('clock cycles taken: ', cc_number)
    print('status:', re2_coprocessor.re2_copro_0.get_status())
    assert has_accepted == False, 'test failed'
