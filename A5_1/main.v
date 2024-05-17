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
	input wire reset,
	input wire [63:0] secret_key,
	input wire [21:0] public_key,
	output wire encryption
    );

	reg shift_bit;
	wire [0:2] trigger;
	wire x_maj,y_maj,z_maj;
	wire x_out,y_out,z_out;
	wire [0:2] maj_triggers;

	X_Register x(clk,shift_bit,trigger[0],reset,x_out,x_maj);
	Y_Register y(clk,shift_bit,trigger[1],reset,y_out,y_maj);
	Z_Register z(clk,shift_bit,trigger[2],reset,z_out,z_maj);

	Majority maj(x_maj,y_maj,z_maj,trigger);


	assign encryption = x_out ^ y_out ^ z_out;

endmodule
