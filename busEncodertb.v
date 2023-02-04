`timescale 1ns/10ps

module busEncodertb;

	reg[31:0] in;
	//reg en;
	wire[4:0] out;
	
	busEncoder busEncoder_instance(in, /*en,*/ out);
	
	initial
		begin
			in <= 32'h00000001;
			//en <= 1;
			
			#200
			
			in <= 32'h00000008;
			
			#400
			
			//en <= 0;
			in <= 32'h00000001;
			
			#600
			
			//en <= 1;
			in <= 32'h00000010;
			
		end

endmodule