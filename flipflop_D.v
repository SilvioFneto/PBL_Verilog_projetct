module flipflop_D (
    input  wire clk, reset, d,
    output reg  q,
    output wire q_bar
);
    assign q_bar = ~q;

    always @(posedge clk or posedge reset) begin
        if (reset) q <= 1'b0;
        else       q <= d;
    end
endmodule