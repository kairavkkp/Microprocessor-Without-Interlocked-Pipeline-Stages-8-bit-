`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:57:06 09/26/2017
// Design Name:   Dependency_Check_Block
// Module Name:   C:/Users/HP/Desktop/myStuff/Nisarg/STUDY/Sem3/CO/Dependency_Check_Block/Dependency_Check_Block/tb.v
// Project Name:  Dependency_Check_Block
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Dependency_Check_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg [23:0] ins;
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] imm;
	wire [4:0] RW_dm;
	wire [4:0] op_dec;
	wire [1:0] mux_sel_A;
	wire [1:0] mux_sel_B;
	wire imm_sel;
	wire mem_en_ex;
	wire mem_rw_ex;
	wire mem_mux_sel_dm;

	// Instantiate the Unit Under Test (UUT)
	Dependency_Check_Block uut (
		.ins(ins), 
		.clk(clk), 
		.reset(reset), 
		.imm(imm), 
		.RW_dm(RW_dm), 
		.op_dec(op_dec), 
		.mux_sel_A(mux_sel_A), 
		.mux_sel_B(mux_sel_B), 
		.imm_sel(imm_sel), 
		.mem_en_ex(mem_en_ex), 
		.mem_rw_ex(mem_rw_ex), 
		.mem_mux_sel_dm(mem_mux_sel_dm)
	);
	
	 
	initial begin
		// Initialize Inputs
		
		ins = 24'b00000_00000_00000_00000_0000;
		reset = 1;
		clk = 0;
      #200;						//0.2us
		reset = 0;
		#600;						//0.8us
		reset = 1;
	
		#500;						//1.3us
		ins = 24'b00000_00001_00010_00011_0000;
		
		#1000;					//2.3us
		ins = 24'b10100_00100_00001_00000_0000;
		
		#1000;					//3.3us
		ins = 24'b10100_00100_00001_00000_0000; 
		
		#1000;					//4.3us
		ins = 24'b00100_00101_00001_00100_0000;
		
		#1000;					//5.3us
		ins = 24'b01101_00110_00001_00000101_0;

	end
	
	 always #500 clk = ~clk;
	
		
      
endmodule

