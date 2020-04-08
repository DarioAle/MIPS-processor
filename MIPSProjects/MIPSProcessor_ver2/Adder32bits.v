/******************************************************************
* Description
*	This is a  an adder that can be parameterized in its bit-width.
*	1.0
* Authors:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	07/04/2020
******************************************************************/

module Adder32bits
#
(
	parameter NBits=32
)
(
	input [NBits-1:0] in_Data0,
	input [NBits-1:0] in_Data1,
	
	output [NBits-1:0] out_Result
);

assign out_Result = in_Data1 + in_Data0;


endmodule
//adder32//