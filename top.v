module top(

    input clk,
    input rst_btn,

    input  [7:0] sw,

    output [3:0] led
);

    wire rst = rst_btn;

    wire [7:0] pixel_in = sw;
    wire pixel_valid = 1'b1;

    wire [7:0] z1,z2,z3;
    wire [7:0] z4,z5,z6;
    wire [7:0] z7,z8,z9;

    wire window_valid;

    wire [15:0] edge_out;
    wire edge_valid;

    wire edge_bin;
    wire edge_bin_valid;

    // Window
    window_3x3 WIN(
        .clk(clk),
        .rst(rst),

        .pixel_in(pixel_in),
        .pixel_valid(pixel_valid),

        .z1(z1),.z2(z2),.z3(z3),
        .z4(z4),.z5(z5),.z6(z6),
        .z7(z7),.z8(z8),.z9(z9),

        .window_valid(window_valid)
    );

    // Sobel
    sobel_core SOBEL(
        .z1(z1),.z2(z2),.z3(z3),
        .z4(z4),.z5(z5),.z6(z6),
        .z7(z7),.z8(z8),.z9(z9),

        .edge_out(edge_out)
    );

    assign edge_valid = window_valid;

    // Threshold
    threshold THR(
        .edge_in(edge_out),
        .valid_in(edge_valid),

        .edge_bin(edge_bin),
        .valid_out(edge_bin_valid)
    );

    // LEDs
    assign led[0] = edge_bin;
    assign led[1] = edge_bin_valid;
    assign led[2] = edge_out[6];
    assign led[3] = edge_out[7];

endmodule
