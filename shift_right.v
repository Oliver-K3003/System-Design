module shift_right(input [31:0] in, input [31:0] shift_amount, output wire [31:0] out);
	assign out = in>>shift_amount;
endmodule