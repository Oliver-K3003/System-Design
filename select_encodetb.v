`timescale 1ns/1ps

module select_encodetb();
	reg Gra, Grb, Grc, Rin, Rout, BAout;
	reg [31:0] IRin;
	wire [15:0] registersIn, registersOut;
	wire [31:0] CsignExt;
	selectAndEncode selogic(Gra, Grb, Grc, Rin, Rout, BAout, IRin, registersIn, registersOut, CsignExt);

	initial begin 
	IRin <= 31'h691ffffd; Gra<=0; Grb<=0; Grc<=0; BAout<=0;
	
	#15 Grb <= 1; Rout <= 1;
	#10 Grb <= 0; Rout <= 0;
	#15 Gra <= 1; Rin <= 1;
	end
	
endmodule