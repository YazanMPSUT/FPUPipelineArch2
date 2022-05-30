`include "design.sv"
module FPU();
  

  wire[`ISIZE-1:0] Inst; //For fetching from Inst. Mem
  wire[`MSIZE-1:0] IP;
  
  wire[`ISIZE-1:0] InstFromFetch; //for buffer
 
  wire [`ASIZE-1:0] RRightAddress;
  wire [`ASIZE-1:0] RLeftAddress;
  wire [`ASIZE-1:0] RDAddress;
  wire [3:0] Flags; 
  						//Decode targets

  wire [`DSIZE-1:0] RLeftData; 
  wire [`DSIZE-1:0] RRightData;
  wire [`DSIZE-1:0] RLeftOut;  
  wire [`DSIZE-1:0]  RRightOut;
  wire [3:0] FlagsOut;
  						//for use with register file
 
       wire [`DSIZE-1:0] EXERes;
  								//for carrying out EXE result
  
  wire [`ASIZE-1:0] RDAddrEXE;
  wire [`DSIZE-1:0] ResEXEOut;
 
  								//for EXWB buffer
  wire [`DSIZE-1:0] RLeftWB;
  wire [`DSIZE-1:0] RRightWB;
  								//for writeback
  
  
  wire clk;
  CommonClock Clock(clk);
  							//Clock

  
  //FPU Modules:
  FetchStage Fetch(clk,IP, Inst);
  Buffer_IFID IFID(clk,Inst,InstFromFetch);
  DecodeStage DS(clk,InstFromFetch,RLeftData, RRightData, RDAddress, Flags);
  Buffer_IDEX IDEX(clk, RLeftData, RRightData, RDAddress,Flags,RLeftOut,RRightOut,RDAddrEXE,FlagsOut);
  EXE EX(EXERes,clk,RLeftOut,RRightOut,FlagsOut);
  Buffer_EXWB  EXWB(clk,EXERes,RDAddrEXE,ResEXEOut,RDAddrEXE);
  RegisterFile  RegfileReturn(clk,`ASIZE'bzzzzz,`ASIZE'bzzzzz, RDAddrEXE, EXERes,1'b1,RLeftWB,RRightWB);
  //5'bzzzzz for impedance since we do not want any value written on RL or RR

  initial
    begin
          $dumpfile("dump.vcd");
    $dumpvars(1);
     #161
     
  
  $finish;
    end
     

endmodule

 
 