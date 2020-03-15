`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:13:41 13/03/2020
// Design Name:   mips_opcode_deocder
// Module Name:   C:/Arqui/Tarea_7
// Project Name:  Tarea_7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips_opcode_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_mips_decoder_opcode;

	// Inputs
	reg [5:0] in_opcode;

	// Outputs
	wire  out_Type_I;
	wire  out_Type_J;
	wire  out_Type_R;

mips_decoder_opcode uut
(
	.in_opcode_6(in_opcode),
	.out_I_type(out_Type_I),
	.out_R_type(out_Type_R),
	.out_J_type(out_Type_J)

);

	initial begin
		// Initialize Inputs
		in_opcode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
	end
	
	always begin
		#5 in_opcode <= in_opcode + 1'b1;
    end
	 

endmodule

