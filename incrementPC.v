module incrementPC(
	input clk, IncPC, PCen,
	input [31:0] inPC,
	output reg[31:0] outPC
);
	initial outPC = 32'd0;
	
	always @(posedge clk)begin 
		if(IncPC == 1 && PCen)
			outPC <= outPC + 1;
		else if(PCen)
			outPC <= inPC;
	end
endmodule