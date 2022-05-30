module testbenchRegFile();
  
  reg clk_t;
  reg[4:0] RL_t;
  reg[4:0] RR_t;
  reg[4:0] RD_t;
  reg write_t;
  wire [31:0] RL_data_t;
  wire [31:0] RR_data_t;
  reg [31:0] RD_data_t;	
  RegisterFile RF(clk_t,RL_t,RR_t,RD_t,RD_data_t,write_t,RL_data_t,RR_data_t);
    
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      write_t = 1;
     	clk_t = 0;
    #1
    clk_t = ~clk_t; //posedge
      RD_t = 0;
      RD_data_t = 12;

    #1
        clk_t = ~clk_t; //negedge
    #1
        clk_t = ~clk_t; //posedge
            RD_t = 1 ;
      RD_data_t = 16;

    #1
        clk_t = ~clk_t; //negedge
    #1
       clk_t = ~clk_t; //posedge
      	write_t = 0;
    #1
       clk_t = ~clk_t; //negedge
    #1
      
    
      //RR = 0, Value[RR] = 12
      //RL = 1, Value[RL] = 16
    RR_t= 3'b000; RL_t = 3'b001; 

    
      $display("RR data is %b", RR_data_t);
      $display("RL data is %b", RL_data_t);

      
      $finish;
    
    end
  
  
endmodule