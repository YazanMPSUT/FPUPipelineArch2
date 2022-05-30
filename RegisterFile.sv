module RegisterFile(input clk,
                    input [4:0] RL,
                    input [4:0] RR,
                    input [4:0] RD,
                    input [31:0] RDvalue,
                    input write,
                    output [31:0] RLvalue,
                    output [31:0] RRvalue);
  
  
  wire [31:0] RL_value;
  wire [31:0] RR_value;
  reg[31:0] register[31:0];
  
  integer i; //loop var
  
  initial //Initialize with Value = Register number times 100
    begin
      for(i=0;i<32;i = i+1)
        begin
          register[i] = i*100;
        end
    end
  
  always @(negedge clk) 
    begin
      if(write)
        register [RD] <= RDvalue; 
    end
  assign RLvalue = register[RL];
  assign RRvalue = register[RR];
    endmodule
