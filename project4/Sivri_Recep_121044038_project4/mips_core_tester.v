module project4(a);
    input a;
    reg [7:0] dataMem[0:2047];
    reg [7:0] instructorMem[0:1023];
    reg [31:0] instructionRegister;
    wire [31:0] instructor;
    reg [31:0] registerFile[0:31];
    reg [5:0]opcode;
    reg [4:0]rs;
    reg [4:0]rt;
    reg [4:0]rd;
    reg[31:0]data;
    reg [31:0]data2=0;
    reg [4:0]shamdt;
    reg [5:0]funct;
    reg[1:0]write=0;
    reg [31:0]rs_content;
    reg [31:0]rt_content;
    reg signed [31:0]counter=-4;
    reg [31:0]b=0;
    reg [31:0]instruction;
    wire [31:0]result;
    initial
    begin
     $readmemh("dataMem.h", dataMem);
    end
    initial
    begin
     $readmemh("instructorMem.h", instructorMem);
    end
  initial
  begin
        registerFile[0]=0;  
 end
  always@(counter)
  begin  
      if(b<1024)
        begin
          b=counter+4;
        end
        if(counter>0)
          begin
        $display("PC=====%d",counter);
        end
      instructionRegister[31:24]=instructorMem[counter];
      instructionRegister[23:16]=instructorMem[counter+1];
      instructionRegister[15:8]=instructorMem[counter+2];
      instructionRegister[7:0]=instructorMem[counter+3];
      
  end
  
  always@(b)
  begin
    rs=instructionRegister[25:21];
      rt=instructionRegister[20:16];
      rt_content=registerFile[rt];
      rs_content=registerFile[rs];
  end
    
    AluModule try(b,instructor,result, instructionRegister, rs_content, rt_content);
    
   always@(b)
    begin
          
          if(instructor[31:26]==35)
            begin
          data[31:24]=dataMem[result];
          data[23:16]=dataMem[result+1];
          data[15:8]=dataMem[result+2];
          data[7:0]=dataMem[result+3];
          rt=instructor[20:16];
          registerFile[rt]=data;
          $display("%h",registerFile[rt]);
          end
          if(instructor[31:26]==43)
            begin
          rt=instructor[20:16];
          dataMem[result]=registerFile[rt][31:24];
          dataMem[result+1]=registerFile[rt][23:16];
          dataMem[result+2]=registerFile[rt][15:8];
          dataMem[result+3]=registerFile[rt][7:0];
          $display("%h   %h   %h   %h",dataMem[result],dataMem[result+1],dataMem[result+2],dataMem[result+3]);
          end
          if(instructor[31:26]==0)
            begin
              rs=instructor[25:21];
              rt=instructor[20:16];
              rd=instructor[15:11];
              registerFile[rd]=result;
              $display("result=%d,rt=%d,rs=%d,rd=%d",result,rt,rs,rd);
            end
            if(instructor[31:26]!=0&&instructor[31:26]!=2&&instructor[31:26]!=3)
            begin
              rs=instructor[25:21];
              rt=instructor[20:16];
              rd=instructor[15:11];
              registerFile[rt]=result;
              $display("result=%d,rt=%d,rs=%d",result,rt,rs);
            end
          if(instructor[31:26]==40)
            begin
          rt=instructor[20:16];
          dataMem[result]=registerFile[rt][31:24];
          $display("%h  ",dataMem[result]);
          end
          if(instructor[31:26]==41)
            begin
          rt=instructor[20:16];
          dataMem[result]=registerFile[rt][31:24];
          dataMem[result+1]=registerFile[rt][23:16];
          $display("%h  %h",dataMem[result],dataMem[result]);
          end
          if(instructor[31:26]==32)
            begin
          rt=instructor[20:16];
          registerFile[rt]=0;
          registerFile[rt][7:0]=dataMem[result];
          $display("%h  ",registerFile[rt]);
          end
          if(instructor[31:26]==2)
            begin
          data2=instructor[25:0]<<2;
          end
          if(registerFile[31]!=31)
            begin
              b=registerFile[31];
              registerFile[31]=31;
            end
          if(instructor[31:26]==3)
            begin
          $display("adress =>%b",instructor[25:0]<<2);
          registerFile[31]=b;
          b=instructor[25:0]<<2+4;
          end
          if(instructor[31:26]==0&&instructor[5:0]==8)
            begin
              counter=result-4;
          end
          if(instructor[31:26]==5)
            begin
              if(result==1)
            begin
              b=b+instructor[15:0]<<2;
              b=b+4;
            end
            end
          if(instructor[31:26]==4)
          begin
            if(result==1)
            begin
              $display("atlama=%b",instructor[15:0]<<2);
              b=b+instructor[15:0]<<2;
              b=b+4;
            end
          end
    end
    
   always@(data2)
    begin
        counter=counter+data2;
    end
  always@(b)
  begin
      if(counter< 1024)
        begin
        counter=b;
        end
      if(counter>=1024)
        begin
        write=1;  
        end
      
  end  
 always@(write)
    begin
     $writememh("dataMem.h", dataMem);
    end
endmodule

