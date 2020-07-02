//contains signals used to interface regex_coprocessor
//and AXI_top
package Regex_coprocessor_package;

    localparam nr_bits_states = 3;
    typedef enum logic[nr_bits_states-1 : 0] {
                                                REGEX_COPRO_S_IDLE                        , REGEX_COPRO_S_FETCH_1ST_CC  ,
                                                REGEX_COPRO_S_FETCH_NEXT_CC               , REGEX_COPRO_S_EXEC          , 
                                                REGEX_COPRO_S_COMPLETED_WITHOUT_ACCEPTING , REGEX_COPRO_S_COMPLETE_ACCEPTING,  
                                                REGEX_COPRO_S_ERROR
                                            } State;

endpackage : Regex_coprocessor_package