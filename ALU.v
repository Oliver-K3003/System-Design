module ALU(
	input clk, clr, IncPC,
	
	input wire [31:0] b,
	input wire [31:0] y,
	
	input wire [4:0] opcode,
	
	output reg [63:0] c
);

	parameter load=5'b00000, loadi=5'b00001, store=5'b00010, add=5'b00011, sub=5'b00100, AND=5'b00101, OR=5'b00110, shr=5'b00111, shra=5'b01000, 
					shl=5'b01001, ror=5'b01010, rol=5'b01011, addi=5'b01100, andi=5'b01101, ori=5'b01110, mul=5'b01111, div=5'b10000, neg=5'b10001, 
					NOT=5'b10010;
					
	wire [31:0] div_hi_out, div_lo_out, IncPC_out, add_out, sub_out, add_cout, sub_cout, and_out, or_out, shr_out, shra_out, shl_out, ror_out, rol_out, neg_out, not_out;
	wire [63:0] mul_out;
	
	always@(*) begin 
		case(opcode) 
			load, loadi, store: begin 
				c[31:0] <= add_out[31:0];
				c[63:32] <= 32'd0;
			end
			add: begin 
				c[31:0] <= add_out[31:0];
				c[63:32] <= 32'd0;
			end
			sub: begin 
				c[31:0] <= sub_out[31:0];
				c[63:32] <= 32'd0;
			end
			AND, andi: begin 
				c[31:0] <= and_out[31:0];
				c[63:32] <= 32'd0;
			end
			OR, ori: begin 
				c[31:0] <= or_out[31:0];
				c[63:32] <= 32'd0;
			end
			shr, shra: begin 
				c[31:0] <= shr_out[31:0];
				c[63:32] <= 32'd0;
			end
			shl: begin 
				c[31:0] <= shl_out[31:0];
				c[63:32] <= 32'd0;
			end
			ror: begin 
				c[31:0] <= ror_out[31:0];
				c[63:32] <= 32'd0;
			end
			rol: begin 
				c[31:0] <= rol_out[31:0];
				c[63:32] <= 32'd0;
			end
			addi: begin 
				c[31:0] <= add_out[31:0];
				c[63:32] <= 32'd0;
			end
			mul: begin 
				c[63:0] <= mul_out[63:0];
			end
			div: begin 
				c[31:0] <= div_lo_out[31:0];
				c[63:32] <= div_hi_out[31:0];
			end
			neg: begin 
				c[31:0] <= neg_out[31:0];
				c[63:32] <= 32'd0;
			end
			NOT: begin 
				c[31:0] <= not_out[31:0];
				c[63:32] <= 32'd0;
			end
			default: begin 
				c[63:0] <= 64'd0;
			end
		endcase
		end
		//Operations
		adder add_instance(.ra(y), .rb(b), .cin(1'd0), .sum(add_out), .cout(add_cout));
		sub sub_instance(.ra(y), .rb(b), .cin(1'd0), .sum(sub_out), .count(sub_cout));
		log_and_32bit land_instance(y, b, and_out);
		log_or_32bit lor_instance(y, b, or_out);
		shift_right shr_instance(y, b, shr_out);
		shift_left shl_instance(y, b, shl_out);
		rotate_right ror_instance(y, b, ror_out);
		rotate_left rol_instance(y, b, rol_out);
		multiplier mul_instance(y, b, mul_out);
		division div_instance(y, b, div_hi_out, div_lo_out);
		negate neg_instance(b, neg_out);
		not_32 not_instance(b, not_out);
	
endmodule