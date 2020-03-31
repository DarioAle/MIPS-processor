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
module mux_2To1_shamt
(
	input  [4:0] in_channelA_5,
	input  [4:0] in_channelB_5,
	input  [4:0] in_selector_5,
	
	output [4:0] out_Zoutput_5
);


	assign out_Zoutput_5 = (in_selector_5 == 5'b 00111) ? in_channelB_5 : in_channelA_5;

endmodule
//andgate//