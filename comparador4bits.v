module comparador4bits (
    input  [3:0] A,       // A[3] = bit mais significativo
    input  [3:0] B,       // B[3] = bit mais significativo
    output maior,         // A > B
    output igual,         // A = B
    output menor          // A < B
);

    // --- Inversores das entradas ---
    wire [3:0] nA, nB;

    not (nA[3], A[3]);
    not (nA[2], A[2]);
    not (nA[1], A[1]);
    not (nA[0], A[0]);

    not (nB[3], B[3]);
    not (nB[2], B[2]);
    not (nB[1], B[1]);
    not (nB[0], B[0]);

    // --- Igualdade bit a bit (XNOR) ---
    wire [3:0] e;

    xnor (e[3], A[3], B[3]);
    xnor (e[2], A[2], B[2]);
    xnor (e[1], A[1], B[1]);
    xnor (e[0], A[0], B[0]);

    // --- Igualdade total (A = B) ---
    and (igual, e[3], e[2], e[1], e[0]);

    // --- Termos de prioridade para A > B ---
    wire g3, g2, g1, g0;

    and (g3, A[3], nB[3]);                     // A3=1, B3=0
    and (g2, e[3], A[2], nB[2]);                // empate no bit3
    and (g1, e[3], e[2], A[1], nB[1]);          // empate nos bits 3,2
    and (g0, e[3], e[2], e[1], A[0], nB[0]);    // empate nos bits 3,2,1

    or  (maior, g3, g2, g1, g0);

    // --- Termos de prioridade para A < B ---
    wire l3, l2, l1, l0;

    and (l3, nA[3], B[3]);
    and (l2, e[3], nA[2], B[2]);
    and (l1, e[3], e[2], nA[1], B[1]);
    and (l0, e[3], e[2], e[1], nA[0], B[0]);

    or  (menor, l3, l2, l1, l0);

endmodule