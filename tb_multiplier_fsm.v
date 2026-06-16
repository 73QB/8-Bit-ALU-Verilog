`timescale 1ns / 1ps
module tb_multiplier_fsm();

	// Khối 0: Chuẩn bị data

	parameter N = 8;
	reg clk;
	reg rst_n;
	reg start;
	reg [N - 1:0] a, b;
	
	
	wire [2*N - 1:0] res;
	wire done;
	
	// DUT: instant name: Devices Under Test
	multiplier_fsm #(.N(N)) DUT
	(
		.clk(clk),
		.rst_n(rst_n),
		.start(start),
		.a(a),
		.b(b),
		.res(res),
		.done(done)
	);
	
	// Khối 1: Tạo xung clock đập liên tục
	initial begin
		clk = 0;
		// Tạo nhân tạo tần số cho test
		// #5 là thời gian sóng đổi giá trị, hay là nửa chu kì
		// Tùy vào loại board thì giá trị này khác nhau
		forever #5 clk = ~clk;
	end
	
	
	// Khối 2: Kịch bản thử nghiệm
	initial begin
		rst_n = 1'b1;
		start = 1'b0;
		a = 0; b = 0;
		
		// Đợi 10s rồi làm
		#10 rst_n = 1'b0;
		// Đợi 20s
		#10 rst_n = 1'b1;
		// Đợi 30s cho ổn định
		#10;
		
		
		// Test case 1: 
		$display("=== BAT DAU TEST CASE 1 ===");
		a = 8'd15; // Nạp số bị nhân
		b = 8'd10; // Nạp số nhân
		
		// Tạo nút Start bằng một chu kì xung
		@(posedge clk);
		start = 1'b1;
		@(posedge clk);
		start = 1'b0;
		
		// Tính toán cho đến khi done = 1
		wait(done == 1'b1);
		
		$display("Thoi gian: %0t | a = %d, b = %d | Ket qua res = %d", $time, a, b, res);
		#20; // Chờ mạch ổn định
		
		// TEST CASE 2: Tính 255 x 255 = 65025
		$display("=== BAT DAU TEST CASE 2 ===");
		a = 8'd255; 
		b = 8'd255; 

		// Bấm nút Start
		@(posedge clk); 
		start = 1'b1;
		@(posedge clk);
		start = 1'b0;

		// Đứng chờ tính xong
		wait(done == 1'b1);
		$display("Thoi gian: %0t | a = %d, b = %d | Ket qua res = %d", $time, a, b, res);
	
		#50;
		$display("=== HOAN THANH MO PHONG ===");
		$stop;
	end
endmodule