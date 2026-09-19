module multiplicador ( // multiplica numeros sem sinais apenas
    input [7:0] Asing,
    input [7:0] Bsing,
    output [15:0] P

);

    wire [15:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7; // parcelas da multipicacao ex(a0*(b0b1b2b3...))
    wire [15:0]soma0,soma1, soma2, soma3, soma4, soma5; // fios para guardar as parcelas  somas intermediarias
	 wire [7:0] A,B; 
	

	
	 complementodedois8bits abs_a (
		.X(Asing),
		.S(A)
	 );
	 
	 complementodedois8bits abs_b (
		.X(Bsing), 
		.S(B)
	 );
	 

	 
	 
	 
	 
	 
    
    // A * B[0]
    and (pp0[0],  A[0], B[0]);
    and (pp0[1],  A[1], B[0]);
    and (pp0[2],  A[2], B[0]);
    and (pp0[3],  A[3], B[0]);
    and (pp0[4],  A[4], B[0]);
    and (pp0[5],  A[5], B[0]);
    and (pp0[6],  A[6], B[0]);
    and (pp0[7],  A[7], B[0]);
	 
    and (pp0[8],  1'b0, B[0]); // bits restantes do resultado de 16 bits
    and (pp0[9],  1'b0, B[0]);
    and (pp0[10], 1'b0, B[0]);
    and (pp0[11], 1'b0, B[0]);
    and (pp0[12], 1'b0, B[0]);
    and (pp0[13], 1'b0, B[0]);
    and (pp0[14], 1'b0, B[0]);
    and (pp0[15], 1'b0, B[0]);

    
    and (pp1[0],  1'b0,   B[1]); //desloca 1
    and (pp1[1],  A[0], B[1]);
    and (pp1[2],  A[1], B[1]);
    and (pp1[3],  A[2], B[1]);
    and (pp1[4],  A[3], B[1]);
    and (pp1[5],  A[4], B[1]);
    and (pp1[6],  A[5], B[1]);
    and (pp1[7],  A[6], B[1]);
    and (pp1[8],  A[7], B[1]);
	 
    and (pp1[9],  1'b0,   B[1]);
    and (pp1[10], 1'b0,   B[1]);
    and (pp1[11], 1'b0,   B[1]);
    and (pp1[12], 1'b0,   B[1]);
    and (pp1[13], 1'b0,   B[1]);
    and (pp1[14], 1'b0,   B[1]);
    and (pp1[15], 1'b0,   B[1]);

    //  A * B[2] 
    and (pp2[0],  1'b0,   B[2]);
    and (pp2[1],  1'b0,   B[2]);
    and (pp2[2],  A[0], B[2]);
    and (pp2[3],  A[1], B[2]);
    and (pp2[4],  A[2], B[2]);
    and (pp2[5],  A[3], B[2]);
    and (pp2[6],  A[4], B[2]);
    and (pp2[7],  A[5], B[2]);
    and (pp2[8],  A[6], B[2]);
    and (pp2[9],  A[7], B[2]);
    and (pp2[10], 1'b0,   B[2]);
    and (pp2[11], 1'b0,   B[2]);
    and (pp2[12], 1'b0,   B[2]);
    and (pp2[13], 1'b0,   B[2]);
    and (pp2[14], 1'b0,   B[2]);
    and (pp2[15], 1'b0,   B[2]);

    // A * B[3]
    and (pp3[0],  1'b0,   B[3]);
    and (pp3[1],  1'b0,   B[3]);
    and (pp3[2],  1'b0,   B[3]);
    and (pp3[3],  A[0], B[3]);
    and (pp3[4],  A[1], B[3]);
    and (pp3[5],  A[2], B[3]);
    and (pp3[6],  A[3], B[3]);
    and (pp3[7],  A[4], B[3]);
    and (pp3[8],  A[5], B[3]);
    and (pp3[9],  A[6], B[3]);
    and (pp3[10], A[7], B[3]);
    and (pp3[11], 1'b0,   B[3]);
    and (pp3[12], 1'b0,   B[3]);
    and (pp3[13], 1'b0,   B[3]);
    and (pp3[14], 1'b0,   B[3]);
    and (pp3[15], 1'b0,   B[3]);

    //  A * B[4]
    and (pp4[0],  1'b0,   B[4]);
    and (pp4[1],  1'b0,   B[4]);
    and (pp4[2],  1'b0,   B[4]);
    and (pp4[3],  1'b0,   B[4]);
    and (pp4[4],  A[0], B[4]);
    and (pp4[5],  A[1], B[4]);
    and (pp4[6],  A[2], B[4]);
    and (pp4[7],  A[3], B[4]);
    and (pp4[8],  A[4], B[4]);
    and (pp4[9],  A[5], B[4]);
    and (pp4[10], A[6], B[4]);
    and (pp4[11], A[7], B[4]);
    and (pp4[12], 1'b0,   B[4]);
    and (pp4[13], 1'b0,   B[4]);
    and (pp4[14], 1'b0,   B[4]);
    and (pp4[15], 1'b0,   B[4]);

    // A * B[5]
    and (pp5[0],  1'b0,   B[5]);
    and (pp5[1],  1'b0,   B[5]);
    and (pp5[2],  1'b0,   B[5]);
    and (pp5[3],  1'b0,   B[5]);
    and (pp5[4],  1'b0,   B[5]);
    and (pp5[5],  A[0], B[5]);
    and (pp5[6],  A[1], B[5]);
    and (pp5[7],  A[2], B[5]);
    and (pp5[8],  A[3], B[5]);
    and (pp5[9],  A[4], B[5]);
    and (pp5[10], A[5], B[5]);
    and (pp5[11], A[6], B[5]);
    and (pp5[12], A[7], B[5]);
    and (pp5[13], 1'b0,   B[5]);
    and (pp5[14], 1'b0,   B[5]);
    and (pp5[15], 1'b0,   B[5]);

    // A * B[6] 
    and (pp6[0],  1'b0,   B[6]);
    and (pp6[1],  1'b0,   B[6]);
    and (pp6[2],  1'b0,   B[6]);
    and (pp6[3],  1'b0,   B[6]);
    and (pp6[4],  1'b0,   B[6]);
    and (pp6[5],  1'b0,   B[6]);
    and (pp6[6],  A[0], B[6]);
    and (pp6[7],  A[1], B[6]);
    and (pp6[8],  A[2], B[6]);
    and (pp6[9],  A[3], B[6]);
    and (pp6[10], A[4], B[6]);
    and (pp6[11], A[5], B[6]);
    and (pp6[12], A[6], B[6]);
    and (pp6[13], A[7], B[6]);
    and (pp6[14], 1'b0,   B[6]);
    and (pp6[15], 1'b0,   B[6]);

    //  A * B[7]
    and (pp7[0],  1'b0,   B[7]);
    and (pp7[1],  1'b0,   B[7]);
    and (pp7[2],  1'b0,   B[7]);
    and (pp7[3],  1'b0,   B[7]);
    and (pp7[4],  1'b0,   B[7]);
    and (pp7[5],  1'b0,   B[7]);
    and (pp7[6],  1'b0,   B[7]);
    and (pp7[7],  A[0], B[7]);
    and (pp7[8],  A[1], B[7]);
    and (pp7[9],  A[2], B[7]);
    and (pp7[10], A[3], B[7]);
    and (pp7[11], A[4], B[7]);
    and (pp7[12], A[5], B[7]);
    and (pp7[13], A[6], B[7]);
    and (pp7[14], A[7], B[7]);
    and (pp7[15], 1'b0,   B[7]);


    // somar cada uma das parcelas

    somador16bits s_l1_0 (
        .A(pp0),
        .B(pp1),
        .Ci(1'b0),
        .S(soma0),
        .Co()
    );

    somador16bits s_l1_1 (
        .A(pp2),
        .B(pp3),
        .Ci(1'b0),
        .S(soma1),
        .Co()
    );

    somador16bits s_l1_2 (
        .A(pp4),
        .B(pp5),
        .Ci(1'b0),
        .S(soma2),
        .Co()
    );

    somador16bits s_l1_3 (
        .A(pp6),
        .B(pp7),
        .Ci(1'b0),
        .S(soma3),
        .Co()
    );

    
    somador16bits s_l2_0 (
        .A(soma0),
        .B(soma1),
        .Ci(1'b0),
        .S(soma4),
        .Co()
    );

    somador16bits s_l2_1 (
        .A(soma2),
        .B(soma3),
        .Ci(1'b0),
        .S(soma5),
        .Co()
    );

    
    somador16bits s_final (
        .A(soma4),
        .B(soma5),
        .Ci(1'b0),
        .S(P),
        .Co()
    );
	 

endmodule