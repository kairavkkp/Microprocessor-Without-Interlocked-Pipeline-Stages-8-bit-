`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:29 09/08/2017 
// Design Name: 
// Module Name:    Jump_Control_Block 
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
module Jump_Control_Block(
    input [23:0] ins,
    input [7:0] Current_Address,
    input [3:0] flag_ex,
    input interrupt,
    input clk,
    input reset,
    output [7:0] jmp_loc,
    output pc_mux_sel
    );
wire[7:0] A_sum,A_mux,jmp_loc_mux;
reg[7:0] A_out;

wire[3:0] f_mux_1,f_mux_2;
reg[3:0] f_m1_out;

reg dff_1;
reg dff_2;

wire jc_out,jnc_out,jz_out,jnz_out,jc_and_out,jnc_and_out,jz_and_out,jnz_and_out,jmp_out,ret_out;

and JC(jc_out,~ins[19],ins[20],ins[21],ins[22],ins[23]);
and JNC(jnc_out,ins[19],~ins[20],ins[21],ins[22],ins[23]);
and JZ(jz_out,~ins[19],ins[20],ins[21],ins[22],ins[23]);
and JNZ(jnz_out,ins[19],ins[20],ins[21],ins[22],ins[23]);
and JMP(jmp_out,~ins[19],~ins[20],~ins[21],ins[22],ins[23]);
and RET(ret_out,~ins[19],~ins[20],~ins[21],~ins[22],ins[23]);


//////////////////A SERIES/////////////////

assign A_sum = Current_Address + 8'b0000_0001;
assign A_mux = (interrupt==1'b0)?A_out:A_sum;


always@(posedge clk)
begin
	if(reset==1'b1)
		A_out <= A_mux;
	else
		A_out <= 8'b0000_0000;
end
assign jmp_loc_mux = (dff_1==0)?ins[7:0]:8'hf0;
assign jmp_loc = (ret_out==1'b0)? jmp_loc_mux: A_out;
/////////////////F SERIES////////////////////

assign f_mux_1 = (dff_2==0)?f_m1_out:flag_ex;

always @(posedge clk)
begin
	if(reset==1'b1)
		f_m1_out <= f_mux_1;
	else
		f_m1_out<=4'b0000;
end

assign f_mux_2 = (ret_out==0)?flag_ex:ret_out;
///////////////////D SERIES//////////////////
always @(posedge clk)
begin
	if(reset==1'b1)
		dff_1 <= interrupt;
	else
		dff_1 <= 0;
end

always @(posedge clk)
begin
	if(reset==1'b1)
		dff_2 <= dff_1;
	else
		dff_2 <= 0;
end

//////////////////PC_MUX_SEL Section////////////////////////////
and JC_and(jc_and_out,jc_out,f_mux_2[0]);
and JNC_and(jnc_and_out,jnc_out,~f_mux_2[0]);
and JZ_and(jz_and_out,jz_out,f_mux_2[1]);
and JNZ_and(jnz_and_out,jnz_out,~f_mux_2[1]);


or final_or(pc_mux_sel,jc_and_out,jnc_and_out,jz_and_out,jnz_and_out,jmp_out,ret_out,dff_1);



endmodule
