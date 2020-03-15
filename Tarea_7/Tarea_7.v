/******************************************************************
* Description
*		This is an AND gate implemented with one mux
*		2 to 1
* Version:
*	1.0
* Author:
*	Darío Arias Muñoz
* Date:
*	13/03/2020
******************************************************************/
module Tarea_7
(
	input A,
	input B,
	output C
);

mux_2_to_1 m0
(
	.A(A),
	.B(B),
	.Sel(A),
	.C(C)
);
	
endmodule
