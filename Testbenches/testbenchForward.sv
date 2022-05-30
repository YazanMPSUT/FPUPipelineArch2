module Forward_t();
  reg [4:0] RLAddr_t;
  reg [4:0] RRAddr_t; 
  reg[4:0] EX_WB_RDAddr_t;
  reg[`DSIZE-1:0] FromRL_t ;
  reg[`DSIZE-1:0] FromRR_t ;
  reg[`DSIZE-1:0] FromEX_t ;
  wire[`DSIZE-1:0] ToRL_t ;
  wire[`DSIZE-1:0] ToRR_t ;
  
  
  Forward fwd( RLAddr_t,RRAddr_t, EX_WB_RDAddr_t,FromRL_t,FromRR_t,FromEX_t,ToRL_t,ToRR_t);
  
  initial 
    begin
      $dumpfile("dump.vcd");
    $dumpvars(1);
      RLAddr_t = 10;
      RRAddr_t = 2;
      EX_WB_RDAddr_t = 10;
      FromRL_t = 15;
      FromRR_t = 16;
      FromEX_t = 31;
      
      #1
      $display("Value in RL = %d",ToRL_t);
      $display("Value in RR = %d",ToRR_t);
      $finish;
      
      
    end
  endmodule