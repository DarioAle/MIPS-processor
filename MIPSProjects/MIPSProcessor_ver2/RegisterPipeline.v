/******************************************************************
* Description
*	This the basic register that is used in the pipeline register
*	It's identical to the other register hardware except it is
*	triggered by negative edge
*	1.0
* Author:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	23/04/2020
******************************************************************/
module RegisterPipeline
#(
	parameter N=32
)
(
	input clk,
	input reset,
	input enable,
	input  [N-1:0] DataInput_dw,
	
	
	output reg [N-1:0] DataOutput_dw
);

always@(negedge reset or negedge clk) begin
	if(reset == 0)
		DataOutput_dw <= 0;
	else	
		if(enable == 1)
			DataOutput_dw <= DataInput_dw;
end

endmodule
//register//