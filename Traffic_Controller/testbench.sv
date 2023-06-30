`timescale 1ns/1ps
module test;
  reg TS;
  reg TL;
  reg C;
  reg rst;
  reg clk;
  
  wire MR, MY, MG, SR, SY, SG, ST;
  
  traffic uut(.MR(MR),.MY(MY), .MG(MG), .SR(SR), .SY(SY), .SG(SG), .ST(ST),.rst(rst), .C(C), .clk(clk), .TS(TS), .TL(TL));
  initial 
    begin
      $dumpfile ("design.vcd");
      $dumpvars(0, test);
      TS=0; TL=0; C=0; rst =1;
      clk =0;
      #100 TS=0; TL=1; C=1; rst =0;
      #100 TS=0; TL=0; C=0; rst =1;
      #100 TS=1; TL=1; C=0; rst =0;
      #100 TS=1; TL=0; C=1; rst=0;
      $finish;
    end
  always
    begin
      #100
      clk = ~clk;
    end
endmodule

  
