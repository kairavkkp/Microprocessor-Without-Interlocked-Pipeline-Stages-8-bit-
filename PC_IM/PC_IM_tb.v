`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:09:08 08/11/2017
// Design Name:   PC_IM
// Module Name:   C:/Users/Kairav/Documents/ICT-3rd Sem/PCIM_Block/PC_IM_tb.v
// Project Name:  PCIM_Block
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC_IM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_IM_tb;

	// Inputs
	reg [7:0] jmp_loc;
	reg pc_mux_sel;
	reg Stall;
	reg Stall_pm;
	reg clk;
	reg reset;

	// Outputs
	wire [23:0] ins;
	wire [7:0] Current_Address;

	// Instantiate the Unit Under Test (UUT)
	PC_IM uut (
		.ins(ins), 
		.Current_Address(Current_Address), 
		.jmp_loc(jmp_loc), 
		.pc_mux_sel(pc_mux_sel), 
		.Stall(Stall), 
		.Stall_pm(Stall_pm), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs		//0us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b1;
		Stall = 1'b0;
		Stall_pm = 1'b0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#200;							//0.2us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b1;
		Stall = 1'b0;
		Stall_pm = 1'b0;
		reset = 0;
	
		#600;							//0.8us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b0;
		Stall = 1'b0;
		Stall_pm = 1'b0;
		reset = 1;
		
		#700;							//1.5us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b0;
		Stall = 1'b0;
		Stall_pm = 1'b0;
		reset = 1;
		
      #1000;						//2.5us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b0;
		Stall = 1'b0;
		Stall_pm = 1'b0;
		reset = 1;  
		
		#1000;						//3.5us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b0;
		Stall = 1'b0;
		Stall_pm = 1'b0;
		reset = 1;
		
		#500;							//4us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b0;
		Stall = 1'b1;
		Stall_pm = 1'b0;
		reset = 1;
		
		#500;							//4.5us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b0;
		Stall = 1'b1;
		Stall_pm = 1'b0;
		reset = 1;
		
		#500;							//5us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b0;
		Stall = 1'b0;
		Stall_pm = 1'b1;
		reset = 1;
		
		#500;							//5.5us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b0;
		Stall = 1'b0;
		Stall_pm = 1'b1;
		reset = 1;
		
		#500;							//6us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b1;
		Stall = 1'b0;
		Stall_pm = 1'b0;
		reset = 1;
		
		#500;							//6.5us
		jmp_loc = 8'h08;
		pc_mux_sel = 1'b1;
		Stall = 1'b0;
		Stall_pm = 1'b0;
		reset = 1;
		// Add stimulus here

	end
   always 
	#500 clk = ~clk;
		
endmodule

