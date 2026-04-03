`timescale 1ns/1ps // Đơn vị thời gian là 1 nano giây

module tb_main_module(); // Module testbench không có chân cắm

    // 1. Khai báo các dây để nối vào chip (Input dùng reg, Output dùng wire)
    reg s0, s1;
    reg a0, a1, a2, a3, a4, a5, a6, a7;
    reg b0, b1, b2, b3, b4, b5, b6, b7;
    
    wire s0_as, s1_as, s2_as, s3_as, s4_as, s5_as, s6_as, s7_as;
    wire carry_as, a_gt_b, a_lt_b, a_eq_b;
    wire ab_0, ab_1, ab_2, ab_3, ab_4, ab_5, ab_6, ab_7;

    // 2. Gọi con chip 8-bit của Tuấn ra (Unit Under Test - UUT)
    main_module uut (
        .s0(s0), .s1(s1), 
        .a0(a0), .a1(a1), .a2(a2), .a3(a3), .a4(a4), .a5(a5), .a6(a6), .a7(a7),
        .b0(b0), .b1(b1), .b2(b2), .b3(b3), .b4(b4), .b5(b5), .b6(b6), .b7(b7),
        .s0_as(s0_as), .s1_as(s1_as), .s2_as(s2_as), .s3_as(s3_as), 
        .s4_as(s4_as), .s5_as(s5_as), .s6_as(s6_as), .s7_as(s7_as),
        .carry_as(carry_as), .a_gt_b(a_gt_b), .a_lt_b(a_lt_b), .a_eq_b(a_eq_b),
        .ab_0(ab_0), .ab_1(ab_1), .ab_2(ab_2), .ab_3(ab_3), 
        .ab_4(ab_4), .ab_5(ab_5), .ab_6(ab_6), .ab_7(ab_7)
    );

    // 3. Kịch bản thử nghiệm (Stimulus)
    initial begin
        // --- TEST 1: Phép Cộng (s1s0 = 00) ---
        s1 = 0; s0 = 0;
        // A = 5 (00000101), B = 3 (00000011)
        a7=0; a6=0; a5=0; a4=0; a3=0; a2=1; a1=0; a0=1;
        b7=0; b6=0; b5=0; b4=0; b3=0; b2=0; b1=1; b0=1;
        #10; // Đợi 10ns xem kết quả (Phải ra 8)

        // --- TEST 2: Phép Trừ (s1s0 = 01) ---
        s1 = 0; s0 = 1;
        #10; // Đợi 10ns (Phải ra 2)

        // --- TEST 3: So sánh (s1s0 = 10) ---
        s1 = 1; s0 = 0;
        #10; // Đợi 10ns (a_gt_b phải lên 1)
		  
		  
		  // --- TEST 4: AND (s1s0 = 11) ---
		  s1 = 1; s0 = 1;
        // Kết quả mong đợi: ab = 160 (10100000)
        
        #10;
		  
        $stop; // Dừng mô phỏng
    end

endmodule