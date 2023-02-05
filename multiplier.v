module multiplier(input [31:0] m, input [31:0] q, output reg [63:0] out);

	reg [63:0] product;
	reg [4:0] count; 
	reg [2:0] compare;

	initial begin 
		product = 0;
		out = 0;
		count = 5'd0;
		compare[2] = q[1];
		compare[1] = q[0];
		compare[0] = 1'b0;
	end

	always@(*) begin 
		for (count = 0; count<=15; count = count +1)begin
			//check the case for the recoding
			case(compare)
				3'b001 : product = product + m; //+1*M
				3'b010 : product = product + m; //+1*M
				3'b011 : product = product + m<<1; //+2*M
				3'b100 : product = product - m<<1; //-2*M
				3'b101 : product = product - m; //-1*M
				3'b110 : product = product - m; //-1*M
				default : product = product;
			endcase
			//move to the next value
			compare[2] = q[count+2];
			compare[1] = q[count+1];
			compare [0] = q[count];
			product = product << 1;
		end
		out = product;
	end
endmodule
	
		