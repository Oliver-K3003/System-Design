module negate(input [31:0] in, output reg [31:0] out);
	assign out = ~input + 1'b1; //2s complement
endmodule