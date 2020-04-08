/******************************************************************
* Description
*	This is a register of 32-bit that corresponds to the PC counter. 
*	This register does not have an enable signal.
* Version:
*	1.0
* Authos:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	08/04/2020
******************************************************************/

module PC_Register
#(
	parameter N=32
)
(
	input clk,
	input reset,
	input  [N-1:0] in_NewPC_dw,
	
	
	output reg [N-1:0] o_PCValue_dw
);

always@(negedge reset or posedge clk) begin
	if(reset == 0)
		o_PCValue_dw <= 0;
	else	
		o_PCValue_dw <= {12'h 0, in_NewPC_dw[19 : 0]};
end

endmodule
//pcreg//