`define ISIZE 17
`define MSIZE 32
module IMemory( input[`MSIZE-1:0] IP, //instruction pointer from 0 to 1023
               output[`ISIZE-1:0] Inst);
  integer i;
  reg [`ISIZE-1:0] mem[1023:0]; //1024*17 instruction memory
  //TODO: FIX THIS
  
  initial
    begin
      
      for (i = 0; i<1023; i=i+1) 
      begin
        mem[i] <= `ISIZE'b0; 	
      end
 
      /*
      Test 1: Addition 
      	add $10, $6, $4
        add $3,$2,$6
        add $12,$11,$11
        add $20,$21,$22
      */
      
      mem [4] <= `ISIZE'b01010001100010000;
      mem [8] <= `ISIZE'b00011000100011000;
      mem [12] <= `ISIZE'b01100010110101100;
      mem [16] <= `ISIZE'b10100101011011000;
  
  
 
      /*
      Test 2: Subtraction 
      	sub $10, $6, $4
        sub $3,$2,$6
        sub $12,$11,$11
        sub $20,$21,$22
      */
      
  
  
      mem [20] <= `ISIZE'b01010001100010001;
      mem [24] <= `ISIZE'b00011000100011001;
      mem [28] <= `ISIZE'b01100010110101101;
      mem [32] <= `ISIZE'b10100101011011001;
  
    /*
      Test 3: Addition
      	add $10, $6, $4
        add $3,$2,$6
        add $12,$11,$11
        add $20,$21,$22
      */
      
  
      mem [36] <= `ISIZE'b01010001100010000;
      mem [40] <= `ISIZE'b00011000100011000;
      mem [44] <= `ISIZE'b01100010110101100;
      mem [48] <= `ISIZE'b10100101011011000;
    
      /*
      Test 4: Subtraction 
      	sub $10, $6, $4
        sub  $3,$2,$6
        sub $12,$11,$11
        sub $20,$21,$22
      */
  
  
  
      mem [52] <= `ISIZE'b01010001100010001;
      mem [56] <= `ISIZE'b00011000100011001;
      mem [60] <= `ISIZE'b01100010110101101;
      mem [64] <= `ISIZE'b10100101011011001;
  
            /*
      Test 5: Multiplication 
      	mul $10, $6, $4
        mul  $3,$2,$6
        mul $12,$11,$11
        mul $20,$21,$22
      */
  
  
  
      mem [68] <= `ISIZE'b01010001100010010;
      mem [72] <= `ISIZE'b00011000100011010;
      mem [76] <= `ISIZE'b01100010110101110;
      mem [80] <= `ISIZE'b10100101011011010;
  
            /*
      Test 6: Division 
      	div $10, $6, $4
        div  $3,$2,$6
        div $12,$11,$11
        div $20,$21,$22
      */
  
  
  
      mem [84] <= `ISIZE'b01010001100010011;
      mem [88] <= `ISIZE'b00011000100011011;
      mem [92] <= `ISIZE'b01100010110101111;
      mem [96] <= `ISIZE'b10100101011011011;
  
      
      end
  
  

    assign Inst = mem[IP]; 

endmodule

