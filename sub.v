module sub(input [31:0]ra, input [31:0]rb, input cin, output reg[31:0]sum, output reg cout);
	wire [31:0] negatedVal;
	negate negate_instance(.in(rb), .out(negatedVal));
	adder adder_instance(.ra(ra), .rb(negatedVal), .cin(cin), .sum(sum), .cout(cout));
endmodule	