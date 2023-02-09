module division(input signed [31:0] dividend, input signed [31:0] divisor, output reg[31:0]quotient, output reg[31:0]remainder);
	always@(divisor or dividend) begin
		quotient <= (dividend - (dividend%divisor))/divisor;
		remainder <= dividend % divisor;
	end
endmodule