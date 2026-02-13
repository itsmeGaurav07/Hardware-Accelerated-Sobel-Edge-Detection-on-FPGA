module sobel_core(

    input [7:0] z1,z2,z3,
    input [7:0] z4,z5,z6,
    input [7:0] z7,z8,z9,

    output [15:0] edge_out
);

    wire signed [10:0] gx,gy;

    assign gx = (z3 + (z6<<1) + z9) - (z1 + (z4<<1) + z7);
    assign gy = (z7 + (z8<<1) + z9) - (z1 + (z2<<1) + z3);

    assign edge_out =
        (gx[10] ? -gx : gx) +
        (gy[10] ? -gy : gy);

endmodule
