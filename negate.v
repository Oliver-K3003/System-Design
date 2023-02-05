module negate(input [31:0] in, output wire [31:0] out);
	assign out = ~in + 1'b1; //2s complement
endmodule