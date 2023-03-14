module mar(input [31:0] d, output reg [8:0] q, input le, clk, clr) 
	always@(posedge clk)begin 
		q <= d[8:0];
	end
endmodule