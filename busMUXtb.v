`timescale 1ns/10ps

module busMUXtb;
    reg [31:0] r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;
    reg [31:0] hi, lo, zhi, zlo, pc, mdr, inport, signExt;
    reg [4:0] sel;
    wire [31:0] muxOut;

    busMUX bus_MUX_instance(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, hi, lo, zhi, zlo, pc, mdr, inport, signExt);

    initial
        begin
            r1 <= 32'd0;
            sel <= 5'd0;

            #200
            r3 <= 32'd230;
            sel <= 5'd3;
        end
        
endmodule