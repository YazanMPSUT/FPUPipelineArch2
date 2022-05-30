module testbenchIMem();
  
  wire [`ISIZE-1:0] Instruction_t;
  reg [31:0] PC_t;
  
  IMemory test_IM(PC_t,Instruction_t);
  
   initial begin 
  $dumpfile("dump.vcd");
    $dumpvars(1);
   PC_t = 32'h00000000;
    #1
    PC_t = PC_t + 4;
     $display("instruction is %b", Instruction_t);
         #1
    PC_t = PC_t + 4;
     $display("instruction is %b", Instruction_t);
         #1
    PC_t = PC_t + 4;
     $display("instruction is %b", Instruction_t);
         #1
    PC_t = PC_t + 4;
     $display("instruction is %b", Instruction_t);
         #1
    PC_t = PC_t + 4;
     $display("instruction is %b", Instruction_t);
         #1
    PC_t = PC_t + 4;
     $display("instruction is %b", Instruction_t);
         #1
    PC_t = PC_t + 4;
     $display("instruction is %b", Instruction_t);
         #1
    PC_t = PC_t + 4;
     $display("instruction is %b", Instruction_t);
     $finish;
  end
        endmodule