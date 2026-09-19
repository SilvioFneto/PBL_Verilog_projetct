module funcao(
	input [7:0]A,B,C,X,
	output [23:0]Y
);

	// ===================== PRIMEIRO TERMO: A * X * X =====================
	wire [15:0]pp0,pp1,pp2;
	wire [23:0]s1,primeirotermo;
	wire carry1;
	wire sinalax;

	multiplicador mt00(
		.A({1'b0, X[6:0]}),   // modulo de X, bit de sinal zerado
		.B({1'b0, X[6:0]}),   // modulo de X, bit de sinal zerado
		.P(pp0)
	);
	multiplicador mt01(
		.A({1'b0, A[6:0]}),   // modulo de A, bit de sinal zerado
		.B(pp0[15:8]),        // ja eh valor puro, nao mexe
		.P(pp1)
	);
	multiplicador mt02(
		.A({1'b0, A[6:0]}),   // modulo de A, bit de sinal zerado
		.B(pp0[7:0]),         // ja eh valor puro, nao mexe
		.P(pp2)
	);

	somador16bits w (
		.A(pp2),
		.B({pp1[7:0],8'b00000000}),
		.Ci(1'b0),
		.S(s1[15:0]),
		.Co(carry1)
	);
	eightbitsadder d (
		.A(8'b00000000),
		.B(pp1[15:8]),
		.Ci(carry1),
		.S(s1[23:16]),
		.Co()
	);

	xor (sinalax, A[7], X[7]); // sinal de A*X*X

	complementodedois24bits complementoax2 (
		.X(s1),
		.Controle(sinalax),
		.S(primeirotermo)
	);


	// ===================== SEGUNDO TERMO: B * X =====================
	wire [15:0]produto,segundotermo;
	wire Sinal;

	xor resultadosinal(Sinal, X[7], B[7]);

	multiplicador fazerproduto(
		.A({1'b0, X[6:0]}),
		.B({1'b0, B[6:0]}),
		.P(produto)
	);

	complementodedois16bits complementodoproduto(
		.X(produto),
		.Controle(Sinal),
		.S(segundotermo)
	);


	// ===================== TERCEIRO TERMO: C (sign-magnitude -> complemento de 2, 24 bits) =====================
	wire [23:0]terceirotermo;

	complementodedois24bits complementoC (
		.X({17'b0, C[6:0]}),
		.Controle(C[7]),
		.S(terceirotermo)
	);


	// ===================== SOMA: primeirotermo + segundotermo(estendido) + terceirotermo =====================
	wire [23:0]soma_parcial, soma_final;
	wire carry_p1, carry_p2;

	somador16bits soma1 (
		.A(primeirotermo[15:0]),
		.B(segundotermo),
		.Ci(1'b0),
		.S(soma_parcial[15:0]),
		.Co(carry_p1)
	);
	eightbitsadder soma2 (
		.A(primeirotermo[23:16]),
		.B({8{segundotermo[15]}}), // extensao de sinal de segundotermo
		.Ci(carry_p1),
		.S(soma_parcial[23:16]),
		.Co()
	);

	somador16bits s_p2_baixa (
		.A(soma_parcial[15:0]),
		.B(terceirotermo[15:0]),
		.Ci(1'b0),
		.S(soma_final[15:0]),
		.Co(carry_p2)
	);
	eightbitsadder s_p2_alta (
		.A(soma_parcial[23:16]),
		.B(terceirotermo[23:16]),
		.Ci(carry_p2),
		.S(soma_final[23:16])

	);


	
	complementodedois24bits absolutofinal (
		.X(soma_final),
		.Controle(soma_final[23]),
		.S(Y)
	);

endmodule