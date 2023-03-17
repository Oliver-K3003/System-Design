`timescale 1ns/10ps
// NOTE: THIS IS NOT DONE YET WE STILL NEED TO IMPLEMENT THE FOLLOWING
// T0 -> MAR <- [PC] (this sends the location of the instruction to MAR to fetch it)
// T1 -> MDR <- Mdatain (this gets the instruction fetched in T0)
// T2 -> IR <- [MDR] (instruction loaded into IR)
// the rest of the cycles should operate normally
module loadInstructionstb();
	reg HIin, LOin, PCin, MDRin, INPORTin, Zin, Yin, MARin, IRin, CONin;
	reg HIout, LOout, ZHIout, ZLOout, PCout, MDRout, INPORTout, OUTPORTout, Yout, Cout;
    reg Gra, Grb, Grc, Rin, Rout, BAout;
	reg Clock, Read, IncPC, write;
	wire [31:0] busMuxOut;
    wire [4:0] encoderOut;
    wire CON;
	wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, 
		BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInOutport, BusMuxInY, IRregister, Cregister;
	wire [8:0] marToRam;
	
	parameter Default=4'b0000, Reg_load1a=4'b0001, Reg_load1b=4'b0010,Reg_load2a=4'b0011, 
					Reg_load2b=4'b0100, Reg_load3a=4'b0101,Reg_load3b = 4'b0110, T0 = 4'b0111,
					T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6=4'b1101, T7=4'b1110;
					
	reg [3:0] Present_state = Default;
	
	datapath DUT(HIin, LOin, PCin, MDRin, INPORTin, Zin, Yin, MARin, IRin, CONin,
            HIout, LOout, ZHIout, ZLOout, PCout, MDRout, INPORTout, OUTPORTout, Cout, Yout, Gra, Grb, Grc, Rin, Rout, BAout,
            Clock, Read, IncPC, write, busMuxOut, encoderOut, CON, BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, 
		BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInOutport, BusMuxInY, IRregister, Cregister, marToRam);
    initial begin 
        Clock = 0;
        forever #10 Clock =~ Clock;
    end

    always@(posedge Clock)begin 
        case(Present_state)
            Default     :  #35 Present_state=Reg_load1a;
            Reg_load1a  :  #35 Present_state=T0;
            T0          :  #35 Present_state=T1;
            T1          :  #35 Present_state=T2;
            T2          :  #35 Present_state=T3;
            T3          :  #35 Present_state=T4;
            T4          :  #35 Present_state=T5;
            T5          :  #35 Present_state=T6;
            T6          :  #35 Present_state=T7;
        endcase
    end

    always@(Present_state)begin 
        case(Present_state)
            Default:begin 
                HIin <= 0; LOin <= 0; CONin <= 0;
                PCin <= 0; MDRin <= 0; INPORTin <= 0;
                Zin <= 0; Yin <= 0; MARin <= 0; IRin <= 0;
                HIout <= 0; LOout <= 0; BAout <= 0;
				ZHIout <= 0; ZLOout <=0; PCout <= 0; 
				MDRout <= 0; INPORTout <= 0; Cout <= 0; OUTPORTout <= 0;
                Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0;
				Yout <= 0; IncPC <=0; Read <= 0;
            end
				//ld R1, 0x75
            Reg_load1a:begin 
                #10 PCin<=1;
                #15 PCin<=0;
            end
            T0:begin 
                #10 PCout<=1; MARin<=1; IncPC<=1; Zin<=1;
                #15 PCout<=0; MARin<=0; IncPC<=0; Zin<=0;
            end
				
            T1:begin 
                #10 ZLOout<=1; PCin<=1; Read<=1; MDRin<=1; 
                #15 ZLOout<=0; PCin<=0; Read<=0; MDRin<=0;
            end
            T2:begin 
                #10 MDRout<=1; IRin<=1;
                #15 MDRout<=0; IRin<=0;
            end
            T3:begin 
                #10 Grb<=1; BAout<=1; Yin<=1;
                #15 Grb<=0; BAout<=0; Yin<=0;
            end
            T4:begin 
                #10  Cout<=1; Zin<=1;
                #15  Cout<=0; Zin<=0;
            end
            T5:begin 
                #10 ZLOout<=1; MARin<=1;
                #15 ZLOout<=0; MARin<=0;
            end
            T6:begin 
                #10 Read<=1; MDRin<=1;
                #15 Read<=0; MDRin<=0;
            end
            T7:begin 
                #10 MDRout<=1; Gra<=1; Rin<=1;
                #15 MDRout<=0; Gra<=0; Rin<=0;
            end
        endcase
    end
endmodule