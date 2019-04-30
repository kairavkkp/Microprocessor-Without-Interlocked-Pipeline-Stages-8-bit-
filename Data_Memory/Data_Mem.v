`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:12:10 08/18/2017 
// Design Name: 
// Module Name:    Data_Mem 
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
module Data_Mem(
    input [7:0] ans_ex,
    input [7:0] DM_data,
    input mem_rw_ex,
    input mem_en_ex,
    input mem_mux_sel_dm,
    input reset,
    input clk,
    output [7:0] ans_dm
    );
	reg [7:0] Ex_out;
	wire [7:0] DM_out;

	Data_Mem_IP_Core your_instance_name (
  .clka(clk), // input clka
  .ena(mem_en_ex), // input ena
  .wea(mem_rw_ex), // input [0 : 0] wea
  .addra(ans_ex), // input [7 : 0] addra
  .dina(DM_data), // input [7 : 0] dina
  .douta(DM_out) // output [7 : 0] douta
);


	always@(posedge clk)
	begin
		if(reset==1'b1)
			Ex_out <= ans_ex;
			
		else
			Ex_out <= 8'b0000_0000;	
	end
	
	
	assign ans_dm = (mem_mux_sel_dm==1'b0)?Ex_out:DM_out;



endmodule
