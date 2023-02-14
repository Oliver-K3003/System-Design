// `timescale 1ns/10ps

// module datapath_tb;
// 	reg PCout, Zlowout, MDRout, R2out, R3out;
// 	reg MARin, Zin, PCin, MDRin, IRin, Yin;
// 	reg IncPC, Read, AND, R1in, R2in, R3in;
// 	reg Clock;
// 	reg [31:0]Mdatain;
	
// 	parameter Default=4'b0000, Reg_load1a=4'b0001, Reg_load1b=4'b0010,Reg_load2a=4'b0011, 
// 					Reg_load2b=4'b0100, Reg_load3a=4'b0101,Reg_load3b = 4’b0110, T0 = 4’b0111,
// 					T1 = 4’b1000, T2 = 4’b1001, T3 = 4’b1010, T4 = 4’b1011, T5 = 4’b1100;
					
// 	reg [3:0] Present_state = Default;
	
// 	Datapath DUT(PCout, Zlowout, MDRout, R2out, R4out, MARin, Zin, PCin, MDRin, IRin, Yin, IncPC, Read, AND, R1in,
// R2in, R3in, Clock, Mdatain);