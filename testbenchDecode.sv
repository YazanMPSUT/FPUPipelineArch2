module testbenchDecode();
  
  reg[`ISIZE-1:0] Inst_t;
  
  wire[4:0] RL_t;
  wire[4:0] RR_t;
  wire[4:0] RD_t;
  
  wire[1:0] OP_t;
  
  Decode D_t(Inst_t,RL_t,RR_t,RD_t,OP_t);
  reg[8*3:1] operation ; //string for operation
  
  initial
  begin
    
    //sub $10,12,11
    Inst_t = 17'b01100010110101010;
    //        RL    RR     RD    OP 
    #1
    if(OP_t == 0)
      operation = "ADD";
    
    else if(OP_t == 1)
      operation = "SUB";
    
    else if(OP_t == 2)
      operation = "MUL";
    
    else if(OP_t == 3)
      operation = "DIV";

    $display("Instruction: %s $%d, $%d, $%d",operation,RD_t,RL_t, RR_t);
	$finish;
  end
  
  
endmodule