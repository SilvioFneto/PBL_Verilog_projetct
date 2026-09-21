module flipflop_D(
    input  wire clk,    // Sinal de Clock (Relógio)
    input  wire reset,  // Reset assíncrono (Limpa a saída para 0)
    input  wire d,      // Entrada de dados (Data)
    output reg  q,       // Saída armazenada (Bit guardado)
	 output wire q_bar
);

		
	 assign q_bar = ~q;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 1'b0;  
        end else begin
            q <= d;     
        end
    end

endmodule