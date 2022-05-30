module muxtest();
  wire [`DSIZE-1:0] Output_t;
  reg [`DSIZE-1:0] Input_0t,Input_1t;
  
  reg Select_t;
  multiplexer m(Input_0t,Input_1t,Select_t,Output_t);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    Select_t=1;
    Input_0t=1;
    Input_1t=2;
    #5
    #5
    $display("select signal=%b",Select_t);
    $display("input 0=%b",Input_0t);
    $display("input 1=%b",Input_1t);
    $display("output=%b",Output_t);
    $finish;
  end
endmodule