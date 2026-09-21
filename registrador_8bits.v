module registrador_8bits (
    input  wire clk, reset,
    input  wire [7:0] entrada_d,
    output wire [7:0] saida_q
);
    flipflop_D ff0 (.clk(clk), .reset(reset), .d(entrada_d[0]), .q(saida_q[0]));
    flipflop_D ff1 (.clk(clk), .reset(reset), .d(entrada_d[1]), .q(saida_q[1]));
    flipflop_D ff2 (.clk(clk), .reset(reset), .d(entrada_d[2]), .q(saida_q[2]));
    flipflop_D ff3 (.clk(clk), .reset(reset), .d(entrada_d[3]), .q(saida_q[3]));
    flipflop_D ff4 (.clk(clk), .reset(reset), .d(entrada_d[4]), .q(saida_q[4]));
    flipflop_D ff5 (.clk(clk), .reset(reset), .d(entrada_d[5]), .q(saida_q[5]));
    flipflop_D ff6 (.clk(clk), .reset(reset), .d(entrada_d[6]), .q(saida_q[6]));
    flipflop_D ff7 (.clk(clk), .reset(reset), .d(entrada_d[7]), .q(saida_q[7]));
endmodule