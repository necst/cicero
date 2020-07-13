BB_N = 16
res = ""
res = 'digraph{\n'
for i in range(BB_N):
    res += str(i) + f"[label=\"bb{i}\"]\n"
i=0
while( i < BB_N-1):
    res += str(2*BB_N-2 - i)+ f"[label=\"arbiter{i}\"]\n"
    res += str(2*BB_N-2 - i*2-1)+ "->" + str(2*BB_N-2 - i) +"\n" 
    res += str(2*BB_N-2 - i*2-2)+ "->" + str(2*BB_N-2 - i) +"\n"
    
    i+=1
res +="}\n"
with open('test.dot','w') as f:
    f.write(res)

"""for i in range(0,BB_N-2) 
        begin

            arbiter_fixed #(
                .DWITDH(PC_WIDTH+1),
                .PRIORITY_0(1)
            ) arbiter_to_ovveride_pc_at_bb_0_input (
                .in_0_ready( memory_ready_for_bb           [2*BB_N-2 - i*2  ]   ),
                .in_0_data ( memory_addr_for_bb            [2*BB_N-2 - i*2  ]   ),
                .in_0_valid( memory_valid_for_bb           [2*BB_N-2 - i*2  ]   ),
                .in_1_ready( memory_ready_for_bb           [2*BB_N-2 - i*2+1]   ),
                .in_1_data ( memory_addr_for_bb            [2*BB_N-2 - i*2+1]   ),
                .in_1_valid( memory_valid_for_bb           [2*BB_N-2 - i*2+1]   ),
                .out_ready ( memory_ready_for_bb           [2*BB_N-2 - i    ]   ),
                .out_data  ( memory_addr_for_bb            [2*BB_N-2 - i    ]   ),
                .out_valid ( memory_valid_for_bb           [2*BB_N-2 - i    ]   )
            );
        end"""