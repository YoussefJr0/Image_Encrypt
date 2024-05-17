`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:26:02 05/17/2024
// Design Name:   main
// Module Name:   C:/Users/Youssef/Desktop/Image_Encrypt/Image_Encrypt/A5_1/A5_1_testbench.v
// Project Name:  A5_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module A5_1_testbench;

	// Inputs
	reg load;
	reg clk;
	reg [63:0] secret_key;
	reg[7:0] inp_im[65535:0];
	reg[7:0] out_im[65535:0];
	// Outputs
	wire encryption;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.load(load),
		.key(secret_key),
		.encryption(encryption)
	);

initial 
begin
    clk = 1'b1;
    forever
        #5 clk = ~clk;
end

initial
begin
    secret_key = 64'b0110100001100001011100100110010001110111011000010111001001100101;
    $readmemb("D:\\imageEncryption\\Image_Encrypt\\python_codes\\img.txt",inp_im);
end

integer i,j;
	initial 
	begin
		#5
		load = 1;
		#10
		load = 0;
		for(i=0;i<65536;i=i+1)
		begin 
			for(j=0;j<8;j=j+1)
				begin
					#10
					out_im[i][j] = encryption ^ inp_im[i][j];
				end
			  $display("input : %b  output : %b int : %d",inp_im[i],out_im[i],i);
		 end
		 $writememb("D:\\imageEncryption\\Image_Encrypt\\python_codes\\output.txt",out_im);
		 #10 $finish;
	end
	
endmodule

