`timescale 1ns/10ps
module control_unit(
	output reg HIin, LOin, PCin, MDRin, Zin, Yin, MARin, IRin, CONin, OUTPORTin, 
	HIout, LOout, ZHIout, ZLOout, PCout, MDRout, INPORTout, OUTPORTout, Yout, Cout,
	Gra, Grb, Grc, Rin, Rout, BAout, Read, IncPC, Write, Run,
	output reg [15:0] regIn,
	input Clock, Reset, Stop,
	input [31:0] IR,
	output reg [7:0] present_state
);
	parameter reset_state=8'd0, 
				fetch0=8'd1, fetch1=8'd2, fetch2=8'd3, 
				add3=8'd4, add4=8'd5, add5=8'd6, 
				sub3=8'd7, sub4=8'd8, sub5=8'd9, 
				mul3=8'd10, mul4=8'd11, mul5=8'd12, mul6=8'd13, 
				div3=8'd14, div4=8'd15, div5=8'd16, div6=8'd17, 
				or3=8'd18, or4=8'd19, or5=8'd20, 
				and3=8'd21, and4=8'd22, and5=8'd23, 
				shl3=8'd24, shl4=8'd25, shl5=8'd26, 
				shr3=8'd27, shr4=8'd28, shr5=8'd29, 
				rol3=8'd30, rol4=8'd31, rol5=8'd32, 
				ror3=8'd33, ror4=8'd34, ror5=8'd35, 
				neg3=8'd36, neg4=8'd37, neg5=8'd38,
				not3=8'd39, not4=8'd40, not5=8'd41, 
				ld3=8'd42, ld4=8'd43, ld5=8'd44, ld6=8'd45, ld7=8'd46, 
				ldi3=8'd47, ldi4=8'd48, ldi5=8'd49,
				st3=8'd50, st4=8'd51, st5=8'd52, st6=8'd53, st7=8'd54, 
				addi3=8'd55, addi4=8'd56, addi5=8'd57, 
				andi3=8'd58, andi4=8'd59, andi5=8'd60,
				ori3=8'd61, ori4=8'd62, ori5=8'd63, 
				br3=8'd64, br4=8'd65, br5=8'd66, br6=8'd67, br7=8'd68, 
				jr3=8'd69,
				jal3=8'd70, jal4=8'd71, 
				mfhi3=8'd72,
				mflo3=8'd73,
				in3=8'd74, 
				out3=8'd75,
				nop3=8'd76,
				halt3=8'd77,
				shra3=8'd78, shra4=8'd79, shra5=8'd80;
				

initial begin 
	present_state = reset_state;
end
 
always@(posedge Clock, posedge Reset, posedge Stop)begin 
	if (Reset == 1'b1) present_state = reset_state;
		if (Stop == 1'b1) present_state = halt3;
		else case (present_state)
			reset_state		:	begin #30 present_state = 8'bxxxxxxxx; #40 present_state = fetch0; end
			fetch0			:	#30 present_state = fetch1;
			fetch1			:	#30 present_state = fetch2;
			fetch2			:	begin	
										@(posedge Clock);
										case	(IR[31:27])
											5'b00000		:		present_state=ld3;
											5'b00001		:		present_state=ldi3;
											5'b00010		:		present_state=st3;
											5'b00011		:		present_state=add3;
											5'b00100		:		present_state=sub3;
											5'b00101		:		present_state=and3;
											5'b00110		:		present_state=or3;
											5'b00111		:		present_state=shr3;
											5'b01000		:		present_state=shra3;
											5'b01001		:		present_state=shl3;
											5'b01010		:		present_state=ror3;
											5'b01011		:		present_state=rol3;
											5'b01100		:		present_state=addi3;
											5'b01101		:		present_state=andi3;
											5'b01110		:		present_state=ori3;
											5'b01111		:		present_state=mul3;
											5'b10000		:		present_state=div3;
											5'b10001		:		present_state=neg3;
											5'b10010		:		present_state=not3;
											5'b10011		:		present_state=br3;
											5'b10100		:		present_state=jr3;
											5'b10101		:		present_state=jal3;
											5'b10110		:		present_state=in3;
											5'b10111		:		present_state=out3;
											5'b11000		:		present_state=mfhi3;
											5'b11001		:		present_state=mflo3;
											5'b11010		:		present_state=nop3;
											5'b11011		:		present_state=halt3;
										endcase
									end
			add3				: 	#30 present_state = add4;
			add4				:	#30 present_state = add5;
			add5 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			addi3				: 	#30 present_state = addi4;
			addi4				:	#30 present_state = addi5;
			addi5 			:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			sub3				: 	#30 present_state = sub4;
			sub4				: 	#30 present_state = sub5;
			sub5				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			mul3				: 	#30 present_state = mul4;
			mul4				: 	#30 present_state = mul5;
			mul5				: 	#30 present_state = mul6;
			mul6           :	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end 
			
			div3				: 	#30 present_state = div4;
			div4				: 	#30 present_state = div5;
			div5				: 	#30 present_state = div6;
			div6				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			or3				: 	#30 present_state = or4;
			or4				: 	#30 present_state = or5;
			or5				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			and3				: 	#30 present_state = and4;
			and4				: 	#30 present_state = and5;
			and5   			:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			shl3				: 	#30 present_state = shl4;
			shl4				: 	#30 present_state = shl5;
			shl5 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			shr3				: 	#30 present_state = shr4;
			shr4				: 	#30 present_state = shr5;
			shr5 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			shra3				: 	#30 present_state = shra4;
			shra4				: 	#30 present_state = shra5;
			shra5 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			rol3				: 	#30 present_state = rol4;
			rol4				: 	#30 present_state = rol5;
			rol5 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			ror3				: 	#30 present_state = ror4;
			ror4				: 	#30 present_state = ror5;
			ror5 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			neg3				: 	#30 present_state = neg4;
			neg4				: 	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			not3				: 	#30 present_state = not4;
			not4				: 	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			ld3				: 	#30 present_state = ld4;
			ld4				: 	#30 present_state = ld5;
			ld5				: 	#30 present_state = ld6;
			ld6				: 	#30 present_state = ld7;
			ld7				:  begin #30 present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			ldi3				: 	#30 present_state = ldi4;
			ldi4				: 	#30 present_state = ldi5;
			ldi5 				:	begin #30 present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			st3				: 	#30 present_state = st4;
			st4				: 	#30 present_state = st5;
			st5				: 	#30 present_state = st6;
			st6				: 	#30 present_state = st7;
			st7 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			andi3				: 	#30 present_state = andi4;
			andi4				: 	#30 present_state = andi5;
			andi5 			:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			ori3				: 	#30 present_state = ori4;
			ori4				: 	#30 present_state = ori5;
			ori5 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			jal3				: 	#30 present_state = jal4;
			jal4 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			jr3 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			br3				: 	#30 present_state = br4;
			br4				: 	#30 present_state = br5;
			br5				: 	#30 present_state = br6;
			br6  				:	#30 present_state = br7;
			br7  				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			out3 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			in3 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			mflo3 			:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			mfhi3 			:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			nop3 				:	begin present_state=8'bxxxxxxxx; #40 present_state = fetch0; end
			
			endcase
end
 

always@(present_state)begin 
	case(present_state)
	//---------------Reset---------------
		reset_state:begin 
			Run<=1;
			HIin<=0; LOin<=0;  MDRin<=0; Zin<=0; Yin<=0; IRin<=0; CONin<=0; OUTPORTin<=0;
			HIout<=0; LOout<=0; ZHIout<=0; ZLOout<=0; PCout<=0; MDRout<=0; INPORTout<=0; OUTPORTout<=0; Yout<=0; Cout<=0;
			Gra<=0; Grb<=0; Grc<=0; Rin<=0; Rout<=0; BAout<=0; Read<=0; IncPC<=0; Write<=0;
			regIn <= 16'hffff; PCin<=1;
			
		end
	//---------------Instruction Fetch---------------
		fetch0: begin 
			regIn<=16'd0; PCin<=0;
			PCout<=1; MARin<=1;
		end
		fetch1: begin 
			PCout<=0; MARin<=0;
			Read<=1; MDRin<=1; ZLOout<=1;
		end
		
		fetch2: begin 
			Read<=0; MDRin<=0; ZLOout<=0;
			MDRout<=1; IRin<=1; PCin<=1; IncPC<=1;
			#20 MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
		end
	//---------------Add / Sub---------------
		add3, sub3: begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Grb<=1; Rout<=1; Yin<=1;
		end
		add4, sub4: begin 
			Grb<=0; Rout<=0; Yin<=0;
			Grc<=1; Rout<=1; Zin<=1;
		end
		add5, sub5: begin 
			Grc<=0; Rout<=0; Zin<=0;
			ZLOout<=1; Gra<=1; Rin<=1;
			#20 ZLOout<=0; Gra<=0; Rin<=0;
		end
	//---------------And / Or / Shift / Rotate---------------
		and3, or3, shl3, shr3, rol3, ror3, shra3: begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Grb<=1; Rout<=1; Yin<=1;
		end
		and4, or4, shl4, shr4, rol4, ror4, shra4: begin 
			Grb<=0; Rout<=0; Yin<=0;
			Grc<=1; Rout<=1; Zin<=1;
		end
		and5, or5, shl5, shr5, rol5, ror5, shra5: begin 
			Grc<=0; Rout<=0; Zin<=0;
			ZLOout<=1; Gra<=1; Rin<=1;
			#20 ZLOout<=0; Gra<=0; Rin<=0;
		end
	//---------------Multiply / Divide---------------
		mul3, div3: begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Gra<=1; Rout<=1; Yin<=1;
		end
		mul4, div4: begin 
			Gra<=0; Rout<=0; Yin<=0;
			Grb<=1; Rout<=1; Zin<=1;
		end
		mul5, div5: begin 
			Grb<=0; Rout<=0; Zin<=0;
			ZLOout<=1; LOin<=1;
		end
		mul6, div6: begin 
			ZLOout<=0; LOin<=0;
			ZHIout<=1; HIin<=1;
			#20 ZHIout<=0; HIin<=0;
		end
	//---------------Not / Negate---------------
		not3, neg3: begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Grb<=1; Rout<=1; Zin<=1;
		end
		not4, neg4: begin 
			Grb<=0; Rout<=0; Zin<=0;
			ZLOout<=1; Gra<=1; Rin<=1;
			#20 ZLOout<=0; Gra<=0; Rin<=0;
		end
	//---------------Immediate Instructions---------------
		addi3, ori3, andi3: begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Grb<=1; Rout<=1; Yin<=1;
		end 
		addi4, ori4, andi4: begin 
			Grb<=0; Rout<=0; Yin<=0;
			Cout<=1; Zin<=1;
		end
		addi5, ori5, andi5: begin 
			Cout<=0; Zin<=0;
			ZLOout<=1; Gra<=1; Rin<=1;
			#20 ZLOout<=0; Gra<=0; Rin<=0;
		end
	//---------------Load Instruction---------------
		ld3: begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Grb<=1; BAout<=1; Yin<=1;
		end
		ld4: begin 
			Grb<=0; BAout<=0; Yin<=0;
			Cout<=1; Zin<=1;
		end
		ld5: begin 
			Cout<=0; Zin<=0;
			ZLOout<=1; MARin<=1;
		end
		ld6: begin 
			ZLOout<=0; MARin<=0;
			Read<=1; MDRin<=1;
		end
		ld7: begin 
			#11 Read<=0; MDRin<=0;
			MDRout<=1; Gra<=1; Rin<=1;
			#20 MDRout<=0; Gra<=0; Rin<=0;
		end
	//---------------Load Immediate Instruction---------------
		ldi3: begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Grb<=1; BAout<=1; Yin<=1;
		end
		ldi4: begin 
			Grb<=0; BAout<=0; Yin<=0;
			Cout<=1; Zin<=1;
		end
		ldi5: begin 
			Cout<=0; Zin<=0;
			ZLOout<=1; Gra<=1; Rin<=1;
			#20 ZLOout<=0; Gra<=0; Rin<=0;
		end
	//---------------Store Instruction---------------
		st3: begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Grb<=1; BAout<=1; Yin<=1;
		end
		st4: begin 
			Grb<=0; BAout<=0; Yin<=0;
			Cout<=1; Zin<=1;
		end
		st5: begin 
			Cout<=0; Zin<=0;
			ZLOout<=1; MARin<=1;
		end
		st6: begin 
			ZLOout<=0; MARin<=0; 
			Gra<=1; Rout<=1; MDRin<=1; Write<=1;
		end
		st7: begin 
			Gra<=0; Rout<=0; MDRin<=0; Write<=0;
		end
	//---------------Jump Instruction---------------
		jr3: begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Gra<=1; Rout<=1; PCin<=1;
			#20 PCin<=0; Gra<=0; Rout<=0;
		end
	//---------------Jal Instruction---------------
		jal3:begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			PCout<=1; regIn<=16'h8000;
		end
		jal4:begin 
			PCout<=0; regIn<=16'd0;
			Gra<=1; Rout<=1; PCin<=1;
			#20 Gra<=0; Rout<=0; PCin<=0;
		end
	//---------------Move HI/LO Instructions---------------
		mfhi3:begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Gra<=1; Rin<=1; HIout<=1;
			#20 Gra<=0; Rin<=0; HIout<=0;
		end
		mflo3:begin 
			MDRout<=0; IRin<=0;
			Gra<=1; Rin<=1; LOout<=1;
			#20 Gra<=0; Rin<=0; LOout<=0;
		end
	//---------------Branch Instructions---------------
		br3:begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Gra<=1; Rout<=1; CONin<=1; 
		end
		br4:begin 
			Gra<=0; Rout<=0; CONin<=0;
			PCout<=1; Yin<=1;
		end
		br5:begin 
			PCout<=0; Yin<=0;
			Cout<=1; Zin<=1;
		end
		br6:begin 
			Cout<=0; Zin<=0;
			ZLOout<=1; PCin<=1;
		end
		br7:begin 
			ZLOout<=0; PCin<=0;
		end
	//---------------Nop / Halt---------------
		nop3: begin end
		halt3: begin 
			Run<=0;
		end
	//---------------IO Ports---------------
		out3: begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Gra<=1; Rout<=1; Yin<=1; OUTPORTin<=1;
			#20 Gra<=0; Rout<=0; Yin<=0; OUTPORTin<=0;
		end
		in3: begin 
			MDRout<=0; IRin<=0; PCin<=0; IncPC<=0;
			Gra<=1; Rin<=1; INPORTout<=1;
			#20 Gra<=0; Rin<=0; INPORTout<=0;
		end
	//---------------Default---------------
		default: begin end
	endcase
end
endmodule