`include "Decode.sv"
`include "RegisterFile.sv"
`include "SetFlags.sv"
`define ISIZE 17
`define ASIZE 5
`define DSIZE 32
`define MSIZE 32

module DecodeStage(input clock,
                   input [`ISIZE-1:0] Instruction,
                   
                   output [`DSIZE-1:0] RLeftOut,
                   output [`DSIZE-1:0] RRightOut,
                   output [`ASIZE-1:0] RDAddressOut,
                   
                   output [3:0] FlagsOut);
  
  wire [1:0] opcode; //Instruction Seperation instance wires
  
  wire [`ASIZE-1:0] RRightAddress;
  wire [`ASIZE-1:0] RLeftAddress;
  wire [`ASIZE-1:0] RDAddress;
  wire [3:0] Flags;
  
  wire [`DSIZE-1:0] RLeftData; //regfile instance wires
  wire [`DSIZE-1:0] RRightData;
  
  reg [`DSIZE-1:0] RLeftOut;
  reg [`DSIZE-1:0] RRightOut;                          /* THE OUTPUT*/
  reg [`ASIZE-1:0] RDAddressOut;
  reg [3:0] FlagsOut;
  

    RegisterFile RegFileDecode(clock,RLeftAddress,RRightAddress,RDAddress,32'b0,1'b1,RLeftData,RRightData);
  Decode Decoder(Instruction,RLeftAddress,RRightAddress,RDAddress,opcode);
  SetFlags  SetFlagsDecode(opcode,Flags);

  initial
    FlagsOut = 1;
  
  always @(posedge clock) 
    begin
        assign RLeftOut = RLeftData;
  		assign RRightOut = RRightData;
  		assign RDAddressOut = RDAddress;
  	    assign FlagsOut =Flags;	
    end
endmodule
          
          
          
 
          
          
          
          
          
          
          
          
          
          