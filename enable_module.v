module enable_module

#(
	parameter N = 8
)
(
	input E,
	input [N - 1:0] a_in, b_in,
	output [N - 1:0] a_out, b_out
);

assign a_out = (E == 1'b1)? a_in : {N{1'b0}};
assign b_out = (E == 1'b1)? b_in : {N{1'b0}};
endmodule