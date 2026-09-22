module debounce (
    input  wire clk,        // clock de amostragem (use um clock LENTO, ex: clk_padrao do divisor_clock)
    input  wire reset,
    input  wire btn_in,   // sinal BRUTO da placa: 1 = solto, 0 = apertado (ativo-baixo)
    output wire btn_out,  // sinal limpo, ja convertido pra ativo-alto: 1 = apertado, 0 = solto
    output wire pulso       // 1 pulso de clock no instante em que o botao e apertado
);
 
    wire botao_ativo_alto;    // botao_in invertido: 1 = apertado, 0 = solto
    wire q0, q1, q2, q3;      // registrador de deslocamento (amostras do botao)
    wire botao_out_ant;
    wire botao_out_bar;
    wire n_botao_out_ant;
    wire todas_1, todas_0;    // resultado das comparacoes combinacionais
 
    // --- Corrige a polaridade: a placa manda 0 quando apertado, entao inverte aqui ---
    not (botao_ativo_alto, botao_in);
 
    // Cadeia de amostragem: desloca o valor do botao a cada borda de clk ---
    flipflop_D ffs0 (.clk(clk), .reset(reset), .d(botao_ativo_alto), .q(q0));
    flipflop_D ffs1 (.clk(clk), .reset(reset), .d(q0),       .q(q1));
    flipflop_D ffs2 (.clk(clk), .reset(reset), .d(q1),       .q(q2));
    flipflop_D ffs3 (.clk(clk), .reset(reset), .d(q2),       .q(q3));
 
    // --- Logica combinacional: as 4 ultimas amostras concordam? ---
    and (todas_1, q0, q1, q2, q3);   // 1 somente se as 4 amostras forem 1 (botao estavel pressionado)
    nor (todas_0, q0, q1, q2, q3);   // 1 somente se as 4 amostras forem 0 (botao estavel solto)
 
    // --- Latch SR (NOR cruzado): guarda o ultimo estado estavel, sem usar always ---
    // set = todas_1 -> forca saida em 1 | reset = todas_0 -> forca saida em 0
    nor (botao_out,     todas_0, botao_out_bar);
    nor (botao_out_bar, todas_1, botao_out);
 
    // --- Deteccao de borda de subida, para gerar um pulso de 1 ciclo ---
    flipflop_D ff_ant (.clk(clk), .reset(reset), .d(botao_out), .q(botao_out_ant));
    not (n_botao_out_ant, botao_out_ant);
    and (pulso, botao_out, n_botao_out_ant);
 
endmodule