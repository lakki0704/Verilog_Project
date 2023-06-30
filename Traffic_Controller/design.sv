// Code your design here
`timescale 1ns/1ps
module traffic(output MR,output MY, output MG, output SR,output SY,output SG,output ST, input rst, input C, input clk, input TS, input TL );
  
//   timer n1(TS,TL,ST,clk);
  fsm n2(MR,MY,MG,SR,SY,SG,ST,TS,TL,C,rst,clk);
endmodule

`timescale 1ns/1ps
module timer( output TS, output TL, input ST, input clk);
  integer value;
  assign TS=(value>=4);
  assign TL=(value>=14);
  always@(posedge ST or posedge clk)
    begin
      if(ST==1) begin
        value=0;
      end
      else begin
        value= value+1;
      end
    end
endmodule

`timescale 1ns/1ps
module fsm(output MR, output MY, output MG, output SR,output SY,output SG,output ST,input TS, input TL, input C, input rst, input clk);
  reg [6:1] state;
  reg ST;
  parameter MRG = 6'b001100;
  parameter MRY = 6'b010100;
  parameter SRG = 6'b100001;
  parameter SRY = 6'b100010;
  
  assign MR = state[6];
  assign MY = state[5];
  assign MG = state[4];
  assign SR = state[3];
  assign SY = state[2];
  assign SG = state[1];
  
  initial begin 
    state = MRG;
    ST=0;
  end
  always@(posedge clk)
    begin
      if(rst)
        begin 
          state = MRG;
          ST=1;
        end
      else
        begin
          ST=0;
          case(state)
            MRG:
              if(TL&C)
                begin 
                  state = MRY;
                  ST=1;
                end
            MRY:
              if(TS)
                begin
                  state = SRG;
                  ST=1;
                end
            SRG:
              if(TL|!C) 
                begin
                  state = SRY;
                  ST=1;
                end
            SRY:
              if(TS)
                begin
                  state = MRG;
                  ST=1;
                end
          endcase
        end
    end
endmodule

              
    
  



      
  
