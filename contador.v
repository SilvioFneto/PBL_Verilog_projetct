module contador (
    input  wire clk, reset, enable,
    output wire [1:0] q
);
    wire q0_bar, q1_bar, clk_en;
    not (q0_bar, q[0]);
    not (q1_bar, q[1]);
    and (clk_en, clk, enable);

    flipflop_D ff0 (.clk(clk_en),  .reset(reset), .d(q0_bar), .q(q[0]));
    flipflop_D ff1 (.clk(q0_bar),  .reset(reset), .d(q1_bar), .q(q[1]));
endmodule