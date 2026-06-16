`timescale 1ns / 1ps

module tb_and_module ();
	parameter N = 8;
	reg [N - 1:0] a, b;
	wire [N - 1:0] o;
	
	and_module #(.N(N)) uut
	(
		.a(a),
		.b(b),
		.o(o)
	);
	
	initial begin
		a = 8'b00001111; b = 8'b01010101; #10;
		a = 8'b00001111; b = 8'b01010101; #10;
		a = 8'b01010101; b = 8'b10101010; #10;
		a = 8'hFF; b = 8'h00; #10;
		$stop;
	end
endmodule