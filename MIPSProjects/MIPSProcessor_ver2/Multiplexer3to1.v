/******************************************************************
* Description
*	This is a  an 3to1 multiplexer that can be parameterized in its bit-width.
*	1.0
* Author:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	03/05/2020
******************************************************************/

module Multiplexer3to1
#(
	parameter NBits=32
)
(
	input [1:0]       in_Selector_2,
	input [NBits-1:0] MUX_Data00_dw,
	input [NBits-1:0] MUX_Data01_dw,
	input [NBits-1:0] MUX_Data10_dw,
	
	output reg [NBits-1:0] MUX_Output_dw
);

localparam Select_00    = 2'b 00;
localparam Select_01    = 2'b 01;
localparam Select_10    = 2'b 10;

	always@(in_Selector_2,MUX_Data00_dw,MUX_Data01_dw, MUX_Data10_dw) begin
		case(in_Selector_2)
			Select_00: MUX_Output_dw = MUX_Data00_dw;
			Select_01: MUX_Output_dw = MUX_Data01_dw;
			Select_10: MUX_Output_dw = MUX_Data10_dw;
		endcase
	end

endmodule
//mux21//