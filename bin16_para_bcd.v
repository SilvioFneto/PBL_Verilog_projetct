module bin16_para_bcd (
    input  [15:0] P,

    output [3:0] dezMil,
    output [3:0] mil,
    output [3:0] cent,
    output [3:0] dez,
    output [3:0] uni
);

    wire [19:0] bcd0;
    wire [19:0] bcd1;
    wire [19:0] bcd2;
    wire [19:0] bcd3;
    wire [19:0] bcd4;
    wire [19:0] bcd5;
    wire [19:0] bcd6;
    wire [19:0] bcd7;
    wire [19:0] bcd8;
    wire [19:0] bcd9;
    wire [19:0] bcd10;
    wire [19:0] bcd11;
    wire [19:0] bcd12;
    wire [19:0] bcd13;
    wire [19:0] bcd14;
    wire [19:0] bcd15;
    wire [19:0] bcd16;


    

    or (bcd0[19], 1'b0, 1'b0);
    or (bcd0[18], 1'b0, 1'b0);
    or (bcd0[17], 1'b0, 1'b0);
    or (bcd0[16], 1'b0, 1'b0);
    or (bcd0[15], 1'b0, 1'b0);
    or (bcd0[14], 1'b0, 1'b0);
    or (bcd0[13], 1'b0, 1'b0);
    or (bcd0[12], 1'b0, 1'b0);
    or (bcd0[11], 1'b0, 1'b0);
    or (bcd0[10], 1'b0, 1'b0);
    or (bcd0[9],  1'b0, 1'b0);
    or (bcd0[8],  1'b0, 1'b0);
    or (bcd0[7],  1'b0, 1'b0);
    or (bcd0[6],  1'b0, 1'b0);
    or (bcd0[5],  1'b0, 1'b0);
    or (bcd0[4],  1'b0, 1'b0);
    or (bcd0[3],  1'b0, 1'b0);
    or (bcd0[2],  1'b0, 1'b0);
    or (bcd0[1],  1'b0, 1'b0);
    or (bcd0[0],  1'b0, 1'b0);



    // 16 ETAPAS


    doubledable e1 (
        .BCD_in(bcd0),
        .bit_in(P[15]),
        .BCD_out(bcd1)
    );

    doubledable e2 (
        .BCD_in(bcd1),
        .bit_in(P[14]),
        .BCD_out(bcd2)
    );

    doubledable e3 (
        .BCD_in(bcd2),
        .bit_in(P[13]),
        .BCD_out(bcd3)
    );

    doubledable e4 (
        .BCD_in(bcd3),
        .bit_in(P[12]),
        .BCD_out(bcd4)
    );

    doubledable e5 (
        .BCD_in(bcd4),
        .bit_in(P[11]),
        .BCD_out(bcd5)
    );

    doubledable e6 (
        .BCD_in(bcd5),
        .bit_in(P[10]),
        .BCD_out(bcd6)
    );

    doubledable e7 (
        .BCD_in(bcd6),
        .bit_in(P[9]),
        .BCD_out(bcd7)
    );

    doubledable e8 (
        .BCD_in(bcd7),
        .bit_in(P[8]),
        .BCD_out(bcd8)
    );

    doubledable e9 (
        .BCD_in(bcd8),
        .bit_in(P[7]),
        .BCD_out(bcd9)
    );

    doubledable e10 (
        .BCD_in(bcd9),
        .bit_in(P[6]),
        .BCD_out(bcd10)
    );

    doubledable e11 (
        .BCD_in(bcd10),
        .bit_in(P[5]),
        .BCD_out(bcd11)
    );

    doubledable e12 (
        .BCD_in(bcd11),
        .bit_in(P[4]),
        .BCD_out(bcd12)
    );

    doubledable e13 (
        .BCD_in(bcd12),
        .bit_in(P[3]),
        .BCD_out(bcd13)
    );

    doubledable e14 (
        .BCD_in(bcd13),
        .bit_in(P[2]),
        .BCD_out(bcd14)
    );

    doubledable e15 (
        .BCD_in(bcd14),
        .bit_in(P[1]),
        .BCD_out(bcd15)
    );

    doubledable e16 (
        .BCD_in(bcd15),
        .bit_in(P[0]),
        .BCD_out(bcd16)
    );




    or (dezMil[3], bcd16[19], 1'b0);
    or (dezMil[2], bcd16[18], 1'b0);
    or (dezMil[1], bcd16[17], 1'b0);
    or (dezMil[0], bcd16[16], 1'b0);

    or (mil[3], bcd16[15], 1'b0);
    or (mil[2], bcd16[14], 1'b0);
    or (mil[1], bcd16[13], 1'b0);
    or (mil[0], bcd16[12], 1'b0);

    or (cent[3], bcd16[11], 1'b0);
    or (cent[2], bcd16[10], 1'b0);
    or (cent[1], bcd16[9],  1'b0);
    or (cent[0], bcd16[8],  1'b0);

    or (dez[3], bcd16[7], 1'b0);
    or (dez[2], bcd16[6], 1'b0);
    or (dez[1], bcd16[5], 1'b0);
    or (dez[0], bcd16[4], 1'b0);

    or (uni[3], bcd16[3], 1'b0);
    or (uni[2], bcd16[2], 1'b0);
    or (uni[1], bcd16[1], 1'b0);
    or (uni[0], bcd16[0], 1'b0);

endmodule