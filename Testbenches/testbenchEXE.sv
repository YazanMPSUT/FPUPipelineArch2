module EXETB();
  
  reg clk_t;
  wire [31:0]Res_t;
  reg [31:0]numberA_t;
  reg [31:0]numberB_t;
  integer a;
  reg[3:0] Flags;
    EXE e(Res_t,clk_t,numberA_t,numberB_t,Flags);
 
  always
begin
clk_t = 1; #5; clk_t = 0; #5; // 10ns period
end
 
 
  initial 
    
    begin
      $dumpfile("dump.vcd");
    $dumpvars(1);
  //Left Operand is 0.5
   numberA_t =32'b00111111000000000000000000000000;
    //Right Operand is 0.25
      numberB_t = 32'b00111110100000000000000000000000; 
    
      Flags = 4'b0001;
      
    $display("A= %b",numberA_t);
    $display("B= %b",numberB_t);
     
    #5
    $display("Addition Flag is %b", Flags[0]);
    $display("Subtraction Flag  is %b", Flags[1]);
    $display("Multiplication Flag  is %b",Flags[2]);
    $display("Division Flag  is %b", Flags[3]);
    #5
   
      $monitor("output=%b\n", Res_t);

    Flags = 4'b0010;
    
    #5
    $display("Addition Flag is %b", Flags[0]);
    $display("Subtraction Flag  is %b", Flags[1]);
    $display("Multiplication Flag  is %b",Flags[2]);
    $display("Division Flag  is %b", Flags[3]);
    #10
      
     Flags = 4'b0100;
      //$display("output=%b", Res_t);
    #10
    $display("Addition Flag is %b", Flags[0]);
    $display("Subtraction Flag  is %b", Flags[1]);
    $display("Multiplication Flag  is %b",Flags[2]);
    $display("Division Flag  is %b", Flags[3]);
     #10
           Flags = 4'b1000;
      //$display("output=%b", Res_t);
    #10
    $display("Addition Flag is %b", Flags[0]);
    $display("Subtraction Flag  is %b", Flags[1]);
    $display("Multiplication Flag  is %b",Flags[2]);
    $display("Division Flag  is %b", Flags[3]);
     #5
      
      
    $finish;
      
    end

  endmodule