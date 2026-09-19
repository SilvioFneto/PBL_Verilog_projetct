module comparador20bits (
    input  [19:0] A,      // A[19:16] = grupo mais significativo
    input  [19:0] B,      // B[19:16] = grupo mais significativo
    output maior,         // A > B
    output igual,         // A = B
    output menor          // A < B
);

    // --- Saidas de cada comparador de 4 bits (grupos) ---
    wire ma4, ma3, ma2, ma1, ma0;   // "maior" de cada grupo
    wire i4, i3, i2, i1, i0;   // "igual" de cada grupo
    wire me4, me3, me2, me1, me0;   // "menor" de cada grupo

    // Grupo 4 (bits 19:16) - mais significativo
    comparador4bits cmp4 (
        .A(A[19:16]), .B(B[19:16]),
        .maior(ma4), .igual(i4), .menor(me4)
    );

    // Grupo 3 (bits 15:12)
    comparador4bits cmp3 (
        .A(A[15:12]), .B(B[15:12]),
        .maior(ma3), .igual(i3), .menor(me3)
    );

    // Grupo 2 (bits 11:8)
    comparador4bits cmp2 (
        .A(A[11:8]), .B(B[11:8]),
        .maior(ma2), .igual(i2), .menor(me2)
    );

    // Grupo 1 (bits 7:4)
    comparador4bits cmp1 (
        .A(A[7:4]), .B(B[7:4]),
        .maior(ma1), .igual(i1), .menor(me1)
    );

    // Grupo 0 (bits 3:0) - menos significativo
    comparador4bits cmp0 (
        .A(A[3:0]), .B(B[3:0]),
        .maior(ma0), .igual(i0), .menor(me0)
    );

    // --- Igualdade total: todos os grupos precisam ser iguais ---
    and (igual, i4, i3, i2, i1, i0);

    // --- Prioridade para MAIOR (grupo mais significativo decide primeiro) ---
    wire p4, p3, p2, p1, p0;

    and (p4, ma4);                              // grupo4 decide sozinho
    and (p3, i4, ma3);                          // empatou no grupo4, grupo3 decide
    and (p2, i4, i3, ma2);                      // empatou nos grupos 4 e 3
    and (p1, i4, i3, i2, ma1);                  // empatou nos grupos 4,3,2
    and (p0, i4, i3, i2, i1, ma0);              // empatou nos grupos 4,3,2,1

    or  (maior, p4, p3, p2, p1, p0);

    // --- Prioridade para MENOR (simetrico) ---
    wire q4, q3, q2, q1, q0;

    and (q4, me4);
    and (q3, i4, me3);
    and (q2, i4, i3, me2);
    and (q1, i4, i3, i2, me1);
    and (q0, i4, i3, i2, i1, me0);

    or  (menor, q4, q3, q2, q1, q0);

endmodule