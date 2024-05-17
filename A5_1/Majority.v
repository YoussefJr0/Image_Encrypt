`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:50 05/17/2024 
// Design Name: 
// Module Name:    Majority 
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
module Majority(
		input wire x,
		input wire y,
		input wire z,
		output reg [2:0]trigger
    );
	wire majority;
	assign majority = (x & y) | (x & z) | (y & z);
	
	always @*
	begin
		trigger = {majority == x,majority == y,majority == z};
	end
endmodule
