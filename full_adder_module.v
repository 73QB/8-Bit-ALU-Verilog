module full_adder_module
(
	input a, b, carry_in,
	output sum, carry_out
);
	wire t1, t2, t3;
	// XOR lay gia tri cong
	assign t1 = a ^ b;
	// Luu gia tri nho khi a + b
	assign t2 = a & b;
	// Luu gia tri cong a + b + carry_in
	assign sum = t1 ^ carry_in;
	// Luu gia tri nho
	assign t3 = t1 & carry_in;
	// Luu gia tri nho, su dung OR thay vi XOR
	// vi t2 va t3 khong dong thoi = 1
	assign carry_out = t2 | t3; 
endmodule