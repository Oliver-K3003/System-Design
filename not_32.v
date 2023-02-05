module not_32(input [31:0] in, output wire [31:0] out);
	assign out = ~in;
endmodule