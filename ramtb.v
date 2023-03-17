`timescale 1ns/10ps

module ramtb();
	wire [31:0] data;
	reg [8:0] address;
	reg we, clk;
	wire [31:0] q;
	ram memory(data, address, we, clk, q);
	
	initial begin 
		clk = 0;
		we = 0;
		forever #10 clk = ~clk;
	end
	
	always@(posedge clk)begin 
		address <= 9'd0;
	end

endmodule 