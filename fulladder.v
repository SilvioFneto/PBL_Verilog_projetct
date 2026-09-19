module fulladder(
	input A,
	input B,
	input Ci,
	output S,
	output Co
);

	wire fio_1, fio_2,fio_3;	
	
	halfadder halfadder1 (
		.A(A),
		.B(B),
		.S(fio_1),
		.Co(fio_2)
	);

	halfadder halfadder2 (
		.A(Ci),
		.B(fio_1),
		.S(S),
		.Co(fio_3)
	);
	
	or Or0(Co,fio_2,fio_3);
	
endmodule	