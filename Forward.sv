`define DSIZE 32

module Forward(input [4:0] RLAddr,
               input [4:0] RRAddr, 
               input [4:0] EXWBRDAddr, 
               input [`DSIZE-1:0] FromRL,
               input [`DSIZE-1:0] FromRR,
               input [`DSIZE-1:0] FromEXE,
               output reg [`DSIZE-1:0] ToRL,
               output reg [`DSIZE-1:0] ToRR) ;
               	
  
always @(*) 
  begin
 
    if ( (EXWBRDAddr != 0) && ( EXWBRDAddr ==  RLAddr) )
      ToRL = FromEXE;
    
    else
      ToRL = FromRL;
      
    
    if ((EXWBRDAddr != 0) && (EXWBRDAddr == RRAddr))
    ToRR = FromEXE;
    
   else
     ToRR = FromRR;
  end
endmodule