module mux2x1 (
    input  [17:0] A,
    input  [17:0] B,
    input  C,
    output [17:0] S
);

    wire nC;
    not (nC, C);
	
	 //C é o bit 1/0 gerado depois de comparar o raiz atual e resto atual
    //C =0 sai A
	 //C=1 sai B
	 
    wire [17:0] termoA, termoB;

    and (termoA[0],  A[0],  nC);
    and (termoA[1],  A[1],  nC);
    and (termoA[2],  A[2],  nC);
    and (termoA[3],  A[3],  nC);
    and (termoA[4],  A[4],  nC);
    and (termoA[5],  A[5],  nC);
    and (termoA[6],  A[6],  nC);
    and (termoA[7],  A[7],  nC);
    and (termoA[8],  A[8],  nC);
    and (termoA[9],  A[9],  nC);
    and (termoA[10], A[10], nC);
    and (termoA[11], A[11], nC);
    and (termoA[12], A[12], nC);
    and (termoA[13], A[13], nC);
    and (termoA[14], A[14], nC);
    and (termoA[15], A[15], nC);
    and (termoA[16], A[16], nC);
    and (termoA[17], A[17], nC);

    and (termoB[0],  B[0],  C);
    and (termoB[1],  B[1],  C);
    and (termoB[2],  B[2],  C);
    and (termoB[3],  B[3],  C);
    and (termoB[4],  B[4],  C);
    and (termoB[5],  B[5],  C);
    and (termoB[6],  B[6],  C);
    and (termoB[7],  B[7],  C);
    and (termoB[8],  B[8],  C);
    and (termoB[9],  B[9],  C);
    and (termoB[10], B[10], C);
    and (termoB[11], B[11], C);
    and (termoB[12], B[12], C);
    and (termoB[13], B[13], C);
    and (termoB[14], B[14], C);
    and (termoB[15], B[15], C);
    and (termoB[16], B[16], C);
    and (termoB[17], B[17], C);

    // --- OR final: combina os dois termos, bit a bit ---
    or (S[0],  termoA[0],  termoB[0]);
    or (S[1],  termoA[1],  termoB[1]);
    or (S[2],  termoA[2],  termoB[2]);
    or (S[3],  termoA[3],  termoB[3]);
    or (S[4],  termoA[4],  termoB[4]);
    or (S[5],  termoA[5],  termoB[5]);
    or (S[6],  termoA[6],  termoB[6]);
    or (S[7],  termoA[7],  termoB[7]);
    or (S[8],  termoA[8],  termoB[8]);
    or (S[9],  termoA[9],  termoB[9]);
    or (S[10], termoA[10], termoB[10]);
    or (S[11], termoA[11], termoB[11]);
    or (S[12], termoA[12], termoB[12]);
    or (S[13], termoA[13], termoB[13]);
    or (S[14], termoA[14], termoB[14]);
    or (S[15], termoA[15], termoB[15]);
    or (S[16], termoA[16], termoB[16]);
    or (S[17], termoA[17], termoB[17]);

endmodule