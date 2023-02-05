`timescale 1ns/10ps

module bidirectionalBustb;
    reg [31:0] in;
    wire [31:0] out;
    bidirectionalBus bus_instance(in, out);

    initial
        begin
            in <= 32'h00000001; //select r0

            #200
            in <= 32'h00000010; //select r4

				#400
				in <= 32'h00000004; //select r2
        end

endmodule