module main_module (
    input clk, rst_n, start,        
    input [2:0] s,                  
    input [7:0] a, b,                

    output [7:0] s_as,              
    output carry_as,                
    output a_gt_b, a_lt_b, a_eq_b,  
    output [7:0] ab_and,            
    output [15:0] s_m,              
    output done                     
);

    wire [4:0] d; 
    decoder_module utt1 (
        .s(s),         
        .d(d)          
    );

    wire [7:0] a_as, b_as; 
    wire [7:0] a_c, b_c;	
    wire [7:0] a_and, b_and;
    wire [7:0] a_mult, b_mult; 

    wire temp_as = d[0] | d[1]; 

    enable_module en_as (
        .E(temp_as), .a_in(a), .b_in(b), .a_out(a_as), .b_out(b_as)
    );
    add_sub_module adder_sub (
        .M(d[1]), .a(a_as), .b(b_as), .s(s_as), .carry(carry_as)
    );

    enable_module en_comp (
        .E(d[2]), .a_in(a), .b_in(b), .a_out(a_c), .b_out(b_c)
    );
    comparator comp (
        .a(a_c), .b(b_c), .a_gt_b(a_gt_b), .a_eq_b(a_eq_b), .a_lt_b(a_lt_b)
    );

    enable_module en_and (
        .E(d[3]), .a_in(a), .b_in(b), .a_out(a_and), .b_out(b_and)
    );
    and_module and_block (
        .a(a_and), .b(b_and), .o(ab_and) 
    );

    enable_module en_mult (
        .E(d[4]), .a_in(a), .b_in(b), .a_out(a_mult), .b_out(b_mult)
    );

    multiplier_fsm mult0 (
        .clk(clk), 
        .rst_n(rst_n), 
        .start(start & d[4]), 
        .a(a_mult), 
        .b(b_mult), 
        .res(s_m), 
        .done(done)
    );

endmodule