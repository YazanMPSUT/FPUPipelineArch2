module testbench();
  reg clk_t;
  reg [`DSIZE-1:0] RLeftIn_t;
  reg [`DSIZE-1:0] RRightIn_t;
  reg [`ASIZE-1:0] RDAddressIn_t;
  reg [3:0] FlagsIn_t;
  
  wire [`DSIZE-1:0] RLeftOut_t;
  wire [`DSIZE-1:0] RRightOut_t;
  wire [`ASIZE-1:0] RDAddressOut_t;
  wire [3:0] FlagsOut_t;
  Buffer_IDEX BufIDEX_t (clk_t,RLeftIn_t,RRightIn_t,RDAddressIn_t,FlagsIn_t,RLeftOut_t,RRightOut_t,RDAddressOut_t,FlagsOut_t);
  
  always 
begin
clk_t = 1; #5; clk_t = 0; #5; 
end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
   
  RLeftIn_t= 32'hAFAB0000 ;
  RRightIn_t=  32'h0000AFAB;
  RDAddressIn_t= 10;
  FlagsIn_t = 4'b0001;
    
    #1
    $display("RL Data is %b", RLeftOut_t);
    $display("RR Data is %b", RRightOut_t);
    $display("RD Address is %b", RDAddressOut_t);
    $display("Addition Flag is %b", FlagsOut_t[0]);
    $display("Subtraction Flag  is %b", FlagsOut_t[1]);
    $display("Multiplication Flag  is %b",FlagsOut_t[2]);
    $display("Division Flag  is %b", FlagsOut_t[3]);
    $finish;
  end
endmodule
