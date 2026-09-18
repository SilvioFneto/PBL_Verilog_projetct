module contador(
    input  wire clk,
    input  wire reset,
    output wire [1:0] q
);

    wire d0, d1;

    
    not (d0, q[0]);          
    xor (d1, q[1], q[0]);    

    // Chamando o Flip-Flop do bit 0
    flipflop_D ff0 (
        .clk(clk),
        .reset(reset),
        .d(d0),
        .q(q[0])
    );

    // Chamando o Flip-Flop do bit 1
    flipflop_D ff1 (
        .clk(clk),
        .reset(reset),
        .d(d1),
        .q(q[1])
    );

endmodule