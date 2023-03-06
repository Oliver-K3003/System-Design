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
	
	always@(posedge clk)begin 
		//load - good
		b <= 32'd14;
		y <= 32'd4;
		opcode <= 5'b0000;
		
		//add - good
		#100
		b <= 32'h00000012;
		y <= 32'h00000014;
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
		
		//shra - good
		#100
		b <= 32'hF0000000;
		y <= 32'h00000004;
		opcode <= 5'b01000;
		
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
		
		//div - good
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