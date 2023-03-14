module selectAndEncode(
	input Gra, Grb, Grc, Rin, Rout, BAout,
	input [31:0] IRin,
	output [15:0] registersIn, regsitersOut,
	output signed [31:0] CsignExt
);
	wire [3:0] orIna, orInb, orInc, decodeIn;
	wire [16:0] decodeOut;
	AND(orIna, Gra, IRin[26:23]);
	AND(orInb, Grb, IRin[22:19]);
	AND(orInc, Grc, IRin[18:15]);

	OR(decodeIn, orIna, orInb, orInc);

	decoder4to16 decoder(decodeIn, decodeOut);

	always@(Rin or Rout or BAout)begin 
		if(Rin)begin 
			registersIn <= decodeOut & 16'hFFFF;
		end else if (Rout or BAout) begin 
			regsitersOut <= decodeOut & 16'hFFFF;
		end
	end

	assign CsignExt = { {14{IRin[17]}}, IRin[17:0]}
	
endmodule

module decoder4to16(
	input [3:0] in,
	output reg [15:0] out
);
	always@(in) begin
		case(in)
			0001 : out <= 16'h0001;
			0010 : out <= 16'h0002;
			0011 : out <= 16'h0004;
			0100 : out <= 16'h0008;
			0101 : out <= 16'h0010;
			0110 : out <= 16'h0020;
			0111 : out <= 16'h0040;
			1000 : out <= 16'h0080;
			1001 : out <= 16'h0100;
			1010 : out <= 16'h0200;
			1011 : out <= 16'h0400;
			1100 : out <= 16'h0800;
			1101 : out <= 16'h1000;
			1110 : out <= 16'h2000;
			1111 : out <= 16'h4000;
			default : out <= 16'd0;
		endcase
	end
endmodule