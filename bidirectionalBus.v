module bidirectionalBus(input [31:0] dataIn, output wire [31:0] dataOut);
 	wire [4:0] encoderOut;
	wire [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,hi,lo,zhi,zlo,pc,mdr,inport,signExt;
	wire [31:0] muxOut;
	
		//used for testing 
    assign r0 = 31'd240;
    assign r1 = 31'd2;
    assign r2 = 31'd1235;
    assign r3 = 31'd30;
    assign r4 = 31'd10;
    assign r5 = 31'd530;

 	busEncoder encoder_instance(dataIn[31:0], encoderOut[4:0]);
	busMUX mux_instance(r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,hi,lo,zhi,zlo,pc,mdr,inport,signExt,encoderOut,muxOut);
	
	assign dataOut = muxOut;
	
endmodule