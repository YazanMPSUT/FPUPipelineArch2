`define ISIZE 17
module Buffer_IFID(input clk,
                   input [`ISIZE-1:0] InstructionIn,
                   output reg [`ISIZE-1:0] InstructionOut);
 
  always@(posedge clk) 
    begin
      InstructionOut = InstructionIn;
    end
  
endmodule
