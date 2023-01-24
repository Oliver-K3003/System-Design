module busMUX(input [31:0] r0, 
			  input [31:0] r1, 
			  input [31:0] r2, 
			  input [31:0] r3, 
			  input [31:0] r4, 
			  input [31:0] r5, 
			  input [31:0] r6, 
			  input [31:0] r7, 
			  input [31:0] r8, 
			  input [31:0] r9, 
			  input [31:0] r10, 
			  input [31:0] r11, 
			  input [31:0] r12, 
			  input [31:0] r13, 
			  input [31:0] r14, 
			  input [31:0] r15, 
			  input [31:0] hi, 
			  input [31:0] lo, 
			  input [31:0] zhi, 
			  input [31:0] zlo, 
			  input [31:0] pc, 
			  input [31:0] mdr, 
			  input [31:0] inport, 
			  input [31:0] signExt,
			  input [4:0] sel,
			  output reg [31:0] muxOut);

always @ (r0 or r1 or r2 or r3 or r5 or r6 or r7 or r8 or r9 or r10 or r11 or r12 or r13 or r14 or r15 or hi or lo or zhi or zlo or pc or mdr or inport or signExt or sel) 
begin
	case (sel)
		5'b00001 : muxOut <= r1;
		5'b00010 : muxOut <= r2;
		5'b00011 : muxOut <= r3;
		5'b00100 : muxOut <= r4;
		5'b00101 : muxOut <= r5;
		5'b00110 : muxOut <= r6;
		5'b00111 : muxOut <= r7;
		5'b01000 : muxOut <= r8;
		5'b01001 : muxOut <= r9;
		5'b01010 : muxOut <= r10;
		5'b01011 : muxOut <= r11;
		5'b01100 : muxOut <= r12;
		5'b01101 : muxOut <= r13;
		5'b01110 : muxOut <= r14;
		5'b01111 : muxOut <= r15;
		5'b10000 : muxOut <= hi;
		5'b10001 : muxOut <= lo;
		5'b10010 : muxOut <= zhi;
		5'b10011 : muxOut <= zlo;
		5'b10100 : muxOut <= pc;
		5'b10101 : muxOut <= mdr;
		5'b10110 : muxOut <= inport;
		5'b10111 : muxOut <= signExt;
	endcase
end
endmodule

/*
module mux32_1(
input [5:0] sel, // selector input, selects which input to forward
input [31:0] in, // 32 input signals
output reg out // output signal
);

always @(*) begin
  case (sel)
    6'b000000: out = in[0];
    6'b000001: out = in[1];
    6'b000010: out = in[2];
    ...
    6'b111111: out = in[31];
  endcase
end

endmodule
*/