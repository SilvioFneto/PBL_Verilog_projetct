`timescale 1ns / 1ps

module Main_tb;

    // Entradas do tipo 'reg' para podermos manipular os valores no tempo
    reg [7:0] X;
    reg btn1; // Serve como clock
    reg btn2; // Serve como clear/reset

    // Saídas do tipo 'wire' para receberem os dados do módulo
    wire [7:0] A;
    wire [7:0] B;
    wire [7:0] C;
    wire [1:0] S;

    // Instanciação do módulo Main
    Main uut (
        .X(X),
        .btn1(btn1),
        .btn2(btn2),
        .A(A),
        .B(B),
        .C(C),
        .S(S)
    );

    // Bloco inicial onde as mudanças ocorrem ao longo do tempo
    initial begin
        // Comandos para salvar as ondas para visualização (GTKWave, ModelSim, etc.)
        $dumpfile("simulacao.vcd");
        $dumpvars(0, Main_tb);

        // 0 ns: Reset e Inicialização
        btn2 = 1;      // Ativa o reset (clear)
        btn1 = 0;      // Clock inicial em 0
        X = 8'h00;     // Entrada zerada
        #10;           // Espera 10 ns

        // 10 ns: Preparação do Registrador A
        btn2 = 0;      // Desativa o reset
        X = 8'hAA;     // Define o valor AA (em hexadecimal) para gravar em A
        #10;

        // 20 ns: Gravação no Registrador A
        btn1 = 1;      // Borda de subida (S=00 -> Grava em A)
        #10;

        // 30 ns: Transição A -> B
        btn1 = 0;      // Borda de descida (O contador muda S para 01)
        X = 8'hBB;     // Define o novo valor BB para gravar em B
        #10;

        // 40 ns: Gravação no Registrador B
        btn1 = 1;      // Borda de subida (S=01 -> Grava em B)
        #10;

        // 50 ns: Transição B -> C
        btn1 = 0;      // Borda de descida (O contador muda S para 10)
        X = 8'hCC;     // Define o novo valor CC para gravar em C
        #10;

        // 60 ns: Gravação no Registrador C
        btn1 = 1;      // Borda de subida (S=10 -> Grava em C)
        #10;

        // 70 ns: Desativação do Contador (Estado Final)
        btn1 = 0;      // Borda de descida (O contador muda S para 11)
        X = 8'hFF;     // Muda o valor da entrada, mas não deve ser gravado
        #10;

        // 80 ns em diante: Teste de inércia 
        // Verifica se pulsos extras afetam os registradores (eles devem manter AA, BB e CC)
        btn1 = 1; #10;
        btn1 = 0; #10;

        // Encerra a simulação
        $finish;
    end

endmodule