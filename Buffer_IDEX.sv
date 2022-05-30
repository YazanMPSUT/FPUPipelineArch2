`define ASIZE 5
`define DSIZE 32

module Buffer_IDEX(input clk,
                 input [31:0] RLeftIn,
                 input [31:0] RRightIn,
                 input [4:0] RDAddressIn,
                 input [3:0] FlagsIn,     
                 output reg [31:0] RLeftOut,
                 output reg [31:0] RRightOut,
                 output reg [4:0] RDAddressOut,
                 output reg [3:0] FlagsOut);
            
 always@(posedge clk) begin
   assign RLeftOut = RLeftIn;
   assign RRightOut = RRightIn;
   assign RDAddressOut = RDAddressIn;
   assign FlagsOut = FlagsIn;
  end
  
endmodule