// Bo so sanh
module comparator
(
	input a0, a1, a2, a3, a4, a5, a6, a7, 
	b0, b1, b2, b3, b4, b5, b6, b7,
	output a_gt_b, a_lt_b, a_eq_b
);


	// 1. Kiem tra hai so bang nhau bang cong XNOR
	wire node0, node1, node2, node3, node4, node5, node6, node7;
	xnor (node0, a0, b0);
	xnor (node1, a1, b1);
	xnor (node2, a2, b2);
	xnor (node3, a3, b3);
	xnor (node4, a4, b4);
	xnor (node5, a5, b5);
	xnor (node6, a6, b6);
	xnor (node7, a7, b7);
	
	and (a_eq_b, node0, node1, node2, node3, node4, node5, node6, node7);
	
	
	// 2. Kiem tra A > B
	wire b0_not, b1_not, b2_not, b3_not, b4_not, b5_not, b6_not, b7_not;
	
	not(b0_not, b0);
	not(b1_not, b1);
	not(b2_not, b2);
	not(b3_not, b3);
	not(b4_not, b4);
	not(b5_not, b5);
	not(b6_not, b6);
	not(b7_not, b7);
	
	wire node8, node9, node10, node11, node12, node13, node14, node15;
	and(node8, a7, b7_not); // XNOR: Tra ve 1 neu hai so giong nhau
	and(node9, a6, b6_not, node7);
	and(node10, a5, b5_not, node7, node6);
	and(node11, a4, b4_not, node7, node6, node5);
	and(node12, a3, b3_not, node7, node6, node5, node4);
	and(node13, a2, b2_not, node7, node6, node5, node4, node3);
	and(node14, a1, b1_not, node7, node6, node5, node4, node3, node2);
	and(node15, a0, b0_not, node7, node6, node5, node4,node3, node2, node1);
	
	or (a_gt_b, node8, node9, node10, node11, node12, node13, node14, node15);
	
	
	// 3. Kiem tra A < B
	wire a0_not, a1_not, a2_not, a3_not, a4_not, a5_not, a6_not, a7_not;

	
	not(a0_not, a0);
	not(a1_not, a1);
	not(a2_not, a2);
	not(a3_not, a3);
	not(a4_not, a4);
	not(a5_not, a5);
	not(a6_not, a6);
	not(a7_not, a7);
	
	wire node16, node17, node18, node19, node20, node21, node22, node23;
	and(node16, b7, a7_not); 
	and(node17, b6, a6_not, node7);
	and(node18, b5, a5_not, node7, node6);
	and(node19, b4, a4_not, node7, node6, node5);
	and(node20, b3, a3_not, node7, node6, node5, node4);
	and(node21, b2, a2_not, node7, node6, node5, node4, node3);
	and(node22, b1, a1_not, node7, node6, node5, node4, node3, node2);
	and(node23, b0, a0_not, node7, node6, node5, node4,node3, node2, node1);
	
	or (a_lt_b, node16, node17, node18, node19, node20, node21, node22, node23);
	
endmodule