//IncPC, Write, Run, Clock, Reset, Stop, inportInput, busMuxOut, present_state, seg0out, seg1out
module phase4datapath(
    output IncPC, write, run,
    input Clock, Reset, Stop, 
    input [31:0] inportInput,
    output [31:0] busMuxOut,
    output [7:0] present_state, seg0out, seg1out
);
	wire HIin, LOin, PCin, MDRin, Zin, Yin, MARin, IRin, CONin, OUTPORTin;
    wire HIout, LOout, ZHIout, ZLOout, PCout, MDRout, INPORTout, OUTPORTout, Cout, Yout;
	 wire Gra, Grb, Grc, Rin, Rout, BAout, Read;
	 wire [15:0] regIn;
	 wire [4:0] encoderOut;
    wire CON;
	 wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6,BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
		BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInOutport, BusMuxInY, IRregister, Cregister;
	 wire [8:0] marToRam;
    wire [31:0] mdrToRam;
	//Intermediate Connections
    wire [31:0] encoderIn;
    wire [63:0] alu_out;
    wire [32:0] highIn, lowIn;
    wire clr = 0;
	 wire [31:0] R0output, PCoutput, OUTPORToutput;
    wire [15:0] inSignals, outSignals;
	
    assign encoderIn = {6'd0, Cout, Yout, INPORTout, OUTPORTout,  MDRout, PCout, ZLOout, ZHIout, LOout, HIout, outSignals[15:0]};
    
	 //Control Unit
    control_unit cUnit(HIin, LOin, PCin, MDRin, Zin, Yin, MARin, IRin, CONin, OUTPORTin, HIout, LOout, ZHIout, ZLOout, PCout, MDRout, INPORTout, OUTPORTout, Yout, Cout, Gra, Grb, Grc, Rin, Rout, BAout, 
        Read, IncPC, write, run, regIn, Clock, Reset, Stop, IRregister, present_state);
	
	//Select & Encode
	selectAndEncode selogic(.Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .BAout(BAout), .IRin(IRregister), .registersIn(inSignals), .registersOut(outSignals), .CsignExt(Cregister));
    ram memory(.data(BusMuxInMDR), .addr(marToRam), .we(write), .clk(Clock), .q(mdrToRam));
    
	 //Bus
	 busEncoder enc(encoderIn, encoderOut);
    busMUX mux(BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15,
			BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInOutport, BusMuxInY, Cregister, encoderOut, busMuxOut);
	 
	 //Numbered Registers
	 assign BusMuxInR0 = {32{!BAout}} & R0output;
    Register R0(.d(busMuxOut), .q(R0output), .clr(clr), .clk(Clock), .le(inSignals[0]|regIn[0]));
    Register R1(.d(busMuxOut), .q(BusMuxInR1), .clr(clr), .clk(Clock), .le(inSignals[1]|regIn[1]));
    Register R2(.d(busMuxOut), .q(BusMuxInR2), .clr(clr), .clk(Clock), .le(inSignals[2]|regIn[2]));
    Register R3(.d(busMuxOut), .q(BusMuxInR3), .clr(clr), .clk(Clock), .le(inSignals[3]|regIn[3]));
    Register R4(.d(busMuxOut), .q(BusMuxInR4), .clr(clr), .clk(Clock), .le(inSignals[4]|regIn[4]));
    Register R5(.d(busMuxOut), .q(BusMuxInR5), .clr(clr), .clk(Clock), .le(inSignals[5]|regIn[5]));
    Register R6(.d(busMuxOut), .q(BusMuxInR6), .clr(clr), .clk(Clock), .le(inSignals[6]|regIn[6]));
    Register R7(.d(busMuxOut), .q(BusMuxInR7), .clr(clr), .clk(Clock), .le(inSignals[7]|regIn[7]));
    Register R8(.d(busMuxOut), .q(BusMuxInR8), .clr(clr), .clk(Clock), .le(inSignals[8]|regIn[8]));
    Register R9(.d(busMuxOut), .q(BusMuxInR9), .clr(clr), .clk(Clock), .le(inSignals[9]|regIn[9]));
    Register R10(.d(busMuxOut), .q(BusMuxInR10), .clr(clr), .clk(Clock), .le(inSignals[10]|regIn[10]));
    Register R11(.d(busMuxOut), .q(BusMuxInR11), .clr(clr), .clk(Clock), .le(inSignals[11]|regIn[11]));
    Register R12(.d(busMuxOut), .q(BusMuxInR12), .clr(clr), .clk(Clock), .le(inSignals[12]|regIn[12]));
    Register R13(.d(busMuxOut), .q(BusMuxInR13), .clr(clr), .clk(Clock), .le(inSignals[13]|regIn[13]));
    Register R14(.d(busMuxOut), .q(BusMuxInR14), .clr(clr), .clk(Clock), .le(inSignals[14]|regIn[14]));
    Register R15(.d(busMuxOut), .q(BusMuxInR15), .clr(clr), .clk(Clock), .le(inSignals[15]|regIn[15]));
	 
	 //Other Registers
    Register HI(.d(busMuxOut), .q(BusMuxInHI), .clr(clr), .clk(Clock), .le(HIin));
    Register LO(.d(busMuxOut), .q(BusMuxInLO), .clr(clr), .clk(Clock), .le(LOin));
    Register ZHI(.d(alu_out[63:32]), .q(BusMuxInZhi), .clr(clr), .clk(Clock), .le(Zin));
    Register ZLO(.d(alu_out[31:0]), .q(BusMuxInZlo), .clr(clr), .clk(Clock), .le(Zin));
    MDR mdr_reg(.clr(clr), .clk(Clock), .MDRin(MDRin), .read(Read), .busMuxOut(busMuxOut), .Mdatain(mdrToRam), .q(BusMuxInMDR));
    mar mar_reg(.d(busMuxOut), .q(marToRam), .le(MARin), .clk(Clock), .clr(clr));
    Register IR(.d(busMuxOut), .q(IRregister), .clr(clr), .clk(Clock), .le(IRin));
	 Register INPORT(.d(inportInput), .q(BusMuxInInport), .clr(clr), .clk(Clock), .le(1'b1));
	 Register OUTPORT(.d(busMuxOut), .q(BusMuxInOutport), .clr(clr), .clk(Clock), .le(OUTPORTin));
    Register Y(.d(busMuxOut), .q(BusMuxInY), .clr(clr), .clk(Clock), .le(Yin));
    incrementPC incpc(.clk(Clock), .IncPC(IncPC), .PCen(PCin), .inPC(busMuxOut), .outPC(BusMuxInPC));
	 
	 //Conff Logic
    conff_logic CONFF(.IRin(IRregister[20:19]), .busMuxOut(busMuxOut), .conIn(CONin), .conOut(CON));
	 
	 //7 Segment
	 seven_seg_disp d0(.out(seg0out), .clk(Clock), .data(BusMuxInOutport[3:0]));
	 seven_seg_disp d1(.out(seg1out), .clk(Clock), .data(BusMuxInOutport[7:4]));
	 
	 //ALU
    ALU logic_unit(Clock, clr, IncPC, CON, BusMuxInY, busMuxOut, IRregister[31:27], alu_out);

endmodule

	