//contains signals used to interface regex_coprocessor
//and software.
package AXI_package;
localparam REG_WIDTH                = 32;
parameter  CMD_NOP                  = 'h0000_0000 ;
parameter  CMD_WRITE                = 'h0000_0001 ;
parameter  CMD_READ                 = 'h0000_0002 ;
parameter  CMD_START                = 'h0000_0003 ;
parameter  CMD_RESET                = 'h0000_0004 ;
parameter  CMD_READ_ELAPSED_CLOCK   = 'h0000_0005 ;
parameter  CMD_RESTART              = 'h0000_0006 ;


parameter  STATUS_IDLE              = 'h0000_0000 ;
parameter  STATUS_RUNNING           = 'h0000_0001 ;
parameter  STATUS_ACCEPTED          = 'h0000_0002 ;
parameter  STATUS_REJECTED          = 'h0000_0003 ;
parameter  STATUS_ERROR             = 'h0000_0004 ;
endpackage : AXI_package