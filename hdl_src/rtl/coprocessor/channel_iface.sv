interface channel_iface #(
    parameter N=10,
    parameter LATENCY_COUNT_WIDTH=6
);

    logic                           valid;
    logic[N-1  :0]                  data;         
    logic                           ready;
    logic[LATENCY_COUNT_WIDTH-1:0]  latency;

    function logic send(
        input logic [N-1:0] input_data
    );
        valid           = 1'b1;
        data            = input_data;
        return          ready;
    endfunction

    modport in (
        input   valid,
        input   data,
        output  ready,
        output  latency
    );

    modport out (
        import   send,
        output   valid,
        output   data,
        input    ready,
        input    latency
    );

endinterface //cpu