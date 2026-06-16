`timescale 1ns / 1ps
module tb_full_adder_module();
	reg a;
	reg b;
	reg carry_in;
	wire sum;
	wire carry_out;

	full_adder_module uut
	(
		.a(a),
		.b(b),
		.carry_in(carry_in),
		.sum(sum),
		.carry_out(carry_out)
	);
	
	initial begin
	
		a = 0; b = 0; carry_in = 0; #10;// TH1: 0 + 0 + 0
		a = 0; b = 0; carry_in = 1; #10;// TH2: 0 + 0 + 1
		a = 0; b = 1; carry_in = 0; #10;// TH3: 0 + 1 + 0
		a = 0; b = 1; carry_in = 1; #10;// TH4: 0 + 1 + 1
		
		a = 1; b = 0; carry_in = 0; #10;// TH5: 1 + 0 + 0
		a = 1; b = 0; carry_in = 1; #10;// TH6: 1 + 0 + 1
		a = 1; b = 1; carry_in = 0; #10;// TH7: 1 + 1 + 0
		a = 1; b = 1; carry_in = 1; #10;// TH8: 1 + 1 + 1
		$stop;
	end

endmodule

