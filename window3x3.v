module window_3x3 #
(
    parameter WIDTH = 8
)
(
    input clk,
    input rst,

    input  [7:0] pixel_in,
    input        pixel_valid,

    output reg [7:0] z1,z2,z3,
    output reg [7:0] z4,z5,z6,
    output reg [7:0] z7,z8,z9,

    output reg window_valid
);

    reg [7:0] line1 [0:WIDTH-1];
    reg [7:0] line2 [0:WIDTH-1];

    reg [$clog2(WIDTH)-1:0] col;

    reg [7:0] r1c1,r1c2,r1c3;
    reg [7:0] r2c1,r2c2,r2c3;
    reg [7:0] r3c1,r3c2,r3c3;

    always @(posedge clk) begin
        if(rst) begin
            col <= 0;
            window_valid <= 0;

            z1<=0;z2<=0;z3<=0;
            z4<=0;z5<=0;z6<=0;
            z7<=0;z8<=0;z9<=0;

            r1c1<=0;r1c2<=0;r1c3<=0;
            r2c1<=0;r2c2<=0;r2c3<=0;
            r3c1<=0;r3c2<=0;r3c3<=0;
        end
        else if(pixel_valid) begin

            r1c1 <= r1c2; r1c2 <= r1c3;
            r2c1 <= r2c2; r2c2 <= r2c3;
            r3c1 <= r3c2; r3c2 <= r3c3;

            r1c3 <= line2[col];
            r2c3 <= line1[col];
            r3c3 <= pixel_in;

            line2[col] <= line1[col];
            line1[col] <= pixel_in;

            z1<=r1c1;z2<=r1c2;z3<=r1c3;
            z4<=r2c1;z5<=r2c2;z6<=r2c3;
            z7<=r3c1;z8<=r3c2;z9<=r3c3;

            if(col==WIDTH-1)
                col<=0;
            else
                col<=col+1;

            if(col>=2)
                window_valid<=1;
            else
                window_valid<=0;
        end
    end
endmodule
