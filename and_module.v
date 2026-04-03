module and_module
(
	input a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7,
	output o0, o1 ,o2, o3, o4, o5, o6, o7
);
	
	assign o0 = a0 & b0;
	assign o1 = a1 & b1;
	assign o2 = a2 & b2;
	assign o3 = a3 & b3;
	assign o4 = a4 & b4;
	assign o5 = a5 & b5;
	assign o6 = a6 & b6;
	assign o7 = a7 & b7;

endmodule