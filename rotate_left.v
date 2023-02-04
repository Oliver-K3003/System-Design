module rotate_left(input [31:0] in, input [31:0] rotate_amount, output reg [31:0] out);
	assign out = (in << rotate_amount) | (in >> (32-rotate_amount));
endmodule