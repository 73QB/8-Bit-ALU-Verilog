module enable_module
(
	input E, a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7,
	output a0_new, a1_new, a2_new, a3_new, a4_new, a5_new, a6_new, a7_new,
	b0_new, b1_new, b2_new, b3_new, b4_new, b5_new, b6_new, b7_new
);
// Nếu E = 1 thì giữ nguyên, còn nếu E = 0 thì làm tín hiệu về 0, coi như không làm gì
	and (a0_new, E, a0);
	and (a1_new, E, a1);
	and (a2_new, E, a2);
	and (a3_new, E, a3);
	and (a4_new, E, a4);
	and (a5_new, E, a5);
	and (a6_new, E, a6);
	and (a7_new, E, a7);

	
	and (b0_new, E, b0);
	and (b1_new, E, b1);
	and (b2_new, E, b2);
	and (b3_new, E, b3);
	and (b4_new, E, b4);
	and (b5_new, E, b5);
	and (b6_new, E, b6);
	and (b7_new, E, b7);

endmodule