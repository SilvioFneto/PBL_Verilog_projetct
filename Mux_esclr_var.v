module Mux_esclr_var(
	input [1:0]contador,
	input clk_btn,
	input reset,
	input wire [7:0]var,
	output wire [7:0]A,
	output wire [7:0]B,
	output wire [7:0]C
	);
	
	wire [2:0] clk;
	wire [1:0] n_contador;
	not (n_contador[1],contador[1]);
	not (n_contador[0],contador[0]);
	
	
	and (clk[0],contador[1],contador[0],clk_btn);
	and (clk[1],contador[1],n_contador[0],clk_btn);
	and (clk[2],n_contador[1],contador[0],clk_btn);
	
	
	registrador_8bits regA(
	.clk(clk[0]),
	.reset(reset),
	.entrada_d(var),
	.saida_q(A)
	);
	
	registrador_8bits regB(
	.clk(clk[1]),
	.reset(reset),
	.entrada_d(var),
	.saida_q(B)
	);
	
	registrador_8bits regC(
	.clk(clk[2]),
	.reset(reset),
	.entrada_d(var),
	.saida_q(C)
	);