`define ISIZE 17
`define MSIZE 10

`include "IMemory.sv"
`include "IPAdder.sv"

module FetchStage(
  input clock,
  input [`MSIZE-1:0] IP,
  output reg [`ISIZE-1:0] Instruction);
  
  wire [`ISIZE-1:0] InstFromIMem;
  wire [`MSIZE-1:0] IPNew;
  
  IPAdder IPAdder_1 (clock,IP,IPNew);
  IMemory IMemory_1 (IPNew,InstFromIMem); 
  
  always@(posedge clock)
    begin
      assign Instruction = InstFromIMem;
  end
  
endmodule