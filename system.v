`timescale 1ns/10ps
//Test register
module R1(d, q, clr, clk, enable);
	input [31:0] d, clr, clk, enable;
	output [31:0] q;
	//Assuming active high & async clear
	always @ (posedge clk or posedge clr or posedge enable)
		if(clr and enable)
			q <= 0;
		else if(clk and enable)
			q <= d;
	end;