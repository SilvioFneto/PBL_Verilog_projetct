module raiz(
	input [15:0]raizatual,
	input [15:0]restoatual,
	input[1:0] P,
	output [15:0]novaraiz,
	output [15:0]novoresto

	
);
	wire bit_raiz; 
	
	
	or(novaraiz[15],raizatual[14],1'b0);
	or(novaraiz[14],raizatual[13],1'b0);
	or(novaraiz[13],raizatual[12],1'b0);
	or(novaraiz[12],raizatual[11],1'b0);
	or(novaraiz[11],raizatual[10],1'b0);
	or(novaraiz[10],raizatual[9],1'b0);
	or(novaraiz[9],raizatual[8],1'b0);
	or(novaraiz[8],raizatual[7],1'b0);
	or(novaraiz[7],raizatual[6],1'b0);
	or(novaraiz[6],raizatual[5],1'b0);
	or(novaraiz[5],raizatual[4],1'b0);
	or(novaraiz[4],raizatual[3],1'b0);
	or(novaraiz[3],raizatual[2],1'b0);
	or(novaraiz[2],raizatual[1],1'b0);
	or(novaraiz[1],raizatual[0]);
	or(novaraiz[0],bit_raiz,1'b0);
	wire maior,igual;
	comparador20bits comp(
		.A({2'b00,restoatual,P}),
		.B({2'b00,raizatual,2'b01}),
		.maior(maior),
		.igual(igual)
	);
	
	or(bit_raiz,maior,igual);
	
	wire [17:0] subtracao;
	subtrator18bits sub(
		.A({restoatual,P}),
		.B({raizatual,2'b01}),
		.S(subtracao)
	
	);

	
	wire [1:0]msbs;
	mux2x1 mux(
		.A({restoatual,P}),
		.B(subtracao),
		.C(bit_raiz),
		.S({msbs,novoresto})
	);
	
	
	
	
endmodule