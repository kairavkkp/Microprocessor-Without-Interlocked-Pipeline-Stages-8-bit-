`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:51:45 08/18/2017
// Design Name:   Register_Bank
// Module Name:   C:/Users/Kairav/Documents/ICT-3rd Sem/Register_Bank/Register_Bank_tb.v
// Project Name:  Register_Bank
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register_Bank
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Register_Bank_tb;

	// Inputs
	reg [23:0] ins;
	reg [7:0] ans_ex;
	reg [7:0] ans_dm;
	reg [7:0] ans_wb;
	reg [7:0] imm;
	reg [4:0] RW_dm;
	reg [1:0] mux_sel_A;
	reg [1:0] mux_sel_B;
	reg imm_sel;
	reg clk;

	// Outputs
	wire [7:0] A;
	wire [7:0] B;

	// Instantiate the Unit Under Test (UUT)
	Register_Bank uut (
		.ins(ins), 
		.ans_ex(ans_ex), 
		.ans_dm(ans_dm), 
		.ans_wb(ans_wb), 
		.imm(imm), 
		.RW_dm(RW_dm), 
		.mux_sel_A(mux_sel_A), 
		.mux_sel_B(mux_sel_B), 
		.imm_sel(imm_sel), 
		.clk(clk), 
		.A(A), 
		.B(B)
	);

	initial begin
		// Initialize Inputs
		ins = 24'h014c50;
		ans_ex = 8'hc0;
		ans_dm = 8'hd0;
		ans_wb = 8'he0;
		imm = 8'hff;
		imm_sel = 1'b1;
		mux_sel_A = 2'b00;
		mux_sel_B = 2'b00;
		RW_dm = 5'b00111;
		
		clk=0;
		
      
		#500;								//0.5us	
		ins = 24'h014c50;
		ans_ex = 8'hc0;
		ans_dm = 8'hd0;
		ans_wb = 8'he0;
		imm = 8'hff;
		imm_sel = 1'b1;
		mux_sel_A = 2'b00;
		mux_sel_B = 2'b00;
		RW_dm = 5'b00111;
		
		
		#500;								//01us	
		ins = 24'h014e50;
		ans_ex = 8'hc0;
		ans_dm = 8'hd0;
		ans_wb = 8'he0;
		imm = 8'hff;
		imm_sel = 1'b0;
		mux_sel_A = 2'b00;
		mux_sel_B = 2'b01;
		RW_dm = 5'b00111;
		
		
		#500;								//1.5us	
		ins = 24'h014e50;
		ans_ex = 8'hc0;
		ans_dm = 8'hd0;
		ans_wb = 8'he0;
		imm = 8'hff;
		imm_sel = 1'b0;
		mux_sel_A = 2'b00;
		mux_sel_B = 2'b01;
		RW_dm = 5'b00111;
		
		#500;								//2us	
		ins = 24'h014e50;
		ans_ex = 8'hc0;
		ans_dm = 8'hd0;
		ans_wb = 8'he0;
		imm = 8'hff;
		imm_sel = 1'b0;
		mux_sel_A = 2'b11;
		mux_sel_B = 2'b10;
		RW_dm = 5'b00111;
		

	end
	
	always
	#500 clk = ~clk;
      
endmodule

