`timescale 1ns/10ps

module addertb();
	reg [31:0] ra, rb;
	reg cin;
	wire [31:0] sum; 
	wire cout;
	adder adder_instance(ra, rb, cin, sum, cout);
	
	initial begin
		ra <= 12;
		rb <= 7;
		cin <=0;
		
		#200
		ra <= 15;
		rb <= -22;
		cin <=0;
		
		#200
		ra <= -12;
		rb <= 12;
		cin <=0;
		
		#200
		ra <= -6;
		rb <= -6;
		cin <= 0;
	end
endmodule