# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.cache/wt} [current_project]
set_property parent.project_path {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib {
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/misc/sub10.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/misc/BCD_driver.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/misc/clk_divider.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/komponenter/REG8.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/labbfiler/cpu_pkg.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/misc/nbcd.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/misc/edge_det.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/misc/debouncer.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/labbfiler/klockblock.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/misc/reset_block.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/labbfiler/debugmodul.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/labbfiler/minne.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/labbfiler/IOblock.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/labbfiler/cpu.vhd}
  {C:/Users/ol1662le-s/Program/MCU lab/MCU lab.srcs/sources_1/imports/MCU/labbfiler/mcu.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top mcu -part xc7a100tcsg324-1


write_checkpoint -force -noxdef mcu.dcp

catch { report_utilization -file mcu_utilization_synth.rpt -pb mcu_utilization_synth.pb }
