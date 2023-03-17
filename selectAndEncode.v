module selectAndEncode(
	input Gra, Grb, Grc, Rin, Rout, BAout,
	input [31:0] IRin,
	output [15:0] registersIn, registersOut,
	output signed [31:0] CsignExt
);
	wire [3:0] orIna, orInb, orInc, decodeIn;
	wire [15:0] decodeOut;
	assign orIna = {4{Gra}}&IRin[26:23];
	assign orInb = {4{Grb}}&IRin[22:19];
	assign orInc = {4{Grc}}&IRin[18:15];

	assign decodeIn = orIna|orInb|orInc;

	decoder4to16 decoder(decodeIn, decodeOut);

	assign registersIn = {16{Rin}} & decodeOut;
	assign registersOut = {16{Rout}} | {16{BAout}} & decodeOut;
	
	assign CsignExt = { {14{IRin[17]}}, IRin[17:0]};
	
endmodule

module decoder4to16(
	input [3:0] in,
	output reg [15:0] out
);
	always@(in) begin
		case(in)
			0000 : out <= 16'h0001;
			0001 : out <= 16'h0002;
			0010 : out <= 16'h0004;
			0011 : out <= 16'h0008;
			0100 : out <= 16'h0010;
			0101 : out <= 16'h0020;
			0110 : out <= 16'h0040;
			0111 : out <= 16'h0080;
			1000 : out <= 16'h0100;
			1001 : out <= 16'h0200;
			1010 : out <= 16'h0400;
			1011 : out <= 16'h0800;
			1100 : out <= 16'h1000;
			1101 : out <= 16'h2000;
			1110 : out <= 16'h4000;
			1111 : out <= 16'h8000;
			default : out <= 16'd0;
		endcase
	end
endmodule