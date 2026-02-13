module threshold #
(
    parameter TH = 16'd50
)
(
    input  [15:0] edge_in,
    input         valid_in,

    output reg    edge_bin,
    output reg    valid_out
);

    always @(*) begin
        if(valid_in) begin
            if(edge_in > TH)
                edge_bin = 1;
            else
                edge_bin = 0;

            valid_out = 1;
        end
        else begin
            edge_bin = 0;
            valid_out = 0;
        end
    end
endmodule
