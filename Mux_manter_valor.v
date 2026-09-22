module Mux_manter_valor(
	input [7:0] q_own,
	input [7:0] X,
	input load,
	output [7:0] valor_var
);
	wire [7:0] valor_x, valor_q;
	wire n_load;
	
	not(n_load,load);

	and(valor_x[0],load,X[0]);
	and(valor_x[1],load,X[1]);
	and(valor_x[2],load,X[2]);
	and(valor_x[3],load,X[3]);
	and(valor_x[4],load,X[4]);
	and(valor_x[5],load,X[5]);
	and(valor_x[6],load,X[6]);
	and(valor_x[7],load,X[7]);
	

	and(valor_q[0],n_load,q_own[0]);
	and(valor_q[1],n_load,q_own[1]);
	and(valor_q[2],n_load,q_own[2]);
	and(valor_q[3],n_load,q_own[3]);
	and(valor_q[4],n_load,q_own[4]);
	and(valor_q[5],n_load,q_own[5]);
	and(valor_q[6],n_load,q_own[6]);
	and(valor_q[7],n_load,q_own[7]);
	
	
	or  (valor_var[0], valor_x[0], valor_q[0]);
   or  (valor_var[1], valor_x[1], valor_q[1]);
   or  (valor_var[2], valor_x[2], valor_q[2]);
   or  (valor_var[3], valor_x[3], valor_q[3]);
	or  (valor_var[4], valor_x[4], valor_q[4]);
   or  (valor_var[5], valor_x[5], valor_q[5]);
   or  (valor_var[6], valor_x[6], valor_q[6]);
   or  (valor_var[7], valor_x[7], valor_q[7]);


endmodule


