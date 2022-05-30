`define DSIZE 32

module multiplexer(
    input [`DSIZE-1:0] a,
    input [`DSIZE-1:0] b,
    input sel,
    output [`DSIZE-1:0] result);
  
    wire [`DSIZE-1:0] a,b;
    reg [`DSIZE-1:0] result;
  
    always @(a,b,sel)
    begin
      if(sel==0)
        result=a;
    else
        result=b;
    end    
endmodule