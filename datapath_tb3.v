`timescale 1ns/10ps

module datapath_tb3();
	reg R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, HIin, LOin, PCin, MDRin, INPORTin, Zin, Yin, MARin, IRin, AND;
	reg R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, ZHIout, ZLOout, PCout, MDRout, INPORTout, Zout,  Yout;
	reg Clock, Read, IncPC;
    reg [31:0]Mdatain;
	wire [31:0] busMuxOut;
    wire [4:0] encoderOut;
	wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, 
		BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInSignExt, BusMuxInY;
	
	parameter Default=4'b0000, Reg_load1a=4'b0001, Reg_load1b=4'b0010,Reg_load2a=4'b0011, 
					Reg_load2b=4'b0100, Reg_load3a=4'b0101,Reg_load3b = 4'b0110, T0 = 4'b0111,
					T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;
					
	reg [3:0] Present_state = Default;
	
	datapath DUT(R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, HIin, LOin, PCin, MDRin, INPORTin, Zin, Yin, MARin, IRin, AND,
            R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, ZHIout, ZLOout, 
            PCout, MDRout, INPORTout, Zout, Yout, Clock, Read, IncPC, Mdatain, busMuxOut, encoderOut, BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, 
		BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhi, BusMuxInZlo, BusMuxInPC, BusMuxInMDR, BusMuxInInport, BusMuxInY);
    initial begin 
        Clock = 0;
        forever #10 Clock =~ Clock;
    end

    always@(posedge Clock)begin 
        case(Present_state)
            Default     :  #35 Present_state=Reg_load1a;
            Reg_load1a  :  #35 Present_state=Reg_load1b;
            Reg_load1b  :  #35 Present_state=Reg_load2a;
            Reg_load2a  :  #35 Present_state=Reg_load2b;
            Reg_load2b  :  #35 Present_state=Reg_load3a;
            Reg_load3a  :  #35 Present_state=Reg_load3b;
            Reg_load3b  :  #35 Present_state=T0;
            T0          :  #35 Present_state=T1;
            T1          :  #35 Present_state=T2;
            T2          :  #35 Present_state=T3;
            T3          :  #35 Present_state=T4;
            T4          :  #35 Present_state=T5;
        endcase
    end

    always@(Present_state)begin 
        case(Present_state)
            Default:begin 
                R0in <= 0; R1in <= 0; R2in <= 0;
                R3in <= 0; R4in <= 0; R5in <= 0;
                R6in <= 0; R7in <= 0; R8in <= 0;
                R9in <= 0; R10in <= 0; R11in <= 0;
                R12in <= 0; R13in <= 0; R14in <= 0;
                R15in <= 0; HIin <= 0; LOin <= 0;
                PCin <= 0; MDRin <= 0; INPORTin <= 0;
                Zin <= 0; Yin <= 0; MARin <=0; IRin <= 0; AND <= 0;
                R0out <= 0; R1out <= 0; R2out <= 0;
                R3out <= 0; R4out <= 0; R5out <= 0;
                R6out <= 0; R7out <= 0; R8out <= 0;
                R9out <= 0; R10out <= 0; R11out <= 0;
                R12out <= 0; R13out <= 0; R14out <= 0;
                R15out <= 0; HIout <= 0; LOout <= 0;
					 ZHIout <= 0; ZLOout <=0; PCout <= 0; 
					 MDRout <= 0; INPORTout <= 0; Zout <= 0; 
					 Yout <= 0; IncPC <=0; Read <= 0; Mdatain <= 32'd0;
            end
				//add R0, R4, R5
            Reg_load1a:begin 
                Mdatain<=32'h00000012;
                Read=0; MDRin=0;
                #10 Read<=1; MDRin<=1;
                #15 Read<=0; MDRin<=0;
            end
            Reg_load1b:begin 
                #10 MDRout<=1; R4in<=1;
                #15 MDRout<=0;R4in<=0;
            end
            Reg_load2a:begin 
                Mdatain<=32'h00000014;
                #10 Read<=1; MDRin<=1;
                #15 Read<=0; MDRin<=0;
            end
            Reg_load2b:begin 
                #10 MDRout<=1;R5in<=1;
                #15 MDRout<=0;R5in<=0;
            end
            Reg_load3a:begin 
                Mdatain<=32'h00000018;
                #10 Read<=1; MDRin<=1;
                #15 Read<=0; MDRin<=0;
            end
            Reg_load3b:begin 
                #10 MDRout<=1; R0in<=1;
                #15 MDRout<=0; R0in<=0;
            end
            T0:begin 
                #10 PCout<=1; MARin<=1; IncPC<=1; Zin<=1;
                #15 PCout<=0; MARin<=0; IncPC<=0; Zin<=0;
            end
				
            T1:begin 
                Mdatain<=32'h18918000;
                #10 ZLOout<=1; PCin<=1; Read<=1; MDRin<=1; 
                #15 ZLOout<=0; PCin<=0; Read<=0; MDRin<=0;
            end
            T2:begin 
                #10 MDRout<=1; IRin<=1;
                #15 MDRout<=0; IRin<=0;
            end
            T3:begin 
                #10 R2out<=1; Yin<=1;
                #15 R2out<=0; Yin<=0;
            end
            T4:begin 
                #10 R3out<=1; Zin<=1;
                #15 R3out<=0; Zin<=0;
            end
            T5:begin 
                #10 ZLOout<=1; R0in<=1;
                #15 ZLOout<=0; R0in<=0;
            end
        endcase
    end
endmodule