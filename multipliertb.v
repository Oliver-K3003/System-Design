`timescale 1ns/10ps

module multipliertb();
    reg [31:0] m, q;
    wire [63:0] product;
    multiplier multiplier_instance(m, q, product);

    initial
        begin 
            m <= 32'd12;
            q <= 32'd4;
        end

endmodule