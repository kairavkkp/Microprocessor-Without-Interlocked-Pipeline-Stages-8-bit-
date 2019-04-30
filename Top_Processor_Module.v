`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:18 09/29/2017 
// Design Name: 
// Module Name:    Top_Processor_Module 
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
module Top_Processor_Module(
    input [7:0] data_in,
    input clk,
    input interrupt,
    input reset,
    output [7:0] data_out
    
    );
	 wire [23:0] ins;
    wire [7:0] A;
    wire [7:0] B;
    wire [7:0] Current_Address;
    wire [7:0] ans_ex;
    wire [7:0] ans_dm;
    wire [7:0] ans_wb;
    wire [1:0] mux_sel_A;
    wire [1:0] mux_sel_B;
    wire imm_sel;
	 wire[7:0] jmp_loc,DM_data,imm;
	 wire[3:0] flag_ex;
	 wire[4:0] op_dec,RW_dm;
//	 wire[1:0] mux_sel_A,mux_sel_B;
	 wire pc_mux_sel,Stall,Stall_pm,mem_rw_ex,mem_en_ex,mem_mux_sel_dm;
	//IF
	PC_IM pcim(ins,Current_Address,jmp_loc,pc_mux_sel,Stall,Stall_pm,clk,reset);//
	
	Dependency_Check_Block dcb(ins,clk,reset,imm,RW_dm,op_dec,mux_sel_A,mux_sel_B,imm_sel,mem_en_ex,mem_rw_ex,mem_mux_sel_dm);
	
	Stall_Control_Block scb(ins,clk,reset,Stall,Stall_pm);//
	
	Jump_Control_Block jc(ins,Current_Address,flag_ex,interrupt,clk,reset,jmp_loc,pc_mux_sel);//
	//ID
	Register_Bank rb(ins,ans_ex,ans_dm,ans_wb,imm,RW_dm,mux_sel_A,mux_sel_B,imm_sel,clk,A,B);//
	//ALU
	//ALU_8bit exe(ans_ex,DM_data,data_out,flag_ex,A,B,data_in,op_dec,clk,reset);//
	Execution_block eb(ans_ex, data_out, DM_data, flag_ex, A, B, data_in, op_dec, clk, reset);
	//DM
	Data_Mem Dm(ans_ex,DM_data,mem_rw_ex,mem_en_ex,mem_mux_sel_dm,reset,clk,ans_dm);//
	//WB
	Write_Back_Block wb(ans_dm,clk,reset,ans_wb);//
	

endmodule
