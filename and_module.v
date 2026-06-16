module and_module
#(
	parameter N = 8
)
(
	input [N - 1:0] a, b,
	output [N - 1:0] o
	
);
	
	assign o = a & b;
endmodule
