`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:03 08/18/2017 
// Design Name: 
// Module Name:    Register_Bank 
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
module Register_Bank(
    input [23:0] ins,
    input [7:0] ans_ex,
    input [7:0] ans_dm,
    input [7:0] ans_wb,
    input [7:0] imm,
    input [4:0] RW_dm,
    input [1:0] mux_sel_A,
    input [1:0] mux_sel_B,
    input imm_sel,
    input clk,
    output [7:0] A,
    output [7:0] B
    );
	 
	 reg [7:0]reg_bank [0:31];
	 
	 reg [7:0] AR,BR;
	 
	 wire [7:0] BI;
	
	
	always@(posedge clk)
	begin
		AR <= reg_bank[ins[13:9]];
		BR <= reg_bank[ins[8:4]];
		reg_bank[RW_dm] <= ans_dm;
		
		
	end
	
	
	
	assign A = (mux_sel_A==2'b00)?AR:
					(mux_sel_A==2'b01)?ans_ex:
					(mux_sel_A==2'b10)?ans_dm:ans_wb;
					
	assign BI = (mux_sel_B==2'b00)?BR:
					(mux_sel_B==2'b01)?ans_ex:
					(mux_sel_B==2'b10)?ans_dm:ans_wb;
					
										
	assign B = (imm_sel==1'b0)?BI:imm;	
	
	
	
	

endmodule
