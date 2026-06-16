`timescale 1ns / 1ps

module tb_decoder_module();
	reg [2:0] s;
	wire [4:0] d;
	
	decoder_module uut
	(
		.s(s),
		.d(d)
	);
	
	integer i;
	initial begin
		// Use 20 test cases to cover all possible cases of a 3-bit number
		for (i = 0; i < 20; i = i + 1)
		begin
			s = $random;
			#10;
		end
		$stop;
	end
endmodule