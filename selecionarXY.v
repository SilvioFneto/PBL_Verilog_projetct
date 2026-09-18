module selecionarXY (
	input [3:0]xbcd,
	input [3:0]xhex,
	input [3:0]ybcd,
	input [3:0]yhex,
	output [3:0]S,
	input sw9,sw8


);
	wire notsw9,notsw8;
	
	wire w00,w01,w02,w03;
   wire w10,w11,w12,w13;
   wire w20,w21,w22,w23;
   wire w30,w31,w32,w33;
	
	not (notsw9,sw9);
	not (notsw8,sw8);
	
	
	
	
	and (w00, xbcd[0], notsw9, notsw8);
	and (w01, xbcd[1], notsw9, notsw8); // (~sw9 ~sw8) Xbcd
   and (w02, xbcd[2], notsw9, notsw8); 
	and (w03, xbcd[3], notsw9, notsw8);
 
   and (w10, xhex[0], notsw9,  sw8);
	and (w11, xhex[1], notsw9,  sw8);
   and (w12, xhex[2], notsw9,  sw8);
	and (w13, xhex[3], notsw9,  sw8);

   and (w20, ybcd[0],  sw9, notsw8);
	and (w21, ybcd[1],  sw9, notsw8);
   and (w22, ybcd[2],  sw9, notsw8);
	and (w23, ybcd[3],  sw9, notsw8);
 
   and (w30, yhex[0],  sw9,  sw8);
	and (w31, yhex[1],  sw9,  sw8);
   and (w32, yhex[2],  sw9,  sw8);
	and (w33, yhex[3],  sw9,  sw8);
 
   or  (S[0], w00, w10, w20, w30);
   or  (S[1], w01, w11, w21, w31);
   or  (S[2], w02, w12, w22, w32);
   or  (S[3], w03, w13, w23, w33);
	
	
	
endmodule