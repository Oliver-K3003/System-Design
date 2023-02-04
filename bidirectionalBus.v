/*
module bus_32(input [4:0] select, input [31:0] data_in, output reg [31:0] data_out);
    reg [4:0] encoder_out;
    wire [31:0] mux_out;

    // 32-5 encoder
    encoder encoder_32_5 (
        .i(select),
        .o(encoder_out)
    );

    // 32-1 multiplexer
    mux mux_32_1 (
        .sel(encoder_out),
        .data(data_in),
        .out(mux_out)
    );

    // Drive the output of the bus
    assign data_out = mux_out;
endmodule
*/

// module bus(input [31:0] dataIn, output reg [31:0] dataOut);
// 	reg [4:0] encoderOut;
// 	wire [31:0] muxOut;
	
// 	busEncoder encoder_instance(dataIn, encoderOut);