onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/ALUResultOut
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate /MIPS_Processor_TB/reset
add wave -noupdate -divider {Instruction Fetch}
add wave -noupdate -label Address/ROM -radix hexadecimal -childformat {{{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[31]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[30]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[29]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[28]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[27]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[26]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[25]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[24]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[23]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[22]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[21]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[20]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[19]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[18]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[17]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[16]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[15]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[14]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[13]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[12]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[11]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[10]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[9]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[8]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[7]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[6]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[5]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[4]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[3]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[2]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[1]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[0]} -radix hexadecimal}} -subitemconfig {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[31]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[30]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[29]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[28]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[27]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[26]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[25]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[24]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[23]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[22]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[21]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[20]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[19]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[18]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[17]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[16]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[15]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[14]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[13]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[12]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[11]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[10]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[9]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[8]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[7]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[6]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[5]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[4]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[3]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[2]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[1]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[0]} {-height 15 -radix hexadecimal}} /MIPS_Processor_TB/DUV/ROMProgramMemory/Address
add wave -noupdate -label Instruction/ROM -radix hexadecimal /MIPS_Processor_TB/DUV/ROMProgramMemory/Instruction
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/IF_ID_Register/DataOutput_dw
add wave -noupdate -divider {Instruction Decode}
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ControlUnit/in_OP_6
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/o_RegDst
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/o_BranchType
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/o_BranchEn
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/o_MemRead
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/o_MemtoReg
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/o_MemWrite
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/o_ALUSrc
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/o_RegWrite
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/o_Jump
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/o_ALUOp_3
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ControlUnit/r_ControlValues_12
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ID_EX_Register/DataOutput_dw
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 175
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {36 ps}
