`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:57 09/01/2017 
// Design Name: 
// Module Name:    Stall_Control_Block 
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
module Stall_Control_Block(
    input [23:0] ins,
    input clk,
    input reset,
    output Stall,
    output Stall_pm
    );
	 
	 
	 and i1(hlt,ins[19],~ins[20],~ins[21],~ins[22],ins[23]);			//and instance for HALT instruction 
	 and i2(ld,~ins[19],~ins[20],ins[21],~ins[22],ins[23],~ld_Q);	//	and instance for LOAD instruction
	 and i3(jmp,ins[21],ins[22],ins[23],~jmp_Q2);						// and instance for JUMP instruction
    or i4(Stall,hlt,ld,jmp);													// or instance for STALL output

	 DFF_Stall_Control_Block d1(ld_Q,ld,clk,reset);						//flipflop for LOAD 
	 DFF_Stall_Control_Block d2(jmp_Q,jmp,clk,reset);					//flipflop for JUMP
	 DFF_Stall_Control_Block d3(Stall_pm,Stall,clk,reset);			//flipflop for STALL_pm
	 DFF_Stall_Control_Block d4(jmp_Q2,jmp_Q,clk,reset);				////flipflop for extending the value of JUMP instruction 

endmodule
