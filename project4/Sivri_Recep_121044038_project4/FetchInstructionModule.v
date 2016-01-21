module FetchInstructionModule(counter,instruction,rs,rt,opcode);

output  reg [5:0]opcode;
output  reg [4:0]rs;
output  reg [4:0]rt;
input [31:0]instruction;
reg [31:0]instruction2;
input [31:0]counter;
always@(counter)
begin
      if(counter>0)
        begin
          
	       opcode=instruction[31:26]; 
	       rs=instruction[25:21];
	       rt=instruction[20:16]; 
	      end
end

endmodule