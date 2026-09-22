module flipflop_T (
    input  wire clk,
    input  wire reset,
    input  wire t,
    output reg  q
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 1'b0;
        end else begin
            if (t)
                q <= ~q; // Comuta a saída Q se T = 1
            else
                q <= q;  // Mantém o valor anterior
        end
    end
endmodule