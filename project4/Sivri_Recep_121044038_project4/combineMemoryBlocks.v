module combineMemoryBlocks(instruction,block1,block2,block3,block4);


	input [7:0]block1;
	input [7:0]block2;
	input [7:0]block3;
	input [7:0]block4;
	output reg [31:0] instruction;
	always@(block1,block2,block3,block4)
	begin
	instruction[31:24]=block1;
	instruction[23:16]=block2;
	instruction[15:8]=block3;
	instruction[7:0]=block4;
	$display("%h",instruction);
	end






endmodule