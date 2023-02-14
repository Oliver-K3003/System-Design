module datapath(
	input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	input HIout, LOout, ZHIout, ZLOout, PCout, MDRout, Inportout, signExtout,
	input read, clk, clr,
	input [31:0] Mdatain
);
	wire [31:0] busMuxOut;
	wire [4:0] encoderOut;
	reg [31:0] encoderIn;
	reg [4:0] opcode;
	wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, 
		BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInSignExt;
	wire [63:0] BusMuxInC;

	always @(Mdatain)begin
		opcode <= Mdatain[31:27];
		encoderIn <= {8'd0, signExtout, Inportout, MDRout, PCout, ZLOout, ZHIout, LOout, HIout, R15out, R14out, R13out, R12out, R11out, R10out, R9out, R8out, R7out, R6out, R5out, R4out, R3out, R2out, R1out, R0out};
	end

	//initialize bus
	busEncoder encoder_instance(encoderOut, encoderOut);
	busMUX mux_instance(BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, 
		BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInSignExt, encoderOut, busMuxOut);
	//initialize registers
	Register R0(busMuxOut, BuxMuxInR0, clr, clk, R0out);
	Register R1(busMuxOut, BuxMuxInR1, clr, clk, R1out);
	Register R2(busMuxOut, BuxMuxInR2, clr, clk, R2out);
	Register R3(busMuxOut, BuxMuxInR3, clr, clk, R3out);
	Register R4(busMuxOut, BuxMuxInR4, clr, clk, R4out);
	Register R5(busMuxOut, BuxMuxInR5, clr, clk, R5out);
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
	Register ZHI(busMuxOut, BuxMuxInZhi, clr, clk, ZHIout);
	Register ZLO(busMuxOut, BuxMuxInZlo, clr, clk, ZLOout);
	Register PC(busMuxOut, BuxMuxInPC, clr, clk, PCout);
	MDR MDR(clr, clk, MDRout, read, busMuxOut, Mdatain, BusMuxInMDR);
	Register Inport(busMuxOut, BuxMuxInInport, clr, clk, Inportout);
	Register SignExt(busMuxOut, BuxMuxInSignExt, clr, clk, SignExtout);
	//initialize ALU
	ALU ALU(clk, clr, IncPC, Y, busMuxOut, BusMuxInC);

	always@(posedge clk)begin 
		//how to get registers for ALU
	end
endmodule

	