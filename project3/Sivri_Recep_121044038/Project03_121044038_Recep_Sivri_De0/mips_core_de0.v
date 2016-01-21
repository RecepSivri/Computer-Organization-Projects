module mips_core_de0 (result, input_instruction);
	output reg [31:0] result;
	input [31:0] input_instruction;
	reg [31:0] input_instruction2;
	reg [31:0] registers [0:31];
	reg signed[31:0] result2;
	reg [31:0] rs_content;
	reg [31:0] rt_content;
	reg [31:0]unsignedresult1;
	reg [31:0]unsignedresult2;
	reg[31:0]unsignedElem;
	reg[31:0]unsignedElem2;
	reg [4:0]rs;
	reg [4:0]rt;
	reg [4:0]rd;
	reg [4:0]shamdt;
	wire [5:0]opcode;
	reg [5:0]funct;
	reg [15:0]immediate;
	assign opcode=input_instruction[31:26];
	initial 
	begin
	registers [0]=12;
	registers [1]=13;
	registers [2]=14;
	registers [3]=15;
	registers [4]=16;
	registers [5]=17;
	registers [6]=18;
	registers [7]=19;
	registers [8]=20;
	registers [9]=21;
	registers [10]=22;
	registers [11]=23;
	registers [12]=24;
	registers [13]=25;
	registers [14]=26;
	registers [15]=27;
	registers [16]=28;
	registers [17]=29;
	registers [18]=30;
	registers [19]=31;
	registers [20]=32;
	registers [21]=33;
	registers [22]=34;
	registers [23]=35;
	registers [24]=36;
	registers [25]=37;
	registers [26]=38;
	registers [27]=39;
	registers [28]=40;
	registers [29]=41;
	registers [30]=42;
	registers [31]=43;
	end
	
	always @(opcode)
	begin	
	input_instruction2=input_instruction;
if(opcode==0)
begin
	
		rs=input_instruction2[25:21];
		rt=input_instruction2[20:16];
		rd=input_instruction2[15:11];
		shamdt=input_instruction2[10:6];
		funct=input_instruction2[5:0];
		rs_content=registers[rs];
		rt_content=registers[rt];	
	case (funct)
			32:begin
				result=rs_content+rt_content;		
				registers[rd]=result;
				end
			34:begin
				result=rs_content-rt_content;	
				registers[rd]=result;
				end
			36:begin
				result=rs_content&rt_content;	
				registers[rd]=result;
				end
			37:begin
				result=rs_content|rt_content;	
				registers[rd]=result;
				end
			2:begin
				result=$signed(rt_content) >>> shamdt;
				registers[rd]=result;
				end
			0:begin
				result=rt_content << shamdt;
				registers[rd]=result;
				end
			43:begin
				unsignedresult1=rs_content;
				unsignedresult2=rt_content;
				if(unsignedresult1<unsignedresult2)
					result=1;
					else
					result=0;
				registers[rd]=result;
				end
					
			3:begin
				result=rt_content>>shamdt;
				registers[rd]=result;
				end
	endcase
end
if(opcode != 0)
begin		
		rs=input_instruction2[25:21];
		rt=input_instruction2[20:16];
		immediate=input_instruction2[15:0];
		rs_content=registers[rs];
	 case (opcode)
			8:begin 
			result=rs_content+{{16{immediate[15]}}, immediate };
			registers[rt]=result;
			end
			9:begin
			unsignedElem=rs_content;
			unsignedElem2={{16{immediate[15]}}, immediate };
			result=unsignedElem+unsignedElem2;
			registers[rt]=result;
			end
			13:begin
				result=rs_content|{{16{immediate[15]}}, immediate };
				registers[rt]=result;
			end
			12:begin
				result=rs_content&{{16{immediate[15]}}, immediate };
				registers[rt]=result;
			end
			10:begin
				if(rs_content<{{16{immediate[15]}}, immediate })
					result=1;
				else
					result=0;
			registers[rt]=result;
			end
			15:begin
			 result={{16{immediate[15]}}, immediate }<<16;
			 registers[rt]=result;
				end
	 endcase	 
end
end

endmodule