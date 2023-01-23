module busEncoder(en, in, out);
	input en;
	input [31:0] in;
	output reg [4:0]out;
	always(@en, in)
	begin
		if(en==1)
			begin
				if(i[31==1])      out=5'b11111;
				else if(i[30]==1) out=5'b11110;
				else if(i[29]==1) out=5'b11101;
				else if(i[28]==1) out=5'b11100;
				else if(i[27]==1) out=5'b11011;
				else if(i[26]==1) out=5'b11010;
				else if(i[25]==1) out=5'b11001;
				else if(i[24]==1) out=5'b11000;
				else if(i[23]==1) out=5'b10111;
				else if(i[22]==1) out=5'b10110;
				else if(i[21]==1) out=5'b10101;
				else if(i[20]==1) out=5'b10100;
				else if(i[19]==1) out=5'b10011;
				else if(i[18]==1) out=5'b10010;
				else if(i[17]==1) out=5'b10001;
				else if(i[16]==1) out=5'b10000;
				else if(i[15]==1) out=5'b01111;
				else if(i[14]==1) out=5'b01110;
				else if(i[13]==1) out=5'b01101;
				else if(i[12]==1) out=5'b01100;
				else if(i[11]==1) out=5'b01011;
				else if(i[10]==1) out=5'b01010;
				else if(i[9]==1)  out=5'b01001;
				else if(i[8]==1)  out=5'b01000;
				else if(i[7]==1)  out=5'b00111;
				else if(i[6]==1)  out=5'b00110;
				else if(i[5]==1)  out=5'b00101;
				else if(i[4]==1)  out=5'b00100;
				else if(i[3]==1)  out=5'b00011;
				else if(i[2]==1)  out=5'b00010;
				else if(i[1]==1)  out=5'b00001;
				else   			  out=5'b00000;
			end
		else	out=5'bzzzzz;
	end
endmodule

module busMUX(r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, hi, lo, zhi, zlo, pc, mdr, inport, signExt, muxOut);
	input reg [31..0] r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,hi,lo,zhi,zlo,pc,mdr,inport,signExt;
	output reg [31..0] muxOut;