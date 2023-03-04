// module division(input signed [31:0] dividend, input signed [31:0] divisor, output reg[31:0]quotient, output reg[31:0]remainder);
// 	always@(divisor or dividend) begin
// 		quotient <= (dividend - (dividend%divisor))/divisor;
// 		remainder <= dividend % divisor;
// 	end
// endmodule

//non-restoring division -> Bonus?
module division(input signed [31:0] dividend, input signed [31:0] divisor, output reg[63:0] out);
	reg signed [32:0] a;
	reg signed [31:0] q;
	integer i;
	
	always@(*) begin
		a = {32'd0, 1'b0};
		q = dividend[31:0];
		for(i=0;i<32;i=i+1) begin
			a = a << 1;
			a[0] = q[31];
			if(a[32] == 1) begin
				a = a + divisor;
			end
			else begin
				a = a - divisor;
			end
			if(a[32] == 1) begin
				q = {q[30:0], 1'b0};
			end
			else begin
				q = {q[30:0], 1'b1};
			end
		end
		if (a[32] == 1) begin
			a = a + divisor;
		end
		out = {q[31:0], a[31:0]};
	end
endmodule