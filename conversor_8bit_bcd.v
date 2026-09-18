module conversor_8bit_bcd (
    input  [7:0] X,

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



    // 8 ETAPAS

    doubledable e1 (
        .BCD_in(bcd0),
        .bit_in(X[7]),
        .BCD_out(bcd1)
    );

    doubledable e2 (
        .BCD_in(bcd1),
        .bit_in(X[6]),
        .BCD_out(bcd2)
    );

    doubledable e3 (
        .BCD_in(bcd2),
        .bit_in(X[5]),
        .BCD_out(bcd3)
    );

    doubledable e4 (
        .BCD_in(bcd3),
        .bit_in(X[4]),
        .BCD_out(bcd4)
    );

    doubledable e5 (
        .BCD_in(bcd4),
        .bit_in(X[3]),
        .BCD_out(bcd5)
    );

    doubledable e6 (
        .BCD_in(bcd5),
        .bit_in(X[2]),
        .BCD_out(bcd6)
    );

    doubledable e7 (
        .BCD_in(bcd6),
        .bit_in(X[1]),
        .BCD_out(bcd7)
    );

    doubledable e8 (
        .BCD_in(bcd7),
        .bit_in(X[0]),
        .BCD_out(bcd8)
    );


    

    
    or (cent[3], bcd8[11], 1'b0);
    or (cent[2], bcd8[10], 1'b0);
    or (cent[1], bcd8[9],  1'b0);
    or (cent[0], bcd8[8],  1'b0);

    or (dez[3], bcd8[7], 1'b0);
    or (dez[2], bcd8[6], 1'b0);
    or (dez[1], bcd8[5], 1'b0);
    or (dez[0], bcd8[4], 1'b0);

    or (uni[3], bcd8[3], 1'b0);
    or (uni[2], bcd8[2], 1'b0);
    or (uni[1], bcd8[1], 1'b0);
    or (uni[0], bcd8[0], 1'b0);

endmodule