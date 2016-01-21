module mips_core_tester(a);
	input a;
	parameter bit_size=32;
	parameter elem_size=32;
	reg [31:0] inInst;
	reg [4:0] rt;
	reg  [4:0] rs;
	reg  [4:0] rd;
	wire [31:0] result;
	reg [31:0] contentRs;
	reg [31:0] contentRt;
	reg [5:0] opcode;
	reg signed [bit_size-1:0] registerfile[elem_size-1:0];
	integer i;
	initial
	begin
	 $readmemh("registers.h", registerfile);
	end
	initial
	begin
	 inInst=32'b00110000000000000111000010100100;
	 rs=inInst[25:21];
	 rt=inInst[20:16];
	 opcode=inInst[31:26];
	 contentRs=registerfile[rs];
	 contentRt=registerfile[rt];
	end
	
	initial 
	begin
		
			for(i=0;i<32;i=i+1)
			$display("%d   %h",i,registerfile[i]);
	end
	
	mips_core_testbench asd(result,inInst,contentRs, contentRt);
	
	
	always@(result )
	begin	
		if(opcode==0)
		begin
				rd=inInst[15:11];
				registerfile[rd]=result;
				$monitor("resultin test files=%b",registerfile[rd]);
		end
		if(opcode!=0)
		begin
			registerfile[rt]=result;
			$monitor("resultin test files=%b\n%h",registerfile[rt],registerfile[rt]);
		end
	
	 
	  $writememh("registers.h", registerfile);
	end
	
	
endmodule


