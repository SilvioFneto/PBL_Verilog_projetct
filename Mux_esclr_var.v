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
	wire [7:0] Qa,Qb, Qc;
	wire [1:0] n_contador;
	not (n_contador[1],contador[1]);
	not (n_contador[0],contador[0]);
	
	
	and (seA,n_contador[1],n_contador[0]);
	and (seB,n_contador[1],contador[0]);
	and (seC,contador[1],n_contador[0]);
	
	Mux_manter_valor muxA (
        .q_own(A),
        .X(var),
        .load(seA),
        .valor_var(Qa)
    );
	 
	 Mux_manter_valor muxB (
        .q_own(B),
        .X(var),
        .load(seB),
        .valor_var(Qb)
    );
	 Mux_manter_valor muxC (
        .q_own(C),
        .X(var),
        .load(seC),
        .valor_var(Qc)
    );
	
	
	registrador_8bits regA(
	.clk(clk_btn),
	.reset(reset),
	.entrada_d(Qa),
	.saida_q(A)
	);
	
	registrador_8bits regB(
	.clk(clk_btn),
	.reset(reset),
	.entrada_d(Qb),
	.saida_q(B)
	);
	
	registrador_8bits regC(
		.clk(clk_btn),
		.reset(reset),
		.entrada_d(Qc),
		.saida_q(C)
	);
	
	
endmodule