module fourbitsadder (
	input [3:0]A,
	input [3:0]B,
	input Ci,
	output [3:0]S,
	output Co
);

	wire fio_1,fio_2,fio_3;
	
	fulladder addr0(
		
		.A(A[0]),
		.B(B[0]),
		.S(S[0]),
		.Ci(Ci),
		.Co(fio_1)
	);

	fulladder addr1(
		.A(A[1]),
		.B(B[1]),
		.S(S[1]),
		.Ci(fio_1),
		.Co(fio_2)
	);

	fulladder addr2(
		.A(A[2]),
		.B(B[2]),
		.S(S[2]),
		.Ci(fio_2),
		.Co(fio_3)
	);

	fulladder addr3(
		.A(A[3]),
		.B(B[3]),
		.S(S[3]),
		.Ci(fio_3),
		.Co(Co)
	);
endmodule
	