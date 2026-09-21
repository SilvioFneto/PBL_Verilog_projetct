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
	 Carry,
	 clock_FPGA,
	 gnd
);
	 input  [7:0] X;
    input sw9,sw8,btn1,btn2;
	 input clock_FPGA;
	 input gnd;
	 output Overflow,Zero,Erro,Carry;
	 output [6:0] sinal,dezmil,mil,cem,dez,um;
	 
	 wire [1:0] numero;
	 wire [7:0] A,B,C;
	 
	 divisor_clock(
		.clk_50(clock_FPGA),
		.reset(gnd),
		.sq_wave(clk_padrao)
		
	 );
	 contador c1(
		.clk(clk_padrao),
		.reset(gnd),
		.q(numero)
	 );
	 
	 Mux_esclr_var(
		.contador(numero),
	.clk_btn(clk_padrao),
	.reset(gnd),
	.var(X),
	.A(A),
	.B(B),
	.C(C)
	 );
	 
	  conversor_8bit_bcd conversor1(
		.X(A),
		.cent(A_Bcdcem),
		.dez(A_Bcddez),
		.uni(A_Bcdum)
	 );
	 
	 display Centena  ( 
		.E(A_Bcdcem),
		.S(cem)    
	 );
    display Dezena   (
		.E(A_Bcddez),
		.S(dez) 
	 );
    display Unidade  ( 
	 .E(A_Bcdum), 
    .S(um) 
	);

endmodule