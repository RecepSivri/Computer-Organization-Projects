module substruct_4bit(dif[3:0],a[3:0],b[3:0]);

	output [3:0]dif;
	input [3:0]a;
	input [3:0]b;
	
	wire [3:0]r;
	wire [3:0]d;
	wire q,w,e,c,g,h,j,k,l;
	xor q0(d[0],b[0],1);
	xor q1(d[1],b[1],1);
	xor q2(d[2],b[2],1);
	xor q3(d[3],b[3],1);
	
	
	fullAdder qwe(r[0],q,1,d[0],0);
	fullAdder qwe2(r[1],w,0,d[1],q);
	fullAdder qwe3(r[2],e,0,d[2],w);
	fullAdder qwe4(r[3],c,0,d[3],e);
	
	fullAdder asd(dif[0],g,a[0],r[0],0);
	fullAdder asd2(dif[1],h,a[1],r[1],g);
	fullAdder asd3(dif[2],k,a[2],r[2],h);
	fullAdder asd4(dif[3],l,a[3],r[3],k);
	
endmodule