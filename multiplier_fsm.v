module multiplier_fsm(
    input clk, rst_n, start,
    input [7:0] a, b,
    output reg [15:0] res,
    output reg done
);
    parameter IDLE = 2'b00, CALC = 2'b01, DONE = 2'b10;
    reg [1:0] state;
    reg [3:0] count;

    reg C;          // Thanh ghi C (1 bit) chứa cờ nhớ
    reg [7:0] A;    // Thanh ghi A (8 bit) chứa tổng 
    reg [7:0] Q;    // Thanh ghi Q (8 bit) chứa số nhân
    reg [7:0] M;    // Thanh ghi M (8 bit) chứa số bị nhân

    // Khai báo dây sum 9-bit. Phép cộng A + M nếu tràn sẽ lòi ra bit thứ 9 (sum[8])
    wire [8:0] sum;
    assign sum = A + M; 

    always @(posedge clk or negedge rst_n) 
	 begin
        if (!rst_n) 
		  begin
            state <= IDLE;
            done <= 0;
            res <= 0;
            count <= 0;
            C <= 0; A <= 0; Q <= 0; M <= 0; // Reset sạch sẽ
        end
		  
        else 
		  begin
            case (state)
                
					 IDLE: 
					 begin
                    done <= 0;
                    if (start) 
						  begin
                        C <= 1'b0;
                        A <= 8'b0;
                        Q <= b;     // Nạp số nhân vào Q
                        M <= a;     // Nạp số bị nhân vào M
                        count <= 0;
								
								// Thiết lập chế dộ tiếp theo cho hệ thống
                        state <= CALC;
                    end
                end

					 
					 
                CALC: 
					 begin
					 
						  // Xét hết Q mới thoát lặp
                    if (count < 8) 
						  begin
						  
                        if (Q[0] == 1'b1) 
								begin 
									 // Sau khi thực hiện phép cộng trên sum
									 // Dịch bit nhớ qua phải
                            C <= 1'b0;               
                            
									 
                            // Bit nhớ lúc này là MSB của A
                            A <= {sum[8], sum[7:1]}; 
                            
                            
									 // Bit LSB của sum bây giờ MSB của Q, bỏ LSB của Q
                            Q <= {sum[0], Q[7:1]};   
                        end 
								
								
								
								// Trường hợp Q[0] = 1'b0: Chỉ dịch, không cộng
                        else 
								begin
                            
                            C <= 1'b0;               
                            A <= {C, A[7:1]};        
                            Q <= {A[0], Q[7:1]};     
                        end
                        
                        count <= count + 1;
                    end
						  
						  // Khi lặp xong hết 8 vòng thì đặt trước trạng thái là done
                    else 
						  begin
                        state <= DONE;
                    end
                end

					 
                DONE: 
					 begin
						  // đèn báo done đặt lên 1
                    done <= 1;
						  
						  
                    // Kết quả 16-bit: Ghép thanh ghi A và Q lại với nhau
                    res <= {A, Q};
						  
						  
						  // Đưa bộ tính toán về trạng thái ban đầu, lúc này done = 0
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule