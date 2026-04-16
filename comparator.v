// Bo so sanh
module comparator
(
	input [7:0] a, b,
	output a_gt_b, a_lt_b, a_eq_b
);


	// 1. Kiem tra hai so bang nhau bang cong XNOR
	wire [7:0] eq_bits;
	assign eq_bits = a ~^ b;
	
	assign a_eq_b = &eq_bits; // and tung bit trong eq_per_bit
	
	
	// 2. Kiểm tra A > B (Logic: bit trọng số cao nhất khác biệt đầu tiên phải là 1-0)
	// A * ~B = 1 => A = 1, B = 0 => A > B
	assign a_gt_b = (a[7] & ~b[7]) |
                    (eq_bits[7] & a[6] & ~b[6]) |
                    (eq_bits[7] & eq_bits[6] & a[5] & ~b[5]) |
                    (eq_bits[7] & eq_bits[6] & eq_bits[5] & a[4] & ~b[4]) |
                    (eq_bits[7] & eq_bits[6] & eq_bits[5] & eq_bits[4] & a[3] & ~b[3]) |
                    (eq_bits[7] & eq_bits[6] & eq_bits[5] & eq_bits[4] & eq_bits[3] & a[2] & ~b[2]) |
                    (eq_bits[7] & eq_bits[6] & eq_bits[5] & eq_bits[4] & eq_bits[3] & eq_bits[2] & a[1] & ~b[1]) |
                    (eq_bits[7] & eq_bits[6] & eq_bits[5] & eq_bits[4] & eq_bits[3] & eq_bits[2] & eq_bits[1] & a[0] & ~b[0]);
	
	
	// 3. Kiem tra A < B
	assign a_lt_b = ~(a_eq_b | a_gt_b); // Nếu A không lớn hơn B hoặc A không lớn B thì A < B
	
endmodule