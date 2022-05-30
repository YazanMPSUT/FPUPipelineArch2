module testbenchIPAdder;
  reg clk_t;
  reg[31:0] OldCtr_t;
  wire[31:0] NewCtr_t;
  
  IPAdder Add(clk_t,OldCtr_t,NewCtr_t);
  
  always
    begin
    	clk_t = ~clk_t; #5;
    end
  
  
  initial
    begin
      $dumpfile("dump.vcd");
    $dumpvars(1);
      clk_t = 0;
      OldCtr_t = 0;
      $monitor("newctr value %b", NewCtr_t);
      #20;
      $finish;
    end
  
  endmodule

