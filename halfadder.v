module halfadder(
	input A,
	input B,
	output S,
	output Co
);

	xor Xor0(S,A,B);
	and And0(Co,A,B);
	
endmodule
	