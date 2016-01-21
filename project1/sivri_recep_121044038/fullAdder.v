module fullAdder(s,c,a,b,d);

	input a,b,d;
	output s,c;
	wire n,m,o;
	xor q1(n,a,b);
	and q2(m,a,b);
	xor q3(s,n,d);
	and q4(o,n,d);
	or q5(c,o,m);
endmodule