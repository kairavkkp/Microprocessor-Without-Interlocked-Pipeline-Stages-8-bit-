`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:41 08/04/2017 
// Design Name: 
// Module Name:    Full_Adder 
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
module full_adder(sum,carryout,x,y,carryin);

input carryin,x,y;
output carryout,sum;

assign sum = carryin^(x^y);
assign carryout = ((x^y)&carryin)|(x&y);

endmodule


