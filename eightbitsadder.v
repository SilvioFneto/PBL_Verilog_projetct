module eightbitsadder (
	input [7:0]A,
	input [7:0]B,
	input Ci,
	output[7:0]S,
	output Co
);

	wire 	fio_1; 
	
	fourbitsadder addr0(
		.A(A[3:0]),
		.B(B[3:0]),
		.S(S[3:0]),
		.Ci(Ci),
		.Co(fio_1)
	);
	
	fourbitsadder addr1(
		.A(A[7:4]),
		.B(B[7:4]),
		.S(S[7:4]),
		.Ci(fio_1),
		.Co(Co)
	);




endmodule