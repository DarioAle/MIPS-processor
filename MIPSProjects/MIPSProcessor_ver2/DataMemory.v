/******************************************************************
* Description
*	This is the data memory for the MIPS processor
*	1.0
* Author:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	07/04/2014
******************************************************************/

module DataMemory 
#(	parameter DATA_WIDTH   = 32,
	parameter MEMORY_DEPTH = 256
)

(
	input [DATA_WIDTH-1:0] in_WriteData_dw,
	input [DATA_WIDTH-1:0] in_Address_dw,
	input in_MemWrite,
	input in_MemRead,
	input clk,

	output  [DATA_WIDTH-1:0]  o_ReadData_dw
);
	
	wire [(DATA_WIDTH - 1):0] w_RealAddress_dw;
	assign w_RealAddress_dw = {2'b 0, in_Address_dw[(DATA_WIDTH - 1) : 2]};

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram [MEMORY_DEPTH-1:0];
	wire [DATA_WIDTH-1:0] w_ReadDataAux_dw;


	initial
	begin
		$readmemh("C:\\Arqui\\MIPSProjects\\MIPSProcessor_ver2\\mem.dat", ram);
	end


	always @ (posedge clk)
	begin
		// Write
		if (in_MemWrite)
			ram[w_RealAddress_dw] <= in_WriteData_dw;
	end
	assign w_ReadDataAux_dw = ram[w_RealAddress_dw];
  	assign o_ReadData_dw = {DATA_WIDTH{in_MemRead}} & w_ReadDataAux_dw;

endmodule
//datamemory//