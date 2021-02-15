interface memory_read_iface #(
    parameter MEMORY_ADDR_WIDTH = 10,
    parameter MEMORY_WIDTH      = 32
);
    logic                           ready;
    logic[MEMORY_ADDR_WIDTH-1:0]    addr;
    logic[MEMORY_WIDTH-1     :0]    data;
    logic                           valid;

    modport in (
        output ready,
        input  addr,
        output data,
        input  valid
    );

    modport out(
        import request,
        input  ready,
        output addr,
        input  data,
        output valid
    );

    function logic request(
        input logic [MEMORY_ADDR_WIDTH-1:0] address
    );
        valid = 1'b1;
        addr  = address;
        return ready;
    endfunction



endinterface //memory_iface