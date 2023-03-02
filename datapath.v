module datapath(
    input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, HIin, LOin, PCin, MDRin, INPORTin, Zin, Yin, MARin, IRin, AND,
    input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, ZHIout, ZLOout, PCout, MDRout, INPORTout, Zout,  Yout, 
    input Clock, Read, IncPC,
    input [31:0] Mdatain,
    output [31:0] busMuxOut,
    output [4:0] encoderOut,
    output [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6,BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInY
);
    wire [31:0] encoderIn;
    wire [63:0] alu_out;
    wire [32:0] highIn, lowIn;
    wire clr = 0;
    assign encoderIn = {7'd0, Yout, Zout, INPORTout, MDRout, PCout, ZLOout, ZHIout, LOout, HIout, R15out, R14out, R13out, R12out, R11out, R10out, R9out, R8out, R7out, R6out, R5out, R4out, R3out, R2out, R1out, R0out};
	
    busEncoder enc(encoderIn, encoderOut);
    busMUX mux(BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInY, encoderOut, busMuxOut);

    Register R0(.d(busMuxOut), .q(BusMuxInR0), .clr(clr), .clk(Clock), .le(R0in));
    Register R1(.d(busMuxOut), .q(BusMuxInR1), .clr(clr), .clk(Clock), .le(R1in));
    Register R2(.d(busMuxOut), .q(BusMuxInR2), .clr(clr), .clk(Clock), .le(R2in));
    Register R3(.d(busMuxOut), .q(BusMuxInR3), .clr(clr), .clk(Clock), .le(R3in));
    Register R4(.d(busMuxOut), .q(BusMuxInR4), .clr(clr), .clk(Clock), .le(R4in));
    Register R5(.d(busMuxOut), .q(BusMuxInR5), .clr(clr), .clk(Clock), .le(R5in));
    Register R6(.d(busMuxOut), .q(BusMuxInR6), .clr(clr), .clk(Clock), .le(R6in));
    Register R7(.d(busMuxOut), .q(BusMuxInR7), .clr(clr), .clk(Clock), .le(R7in));
    Register R8(.d(busMuxOut), .q(BusMuxInR8), .clr(clr), .clk(Clock), .le(R8in));
    Register R9(.d(busMuxOut), .q(BusMuxInR9), .clr(clr), .clk(Clock), .le(R9in));
    Register R10(.d(busMuxOut), .q(BusMuxInR10), .clr(clr), .clk(Clock), .le(R10in));
    Register R11(.d(busMuxOut), .q(BusMuxInR11), .clr(clr), .clk(Clock), .le(R11in));
    Register R12(.d(busMuxOut), .q(BusMuxInR12), .clr(clr), .clk(Clock), .le(R12in));
    Register R13(.d(busMuxOut), .q(BusMuxInR13), .clr(clr), .clk(Clock), .le(R13in));
    Register R14(.d(busMuxOut), .q(BusMuxInR14), .clr(clr), .clk(Clock), .le(R14in));
    Register R15(.d(busMuxOut), .q(BusMuxInR15), .clr(clr), .clk(Clock), .le(R15in));
    Register HI(.d(busMuxOut), .q(BusMuxInHI), .clr(clr), .clk(Clock), .le(HIin));
    Register LO(.d(busMuxOut), .q(BusMuxInLO), .clr(clr), .clk(Clock), .le(LOin));
    Register ZHI(.d(alu_out[63:32]), .q(BusMuxInZhi), .clr(clr), .clk(Clock), .le(Zin));
    Register ZLO(.d(alu_out[31:0]), .q(BusMuxInZlo), .clr(clr), .clk(Clock), .le(Zin));
    Register PC(.d(busMuxOut), .q(BusMuxInPC), .clr(clr), .clk(Clock), .le(PCin));
    MDR mdr_reg(.clr(clr), .clk(Clock), .MDRin(MDRin), .read(Read), .busMuxOut(busMuxOut), .Mdatain(Mdatain), .q(BusMuxInMDR));
    Register INPORT(.d(busMuxOut), .q(BusMuxInInport), .clr(clr), .clk(Clock), .le(INPORTin));
    Register Y(.d(busMuxOut), .q(BusMuxInY), .clr(clr), .clk(Clock), .le(Yin));

    ALU logic_unit(Clock, clr, IncPC, BusMuxInY, busMuxOut, Mdatain[31:27], alu_out);

endmodule
	