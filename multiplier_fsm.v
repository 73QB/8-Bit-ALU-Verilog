module multiplier_fsm

#(
	parameter N = 8
)
(
	input clk,
	input rst_n,
	input start,
	input[N - 1:0] a, b,
	output reg [2*N - 1:0] res,
	output reg done
);

	parameter IDLE = 2'b00, CALC = 2'b01, DONE = 2'b10;
	
	reg [1:0] current_state, next_state;
	
	// Số vòng lặp dựa vào số bit truyền vào
	reg [$clog2(N):0] count;
	
	reg [N - 1:0] A, Q, M;
	
	// Biến sum[N] chứa giá trị carry_out trong phép cộng
	wire [N:0] sum;

	assign sum = A + M;
	
	
	// Khối 1: Trái tim tuần tự
	always @(posedge clk or negedge rst_n)
	begin
		if (!rst_n)
		// Nếu nhấn nút restart => Reset về trạng thái ban đầu luôn
		begin
			current_state <= IDLE;
		end
		else
		begin
			current_state <= next_state;
		end
	end
	
	
	// Khối 2: Định tuyến
	always @(*)
	begin
		case (current_state)
			IDLE:
			begin
				if (start)
					next_state = CALC;
				else
					next_state = IDLE;
			end
			
			CALC:
			begin
				if (count == N)
					next_state = DONE;
				else
					next_state = CALC;
			end
			
			// Nếu đã xong thì tự động chuyển về IDLE
			DONE: next_state = IDLE;
			
			// Nếu bị lỗi thì tự động chuyển về IDLE
			// Phòng hờ trường hợp 2'b11 cái mà chưa chứa giá trị gì
			default: next_state = IDLE;
		
		endcase
	end
	
	
	// Khối 3: 
	always @(posedge clk or negedge rst_n)
	begin
		// Khi nhan nut reset => Ep moi thu ve 0
		if (!rst_n)
		begin
			done <= 1'b0;
			res <= 0;
			A <= 0;
			Q <= 0;
			M <= 0;
			count <= 0;
		end
		
		else
		begin
			case (current_state)
				IDLE:
				begin
				// Đang ở phòng chờ thì tắt cờ hoàn thành
					done <= 1'b0;
						
				// Khi nhấn nút start, nạp các giá trị ban đầu
					if (start)
					begin
						A <= 0;
						Q <= b;
						M <= a;
						count <= 0;
					end
				end
				
				
				CALC:
				begin
				
					if (count < N)
					begin
						if (Q[0] == 1'b1)
						begin
							A <= {sum[N], sum[N-1:1]};
							Q <= {sum[0], Q[N-1:1]};
						end
						
						else
						begin
							A <= {1'b0, A[N-1:1]};
							Q <= {A[0], Q[N-1:1]};
						end
					end
					count <= count + 1'b1;
				end
				
				DONE:
				begin
					// Lúc này cờ done đang bật, khi chuyển qua IDLE phải có lệnh tắt cờ
					done <= 1'b1;
					res <= {A, Q};
				end
			endcase
		end
	end
endmodule