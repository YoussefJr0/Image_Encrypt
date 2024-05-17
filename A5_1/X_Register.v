`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:29 05/17/2024 
// Design Name: 
// Module Name:    X_Register 
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
module X_Register(
		input wire clk,
		input wire trigger,
		input wire [18:0]key,
		input wire load,
		output wire out_reg,
		output wire x_maj
//		output wire [18:0]x
    );

	reg [18:0] x_reg;
	wire [18:0] x_next;

	wire xored;

	assign xored = x_reg[18] ^ x_reg[17] ^ x_reg[16] ^ x_reg[13];

	// Current State Logic
	always @(posedge clk)
	begin
		if (load)
			x_reg = key;
		else if (trigger)
			x_reg = x_next;
	end
	
	// Next State Logic 
	assign x_next = {x_reg[17:0],xored};

	assign x_maj = x_reg[8];

	assign out_reg = x_reg[18];
	
//	assign x = x_reg;
endmodule
