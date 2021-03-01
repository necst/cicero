//contains signals used to interface regex_coprocessor
//and AXI_top
package coprocessor_package;

    localparam nr_bits_states = 3;
    typedef enum logic[nr_bits_states-1 : 0] {
                                                CICERO_IDLE                         ,
                                                CICERO_FETCH_1ST                    ,
                                                CICERO_FETCH_CCS_BUFFER             ,
                                                CICERO_FETCH_FROM_CCS_BUFFER        ,
                                                CICERO_EXE                          , 
                                                CICERO_COMPLETED_WITHOUT_ACCEPTING  ,
                                                CICERO_COMPLETED_ACCEPTING          ,  
                                                CICERO_ERROR                        
                                            } State;

endpackage : coprocessor_package