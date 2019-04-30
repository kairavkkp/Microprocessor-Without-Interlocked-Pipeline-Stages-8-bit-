`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:08 08/11/2017 
// Design Name: 
// Module Name:    PC_IM 
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
module PC_IM(
    output [23:0] ins,
    output [7:0] Current_Address,
    input [7:0] jmp_loc,
    input pc_mux_sel,
    input Stall,
    input Stall_pm,
    input clk,
    input reset
    );
	 
	 
	 wire [7:0]CAJ,CAR,stall_mux,pc_mux,stall_reset,IA;
	 
	 wire [23:0] PM_out,ins_pm,stall_pm_mux,PM_reset;
	 
	 reg [7:0] Next_Address,Hold_Address;
	 
	 reg[23:0] ins_prv;
	 
	 assign stall_mux = (Stall==1'b0)?Next_Address:Hold_Address;

	 assign CAJ = stall_mux;
    
	 assign pc_mux = (pc_mux_sel==1'b0)?CAJ:jmp_loc;
		
	 assign CAR = pc_mux;

	 assign stall_pm_mux = (Stall_pm==1'b0)?PM_out:ins_prv;
	 
	 assign ins_pm = stall_pm_mux;
	 
	 
	 assign stall_reset = (reset==1'b0)?8'b0000_0000:CAR;
	 
	 
	 assign PM_reset = (reset==1'b0)?24'b0000_0000_0000_0000_0000_0000:ins_pm;
	 
	 assign ins = PM_reset;
	 
	 assign Current_Address = stall_reset;
	 
	 add_sub_8bit inst1(IA,,,stall_reset,8'b0000_0001,1'b0);
	 
	 

Program_Memory pm (
  .clka(clk), // input clka
  .addra(Current_Address), // input [7 : 0] addra
  .douta(PM_out) // output [23 : 0] douta
);

	
		 
	 always@(posedge clk)
	 begin
	 if(reset==1'b1)
	 begin
		Hold_Address <= stall_reset;
		Next_Address <= IA;
		ins_prv <= ins;
	 end
	 else
	 begin
		Hold_Address <= 8'b0000_0000;
		Next_Address <= 8'b0000_0000;
		ins_prv <= 24'b0000_0000_0000_0000_0000_0000;
	 end
	 
	 
	 end



endmodule
