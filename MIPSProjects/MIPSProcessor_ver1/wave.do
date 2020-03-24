onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate /MIPS_Processor_TB/reset
add wave -noupdate -radix decimal /MIPS_Processor_TB/PortIn
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/ALUResultOut
add wave -noupdate -radix decimal /MIPS_Processor_TB/PortOut
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/Zero
add wave -noupdate -divider ControlUnit
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ControlUnit/OP
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/RegDst
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/BranchType
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/BranchEn
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/ALUSrc
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/ControlUnit/RegWrite
add wave -noupdate -divider ProgramCounter
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ProgramCounter/NewPC
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ProgramCounter/PCValue
add wave -noupdate -divider MuxBranching
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/MUX_ForBranchingControl/Selector
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MUX_ForBranchingControl/MUX_Data0
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MUX_ForBranchingControl/MUX_Data1
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MUX_ForBranchingControl/MUX_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {32 ps}
