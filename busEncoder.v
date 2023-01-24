module busEncoder(en, in, out);
	input en;
	input [31:0] in;
	output reg [4:0]out;
	always @(en, in)
	begin
		if(en==1)
			begin
				if(in[31]==1)      out=5'b11111;
				else if(in[30]==1) out=5'b11110;
				else if(in[29]==1) out=5'b11101;
				else if(in[28]==1) out=5'b11100;
				else if(in[27]==1) out=5'b11011;
				else if(in[26]==1) out=5'b11010;
				else if(in[25]==1) out=5'b11001;
				else if(in[24]==1) out=5'b11000;
				//This is for all the connections (above connections can be used for other things if needed)
				else if(in[23]==1) out=5'b10111;
				else if(in[22]==1) out=5'b10110;
				else if(in[21]==1) out=5'b10101;
				else if(in[20]==1) out=5'b10100;
				else if(in[19]==1) out=5'b10011;
				else if(in[18]==1) out=5'b10010;
				else if(in[17]==1) out=5'b10001;
				else if(in[16]==1) out=5'b10000;
				else if(in[15]==1) out=5'b01111;
				else if(in[14]==1) out=5'b01110;
				else if(in[13]==1) out=5'b01101;
				else if(in[12]==1) out=5'b01100;
				else if(in[11]==1) out=5'b01011;
				else if(in[10]==1) out=5'b01010;
				else if(in[9]==1)  out=5'b01001;
				else if(in[8]==1)  out=5'b01000;
				else if(in[7]==1)  out=5'b00111;
				else if(in[6]==1)  out=5'b00110;
				else if(in[5]==1)  out=5'b00101;
				else if(in[4]==1)  out=5'b00100;
				else if(in[3]==1)  out=5'b00011;
				else if(in[2]==1)  out=5'b00010;
				else if(in[1]==1)  out=5'b00001;
				//default value if nothing is selected (no bus driver)
				else   			  out=5'b00000;
			end
			//high impedance fallthrough if the encoder enable is zero
		else	out=5'bzzzzz;
	end
endmodule

/*
module encoder_32_5(input [31:0] input, output [4:0] output);
    always_comb begin
        case (input)
            32'b00000: output = 5'b00000;
            32'b00001: output = 5'b00001;
            32'b00010: output = 5'b00010;
            // ...
            32'b11111: output = 5'b11111;
            default: output = 5'b00000;
        endcase
    end
endmodule
*/