`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:02:53 09/01/2017
// Design Name:   Stall_Control_Block
// Module Name:   C:/Users/Kairav/Documents/ICT-3rd Sem/Stall_Control_Block/Stall_Control_Block_tb.v
// Project Name:  Stall_Control_Block
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Stall_Control_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Stall_Control_Block_tb;

	// Inputs
	reg [23:0] ins;
	reg clk;
	reg reset;

	// Outputs
	wire Stall;
	wire Stall_pm;

	// Instantiate the Unit Under Test (UUT)
	Stall_Control_Block uut (
		.ins(ins), 
		.clk(clk), 
		.reset(reset), 
		.Stall(Stall), 
		.Stall_pm(Stall_pm)
	);

	initial begin

		ins = 24'h000000;
		clk = 0;
		reset = 1;				

		#200;							//0.2us
		reset=1'b0;
		
		#500;							//0.7us
		reset=1'b1;
		
		#900;							//1.6us
		ins=24'ha00000;
		
		#2000;						//3.6us
		ins=24'h000000;
		
		#1000;						//4.6us

		ins=24'hf00000;  


		#3000;
		ins=24'h000000;					//7.6us

		#1000;
		ins=24'h880000;					//8.6us	

	end
	
	always
	#500 clk = ~clk;
      
endmodule

