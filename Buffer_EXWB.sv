`define DSIZE 32
`define ASIZE 5
module Buffer_EXWB(input clk,
                  input [`DSIZE-1:0] ResultIn,
                  input [`ASIZE-1:0] RDAddrIn,
                  
                  output reg [`DSIZE-1:0] ResultOut,
                  output reg [`ASIZE-1:0] RDAddrOut);
  
  always@(posedge clk) begin
    assign ResultOut = ResultIn;
    assign RDAddrOut = RDAddrIn;

  end
endmodule