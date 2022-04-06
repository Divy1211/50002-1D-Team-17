/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module regfile_5 (
    input clk,
    input rst,
    input [4:0] ra,
    input [4:0] rb,
    input [4:0] rc,
    input ra2sel,
    input we,
    input [15:0] data,
    output reg [15:0] ra_data,
    output reg [15:0] rb_data,
    output reg [143:0] board_state,
    output reg [15:0] pieces_remaining_p1,
    output reg [15:0] pieces_remaining_p2,
    output reg [15:0] winner
  );
  
  
  
  reg [15:0] ra_data_s;
  
  reg [4:0] rc_s;
  
  reg [15:0] M_box00_d, M_box00_q = 1'h0;
  reg [15:0] M_box01_d, M_box01_q = 1'h0;
  reg [15:0] M_box02_d, M_box02_q = 1'h0;
  reg [15:0] M_box10_d, M_box10_q = 1'h0;
  reg [15:0] M_box11_d, M_box11_q = 1'h0;
  reg [15:0] M_box12_d, M_box12_q = 1'h0;
  reg [15:0] M_box20_d, M_box20_q = 1'h0;
  reg [15:0] M_box21_d, M_box21_q = 1'h0;
  reg [15:0] M_box22_d, M_box22_q = 1'h0;
  reg [15:0] M_pieces_remaining_small_p1_d, M_pieces_remaining_small_p1_q = 1'h0;
  reg [15:0] M_pieces_remaining_small_p2_d, M_pieces_remaining_small_p2_q = 1'h0;
  reg [15:0] M_pieces_remaining_med_p1_d, M_pieces_remaining_med_p1_q = 1'h0;
  reg [15:0] M_pieces_remaining_med_p2_d, M_pieces_remaining_med_p2_q = 1'h0;
  reg [15:0] M_pieces_remaining_large_p1_d, M_pieces_remaining_large_p1_q = 1'h0;
  reg [15:0] M_pieces_remaining_large_p2_d, M_pieces_remaining_large_p2_q = 1'h0;
  reg [15:0] M_selected_size_p1_d, M_selected_size_p1_q = 1'h0;
  reg [15:0] M_selected_size_p2_d, M_selected_size_p2_q = 1'h0;
  reg [15:0] M_winner_dff_d, M_winner_dff_q = 1'h0;
  reg [15:0] M_box_addr_d, M_box_addr_q = 1'h0;
  reg [15:0] M_temp1_d, M_temp1_q = 1'h0;
  reg [15:0] M_temp2_d, M_temp2_q = 1'h0;
  reg [15:0] M_temp3_d, M_temp3_q = 1'h0;
  reg [15:0] M_temp4_d, M_temp4_q = 1'h0;
  reg [15:0] M_temp5_d, M_temp5_q = 1'h0;
  reg [15:0] M_temp6_d, M_temp6_q = 1'h0;
  reg [15:0] M_temp7_d, M_temp7_q = 1'h0;
  reg [15:0] M_temp8_d, M_temp8_q = 1'h0;
  reg [15:0] M_temp9_d, M_temp9_q = 1'h0;
  reg [15:0] M_temp10_d, M_temp10_q = 1'h0;
  reg [15:0] M_temp11_d, M_temp11_q = 1'h0;
  reg [15:0] M_temp12_d, M_temp12_q = 1'h0;
  reg [15:0] M_temp13_d, M_temp13_q = 1'h0;
  
  always @* begin
    M_temp11_d = M_temp11_q;
    M_temp12_d = M_temp12_q;
    M_temp13_d = M_temp13_q;
    M_temp10_d = M_temp10_q;
    M_temp2_d = M_temp2_q;
    M_temp3_d = M_temp3_q;
    M_temp1_d = M_temp1_q;
    M_box20_d = M_box20_q;
    M_box_addr_d = M_box_addr_q;
    M_box00_d = M_box00_q;
    M_box22_d = M_box22_q;
    M_box21_d = M_box21_q;
    M_box02_d = M_box02_q;
    M_winner_dff_d = M_winner_dff_q;
    M_box01_d = M_box01_q;
    M_pieces_remaining_small_p2_d = M_pieces_remaining_small_p2_q;
    M_pieces_remaining_small_p1_d = M_pieces_remaining_small_p1_q;
    M_pieces_remaining_med_p1_d = M_pieces_remaining_med_p1_q;
    M_pieces_remaining_med_p2_d = M_pieces_remaining_med_p2_q;
    M_selected_size_p1_d = M_selected_size_p1_q;
    M_pieces_remaining_large_p1_d = M_pieces_remaining_large_p1_q;
    M_pieces_remaining_large_p2_d = M_pieces_remaining_large_p2_q;
    M_selected_size_p2_d = M_selected_size_p2_q;
    M_temp6_d = M_temp6_q;
    M_temp7_d = M_temp7_q;
    M_box11_d = M_box11_q;
    M_temp4_d = M_temp4_q;
    M_box10_d = M_box10_q;
    M_temp5_d = M_temp5_q;
    M_box12_d = M_box12_q;
    M_temp8_d = M_temp8_q;
    M_temp9_d = M_temp9_q;
    
    ra_data = 1'h0;
    rb_data = 1'h0;
    ra_data_s = 1'h0;
    board_state = {{M_box00_q, M_box01_q, M_box02_q}, {M_box10_q, M_box11_q, M_box12_q}, {M_box20_q, M_box21_q, M_box22_q}};
    pieces_remaining_p1 = 1'h0;
    pieces_remaining_p2 = 1'h0;
    winner = M_winner_dff_q;
    
    case (ra)
      1'h0: begin
        ra_data_s = M_box00_q;
      end
      1'h1: begin
        ra_data_s = M_box01_q;
      end
      2'h2: begin
        ra_data_s = M_box02_q;
      end
      2'h3: begin
        ra_data_s = M_box10_q;
      end
      3'h4: begin
        ra_data_s = M_box11_q;
      end
      3'h5: begin
        ra_data_s = M_box12_q;
      end
      3'h6: begin
        ra_data_s = M_box20_q;
      end
      3'h7: begin
        ra_data_s = M_box21_q;
      end
      4'h8: begin
        ra_data_s = M_box22_q;
      end
      4'h9: begin
        ra_data_s = M_pieces_remaining_small_p1_q;
      end
      4'ha: begin
        ra_data_s = M_pieces_remaining_small_p2_q;
      end
      4'hb: begin
        ra_data_s = M_pieces_remaining_med_p1_q;
      end
      4'hc: begin
        ra_data_s = M_pieces_remaining_med_p2_q;
      end
      4'hd: begin
        ra_data_s = M_pieces_remaining_large_p1_q;
      end
      4'he: begin
        ra_data_s = M_pieces_remaining_large_p2_q;
      end
      4'hf: begin
        ra_data_s = M_selected_size_p1_q;
      end
      5'h10: begin
        ra_data_s = M_selected_size_p2_q;
      end
      5'h11: begin
        ra_data_s = M_winner_dff_q;
      end
      5'h12: begin
        ra_data_s = M_box_addr_q;
      end
      5'h13: begin
        ra_data_s = M_temp1_q;
      end
      5'h14: begin
        ra_data_s = M_temp2_q;
      end
      5'h15: begin
        ra_data_s = M_temp3_q;
      end
      5'h16: begin
        ra_data_s = M_temp4_q;
      end
      5'h17: begin
        ra_data_s = M_temp5_q;
      end
      5'h18: begin
        ra_data_s = M_temp6_q;
      end
      5'h19: begin
        ra_data_s = M_temp7_q;
      end
      5'h1a: begin
        ra_data_s = M_temp8_q;
      end
      5'h1b: begin
        ra_data_s = M_temp9_q;
      end
      5'h1c: begin
        ra_data_s = M_temp10_q;
      end
      5'h1d: begin
        ra_data_s = M_temp11_q;
      end
      5'h1e: begin
        ra_data_s = M_temp12_q;
      end
      5'h1f: begin
        ra_data_s = M_temp13_q;
      end
    endcase
    ra_data = ra_data_s;
    
    case (rb)
      1'h0: begin
        rb_data = M_box00_q;
      end
      1'h1: begin
        rb_data = M_box01_q;
      end
      2'h2: begin
        rb_data = M_box02_q;
      end
      2'h3: begin
        rb_data = M_box10_q;
      end
      3'h4: begin
        rb_data = M_box11_q;
      end
      3'h5: begin
        rb_data = M_box12_q;
      end
      3'h6: begin
        rb_data = M_box20_q;
      end
      3'h7: begin
        rb_data = M_box21_q;
      end
      4'h8: begin
        rb_data = M_box22_q;
      end
      4'h9: begin
        rb_data = M_pieces_remaining_small_p1_q;
      end
      4'ha: begin
        rb_data = M_pieces_remaining_small_p2_q;
      end
      4'hb: begin
        rb_data = M_pieces_remaining_med_p1_q;
      end
      4'hc: begin
        rb_data = M_pieces_remaining_med_p2_q;
      end
      4'hd: begin
        rb_data = M_pieces_remaining_large_p1_q;
      end
      4'he: begin
        rb_data = M_pieces_remaining_large_p2_q;
      end
      4'hf: begin
        rb_data = M_selected_size_p1_q;
      end
      5'h10: begin
        rb_data = M_selected_size_p2_q;
      end
      5'h11: begin
        rb_data = M_winner_dff_q;
      end
      5'h12: begin
        rb_data = M_box_addr_q;
      end
      5'h13: begin
        rb_data = M_temp1_q;
      end
      5'h14: begin
        rb_data = M_temp2_q;
      end
      5'h15: begin
        rb_data = M_temp3_q;
      end
      5'h16: begin
        rb_data = M_temp4_q;
      end
      5'h17: begin
        rb_data = M_temp5_q;
      end
      5'h18: begin
        rb_data = M_temp6_q;
      end
      5'h19: begin
        rb_data = M_temp7_q;
      end
      5'h1a: begin
        rb_data = M_temp8_q;
      end
      5'h1b: begin
        rb_data = M_temp9_q;
      end
      5'h1c: begin
        rb_data = M_temp10_q;
      end
      5'h1d: begin
        rb_data = M_temp11_q;
      end
      5'h1e: begin
        rb_data = M_temp12_q;
      end
      5'h1f: begin
        rb_data = M_temp13_q;
      end
    endcase
    rc_s = rc;
    if (ra2sel) begin
      rc_s = ra_data_s[0+4-:5];
    end
    if (we) begin
      
      case (rc_s)
        1'h0: begin
          M_box00_d = data;
        end
        1'h1: begin
          M_box01_d = data;
        end
        2'h2: begin
          M_box02_d = data;
        end
        2'h3: begin
          M_box10_d = data;
        end
        3'h4: begin
          M_box11_d = data;
        end
        3'h5: begin
          M_box12_d = data;
        end
        3'h6: begin
          M_box20_d = data;
        end
        3'h7: begin
          M_box21_d = data;
        end
        4'h8: begin
          M_box22_d = data;
        end
        4'h9: begin
          M_pieces_remaining_small_p1_d = data;
        end
        4'ha: begin
          M_pieces_remaining_small_p2_d = data;
        end
        4'hb: begin
          M_pieces_remaining_med_p1_d = data;
        end
        4'hc: begin
          M_pieces_remaining_med_p2_d = data;
        end
        4'hd: begin
          M_pieces_remaining_large_p1_d = data;
        end
        4'he: begin
          M_pieces_remaining_large_p2_d = data;
        end
        4'hf: begin
          M_selected_size_p1_d = data;
        end
        5'h10: begin
          M_selected_size_p2_d = data;
        end
        5'h11: begin
          M_winner_dff_d = data;
        end
        5'h12: begin
          M_box_addr_d = data;
        end
        5'h13: begin
          M_temp1_d = data;
        end
        5'h14: begin
          M_temp2_d = data;
        end
        5'h15: begin
          M_temp3_d = data;
        end
        5'h16: begin
          M_temp4_d = data;
        end
        5'h17: begin
          M_temp5_d = data;
        end
        5'h18: begin
          M_temp6_d = data;
        end
        5'h19: begin
          M_temp7_d = data;
        end
        5'h1a: begin
          M_temp8_d = data;
        end
        5'h1b: begin
          M_temp9_d = data;
        end
        5'h1c: begin
          M_temp10_d = data;
        end
        5'h1d: begin
          M_temp11_d = data;
        end
        5'h1e: begin
          M_temp12_d = data;
        end
        5'h1f: begin
          M_temp13_d = data;
        end
      endcase
    end else begin
      M_box00_d = M_box00_q;
      M_box01_d = M_box01_q;
      M_box02_d = M_box02_q;
      M_box10_d = M_box10_q;
      M_box11_d = M_box11_q;
      M_box12_d = M_box12_q;
      M_box20_d = M_box20_q;
      M_box21_d = M_box21_q;
      M_box22_d = M_box22_q;
      M_pieces_remaining_small_p1_d = M_pieces_remaining_small_p1_q;
      M_pieces_remaining_small_p2_d = M_pieces_remaining_small_p2_q;
      M_pieces_remaining_med_p1_d = M_pieces_remaining_med_p1_q;
      M_pieces_remaining_med_p2_d = M_pieces_remaining_med_p2_q;
      M_pieces_remaining_large_p1_d = M_pieces_remaining_large_p1_q;
      M_pieces_remaining_large_p2_d = M_pieces_remaining_large_p2_q;
      M_selected_size_p1_d = M_selected_size_p1_q;
      M_selected_size_p2_d = M_selected_size_p2_q;
      M_winner_dff_d = M_winner_dff_q;
      M_box_addr_d = M_box_addr_q;
      M_temp1_d = M_temp1_q;
      M_temp2_d = M_temp2_q;
      M_temp3_d = M_temp3_q;
      M_temp4_d = M_temp4_q;
      M_temp5_d = M_temp5_q;
      M_temp6_d = M_temp6_q;
      M_temp7_d = M_temp7_q;
      M_temp8_d = M_temp8_q;
      M_temp9_d = M_temp9_q;
      M_temp10_d = M_temp10_q;
      M_temp11_d = M_temp11_q;
      M_temp12_d = M_temp12_q;
      M_temp13_d = M_temp13_q;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_box00_q <= 1'h0;
      M_box01_q <= 1'h0;
      M_box02_q <= 1'h0;
      M_box10_q <= 1'h0;
      M_box11_q <= 1'h0;
      M_box12_q <= 1'h0;
      M_box20_q <= 1'h0;
      M_box21_q <= 1'h0;
      M_box22_q <= 1'h0;
      M_pieces_remaining_small_p1_q <= 1'h0;
      M_pieces_remaining_small_p2_q <= 1'h0;
      M_pieces_remaining_med_p1_q <= 1'h0;
      M_pieces_remaining_med_p2_q <= 1'h0;
      M_pieces_remaining_large_p1_q <= 1'h0;
      M_pieces_remaining_large_p2_q <= 1'h0;
      M_selected_size_p1_q <= 1'h0;
      M_selected_size_p2_q <= 1'h0;
      M_winner_dff_q <= 1'h0;
      M_box_addr_q <= 1'h0;
      M_temp1_q <= 1'h0;
      M_temp2_q <= 1'h0;
      M_temp3_q <= 1'h0;
      M_temp4_q <= 1'h0;
      M_temp5_q <= 1'h0;
      M_temp6_q <= 1'h0;
      M_temp7_q <= 1'h0;
      M_temp8_q <= 1'h0;
      M_temp9_q <= 1'h0;
      M_temp10_q <= 1'h0;
      M_temp11_q <= 1'h0;
      M_temp12_q <= 1'h0;
      M_temp13_q <= 1'h0;
    end else begin
      M_box00_q <= M_box00_d;
      M_box01_q <= M_box01_d;
      M_box02_q <= M_box02_d;
      M_box10_q <= M_box10_d;
      M_box11_q <= M_box11_d;
      M_box12_q <= M_box12_d;
      M_box20_q <= M_box20_d;
      M_box21_q <= M_box21_d;
      M_box22_q <= M_box22_d;
      M_pieces_remaining_small_p1_q <= M_pieces_remaining_small_p1_d;
      M_pieces_remaining_small_p2_q <= M_pieces_remaining_small_p2_d;
      M_pieces_remaining_med_p1_q <= M_pieces_remaining_med_p1_d;
      M_pieces_remaining_med_p2_q <= M_pieces_remaining_med_p2_d;
      M_pieces_remaining_large_p1_q <= M_pieces_remaining_large_p1_d;
      M_pieces_remaining_large_p2_q <= M_pieces_remaining_large_p2_d;
      M_selected_size_p1_q <= M_selected_size_p1_d;
      M_selected_size_p2_q <= M_selected_size_p2_d;
      M_winner_dff_q <= M_winner_dff_d;
      M_box_addr_q <= M_box_addr_d;
      M_temp1_q <= M_temp1_d;
      M_temp2_q <= M_temp2_d;
      M_temp3_q <= M_temp3_d;
      M_temp4_q <= M_temp4_d;
      M_temp5_q <= M_temp5_d;
      M_temp6_q <= M_temp6_d;
      M_temp7_q <= M_temp7_d;
      M_temp8_q <= M_temp8_d;
      M_temp9_q <= M_temp9_d;
      M_temp10_q <= M_temp10_d;
      M_temp11_q <= M_temp11_d;
      M_temp12_q <= M_temp12_d;
      M_temp13_q <= M_temp13_d;
    end
  end
  
endmodule
