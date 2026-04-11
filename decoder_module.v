// Ham chon phep tinh
module decoder_module
(
	input [2:0] s,
	output [4:0] d
);

wire [2:0] s_not;

assign s_not = ~s;

// Cong, Tru, So sanh, And
assign d[0] = s_not[2] & s_not[1] & s_not[0];
assign d[1] = s_not[2] & s_not[1] & s[0];
assign d[2] = s_not[2] & s[1] & s_not[0];
assign d[3] = s_not[2] & s[1] & s[0];
assign d[4] = s[2] & s_not[1] & s_not[0];
endmodule