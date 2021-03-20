interface cpu_iface #(
    parameter PC_WIDTH = 8 
);

    logic                           pc_valid;
    logic[PC_WIDTH-1:0]             pc; 
    logic                           refer_to_char;         
    logic                           pc_ready;

    function logic send(
        input logic [PC_WIDTH-1:0] input_pc,
        input logic                input_refers_to_char
    );
        pc_valid        = 1'b1;
        pc              = input_pc;
        refer_to_char   = input_refers_to_char;
        return          pc_ready;
    endfunction


    modport in (
        input   pc_valid,
        input   pc,
        input   refer_to_char,
        output  pc_ready
    );

    modport out (
        import send,
        output   pc_valid,
        output   pc,
        output   refer_to_char,
        input    pc_ready
    );

   
endinterface //cpu