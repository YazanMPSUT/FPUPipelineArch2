module testbenchFetch();

  reg[`MSIZE-1:0] IP_t;
  wire[`ISIZE-1:0] Inst_t;
  IMemory IM_t(IP_t,Inst_t);
  
  initial
    begin
      $dumpfile("dump.vcd");
    $dumpvars(1);
      IP_t = 4;
      #1
      $monitor("Instruction = %b",Inst_t);
      $finish;
    end
  
endmodule
