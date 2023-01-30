`timescale 1ns/10ps

module busEncoder_tb;

	reg[31:0] in;
	reg en;
	wire[4:0] out;
	
	busEncoder busEncoder_instance(in, en, out);
	
	initial
		begin
			in <= 31'd1;
			en <= 31'd1;
			
			#200
			
			in <= 31'd10;
			
		end

endmodule