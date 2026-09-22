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
	 Overflow,
	 Zero,
	 Erro,
	 Carry,
	 clock_FPGA
);
	 input  [7:0] X;
    input sw9,sw8,btn1,btn2;
	 input clock_FPGA;
	 output Overflow,Zero,Erro,Carry;
	 output [6:0]dezmil,mil,cem,dez,um;
	 
	 wire [1:0] numero;
	 wire [7:0] A,B,C;
	 
	 
	 debounce db1(
		.clk(clock_FPGA),
		.reset(1'b0),
		.btn_in(btn1),
		.btn_out(btn1_cln),
		.pulso(btn1_pls)
	 );
	 
	 debounce db2(
		.clk(clock_FPGA),
		.btn_in(btn2),
		.reset(1'b0),
		.btn_out(btn2_cln),
		.pulso(btn2_pls)
	 );
	 
	 divisor_clock(
		.clk_50(clock_FPGA),
		.reset(btn2_cln),
		.clk(clk_padrao)
		
	 );
	 contador c1(
		.clk(btn1_pls),
		.reset(btn2_cln),
		.q(numero)
	 );
	 
	 Mux_esclr_var (
		.contador(numero),
		.clk_btn(clk_padrao),
		.reset(btn2_cln),
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