`timescale 1ns/10ps

module phase4tb();
	wire IncPC, Write, Run;
	reg Clock, Reset, Stop;
	reg [31:0] inportInput;
	wire [31:0] busMuxOut;
	wire [7:0] present_state, seg0out, seg1out;
	
	datapath DUT(IncPC, Write, Run, Clock, Reset, Stop, inportInput, busMuxOut, present_state, seg0out, seg1out);
		
		initial begin 
			Clock=0;
			forever #10 Clock =~Clock;
			inportInput = 32'h00000088;
		end
		
endmodule