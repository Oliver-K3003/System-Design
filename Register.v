module Register(
	input [31:0] d, 
	output reg [31:0] q, 
	input clr, 
	input clk, 
	input le);
		// assign
	//Assuming active high & async clear
	
	always @ (posedge clk)
		begin
			if(le == 1)
				q <= d;
			else if(clr == 1 && le == 1)
				q <= 31'd0;
		end
endmodule
