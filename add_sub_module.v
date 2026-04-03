module add_sub_module
(
	input a0, a1, a2, a3, a4, a5, a6, a7,
	b0, b1, b2, b3, b4, b5, b6, b7, M,
	output s0, s1, s2, s3, s4, s5, s6, s7, carry
);

	// Dao gia tri cua B de dung khi M = 1: Thuc hien phep tru
	// A xor M(=1) = ~A
	// A xor M(=0) = A
	wire t0, t1, t2, t3, t4, t5, t6, t7;
	xor (t0, b0, M);
	xor (t1, b1, M);
	xor (t2, b2, M);
	xor (t3, b3, M);
	xor (t4, b4, M);
	xor (t5, b5, M);
	xor (t6, b6, M);
	xor (t7, b7, M);

	// Tao cac bien de luu gia tri nho sau moi lan tinh
	wire c1, c2, c3, c4, c5, c6, c7;
	
	// Thuc hien phep cong / tru
	full_adder_module block0(.a(a0), .b(t0), .carry_in(M), .sum(s0), .carry_out(c1));
	full_adder_module block1(.a(a1), .b(t1), .carry_in(c1), .sum(s1), .carry_out(c2));
	full_adder_module block2(.a(a2), .b(t2), .carry_in(c2), .sum(s2), .carry_out(c3));
	full_adder_module block3(.a(a3), .b(t3), .carry_in(c3), .sum(s3), .carry_out(c4));
	full_adder_module block4(.a(a4), .b(t4), .carry_in(c4), .sum(s4), .carry_out(c5));
	full_adder_module block5(.a(a5), .b(t5), .carry_in(c5), .sum(s5), .carry_out(c6));
	full_adder_module block6(.a(a6), .b(t6), .carry_in(c6), .sum(s6), .carry_out(c7));
	full_adder_module block7(.a(a7), .b(t7), .carry_in(c7), .sum(s7), .carry_out(carry));


endmodule