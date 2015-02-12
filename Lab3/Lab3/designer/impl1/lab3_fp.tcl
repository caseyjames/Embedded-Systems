new_project \
    -name {lab3} \
    -location {C:\Users\Kyler\Dropbox\ECE 5780\Lab3\Lab3\designer\impl1\lab3_fp} \
    -mode {single}
set_device_type -type {A2F200M3F}
set_device_package -package {484 FBGA}
update_programming_file \
    -feature {prog_fpga:on} \
    -fdb_source {fdb} \
    -fdb_file {C:\Users\Kyler\Dropbox\ECE 5780\Lab3\Lab3\designer\impl1\lab3.fdb} \
    -feature {prog_from:off} \
    -feature {prog_nvm:on} \
    -efm_content {location:0;source:efc} \
    -efm_block {location:0;config_file:{C:\Users\Kyler\Dropbox\ECE 5780\Lab3\Lab3\component\work\lab3_MSS\MSS_ENVM_0\MSS_ENVM_0.efc}} \
    -pdb_file {C:\Users\Kyler\Dropbox\ECE 5780\Lab3\Lab3\designer\impl1\lab3_fp\lab3.pdb}
set_programming_action -action {PROGRAM}
catch {run_selected_actions} return_val
save_project
close_project
if { $return_val != 0 } {
  exit 1 }
