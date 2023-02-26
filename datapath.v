module datapath(
	input PCout, ZLOout, MDRout, R2out, R4out, MARin, Zin, PCin, MDRin, IRin, Yin, IncPC, Read, AND, R1in, R2in, R3in, Clock,
	/*input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	input HIout, LOout, ZHIout, ZLOout, PCout, MDRout, Inportout, signExtout,
	input read, clk, clr,*/
	input [31:0] Mdatain
);
	wire [31:0] busMuxOut;
	wire [4:0] encoderOut;
	wire [31:0] encoderIn;
	wire clr;
	assign clr = 0;
	assign encoderIn = {10'd0, MDRout, PCout, ZLOout, 14'd0, R4out, 1'd0, R2out, 2'd0};
	wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, 
		BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInSignExt, BusMuxInY;
	wire [63:0] BusMuxInC;

	
	//initialize bus
	busEncoder encoder_instance(encoderIn, encoderOut);
	busMUX mux_instance(BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, 
		BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInSignExt, BusMuxInY, encoderOut, busMuxOut);
	//initialize registers
	//Register R0(busMuxOut, BuxMuxInR0, clr, clk, R0out);
	//Register R1(busMuxOut, BuxMuxInR1, clr, clk, R1out);
	Register R2(busMuxOut, BusMuxInR2, clr, Clock, R2in);
	//Register R3(busMuxOut, BuxMuxInR3, clr, clk, R3out);
	Register R4(busMuxOut, BusMuxInR4, clr, Clock, R4in);
	/*Register R5(busMuxOut, BuxMuxInR5, clr, clk, R5out);
	Register R6(busMuxOut, BuxMuxInR6, clr, clk, R6out);
	Register R7(busMuxOut, BuxMuxInR7, clr, clk, R7out);
	Register R8(busMuxOut, BuxMuxInR8, clr, clk, R8out);
	Register R9(busMuxOut, BuxMuxInR9, clr, clk, R9out);
	Register R10(busMuxOut, BuxMuxInR10, clr, clk, R10out);
	Register R11(busMuxOut, BuxMuxInR11, clr, clk, R11out);
	Register R12(busMuxOut, BuxMuxInR12, clr, clk, R12out);
	Register R13(busMuxOut, BuxMuxInR13, clr, clk, R13out);
	Register R14(busMuxOut, BuxMuxInR14, clr, clk, R14out);
	Register R15(busMuxOut, BuxMuxInR15, clr, clk, R15out);
	Register HI(busMuxOut, BuxMuxInHI, clr, clk, HIout);
	Register LO(busMuxOut, BuxMuxInLO, clr, clk, LOout);
	Register ZHI(busMuxOut, BuxMuxInZhi, clr, clk, ZHIout);*/
	//Register ZLO(busMuxOut, BuxMuxInZlo, clr, clk, ZLOout);
	Register PC(busMuxOut, BusMuxInPC, clr, Clock, PCin);
	MDR mdr(clr, clk, MDRin, Read, busMuxOut, Mdatain, BusMuxInMDR);
	//Register Inport(busMuxOut, BuxMuxInInport, clr, clk, Inportout);
	//Register SignExt(busMuxOut, BuxMuxInSignExt, clr, clk, SignExtout);
	Register Y(busMuxOut, BusMuxInY, clr, clk, Yout);
	//initialize ALU
	ALU ALU(clk, clr, IncPC, busMuxOut, BusMuxInY, Mdatain[31:27], BusMuxInC);

endmodule

	