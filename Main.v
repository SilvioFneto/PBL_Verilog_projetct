module Main (
    input  wire [7:0] X,
    input  wire btn1,
    input  wire btn2,
    output wire [7:0] A,
    output wire [7:0] B,
    output wire [7:0] C,
    output wire [1:0] S
);
    registrador regis (
        .clock(btn1), .clear(btn2), .X(X),
        .A(A), .B(B), .C(C), .S(S)
    );
endmodule