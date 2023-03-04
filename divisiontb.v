`timescale 1ns/10ps

module divisiontb();
    reg [31:0] m,q;
    wire [63:0] out;
    division division_instance(m,q,out);

    initial begin 
        m <= 32'd24;
        q <= 32'd4;

        #500
        m <= 32'd9;
        q <= 32'd7;
    end
endmodule