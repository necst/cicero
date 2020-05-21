`timescale 1ns/1ps

package AXI_package;
localparam REG_WIDTH        = 32;
parameter  CMD_NOP          = 'h0000 ;
parameter  CMD_WRITE        = 'h0001 ;
parameter  CMD_READ         = 'h0002 ;
parameter  CMD_START        = 'h0003 ;
parameter  CMD_RESET        = 'h0004 ;

parameter  STATUS_IDLE      = 'h0000 ;
parameter  STATUS_RUNNING   = 'h0001 ;
parameter  STATUS_ACCEPTED  = 'h0002 ;
parameter  STATUS_REJECTED  = 'h0003 ;

endpackage : AXI_package