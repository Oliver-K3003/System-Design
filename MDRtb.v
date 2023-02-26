`timescale 1ns/10ps

module MDRtb();
	reg clk, clr, MDRin, read;
	reg [31:0] busMuxOut, Mdatain;
	wire [31:0] q;
	
	MDR mdr(clr, clk, MDRin, read, busMuxOut, Mdatain, q);
	
	initial begin 
		clk = 1;
		
		Mdatain <= 32'h00000012;
		read <= 1;
		MDRin <=1;
		clr <= 0;
		
		#10
		clk = 0;
		#10
		clk = 1;
		
	end
endmodule