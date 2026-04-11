`timescale 1ns/1ps

module tb_main_module();

    reg clk, rst_n, start;
    reg [2:0] s;
    reg [7:0] a, b;

    wire [7:0] s_as;
    wire carry_as, a_gt_b, a_lt_b, a_eq_b;
    wire [7:0] ab_and;
    wire [15:0] s_m;
    wire done;

    main_module uut (
        .clk(clk), .rst_n(rst_n), .start(start),
        .s(s), .a(a), .b(b),
        .s_as(s_as), .carry_as(carry_as),
        .a_gt_b(a_gt_b), .a_lt_b(a_lt_b), .a_eq_b(a_eq_b),
        .ab_and(ab_and), .s_m(s_m), .done(done)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0; rst_n = 0; start = 0;
        a = 0; b = 0; s = 0;
        #25 rst_n = 1; 
        #10;

        a = 8'd100; b = 8'd50; s = 3'b000;
        #40;

        a = 8'd100; b = 8'd30; s = 3'b001;
        #40;

        a = 8'd50; b = 8'd80; s = 3'b010;
        #40;

        a = 8'hAA; b = 8'hF0; s = 3'b011;
        #40;

        a = 8'd15; b = 8'd4; s = 3'b100;
        #20;
        start = 1; #20 start = 0; 
        wait(done == 1);          
        #40;

        a = 8'd20; b = 8'd10;
        #20;
        start = 1; #20 start = 0;
        wait(done == 1);
        #100;

        $stop;
    end

endmodule