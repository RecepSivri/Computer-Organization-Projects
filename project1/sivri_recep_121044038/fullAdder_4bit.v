module fullAdder_4bit(res[3:0],c,a[3:0],b[3:0]);

	input [3:0]a;
	input [3:0]b;
	output [3:0]res;
	output c;
	wire q,w,e;
	fullAdder q1(res[0],q,a[0],b[0],0);
	fullAdder q2(res[1],w,a[1],b[1],q);
	fullAdder q3(res[2],e,a[2],b[2],w);
	fullAdder q4(res[3],c,a[3],b[3],e);
endmodule