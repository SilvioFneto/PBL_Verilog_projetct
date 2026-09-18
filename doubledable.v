module doubledable (
    input  [19:0] BCD_in,
    input  bit_in,
    output [19:0] BCD_out
);

    wire [3:0] dezMil_add3;
    wire [3:0] mil_add3;
    wire [3:0] cent_add3;
    wire [3:0] dez_add3;
    wire [3:0] uni_add3;


   
    // ADICIONA 3 se o numedo for maior ou igual a 5
   

    adicionar3 d0 (
        .A(BCD_in[19:16]),
        .S(dezMil_add3)
    );

    adicionar3 d1 (
        .A(BCD_in[15:12]),
        .S(mil_add3)
    );

    adicionar3 d2 (
        .A(BCD_in[11:8]),
        .S(cent_add3)
    );

    adicionar3 d3 (
        .A(BCD_in[7:4]),
        .S(dez_add3)
    );

    adicionar3 d4 (
        .A(BCD_in[3:0]),
        .S(uni_add3)
    );




    or (BCD_out[19], dezMil_add3[2], 1'b0);
    or (BCD_out[18], dezMil_add3[1], 1'b0);
    or (BCD_out[17], dezMil_add3[0], 1'b0);

    or (BCD_out[16], mil_add3[3], 1'b0);

    or (BCD_out[15], mil_add3[2], 1'b0);
    or (BCD_out[14], mil_add3[1], 1'b0);
    or (BCD_out[13], mil_add3[0], 1'b0);

    or (BCD_out[12], cent_add3[3], 1'b0);

    or (BCD_out[11], cent_add3[2], 1'b0);
    or (BCD_out[10], cent_add3[1], 1'b0);
    or (BCD_out[9],  cent_add3[0], 1'b0);

    or (BCD_out[8], dez_add3[3], 1'b0);

    or (BCD_out[7], dez_add3[2], 1'b0);
    or (BCD_out[6], dez_add3[1], 1'b0);
    or (BCD_out[5], dez_add3[0], 1'b0);

    or (BCD_out[4], uni_add3[3], 1'b0);

    or (BCD_out[3], uni_add3[2], 1'b0);
    or (BCD_out[2], uni_add3[1], 1'b0);
    or (BCD_out[1], uni_add3[0], 1'b0);

    or (BCD_out[0], bit_in, 1'b0);

endmodule