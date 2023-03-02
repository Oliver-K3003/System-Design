`timescale 1ns/10ps

module ALUtb();
	reg clk, clr, incPC;
	reg [31:0] b;
	reg [31:0] y;
	reg [4:0] opcode;
	wire [31:0] z;
	ALU alu_instance(clk, clr, IncPC, b, y, opcode, z);
	
	initial begin 
		clr = 0;
		clk = 0;
		forever #10 clk = ~clk;
	end
	
	always@(*)begin 
		//load - good
		b <= 32'd14;
		y <= 32'd4;
		opcode <= 5'b0000;
		
		//add - good
		#100
		b <= 32'd123;
		y <= 32'd7;
		opcode <= 5'b00011;
		
		//sub - good
		#100
		b <= 32'd15;
		y <= 32'd4;
		opcode <= 5'b00100;
		
		//and - good
		#100
		b <= 32'h00000019;
		y <= 32'h00000053;
		opcode <= 5'b00101;
		
		//or - good
		#100
		b <= 32'h00000011;
		y <= 32'h000000F2;
		opcode <= 5'b00110;
		
		//shr - good
		#100
		b <= 32'h10000000;
		y <= 32'h00000001;
		opcode <= 5'b00111;
		
		//shl - good
		#100
		b <= 32'h00000001;
		y <= 32'h00000002;
		opcode <= 5'b01001;
		
		//mul - good
		#100
		b <= 32'd12;
		y <= 32'd4;
		opcode <= 5'b01111;
		
		//div - NOT SHOWING UPPER BITS???
		#100
		b <= 32'd12;
		y <= 32'd27;
		opcode <= 5'b10000;
		
		//neg - good
		#100
		b <= 32'd0;
		y <= 32'd5;
		opcode <= 5'b10001;
		
		//not - good
		#100
		b <= 32'd0;
		y <= 32'hFFFFFF00;
		opcode <= 5'b10010;
	end
	
endmodule

/*module ALU(
	input clk, clr, IncPC,
	
	input wire [31:0] b,
	input wire [31:0] y,
	
	input wire [4:0] opcode,
	
	output reg [63:0] z
);

	parameter load=5'b00000, loadi=5'b00001, store=5'b00010, add=5'b00011, sub=5'b00100, AND=5'b00101, OR=5'b00110, shr=5'b00111, shra=5'b01000, 
					shl=5'b01001, ror=5'b01010, rol=5'b01011, addi=5'b01100, andi=5'b01101, ori=5'b01110, mul=5'b01111, div=5'b10000, neg=5'b10001, 
					NOT=5'b10010;
					*/