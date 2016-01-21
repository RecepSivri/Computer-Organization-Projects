module xorFourBits(res[3:0],a[3:0],b[3:0]);

	input [3:0]a;
	input[3:0]b;
	output [3:0]res;

	xor r0(res[0],a[0],b[0]);
	xor r1(res[1],a[1],b[1]);
	xor r2(res[2],a[2],b[2]);
	xor r3(res[3],a[3],b[3]);
endmodule