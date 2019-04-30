`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:04 08/04/2017 
// Design Name: 
// Module Name:    Adder_Subtractor 
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
module add_sub_8bit(answer,carryout,overflow,A,B,carryin);

output carryout,overflow;
output[7:0] answer;
input[7:0] A,B;
input carryin;

wire [6:0] carrytemp;

full_adder fa0(answer[0],carrytemp[0],A[0],B[0]^carryin,carryin);
full_adder fa1(answer[1],carrytemp[1],A[1],B[1]^carryin,carrytemp[0]);
full_adder fa2(answer[2],carrytemp[2],A[2],B[2]^carryin,carrytemp[1]);
full_adder fa3(answer[3],carrytemp[3],A[3],B[3]^carryin,carrytemp[2]);
full_adder fa4(answer[4],carrytemp[4],A[4],B[4]^carryin,carrytemp[3]);
full_adder fa5(answer[5],carrytemp[5],A[5],B[5]^carryin,carrytemp[4]);
full_adder fa6(answer[6],carrytemp[6],A[6],B[6]^carryin,carrytemp[5]);
full_adder fa7(answer[7],carryout,A[7],B[7]^carryin,carrytemp[6]);

assign overflow = carrytemp[6]^carryout;

endmodule
