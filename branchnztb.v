`timescale 1ns/10ps
module branchnztb();
	reg HIin, LOin, PCin, MDRin, INPORTin, Zin, Yin, MARin, IRin, CONin;
	reg HIout, LOout, ZHIout, ZLOout, PCout, MDRout, INPORTout, OUTPORTout, Yout, Cout;
    reg Gra, Grb, Grc, Rin, Rout, BAout;
	reg Clock, Read, IncPC, write;
    reg [31:0] inportInput;
	wire [31:0] busMuxOut;
    wire [4:0] encoderOut;
    wire CON;
	wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, 
		BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInOutport, BusMuxInY, IRregister, Cregister;
	wire [8:0] marToRam;
	
	parameter Default=5'd0, Reg_load1a=5'd1, Reg_load1b=5'd2,Reg_load2a=5'd3, 
					Reg_load2b=5'd4, Reg_load3a=5'd5,Reg_load3b = 5'd6, T0 = 5'd7,
					T1 = 5'd8, T2 = 5'd9, T3 = 5'd10, T4 = 5'd11, T5 = 5'd12, T6=5'd13, T7=5'd14, T8=5'd15,
                    T9=5'd16, T10=5'd17, T11=5'd18, T12=5'd19, T13=5'd20, T14=5'd21, T15=5'd22;
					
	reg [4:0] Present_state = Default;
	
	datapath DUT(HIin, LOin, PCin, MDRin, INPORTin, Zin, Yin, MARin, IRin, CONin,
            HIout, LOout, ZHIout, ZLOout, PCout, MDRout, INPORTout, OUTPORTout, Cout, Yout, Gra, Grb, Grc, Rin, Rout, BAout,
            Clock, Read, IncPC, write, inportInput, busMuxOut, encoderOut, CON, BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, 
		BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInOutport, BusMuxInY, IRregister, Cregister, marToRam);
    initial begin 
        Clock = 0;
        forever #10 Clock =~ Clock;
    end

    always@(posedge Clock)begin 
        case(Present_state)
            Default     :  #35 Present_state=Reg_load1a;
            Reg_load1a  :  #35 Present_state=Reg_load1b;
				Reg_load1b	:  #35 Present_state=T0;
            T0          :  #35 Present_state=T1;
            T1          :  #35 Present_state=T2;
            T2          :  #35 Present_state=T3;
            T3          :  #35 Present_state=T4;
            T4          :  #35 Present_state=T5;
            T5          :  #35 Present_state=T6;
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
				//brnz R6, 25
            Reg_load1a:begin 
				inportInput<=32'd10;
                #10 INPORTin<=1;
                #15 INPORTin<=0;
            end
				Reg_load1b:begin 
					#10 INPORTout<=1; PCin<=1;
					#15 INPORTout<=0; PCin<=0;
				end
            T0:begin 
                #10 PCout<=1; MARin<=1; IncPC<=1; Zin<=1;
                #15 PCout<=0; MARin<=0; IncPC<=0; Zin<=0; 
            end
				
            T1:begin 
                #10 Read<=1; MDRin<=1; PCin<=1; 
                #15 Read<=0; MDRin<=0; PCin<=0; 
            end
            T2:begin 
                #10 MDRout<=1; IRin<=1;
                #15 MDRout<=0; IRin<=0;
            end
            T3:begin 
                #10 Gra<=1; Rout<=1; CONin<=1;
                #15 Grb<=0; Rout<=0; CONin<=0;
            end
            T4:begin 
                #10  PCout<=1; Yin<=1;
                #15  PCout<=0; Yin<=0;
            end
            T5:begin 
                #10 Cout<=1; Zin<=1;
                #15 Cout<=0; Zin<=0;
            end
				T6:begin 
					 #10 ZLOout<=1; //CON -> PCin ??????
					 #15 ZLOout<=1;
				end
        endcase
    end
endmodule