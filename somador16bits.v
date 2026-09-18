module somador16bits (
    input [15:0] A,
    input [15:0] B,
    input Ci,
    output [15:0] S,
    output Co
);
    wire fio_1;

    eightbitsadder s1 (
        .A(A[7:0]),
        .B(B[7:0]),
        .Ci(Ci),
        .S(S[7:0]),
        .Co(fio_1)
    );

    eightbitsadder s2 (
        .A(A[15:8]),
        .B(B[15:8]),
        .Ci(fio_1),
        .S(S[15:8]),
        .Co(Co)
    );
endmodule
