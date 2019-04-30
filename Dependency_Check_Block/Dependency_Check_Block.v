`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:19:43 09/22/2017 
// Design Name: 
// Module Name:    Dependency_Check_Block 
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
module Dependency_Check_Block(
    input [23:0] ins,
    input clk,
    input reset,
    output [7:0] imm,
    output [4:0] RW_dm,
    output [4:0] op_dec,
    output [1:0] mux_sel_A,
    output [1:0] mux_sel_B,
    output imm_sel,
    output mem_en_ex,
    output mem_rw_ex,
    output mem_mux_sel_dm
    );
	reg[1:0] mux_sel_reg_A,mux_sel_reg_B;
	reg ld_dff1,rw_dff1,ld_dff2,st_dff,rw_dff2,en_dff,dm_dff1,dm_dff2,imm_dff;
	reg[4:0] ins_reg,ins_and_reg1,ins_and_reg2,ins_and_reg3,ins_and_reg4,ins_and_reg5,ins_and_reg6;
	reg[7:0] imm_reg;
	wire [18:0] ext;
	wire[3:0] w1,w2;
	wire CA_1,CA_2,CA_3,CB_1,CB_2,CB_3;
	wire[18:0] ins_out;
	
	and JMP(jmp_out,~ins[19],~ins[20],~ins[21],ins[22],ins[23]);
	and Cond_J(cond_j_out,ins[23],ins[22],ins[21]);
	and Ld1(ld1_out,ins[23],~ins[22],ins[21],~ins[19],~ins[20],~ld_dff1);//ch ~lddff1
	
	and IMM(imm_out,~ins[23],ins[22]);
	and Ld2(ld2_out,ins[23],~ins[22],ins[21],~ins[19],~ins[20]);
	and ST(st_out,~ins[22],ins[21],ins[19],~ins[20],ins[23]);//ch ins 23
	nor JC_NOR(jc_nor_out,jmp_out,cond_j_out,ld_dff1);//ch inp ldd_ff1
	and LS_AND(ls_and_out,ld2_out,~ld_dff2);//ch ~lddff2
	or LD_OR(ld_or_out,ld_dff2,st_dff);
	and LD_AND(ld_and_out,ld_or_out,~rw_dff1);

	always@(posedge clk)
	begin
		if(reset==1'b1)
			ld_dff1 <= ld1_out;
		else
			ld_dff1 <= 0;
	end
	
	always@(posedge clk)
	begin
		if(reset==1'b1)
			rw_dff1 <= ins[19];
		else
			rw_dff1 <= 0;
	end
	
	always@(posedge clk)
	begin
		if(reset==1'b1)
			ld_dff2 <= ls_and_out;
		else
			ld_dff2 <= 0;
	end
	
	always@(posedge clk)
	begin
		if(reset==1'b1)
			st_dff <= st_out;
		else
			st_dff <= 0;
	end
	
	
	assign ext = (jc_nor_out==1'b0)?19'b0000_0000_0000_0000_000 : 19'b1111_1111_1111_1111_111;
	
//	and INS(ins_out,ins[18:0],ext);
	assign ins_out[0] = ins[0] & ext[0]; 
	assign ins_out[1] = ins[1] & ext[1]; 
	assign ins_out[2] = ins[2] & ext[2]; 
	assign ins_out[3] = ins[3] & ext[3]; 
	assign ins_out[4] = ins[4] & ext[4]; 
	assign ins_out[5] = ins[5] & ext[5]; 
	assign ins_out[6] = ins[6] & ext[6]; 
	assign ins_out[7] = ins[7] & ext[7]; 
	assign ins_out[8] = ins[8] & ext[8]; 
	assign ins_out[9] = ins[9] & ext[9]; 
	assign ins_out[10] = ins[10] & ext[10]; 
	assign ins_out[11] = ins[11] & ext[11]; 
	assign ins_out[12] = ins[12] & ext[12]; 
	assign ins_out[13] = ins[13] & ext[13]; 
	assign ins_out[14] = ins[14] & ext[14]; 
	assign ins_out[15] = ins[15] & ext[15]; 
	assign ins_out[16] = ins[16] & ext[16]; 
	assign ins_out[17] = ins[17] & ext[17]; 
	assign ins_out[18] = ins[18] & ext[18];
	always@(posedge clk)
	begin
		if(reset==1'b1)
			imm_reg <= ins[8:1];
		else
			imm_reg <= 0;
	end
	
	always@(posedge clk)
	begin
		if(reset==1'b1)
			imm_dff <= imm_out;
		else
			imm_dff <= 0;
	end
	
	always@(posedge clk)
	begin
		if(reset==1'b1)
			rw_dff2 <= rw_dff1;
		else
			rw_dff2 <= 0;
	end
	
	always@(posedge clk)
	begin
		if(reset==1'b1)
			dm_dff1 <= ld_and_out;
		else
			dm_dff1 <= 0;
	end
	
	always@(posedge clk)
	begin
		if(reset==1'b1)
			en_dff <= ld_or_out;
		else
			en_dff <= 0;
	end
	
	always@(posedge clk)
	begin
		if(reset==1'b1)
			dm_dff2 <= dm_dff1;
		else
			dm_dff2 <= 0;
	end
	
	always@(posedge clk)
	begin
		if(reset==1'b1)
			ins_reg <= ins[23:19];
		else
			ins_reg <= 0;
	end
	
	always@(posedge clk)
	begin
		if(reset==1'b1)
			begin
			ins_and_reg1 <= ins_out[13:9];
			ins_and_reg2 <= ins_out[18:14];
			ins_and_reg3 <= ins_and_reg2;
			ins_and_reg4 <= ins_and_reg3;
			ins_and_reg5 <= ins_and_reg4;
			ins_and_reg6 <= ins_out[8:4];
			end
		else
			begin
			ins_and_reg1 <= 0;
			ins_and_reg2 <= 0;
			ins_and_reg3 <= 0;
			ins_and_reg4 <= 0;
			ins_and_reg5 <= 0;
			ins_and_reg6 <= 0;
			end
	end
	
	assign CA_1 = (ins_and_reg3 == ins_and_reg1)?1'b1:1'b0;
	assign CA_2 = (ins_and_reg4 == ins_and_reg1)?1'b1:1'b0;
	assign CA_3 = (ins_and_reg5 == ins_and_reg1)?1'b1:1'b0;
	
	and CA1(ca_and_1,~CA_1,CA_2);
	and CA2(ca_and_2,~CA_1,~CA_2,CA_3);
	
	assign CB_1 = (ins_and_reg3 == ins_and_reg6)?1'b1:1'b0;
	assign CB_2 = (ins_and_reg4 == ins_and_reg6)?1'b1:1'b0;
	assign CB_3 = (ins_and_reg5 == ins_and_reg6)?1'b1:1'b0;
	
	and CB1(cb_and_1,~CB_1,CB_2);
	and CB2(cb_and_2,~CB_1,~CB_2,CB_3);
	
	assign w1 = {ca_and_2,ca_and_1,CA_1,1'b1};
	assign w2 = {cb_and_2,cb_and_1,CB_1,1'b1};
	
	
	always@(w1,w2)
	begin
		casex(w1)
			4'b0001 : mux_sel_reg_A = 2'b00;
			4'b001x : mux_sel_reg_A = 2'b01;
			4'b01xx : mux_sel_reg_A = 2'b10;
			4'b1xxx : mux_sel_reg_A = 2'b11;
			
			
			
			default: begin
							mux_sel_reg_A = 2'bx;
							
						end
		endcase
		casex(w2)
			4'b0001 : mux_sel_reg_B = 2'b00;
			4'b001x : mux_sel_reg_B = 2'b01;
			4'b01xx : mux_sel_reg_B = 2'b10;
			4'b1xxx : mux_sel_reg_B = 2'b11;
			
			
			
			default: begin
							mux_sel_reg_B = 2'bx;
							
						end
		endcase
	end
	assign mux_sel_B = mux_sel_reg_B;
	assign mux_sel_A = mux_sel_reg_A;
	assign op_dec = ins_reg;
	assign RW_dm = ins_and_reg4;
	assign mem_rw_ex = rw_dff2;
	assign mem_mux_sel_dm = dm_dff2;
	assign mem_en_ex = en_dff;
	assign imm_sel = imm_dff;
	assign imm = imm_reg;

endmodule
