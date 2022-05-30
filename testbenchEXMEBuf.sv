module testbench();
  
  reg clk_t;
  reg [`DSIZE-1:0] ResultIn_t;
  reg [`ASIZE-1:0] RDAddrIn_t;
                  
  wire [`DSIZE-1:0] ResultOut_t;
  wire [`ASIZE-1:0] RDAddrOut_t;
  
  Buffer_EXME BufEXME_t( clk_t,ResultIn_t,RDAddrIn_t,ResultOut_t,RDAddrOut_t);
  
   always 
begin
clk_t = 1; #5; clk_t = 0; #5; // 10ns period
end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    ResultIn_t = 32'hAFAB0000;
    RDAddrIn_t = 30;
    
     #1
    $display("Result is %b", ResultOut_t);
    $display("Rd Address is %b", RDAddrOut_t);
    $finish;
  end
endmodule

