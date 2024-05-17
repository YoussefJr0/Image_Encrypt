`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:54 05/17/2024 
// Design Name: 
// Module Name:    Z_Register 
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
module Z_Register(
		input wire clk,
		input wire trigger,
		input wire [22:0]key,
		input wire load,
		output wire out_reg,
		output wire z_maj
//		output wire [22:0]z

    );
	
	
	reg [22:0] z_reg;
	wire [22:0] z_next;

	wire xored;

	assign xored = z_reg[22] ^ z_reg[21] ^ z_reg[20] ^ z_reg[7];

	// Current State Logic
	always @(posedge clk)
	begin
		if (load)
			z_reg = key;
		else if (trigger)
			z_reg = z_next;
	end
	
	// Next State Logic 
	assign z_next = {z_reg[21:0],xored};

	assign z_maj = z_reg[10];

	assign out_reg = z_reg[22];

//	assign z = z_reg;

endmodule
