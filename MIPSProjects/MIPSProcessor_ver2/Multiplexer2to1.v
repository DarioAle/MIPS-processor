/******************************************************************
* Description
*	This is a  an 2to1 multiplexer that can be parameterized in its bit-width.
*	1.0
* Author:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	07/04/2020
******************************************************************/

module Multiplexer2to1
#(
	parameter NBits=32
)
(
	input in_Selector,
	input [NBits-1:0] MUX_Data0_dw,
	input [NBits-1:0] MUX_Data1_dw,
	
	output reg [NBits-1:0] MUX_Output_dw
);

	always@(in_Selector,MUX_Data1_dw,MUX_Data0_dw) begin
		if(in_Selector)
			MUX_Output_dw = MUX_Data1_dw;
		else
			MUX_Output_dw = MUX_Data0_dw;
	end

endmodule
//mux21//