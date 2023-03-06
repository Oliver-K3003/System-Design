module shift_right_arithmetic(input signed [31:0] in, input [31:0] shift_amount, output signed [31:0] out);
	assign out = in >>> shift_amount;
endmodule