// Ham chon phep tinh
module decoder_module
(
	input s0, s1,
	output d0, d1, d2, d3
);

wire s0_not, s1_not;

not (s0_not, s0);
not (s1_not, s1);

and (d0, s1_not, s0_not); // 00 Cong => d0 = 1
and (d1, s1_not, s0); // 01 Tru => d1 = 1
and (d2, s1, s0_not); // 10 So sanh => d2 = 1
and (d3, s1, s0); // 11 And => d3 = 1
endmodule