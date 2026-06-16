`timescale 1ns/1ps

module tb_add_sub_module();

	parameter N = 8;

	reg [N -1 : 0] a, b;
	reg M;
	wire [N - 1 : 0] s;
	wire carry;

	add_sub_module #(.N(N)) uut
	(
		.a(a),
		.b(b),
		.M(M),
		.s(s),
		.carry(carry)
	);

	initial begin
		M = 0; 
		a = 8'b00001111; b = 8'b01010101; #10; // s = 8'b01100100)
		a = 8'b01010101; b = 8'b10101010; #10; // s = 8'b11111111
		a = 8'hFF;       b = 8'h01;       #10; // s = 8'h00

		M = 1;
		a = 8'd50;       b = 8'd20;       #10; // 50 - 20 = 30 (s = 8'd30)
		a = 8'd10;       b = 8'd10;       #10; // 10 - 10 = 0  (s = 8'd0)
		a = 8'hFF;       b = 8'h00;       #10; // FF - 00 = FF (s = 8'hFF)
		$stop;
	end
endmodule