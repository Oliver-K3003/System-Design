module not_32(input [31:0] in, output reg [31:0] out);
	assign out = ~in;
endmodule