/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module rom_adder1_3 (
    input [4:0] test_case,
    output reg [4:0] num_cases,
    output reg [15:0] a,
    output reg [15:0] b,
    output reg [5:0] alufn,
    output reg [15:0] exp_out,
    output reg exp_z,
    output reg exp_v,
    output reg exp_n
  );
  
  
  
  localparam A = 224'hffff00ff00ffffff00ff00ff00ff0000ffff00fffffe01fffffe00f0;
  
  localparam B = 224'hffff01fffffffffe01ffffffff010000ffff00fffffe01fffffa02ff;
  
  localparam ALUFN_SIGNAL = 84'h000001041000041000041;
  
  localparam EXPECTED_OUTPUT_SUM = 224'hfffe02fe00fe0001ff0001000000000000000000fffc03fe0004ff00;
  
  localparam EXPECTED_OUTPUT_Z = 14'h00f0;
  
  localparam EXPECTED_OUTPUT_V = 14'h0000;
  
  localparam EXPECTED_OUTPUT_N = 14'h2209;
  
  always @* begin
    num_cases = 5'h0e;
    a = A[(test_case)*16+15-:16];
    b = B[(test_case)*16+15-:16];
    alufn = ALUFN_SIGNAL[(test_case)*6+5-:6];
    exp_out = EXPECTED_OUTPUT_SUM[(test_case)*16+15-:16];
    exp_z = EXPECTED_OUTPUT_Z[(test_case)*1+0-:1];
    exp_v = EXPECTED_OUTPUT_V[(test_case)*1+0-:1];
    exp_n = EXPECTED_OUTPUT_N[(test_case)*1+0-:1];
  end
endmodule
