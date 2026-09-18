module adicionar3 (
    input  [3:0] A,
    output [3:0] S
);

    wire maior5;
    wire a1_or_a0;
    wire a2_and;



    wire soma0_sel,soma1_sel, soma2_sel ,soma3_sel;

    wire A0_sel, A1_sel,A2_sel,A3_sel;


    // A >= 5 quando A3 or (A2 and (A1 or A0))

    or  (a1_or_a0, A[1], A[0]);
    and (a2_and, A[2], a1_or_a0);
    or  (maior5, A[3], a2_and);

	 wire [3:0]soma3ou0;
	 
	 and(soma3ou0[3],1'b0,1'b0);
	 and(soma3ou0[2],1'b0,1'b0);
	 or (soma3ou0[1],maior5,1'b0);
	 or (soma3ou0[0],maior5,1'b0);

    // A + 3

    fourbitsadder soma3 (
        .A(A),
        .B(soma3ou0),
        .Ci(1'b0),
        .S(S)
    );


    // maior5 = 0 → A
    // maior5 = 1 → A + 3

    
endmodule