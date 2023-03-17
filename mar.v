module mar(input [31:0] d, output [8:0] q, input le, clk, clr); 
	wire [31:0] marData;
	
	Register MAR(d, marData, clr, clk, le);
	
	assign q = marData[8:0];
endmodule