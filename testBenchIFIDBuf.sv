module testbenchIFIDBuf();
 
  reg clk;
  reg[`ISIZE-1:0] InstIn;
  wire[`ISIZE-1:0] InstOut;
  Buffer_IFID ifidbuf(clk,InstIn,InstOut);
  
  always 
    begin
      clk = ~clk;
      #5;

    end
  
  initial
    begin
     $dumpfile("dump.vcd");
    $dumpvars(1);
      clk = 0;
      InstIn = `ISIZE'b0111001100000000111;
      $display("Instruction is %b", InstOut);
      #6
      $display("Instruction is %b",InstOut);
      $finish;
    end
  
endmodule