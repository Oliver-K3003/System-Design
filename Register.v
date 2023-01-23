module Register(d, q, clr, clk, le);
	input [31:0] d;
	input clr, clk, le;
	output reg [31:0] q;
	
	
	// assign
	//Assuming active high & async clear
	always @ (clk or clr or le)
		begin
			if(clr == 1 && le == 1)
				q <= 0;
			else if(clk && le)
				q <= d;
		end
endmodule
