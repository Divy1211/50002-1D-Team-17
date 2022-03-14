/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_13 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    
    case (alufn[0+1-:2])
      2'h0: begin
        out = a << b[0+3-:4];
      end
      2'h1: begin
        out = a >> b[0+3-:4];
      end
      2'h3: begin
        out = a >>> b[0+3-:4];
      end
      default: begin
        out = 16'h0000;
      end
    endcase
  end
endmodule
