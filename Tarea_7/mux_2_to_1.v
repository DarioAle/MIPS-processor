/******************************************************************
* Description
*		This is a very simple multiplexor 2 to 1
*      with 32bit buses
* Version:
*	1.0
* Author:
*	Darío Arias Muñoz
* email:
*	darioaam@gmail.com
* Date:
*	12/03/2020
******************************************************************/
module mux_2_to_1
(
	input  [31:0] A,
	input  [31:0] B,
	input       Sel,
	output [31:0] C
);


	assign C = (Sel) ? B : A;

endmodule
//andgate//