module IPAdder(Clk,OldCtr, NewCtr);
  input Clk;
  input[31:0] OldCtr;
  output reg[31:0] NewCtr;
  
  initial
    NewCtr = 0;
  	
  always @(Clk) begin 
    NewCtr = NewCtr + 2; //edit: For some reason +4 at posedge doesnt' work
    end
    
  endmodule