module complementodedois24bits(
	input  [23:0] X,
	input         Controle,
	output [23:0] S
);
	wire [23:0] X_invertido;

	xor (X_invertido[0],  X[0],  Controle);
	xor (X_invertido[1],  X[1],  Controle);
	xor (X_invertido[2],  X[2],  Controle);
	xor (X_invertido[3],  X[3],  Controle);
	xor (X_invertido[4],  X[4],  Controle);
	xor (X_invertido[5],  X[5],  Controle);
	xor (X_invertido[6],  X[6],  Controle);
	xor (X_invertido[7],  X[7],  Controle);
	xor (X_invertido[8],  X[8],  Controle);
	xor (X_invertido[9],  X[9],  Controle);
	xor (X_invertido[10], X[10], Controle);
	xor (X_invertido[11], X[11], Controle);
	xor (X_invertido[12], X[12], Controle);
	xor (X_invertido[13], X[13], Controle);
	xor (X_invertido[14], X[14], Controle);
	xor (X_invertido[15], X[15], Controle);
	xor (X_invertido[16], X[16], Controle);
	xor (X_invertido[17], X[17], Controle);
	xor (X_invertido[18], X[18], Controle);
	xor (X_invertido[19], X[19], Controle);
	xor (X_invertido[20], X[20], Controle);
	xor (X_invertido[21], X[21], Controle);
	xor (X_invertido[22], X[22], Controle);
	xor (X_invertido[23], X[23], Controle);

	// soma 1 apenas se Controle=1, com carry correndo pelos 24 bits inteiros
	somador16bits soma_baixa (
		.A(X_invertido[15:0]),
		.B(16'b0),
		.Ci(Controle),
		.S(S[15:0]),
		.Co(carry_meio)
	);

	eightbitsadder soma_alta ( // supondo que voce tenha um somador de 8 bits
		.A(X_invertido[23:16]),
		.B(8'b0),
		.Ci(carry_meio),
		.S(S[23:16])

	);

endmodule