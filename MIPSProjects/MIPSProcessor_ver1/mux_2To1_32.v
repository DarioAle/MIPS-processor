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
module mux_2To1_32
(
	input  [31:0] in_channelA_32,
	input  [31:0] in_channelB_32,
	input       in_selector,
	
	output [31:0] out_Zoutput_32
);


	assign out_Zoutput_32 = (in_selector) ? in_channelB_32 : in_channelA_32;

endmodule
//andgate//