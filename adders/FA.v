module FA(A,B,COUT,CIN,SUM);

input A,B,CIN;
output COUT,SUM;

	assign COUT = 	(A&B|A&CIN|B&CIN);
	assign SUM 	= 	(A^B^CIN);
endmodule