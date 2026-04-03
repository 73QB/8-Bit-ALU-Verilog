module main_module
(
	input s0, s1, a0, a1, a2, a3, a4, a5, a6, a7,
	b0, b1, b2, b3, b4, b5, b6, b7, // Thong tin 2 bit A B
	
	output s0_as, s1_as, s2_as, s3_as, s4_as, s5_as, 
	s6_as, s7_as, // Ket qua phep cong / tru
	
	carry_as, a_gt_b, a_lt_b, a_eq_b, // Ket qua phep so sanh 
	ab_0, ab_1, ab_2, ab_3, ab_4, ab_5, ab_6, ab_7 // Ket qua phep and
);

    wire d0, d1, d2, d3;

    decoder_module utt1(.s1(s1), .s0(s0), .d0(d0), .d1(d1), .d2(d2), .d3(d3));

    wire temp, a0_as, a1_as, a2_as, a3_as, a4_as, a5_as,
	 a6_as, a7_as, b0_as, b1_as, b2_as, b3_as, b4_as, b5_as,
	 b6_as, b7_as; // Ket qua cua phep add/sub cua hai bien A va B

	 // 1. Thuc hien phep cong / tru:
	 // Bat ham cong / tru du la phep cong hay phep tru
    or(temp, d0, d1);
	 
    enable_module enable_block1(.E(temp), .a0(a0), .a1(a1), .a2(a2), .a3(a3), 
	 .a4(a4), .a5(a5), .a6(a6), .a7(a7),
	 .b0(b0), .b1(b1), .b2(b2), .b3(b3), .b4(b4), .b5(b5), .b6(b6), .b7(b7),
	 .a0_new(a0_as), .a1_new(a1_as), .a2_new(a2_as), .a3_new(a3_as), 
	 .a4_new(a4_as), .a5_new(a5_as), .a6_new(a6_as), .a7_new(a7_as),
	 .b0_new(b0_as), .b1_new(b1_as), .b2_new(b2_as), .b3_new(b3_as), 
	 .b4_new(b4_as), .b5_new(b5_as), .b6_new(b6_as), .b7_new(b7_as)
	 );


    add_sub_module adder_sub1
	 (
	 .M(d1), .a0(a0_as), .a1(a1_as), .a2(a2_as), 
	 .a3(a3_as), .a4(a4_as), .a5(a5_as), .a6(a6_as), .a7(a7_as),
	 .b0(b0_as), .b1(b1_as), .b2(b2_as), .b3(b3_as), .b4(b4_as), .b5(b5_as), 
	 .b6(b6_as), .b7(b7_as), 
	 .s0(s0_as), .s1(s1_as), .s2(s2_as), .s3(s3_as), .s4(s4_as), .s5(s5_as), 
	 .s6(s6_as), .s7(s7_as), .carry(carry_as)
	 );



	 // 2. Bo so sanh
	 
    wire a0_c, a1_c, a2_c, a3_c, a4_c, a5_c, a6_c, a7_c, 
	 b0_c, b1_c, b2_c, b3_c, b4_c, b5_c, b6_c, b7_c;

    enable_module enable_block2
	 (
	 .E(d2), .a0(a0), .a1(a1), .a2(a2), .a3(a3), 
	 .a4(a4), .a5(a5), .a6(a6), .a7(a7) ,.b0(b0), .b1(b1), .b2(b2), .b3(b3), 
	 .b4(b4), .b5(b5), .b6(b6), .b7(b7),
	 .a0_new(a0_c), .a1_new(a1_c), .a2_new(a2_c), .a3_new(a3_c), .a4_new(a4_c), 
	 .a5_new(a5_c), .a6_new(a6_c), .a7_new(a7_c),
	 .b0_new(b0_c), .b1_new(b1_c), .b2_new(b2_c), .b3_new(b3_c), .b4_new(b4_c), 
	 .b5_new(b5_c), .b6_new(b6_c), .b7_new(b7_c)
	 );

    comparator comp1 (
        .a0(a0_c), .a1(a1_c), .a2(a2_c), .a3(a3_c), .a4(a4_c), .a5(a5_c), .a6(a6_c), .a7(a7_c),
        .b0(b0_c), .b1(b1_c), .b2(b2_c), .b3(b3_c), .b4(b4_c), .b5(b5_c), .b6(b6_c), .b7(b7_c),
        .a_gt_b(a_gt_b), 
        .a_eq_b(a_eq_b), 
        .a_lt_b(a_lt_b) 
    );



   // 3. Bo and
    wire a0_and, a1_and, a2_and, a3_and, a4_and, a5_and, a6_and, a7_and,
         b0_and, b1_and, b2_and, b3_and, b4_and, b5_and, b6_and, b7_and;

    enable_module enable_block3 (
        .E(d3), 
        .a0(a0), .a1(a1), .a2(a2), .a3(a3), .a4(a4), .a5(a5), .a6(a6), .a7(a7),
        .b0(b0), .b1(b1), .b2(b2), .b3(b3), .b4(b4), .b5(b5), .b6(b6), .b7(b7),
        .a0_new(a0_and), .a1_new(a1_and), .a2_new(a2_and), .a3_new(a3_and), 
        .a4_new(a4_and), .a5_new(a5_and), .a6_new(a6_and), .a7_new(a7_and),
        .b0_new(b0_and), .b1_new(b1_and), .b2_new(b2_and), .b3_new(b3_and), 
        .b4_new(b4_and), .b5_new(b5_and), .b6_new(b6_and), .b7_new(b7_and)
    );

    and_module andblock1 (
        .a0(a0_and), .a1(a1_and), .a2(a2_and), .a3(a3_and), .a4(a4_and), .a5(a5_and), .a6(a6_and), .a7(a7_and),
        .b0(b0_and), .b1(b1_and), .b2(b2_and), .b3(b3_and), .b4(b4_and), .b5(b5_and), .b6(b6_and), .b7(b7_and),
        .o0(ab_0), .o1(ab_1), .o2(ab_2), .o3(ab_3), .o4(ab_4), .o5(ab_5), .o6(ab_6), .o7(ab_7)
    );



endmodule

