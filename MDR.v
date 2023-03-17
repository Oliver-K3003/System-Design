module MDR(
    input clr,
    input clk,
    input MDRin,
    input read,
    input [31:0] busMuxOut,
    input [31:0] Mdatain,
    output wire [31:0] q
);
    wire [31:0] muxOut;
    mdrmux2to1 MDMux(read, busMuxOut, Mdatain, muxOut);
    Register MDR(muxOut, q, clr, clk, MDRin);
endmodule

module mdrmux2to1(
    input read, 
    input [31:0] busMuxOut, 
    input [31:0] Mdatain, 
    output reg [31:0] muxOut
);
    always@(read, busMuxOut, Mdatain) begin 
        case(read) 
            1'b0 : muxOut <= busMuxOut;
            1'b1 : muxOut <= Mdatain;
        endcase
    end
endmodule

