# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {HDL-1065} -limit 10000
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.cache/wt [current_project]
set_property parent.project_path C:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property ip_repo_paths {
  c:/Users/53430/Desktop/lab3b/ip_repo/nnip_1.0
  d:/EMBEDDEDPROJECT/MyWork/ip_repo/lab3c_1.0
} [current_project]
set_property ip_output_repo c:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
add_files C:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/design_1.bd
set_property used_in_implementation false [get_files -all c:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/ip/design_1_axi_dma_0_0/design_1_axi_dma_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/ip/design_1_axi_dma_0_0/design_1_axi_dma_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/ip/design_1_axi_dma_0_0/design_1_axi_dma_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/ip/design_1_rst_ps7_0_100M_0/design_1_rst_ps7_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/ip/design_1_rst_ps7_0_100M_0/design_1_rst_ps7_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/ip/design_1_rst_ps7_0_100M_0/design_1_rst_ps7_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/ip/design_1_xbar_0/design_1_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/ip/design_1_auto_pc_1/design_1_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/design_1_ooc.xdc]
set_property is_locked true [get_files C:/Users/53430/Desktop/lab3b/project_lab3c/project_lab3c.srcs/sources_1/bd/design_1/design_1.bd]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top design_1_wrapper -part xc7z020clg484-1


write_checkpoint -force -noxdef design_1_wrapper.dcp

catch { report_utilization -file design_1_wrapper_utilization_synth.rpt -pb design_1_wrapper_utilization_synth.pb }
