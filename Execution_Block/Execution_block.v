`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:13 05/05/2017 
// Design Name: 
// Module Name:    Execution_block 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Execution_block(ans_ex, data_out, DM_data, flag_ex, A, B, data_in, Op_dec, clk, reset);

input  [7:0] A;
input  [7:0] B;
input  [7:0] data_in;
input  [4:0] Op_dec;
input clk;
input reset;


output reg [7:0] ans_ex;
output reg [7:0] data_out;
output reg [7:0] DM_data;
output [3:0] flag_ex;

wire [8:0] add,sub;
wire [7:0] add_temp, sub_temp, mov, NOT, AND, XOR, OR, SL, SR, SAR;
wire [7:0] ans_ALU, ans_ex_temp;

wire [7:0] data_out_buff, data_out_temp;
wire [7:0] DM_data_temp;
wire zero;
wire parity;

assign NOT = ~B;
assign add = A+B;
assign sub = A+NOT+8'b00000001;
assign add_temp = A[6:0]+B[6:0];
assign sub_temp = A[6:0]+NOT[6:0]+7'b0000001;
assign mov = B;
assign AND = A&B;
assign OR = A|B;
assign XOR = A^B;
assign SL = A << B[2:0];
assign SR = A >> B[2:0];
assign SAR = (B[2] == 1'b0) ? ((B[1] == 1'b0) ? ((B[0] == 1'b0) ? A : {A[7],A[7:1]}) : ((B[0] == 1'b0) ? {A[7],A[7],A[7:2]} : {A[7],A[7],A[7],A[7:3]})) : ((B[1] == 1'b0) ? ((B[0] == 1'b0) ? {A[7],A[7],A[7],A[7],A[7:4]} : {A[7],A[7],A[7],A[7],A[7],A[7:5]}) : ((B[0] == 1'b0) ? {A[7],A[7],A[7],A[7],A[7],A[7],A[7:6]} : {A[7],A[7],A[7],A[7],A[7],A[7],A[7],A[7]}));

assign ans_ALU = (Op_dec == 5'b00000) ? add[7:0] : 
						((Op_dec == 5'b00001) ? sub[7:0] :
						((Op_dec == 5'b00010) ? mov :
						((Op_dec == 5'b00100) ? AND :
						((Op_dec == 5'b00101) ? OR :
						((Op_dec == 5'b00110) ? XOR :
						((Op_dec == 5'b00111) ? NOT :
						((Op_dec == 5'b01000) ? add[7:0] : 
						((Op_dec == 5'b01001) ? sub[7:0] :
						((Op_dec == 5'b01010) ? mov :
						((Op_dec == 5'b01100) ? AND :
						((Op_dec == 5'b01101) ? OR :
						((Op_dec == 5'b01110) ? XOR :
						((Op_dec == 5'b01111) ? NOT :
						((Op_dec == 5'b10000) ? ans_ex :
						((Op_dec == 5'b10001) ? ans_ex :
						((Op_dec == 5'b10100) ? A :
						((Op_dec == 5'b10101) ? A :
						((Op_dec == 5'b10110) ? data_in :
						((Op_dec == 5'b10111) ? ans_ex :
						((Op_dec == 5'b11000) ? ans_ex :
						((Op_dec == 5'b11001) ? SL:
						((Op_dec == 5'b11010) ? SR :
						((Op_dec == 5'b11011) ? SAR :
						((Op_dec == 5'b11100) ? ans_ex :
						((Op_dec == 5'b11101) ? ans_ex:
						((Op_dec == 5'b11110) ? ans_ex :
						((Op_dec == 5'b11111) ? ans_ex : 8'b0
						)))))))))))))))))))))))))));
						
assign zero = ~|ans_ALU;
assign parity = ^ans_ALU;
						
assign flag_ex = (Op_dec == 5'b00000) ? {parity,(add[8]^add_temp[7]),zero,add[8]} : 
						((Op_dec == 5'b00001) ? {parity,(sub[8]^sub_temp[7]),zero,sub[8]} :
						((Op_dec == 5'b00010) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b00100) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b00101) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b00110) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b00111) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b01000) ? {parity,(add[8]^add_temp[7]),zero,add[8]} : 
						((Op_dec == 5'b01001) ? {parity,(sub[8]^sub_temp[7]),zero,sub[8]} :
						((Op_dec == 5'b01010) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b01100) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b01101) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b01110) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b01111) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b10000) ? 4'b0 :
						((Op_dec == 5'b10001) ? 4'b0 :
						((Op_dec == 5'b10100) ? 4'b0 :
						((Op_dec == 5'b10101) ? 4'b0 :
						((Op_dec == 5'b10110) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b10111) ? 4'b0 :
						((Op_dec == 5'b11000) ? 4'b0 :
						((Op_dec == 5'b11001) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b11010) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b11011) ? {parity,1'b0,zero,1'b0} :
						((Op_dec == 5'b11100) ? 4'b0 :
						((Op_dec == 5'b11101) ? 4'b0 :
						((Op_dec == 5'b11110) ? 4'b0 :
						((Op_dec == 5'b11111) ? 4'b0 : 4'b0
						)))))))))))))))))))))))))));

assign data_out_buff = (Op_dec == 5'b10111) ? A : data_out;

assign data_out_temp = (reset == 1'b0) ? 8'b0 : data_out_buff;
assign ans_ex_temp = (reset == 1'b0) ? 8'b0 : ans_ALU;
assign DM_data_temp = (reset == 1'b0) ? 8'b0 : B;

always@(posedge clk)
begin
		data_out = data_out_temp;
		ans_ex = ans_ex_temp;
		DM_data = DM_data_temp;
end 
 

endmodule
