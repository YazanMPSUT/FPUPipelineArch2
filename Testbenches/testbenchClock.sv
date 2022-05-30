module testbench();
  wire clk_t;
  CommonClock Common_t(clk_t);
  initial begin  
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor($time,"clock = %d",clk_t);
    $finish;
  end
endmodule

