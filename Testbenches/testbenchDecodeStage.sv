module testbenchDecodeStage();

  reg[`ISIZE-1:0] inst_t;
  wire clk_t;
  
  wire[`DSIZE-1:0] RLOut_t;
  wire[`DSIZE-1:0] RROut_t;
  wire[`ASIZE-1:0] RDAddrOut_t;
  
  wire[3:0] Flags_t;
  
  DecodeStage DS_t(clk_t,inst_t,RLOut_t,RROut_t,RDAddrOut_t,Flags_t);
  CommonClock CC(clk_t);

  
   initial begin
     $dumpfile("dump.vcd");
    $dumpvars(1);
    //inst_t = `ISIZE'b01010 00110 00100 00;
    inst_t = `ISIZE'b01010001100010000;
    #10
     $display("instruction is %b", inst_t);
     $display("Rt_Data is %d", RLOut_t);
     $display("Rs_Data is %d", RROut_t);
     $display("Rd_Address is %b", RDAddrOut_t);
     
     $display("Addition Flag is %b", Flags_t[0]);
     $display("Subtraction Flag is %b", Flags_t[1]);
     $display("Multiplication Flag is %b", Flags_t[2]);
     $display("Division Flag is %b", Flags_t[3]);
 
     $finish;
  end
  
endmodule
