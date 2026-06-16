`timescale 1ns / 1ps

module tb_comparator();
	
	parameter N = 8;
	reg [N - 1:0] a, b;
	wire a_gt_b, a_lt_b, a_eq_b;
	
	comparator #(.N(N)) uut
	(
		.a(a),
		.b(b),
		.a_gt_b(a_gt_b),
		.a_lt_b(a_lt_b),
		.a_eq_b(a_eq_b)
	);
	
	initial begin
		a = 8'd255; b = 8'd0; #10;
		a = 8'd255; b = 8'd50; #10;
		a = 8'd255; b = 8'd255; #10;
		a = 8'd0; b = 8'd0; #10;
		a = 8'd0; b = 8'd255; #10;
		a = 8'd0; b = 8'd1; #10;
		$stop;
	end
	
endmodule