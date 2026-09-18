module subtrator18bits (
    input  [17:0] A,
    input  [17:0] B,
    output [17:0] S,
    output cout_final   // carry de saida final para deteccao de overflow/borrow
);


    wire [17:0] nB;

    not (nB[0],  B[0]);
    not (nB[1],  B[1]);
    not (nB[2],  B[2]);
    not (nB[3],  B[3]);
    not (nB[4],  B[4]);
    not (nB[5],  B[5]);
    not (nB[6],  B[6]);
    not (nB[7],  B[7]);
    not (nB[8],  B[8]);
    not (nB[9],  B[9]);
    not (nB[10], B[10]);
    not (nB[11], B[11]);
    not (nB[12], B[12]);
    not (nB[13], B[13]);
    not (nB[14], B[14]);
    not (nB[15], B[15]);
    not (nB[16], B[16]);
    not (nB[17], B[17]);

    
    wire c16, c17;   

    
    somador16bits somador_baixo (
        .A(A[15:0]),
        .B(nB[15:0]),
        .Ci(1'b1),
        .S(S[15:0]),
        .Co(c16)
    );

    
    fulladder fa16 (
        .A(A[16]),
        .B(nB[16]),
        .Ci(c16),
        .S(S[16]),
        .Co(c17)
    );

    
    fulladder fa17 (
        .A(A[17]),
        .B(nB[17]),
        .Ci(c17),
        .S(S[17]),
        .Co(cout_final)
    );

endmodule