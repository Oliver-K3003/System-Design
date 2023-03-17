module incrementPC(
	input clk, IncPC,
	input [31:0] inPC,
	output reg[31:0] outPC
);
	initial outPC = 32'd0;
	
	always @(posedge clk)begin 
		if(IncPC == 1)
			outPC <= outPC + 1;
		else
			outPC <= inPC;
	end
endmodule