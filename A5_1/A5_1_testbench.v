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
	reg clk;
	reg reset;
	reg shift_bit;
	reg [63:0] secret_key;
	reg [21:0] public_key;

	// Outputs
	wire encryption;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.reset(reset),
		.shift_bit(shift_bit),
		.secret_key(secret_key), 
		.public_key(public_key), 
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
    public_key = 22'b1101001110000110010001;
    $readmemb("C:\Users\Youssef\Desktop\Image_Encrypt\Image_Encrypt\python codes\img.txt",inp_im);
end

integer i,j;
	initial 
	begin
		 #5
		 reset = 1'b0;
		 trigger = 3'b111;
		 #10
		 reset = 1'b1;
		 for(i=0;i<64;i=i+1)
		 begin
		 shift_bit = secret_key[i];
		 #10;
		 end
		 for(i=0;i<22;i=i+1)
		 begin
		 #10 
		 shift_bit = public_key[i];
		 end
		 shift_bit = 1'b0;
		 trigger = 3'b000;
		 for(i=0;i<100;i=i+1)
		 begin
			  #10
			  x_maj = X[8];
			  y_maj = Y[10];
			  z_maj = Z[10];
			  trigger = maj_triggers;
		 end
		 #1000
		 for(i=0;i<65536;i=i+1)
		 begin
			  for(j=0;j<8;j=j+1)
			  begin
			  #10 
			  x_maj = x[8];
			  y_maj = y[10];
			  z_maj = z[10];
			  triggers = maj_triggers;
			  out_im[i][j] = X[18]^Y[21]^Z[22]^inp_im[i][j];
			  end
			  $display("input : %b  output : %b int : %d",inp_im[i],out_im[i],i);
		 end
		 $writememb("C:\Users\Youssef\Desktop\Image_Encrypt\Image_Encrypt\python codes\output.txt",out_im);
		 #10 $finish;
	end
      
endmodule

