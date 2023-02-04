module busMUX(
			  // general purpose registers
			  input [31:0] r0, 
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
			  
			  // select signal
			  input [4:0] sel,
			  
			  // mux output register
			  output reg [31:0] muxOut);

	always @(*) begin
		case (sel)
			5'b00001 : muxOut <= r1[31:0];
			5'b00010 : muxOut <= r2[31:0];
			5'b00011 : muxOut <= r3[31:0];
			5'b00100 : muxOut <= r4[31:0];
			5'b00101 : muxOut <= r5[31:0];
			5'b00110 : muxOut <= r6[31:0];
			5'b00111 : muxOut <= r7[31:0];
			5'b01000 : muxOut <= r8[31:0];
			5'b01001 : muxOut <= r9[31:0];
			5'b01010 : muxOut <= r10[31:0];
			5'b01011 : muxOut <= r11[31:0];
			5'b01100 : muxOut <= r12[31:0];
			5'b01101 : muxOut <= r13[31:0];
			5'b01110 : muxOut <= r14[31:0];
			5'b01111 : muxOut <= r15[31:0];
			5'b10000 : muxOut <= hi[31:0];
			5'b10001 : muxOut <= lo[31:0];
			5'b10010 : muxOut <= zhi[31:0];
			5'b10011 : muxOut <= zlo[31:0];
			5'b10100 : muxOut <= pc[31:0];
			5'b10101 : muxOut <= mdr[31:0];
			5'b10110 : muxOut <= inport[31:0];
			5'b10111 : muxOut <= signExt[31:0];
			default: muxOut <= 32'd0;
		endcase
	end
endmodule