`timescale 1ns/1ps

module select_encodetb();
	reg Gra, Grb, Grc, Rin, Rout, BAout;
	reg [31:0] IRin;
	wire [15:0] registersIn, registersOut;
	wire [31:0] CsignExt;
	selectAndEncode selogic(Gra, Grb, Grc, Rin, Rout, BAout, IRin, registersIn, registersOut, CsignExt);

	initial begin 
	IRin <= 31'h12000090;
	#10
	Gra <= 1; Rin <= 1;
	
	#15 Grb <= 0; BAout <= 0;
	
	end
	
endmodule