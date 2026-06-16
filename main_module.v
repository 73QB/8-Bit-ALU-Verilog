module main_module 

// Tham so hoa
#(
	parameter N = 8
)

// rst_n: Khi = 0, toan bo thanh ghi xoa gia tri, he thong dung lai
// start: Khi = 1, he thong hoat dong
(
    input clk, rst_n, start,        
    input [2:0] s,                  
    input [N - 1:0] a, b,                

    output [N - 1:0] s_as,              
    output carry_as,                
    output a_gt_b, a_lt_b, a_eq_b,  
    output [N - 1:0] ab_and,            
    output [2*N - 1:0] s_m,              
    output done                     
);

	//
    wire [4:0] d; 
    decoder_module utt1 (
        .s(s),         
        .d(d)          
    );

    wire [N - 1:0] a_as, b_as; 
    wire [N - 1:0] a_c, b_c;	
    wire [N - 1:0] a_and, b_and;
    wire [N - 1:0] a_mult, b_mult; 

    wire temp_as = d[0] | d[1]; 

    enable_module #(.N(N)) en_as (
        .E(temp_as), .a_in(a), .b_in(b), .a_out(a_as), .b_out(b_as)
    );
	 // Phép cộng d[0] = 1; d[1] = 0;
	 // Phép trừ d[0] = 0; d[1] = 1
    add_sub_module #(.N(N)) adder_sub (
        .M(d[1]), .a(a_as), .b(b_as), .s(s_as), .carry(carry_as)
    );

    enable_module #(.N(N)) en_comp (
        .E(d[2]), .a_in(a), .b_in(b), .a_out(a_c), .b_out(b_c)
    );
    comparator #(.N(N)) comp (
        .a(a_c), .b(b_c), .a_gt_b(a_gt_b), .a_eq_b(a_eq_b), .a_lt_b(a_lt_b)
    );

    enable_module #(.N(N)) en_and (
        .E(d[3]), .a_in(a), .b_in(b), .a_out(a_and), .b_out(b_and)
    );
    and_module #(.N(N)) and_block (
        .a(a_and), .b(b_and), .o(ab_and) 
    );

    enable_module #(.N(N)) en_mult (
        .E(d[4]), .a_in(a), .b_in(b), .a_out(a_mult), .b_out(b_mult)
    );

    multiplier_fsm #(.N(N)) mult0 (
        .clk(clk), 
        .rst_n(rst_n), 
        .start(start & d[4]), 
        .a(a_mult), 
        .b(b_mult), 
        .res(s_m), 
        .done(done)
    );

endmodule