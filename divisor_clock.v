module divisor_clock (
    input  wire clk_50, 
    input  wire reset,     
    output wire clk   
);

    
    wire [23:0] w_clk;

    // Estágio 0: Entrada do clock principal (clk_50)
    flipflop_T ff0  (.clk(clk_50),    .reset(reset), .t(1'b1), .q(w_clk[0]));
    flipflop_T ff1  (.clk(w_clk[0]),  .reset(reset), .t(1'b1), .q(w_clk[1]));
    flipflop_T ff2  (.clk(w_clk[1]),  .reset(reset), .t(1'b1), .q(w_clk[2]));
    flipflop_T ff3  (.clk(w_clk[2]),  .reset(reset), .t(1'b1), .q(w_clk[3]));
    flipflop_T ff4  (.clk(w_clk[3]),  .reset(reset), .t(1'b1), .q(w_clk[4]));
    flipflop_T ff5  (.clk(w_clk[4]),  .reset(reset), .t(1'b1), .q(w_clk[5]));
    flipflop_T ff6  (.clk(w_clk[5]),  .reset(reset), .t(1'b1), .q(w_clk[6]));
    flipflop_T ff7  (.clk(w_clk[6]),  .reset(reset), .t(1'b1), .q(w_clk[7]));
    flipflop_T ff8  (.clk(w_clk[7]),  .reset(reset), .t(1'b1), .q(w_clk[8]));
    flipflop_T ff9  (.clk(w_clk[8]),  .reset(reset), .t(1'b1), .q(w_clk[9]));
    flipflop_T ff10 (.clk(w_clk[9]),  .reset(reset), .t(1'b1), .q(w_clk[10]));
    flipflop_T ff11 (.clk(w_clk[10]), .reset(reset), .t(1'b1), .q(w_clk[11]));
    flipflop_T ff12 (.clk(w_clk[11]), .reset(reset), .t(1'b1), .q(w_clk[12]));
    flipflop_T ff13 (.clk(w_clk[12]), .reset(reset), .t(1'b1), .q(w_clk[13]));
    flipflop_T ff14 (.clk(w_clk[13]), .reset(reset), .t(1'b1), .q(w_clk[14]));
    flipflop_T ff15 (.clk(w_clk[14]), .reset(reset), .t(1'b1), .q(w_clk[15]));
    flipflop_T ff16 (.clk(w_clk[15]), .reset(reset), .t(1'b1), .q(w_clk[16]));
    flipflop_T ff17 (.clk(w_clk[16]), .reset(reset), .t(1'b1), .q(w_clk[17]));
    flipflop_T ff18 (.clk(w_clk[17]), .reset(reset), .t(1'b1), .q(w_clk[18]));
    flipflop_T ff19 (.clk(w_clk[18]), .reset(reset), .t(1'b1), .q(w_clk[19]));
    flipflop_T ff20 (.clk(w_clk[19]), .reset(reset), .t(1'b1), .q(w_clk[20]));
    flipflop_T ff21 (.clk(w_clk[20]), .reset(reset), .t(1'b1), .q(w_clk[21]));
    flipflop_T ff22 (.clk(w_clk[21]), .reset(reset), .t(1'b1), .q(w_clk[22]));
    flipflop_T ff23 (.clk(w_clk[22]), .reset(reset), .t(1'b1), .q(w_clk[23]));

    // Estágio final (ff24): Conecta a última saída diretamente à saída 'clk' do módulo
    flipflop_T ff24 (.clk(w_clk[23]), .reset(reset), .t(1'b1), .q(clk));

endmodule