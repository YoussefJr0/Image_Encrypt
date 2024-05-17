`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:22:40 05/16/2024 
// Design Name: 
// Module Name:    main 
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
module main(
	input wire clk,
	input wire load,
	input wire [63:0]key,
	output wire encryption
    );

	wire [2:0]trigger;
	wire x_maj,y_maj,z_maj;
	wire x_out,y_out,z_out;
	wire [0:2] maj_triggers;

	X_Register x_reg(clk,trigger[0],key[18:0],load,x_out,x_maj);
	Y_Register y_reg(clk,trigger[1],key[40:19],load,y_out,y_maj);
	Z_Register z_reg(clk,trigger[2],key[63:41],load,z_out,z_maj);

	Majority maj(x_maj,y_maj,z_maj,trigger);

	assign encryption = x_out ^ y_out ^ z_out;
	
endmodule
