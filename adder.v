module adder(input [31:0] ra, input [31:0] rb, input cin, output reg [31:0] sum, output reg cout);
	reg cout1;
	
	cla_16 instance1(.ra(ra[15:0]), .rb(rb[15:0]), .cin(cin), .sum(sum[15:0]), .cout(cout1));
	cla_16 instance2(.ra(ra[31:16]), .rb(rb[31:16]), .cin(cout1), .sum(sum[31:16]), .cout(cout));
endmodule	
	
module cla_4(input [3:0] ra, input [3:0] rb, input cin, output reg [3:0] sum, output reg cout);
	reg [3:0] p, g, c;
	
	assign p = ra^rb;
	assign g = ra&rb;
	
	assign c[0] = cin;
	assign c[1] = g[0] | (p[0]&c[0]);
	assign c[2] = g[1] | (p[1]&g[0]) | (p[1]&p[0]&c[0]);
	assign c[3] = g[2] | (p[2]&g[1]) | (p[2]&p[1]&g[0]) | (p[2]&p[1]&p[0]&c[0]);
	assign cout = g[3] | (p[3]&g[2]) | (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0]) | (p[3]&p[2]&p[1]&p[0]&c[0]);
	assign sum = p^c;
endmodule

module cla_16(input [15:0] ra, input [15:0] rb, input cin, output reg [15:0] sum, output reg cout);
	reg cout1, cout2, cout3;

	cla_4 instance1(.ra(ra[3:0]), .rb(rb[3:0]), .cin(cin), .sum(sum[3:0]), .cout(cout1));
	cla_4 instance2(.ra(ra[7:4]), .rb(rb[7:4]), .cin(cout1), .sum(sum[7:4]), .cout(cout2));
	cla_4 instance3(.ra(ra[11:8]), .rb(rb[11:8]), .cin(cout2), .sum(sum[7:4]), .cout(cout3));
	cla_4 instance4(.ra(ra[15:12]), .rb([15:12]), .cin(cout3), .cum(sum[15:12]), .cout(cout));
endmodule
	