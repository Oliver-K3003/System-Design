module multiplier(input signed [31:0] m, input signed [31:0] q, output reg [63:0] out);

	reg [63:0] product;
	integer i, j; 
	reg [2:0] compare [15:0];
	reg [31:0] add [15:0];
	reg [63:0] signed_add [15:0];

	//sign extend and swap
	wire [32:0]sub_m;
	assign sub_m = {~m[31], ~m}+1;
	
	always@(*) begin 
	
		compare[0] = {q[1], q[0], 1'b0};
		for (i=1; i < 16; i = i +1)begin 
			compare[i] = {q[2*i+1], q[2*i], q[2*i-1]};
		end
	
		for (i = 0; i<16; i = i +1)begin
			//check the case for the recoding
			case(compare[i])
				3'b001 : add[i] = {m[31], m}; //+1*M
				3'b010 : add[i] = {m[31],m}; //+1*M
				3'b011 : add[i] = {m, 1'b0}; //+2*M
				3'b100 : add[i] = {sub_m, 1'b0}; //-2*M
				3'b101 : add[i] = sub_m; //-1*M
				3'b110 : add[i] = sub_m; //-1*M
				default : add[i] = 0;
			endcase
			signed_add[i] = $signed(add[i]);
			
			for(j=0; j<i; j=j+1)begin 
				signed_add[i] = {signed_add[i], 2'b00};
			end
		end
		product = signed_add[0];
		for(i = 1; i<16; i=i+1)begin 
				product = product + signed_add[i];
		end
		out = product;
	end
endmodule

	
		