`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:46 09/01/2017 
// Design Name: 
// Module Name:    Write_Back_Block 
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
module Write_Back_Block(
    input [7:0] ans_dm,
    input clk,
    input reset,
    output reg [7:0] ans_wb
    );

	 always@(posedge clk)
		begin
			if(reset==1'b1)
				ans_wb<=ans_dm;
			else
				ans_wb<=8'b0000_0000;
		end
		
		
endmodule
