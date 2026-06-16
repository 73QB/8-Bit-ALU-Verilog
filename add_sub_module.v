module add_sub_module

#(
	parameter N = 8
)

(
    input [N - 1:0] a, b, 
    input M,
    output [N - 1:0] s, 
    output carry
);

    // A xor M(=1) = ~A: Phep tru
    // A xor M(=0) = A: Phep cong
    // Tao ra tin hieu B tuy theo phep cong hay tru
    wire [N - 1:0] t;
    assign t = b ^ {8{M}};
    
	 
	 /*
    // Tao cac bien de luu gia tri nho sau moi lan tinh
    wire [N - 1:1] c;
    
	 
    // Thuc hien phep cong / tru
	 
    full_adder_module block0(.a(a[0]), .b(t[0]), .carry_in(M),    .sum(s[0]), .carry_out(c[1]));
    full_adder_module block1(.a(a[1]), .b(t[1]), .carry_in(c[1]), .sum(s[1]), .carry_out(c[2]));
    full_adder_module block2(.a(a[2]), .b(t[2]), .carry_in(c[2]), .sum(s[2]), .carry_out(c[3]));
    full_adder_module block3(.a(a[3]), .b(t[3]), .carry_in(c[3]), .sum(s[3]), .carry_out(c[4]));
    full_adder_module block4(.a(a[4]), .b(t[4]), .carry_in(c[4]), .sum(s[4]), .carry_out(c[5]));
    full_adder_module block5(.a(a[5]), .b(t[5]), .carry_in(c[5]), .sum(s[5]), .carry_out(c[6]));
    full_adder_module block6(.a(a[6]), .b(t[6]), .carry_in(c[6]), .sum(s[6]), .carry_out(c[7]));
    full_adder_module block7(.a(a[7]), .b(t[7]), .carry_in(c[7]), .sum(s[7]), .carry_out(carry));
	 */
	 
	 
	 wire [N:0] c;
	 assign c[0] = M;
	 
	 genvar i;
	 generate
		for (i = 0; i < N; i = i + 1)
		// Phai dat ten cho vong lap for trong khoi generate
		begin: gen_loop 
			full_adder_module testBlock
			(
				.a(a[i]), 
				.b(t[i]),
				.carry_in(c[i]),
	         .sum(s[i]), 
				.carry_out(c[i+1])
			);
		end
	 endgenerate
	 assign carry = c[N];
	 
endmodule