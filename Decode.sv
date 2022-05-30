`define ISIZE 17
module Decode( Inst,
               RL,
               RR,
               RD, 
               Op); 
  input[`ISIZE-1:0] Inst;
  output reg[4:0] RL,RR, RD; 
  output reg[1:0] Op;
  
  always @(Inst) begin 
    //TODO: try ASSIGN if not working correctly
    assign RL = Inst[`ISIZE-1:12];
  	assign RR = Inst[11:7];
  	assign RD = Inst[6:2];
  	assign Op = Inst[1:0];
  end
  
endmodule
