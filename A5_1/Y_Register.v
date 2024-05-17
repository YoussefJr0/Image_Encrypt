`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:17 05/17/2024 
// Design Name: 
// Module Name:    Y_Register 
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
module Y_Register(
		input wire clk,
		input wire shift_bit,
		input wire trigger,
		input wire reset,
		output wire out_reg,
		output wire y_maj
    );

	
	reg [21:0] y_reg;
	wire [21:0] y_next;

	wire xored;

	assign xored = y_reg[21] ^ y_reg[20];

	// Current State Logic
	always @(posedge clk,posedge reset)
	begin
		if (reset)
			y_reg = 22'b0;
		else if (trigger)
			y_reg = y_next;
	end
	
	// Next State Logic 
	assign y_next = {y_reg[21:1],xored ^ shift_bit};

	assign y_maj = y_reg[10];

	assign out_reg = y_reg[21];

endmodule
