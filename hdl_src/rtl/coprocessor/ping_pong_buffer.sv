module ping_pong_buffer #(
    parameter DATA_WIDTH,
    parameter COUNT_WIDTH
) (
    input   wire                        clk,   
    input   wire                        rst,
    input   wire                        cur_is_even_character,
    //FIFO cur_char signal
    output  logic                       fifo_cur_char_data_in_ready  ,
    input   logic [DATA_WIDTH-1:0]      fifo_cur_char_data_in        ,
    input   logic                       fifo_cur_char_data_in_valid  ,
    input   logic                       fifo_cur_char_data_out_ready ,
    output  logic [DATA_WIDTH-1:0]      fifo_cur_char_data_out       ,
    output  logic                       fifo_cur_char_data_out_valid ,
    output  logic [COUNT_WIDTH-1:0]     fifo_cur_char_data_count     ,
    //FIFO next_char signal
    output  logic                       fifo_next_char_data_in_ready ,
    input   logic [DATA_WIDTH-1:0]      fifo_next_char_data_in       ,
    input   logic                       fifo_next_char_data_in_valid ,
    input   logic                       fifo_next_char_data_out_ready,
    output  logic [DATA_WIDTH-1:0]      fifo_next_char_data_out      ,
    output  logic                       fifo_next_char_data_out_valid,
    output  logic [COUNT_WIDTH-1:0]     fifo_next_char_data_count    
);
    //FIFO even signal 
    logic                       fifo_even_data_in_ready     ;
    logic                       fifo_even_data_in_not_ready ;
    logic [DATA_WIDTH-1:0]      fifo_even_data_in           ;
    logic                       fifo_even_data_in_valid     ;
    logic                       fifo_even_data_out_ready    ;
    logic [DATA_WIDTH-1:0]      fifo_even_data_out          ;
    logic                       fifo_even_data_out_valid    ;
    logic                       fifo_even_data_out_not_valid;
    logic [COUNT_WIDTH-1:0]     fifo_even_data_count        ;
    //FIFO odd signal
    logic                       fifo_odd_data_in_ready      ;
    logic                       fifo_odd_data_in_not_ready  ;
    logic [DATA_WIDTH-1:0]      fifo_odd_data_in            ;
    logic                       fifo_odd_data_in_valid      ;
    logic                       fifo_odd_data_out_ready     ;
    logic [DATA_WIDTH-1:0]      fifo_odd_data_out           ;
    logic                       fifo_odd_data_out_valid     ;
    logic                       fifo_odd_data_out_not_valid ;
    logic [COUNT_WIDTH-1:0]     fifo_odd_data_count         ;


    //FIFO even instantiation 
    fifo #(
        .DWIDTH(DATA_WIDTH),
        .COUNT_WIDTH(COUNT_WIDTH)
    )fifo_even(
        .clk         (clk                         ), 
        .rst       (rst                       ), 
        .full        (fifo_even_data_in_not_ready ), //equivalent to not data_in_ready
        .din         (fifo_even_data_in           ),  
        .wr_en       (fifo_even_data_in_valid     ), //equivalent to data_in_valid
        .rd_en       (fifo_even_data_out_ready    ), //equivalent to data_out_ready
        .dout        (fifo_even_data_out          ), 
        .empty       (fifo_even_data_out_not_valid), //equivalent to not data_out_valid
        .data_count  (fifo_even_data_count        )
    );
    //conclusion fifo even instatiation convert negated not_ready/not_valid signals to "standard" ready/valid interface.
    assign fifo_even_data_in_ready  = ~ fifo_even_data_in_not_ready ;
    assign fifo_even_data_out_valid = ~ fifo_even_data_out_not_valid;

    //FIFO odd instantiation 
    fifo #(
        .DWIDTH(DATA_WIDTH),
        .COUNT_WIDTH(COUNT_WIDTH)
    )fifo_odd(
        .clk         (clk                        ), 
        .rst       (rst                      ), 
        .full        (fifo_odd_data_in_not_ready ), //equivalent to not data_in_ready
        .din         (fifo_odd_data_in           ),  
        .wr_en       (fifo_odd_data_in_valid     ), //equivalent to data_in_valid
        .rd_en       (fifo_odd_data_out_ready    ), //equivalent to data_out_ready
        .dout        (fifo_odd_data_out          ), 
        .data_count  (fifo_odd_data_count        ),
        .empty       (fifo_odd_data_out_not_valid) //equivalent to not data_out_valid
    );
    //conclusion fifo odd instatiation convert negated not_ready/not_valid signals to "standard" ready/valid interface.
    assign fifo_odd_data_in_ready  = ~ fifo_odd_data_in_not_ready ;
    assign fifo_odd_data_out_valid = ~ fifo_odd_data_out_not_valid;

    //select fifo current and fifo next according to cur_is_even_character signal
    always_comb begin : selector_fifo_current_fifo_next
        
        if ( cur_is_even_character == 1'b1  )
        begin //even is current and odd is next_char
            fifo_cur_char_data_in_ready   =  fifo_even_data_in_ready      ;
            fifo_even_data_in             =  fifo_cur_char_data_in        ;
            fifo_even_data_in_valid       =  fifo_cur_char_data_in_valid  ; 
            fifo_even_data_out_ready      =  fifo_cur_char_data_out_ready ;
            fifo_cur_char_data_out        =  fifo_even_data_out           ;
            fifo_cur_char_data_out_valid  =  fifo_even_data_out_valid     ;
            fifo_cur_char_data_count      =  fifo_even_data_count         ;

            fifo_next_char_data_in_ready  =  fifo_odd_data_in_ready       ;
            fifo_odd_data_in              =  fifo_next_char_data_in       ;
            fifo_odd_data_in_valid        =  fifo_next_char_data_in_valid ; 
            fifo_odd_data_out_ready       =  fifo_next_char_data_out_ready;
            fifo_next_char_data_out       =  fifo_odd_data_out            ;
            fifo_next_char_data_out_valid =  fifo_odd_data_out_valid      ;
            fifo_next_char_data_count     =  fifo_odd_data_count          ;
        end
        else
        begin //odd is current and even is next_char
            fifo_cur_char_data_in_ready   =  fifo_odd_data_in_ready       ;
            fifo_odd_data_in              =  fifo_cur_char_data_in        ;
            fifo_odd_data_in_valid        =  fifo_cur_char_data_in_valid  ; 
            fifo_odd_data_out_ready       =  fifo_cur_char_data_out_ready ;
            fifo_cur_char_data_out        =  fifo_odd_data_out            ;
            fifo_cur_char_data_out_valid  =  fifo_odd_data_out_valid      ;
            fifo_cur_char_data_count      =  fifo_odd_data_count          ;

            fifo_next_char_data_in_ready  =  fifo_even_data_in_ready      ;
            fifo_even_data_in             =  fifo_next_char_data_in       ;
            fifo_even_data_in_valid       =  fifo_next_char_data_in_valid ; 
            fifo_even_data_out_ready      =  fifo_next_char_data_out_ready;
            fifo_next_char_data_out       =  fifo_even_data_out           ;
            fifo_next_char_data_out_valid =  fifo_even_data_out_valid     ;
            fifo_next_char_data_count     =  fifo_even_data_count         ;
        end                        
    end


endmodule