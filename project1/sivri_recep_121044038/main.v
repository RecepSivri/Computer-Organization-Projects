module main(led[9:0],sw[9:0]);

	input [9:0]sw;
	output [9:0]led;
	wire [3:0]add;
	wire [3:0]sub;
	wire [3:0]exor;
	wire [3:0]andop;
	wire c;	
	andFourBits funct1(andop,sw[3:0],sw[7:4]);
	xorFourBits funct2(exor,sw[3:0],sw[7:4]);
	fullAdder_4bit funct3(add,c,sw[3:0],sw[7:4]);
	substruct_4bit funct4(sub,sw[3:0],sw[7:4]);
	mux_full func5(led[3:0],sw[9:8],add,sub,andop,exor);
endmodule