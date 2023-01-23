`timescale 1ns/10ps
module registertb();

	reg[31:0] in;
	wire[31:0] result;
	reg clr, clk, le;
	Register R1(in, result, clr, clk, le);
	
	initial
		begin
			clr <= 1'b1;
			clk <= 1'b1;
			le <= 1'b1;
			
			#100 in <= 32'd203;
			
		end
endmodule