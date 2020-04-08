module Multiplexer2to1

(
	input Selector,
	input MUX_Data0,
	input MUX_Data1,
	
	output reg MUX_Output

);

	always@(Selector,MUX_Data1,MUX_Data0) begin
		if(Selector)
			MUX_Output = MUX_Data1;
		else
			MUX_Output = MUX_Data0;
	end

endmodule
//mux21//