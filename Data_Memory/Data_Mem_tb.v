`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:26:57 08/18/2017
// Design Name:   Data_Mem
// Module Name:   C:/Users/Kairav/Documents/ICT-3rd Sem/Data_Memory_Block/Data_Mem_tb.v
// Project Name:  Data_Memory_Block
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Data_Mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Data_Mem_tb;

	// Inputs
	reg [7:0] ans_ex;
	reg [7:0] DM_data;
	reg mem_rw_ex;
	reg mem_en_ex;
	reg mem_mux_sel_dm;
	reg reset;
	reg clk;

	// Outputs
	wire [7:0] ans_dm;

	// Instantiate the Unit Under Test (UUT)
	Data_Mem uut (
		.ans_ex(ans_ex), 
		.DM_data(DM_data), 
		.mem_rw_ex(mem_rw_ex), 
		.mem_en_ex(mem_en_ex), 
		.mem_mux_sel_dm(mem_mux_sel_dm), 
		.reset(reset), 
		.clk(clk), 
		.ans_dm(ans_dm)
	);

	initial begin
		// Initialize Inputs
		ans_ex = 8'h03;				//0us	
		DM_data = 8'hff;
		mem_rw_ex = 0;
		mem_en_ex = 0;
		mem_mux_sel_dm = 0;
		reset = 1;
		clk = 0;

		
		#200;
      ans_ex = 8'h03;				//0.2us	
		DM_data = 8'hff;
		mem_rw_ex = 0;
		mem_en_ex = 0;
		mem_mux_sel_dm = 0;
		reset = 0;  
		
		#600;
		ans_ex = 8'h03;				//0.8us	
		DM_data = 8'hff;
		mem_rw_ex = 0;
		mem_en_ex = 0;
		mem_mux_sel_dm = 0;
		reset = 1;
		
		#200;
		ans_ex = 8'h03;				//1us	
		DM_data = 8'hff;
		mem_rw_ex = 0;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		reset = 1;
		
		#500;
		ans_ex = 8'h03;				//1.5us	
		DM_data = 8'hff;
		mem_rw_ex = 0;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		reset = 1;
		
		#500;
		ans_ex = 8'h03;				//2us	
		DM_data = 8'hff;
		mem_rw_ex = 1;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		reset = 1;
		
		#500;
		ans_ex = 8'h03;				//2.5us	
		DM_data = 8'hff;
		mem_rw_ex = 1;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		reset = 1;
		
		#500;
		ans_ex = 8'h03;				//3us	
		DM_data = 8'hff;
		mem_rw_ex = 0;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		reset = 1;
		
		#500;
		ans_ex = 8'h03;				//3.5us	
		DM_data = 8'hff;
		mem_rw_ex = 0;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		reset = 1;

	end
	always
	#500 clk = ~clk;
      
endmodule

