import pynq
from pynq import Overlay
from pynq import MMIO
from pynq import DefaultIP
import re
import time

class re2_driver(DefaultIP):
    RE2_COPRO_DATA_IN_REGISTER_OFFSET   = 0
    RE2_COPRO_ADDRESS_REGISTER_OFFSET   = 4
    RE2_COPRO_START_CC_REGISTER_OFFSET  = 8
    RE2_COPRO_CMD_REGISTER_OFFSET       = 12
    RE2_COPRO_STATUS_REGISTER_OFFSET    = 16
    RE2_COPRO_DATA_O_REGISTER_OFFSET    = 20

    CMD_NOP                             = 0x0000_0000 
    CMD_WRITE                           = 0x0000_0001 
    CMD_READ                            = 0x0000_0002 
    CMD_START                           = 0x0000_0003 
    CMD_RESET                           = 0x0000_0004 
    STATUS_IDLE                         = 0x0000_0000 
    STATUS_RUNNING                      = 0x0000_0001 
    STATUS_ACCEPTED                     = 0x0000_0002 
    STATUS_REJECTED                     = 0x0000_0003 
    debug                               = False

    def __init__(self, description):
        super().__init__(description=description)

    bindto = ['xilinx.com:user:re2_copro:2']

    def __code_to_bytes(self, code):
        list_bytes_big_endian = []
        for line in code:
            tmp = re.findall(r'(\d+) ; (\d+)\n',line)
            if self.debug:
                print(tmp[0])
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
        write_width = 4
        for string_offset in range(0,len(bytes_list), write_width):
            to_write        = bytes_list[string_offset: string_offset+write_width]
            #byteorder start with Least Significant Bytes
            to_write_int    = int.from_bytes(to_write, byteorder=byteorder, signed=False) 
            if self.debug:
                print('@ ', address,' written ',to_write,'->', to_write_int)
            self.write(self.RE2_COPRO_ADDRESS_REGISTER_OFFSET, address)
            self.write(self.RE2_COPRO_DATA_IN_REGISTER_OFFSET, to_write_int )
            if(flag):
                flag = False
                self.write(self.RE2_COPRO_CMD_REGISTER_OFFSET, self.CMD_WRITE)

            address+=2
        
        self.write(self.RE2_COPRO_CMD_REGISTER_OFFSET, self.CMD_NOP)
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
        read_width  = 2
        for string_offset in range(0,len(bytes_list), +read_width):
            expected_to_read    = bytes_list[string_offset: string_offset+read_width]
            #byteorder start with Least Significant Bytes
            expected_to_read_int= int.from_bytes(expected_to_read, byteorder=byteorder, signed=False) 
            self.write(self.RE2_COPRO_ADDRESS_REGISTER_OFFSET, address)
            if(flag):
                flag = False
                self.write(self.RE2_COPRO_CMD_REGISTER_OFFSET, self.CMD_READ)
            read = self.read(self.RE2_COPRO_DATA_O_REGISTER_OFFSET)
            if self.debug:
                print('@ ', address,' read ', read,' expected ', expected_to_read_int)
            assert read == expected_to_read_int, ("@ "+str(address)+" data mismatch "+str(read)+" !== "+str(expected_to_read_int))
            address+=1
        
        self.write(self.RE2_COPRO_CMD_REGISTER_OFFSET, self.CMD_NOP)
        return 1

    def start(self, start_string_address):
        self.write(self.RE2_COPRO_START_CC_REGISTER_OFFSET  , start_string_address  )
        self.write(self.RE2_COPRO_CMD_REGISTER_OFFSET       , self.CMD_START        )
        self.write(self.RE2_COPRO_CMD_REGISTER_OFFSET       , self.CMD_NOP          )

    def wait_complete(self):
        while(self.read(self.RE2_COPRO_STATUS_REGISTER_OFFSET) == self.STATUS_RUNNING):
            pass

        return self.read(self.RE2_COPRO_STATUS_REGISTER_OFFSET) == self.STATUS_ACCEPTED
    
    def get_status(self):
        return self.read(self.RE2_COPRO_STATUS_REGISTER_OFFSET)
    
    def reset(self):
        self.write(self.RE2_COPRO_CMD_REGISTER_OFFSET       , self.CMD_RESET)
        self.write(self.RE2_COPRO_CMD_REGISTER_OFFSET       , self.CMD_NOP)

if __name__ == "__main__":
    #IP_BASE_ADDRESS = 0x43C00000 or equivalently 1136656384
    #ADDRESS_RANGE   = 6*4
    re2_coprocessor = Overlay('design_1.bit')
    print('test:',re2_coprocessor.ip_dict)
    print('test:',re2_coprocessor.reset())
    time.sleep(1)
    
    code_filename = "code.csv"
    string        = "abcbcbcbcbc"
    with open(code_filename) as f:
        code = f.readlines()
        code_address_end        = re2_coprocessor.re2_copro_0.load_code(code)
        string_address_start    = code_address_end
        re2_coprocessor.re2_copro_0.load_string(string,string_address_start)
        print("Verifying code..."   , 'OK' if re2_coprocessor.re2_copro_0.verify_code(code)                          else 'KO')
        print("Verifying string..." , 'OK' if re2_coprocessor.re2_copro_0.verify_string(string, string_address_start)else 'KO')
        re2_coprocessor.re2_copro_0.start(string_address_start)
        has_accepted = re2_coprocessor.re2_copro_0.wait_complete()
        print("re2 coprocesssor has ", "accepted" if has_accepted == 1 else "rejected")

