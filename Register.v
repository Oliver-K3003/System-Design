module Register(
	input [31:0] d, 
	output reg [31:0] q, 
	input clr, 
	input clk, 
	input le);
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
