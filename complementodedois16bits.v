module complementodedois16bits(
	input [15:0]X,
	output [15:0]S,
	input Controle

);

	
	wire [15:0]X_invertido;
	
	
	
	xor (X_invertido[0], X[0], Controle);
   xor (X_invertido[1], X[1], Controle);
   xor (X_invertido[2], X[2],Controle);
   xor (X_invertido[3], X[3], Controle);
   xor (X_invertido[4], X[4], Controle);
   xor (X_invertido[5], X[5], Controle);
   xor (X_invertido[6], X[6], Controle);
   xor (X_invertido[7], X[7], Controle);
	xor (X_invertido[8], X[8], Controle);
   xor (X_invertido[9], X[9], Controle);
   xor (X_invertido[10], X[10],Controle);
   xor (X_invertido[11], X[11], Controle);
   xor (X_invertido[12], X[12], Controle);
   xor (X_invertido[13], X[13], Controle);
   xor (X_invertido[14], X[14], Controle);
   xor (X_invertido[15], X[15], Controle);
	
	somador16bits somador(

		.A(X_invertido),
      .B(8'b0000000000000000),
      .Ci(Controle),
      .S(S)
      );
		
		
endmodule