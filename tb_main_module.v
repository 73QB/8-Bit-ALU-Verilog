`timescale 1ns / 1ps

module tb_main_module();
    parameter N = 8;

    reg clk;
    reg rst_n;
    reg start;
    reg [2:0] s;
    reg [N - 1:0] a;
    reg [N - 1:0] b;

    wire [N - 1:0] s_as;
    wire carry_as;
    wire a_gt_b;
    wire a_lt_b;
    wire a_eq_b;
    wire [N - 1:0] ab_and;
    wire [2*N - 1:0] s_m;
    wire done;

    main_module #(.N(N)) DUT (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .s(s),
        .a(a),
        .b(b),
        .s_as(s_as),
        .carry_as(carry_as),
        .a_gt_b(a_gt_b),
        .a_lt_b(a_lt_b),
        .a_eq_b(a_eq_b),
        .ab_and(ab_and),
        .s_m(s_m),
        .done(done)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Chu kỳ 10ns (Tần số 100MHz)
    end

    initial begin
     
        rst_n = 1'b1;
        start = 1'b0;
        s = 3'b000; 
        a = 0; 
        b = 0;
        
        #10 rst_n = 1'b0;
        #10 rst_n = 1'b1;
        #10;

       
        $display("=== [TEST 1] Kiem tra chuc nang Cong ===");
        s = 3'b000;
        a = 8'd50;
        b = 8'd25;
        #20;
        $display("Thoi gian %0t | a = %d, b = %d | Ket qua Cong = %d", $time, a, b, s_as);
		  
		  $display("=== Kiem tra cac phep toan con lai: ===");
        
        // Tru
        s = 3'b001;
        a = 8'd100;
        b = 8'd40;
        #20;
        $display("Tru: %d - %d = %d", a, b, s_as);
        
		  // So sanh
        s = 3'b010;
        a = 8'd100;
        b = 8'd40;
        #20;
        $display("So sanh: a_gt_b=%b, a_eq_b=%b, a_lt_b=%b", a_gt_b, a_eq_b, a_lt_b);
        
        // And
        s = 3'b011;
        a = 8'b11001100;
        b = 8'b11001101;
        #20;
        $display("AND: %b & %b = %b", a, b, ab_and);
		  
		  // Nhan
        s = 3'b100;
        rst_n = 1'b1;
		  #10 rst_n = 1'b0;
		  #10 rst_n = 1'b1;
		  
		  a = 8'd5;
		  b = 8'd3;
		  
		  @(posedge clk)
			start = 1'b1;
		  @(posedge clk)
			start = 1'b0;
			
		  wait(done == 1'b1);
		  
		  $display("%d x %d = %d",a, b, s_m);
        
        #100;
        $display("=== HOAN THANH KIEM THU TOAN HE THONG ===");
        $stop;
    end

endmodule