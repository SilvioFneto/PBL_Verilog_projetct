module display(
    input [3:0] E,
    output [6:0] S
);

    wire nA, nB, nC, nD;

    // Segmento A
    wire s00, s01, s02, s03;

    // Segmento B
    wire s10, s11, s12, s13;

    // Segmento C
    wire s20, s21, s22;

    // Segmento D
    wire s30, s31, s32, s33;

    // Segmento E
    wire s40, s41, s42;

    // Segmento F
    wire s50, s51, s52, s53;

    // Segmento G
    wire s60, s61, s62;


    
    not (nA, E[3]);
    not (nB, E[2]);
    not (nC, E[1]);
    not (nD, E[0]);


    //a

    and (s00, nA, nB, nC, E[0]);
    and (s01, nA, E[2], nC, nD);
    and (s02, E[3], nB, E[1], E[0]);
    and (s03, E[3], E[2], nC, E[0]);

    or (S[0], s00, s01, s02, s03);


    // b

    and (s10, nA, E[2], nC, E[0]);
    and (s11, E[2], E[1], nD);
    and (s12, E[3], E[1], E[0]);
    and (s13, E[3], E[2], nD);

    or (S[1], s10, s11, s12, s13);


    //c
    and (s20, nA, nB, E[1], nD);
    and (s21, E[3], E[2], nD);
    and (s22, E[3], E[2], E[1]);

    or (S[2], s20, s21, s22);


    //d

    and (s30, nA, nB, nC, E[0]);
    and (s31, nA, E[2], nC, nD);
    and (s32, E[2], E[1], E[0]);
    and (s33, E[3], nB, E[1], nD);

    or (S[3], s30, s31, s32, s33);


    // e
    and (s40, nA, E[0]);
    and (s41, nB, nC, E[0]);
    and (s42, nA, E[2], nC);

    or (S[4], s40, s41, s42);


    // f

    and (s50, nA, nB, E[0]);
    and (s51, nA, nB, E[1]);
    and (s52, nA, E[1], E[0]);
    and (s53, E[3], E[2], nC, E[0]);

    or (S[5], s50, s51, s52, s53);


    // g
    and (s60, nA, nB, nC);
    and (s61, nA, E[2], E[1], E[0]);
    and (s62, E[3], E[2], nC, nD);

    or (S[6], s60, s61, s62);


endmodule