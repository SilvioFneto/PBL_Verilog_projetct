module calcularraiz(
    input [17:0] N,
    output [15:0] raizfinal,
    output [15:0] restofinal
);

    wire [15:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
    wire [15:0] s0,s1,s2,s3,s4,s5,s6,s7,s8,s9;

    raiz i0(.raizatual(16'b0), .restoatual(16'b0), .P(N[17:16]), .novaraiz(r1), .novoresto(s1));
    raiz i1(.raizatual(r1), .restoatual(s1), .P(N[15:14]), .novaraiz(r2), .novoresto(s2));
    raiz i2(.raizatual(r2), .restoatual(s2), .P(N[13:12]), .novaraiz(r3), .novoresto(s3));
    raiz i3(.raizatual(r3), .restoatual(s3), .P(N[11:10]), .novaraiz(r4), .novoresto(s4));
    raiz i4(.raizatual(r4), .restoatual(s4), .P(N[9:8]),   .novaraiz(r5), .novoresto(s5));
    raiz i5(.raizatual(r5), .restoatual(s5), .P(N[7:6]),   .novaraiz(r6), .novoresto(s6));
    raiz i6(.raizatual(r6), .restoatual(s6), .P(N[5:4]),   .novaraiz(r7), .novoresto(s7));
    raiz i7(.raizatual(r7), .restoatual(s7), .P(N[3:2]),   .novaraiz(r8), .novoresto(s8));
    raiz i8(.raizatual(r8), .restoatual(s8), .P(N[1:0]),   .novaraiz(raizfinal), .novoresto(restofinal));


endmodule