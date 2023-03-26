`timescale 1ns/10ps

module control_unittb();
	wire HIin, LOin, PCin, MDRin, Zin, Yin, MARin, IRin, CONin, OUTPORTin;
	wire HIout, LOout, ZHIout, ZLOout, PCout, MDRout, INPORTout, OUTPORTout, Cout, Yout;
	wire Gra, Grb, Grc, Rin, Rout, BAout, Read, IncPC, Write, Run;
	reg Clock, Reset, Stop;
	reg [31:0] inportInput;
	wire [15:0] regIn;
	wire [31:0] busMuxOut;
	wire [4:0] encoderOut;
	wire CON;
	wire [31:0]BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6,BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
		BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInOutport, BusMuxInY, IRregister, Cregister;
	wire [8:0] marToRam;
	wire [31:0] mdrToRam;
	
	datapath DUT(HIin, LOin, PCin, MDRin, Zin, Yin, MARin, IRin, CONin, OUTPORTin, HIout, LOout, ZHIout, ZLOout, PCout, MDRout, INPORTout, OUTPORTout, Cout, Yout,
		Gra, Grb, Grc, Rin, Rout, BAout, Read, IncPC, Write, Run, Clock, Reset, Stop, inportInput, regIn, busMuxOut, encoderOut, CON,
		BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6,BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
		BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInOutport, BusMuxInY, IRregister, Cregister, marToRam, mdrToRam);
		
		initial begin 
			Clock=0;
			forever #10 Clock =~Clock;
		end
		
endmodule