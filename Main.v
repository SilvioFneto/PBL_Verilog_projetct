module Main(
    X,
	 sw9,
	 sw8,
	 btn1,
	 btn2,
    dezmil,
    mil,
    cem,
    dez,
    um,
	 sinal,
	 Overflow,
	 Zero,
	 Erro,
	 Carry
);
	 input  [7:0] X;
    input sw9,sw8,btn1,btn2;
	 output Overflow,Zero,Erro,Carry;
	 output [6:0] sinal,dezmil,mil,cem,dez,um;
	 wire var_A;
	 
	 
	/*

    //wire Co2, Co3;
    wire [15:0] result_y;  
	 wire [7:0]X_desconvertido, X_em_bcd;
    wire [3:0]  Y_Bcddezmil, Y_Bcdmil, Y_Bcdcem, Y_Bcddez, Y_Bcdum;
	 wire [3:0]  X_Bcdcem, X_Bcddez, X_Bcdum;
	 wire [3:0] K_dezmil, K_mil, K_cem, K_dez, K_um; // K é X ou Y deppois de ser selecionado pelo modulo selecionar XY
	 
	
	// parte sobre X ---------------------------------------
	 complementodedois8bits xabs (
		.X(X),
		.S(X_desconvertido)
		
	 );
	 
	 conversor_8bit_bcd conversor1(
		.X(X_desconvertido),
		.cent(X_Bcdcem),
		.dez(X_Bcddez),
		.uni(X_Bcdum)
	 );
	 
	 

	 
	// exibe o sinal de X, SO UTILIZAR QUANDO QUISEREXIBIR O X 
	wire nsw9;
	not (nsw9,sw9);
	 
	nand exibirsinal (sinal[6],X[7],nsw9); // segmento g acende se o bit mais significatico de X for 1
	not (sinal[5], 1'b0);  // apaga todos outros segmentos do displau
   not (sinal[4], 1'b0);  
   not (sinal[3],  1'b0); 
   not (sinal[2], 1'b0);  
   not (sinal[1], 1'b0);  
   not (sinal[0], 1'b0);  
	 
	
	//	x² - 5x + 6
	wire [15:0] produto5vezesx, xaoquadrado,somaparcial;
	
		
	
	multiplicador xvezesx(
		.Asing(X),
		.Bsing(X),
		.P(xaoquadrado) // em modulo == complemento de 2 pois sempre positivo
	
	);
	
	termoprimeirograu xvezes5(
		.X(X),
		.S(produto5vezesx), // ja em complemento de 2
	);
	
	// primeira soma X² + (-5x) 
	
	wire Co1,Co2;
	
	somador16bits s1(
		.A(xaoquadrado),
		.B(produto5vezesx),
		.Co(Co1),
		.S(somaparcial)
	
	);
	
	somador16bits s2(
		.A(somaparcial),
		.B(16'b0000000000000110), // 6 em binario 16bits
		.Co(Co2),
		.S(result_y)
	
	);
	
	//carry
	or (Carry,Co1,Co2);
	
	
	// raizzz
	
	raiz detectarraiz(
		.E(result_y),
		.S(Zero)
	);
	
	//erro
	wire err1,err2;
	erro detectarerro1(
		.botao(btn1),
		.erro(err1)
	
	);
	
	erro detectarerro2(
		.botao(btn2),
		.erro(err2)
	);
	
	or(Erro,err1,err2);
	
	
	
	bin16_para_bcd conversor(
        .P(result_y),
        .dezMil(Y_Bcddezmil),
        .mil(Y_Bcdmil),
        .cent(Y_Bcdcem),
        .dez(Y_Bcddez),
        .uni(Y_Bcdum)
   );
	
	
	 
	 
    // parte de selecao se mostra o X ou o Y
	 selecionarXY  xyparahex0 (
		.xbcd(X_Bcdum),
		.xhex(X_desconvertido[3:0]),
		.ybcd(Y_Bcdum),
		.yhex(result_y[3:0]),
		.sw9(sw9),
		.sw8(sw8),
		.S(K_um)
	 
	 );
	 
	 
	 
	 selecionarXY xyparahex1(
		.xbcd(X_Bcddez),
		.xhex(X_desconvertido[7:4]), /// tem que ignorar o bit do sinal 
		.ybcd(Y_Bcddez),
		.yhex(result_y[7:4]),
		.sw9(sw9),
		.sw8(sw8),
		.S(K_dez)
	 
	 );
	 
	 selecionarXY xyparahex2(
		.xbcd(X_Bcdcem),
		.xhex(4'b0000),
		.ybcd(Y_Bcdcem),
		.yhex(result_y[11:8]),
		.sw9(sw9),
		.sw8(sw8),
		.S(K_cem)
	 
	 );
	 selecionarXY xyparahex3(
		.xbcd(4'b0000),
		.xhex(4'b0000),
		.ybcd(Y_Bcdmil),
		.yhex(result_y[15:12]),
		.sw9(sw9),
		.sw8(sw8),
		.S(K_mil)
	 
	 );
	 
	 selecionarXY xyparahex4(
		.xbcd(4'b0000),
		.xhex(4'b0000),
		.ybcd(Y_Bcddezmil),
		.yhex(4'b0000),
		.sw9(sw9),
		.sw8(sw8),
		.S(K_dezmil)
	 
	 );
	 */
	 
	 
    //displays
   
	//começo
	
	registrador_8bits regA(
	.clk(clk),
	.reset(reset),
	.entrada_d(X),
	.saida_q(var_A)
	
	);
	
	
	
	
	
	
	
    display Dezmilhar(
		.E(K_dezmil), 
		.S(dezmil) 
	 );
    display Milhar   ( 
		.E(K_mil),
		.S(mil)
	);
    display Centena  ( 
		.E(K_cem),
		.S(cem)    
	 );
    display Dezena   (
		.E(K_dez),
		.S(dez) 
	 );
    display Unidade  ( 
	 .E(K_um), 
    .S(um) 
	);

endmodule