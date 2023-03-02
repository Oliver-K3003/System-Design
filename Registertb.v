`timescale 1ns/10ps
module Registertb(input a, output b);

	reg[31:0] in;
	wire[31:0] result;
	reg clr, clk, le;
	Register R1(in, result, clr, clk, le);
	
	initial
		begin
			
			clk = 0;
			forever #10 clk = ~clk;
			
			
		end
		
		always @(posedge clk)
			begin
			le <= 1;
			clr <= 0;
			#100 in <= 32'd203;
			#100 in <= 32'd15;
			end
		
endmodule