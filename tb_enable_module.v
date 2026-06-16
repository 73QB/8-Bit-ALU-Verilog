`timescale 1ns / 1ps

module tb_enable_module();
	
	parameter N = 8;
	reg [N - 1:0] a_in, b_in;
	reg E;
	wire [N - 1:0] a_out, b_out;
	
	enable_module #(.N(N)) uut
	(
		.a_in(a_in),
		.b_in(b_in),
		.E(E),
		.a_out(a_out),
		.b_out(b_out)
	);
	
	initial begin
		
		E = 1; a_in = 8'd255; b_in = 8'd0; #10;
		E = 1; a_in = 8'd100; b_in = 8'd255; #10;
		E = 0; a_in = 8'd200; b_in = 8'd0; #10;
		E = 0; a_in = 8'd50; b_in = 8'd255; #10;
		
		$stop;
	end
endmodule