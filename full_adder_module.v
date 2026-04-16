<<<<<<< HEAD
module full_adder_module 
(
	input a, b, carry_in,
	output sum, carry_out
);

	wire t1, t2, t3;
	assign t1 = a ^ b; // phep cong bit a va b: XOR
	assign t2 = a & b; // Kiem tra hai bit nay cong nhau co nho khong
	assign sum = t1 ^ carry_in; // phep cong giua tong a, b va bit 	
										// nho vao
	assign t3 = t1 & carry_in; 
	assign carry_out = t3 | t2;
	
=======
module full_adder_module 
(
	input a, b, carry_in,
	output sum, carry_out
);

	wire t1, t2, t3;
	assign t1 = a ^ b; // phep cong bit a va b: XOR
	assign t2 = a & b; // Kiem tra hai bit nay cong nhau co nho khong
	assign sum = t1 ^ carry_in; // phep cong giua tong a, b va bit 	
										// nho vao
	assign t3 = t1 & carry_in; 
	assign carry_out = t3 | t2;
	
>>>>>>> c7fdf456cf3266cb8c1a2771de77788b270bcffe
endmodule