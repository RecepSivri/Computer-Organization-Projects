module mips_core_testbench (result, input_instruction, rs_content, rt_content);
	output reg [31:0] result;
	reg signed[31:0] result2;
	input [31:0] input_instruction;
	input [31:0] rs_content;
	input [31:0] rt_content;
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
	
	always @(opcode)
	begin
	
if(opcode==0)
begin
		rs=input_instruction[25:21];
		$display("rs=%b",rs);
		rt=input_instruction[20:16];
		$display("rt=%b",rt);
		rd=input_instruction[15:11];
		$display("rd=%b",rd);
		shamdt=input_instruction[10:6];
		$display("shamdt=%b",shamdt);
		funct=input_instruction[5:0];
		$display("funct=%b",funct);
	case (funct)
			32:begin
				$display("add");
				$display("%h\n",rs_content);
				$display("%h\n",rt_content);
				result=rs_content+rt_content;		
				end
			34:begin
			$display("sub");
				$display("rs%h\n",rs_content);
				$display("rt%h\n",rt_content);
				result=rs_content-rt_content;	
				end
			36:begin
			$display("and");
				$display("%b\n",rs_content);
				$display("%b\n",rt_content);
				result=rs_content&rt_content;	
				end
			37:begin
				$display("or");
				$display("%b\n",rs_content);
				$display("%b\n",rt_content);
				result=rs_content|rt_content;	
				end
			2:begin
				$display("srl");
				$display("%d\n",rt);
				$display("content:%d\n",rs_content);
				$display("content:%b\n",rt_content);
				result=$signed(rt_content) >>> shamdt;
				end
			0:begin
				$display("sll");
				$display("%b\n",rt_content);
				result=rt_content << shamdt;
				end
			43:begin
				$display("sltu");
				unsignedresult1=rs_content;
				unsignedresult2=rt_content;
				$display("content of rs =%h", rs_content);
				$display("content of rt =%h", rt_content);
				if(unsignedresult1<unsignedresult2)
					result=1;
					else
					result=0;
				end
					
			3:begin
				$display("sra");
				$display("%d\n",rt);
				$display("content:%d\n",rs_content);
				$display("content:%b\n",rt_content);
				result=rt_content>>shamdt;
				end
	endcase
end
if(opcode != 0)
begin		
		rs=input_instruction[25:21];
		$display("rs=%b",rs);
		rt=input_instruction[20:16];
		$display("rt=%b",rt);
		immediate=input_instruction[15:0];
		$display("immediate=%h",immediate);
	 case (opcode)
			8:begin 
			$display("addi");
			$display("content of rs=%h",rs_content);
			result=rs_content+{{16{immediate[15]}}, immediate };
			
			end
			9:begin
			$display("addiu");
			unsignedElem=rs_content;
			unsignedElem2={{16{immediate[15]}}, immediate };
			result=unsignedElem+unsignedElem2;
			end
			13:begin
			$display("ori");
				$display("content of rs: %b",rs_content);
				$display("immediate: %b",{{16{immediate[15]}}, immediate });
				result=rs_content|{{16{immediate[15]}}, immediate };
			end
			12:begin
				$display("andi");
				$display("content of rs: %b",rs_content);
				$display("immediate: %b",{{16{immediate[15]}}, immediate });
				result=rs_content&{{16{immediate[15]}}, immediate };
			end
			10:begin
			$display("slti");
			$display("content of rs: %b",rs_content);
			$display("immediate: %b",{{16{immediate[15]}}, immediate });
				if(rs_content<{{16{immediate[15]}}, immediate })
					result=1;
				else
					result=0;
			end
			15:begin
				$display("lui");
				$display("immediate: %b",{{16{immediate[15]}}, immediate });
			 result={{16{immediate[15]}}, immediate }<<16;
				end
	 endcase	 
end
end
		
 
endmodule