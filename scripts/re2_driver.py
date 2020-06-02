from pynq import MMIO
from pynq import DefaultIP
import re

class re2_driver(DefaultIP):
    RE2_COPRO_DATA_IN_REGISTER_OFFSET   = 0
    RE2_COPRO_ADDRESS_REGISTER_OFFSET   = 4
    RE2_COPRO_START_CC_REGISTER_OFFSET  = 8
    RE2_COPRO_CMD_REGISTER_OFFSET       = 12
    RE2_COPRO_STATUS_REGISTER_OFFSET    = 16
    RE2_COPRO_DATA_O_REGISTER_OFFSET    = 20

    CMD_NOP                             = 0x0000 
    CMD_WRITE                           = 0x0001 
    CMD_READ                            = 0x0002 
    CMD_START                           = 0x0003 
    CMD_RESET                           = 0x0004 
    STATUS_IDLE                         = 0x0000 
    STATUS_RUNNING                      = 0x0001 
    STATUS_ACCEPTED                     = 0x0002 
    STATUS_REJECTED                     = 0x0003 

    def __init__(self, description):
        super().__init__(description=description)

    bindto = ['xilinx.com:user:re2_copro:1']

    def __code_to_bytes(self, code):
        list_bytes_big_endian = []
        for line in code:
            tmp = re.findall(r'\d+ ; \d+\n',line)
            assert all( x<=255 for x in tmp)
            list_bytes_big_endian +=bytes([tmp[0]])+bytes([tmp[1]])
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
            assert read == expected_to_read_int, "@"+str(address)+" data mismatch "+str(read)+" !== "+str(expected_to_read_int)
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

if __name__ == "__main__":
    IP_BASE_ADDRESS = 0xFFFFFFFF
    ADDRESS_RANGE = 0x0006

    re2_coprocessor = MMIO(IP_BASE_ADDRESS, ADDRESS_RANGE)
    code_filename = "code.csv"
    string        = "abcd"
    with open(code_filename) as f:
        code = f.readlines()
        code_address_end        = re2_coprocessor.load_code(code)
        string_address_start    = code_address_end
        re2_coprocessor.load_string(string,string_address_start)
        print("Verifying code..."   , re2_coprocessor.verify_code(code))
        print("Verifying string..." , re2_coprocessor.verify_string(string))
        re2_coprocessor.start(string_address_start)
        has_accepted = re2_coprocessor.wait_complete()
        print("re2 coprocesssor has ", "accepted" if has_accepted == 1 else "rejected")

