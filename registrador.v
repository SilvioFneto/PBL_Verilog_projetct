module registrador (
    input  wire clock,
    input  wire clear,
    input  wire [7:0] X,
    output wire [7:0] A, B, C,
    output wire [1:0] S
);
    wire e, clock_neg, n_cod0, n_cod1, clockA, clockB, clockC;

    nand (e, S[0], S[1]);
    not  (clock_neg, clock);

    contador cc (.clk(clock_neg), .reset(clear), .enable(e), .q(S));

    not (n_cod0, S[0]);
    not (n_cod1, S[1]);

    and (clockA, n_cod0, n_cod1, clock); // S=00 → A
    and (clockB, S[0],   n_cod1, clock); // S=01 → B
    and (clockC, n_cod0, S[1],   clock); // S=10 → C

    registrador_8bits regA (.clk(clockA), .reset(clear), .entrada_d(X), .saida_q(A));
    registrador_8bits regB (.clk(clockB), .reset(clear), .entrada_d(X), .saida_q(B));
    registrador_8bits regC (.clk(clockC), .reset(clear), .entrada_d(X), .saida_q(C));
endmodule