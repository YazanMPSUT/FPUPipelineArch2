`define ADD 0 
`define SUB 1
`define MUL 2
`define DIV 3
module SetFlags( input[1:0] Op,      
                output reg [3:0] Flags);
  always@(Op)
    begin
      Flags = 4'b0000;
      if(Op == `ADD)
        Flags[`ADD] = 1;
      else if(Op == `SUB)
        Flags[`SUB] = 1;
      else if(Op == `MUL)
        Flags[`MUL] = 1;
      else if(Op == `DIV)
        Flags[`DIV] = 1;
    end
endmodule