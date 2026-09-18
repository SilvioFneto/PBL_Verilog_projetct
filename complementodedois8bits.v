module complementodedois8bits(input [7:0]X, output [7:0]S);
	
	wire [7:0]X_invertido;
	
	
	
	xor (X_invertido[0], X[0], X[7]);
   xor (X_invertido[1], X[1], X[7]);
   xor (X_invertido[2], X[2],X[7]);
   xor (X_invertido[3], X[3], X[7]);
   xor (X_invertido[4], X[4], X[7]);
   xor (X_invertido[5], X[5], X[7]);
   xor (X_invertido[6], X[6], X[7]);
   xor (X_invertido[7], X[7], X[7]);
	
	eightbitsadder somador(

		.A(X_invertido),
      .B(8'b00000000),
      .Ci(X[7]),
      .S(S)
      );
		
		
endmodule