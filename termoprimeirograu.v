module termoprimeirograu(
	input [7:0]X, // em complemento de 2
	output [15:0]S

);

	wire [7:0]xabsoluto;
	wire [15:0]produto;
	wire nSinal;
	xor resultadosinal(Sinal, X[7], 1'b1);

	
	
	multiplicador fazerproduto(
		.Asing(X),
		.Bsing(8'b00000101),
		.P(produto)
	);
	
	complementodedois16bits complementodoproduto(
		.X(produto),
		.Controle(Sinal), // caso o sinal seja 1 complementa de 2, caso seja 0 passa pelo modulo mas sem fazer alteracoes
		.S(S)
	);
	
	
	
endmodule