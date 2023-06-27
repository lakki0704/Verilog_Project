// Code your testbench here
// or browse Examples
module vending_machine_tb; 
//inputs
reg clk;
reg[1:0] in;
reg rst;
  
//output
wire out;
wire [1:0] change;
vending_machine uut (
.clk (clk),
.rst (rst),
.in (in),
.out (out),
.change (change)
);
  
initial begin
//initialise inputs
  $dumpfile ("design.vcd");
  $dumpvars(0, vending_machine_tb);
rst = 1;
clk = 0;
  
#6 rst = 0;
in = 2'b01;
#11 in = 2'b01;
#16 in= 2'b01;
#25 $finish;
end
  always #5 clk=~clk;
endmodule