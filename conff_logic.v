module conff_logic(
    input [1:0] IRin,
    input signed [31:0] busMuxOut,
    input conIn,
    output conOut
);
    wire [3:0] decoderOut;
    wire equal, notEqual, greater, less, orOut;

    assign equal = (busMuxOut == 32'd0) ? 1 : 0;
    assign notEqual = (busMuxOut == 32'd0) ? 0 : 1;
    assign greater = (busMuxOut[31] == 0) ? 1 : 0;
    assign less = (busMuxOut[31] == 0) ? 0 : 1;
    decoder2to4 decoder(IRin, decoderOut);

    assign orOut = (decoderOut[0]&equal|decoderOut[1]&notEqual|decoderOut[2]&greater|decoderOut[3]&less);

    ff_register CON(.le(conIn), .d(orOut), .q(conOut));
endmodule

module decoder2to4(input [1:0] decoderIn, output [3:0] decoderOut);
    always@(decoderIn)begin 
        case(decoderIn)
            2'b00 : decoderOut <= 4'b0001;
            2'b01 : decoderOut <= 4'b0010;
            2'b10 : decoderOut <= 4'b0100;
            2'b11 : decoderOut <= 4'b1000;
        endcase
    end
endmodule

module ff_register(
    input le, d
    output q
);
    always@(le)begin 
        q <= d;
    end
endmodule