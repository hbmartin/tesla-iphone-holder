; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 20m 33s; total estimated time: 26m 50s
; total layer number: 15
; total filament length [mm] : 3152.08
; total filament volume [cm^3] : 7581.64
; total filament weight [g] : 9.40
; model label id: 1,2,3,4,5,6,7,8,9
; object max height: 3.00,3.00,3.00,3.00,3.00,3.00,3.00,3.00,3.00
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 3.00
; filament: 1
; support_material_on_wipe_tower: 0
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; additional_fan_full_speed_layer = 0
; alternate_extra_wall = 0
; ams_filament_load_time_ams = 0
; ams_filament_load_time_ams_lite = 0
; ams_filament_load_time_n3f_s = 0
; ams_filament_unload_time_ams = 0
; ams_filament_unload_time_ams_lite = 0
; ams_filament_unload_time_n3f_s = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_heat_soak_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 4
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = no_brim
; brim_width = 0
; chamber_temperatures = 0
; change_filament_gcode = ;===== A1 20251031 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X267 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E6 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 1
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10
; cooling_slowdown_logic = uniform_cooling
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; counterbore_hole_bridging = none
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_ams_type = -1
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL A1"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = ;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.075
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 256
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = 
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80
; fan_direction = undefine
; fan_max_speed = 80
; fan_min_speed = 60
; farthest_point_timelapse = 0
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_bridge_speed = 25
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #00AE42
; filament_cooling_before_tower = 0
; filament_cost = 20
; filament_density = 1.24
; filament_dev_ams_drying_ams_limitations = 1;0
; filament_dev_ams_drying_heat_distortion_temperature = 45
; filament_dev_ams_drying_temperature = 45,45,45,45
; filament_dev_ams_drying_time = 12,12,12,12
; filament_dev_chamber_drying_bed_temperature = 70
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 45
; filament_dev_drying_softening_temperature = 50
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = 
; filament_is_mixed = 0
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12
; filament_metal_stickiness = None
; filament_minimal_purge_on_wipe_tower = 15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_notes = 
; filament_nozzle_map = 0
; filament_overhang_1_4_speed = 0
; filament_overhang_2_4_speed = 50
; filament_overhang_3_4_speed = 30
; filament_overhang_4_4_speed = 10
; filament_overhang_totally_speed = 10
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_preheat_temperature_delta = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_scarf_gap = 15%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic PLA @BBL A1"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = Generic
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; first_x_layer_part_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 226x224,256x224,256x256,226x256
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; hot_plate_temp = 65
; hot_plate_temp_initial_layer = 65
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_fan_speed = -1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_bed_mass_Y = 0
; machine_end_gcode = ;===== date: 20260513 =====================\nG392 S0 ;turn off nozzle clog detect\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG90\nG1 Z{max_layer_z + 0.4} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != \"by object\"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X267 F15000\nT255\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 256}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z256 F600\n    G1 Z256\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-48 Y180 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N80\nM1006 A44 B20 L100 C49 D20 M80 E41 F20 N80\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N80\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n;=====printer finish  sound=========\n\n;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM400\nM18 X Y Z\n\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 25
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 12000,12000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 12000,12000
; machine_max_acceleration_y = 12000,12000
; machine_max_acceleration_z = 1500,1500
; machine_max_force_Y = 0
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_printed_mass = 0
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 =========================\n;===== date: 20260513 ==================\nG392 S0\nM9833.2\n;M400\n;M73 P1.717\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S140\nM140 S[bed_temperature_initial_layer_single]\n\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A43 B10 L100 C46 D10 M70 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C43 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C41 D10 M80 E41 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E44 F10 N80\nM1006 A0 B10 L100 C49 D10 M80 E49 F10 N80\nM1006 A0 B10 L100 C0 D10 M80 E0 F10 N80\nM1006 A44 B10 L100 C48 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A43 B10 L100 C46 D10 M60 E39 F10 N80\nM1006 W\nM18 \n;=====start printer sound ===================\n\n;=====avoid end stop =================\nG91\nG380 S2 Z40 F1200\nG380 S3 Z-15 F1200\nG90\n\n;===== reset machine status =================\n;M290 X39 Y39 Z8\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.65 Y1.2 Z0.6 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\nM1002 gcode_claim_action : 13\n\nG28 X\nG91\nG1 Z5 F1200\nG90\nG0 X128 F30000\nG0 Y254 F3000\nG91\nG1 Z-5 F1200\n\nM109 S25 H140\n\nM17 E0.3\nM83\nG1 E10 F1200\nG1 E-0.5 F30\nM17 D\n\nG28 Z P0 T140; home z with low precision,permit 300deg temperature\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  G90\n  G1 Z5 F1200\nM623\n\n;M400\n;M73 P1.717\n\n;===== prepare print temperature and material ==========\nM1002 gcode_claim_action : 24\n\nM400\n;G392 S1\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on\n\nG90\nG1 X-28.5 F30000\nG1 X-48.2 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M104 S220\n{else}\n    M104 S250\n{endif}\n    M400\n    T[initial_no_support_extruder]\n    G1 X-48.2 F3000\n    M400\n\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T220\n    M109 S220 ;set nozzle to common flush temp\n{else}\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n{endif}\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M109 S220 H300\n{else}\n    M109 S{flush_temperatures[initial_no_support_extruder]} H300\n{endif}\nG92 E0\nG1 E50 F200 ; lower extrusion speed to avoid clog\nM400\nM106 P1 S178\nG92 E0\nG1 E5 F200\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG92 E0\nG1 E-0.5 F300\n\nG1 X-28.5 F30000\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\n\n;G392 S0\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n;M400\n;M73 P1.717\n\n;===== auto extrude cali start =========================\nM975 S1\n;G392 S1\n\nG90\nM83\nT1000\nG1 X-48.2 Y0 Z10 F10000\nM400\nM1002 set_filament_type:UNKNOWN\n\nM412 S1 ;  ===turn on  filament runout detection===\nM400 P10\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\n\nM622 J1\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_extruder]}\n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n\n    M106 P1 S255\n    M400 S5\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S255\n        M400 S5\n        G1 X-28.5 F18000\n        G1 X-48.2 F3000\n        G1 X-28.5 F18000 ;wipe and shake\n        G1 X-48.2 F3000\n        G1 X-28.5 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-48.2 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\nM623 ; end of \"draw extrinsic para cali paint\"\n\n;G392 S0\n;===== auto extrude cali end ========================\n\n;M400\n;M73 P1.717\n\nM104 S170 ; prepare to wipe nozzle\nM106 S255 ; turn on fan\n\n;===== mech mode fast check start =====================\nM1002 gcode_claim_action : 3\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q1 A5 K0 O3\nM974 Q1 S2 P0\n\nM970.2 Q1 K1 W58 Z0.1\nM974 S2\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q0 A10 K0 O1\nM974 Q0 S2 P0\n\nM970.2 Q0 K1 W78 Z0.1\nM974 S2\n\nM975 S1\nG1 F30000\nG1 X0 Y5\nG28 X ; re-home XY\n\nG1 Z4 F1200\n\n;===== mech mode fast check end =======================\n\n;M400\n;M73 P1.717\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\n\nM975 S1\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\n;===== remove waste by touching start =====\n\nM104 S170 ; set temp down to heatbed acceptable\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nG0 X108 Y-0.5 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X110 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X112 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X114 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X116 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X118 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X120 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X122 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X124 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X126 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X128 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X130 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X132 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X134 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X136 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X138 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X140 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X142 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X144 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X146 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X148 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;===== remove waste by touching end =====\n\nG1 Z10 F1200\nG0 X118 Y261 F30000\nG1 Z5 F1200\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-50}\n\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S140 ; prepare to abl\nG0 Z5 F20000\n\nG0 X128 Y261 F20000  ; move to exposed steel surface\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z10 F1200\n\n;===== brush material wipe nozzle =====\n\nG90\nG1 Y250 F30000\nG1 X55\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X-35 F30000\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Z5.000 F1200\n\nG90\nG1 X30 Y250.000 F30000\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X35 F30000\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Z10.000 F1200\n\n;===== brush material wipe nozzle end =====\n\nG90\n;G0 X128 Y261 F20000  ; move to exposed steel surface\nG1 Y250 F30000\nG1 X138\nG1 Y261\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nM109 S140\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM211 R; pop softend status\n\n;===== wipe nozzle end ================================\n\n;M400\n;M73 P1.717\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\n\nG90\nG1 Z5 F1200\nG1 X0 Y0 F30000\nG29.2 S1 ; turn on ABL\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140\nM106 S0 ; turn off fan , too noisy\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n\n;===== home after wipe mouth end =======================\n\n;M400\n;M73 P1.717\n\nG1 X108.000 Y-0.500 F30000\nG1 Z0.300 F1200\nM400\nG2814 Z0.32\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; prepare to print\n\n;===== nozzle load line ===============================\n;G90\n;M83\n;G1 Z5 F1200\n;G1 X88 Y-0.5 F20000\n;G1 Z0.3 F1200\n\n;M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n\n;G1 E2 F300\n;G1 X168 E4.989 F6000\n;G1 Z1 F1200\n;===== nozzle load line end ===========================\n\n;===== extrude cali test ===============================\n\nM400\n    M900 S\n    M900 C\n    G90\n    M83\n\n    M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n    G0 X128 E8  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\n\nM900 R\n\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    G90\n    G1 X108.000 Y1.000 F30000\n    G91\n    G1 Z-0.700 F1200\n    G90\n    M83\n    G0 X128 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\nM623\n\nG1 Z0.2\n\n;M400\n;M73 P1.717\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type==\"Textured PEI Plate\"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\n;G392 S1 ; turn on clog detection\nM1007 S1 ; turn on mass estimation\nG29.4\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 29
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = 
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = Tesla holder PROTOTYPE - A1 0.20mm
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 256
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1
; printer_notes = 
; printer_settings_id = Bambu Lab A1 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 255
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 8
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 20%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_fast_purge_mode = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != \"by object\"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 4
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle";"Bambu Lab A2L 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 3
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 220
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R26
M201 X12000 Y12000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P12000 R5000 T12000
M205 X9.00 Y9.00 Z3.00 E3.00
M106 S0
; FEATURE: Custom
;===== machine: A1 =========================
;===== date: 20260513 ==================
G392 S0
M9833.2
;M400
;M73 P1.717

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S140
M140 S65

;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A43 B10 L100 C46 D10 M70 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C43 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C41 D10 M80 E41 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E44 F10 N80
M1006 A0 B10 L100 C49 D10 M80 E49 F10 N80
M1006 A0 B10 L100 C0 D10 M80 E0 F10 N80
M1006 A44 B10 L100 C48 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A43 B10 L100 C46 D10 M60 E39 F10 N80
M1006 W
M18 
;=====start printer sound ===================

;=====avoid end stop =================
G91
G380 S2 Z40 F1200
G380 S3 Z-15 F1200
G90

;===== reset machine status =================
;M290 X39 Y39 Z8
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.65 Y1.2 Z0.6 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

M1002 gcode_claim_action : 13

G28 X
G91
G1 Z5 F1200
G90
G0 X128 F30000
G0 Y254 F3000
G91
G1 Z-5 F1200

M109 S25 H140

M17 E0.3
M83
G1 E10 F1200
G1 E-0.5 F30
M17 D

G28 Z P0 T140; home z with low precision,permit 300deg temperature
M104 S220

M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  G90
  G1 Z5 F1200
M623

;M400
;M73 P1.717

;===== prepare print temperature and material ==========
M1002 gcode_claim_action : 24

M400
;G392 S1
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on

G90
G1 X-28.5 F30000
G1 X-48.2 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S220

    M104 S220

    M400
    T0
    G1 X-48.2 F3000
    M400


    M620.1 E F299.339 T220
    M109 S220 ;set nozzle to common flush temp

    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
M621 S0A


    M109 S220 H300

G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
G1 E5 F200
M104 S220
G92 E0
M73 P2 R26
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P3 R26
G1 X-48.2 F3000
M73 P4 R25
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000

;G392 S0

M400
M106 P1 S0
;===== prepare print temperature and material end =====

;M400
;M73 P1.717

;===== auto extrude cali start =========================
M975 S1
;G392 S1

G90
M83
T1000
G1 X-48.2 Y0 Z10 F10000
M400
M1002 set_filament_type:UNKNOWN

M412 S1 ;  ===turn on  filament runout detection===
M400 P10
M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S220
    G1 E10 F300
    M983 F5 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P5 R25
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F5 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
        G1 X-28.5 F18000
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F5 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0
M623 ; end of "draw extrinsic para cali paint"

;G392 S0
;===== auto extrude cali end ========================

;M400
;M73 P1.717

M104 S170 ; prepare to wipe nozzle
M106 S255 ; turn on fan

;===== mech mode fast check start =====================
M1002 gcode_claim_action : 3

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q1 A5 K0 O3
M974 Q1 S2 P0

M970.2 Q1 K1 W58 Z0.1
M974 S2

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q0 A10 K0 O1
M974 Q0 S2 P0

M970.2 Q0 K1 W78 Z0.1
M974 S2

M975 S1
G1 F30000
G1 X0 Y5
G28 X ; re-home XY

G1 Z4 F1200

;===== mech mode fast check end =======================

;M400
;M73 P1.717

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14

M975 S1
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

;===== remove waste by touching start =====

M104 S170 ; set temp down to heatbed acceptable

M83
G1 E-1 F500
G90
M83

M109 S170
G0 X108 Y-0.5 F30000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X110 F10000
G380 S3 Z-5 F1200
M73 P22 R20
G1 Z2 F1200
G1 X112 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X114 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X116 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X118 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X120 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X122 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X124 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X126 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X128 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X130 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X132 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X134 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X136 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X138 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X140 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X142 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X144 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X146 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X148 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;===== remove waste by touching end =====

G1 Z10 F1200
G0 X118 Y261 F30000
G1 Z5 F1200
M109 S170

G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S140 ; prepare to abl
G0 Z5 F20000

G0 X128 Y261 F20000  ; move to exposed steel surface
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z10 F1200

;===== brush material wipe nozzle =====

G90
G1 Y250 F30000
G1 X55
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X-35 F30000
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Z5.000 F1200

G90
G1 X30 Y250.000 F30000
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X35 F30000
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Z10.000 F1200

;===== brush material wipe nozzle end =====

G90
;G0 X128 Y261 F20000  ; move to exposed steel surface
G1 Y250 F30000
G1 X138
G1 Y261
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

M109 S140
M106 S255 ; turn on fan (G28 has turn off fan)

M211 R; pop softend status

;===== wipe nozzle end ================================

;M400
;M73 P1.717

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag

G90
G1 Z5 F1200
G1 X0 Y0 F30000
G29.2 S1 ; turn on ABL

M190 S65; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X25 Y25 I206.5 J156.599
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623

;===== home after wipe mouth end =======================

;M400
;M73 P1.717

G1 X108.000 Y-0.500 F30000
G1 Z0.300 F1200
M400
G2814 Z0.32

M104 S220 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S220

;G1 E2 F300
;G1 X168 E4.989 F6000
;G1 Z1 F1200
;===== nozzle load line end ===========================

;===== extrude cali test ===============================

M400
    M900 S
    M900 C
    G90
    M83

    M109 S220
    G0 X128 E8  F720
    G0 X133 E.3742  F1200
    G0 X138 E.3742  F4800
    G0 X143 E.3742  F1200
    G0 X148 E.3742  F4800
    G0 X153 E.3742  F1200
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400

M900 R

M1002 judge_flag extrude_cali_flag
M622 J1
    G90
    G1 X108.000 Y1.000 F30000
    G91
    G1 Z-0.700 F1200
    G90
    M83
    G0 X128 E10  F720
    G0 X133 E.3742  F1200
    G0 X138 E.3742  F4800
    G0 X143 E.3742  F1200
    G0 X148 E.3742  F4800
    G0 X153 E.3742  F1200
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400
M623

G1 Z0.2

;M400
;M73 P1.717

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
;G392 S1 ; turn on clog detection
M1007 S1 ; turn on mass estimation
G29.4
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/15
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X149.308 Y31.561 F42000
M204 S6000
G1 Z.4
M73 P23 R20
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X133.792 Y31.561 E.57791
G1 X133.789 Y26.524 E.18761
G3 X134.086 Y26.239 I.27 J-.016 E.01742
G1 X135.021 Y26.239 E.03482
G1 X149.058 Y26.24 E.52283
G1 X149.177 Y26.273 E.00459
G3 X149.311 Y26.536 I-.135 J.234 E.01161
G1 X149.308 Y31.501 E.18494
; WIPE_START
G1 X147.308 Y31.509 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.383 Y37.963 Z.6 F42000
G1 X175.276 Y75.804 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X175.116 Y76.224 E.01671
G3 X168.308 Y80.782 I-6.83 J-2.837 E.32344
G1 X114.792 Y80.782 E1.99326
G3 X107.418 Y73.408 I.011 J-7.385 E.43126
G1 X107.418 Y39.392 E1.26696
G3 X107.827 Y36.98 I7.425 J.019 E.09154
G3 X114.792 Y32.018 I6.976 J2.422 E.3397
G1 X168.308 Y32.018 E1.99326
G3 X175.682 Y39.392 I-.011 J7.385 E.43126
G1 X175.682 Y73.408 E1.26696
G3 X175.317 Y75.68 I-7.396 J-.021 E.08607
G1 X175.295 Y75.747 E.00263
M204 S6000
G1 X174.847 Y75.646 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X174.694 Y76.049 E.01604
G3 X168.303 Y80.325 I-6.407 J-2.661 E.30357
G1 X114.797 Y80.325 E1.99291
G3 X107.875 Y73.403 I.006 J-6.928 E.40487
G1 X107.875 Y39.397 E1.26661
G3 X114.797 Y32.475 I6.934 J.012 E.40478
G1 X168.303 Y32.475 E1.99291
G3 X175.225 Y39.397 I-.006 J6.928 E.40487
G1 X175.225 Y73.403 E1.26661
G3 X174.883 Y75.539 I-6.938 J-.016 E.08089
G1 X174.866 Y75.589 E.00197
; WIPE_START
G1 X174.694 Y76.049 E-.18644
G1 X174.47 Y76.544 E-.20658
G1 X174.058 Y77.247 E-.30982
G1 X173.97 Y77.369 E-.05717
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X170.415 Y70.615 Z.6 F42000
G1 X149.765 Y31.382 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X168.291 Y31.382 E.69003
G3 X176.318 Y39.409 I-.007 J8.033 E.46949
G1 X176.318 Y73.391 E1.26574
G3 X168.291 Y81.418 I-8.022 J.004 E.46967
G1 X114.809 Y81.418 E1.99204
G3 X106.782 Y73.391 I.007 J-8.033 E.46949
G1 X106.782 Y39.408 E1.26574
G3 X114.809 Y31.382 I8.022 J-.004 E.46967
G1 X133.335 Y31.382 E.69003
G1 X133.332 Y26.515 E.18128
G3 X134.073 Y25.782 I.725 J-.009 E.04332
G1 X135.021 Y25.782 E.03532
G1 X149.076 Y25.783 E.52348
M73 P24 R20
G3 X149.768 Y26.523 I-.037 J.728 E.04171
G1 X149.765 Y31.322 E.17876
M204 S6000
G1 X150.223 Y30.925 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X168.296 Y30.925 E.67317
G3 X176.775 Y39.404 I-.012 J8.491 E.49587
G1 X176.775 Y73.396 E1.26609
G3 X168.296 Y81.875 I-8.479 J0 E.49606
G1 X114.804 Y81.875 E1.99239
G3 X106.325 Y73.396 I.012 J-8.491 E.49587
G1 X106.325 Y39.404 E1.26609
G3 X114.804 Y30.925 I8.479 J0 E.49606
G1 X132.877 Y30.925 E.67317
G1 X132.875 Y26.506 E.16458
G3 X134.06 Y25.325 I1.181 J0 E.06924
G1 X135.021 Y25.325 E.03582
G1 X149.094 Y25.326 E.52414
G3 X150.225 Y26.509 I-.059 J1.189 E.06724
G1 X150.223 Y30.865 E.16223
; WIPE_START
G1 X152.223 Y30.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 1 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer1 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X149.537 Y31.7 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.221621
G1 F3000
M204 S500
G1 X168.288 Y31.7 E.27306
G1 X168.904 Y31.724 E.00897
G1 X169.505 Y31.795 E.00881
G1 X170.39 Y31.989 E.0132
G1 X171.247 Y32.286 E.0132
G1 X172.062 Y32.682 E.0132
G1 X172.826 Y33.171 E.01321
G1 X173.527 Y33.746 E.0132
G1 X174.155 Y34.399 E.0132
G1 X174.702 Y35.122 E.0132
G1 X175.16 Y35.903 E.01318
G1 X175.524 Y36.735 E.01323
G1 X175.787 Y37.601 E.01318
G1 X175.946 Y38.494 E.01321
G1 X175.994 Y39.1 E.00885
G1 X176 Y73.412 E.49965
G1 X175.947 Y74.303 E.01299
G1 X175.852 Y74.901 E.00881
G1 X175.711 Y75.49 E.00882
G1 X175.525 Y76.063 E.00878
G1 X175.293 Y76.623 E.00883
G1 X175.018 Y77.162 E.00881
G1 X174.702 Y77.678 E.00881
G1 X174.347 Y78.167 E.0088
G1 X173.746 Y78.843 E.01317
G1 X173.299 Y79.256 E.00886
G1 X172.578 Y79.802 E.01318
G1 X171.796 Y80.261 E.0132
G1 X170.967 Y80.623 E.01318
G1 X170.388 Y80.811 E.00886
G1 X169.505 Y81.005 E.01317
G1 X168.602 Y81.094 E.01321
G1 X114.788 Y81.1 E.78364
G1 X113.896 Y81.047 E.01302
G1 X113.004 Y80.888 E.01318
G1 X112.419 Y80.723 E.00886
G1 X111.577 Y80.393 E.01317
G1 X110.775 Y79.964 E.01323
G1 X110.274 Y79.63 E.00878
G1 X109.8 Y79.256 E.00879
G1 X109.146 Y78.627 E.01322
G1 X108.57 Y77.926 E.01322
G1 X108.235 Y77.423 E.0088
G1 X107.94 Y76.897 E.00878
G1 X107.576 Y76.065 E.01323
G1 X107.389 Y75.49 E.0088
G1 X107.248 Y74.904 E.00877
G1 X107.124 Y74.005 E.01322
G1 X107.1 Y73.388 E.00898
G1 X107.1 Y39.388 E.49511
G1 X107.153 Y38.495 E.01302
G1 X107.312 Y37.604 E.01318
G1 X107.477 Y37.019 E.00886
G1 X107.807 Y36.176 E.01318
G1 X108.235 Y35.377 E.0132
G1 X108.753 Y34.633 E.01321
G1 X109.355 Y33.956 E.0132
G1 X110.034 Y33.352 E.01323
G1 X110.777 Y32.835 E.01318
G1 X111.578 Y32.407 E.01322
G1 X112.422 Y32.076 E.0132
G1 X113.003 Y31.913 E.00878
M73 P25 R20
G1 X113.593 Y31.795 E.00877
G1 X114.195 Y31.724 E.00883
G1 X114.812 Y31.7 E.00898
G1 X133.563 Y31.7 E.27306
; WIPE_START
G1 X131.563 Y31.7 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.838 Y29.39 Z.6 F42000
G1 X148.181 Y26.423 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50331
G1 F6300
M204 S500
G1 X148.922 Y27.164 E.03929
G1 X148.922 Y27.814 E.02441
G1 X147.736 Y26.629 E.06291
G1 X147.085 Y26.629 E.02443
G1 X148.921 Y28.465 E.09743
G1 X148.921 Y29.116 E.02441
G1 X146.434 Y26.629 E.13196
G1 X145.783 Y26.629 E.02443
G1 X148.921 Y29.767 E.16649
G1 X148.92 Y30.417 E.02441
G1 X145.131 Y26.628 E.20102
G1 X144.48 Y26.628 E.02443
G1 X148.92 Y31.068 E.23554
G1 X148.92 Y31.172 E.00391
G1 X148.373 Y31.172 E.02051
G1 X143.829 Y26.628 E.24108
G1 X143.178 Y26.628 E.02443
G1 X147.722 Y31.172 E.24109
G1 X147.071 Y31.172 E.02443
G1 X142.527 Y26.628 E.24109
G1 X141.876 Y26.628 E.02443
G1 X146.42 Y31.172 E.24109
G1 X145.769 Y31.172 E.02443
G1 X141.225 Y26.628 E.24109
G1 X140.573 Y26.628 E.02443
G1 X145.118 Y31.172 E.2411
G1 X144.467 Y31.172 E.02443
G1 X139.922 Y26.628 E.2411
G1 X139.271 Y26.628 E.02443
G1 X143.815 Y31.172 E.2411
G1 X143.164 Y31.172 E.02443
G1 X138.62 Y26.628 E.2411
G1 X137.969 Y26.628 E.02443
G1 X142.513 Y31.172 E.24111
G1 X141.862 Y31.172 E.02443
G1 X137.318 Y26.628 E.24111
G1 X136.667 Y26.628 E.02443
G1 X141.211 Y31.172 E.24111
G1 X140.56 Y31.172 E.02443
G1 X136.016 Y26.628 E.24111
G1 X135.364 Y26.628 E.02443
G1 X139.909 Y31.172 E.24112
G1 X139.258 Y31.172 E.02443
G1 X134.714 Y26.629 E.24105
G1 X134.185 Y26.631 E.01988
G1 X134.184 Y26.75 E.00447
G1 X138.607 Y31.172 E.23463
G1 X137.956 Y31.172 E.02443
G1 X134.184 Y27.401 E.20011
G1 X134.183 Y28.051 E.02441
G1 X137.305 Y31.172 E.1656
G1 X136.654 Y31.172 E.02443
G1 X134.183 Y28.702 E.13108
G1 X134.182 Y29.352 E.02441
G1 X136.002 Y31.172 E.09657
G1 X135.351 Y31.172 E.02443
G1 X134.182 Y30.003 E.06206
G1 X134.181 Y30.653 E.02441
G1 X134.906 Y31.378 E.03845
; OBJECT_ID: 4
; WIPE_START
G1 X134.181 Y30.653 E-.3895
G1 X134.182 Y30.003 E-.24721
G1 X134.411 Y30.232 E-.1233
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S6000
G1 X133.881 Y37.846 Z.6 F42000
G1 X128.957 Y108.561 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X128.72 Y108.561 E.00883
G3 X128.54 Y108.298 I.122 J-.277 E.01251
G1 X128.539 Y100.039 E.30761
G1 X139.81 Y100.04 E.4198
G1 X139.851 Y100.045 E.00153
G3 X140.06 Y100.302 I-.056 J.259 E.01333
G1 X140.06 Y108.298 E.29781
G3 X139.798 Y108.559 I-.272 J-.01 E.01517
G1 X129.017 Y108.561 E.40153
M204 S6000
G1 X129.234 Y109.018 F42000
G1 F3000
M204 S500
G1 X129.173 Y109.018 E.00228
G1 X129.016 Y109.526 E.01982
G1 X128.782 Y109.491 E.0088
G1 X128.783 Y109.168 E.01201
G1 X128.35 Y108.858 E.01985
G3 X128.083 Y108.32 I.508 J-.587 E.02296
G1 X128.082 Y100.283 E.29933
G2 X108.418 Y103.992 I-9.479 J3.727 E1.049
G1 X108.42 Y109.474 E.20418
G1 X108.18 Y109.505 E.00899
G3 X107.782 Y106.591 I11.383 J-3.039 E.1098
G3 X107.791 Y103.571 I76.112 J-1.292 E.11252
G1 X107.803 Y103.356 E.00799
G3 X119.195 Y93.199 I10.8 J.645 E.63098
G3 X128.07 Y98.771 I-.631 J10.859 E.40725
M73 P25 R19
G1 X128.497 Y99.582 E.03413
G1 X139.828 Y99.583 E.42203
G3 X140.517 Y100.279 I-.033 J.722 E.04009
G1 X140.517 Y108.32 E.29949
G3 X139.82 Y109.017 I-.721 J-.025 E.04037
G1 X129.294 Y109.018 E.39208
M204 S6000
G1 X129.51 Y109.475 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X128.764 Y111.573 I-19.089 J-5.604 E.083
G3 X128.394 Y112.334 I-2.808 J-.895 E.03159
G1 X128.25 Y112.57 E.01032
G3 X128.308 Y111.017 I15.667 J-.192 E.05791
G2 X128.325 Y109.402 I-30.438 J-1.134 E.06014
G3 X127.657 Y108.571 I.689 J-1.238 E.04075
G3 X127.626 Y108.342 I1.16 J-.273 E.0086
G1 X127.625 Y100.375 E.29673
G2 X108.875 Y103.997 I-9.024 J3.627 E.99939
G1 X108.877 Y110.432 E.23969
G2 X108.95 Y111.922 I21.386 J-.302 E.05558
G1 X108.95 Y112.57 E.02414
G3 X108.486 Y111.748 I11.179 J-6.858 E.03518
G3 X107.873 Y110.071 I221.068 J-81.702 E.06649
G3 X107.325 Y106.596 I10.906 J-3.501 E.13156
G3 X107.334 Y103.553 I76.718 J-1.296 E.11337
G1 X107.347 Y103.329 E.00834
G3 X119.22 Y92.742 I11.256 J.672 E.65765
G3 X128.773 Y99.125 I-.635 J11.292 E.44886
G1 X139.846 Y99.126 E.41242
G3 X140.974 Y100.257 I-.052 J1.18 E.06533
G1 X140.974 Y108.343 E.30116
G3 X139.843 Y109.474 I-1.18 J-.049 E.06545
G1 X129.57 Y109.475 E.38263
M204 S6000
G1 X129.173 Y109.792 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.540889
G1 F3000
M204 S500
G1 X128.998 Y109.897 E.00828
; LINE_WIDTH: 0.570272
G1 X128.823 Y110.002 E.00877
; LINE_WIDTH: 0.563359
G1 X128.801 Y110.13 E.00551
; LINE_WIDTH: 0.520172
G1 X128.779 Y110.258 E.00505
; LINE_WIDTH: 0.476985
G1 X128.757 Y110.386 E.00459
; LINE_WIDTH: 0.441695
G1 X128.744 Y110.46 E.00244
; LINE_WIDTH: 0.413427
G1 X128.729 Y110.539 E.00241
; LINE_WIDTH: 0.37767
G1 X128.704 Y110.662 E.00342
; LINE_WIDTH: 0.335159
G1 X128.679 Y110.785 E.00299
; LINE_WIDTH: 0.292647
G1 X128.654 Y110.908 E.00255
; LINE_WIDTH: 0.249486
G1 X128.628 Y111.035 E.00218
; LINE_WIDTH: 0.206874
G1 X128.596 Y111.18 E.002
; LINE_WIDTH: 0.165295
G1 X128.563 Y111.326 E.00149
; LINE_WIDTH: 0.123716
G1 X128.531 Y111.472 E.00098
; WIPE_START
G1 X128.563 Y111.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.376 Y103.696 Z.6 F42000
G1 X128.289 Y100.117 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.196645
G1 F3000
M204 S500
G1 X128.224 Y99.81 E.00393
; LINE_WIDTH: 0.22706
G1 X128.22 Y99.764 E.0007
G1 X128.262 Y99.772 E.00065
; LINE_WIDTH: 0.174269
G1 X128.305 Y99.78 E.00046
; LINE_WIDTH: 0.126023
G1 X128.347 Y99.788 E.00029
M204 S6000
G1 X128.22 Y99.764 F42000
; LINE_WIDTH: 0.221357
G1 F3000
M204 S500
G1 X127.883 Y99.095 E.01089
G2 X108.1 Y104.011 I-9.283 J4.907 E.40552
G2 X108.105 Y107.011 I152.835 J1.265 E.04362
; LINE_WIDTH: 0.202359
G1 X108.117 Y107.422 E.00534
; LINE_WIDTH: 0.170241
G1 X108.137 Y107.834 E.00428
; LINE_WIDTH: 0.126515
G1 X108.163 Y108.208 E.00256
; WIPE_START
G1 X108.137 Y107.834 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X108.329 Y109.716 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.570321
G1 F3000
M204 S500
G1 X108.364 Y109.924 E.00905
; LINE_WIDTH: 0.530905
G1 X108.399 Y110.131 E.00837
; LINE_WIDTH: 0.49149
G1 X108.434 Y110.339 E.0077
; LINE_WIDTH: 0.454197
G1 X108.452 Y110.435 E.00325
; LINE_WIDTH: 0.413901
G1 X108.477 Y110.565 E.00401
; LINE_WIDTH: 0.369216
G1 X108.502 Y110.691 E.00342
; LINE_WIDTH: 0.325224
G1 X108.526 Y110.817 E.00296
; LINE_WIDTH: 0.281233
G1 X108.551 Y110.944 E.0025
; LINE_WIDTH: 0.236162
G1 X108.582 Y111.09 E.00235
; LINE_WIDTH: 0.190743
G1 X108.612 Y111.232 E.00175
; LINE_WIDTH: 0.15196
G1 X108.638 Y111.36 E.00116
; LINE_WIDTH: 0.119564
G1 X108.663 Y111.486 E.0008
; WIPE_START
G1 X108.638 Y111.36 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.802 Y108.728 Z.6 F42000
G1 X138.952 Y100.223 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50018
G1 F6300
M204 S500
G1 X139.671 Y100.942 E.03788
G1 X139.671 Y101.588 E.0241
G1 X138.511 Y100.428 E.06112
G1 X137.865 Y100.428 E.0241
G1 X139.671 Y102.235 E.0952
G1 X139.671 Y102.882 E.0241
G1 X137.218 Y100.428 E.12927
G1 X136.571 Y100.428 E.0241
G1 X139.671 Y103.528 E.16335
G1 X139.671 Y104.175 E.0241
G1 X135.924 Y100.428 E.19743
G1 X135.278 Y100.428 E.0241
G1 X139.671 Y104.822 E.23151
G1 X139.671 Y105.468 E.0241
G1 X134.631 Y100.428 E.26559
G1 X133.984 Y100.428 E.0241
G1 X139.671 Y106.115 E.29967
G1 X139.671 Y106.762 E.0241
G1 X133.338 Y100.428 E.33375
M73 P26 R19
G1 X132.691 Y100.428 E.0241
G1 X139.671 Y107.408 E.36783
G1 X139.671 Y108.055 E.0241
G1 X132.044 Y100.428 E.40191
G1 X131.397 Y100.428 E.0241
G1 X139.141 Y108.171 E.40804
G1 X138.494 Y108.171 E.02409
G1 X130.751 Y100.428 E.40804
G1 X130.104 Y100.428 E.0241
G1 X137.848 Y108.171 E.40805
G1 X137.201 Y108.171 E.02409
G1 X129.457 Y100.427 E.40806
G1 X128.928 Y100.427 E.01973
G1 X128.928 Y100.545 E.00437
G1 X136.554 Y108.171 E.40189
G1 X135.908 Y108.171 E.02409
G1 X128.928 Y101.191 E.36781
G1 X128.928 Y101.838 E.0241
G1 X135.261 Y108.172 E.33374
G1 X134.615 Y108.172 E.02409
G1 X128.928 Y102.485 E.29966
G1 X128.928 Y103.132 E.0241
G1 X133.968 Y108.172 E.26558
G1 X133.321 Y108.172 E.02409
G1 X128.928 Y103.778 E.2315
G1 X128.928 Y104.425 E.0241
G1 X132.675 Y108.172 E.19743
G1 X132.028 Y108.172 E.02409
G1 X128.928 Y105.072 E.16335
G1 X128.928 Y105.719 E.0241
G1 X131.382 Y108.172 E.12927
G1 X130.735 Y108.172 E.02409
G1 X128.928 Y106.365 E.0952
G1 X128.929 Y107.012 E.0241
G1 X130.088 Y108.172 E.06112
G1 X129.442 Y108.172 E.02409
G1 X128.723 Y107.453 E.03788
; OBJECT_ID: 5
; WIPE_START
G1 X129.442 Y108.172 E-.38635
G1 X130.088 Y108.172 E-.24571
G1 X129.85 Y107.934 E-.12794
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S6000
G1 X137.482 Y108.043 Z.6 F42000
G1 X173.721 Y108.559 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X173.52 Y108.559 E.00748
G3 X173.34 Y108.296 I.12 J-.275 E.01252
G1 X173.339 Y100.352 E.29588
G1 X173.208 Y100.038 E.0127
G1 X184.61 Y100.039 E.42467
G3 X184.86 Y100.3 I-.014 J.263 E.01485
G1 X184.86 Y108.309 E.29827
G1 X184.844 Y108.389 E.00304
G3 X184.598 Y108.558 I-.249 J-.097 E.01181
G1 X173.781 Y108.559 E.40288
M204 S6000
G1 X173.992 Y109.016 F42000
G1 F3000
M204 S500
G1 X173.93 Y109.016 E.00232
G1 X173.815 Y109.373 E.01395
G1 X173.583 Y109.336 E.00875
G1 X173.583 Y109.167 E.00629
G1 X173.15 Y108.856 E.01986
G3 X172.883 Y108.319 I.463 J-.565 E.02305
G1 X172.882 Y100.444 E.29331
G2 X152.818 Y104.191 I-9.679 J3.766 E1.071
G1 X152.818 Y109.292 E.19001
G1 X152.58 Y109.324 E.00895
G3 X152.182 Y106.391 I11.453 J-3.046 E.11051
G3 X152.191 Y103.76 I66.153 J-1.092 E.09801
G1 X152.204 Y103.544 E.00806
G3 X163.431 Y93.183 I11.016 J.674 E.62847
G3 X172.788 Y98.771 I-.236 J11.023 E.42459
G1 X173.226 Y99.58 E.03426
G1 X184.628 Y99.582 E.42469
G3 X185.317 Y100.278 I-.033 J.722 E.04009
G1 X185.317 Y108.326 E.29978
G3 X184.62 Y109.015 I-.722 J-.033 E.04009
G1 X174.052 Y109.016 E.39364
M204 S6000
G1 X174.263 Y109.473 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X173.415 Y111.789 I-35.081 J-11.537 E.09185
G3 X173.05 Y112.426 I-8.44 J-4.407 E.02736
G3 X173.101 Y110.97 I10.733 J-.35 E.05431
G2 X173.125 Y109.401 I-20.664 J-1.102 E.05845
G3 X172.468 Y108.613 I.697 J-1.249 E.03909
G3 X172.426 Y108.341 I1.144 J-.317 E.01029
G1 X172.425 Y100.535 E.29073
G2 X153.275 Y104.195 I-9.223 J3.673 E1.02098
G2 X153.278 Y110.398 I541.11 J2.843 E.23104
G2 X153.35 Y111.829 I85.239 J-3.576 E.05335
G1 X153.35 Y112.429 E.02237
G3 X152.908 Y111.641 I13.07 J-7.836 E.03367
G3 X152.305 Y110 I1401.282 J-516.331 E.06512
G3 X151.725 Y106.395 I11.077 J-3.631 E.13655
G3 X151.734 Y103.742 I66.734 J-1.096 E.09884
G1 X151.748 Y103.516 E.00841
G3 X163.441 Y92.726 I11.473 J.702 E.65454
G3 X173.498 Y99.123 I-.255 J11.505 E.46666
G1 X184.646 Y99.125 E.41521
G3 X185.774 Y100.255 I-.052 J1.18 E.06533
G1 X185.774 Y108.344 E.30128
G3 X184.643 Y109.472 I-1.18 J-.052 E.06533
G1 X174.323 Y109.473 E.38439
M204 S6000
G1 X173.663 Y109.58 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.56042
G1 F3000
M204 S500
G1 X173.601 Y109.972 E.01671
; LINE_WIDTH: 0.515966
G1 X173.575 Y110.116 E.00564
; LINE_WIDTH: 0.466144
G1 X173.55 Y110.259 E.00504
; LINE_WIDTH: 0.416321
G1 X173.524 Y110.403 E.00445
; LINE_WIDTH: 0.372086
G1 X173.505 Y110.508 E.00286
; LINE_WIDTH: 0.332872
G1 X173.48 Y110.628 E.0029
; LINE_WIDTH: 0.292901
G1 X173.454 Y110.749 E.0025
; LINE_WIDTH: 0.252929
G1 X173.429 Y110.869 E.0021
; LINE_WIDTH: 0.212242
G1 X173.403 Y110.994 E.00176
; LINE_WIDTH: 0.171515
G1 X173.368 Y111.14 E.00158
; LINE_WIDTH: 0.124405
G1 X173.319 Y111.344 E.00139
; WIPE_START
G1 X173.368 Y111.14 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X173.101 Y103.512 Z.6 F42000
G1 X172.971 Y99.809 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.221492
G1 F3000
M204 S500
G1 X172.677 Y99.233 E.00942
G2 X152.5 Y104.21 I-9.477 J4.968 E.4141
G2 X152.504 Y106.801 I137.421 J1.087 E.03771
; LINE_WIDTH: 0.202604
G1 X152.515 Y107.205 E.00526
; LINE_WIDTH: 0.172123
G1 X152.534 Y107.608 E.00425
; LINE_WIDTH: 0.140549
G1 X152.548 Y107.813 E.00163
; LINE_WIDTH: 0.115465
G1 X152.562 Y108.018 E.00121
; WIPE_START
G1 X152.548 Y107.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X152.731 Y109.534 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.583171
G1 F3000
M204 S500
G2 X152.79 Y109.918 I10.475 J-1.427 E.01712
; LINE_WIDTH: 0.536281
G1 X152.81 Y110.034 E.00471
; LINE_WIDTH: 0.497887
G1 X152.83 Y110.148 E.00429
; LINE_WIDTH: 0.459739
G1 X152.85 Y110.262 E.00393
; LINE_WIDTH: 0.427682
G1 X152.863 Y110.333 E.00227
; LINE_WIDTH: 0.401747
G1 X152.877 Y110.404 E.00211
; LINE_WIDTH: 0.367104
G1 X152.902 Y110.531 E.00342
; LINE_WIDTH: 0.324626
G1 X152.927 Y110.653 E.00287
; LINE_WIDTH: 0.282901
G1 X152.952 Y110.776 E.00245
; LINE_WIDTH: 0.241177
G1 X152.976 Y110.899 E.00202
; LINE_WIDTH: 0.202256
G1 X153.004 Y111.02 E.00161
; LINE_WIDTH: 0.166869
G1 X153.03 Y111.137 E.00121
; LINE_WIDTH: 0.126154
G1 X153.073 Y111.34 E.00141
; WIPE_START
G1 X153.03 Y111.137 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X160.222 Y108.581 Z.6 F42000
G1 X183.752 Y100.221 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50018
G1 F6300
M204 S500
G1 X184.471 Y100.94 E.03788
G1 X184.471 Y101.587 E.0241
G1 X183.311 Y100.427 E.06112
G1 X182.665 Y100.427 E.0241
G1 X184.471 Y102.234 E.0952
G1 X184.471 Y102.88 E.0241
G1 X182.018 Y100.427 E.12927
G1 X181.371 Y100.427 E.0241
G1 X184.471 Y103.527 E.16335
G1 X184.471 Y104.174 E.0241
G1 X180.724 Y100.427 E.19743
G1 X180.078 Y100.427 E.0241
G1 X184.471 Y104.82 E.23151
G1 X184.471 Y105.467 E.0241
G1 X179.431 Y100.427 E.26559
G1 X178.784 Y100.427 E.0241
G1 X184.471 Y106.114 E.29967
G1 X184.471 Y106.76 E.0241
G1 X178.138 Y100.427 E.33375
G1 X177.491 Y100.426 E.0241
G1 X184.471 Y107.407 E.36783
G1 X184.471 Y108.054 E.0241
G1 X176.844 Y100.426 E.40191
G1 X176.197 Y100.426 E.0241
G1 X183.941 Y108.17 E.40803
G1 X183.294 Y108.17 E.02409
G1 X175.551 Y100.426 E.40804
G1 X174.904 Y100.426 E.0241
G1 X182.648 Y108.17 E.40805
G1 X182.001 Y108.17 E.02409
G1 X174.257 Y100.426 E.40806
G1 X173.728 Y100.426 E.01973
G1 X173.728 Y100.543 E.00437
G1 X181.354 Y108.17 E.40189
G1 X180.708 Y108.17 E.02409
G1 X173.728 Y101.19 E.36781
G1 X173.728 Y101.837 E.0241
G1 X180.061 Y108.17 E.33374
M73 P27 R19
G1 X179.415 Y108.17 E.02409
G1 X173.728 Y102.484 E.29966
G1 X173.728 Y103.13 E.0241
G1 X178.768 Y108.17 E.26558
G1 X178.121 Y108.17 E.02409
G1 X173.728 Y103.777 E.23151
G1 X173.728 Y104.424 E.0241
G1 X177.475 Y108.17 E.19743
G1 X176.828 Y108.171 E.02409
G1 X173.728 Y105.071 E.16335
G1 X173.728 Y105.717 E.0241
G1 X176.182 Y108.171 E.12928
G1 X175.535 Y108.171 E.02409
G1 X173.728 Y106.364 E.0952
G1 X173.729 Y107.011 E.0241
G1 X174.888 Y108.171 E.06112
G1 X174.242 Y108.171 E.02409
G1 X173.523 Y107.452 E.03788
; OBJECT_ID: 6
; WIPE_START
G1 X174.242 Y108.171 E-.38636
G1 X174.888 Y108.171 E-.2457
G1 X174.65 Y107.933 E-.12794
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S6000
G1 X182.282 Y108.04 Z.6 F42000
G1 X219.064 Y108.56 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X218.92 Y108.56 E.00535
G3 X218.74 Y108.311 I.131 J-.284 E.01196
G1 X218.739 Y100.599 E.28724
G1 X218.51 Y100.038 E.02257
G1 X230.01 Y100.039 E.42834
G3 X230.26 Y100.301 I-.014 J.263 E.01485
G1 X230.26 Y108.297 E.29782
G3 X229.998 Y108.558 I-.263 J-.001 E.0153
G1 X219.124 Y108.56 E.40502
M204 S6000
G1 X219.326 Y109.017 F42000
G1 F3000
M204 S500
G1 X219.261 Y109.017 E.00241
G1 X219.165 Y109.298 E.01108
G1 X218.55 Y108.857 E.02819
G3 X218.283 Y108.329 I.507 J-.588 E.02261
G1 X218.282 Y100.689 E.28456
G2 X197.618 Y104.491 I-9.979 J3.821 E1.10406
G1 X197.618 Y109.031 E.16911
G1 X197.379 Y109.062 E.00898
G3 X196.982 Y106.091 I11.071 J-2.991 E.11198
G3 X197.039 Y103.384 I26.986 J-.782 E.10089
G3 X208.657 Y93.188 I11.271 J1.126 E.63361
G3 X218.065 Y98.778 I-.362 J11.321 E.42539
G1 X218.515 Y99.581 E.03426
G1 X230.028 Y99.582 E.42882
G3 X230.717 Y100.278 I-.033 J.722 E.04009
G1 X230.717 Y108.319 E.29949
G3 X230.02 Y109.015 I-.718 J-.021 E.04042
G1 X219.386 Y109.017 E.3961
M204 S6000
G1 X219.588 Y109.474 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X218.902 Y111.391 I-181.739 J-63.956 E.07583
G3 X218.45 Y112.211 I-12.866 J-6.552 E.03491
G3 X218.511 Y110.574 I19.859 J-.079 E.06103
G2 X218.525 Y109.402 I-30.566 J-.959 E.04369
G3 X217.882 Y108.657 I.691 J-1.248 E.03743
G3 X217.826 Y108.346 I1.207 J-.375 E.01178
G1 X217.825 Y100.778 E.28188
G2 X198.075 Y104.495 I-9.524 J3.723 E1.0544
G2 X198.078 Y110.209 I438.007 J2.598 E.2128
G3 X198.15 Y111.633 I-136.742 J7.592 E.05311
G1 X198.15 Y112.21 E.02151
G3 X197.514 Y110.852 I4.996 J-3.169 E.05601
G3 X196.525 Y106.095 I11.529 J-4.877 E.18214
G3 X196.585 Y103.338 I27.53 J-.783 E.10274
G3 X208.673 Y92.731 I11.726 J1.172 E.65924
G3 X218.783 Y99.124 I-.411 J11.84 E.46699
G1 X230.046 Y99.125 E.41951
G3 X231.174 Y100.256 I-.052 J1.18 E.06534
G1 X231.174 Y108.341 E.30116
G3 X230.043 Y109.473 I-1.176 J-.045 E.0655
G1 X219.648 Y109.474 E.38717
M204 S6000
G1 X219.039 Y109.489 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.508945
G1 F3000
M204 S500
G1 X218.998 Y109.732 E.00935
; LINE_WIDTH: 0.472865
G1 X218.958 Y109.975 E.00862
; LINE_WIDTH: 0.436476
G1 X218.939 Y110.077 E.00333
; LINE_WIDTH: 0.396464
G1 X218.914 Y110.204 E.00373
; LINE_WIDTH: 0.353101
G1 X218.89 Y110.331 E.00327
; LINE_WIDTH: 0.309738
G1 X218.865 Y110.459 E.00282
; LINE_WIDTH: 0.265809
G1 X218.84 Y110.589 E.00241
; LINE_WIDTH: 0.221565
G1 X218.809 Y110.732 E.00213
; LINE_WIDTH: 0.177232
G1 X218.779 Y110.876 E.00161
; LINE_WIDTH: 0.14196
G1 X218.758 Y110.984 E.00088
; LINE_WIDTH: 0.115931
G1 X218.737 Y111.091 E.00065
; WIPE_START
G1 X218.758 Y110.984 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X218.421 Y103.359 Z.6 F42000
G1 X218.264 Y99.809 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.221474
G1 F3000
M204 S500
G1 X217.863 Y99.065 E.01229
G2 X197.3 Y104.51 I-9.564 J5.434 E.42026
G2 X197.304 Y106.533 I102.573 J.786 E.02943
; LINE_WIDTH: 0.200165
G1 X197.317 Y106.967 E.00557
; LINE_WIDTH: 0.16585
G1 X197.339 Y107.402 E.00436
; LINE_WIDTH: 0.123657
G1 X197.362 Y107.732 E.00217
; WIPE_START
G1 X197.339 Y107.402 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X197.53 Y109.273 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.586426
G1 F3000
M204 S500
G1 X197.579 Y109.602 E.01471
; LINE_WIDTH: 0.556545
G1 X197.601 Y109.73 E.00544
; LINE_WIDTH: 0.517137
G1 X197.619 Y109.837 E.00422
; LINE_WIDTH: 0.481757
G1 X197.637 Y109.943 E.00385
; LINE_WIDTH: 0.44664
G1 X197.656 Y110.05 E.00354
; LINE_WIDTH: 0.41397
G1 X197.671 Y110.132 E.00254
; LINE_WIDTH: 0.383742
G1 X197.687 Y110.215 E.00233
; LINE_WIDTH: 0.347022
G1 X197.713 Y110.342 E.00323
; LINE_WIDTH: 0.304735
G1 X197.738 Y110.465 E.00268
; LINE_WIDTH: 0.263257
G1 X197.764 Y110.588 E.00225
; LINE_WIDTH: 0.221778
G1 X197.789 Y110.711 E.00183
; LINE_WIDTH: 0.196116
G1 X197.796 Y110.744 E.00043
; LINE_WIDTH: 0.169126
G1 X197.836 Y110.92 E.00185
; LINE_WIDTH: 0.124951
G1 X197.875 Y111.094 E.00119
; WIPE_START
G1 X197.836 Y110.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X205.142 Y108.712 Z.6 F42000
G1 X230.077 Y101.177 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51486
G1 F6300
M204 S500
G1 X229.327 Y100.427 E.04078
G1 X228.659 Y100.427 E.02567
G1 X229.871 Y101.639 E.0659
G1 X229.871 Y102.307 E.02567
G1 X227.992 Y100.427 E.1022
G1 X227.324 Y100.427 E.02567
G1 X229.871 Y102.974 E.13851
G1 X229.871 Y103.641 E.02567
G1 X226.657 Y100.427 E.17481
G1 X225.99 Y100.427 E.02567
G1 X229.871 Y104.309 E.21111
G1 X229.871 Y104.976 E.02567
G1 X225.322 Y100.427 E.24741
G1 X224.655 Y100.427 E.02567
G1 X229.871 Y105.644 E.28372
G1 X229.871 Y106.311 E.02567
G1 X223.987 Y100.427 E.32002
G1 X223.32 Y100.427 E.02567
G1 X229.871 Y106.978 E.35632
G1 X229.871 Y107.646 E.02567
G1 X222.652 Y100.427 E.39263
G1 X221.985 Y100.427 E.02567
G1 X229.728 Y108.17 E.42113
G1 X229.06 Y108.17 E.02566
G1 X221.317 Y100.427 E.42114
G1 X220.65 Y100.427 E.02567
G1 X228.393 Y108.17 E.42115
G1 X227.726 Y108.17 E.02566
G1 X219.982 Y100.426 E.42116
G1 X219.315 Y100.426 E.02567
G1 X227.058 Y108.17 E.42116
G1 X226.391 Y108.17 E.02566
G1 X219.128 Y100.907 E.39503
G1 X219.128 Y101.574 E.02567
G1 X225.724 Y108.17 E.35873
G1 X225.056 Y108.17 E.02566
G1 X219.128 Y102.242 E.32243
G1 X219.128 Y102.909 E.02567
G1 X224.389 Y108.171 E.28613
G1 X223.722 Y108.171 E.02566
G1 X219.128 Y103.577 E.24983
G1 X219.128 Y104.245 E.02567
G1 X223.054 Y108.171 E.21353
G1 X222.387 Y108.171 E.02566
G1 X219.128 Y104.912 E.17723
G1 X219.128 Y105.58 E.02567
G1 X221.72 Y108.171 E.14093
G1 X221.052 Y108.171 E.02566
M73 P28 R19
G1 X219.129 Y106.247 E.10463
G1 X219.129 Y106.915 E.02567
G1 X220.385 Y108.171 E.06833
G1 X219.718 Y108.171 E.02566
G1 X218.923 Y107.377 E.04321
; OBJECT_ID: 9
; WIPE_START
G1 X219.718 Y108.171 E-.42701
G1 X220.385 Y108.171 E-.25359
G1 X220.237 Y108.023 E-.0794
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S6000
G1 X214.346 Y112.876 Z.6 F42000
G1 X137.164 Y176.46 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X137.02 Y176.46 E.00535
G3 X136.84 Y176.211 I.131 J-.284 E.01196
G1 X136.839 Y168.499 E.28725
G1 X136.61 Y167.938 E.02257
G1 X148.11 Y167.939 E.42834
G3 X148.36 Y168.201 I-.014 J.264 E.01484
G1 X148.36 Y176.209 E.29828
G1 X148.344 Y176.289 E.00303
G3 X148.098 Y176.458 I-.248 J-.097 E.01182
G1 X137.224 Y176.46 E.40501
M204 S6000
G1 X137.426 Y176.917 F42000
G1 F3000
M204 S500
G1 X137.361 Y176.917 E.00241
G1 X137.265 Y177.198 E.01108
G1 X136.65 Y176.757 E.02819
G3 X136.383 Y176.229 I.507 J-.588 E.02261
G1 X136.382 Y168.589 E.28457
G2 X115.718 Y172.391 I-9.98 J3.814 E1.10448
G1 X115.718 Y176.931 E.16911
G1 X115.479 Y176.962 E.00898
G3 X115.082 Y173.991 I11.071 J-2.991 E.11198
G3 X115.14 Y171.283 I26.971 J-.782 E.1009
G3 X126.757 Y161.088 I11.271 J1.126 E.63361
G3 X136.165 Y166.678 I-.362 J11.321 E.42539
G1 X136.615 Y167.481 E.03427
G1 X148.128 Y167.482 E.42883
G3 X148.817 Y168.178 I-.033 J.722 E.04008
G1 X148.817 Y176.227 E.29978
G3 X148.12 Y176.915 I-.722 J-.033 E.04009
G1 X137.486 Y176.917 E.39609
M204 S6000
G1 X137.688 Y177.374 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X137.002 Y179.291 I-183.116 J-64.447 E.07583
G3 X136.55 Y180.111 I-12.844 J-6.54 E.03491
G3 X136.611 Y178.474 I19.859 J-.079 E.06103
G2 X136.625 Y177.302 I-30.543 J-.959 E.04369
G3 X135.982 Y176.557 I.691 J-1.248 E.03742
G3 X135.926 Y176.246 I1.206 J-.375 E.01178
G1 X135.925 Y168.678 E.28188
G2 X116.175 Y172.395 I-9.524 J3.723 E1.0544
G2 X116.178 Y178.109 I437.997 J2.598 E.2128
G3 X116.25 Y179.533 I-136.726 J7.591 E.05311
G1 X116.25 Y180.11 E.02151
G3 X115.614 Y178.752 I4.996 J-3.169 E.05601
G3 X114.625 Y173.995 I11.529 J-4.877 E.18214
G3 X114.685 Y171.238 I27.524 J-.783 E.10274
G3 X126.773 Y160.631 I11.726 J1.172 E.65924
G3 X136.883 Y167.024 I-.411 J11.84 E.467
G1 X148.146 Y167.025 E.41952
G3 X149.274 Y168.156 I-.052 J1.18 E.06532
G1 X149.274 Y176.245 E.30129
G3 X148.143 Y177.373 I-1.18 J-.053 E.06533
G1 X137.748 Y177.374 E.38716
M204 S6000
G1 X137.139 Y177.389 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.508942
G1 F3000
M204 S500
G1 X137.098 Y177.632 E.00935
; LINE_WIDTH: 0.47284
G1 X137.058 Y177.875 E.00863
; LINE_WIDTH: 0.436448
G1 X137.039 Y177.977 E.00333
; LINE_WIDTH: 0.396466
G1 X137.014 Y178.104 E.00373
; LINE_WIDTH: 0.353103
G1 X136.99 Y178.231 E.00327
; LINE_WIDTH: 0.309739
G1 X136.965 Y178.359 E.00282
; LINE_WIDTH: 0.26581
G1 X136.94 Y178.489 E.00241
; LINE_WIDTH: 0.221561
G1 X136.91 Y178.632 E.00213
; LINE_WIDTH: 0.177229
G1 X136.879 Y178.776 E.00162
; LINE_WIDTH: 0.141955
G1 X136.858 Y178.884 E.00088
; LINE_WIDTH: 0.115929
G1 X136.837 Y178.991 E.00065
; WIPE_START
G1 X136.858 Y178.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X136.521 Y171.259 Z.6 F42000
G1 X136.364 Y167.709 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.221464
G1 F3000
M204 S500
G1 X135.963 Y166.965 E.01229
G2 X115.4 Y172.41 I-9.564 J5.434 E.42023
G2 X115.404 Y174.433 I102.577 J.786 E.02943
; LINE_WIDTH: 0.200175
G1 X115.417 Y174.867 E.00557
; LINE_WIDTH: 0.16584
G1 X115.439 Y175.303 E.00436
; LINE_WIDTH: 0.123647
G1 X115.462 Y175.632 E.00217
; WIPE_START
G1 X115.439 Y175.303 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.63 Y177.173 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.58647
G1 F3000
M204 S500
G1 X115.679 Y177.501 E.0147
; LINE_WIDTH: 0.556603
G1 X115.701 Y177.63 E.00545
; LINE_WIDTH: 0.517113
G1 X115.719 Y177.737 E.00423
; LINE_WIDTH: 0.481684
G1 X115.738 Y177.844 E.00386
; LINE_WIDTH: 0.446519
G1 X115.756 Y177.95 E.00355
; LINE_WIDTH: 0.413855
G1 X115.771 Y178.032 E.00253
; LINE_WIDTH: 0.383707
G1 X115.787 Y178.115 E.00233
; LINE_WIDTH: 0.347025
G1 X115.813 Y178.242 E.00323
; LINE_WIDTH: 0.304742
G1 X115.838 Y178.365 E.00268
; LINE_WIDTH: 0.263268
G1 X115.864 Y178.488 E.00225
; LINE_WIDTH: 0.221795
G1 X115.889 Y178.611 E.00183
; LINE_WIDTH: 0.196082
G1 X115.897 Y178.645 E.00043
; LINE_WIDTH: 0.169065
G1 X115.936 Y178.82 E.00184
; LINE_WIDTH: 0.12493
G1 X115.975 Y178.994 E.00119
; WIPE_START
G1 X115.936 Y178.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X123.242 Y176.612 Z.6 F42000
G1 X148.177 Y169.077 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51487
G1 F6300
M204 S500
G1 X147.427 Y168.327 E.04079
G1 X146.759 Y168.327 E.02567
G1 X147.971 Y169.539 E.0659
G1 X147.971 Y170.207 E.02567
G1 X146.092 Y168.327 E.10221
G1 X145.424 Y168.327 E.02567
G1 X147.971 Y170.874 E.13851
G1 X147.971 Y171.541 E.02567
G1 X144.757 Y168.327 E.17482
G1 X144.089 Y168.327 E.02567
G1 X147.971 Y172.209 E.21112
G1 X147.971 Y172.876 E.02567
G1 X143.422 Y168.327 E.24743
G1 X142.754 Y168.327 E.02567
G1 X147.971 Y173.544 E.28373
G1 X147.971 Y174.211 E.02567
G1 X142.087 Y168.327 E.32003
G1 X141.419 Y168.327 E.02567
G1 X147.971 Y174.879 E.35634
G1 X147.971 Y175.546 E.02567
G1 X140.752 Y168.327 E.39264
G1 X140.084 Y168.327 E.02567
G1 X147.828 Y176.07 E.42114
G1 X147.16 Y176.07 E.02567
G1 X139.417 Y168.327 E.42115
G1 X138.749 Y168.327 E.02567
G1 X146.493 Y176.07 E.42115
G1 X145.826 Y176.07 E.02567
G1 X138.082 Y168.326 E.42116
G1 X137.414 Y168.326 E.02567
G1 X145.158 Y176.07 E.42117
G1 X144.491 Y176.07 E.02567
G1 X137.228 Y168.807 E.39503
G1 X137.228 Y169.475 E.02567
G1 X143.823 Y176.07 E.35873
G1 X143.156 Y176.07 E.02567
G1 X137.228 Y170.142 E.32242
G1 X137.228 Y170.81 E.02567
G1 X142.489 Y176.071 E.28612
G1 X141.821 Y176.071 E.02567
G1 X137.228 Y171.477 E.24982
G1 X137.228 Y172.145 E.02567
G1 X141.154 Y176.071 E.21352
G1 X140.487 Y176.071 E.02567
G1 X137.228 Y172.812 E.17722
G1 X137.228 Y173.48 E.02567
G1 X139.819 Y176.071 E.14091
G1 X139.152 Y176.071 E.02567
G1 X137.229 Y174.148 E.10461
G1 X137.229 Y174.815 E.02567
G1 X138.485 Y176.071 E.06831
G1 X137.817 Y176.071 E.02567
G1 X137.023 Y175.277 E.04319
; OBJECT_ID: 8
; WIPE_START
G1 X137.817 Y176.071 E-.4268
G1 X138.485 Y176.071 E-.2536
G1 X138.336 Y175.923 E-.0796
; WIPE_END
M73 P29 R19
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S6000
G1 X130.705 Y176.011 Z.6 F42000
G1 X91.821 Y176.459 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X91.62 Y176.459 E.00747
G3 X91.44 Y176.196 I.119 J-.275 E.01253
G1 X91.439 Y168.252 E.29588
G1 X91.308 Y167.938 E.0127
G1 X102.698 Y167.939 E.42423
G3 X102.96 Y168.201 I-.01 J.272 E.01517
G1 X102.96 Y176.209 E.29827
G1 X102.944 Y176.289 E.00304
G3 X102.698 Y176.458 I-.249 J-.098 E.01181
G1 X91.881 Y176.459 E.40288
M204 S6000
G1 X92.092 Y176.916 F42000
G1 F3000
M204 S500
G1 X92.03 Y176.916 E.00232
G1 X91.915 Y177.273 E.01395
G1 X91.683 Y177.236 E.00875
G1 X91.683 Y177.067 E.00629
G1 X91.25 Y176.756 E.01986
G3 X90.983 Y176.219 I.463 J-.565 E.02305
G1 X90.982 Y168.344 E.29331
G2 X70.918 Y172.09 I-9.679 J3.766 E1.07099
G1 X70.918 Y177.192 E.19001
G1 X70.68 Y177.224 E.00895
G3 X70.282 Y174.291 I11.452 J-3.046 E.11051
G3 X70.291 Y171.66 I66.149 J-1.092 E.09801
G1 X70.304 Y171.444 E.00806
G3 X81.531 Y161.083 I11.016 J.674 E.62847
G3 X90.888 Y166.671 I-.236 J11.023 E.42458
G1 X91.326 Y167.48 E.03427
G1 X102.72 Y167.482 E.42441
G3 X103.417 Y168.178 I-.025 J.721 E.04037
G1 X103.417 Y176.227 E.29978
G3 X102.72 Y176.915 I-.722 J-.033 E.04008
G1 X92.152 Y176.916 E.39363
M204 S6000
G1 X92.363 Y177.373 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X91.515 Y179.689 I-35.075 J-11.534 E.09185
G3 X91.15 Y180.326 I-8.449 J-4.412 E.02736
G3 X91.201 Y178.87 I10.734 J-.35 E.05431
G2 X91.225 Y177.301 I-20.664 J-1.102 E.05845
M73 P29 R18
G3 X90.568 Y176.513 I.696 J-1.248 E.03908
G3 X90.526 Y176.241 I1.146 J-.318 E.01029
G1 X90.525 Y168.435 E.29073
G2 X71.375 Y172.095 I-9.223 J3.673 E1.02098
G2 X71.378 Y178.298 I543.083 J2.843 E.23104
G2 X71.45 Y179.729 I85.387 J-3.584 E.05335
G1 X71.45 Y180.329 E.02237
G3 X71.009 Y179.541 I13.078 J-7.84 E.03366
G3 X70.405 Y177.9 I1305.323 J-481.04 E.06512
G3 X69.825 Y174.295 I11.077 J-3.631 E.13655
G3 X69.834 Y171.642 I66.73 J-1.096 E.09884
G1 X69.848 Y171.416 E.00841
G3 X81.541 Y160.626 I11.473 J.702 E.65454
G3 X91.598 Y167.023 I-.255 J11.505 E.46666
G1 X102.743 Y167.025 E.4151
G3 X103.874 Y168.155 I-.049 J1.18 E.06545
G1 X103.874 Y176.245 E.30129
G3 X102.743 Y177.372 I-1.18 J-.052 E.06533
G1 X92.423 Y177.373 E.38438
M204 S6000
G1 X91.763 Y177.48 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.560424
G1 F3000
M204 S500
G1 X91.701 Y177.872 E.01671
; LINE_WIDTH: 0.51598
G1 X91.675 Y178.015 E.00563
; LINE_WIDTH: 0.4662
G1 X91.65 Y178.159 E.00504
; LINE_WIDTH: 0.416419
G1 X91.624 Y178.303 E.00445
; LINE_WIDTH: 0.372141
G1 X91.605 Y178.408 E.00287
; LINE_WIDTH: 0.332885
G1 X91.58 Y178.528 E.0029
; LINE_WIDTH: 0.292916
G1 X91.555 Y178.649 E.0025
; LINE_WIDTH: 0.252946
G1 X91.529 Y178.769 E.0021
; LINE_WIDTH: 0.21226
G1 X91.503 Y178.894 E.00176
; LINE_WIDTH: 0.171543
G1 X91.468 Y179.04 E.00158
; LINE_WIDTH: 0.124425
G1 X91.419 Y179.244 E.00139
; WIPE_START
G1 X91.468 Y179.04 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X91.201 Y171.412 Z.6 F42000
G1 X91.071 Y167.709 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.221493
G1 F3000
M204 S500
G1 X90.777 Y167.132 E.00942
G2 X70.6 Y172.11 I-9.477 J4.969 E.41409
G2 X70.604 Y174.701 I137.423 J1.087 E.03771
; LINE_WIDTH: 0.202604
G1 X70.615 Y175.105 E.00526
; LINE_WIDTH: 0.172133
G1 X70.634 Y175.508 E.00425
; LINE_WIDTH: 0.140549
G1 X70.648 Y175.713 E.00163
; LINE_WIDTH: 0.115465
G1 X70.662 Y175.918 E.00121
; WIPE_START
G1 X70.648 Y175.713 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X70.831 Y177.434 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.583145
G1 F3000
M204 S500
G2 X70.89 Y177.818 I10.353 J-1.407 E.01712
; LINE_WIDTH: 0.536293
G1 X70.91 Y177.934 E.0047
; LINE_WIDTH: 0.497928
G1 X70.93 Y178.048 E.00428
; LINE_WIDTH: 0.459807
G1 X70.95 Y178.161 E.00393
; LINE_WIDTH: 0.427747
G1 X70.963 Y178.233 E.00227
; LINE_WIDTH: 0.401777
G1 X70.977 Y178.304 E.00212
; LINE_WIDTH: 0.36711
G1 X71.002 Y178.431 E.00342
; LINE_WIDTH: 0.324632
G1 X71.027 Y178.553 E.00287
; LINE_WIDTH: 0.282912
G1 X71.052 Y178.676 E.00245
; LINE_WIDTH: 0.241192
G1 X71.076 Y178.799 E.00202
; LINE_WIDTH: 0.20227
G1 X71.104 Y178.92 E.00161
; LINE_WIDTH: 0.166874
G1 X71.13 Y179.037 E.00121
; LINE_WIDTH: 0.126151
G1 X71.173 Y179.24 E.00141
; WIPE_START
G1 X71.13 Y179.037 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X78.322 Y176.482 Z.6 F42000
G1 X101.852 Y168.121 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50018
G1 F6300
M204 S500
G1 X102.571 Y168.84 E.03788
G1 X102.571 Y169.487 E.0241
G1 X101.411 Y168.327 E.06112
G1 X100.765 Y168.327 E.0241
G1 X102.571 Y170.134 E.0952
G1 X102.571 Y170.78 E.0241
G1 X100.118 Y168.327 E.12928
G1 X99.471 Y168.327 E.0241
G1 X102.571 Y171.427 E.16335
G1 X102.571 Y172.074 E.0241
G1 X98.824 Y168.327 E.19743
G1 X98.178 Y168.327 E.0241
G1 X102.571 Y172.72 E.23151
G1 X102.571 Y173.367 E.0241
G1 X97.531 Y168.327 E.26559
G1 X96.884 Y168.327 E.0241
G1 X102.571 Y174.014 E.29967
G1 X102.571 Y174.66 E.0241
G1 X96.238 Y168.327 E.33375
G1 X95.591 Y168.326 E.0241
G1 X102.571 Y175.307 E.36783
G1 X102.571 Y175.954 E.0241
G1 X94.944 Y168.326 E.40191
G1 X94.297 Y168.326 E.0241
G1 X102.041 Y176.07 E.40804
G1 X101.394 Y176.07 E.02409
G1 X93.651 Y168.326 E.40804
G1 X93.004 Y168.326 E.0241
G1 X100.748 Y176.07 E.40805
G1 X100.101 Y176.07 E.02409
G1 X92.357 Y168.326 E.40806
G1 X91.828 Y168.326 E.01973
G1 X91.828 Y168.443 E.00437
G1 X99.454 Y176.07 E.40189
G1 X98.808 Y176.07 E.02409
G1 X91.828 Y169.09 E.36781
G1 X91.828 Y169.737 E.0241
G1 X98.161 Y176.07 E.33374
G1 X97.515 Y176.07 E.02409
G1 X91.828 Y170.384 E.29966
G1 X91.828 Y171.03 E.0241
G1 X96.868 Y176.07 E.26558
G1 X96.221 Y176.07 E.02409
G1 X91.828 Y171.677 E.23151
G1 X91.828 Y172.324 E.0241
G1 X95.575 Y176.07 E.19743
G1 X94.928 Y176.071 E.02409
G1 X91.828 Y172.971 E.16335
G1 X91.828 Y173.617 E.0241
G1 X94.282 Y176.071 E.12928
G1 X93.635 Y176.071 E.02409
G1 X91.828 Y174.264 E.0952
G1 X91.829 Y174.911 E.0241
G1 X92.988 Y176.071 E.06112
G1 X92.342 Y176.071 E.02409
G1 X91.623 Y175.352 E.03788
; OBJECT_ID: 7
; WIPE_START
G1 X92.342 Y176.071 E-.38636
G1 X92.988 Y176.071 E-.24571
G1 X92.75 Y175.833 E-.12793
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S6000
G1 X85.119 Y175.938 Z.6 F42000
G1 X47.057 Y176.461 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X46.821 Y176.461 E.00883
G3 X46.64 Y176.198 I.122 J-.277 E.01251
G1 X46.639 Y167.939 E.30761
G1 X57.898 Y167.94 E.41934
M73 P30 R18
G3 X58.16 Y168.202 I-.01 J.272 E.01517
G1 X58.16 Y176.21 E.29827
G3 X57.915 Y176.459 I-.265 J-.015 E.01423
G1 X47.117 Y176.461 E.40216
M204 S6000
G1 X47.334 Y176.918 F42000
G1 F3000
M204 S500
G1 X47.272 Y176.918 E.00228
G1 X47.116 Y177.426 E.01981
G1 X46.882 Y177.391 E.0088
G1 X46.883 Y177.068 E.01201
G1 X46.45 Y176.758 E.01984
G3 X46.183 Y176.22 I.483 J-.575 E.023
G1 X46.182 Y168.183 E.29933
G2 X26.761 Y169.696 I-9.48 J3.719 E.96693
G2 X26.518 Y171.892 I11.259 J2.358 E.0824
G1 X26.52 Y177.374 E.20418
G1 X26.28 Y177.405 E.00899
G3 X25.882 Y174.491 I11.385 J-3.039 E.1098
G3 X25.891 Y171.471 I76.19 J-1.292 E.11252
G1 X25.903 Y171.256 E.00799
G3 X37.295 Y161.099 I10.8 J.645 E.631
G3 X46.17 Y166.671 I-.631 J10.859 E.40725
G1 X46.597 Y167.482 E.03412
G1 X57.92 Y167.483 E.42174
G3 X58.617 Y168.179 I-.025 J.721 E.04037
G1 X58.617 Y176.228 E.29977
G3 X57.928 Y176.917 I-.722 J-.033 E.03981
G1 X47.394 Y176.918 E.39237
M204 S6000
G1 X47.61 Y177.375 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X46.864 Y179.473 I-19.083 J-5.601 E.083
G3 X46.495 Y180.233 I-2.806 J-.894 E.03155
G1 X46.35 Y180.47 E.01035
G3 X46.408 Y178.917 I15.667 J-.192 E.05791
G2 X46.425 Y177.302 I-30.439 J-1.134 E.06014
G3 X45.74 Y176.381 I.629 J-1.184 E.0442
G1 X45.726 Y176.242 E.00521
G1 X45.725 Y168.275 E.29673
G2 X26.975 Y171.897 I-9.024 J3.627 E.99938
G1 X26.977 Y178.332 E.23969
G2 X27.05 Y179.822 I21.386 J-.302 E.05558
G1 X27.05 Y180.47 E.02414
G3 X26.586 Y179.648 I11.156 J-6.845 E.03517
G3 X25.973 Y177.971 I220.742 J-81.584 E.06649
G3 X25.425 Y174.496 I10.905 J-3.501 E.13156
G3 X25.434 Y171.453 I76.797 J-1.296 E.11337
G1 X25.447 Y171.229 E.00834
G3 X37.32 Y160.642 I11.256 J.672 E.65766
G3 X46.873 Y167.025 I-.636 J11.292 E.44884
G1 X57.943 Y167.026 E.41231
G3 X59.074 Y168.157 I-.049 J1.18 E.06545
G1 X59.074 Y176.246 E.30128
G3 X57.946 Y177.374 I-1.18 J-.052 E.06522
G1 X47.67 Y177.375 E.38274
M204 S6000
G1 X47.273 Y177.692 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.54036
G1 F3000
M204 S500
G1 X47.098 Y177.797 E.00827
; LINE_WIDTH: 0.57009
G1 X46.923 Y177.902 E.00877
; LINE_WIDTH: 0.563384
G1 X46.901 Y178.03 E.0055
; LINE_WIDTH: 0.520235
G1 X46.879 Y178.158 E.00505
; LINE_WIDTH: 0.477085
G1 X46.858 Y178.286 E.00459
; LINE_WIDTH: 0.441766
G1 X46.844 Y178.36 E.00245
; LINE_WIDTH: 0.413437
G1 X46.829 Y178.439 E.00242
; LINE_WIDTH: 0.377647
G1 X46.804 Y178.562 E.00342
; LINE_WIDTH: 0.335142
G1 X46.779 Y178.685 E.00299
; LINE_WIDTH: 0.292637
G1 X46.754 Y178.808 E.00255
; LINE_WIDTH: 0.249483
G1 X46.728 Y178.935 E.00218
; LINE_WIDTH: 0.206863
G1 X46.696 Y179.08 E.002
; LINE_WIDTH: 0.165289
G1 X46.663 Y179.226 E.00149
; LINE_WIDTH: 0.123714
G1 X46.631 Y179.372 E.00098
; WIPE_START
G1 X46.663 Y179.226 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X46.476 Y171.596 Z.6 F42000
G1 X46.387 Y168.017 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.196524
G1 F3000
M204 S500
G2 X46.324 Y167.71 I-14.513 J2.845 E.00392
; LINE_WIDTH: 0.227071
G1 X46.32 Y167.664 E.0007
G1 X46.362 Y167.672 E.00065
; LINE_WIDTH: 0.174266
G1 X46.405 Y167.68 E.00046
; LINE_WIDTH: 0.126009
G1 X46.447 Y167.688 E.00029
M204 S6000
G1 X46.32 Y167.664 F42000
; LINE_WIDTH: 0.221357
G1 F3000
M204 S500
G1 X45.983 Y166.995 E.01089
G2 X26.2 Y171.911 I-9.283 J4.907 E.40552
G2 X26.205 Y174.911 I153.197 J1.265 E.04362
; LINE_WIDTH: 0.202389
G1 X26.217 Y175.322 E.00534
; LINE_WIDTH: 0.170241
G1 X26.237 Y175.734 E.00428
; LINE_WIDTH: 0.126504
G1 X26.263 Y176.108 E.00256
; WIPE_START
G1 X26.237 Y175.734 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X26.429 Y177.616 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.570339
G1 F3000
M204 S500
G1 X26.464 Y177.824 E.00905
; LINE_WIDTH: 0.530959
G1 X26.499 Y178.031 E.00837
; LINE_WIDTH: 0.491579
G1 X26.534 Y178.239 E.0077
; LINE_WIDTH: 0.454256
G1 X26.552 Y178.334 E.00326
; LINE_WIDTH: 0.413901
G1 X26.577 Y178.465 E.00401
; LINE_WIDTH: 0.369214
G1 X26.602 Y178.591 E.00342
; LINE_WIDTH: 0.325221
G1 X26.626 Y178.717 E.00296
; LINE_WIDTH: 0.281228
G1 X26.651 Y178.844 E.0025
; LINE_WIDTH: 0.236164
G1 X26.682 Y178.99 E.00235
; LINE_WIDTH: 0.190748
G1 X26.712 Y179.132 E.00175
; LINE_WIDTH: 0.15197
G1 X26.738 Y179.26 E.00116
; LINE_WIDTH: 0.119573
G1 X26.763 Y179.386 E.0008
; WIPE_START
G1 X26.738 Y179.26 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X33.902 Y176.628 Z.6 F42000
G1 X57.052 Y168.123 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50018
G1 F6300
M204 S500
G1 X57.771 Y168.842 E.03788
G1 X57.771 Y169.488 E.0241
G1 X56.611 Y168.328 E.06112
G1 X55.965 Y168.328 E.0241
G1 X57.771 Y170.135 E.0952
G1 X57.771 Y170.782 E.0241
G1 X55.318 Y168.328 E.12927
G1 X54.671 Y168.328 E.0241
G1 X57.771 Y171.428 E.16335
G1 X57.771 Y172.075 E.0241
G1 X54.024 Y168.328 E.19743
G1 X53.378 Y168.328 E.0241
G1 X57.771 Y172.722 E.23151
G1 X57.771 Y173.368 E.0241
G1 X52.731 Y168.328 E.26559
G1 X52.084 Y168.328 E.0241
G1 X57.771 Y174.015 E.29967
G1 X57.771 Y174.662 E.0241
G1 X51.438 Y168.328 E.33375
G1 X50.791 Y168.328 E.0241
G1 X57.771 Y175.308 E.36783
G1 X57.771 Y175.955 E.0241
G1 X50.144 Y168.328 E.40191
G1 X49.497 Y168.328 E.0241
G1 X57.241 Y176.071 E.40804
G1 X56.594 Y176.071 E.02409
G1 X48.851 Y168.328 E.40804
G1 X48.204 Y168.328 E.0241
G1 X55.948 Y176.071 E.40805
G1 X55.301 Y176.071 E.02409
G1 X47.557 Y168.327 E.40806
G1 X47.028 Y168.327 E.01973
G1 X47.028 Y168.445 E.00437
G1 X54.654 Y176.071 E.40189
G1 X54.008 Y176.071 E.02409
G1 X47.028 Y169.091 E.36781
G1 X47.028 Y169.738 E.0241
G1 X53.361 Y176.071 E.33373
G1 X52.715 Y176.072 E.02409
G1 X47.028 Y170.385 E.29966
G1 X47.028 Y171.032 E.0241
G1 X52.068 Y176.072 E.26558
G1 X51.421 Y176.072 E.02409
G1 X47.028 Y171.678 E.2315
G1 X47.028 Y172.325 E.0241
G1 X50.775 Y176.072 E.19743
G1 X50.128 Y176.072 E.02409
G1 X47.028 Y172.972 E.16335
G1 X47.028 Y173.619 E.0241
G1 X49.482 Y176.072 E.12927
G1 X48.835 Y176.072 E.02409
G1 X47.029 Y174.265 E.0952
G1 X47.029 Y174.912 E.0241
G1 X48.188 Y176.072 E.06112
G1 X47.542 Y176.072 E.02409
G1 X46.823 Y175.353 E.03788
; OBJECT_ID: 3
; WIPE_START
G1 X47.542 Y176.072 E-.38634
G1 X48.188 Y176.072 E-.2457
G1 X47.95 Y175.834 E-.12796
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S6000
G1 X49.938 Y168.465 Z.6 F42000
G1 X68.708 Y98.861 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X53.192 Y98.861 E.57791
G1 X53.189 Y93.824 E.18761
G3 X53.486 Y93.539 I.27 J-.016 E.01742
G1 X54.421 Y93.539 E.03482
G1 X68.458 Y93.54 E.52283
G1 X68.559 Y93.564 E.00385
G1 X68.654 Y93.639 E.00449
G3 X68.711 Y93.836 I-.38 J.217 E.00772
G1 X68.708 Y98.801 E.18494
; WIPE_START
G1 X66.708 Y98.809 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X62.405 Y105.113 Z.6 F42000
G1 X32.759 Y148.544 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X32.701 Y148.532 E.00218
M73 P31 R18
G3 X26.518 Y141.008 I1.513 J-7.546 E.39275
G1 X26.518 Y106.992 E1.26696
G3 X26.639 Y105.652 I7.841 J.03 E.05019
G3 X34.192 Y99.318 I7.564 J1.35 E.39861
G1 X87.708 Y99.318 E1.99326
G3 X95.382 Y106.992 I-.022 J7.696 E.44864
G1 X95.382 Y141.008 E1.26696
G3 X87.708 Y148.682 I-7.685 J-.011 E.44881
G1 X34.192 Y148.682 E1.99326
G3 X33.297 Y148.627 I.022 J-7.696 E.0334
G1 X32.818 Y148.553 E.01807
M204 S6000
G1 X32.83 Y148.093 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X32.791 Y148.084 E.00151
G3 X26.975 Y141.003 I1.423 J-7.097 E.36954
G1 X26.975 Y106.997 E1.26661
G3 X34.197 Y99.775 I7.238 J.017 E.42225
G1 X87.703 Y99.775 E1.99291
G3 X94.925 Y106.997 I-.017 J7.238 E.42225
G1 X94.925 Y141.003 E1.26661
G3 X87.703 Y148.225 I-7.228 J-.006 E.42242
G1 X34.197 Y148.225 E1.99291
G3 X33.351 Y148.173 I.017 J-7.238 E.03157
G1 X32.89 Y148.102 E.0174
; WIPE_START
G1 X32.791 Y148.084 E-.03814
G1 X31.967 Y147.871 E-.32317
G1 X31.435 Y147.675 E-.21562
G1 X30.998 Y147.473 E-.18307
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X35.7 Y141.462 Z.6 F42000
G1 X69.165 Y98.682 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X87.691 Y98.682 E.69003
G3 X96.018 Y107.009 I-.007 J8.334 E.48703
G1 X96.018 Y140.991 E1.26573
G3 X87.691 Y149.318 I-8.322 J.004 E.48722
G1 X34.209 Y149.318 E1.99204
G3 X25.882 Y140.991 I-.004 J-8.322 E.48722
G1 X25.882 Y107.009 E1.26573
G3 X34.209 Y98.682 I8.322 J-.004 E.48722
G1 X52.735 Y98.682 E.69003
G1 X52.732 Y93.815 E.18128
G3 X53.473 Y93.082 I.725 J-.009 E.04332
G1 X54.421 Y93.082 E.03532
G1 X68.476 Y93.083 E.52349
G3 X69.168 Y93.823 I-.032 J.724 E.04177
G1 X69.165 Y98.622 E.17876
M204 S6000
G1 X69.623 Y98.225 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X87.696 Y98.225 E.67317
G3 X96.475 Y107.004 I-.013 J8.792 E.51341
G1 X96.475 Y140.996 E1.26609
G3 X87.696 Y149.775 I-8.779 J0 E.51361
G1 X34.204 Y149.775 E1.99239
G3 X25.425 Y140.996 I0 J-8.779 E.51361
G1 X25.425 Y107.004 E1.26609
G3 X34.204 Y98.225 I8.779 J0 E.51361
G1 X52.277 Y98.225 E.67317
G1 X52.275 Y93.806 E.16458
G3 X53.459 Y92.625 I1.181 J0 E.06923
G1 X54.421 Y92.625 E.03582
G1 X68.494 Y92.626 E.52415
G3 X69.625 Y93.809 I-.053 J1.183 E.06731
G1 X69.623 Y98.165 E.16224
; WIPE_START
G1 X71.623 Y98.172 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X68.937 Y99 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.221618
G1 F3000
M204 S500
G1 X87.688 Y99 E.27305
G1 X88.33 Y99.025 E.00934
M73 P32 R18
G1 X88.95 Y99.098 E.0091
G1 X89.261 Y99.154 E.0046
G1 X89.569 Y99.221 E.0046
G1 X90.172 Y99.392 E.00912
G1 X90.47 Y99.495 E.0046
G1 X91.049 Y99.735 E.00912
G1 X91.333 Y99.873 E.0046
G1 X91.88 Y100.179 E.00912
G1 X92.401 Y100.527 E.00913
G1 X92.653 Y100.718 E.0046
G1 X92.897 Y100.918 E.0046
G1 X93.357 Y101.343 E.00913
G1 X93.575 Y101.57 E.00459
G1 X93.982 Y102.047 E.00912
G1 X94.173 Y102.299 E.0046
G1 X94.521 Y102.82 E.00912
G1 X94.827 Y103.366 E.00912
G1 X94.965 Y103.651 E.0046
G1 X95.091 Y103.938 E.00457
G1 X95.308 Y104.526 E.00912
G1 X95.479 Y105.134 E.0092
G1 X95.601 Y105.747 E.00909
G1 X95.645 Y106.06 E.00461
G1 X95.675 Y106.374 E.00459
G1 X95.7 Y106.988 E.00895
G1 X95.7 Y140.988 E.4951
G1 X95.675 Y141.628 E.00932
G1 X95.602 Y142.25 E.00911
G1 X95.546 Y142.563 E.00463
G1 X95.4 Y143.172 E.00912
G1 X95.206 Y143.769 E.00914
G1 X94.966 Y144.348 E.00912
G1 X94.827 Y144.633 E.00462
G1 X94.521 Y145.18 E.00913
G1 X94.173 Y145.701 E.00912
G1 X93.981 Y145.954 E.00463
G1 X93.574 Y146.431 E.00913
G1 X93.132 Y146.873 E.00911
G1 X92.894 Y147.084 E.00462
G1 X92.402 Y147.472 E.00913
G1 X91.881 Y147.82 E.00912
G1 X91.607 Y147.981 E.00462
G1 X91.049 Y148.265 E.00913
G1 X90.76 Y148.392 E.00459
G1 X90.174 Y148.608 E.0091
G1 X89.566 Y148.779 E.0092
G1 X88.953 Y148.901 E.00909
G1 X88.64 Y148.945 E.0046
G1 X88.326 Y148.975 E.0046
G1 X87.712 Y149 E.00895
G1 X33.886 Y148.994 E.7838
G1 X33.57 Y148.975 E.0046
G1 X32.95 Y148.902 E.0091
G1 X32.331 Y148.779 E.00919
G1 X31.729 Y148.609 E.0091
G1 X31.431 Y148.506 E.0046
G1 X31.137 Y148.39 E.00461
G1 X30.568 Y148.128 E.00912
G1 X30.021 Y147.822 E.00914
G1 X29.755 Y147.651 E.00459
G1 X29.496 Y147.471 E.00459
G1 X29.006 Y147.084 E.00909
G1 X28.542 Y146.656 E.0092
G1 X28.118 Y146.197 E.0091
G1 X27.917 Y145.953 E.0046
G1 X27.548 Y145.445 E.00914
G1 X27.22 Y144.909 E.00916
G1 X26.935 Y144.349 E.00915
G1 X26.694 Y143.769 E.00914
G1 X26.5 Y143.172 E.00914
G1 X26.354 Y142.56 E.00915
G1 X26.255 Y141.94 E.00914
G1 X26.206 Y141.312 E.00918
G1 X26.206 Y106.688 E.50418
G1 X26.256 Y106.058 E.0092
G1 X26.353 Y105.441 E.0091
G1 X26.421 Y105.131 E.00462
G1 X26.591 Y104.529 E.0091
G1 X26.694 Y104.231 E.00459
G1 X26.934 Y103.652 E.00912
G1 X27.073 Y103.367 E.00463
G1 X27.378 Y102.822 E.00909
G1 X27.549 Y102.555 E.00461
G1 X27.916 Y102.049 E.00911
G1 X28.117 Y101.804 E.0046
G1 X28.327 Y101.568 E.0046
G1 X28.77 Y101.125 E.00912
G1 X29.246 Y100.718 E.00912
G1 X29.498 Y100.528 E.0046
G1 X30.019 Y100.18 E.00912
G1 X30.291 Y100.02 E.0046
G1 X30.57 Y99.871 E.0046
G1 X31.138 Y99.609 E.00912
G1 X31.433 Y99.494 E.0046
G1 X32.028 Y99.3 E.00912
G1 X32.638 Y99.154 E.00912
G1 X32.948 Y99.099 E.0046
G1 X33.572 Y99.025 E.00915
G1 X34.212 Y99 E.00932
G1 X52.963 Y99 E.27305
; WIPE_START
G1 X50.963 Y99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X58.238 Y96.69 Z.6 F42000
G1 X67.581 Y93.723 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5033
G1 F6300
M204 S500
G1 X68.322 Y94.464 E.03932
G1 X68.322 Y95.115 E.02441
G1 X67.135 Y93.929 E.06293
G1 X66.484 Y93.929 E.02443
G1 X68.321 Y95.766 E.09746
G1 X68.321 Y96.416 E.02441
G1 X65.833 Y93.929 E.13198
G1 X65.182 Y93.929 E.02443
G1 X68.321 Y97.067 E.16651
G1 X68.32 Y97.718 E.02441
G1 X64.531 Y93.928 E.20104
G1 X63.88 Y93.928 E.02443
G1 X68.32 Y98.368 E.23556
G1 X68.32 Y98.472 E.0039
G1 X67.773 Y98.472 E.02053
G1 X63.229 Y93.928 E.24108
G1 X62.578 Y93.928 E.02443
G1 X67.122 Y98.472 E.24108
G1 X66.471 Y98.472 E.02443
G1 X61.926 Y93.928 E.24108
G1 X61.275 Y93.928 E.02443
G1 X65.819 Y98.472 E.24109
G1 X65.168 Y98.472 E.02442
G1 X60.624 Y93.928 E.24109
G1 X59.973 Y93.928 E.02443
G1 X64.517 Y98.472 E.24109
G1 X63.866 Y98.472 E.02442
G1 X59.322 Y93.928 E.24109
G1 X58.671 Y93.928 E.02443
G1 X63.215 Y98.472 E.2411
G1 X62.564 Y98.472 E.02442
G1 X58.02 Y93.928 E.2411
G1 X57.369 Y93.928 E.02443
G1 X61.913 Y98.472 E.2411
G1 X61.262 Y98.472 E.02443
G1 X56.718 Y93.928 E.2411
G1 X56.066 Y93.928 E.02443
G1 X60.611 Y98.472 E.24111
G1 X59.96 Y98.472 E.02443
G1 X55.415 Y93.928 E.24111
G1 X54.764 Y93.928 E.02443
G1 X59.309 Y98.472 E.24111
G1 X58.658 Y98.472 E.02443
G1 X54.114 Y93.929 E.24105
G1 X53.585 Y93.931 E.01987
G1 X53.585 Y94.05 E.00448
G1 X58.007 Y98.472 E.23461
G1 X57.356 Y98.472 E.02443
G1 X53.584 Y94.701 E.2001
G1 X53.583 Y95.351 E.0244
G1 X56.704 Y98.472 E.16558
G1 X56.053 Y98.472 E.02442
G1 X53.583 Y96.002 E.13107
G1 X53.582 Y96.652 E.0244
G1 X55.402 Y98.472 E.09656
G1 X54.751 Y98.472 E.02442
G1 X53.582 Y97.303 E.06205
G1 X53.581 Y97.953 E.0244
G1 X54.306 Y98.678 E.03845
; OBJECT_ID: 1
; WIPE_START
G1 X53.581 Y97.953 E-.38943
G1 X53.582 Y97.303 E-.2472
G1 X53.811 Y97.532 E-.12337
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S6000
G1 X55.439 Y90.075 Z.6 F42000
G1 X68.208 Y31.561 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X52.692 Y31.561 E.57791
G1 X52.689 Y26.524 E.18761
G3 X52.986 Y26.239 I.27 J-.016 E.01742
G1 X53.436 Y26.239 E.01674
G1 X67.958 Y26.24 E.54091
G1 X68.059 Y26.264 E.00384
G1 X68.154 Y26.339 E.0045
G3 X68.211 Y26.536 I-.381 J.217 E.00772
G1 X68.208 Y31.501 E.18494
; WIPE_START
G1 X66.208 Y31.509 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X73.822 Y32.039 Z.6 F42000
M73 P32 R17
G1 X91.219 Y33.25 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X91.864 Y33.74 E.03013
G3 X94.382 Y39.192 I-4.667 J5.463 E.23079
G1 X94.382 Y73.208 E1.26696
G3 X87.208 Y80.382 I-7.185 J-.011 E.41956
G1 X33.692 Y80.382 E1.99326
G3 X26.518 Y73.208 I.011 J-7.185 E.41956
M73 P33 R17
G1 X26.518 Y39.192 E1.26696
G3 X33.692 Y32.018 I7.195 J.021 E.4194
G1 X87.208 Y32.018 E1.99326
G3 X91.17 Y33.216 I-.011 J7.185 E.15639
M204 S6000
G1 X90.928 Y33.603 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X90.936 Y33.609 E.00036
G3 X93.925 Y39.197 I-3.739 J5.594 E.24576
G1 X93.925 Y73.203 E1.26661
G3 X87.203 Y79.925 I-6.737 J-.016 E.39302
G1 X33.697 Y79.925 E1.99291
G3 X26.975 Y73.203 I.006 J-6.728 E.39317
G1 X26.975 Y39.197 E1.26661
G3 X33.697 Y32.475 I6.737 J.016 E.39302
G1 X87.203 Y32.475 E1.99291
G3 X90.253 Y33.209 I-.006 J6.728 E.11791
G1 X90.876 Y33.573 E.02689
; WIPE_START
G1 X90.936 Y33.609 E-.02649
G1 X91.568 Y34.086 E-.30087
G1 X91.955 Y34.445 E-.20064
G1 X92.314 Y34.832 E-.20064
G1 X92.364 Y34.898 E-.03136
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X84.814 Y33.778 Z.6 F42000
G1 X68.665 Y31.382 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X87.192 Y31.382 E.69003
G3 X95.018 Y39.209 I.004 J7.822 E.45797
G1 X95.018 Y73.191 E1.26573
G3 X87.191 Y81.018 I-7.833 J-.006 E.4578
G1 X33.709 Y81.018 E1.99204
G3 X25.882 Y73.191 I.006 J-7.833 E.45779
G1 X25.882 Y39.209 E1.26574
G3 X33.709 Y31.382 I7.833 J.006 E.45779
G1 X52.235 Y31.382 E.69003
G1 X52.232 Y26.515 E.18128
G3 X52.973 Y25.782 I.725 J-.009 E.04332
G1 X53.436 Y25.782 E.01723
G1 X67.976 Y25.783 E.54157
G3 X68.668 Y26.523 I-.032 J.724 E.04177
G1 X68.665 Y31.322 E.17876
M204 S6000
G1 X69.123 Y30.925 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X87.196 Y30.925 E.67317
G3 X95.475 Y39.204 I0 J8.279 E.48436
G1 X95.475 Y73.196 E1.26609
G3 X87.196 Y81.475 I-8.291 J-.012 E.48417
G1 X33.704 Y81.475 E1.99239
G3 X25.425 Y73.196 I.012 J-8.291 E.48417
G1 X25.425 Y39.204 E1.26609
G3 X33.704 Y30.925 I8.291 J.012 E.48417
G1 X51.777 Y30.925 E.67317
G1 X51.775 Y26.506 E.16458
G3 X52.96 Y25.325 I1.181 J0 E.06923
G1 X53.436 Y25.325 E.01773
G1 X67.994 Y25.326 E.54223
G3 X69.125 Y26.509 I-.053 J1.183 E.06731
G1 X69.123 Y30.865 E.16224
; WIPE_START
G1 X71.123 Y30.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X68.437 Y31.7 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.221624
G1 F3000
M204 S500
G1 X87.188 Y31.7 E.27306
G1 X87.788 Y31.723 E.00874
G1 X88.373 Y31.792 E.00858
G1 X89.236 Y31.982 E.01285
G1 X90.07 Y32.271 E.01286
G1 X90.864 Y32.656 E.01286
M73 P34 R17
G1 X91.609 Y33.132 E.01286
G1 X92.291 Y33.692 E.01285
G1 X92.903 Y34.329 E.01286
G1 X93.436 Y35.033 E.01285
G1 X93.882 Y35.794 E.01284
G1 X94.237 Y36.605 E.01289
G1 X94.492 Y37.447 E.01283
G1 X94.608 Y38.028 E.00862
G1 X94.694 Y38.908 E.01287
G1 X94.7 Y73.212 E.49954
G1 X94.648 Y74.08 E.01265
G1 X94.556 Y74.661 E.00858
G1 X94.418 Y75.236 E.0086
G1 X94.237 Y75.794 E.00855
G1 X94.011 Y76.34 E.0086
G1 X93.744 Y76.865 E.00858
G1 X93.436 Y77.367 E.00858
G1 X93.09 Y77.843 E.00858
G1 X92.503 Y78.503 E.01285
G1 X91.844 Y79.089 E.01284
G1 X91.365 Y79.437 E.00863
G1 X90.605 Y79.883 E.01283
G1 X89.796 Y80.236 E.01286
G1 X88.952 Y80.492 E.01284
G1 X88.372 Y80.608 E.00862
G1 X87.494 Y80.694 E.01284
G1 X33.688 Y80.7 E.78353
G1 X32.818 Y80.648 E.01268
G1 X31.951 Y80.493 E.01283
G1 X31.381 Y80.332 E.00863
G1 X30.56 Y80.011 E.01283
G1 X29.78 Y79.594 E.01288
G1 X29.292 Y79.268 E.00855
G1 X28.83 Y78.904 E.00855
G1 X28.193 Y78.291 E.01288
G1 X27.631 Y77.607 E.01288
G1 X27.305 Y77.119 E.00856
G1 X27.018 Y76.606 E.00855
G1 X26.663 Y75.796 E.01289
G1 X26.482 Y75.236 E.00857
G1 X26.344 Y74.665 E.00855
G1 X26.223 Y73.789 E.01288
G1 X26.2 Y73.188 E.00875
G1 X26.2 Y39.188 E.49512
G1 X26.252 Y38.318 E.01268
G1 X26.407 Y37.451 E.01283
G1 X26.568 Y36.881 E.00863
G1 X26.889 Y36.06 E.01283
G1 X27.305 Y35.281 E.01286
G1 X27.811 Y34.555 E.01288
G1 X28.398 Y33.895 E.01286
G1 X28.829 Y33.497 E.00855
G1 X29.29 Y33.133 E.00855
G1 X30.036 Y32.656 E.01289
G1 X30.83 Y32.271 E.01285
G1 X31.664 Y31.982 E.01286
G1 X32.526 Y31.792 E.01285
G1 X33.111 Y31.723 E.00857
G1 X33.712 Y31.7 E.00875
G1 X52.463 Y31.7 E.27306
; WIPE_START
G1 X50.463 Y31.7 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X57.738 Y29.39 Z.6 F42000
G1 X67.081 Y26.423 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5033
G1 F6300
M204 S500
G1 X67.822 Y27.164 E.03932
G1 X67.822 Y27.815 E.02441
G1 X66.635 Y26.629 E.06293
G1 X65.984 Y26.629 E.02443
G1 X67.821 Y28.466 E.09746
G1 X67.821 Y29.116 E.02441
G1 X65.333 Y26.629 E.13198
G1 X64.682 Y26.629 E.02443
G1 X67.821 Y29.767 E.16651
G1 X67.82 Y30.418 E.02441
G1 X64.031 Y26.628 E.20104
G1 X63.38 Y26.628 E.02443
G1 X67.82 Y31.068 E.23556
G1 X67.82 Y31.172 E.0039
G1 X67.273 Y31.172 E.02053
G1 X62.729 Y26.628 E.24108
G1 X62.078 Y26.628 E.02443
G1 X66.622 Y31.172 E.24108
G1 X65.971 Y31.172 E.02443
G1 X61.426 Y26.628 E.24108
G1 X60.775 Y26.628 E.02443
G1 X65.319 Y31.172 E.24108
G1 X64.668 Y31.172 E.02442
G1 X60.124 Y26.628 E.24109
G1 X59.473 Y26.628 E.02443
G1 X64.017 Y31.172 E.24109
G1 X63.366 Y31.172 E.02442
G1 X58.822 Y26.628 E.24109
G1 X58.171 Y26.628 E.02443
G1 X62.715 Y31.172 E.2411
G1 X62.064 Y31.172 E.02442
G1 X57.52 Y26.628 E.2411
G1 X56.869 Y26.628 E.02443
G1 X61.413 Y31.172 E.2411
G1 X60.762 Y31.172 E.02443
G1 X56.218 Y26.628 E.2411
G1 X55.566 Y26.628 E.02443
G1 X60.111 Y31.172 E.24111
G1 X59.46 Y31.172 E.02443
G1 X54.915 Y26.628 E.24111
G1 X54.264 Y26.628 E.02443
G1 X58.809 Y31.172 E.24111
G1 X58.158 Y31.172 E.02442
G1 X53.613 Y26.628 E.24111
G2 X53.085 Y26.635 I-.087 J12.275 E.01983
G1 X53.085 Y26.75 E.00431
G1 X57.507 Y31.172 E.23461
G1 X56.856 Y31.172 E.02442
G1 X53.084 Y27.401 E.2001
G1 X53.083 Y28.051 E.0244
G1 X56.204 Y31.172 E.16559
G1 X55.553 Y31.172 E.02442
G1 X53.083 Y28.702 E.13107
G1 X53.082 Y29.352 E.0244
G1 X54.902 Y31.172 E.09656
G1 X54.251 Y31.172 E.02442
G1 X53.082 Y30.003 E.06205
G1 X53.081 Y30.653 E.0244
G1 X53.806 Y31.378 E.03845
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X53.081 Y30.653 E-.38943
G1 X53.082 Y30.003 E-.2472
G1 X53.311 Y30.232 E-.12337
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 2/15
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S165.75
; open powerlost recovery
M1003 S1
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-.426 J1.14 P1  F42000
G1 X175.396 Y75.846 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X175.234 Y76.272 E.01514
G3 X168.311 Y80.909 I-6.947 J-2.886 E.29292
G1 X114.79 Y80.909 E1.77538
G3 X107.291 Y73.41 I.023 J-7.523 E.39045
G1 X107.291 Y39.39 E1.12848
G3 X114.79 Y31.891 I7.523 J.023 E.39044
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.024 J7.524 E.39043
G1 X175.809 Y73.41 E1.12848
G3 X175.438 Y75.719 I-7.523 J-.023 E.07791
G1 X175.415 Y75.789 E.00244
M204 S10000
G1 X175.014 Y75.705 F42000
G1 F8843.478
M204 S6000
G1 X174.858 Y76.116 E.0146
G3 X168.307 Y80.502 I-6.571 J-2.729 E.27717
G1 X114.794 Y80.502 E1.7751
G3 X107.698 Y73.406 I.019 J-7.115 E.3695
G1 X107.698 Y39.394 E1.12822
G3 X114.794 Y32.298 I7.115 J.019 E.3695
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.02 J7.116 E.36948
G1 X175.402 Y73.406 E1.12822
G3 X175.051 Y75.593 I-7.115 J-.019 E.0738
G1 X175.033 Y75.648 E.00191
M204 S250
G1 X174.645 Y75.571 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9300
M204 S5000
G1 X174.594 Y75.722 E.00491
G3 X173.879 Y77.128 I-6.316 J-2.33 E.04857
M73 P35 R17
G1 X173.57 Y77.554 E.01619
G1 F8400
G1 X173.394 Y77.768 E.00849
G1 F9300
G1 X173.042 Y78.142 E.01579
G3 X172.242 Y78.825 I-5.03 J-5.079 E.03236
G1 X171.806 Y79.121 E.01619
G1 F8400
G1 X171.567 Y79.261 E.00849
G1 F9300
G1 X171.207 Y79.435 E.01229
G1 X170.868 Y79.599 E.01159
G1 F8400
G1 X170.61 Y79.7 E.00849
G1 F9300
G1 X170.12 Y79.854 E.01578
G3 X169.088 Y80.06 I-1.906 J-6.883 E.03237
G1 X168.576 Y80.104 E.01578
G1 F8400
G1 X168.302 Y80.11 E.00842
G1 F9300
G1 X167.902 Y80.11 E.01229
G1 X114.798 Y80.11 E1.63175
G3 X110.646 Y78.669 I.009 J-6.727 E.13755
G1 X110.245 Y78.327 E.0162
G1 F8400
G1 X110.046 Y78.135 E.00849
G1 F9300
G1 X109.781 Y77.836 E.01229
G1 X109.531 Y77.553 E.01159
G3 X108.505 Y75.722 I5.312 J-4.182 E.06476
G3 X108.09 Y72.802 I7.369 J-2.536 E.09119
G1 X108.09 Y39.398 E1.02642
G3 X108.822 Y36.354 I6.739 J.011 E.09708
G1 X109.019 Y36.017 E.01199
G1 X109.221 Y35.672 E.01229
G1 F8400
G1 X109.379 Y35.446 E.00849
G1 F9300
G1 X109.699 Y35.043 E.0158
G3 X110.443 Y34.299 I5.15 J4.408 E.03237
G1 X110.743 Y34.07 E.01159
G1 X111.061 Y33.828 E.01229
G1 F8400
G1 X111.294 Y33.679 E.00849
G1 F9300
G1 X111.647 Y33.49 E.01229
G1 X111.979 Y33.312 E.01159
G1 F8400
G1 X112.232 Y33.201 E.00848
G1 F9300
G1 X112.728 Y33.023 E.01619
G3 X113.234 Y32.875 I2.764 J8.507 E.01619
G1 F8400
G1 X113.504 Y32.817 E.00849
G1 F9300
G1 X113.9 Y32.762 E.01229
G1 X114.274 Y32.712 E.01159
G3 X114.798 Y32.69 I.552 J6.942 E.01613
G1 X168.302 Y32.69 E1.64403
G3 X172.028 Y33.821 I-.01 J6.732 E.12137
G1 X172.454 Y34.131 E.01619
G1 F8400
G1 X172.668 Y34.306 E.00849
G1 F9300
G3 X173.045 Y34.655 I-4.27 J4.993 E.0158
G1 F8400
G1 X173.236 Y34.855 E.00849
G1 F9300
G1 X173.489 Y35.164 E.01229
G1 X173.725 Y35.458 E.01158
G3 X174.275 Y36.356 I-5.658 J4.084 E.03236
G1 X174.43 Y36.699 E.01158
G1 X174.591 Y37.065 E.01229
G1 F8400
G1 X174.682 Y37.326 E.00849
G1 F9300
G1 X174.783 Y37.713 E.01229
G1 X174.876 Y38.092 E.01198
G3 X175.01 Y39.998 I-7.454 J1.483 E.05886
G1 X175.01 Y73.402 E1.02642
G3 X174.757 Y75.221 I-6.732 J-.01 E.0566
G1 X174.663 Y75.513 E.00944
; WIPE_START
M204 S6000
G1 X174.594 Y75.722 E-.08349
G1 X174.394 Y76.209 E-.2002
G1 X174.154 Y76.679 E-.20019
G1 X173.879 Y77.128 E-.20021
G1 X173.761 Y77.289 E-.07592
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.192 Y70.543 Z.8 F42000
G1 X149.541 Y31.509 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I-.005 J7.906 E.41161
G1 X176.191 Y73.39 E1.12718
G3 X168.29 Y81.291 I-7.906 J-.005 E.41161
G1 X114.81 Y81.291 E1.77403
G3 X106.909 Y73.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E1.12718
G3 X114.81 Y31.509 I7.907 J.006 E.41159
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.52 E.1655
G3 X134.08 Y26.009 I.495 J-.016 E.0272
G1 X149.063 Y26.01 E.49703
G3 X149.541 Y26.52 I-.015 J.493 E.02574
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.01 J8.314 E.43254
G1 X176.598 Y73.394 E1.12745
G3 X168.294 Y81.698 I-8.314 J-.01 E.43254
G1 X114.806 Y81.698 E1.7743
G3 X106.502 Y73.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E1.12745
G3 X114.806 Y31.102 I8.315 J.011 E.43252
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.512 E.15226
G3 X134.068 Y25.602 I.906 J-.004 E.04766
G1 X149.079 Y25.603 E.49794
G3 X149.948 Y26.512 I-.036 J.905 E.04611
G1 X149.948 Y31.042 E.15028
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X150.379 Y30.71 E.00119
G1 F9300
G1 X167.698 Y30.71 E.53217
G3 X172.546 Y31.818 I.45 J9.191 E.15474
G3 X176.99 Y39.402 I-4.257 J7.588 E.28314
G1 X176.99 Y72.798 E1.02616
G3 X175.882 Y77.646 I-9.191 J.45 E.15474
G3 X168.298 Y82.09 I-7.588 J-4.257 E.28314
G1 X115.402 Y82.09 E1.62534
G3 X110.554 Y80.982 I-.45 J-9.19 E.15474
G3 X106.11 Y73.398 I4.259 J-7.589 E.28313
G1 X106.11 Y40.002 E1.02616
G3 X107.218 Y35.154 I9.191 J-.45 E.15473
G3 X114.802 Y30.71 I7.588 J4.257 E.28315
G1 X132.721 Y30.71 E.55061
G1 F9547.055
G1 X132.76 Y30.71 E.00119
G1 X132.76 Y26.504 E.12923
G3 X134.056 Y25.21 I1.3 J.006 E.06246
G1 X149.094 Y25.211 E.46205
G3 X150.34 Y26.504 I-.054 J1.299 E.06092
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X150.379 Y30.71 E-.02713
G1 X152.307 Y30.71 E-.73287
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 2 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer2 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X146.598 Y29.19 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518975
G1 F7562.151
M204 S6000
G1 X146.836 Y29.19 E.00924
G1 X146.836 Y28.714 E.01847
G1 X136.264 Y28.713 E.41009
G1 X136.264 Y29.189 E.01846
G1 X146.538 Y29.19 E.39854
M204 S10000
G1 X147.263 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.262 Y28.287 E.04085
G1 X135.838 Y28.287 E.35103
G1 X135.837 Y29.616 E.04083
G1 X147.203 Y29.617 E.34922
M204 S10000
G1 X147.64 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X147.639 Y27.91 E.06402
G1 X135.461 Y27.91 E.37419
G1 X135.46 Y29.993 E.06401
G1 X147.58 Y29.994 E.3724
M204 S10000
G1 X148.017 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X148.016 Y27.533 E.08719
G1 X135.084 Y27.532 E.39735
G1 X135.083 Y30.37 E.08718
G1 X147.957 Y30.371 E.39558
M204 S10000
G1 X148.394 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X148.393 Y27.156 E.11037
G1 X134.707 Y27.155 E.42051
G1 X134.706 Y30.747 E.11035
G1 X148.334 Y30.748 E.41876
M204 S10000
G1 X148.772 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X148.77 Y26.779 E.13354
G1 X134.33 Y26.778 E.44367
G1 X134.328 Y31.124 E.13352
G1 X148.712 Y31.125 E.44194
M204 S10000
G1 X149.149 Y31.502 F42000
G1 F9547.299
M204 S6000
G1 X149.147 Y26.566 E.15167
G1 X149.104 Y26.44 E.00409
G1 X148.975 Y26.402 E.00413
G1 X134.101 Y26.401 E.45701
G1 X133.981 Y26.45 E.00399
G1 X133.953 Y26.558 E.00344
G1 X133.951 Y31.501 E.15187
G1 X149.089 Y31.502 E.46512
; OBJECT_ID: 4
; WIPE_START
G1 X147.089 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X145.368 Y38.938 Z.8 F42000
G1 X129.202 Y108.791 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.108 Y108.791 E.00312
G1 X129.009 Y109.114 E.01122
G1 X128.465 Y108.656 E.02359
G3 X128.31 Y108.309 I.332 J-.356 E.01295
G1 X128.309 Y100.519 E.25841
G2 X108.291 Y103.99 I-9.704 J3.493 E.95591
G1 X108.291 Y108.402 E.14636
G1 X108.068 Y108.422 E.00743
G3 X107.909 Y106.59 I10.926 J-1.869 E.06107
G3 X107.918 Y103.578 I76.379 J-1.29 E.0999
G3 X119.088 Y93.32 I10.701 J.442 E.55899
G3 X127.982 Y98.875 I-.526 J10.739 E.36334
G1 X128.469 Y99.809 E.03494
G1 X139.819 Y99.81 E.37651
G3 X140.29 Y100.291 I-.027 J.497 E.0245
G1 X140.29 Y108.319 E.26631
G3 X139.809 Y108.789 I-.497 J-.027 E.02449
G1 X129.262 Y108.791 E.34988
M204 S10000
G1 X129.455 Y109.198 F42000
G1 F8843.478
M204 S6000
G1 X129.409 Y109.198 E.00153
G3 X128.697 Y111.206 I-15.446 J-4.344 E.07075
G1 X128.502 Y111.166 E.0066
G1 X128.502 Y109.22 E.06457
G3 X128.05 Y108.792 I.997 J-1.506 E.02074
G3 X127.903 Y108.329 I.795 J-.507 E.01632
G1 X127.902 Y100.597 E.25646
G2 X108.698 Y103.994 I-9.299 J3.413 E.91613
G1 X108.698 Y111.168 E.23799
G1 X108.503 Y111.208 E.00661
G3 X107.502 Y106.593 I10.241 J-4.636 E.15782
G3 X107.511 Y103.562 I76.884 J-1.294 E.10055
G3 X119.107 Y92.914 I11.109 J.459 E.58029
G3 X128.339 Y98.68 I-.546 J11.148 E.37717
G1 X128.716 Y99.402 E.02701
G1 X139.835 Y99.403 E.36884
G3 X140.697 Y100.271 I-.047 J.909 E.04448
G1 X140.697 Y108.335 E.2675
G3 X139.829 Y109.197 I-.909 J-.048 E.04447
G1 X129.515 Y109.198 E.34215
M204 S250
G1 X129.699 Y109.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X129.686 Y109.631 E.00132
G1 F9300
G1 X129.519 Y110.175 E.01749
G1 F8400
G3 X129.058 Y111.359 I-12.164 J-4.056 E.03905
G1 F9300
G1 X128.879 Y111.716 E.01229
G1 X128.672 Y112.129 E.01417
G1 F8400
G1 X128.435 Y112.525 E.01418
G1 F6622.451
G1 X128.23 Y112.868 E.01229
G1 F2880
G1 X128.11 Y113.044 E.00656
G1 F6622.451
G1 X128.11 Y112.644 E.01229
G1 F9300
G1 X128.11 Y112.244 E.01229
G1 X128.11 Y109.44 E.08618
G1 F9547.055
G1 X128.11 Y109.402 E.00116
G3 X127.511 Y108.348 I.784 J-1.142 E.03857
G1 X127.51 Y100.673 E.23582
M73 P36 R17
G1 X127.469 Y100.571 E.00338
G1 F9300
G2 X125.504 Y97.46 I-8.917 J3.458 E.11378
G1 X125.239 Y97.19 E.01161
G1 F8400
G2 X124.677 Y96.685 I-6.949 J7.154 E.02321
G1 F9300
G1 X124.381 Y96.451 E.0116
G2 X121.373 Y94.907 I-5.901 J7.794 E.1044
G1 X121.031 Y94.813 E.01092
G1 X120.644 Y94.712 E.01229
G1 F8400
G2 X119.9 Y94.579 I-2.127 J9.753 E.02321
G1 F9300
G1 X119.502 Y94.54 E.01229
G1 X119.148 Y94.511 E.01091
G2 X117.64 Y94.544 I-.535 J10.124 E.0464
G1 X117.288 Y94.588 E.01091
G1 X116.892 Y94.644 E.01229
G1 F8400
G1 X116.522 Y94.72 E.01161
G1 F9300
G1 X116.135 Y94.822 E.01229
G1 X115.794 Y94.921 E.0109
G1 X115.458 Y95.036 E.01091
G1 X115.08 Y95.165 E.01229
G1 F8400
G1 X114.732 Y95.312 E.0116
G1 F9300
G1 X114.373 Y95.489 E.01229
G1 X114.058 Y95.653 E.01092
G1 X113.751 Y95.832 E.0109
G1 X113.406 Y96.033 E.01229
G1 F8400
G1 X113.094 Y96.246 E.01161
G1 F9300
G1 X112.777 Y96.49 E.01229
G1 X112.496 Y96.707 E.01092
G1 F8400
G1 X112.211 Y96.956 E.0116
G1 F9300
G1 X111.926 Y97.236 E.01229
G1 X111.678 Y97.49 E.01091
G1 X111.442 Y97.756 E.01091
G1 X111.177 Y98.055 E.01229
G1 F8400
G1 X110.947 Y98.355 E.01161
G1 F9300
G1 X110.722 Y98.686 E.01229
G1 X110.529 Y98.984 E.01091
G1 X110.351 Y99.291 E.0109
G1 X110.15 Y99.636 E.01229
G1 F8400
G1 X109.983 Y99.976 E.01161
G1 F9300
G1 X109.829 Y100.344 E.01229
G1 X109.693 Y100.673 E.01092
G2 X109.456 Y101.39 I9.283 J3.459 E.0232
G1 X109.359 Y101.755 E.01161
G1 F8400
G1 X109.277 Y102.124 E.01161
G1 F9300
G1 X109.213 Y102.519 E.01229
G1 X109.16 Y102.851 E.01034
G1 F8400
G1 X109.12 Y103.245 E.01218
G1 F9300
G1 X109.1 Y103.622 E.01161
G2 X109.09 Y104.598 I16.227 J.658 E.02998
G1 X109.09 Y112.244 E.23496
G1 X109.09 Y112.644 E.01229
G1 F6803.787
G1 X109.09 Y113.044 E.01229
G1 F3000
G1 X108.96 Y112.851 E.00715
G1 F6803.787
G1 X108.755 Y112.508 E.01229
G1 F8400
G1 X108.509 Y112.094 E.01479
G1 F9300
G1 X108.306 Y111.703 E.01353
G1 F8400
G3 X107.413 Y109.221 I11.647 J-5.59 E.0812
G1 F9300
G1 X107.337 Y108.828 E.01229
G1 X107.245 Y108.356 E.01479
G1 F8400
G1 X107.186 Y107.919 E.01354
G1 F9300
G1 X107.143 Y107.458 E.01423
G1 F8400
G3 X107.11 Y106.597 I11.191 J-.854 E.02647
G1 F9300
G1 X107.11 Y106.197 E.01229
G1 X107.11 Y104.602 E.04902
G3 X110.186 Y96.175 I11.685 J-.509 E.28289
G3 X117.767 Y92.541 I8.423 J7.847 E.26444
G1 X118.295 Y92.523 E.01624
G1 X118.695 Y92.511 E.01229
G1 F8400
G1 X119.125 Y92.522 E.01321
G1 X119.577 Y92.551 E.01392
G1 F9300
G1 X119.974 Y92.601 E.01229
G1 X120.475 Y92.667 E.01553
G3 X128.932 Y98.969 I-1.917 J11.398 E.33653
G1 F9547.055
G1 X128.954 Y99.01 E.00142
G1 X139.85 Y99.011 E.33483
G3 X141.089 Y100.251 I-.068 J1.306 E.05903
G1 X141.089 Y108.35 E.24885
G3 X139.849 Y109.589 I-1.306 J-.068 E.05902
G1 X129.759 Y109.59 E.31004
M204 S10000
G1 X128.896 Y109.525 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.359069
G1 F11387.037
M204 S6000
G1 X128.864 Y109.738 E.00554
; LINE_WIDTH: 0.31725
G1 F13122.898
G1 X128.832 Y109.951 E.00481
; LINE_WIDTH: 0.274831
G1 F15000
G1 X128.811 Y110.079 E.00245
; LINE_WIDTH: 0.231811
G1 X128.789 Y110.207 E.002
; LINE_WIDTH: 0.188791
G1 X128.768 Y110.335 E.00154
; LINE_WIDTH: 0.149678
G1 X128.748 Y110.442 E.00095
; LINE_WIDTH: 0.114506
G1 X128.728 Y110.549 E.00064
M204 S10000
G1 X128.896 Y109.525 F42000
; LINE_WIDTH: 0.400889
G1 F10056.758
M204 S6000
G1 X128.928 Y109.313 E.00628
; WIPE_START
G1 X128.896 Y109.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.999 Y101.894 Z.8 F42000
G1 X129.025 Y99.972 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42238
G1 F9487.166
M204 S6000
G1 X128.614 Y100.383 E.01797
G1 X128.642 Y100.454 E.00236
G1 X128.642 Y100.892 E.01352
G1 X129.392 Y100.142 E.03277
G1 X129.928 Y100.142 E.01659
G1 X128.643 Y101.428 E.05623
G1 X128.643 Y101.965 E.01659
G1 X130.465 Y100.142 E.07969
G1 X131.002 Y100.142 E.01659
G1 X128.643 Y102.501 E.10315
G1 X128.643 Y103.038 E.01659
G1 X131.538 Y100.142 E.12661
G1 X132.075 Y100.142 E.01659
G1 X128.643 Y103.574 E.15007
G1 X128.643 Y104.111 E.01659
G1 X132.611 Y100.143 E.17353
G1 X133.148 Y100.143 E.01659
G1 X128.643 Y104.648 E.197
G1 X128.643 Y105.184 E.01659
G1 X133.684 Y100.143 E.22046
G1 X134.221 Y100.143 E.01659
G1 X128.643 Y105.721 E.24392
G1 X128.643 Y106.257 E.01659
G1 X134.758 Y100.143 E.26738
G1 X135.294 Y100.143 E.01659
G1 X128.643 Y106.794 E.29084
G1 X128.643 Y107.33 E.01659
G1 X135.831 Y100.143 E.3143
G1 X136.367 Y100.143 E.01659
G1 X128.643 Y107.867 E.33776
G1 X128.644 Y108.273 E.01256
G2 X128.67 Y108.377 I.158 J.015 E.00338
G1 X136.904 Y100.143 E.36006
G1 X137.441 Y100.143 E.01659
G1 X129.126 Y108.457 E.36358
G1 X129.663 Y108.457 E.0166
G1 X137.977 Y100.143 E.36358
G1 X138.514 Y100.143 E.01659
G1 X130.2 Y108.457 E.36357
G1 X130.736 Y108.457 E.0166
G1 X139.05 Y100.143 E.36357
G1 X139.587 Y100.143 E.01659
G1 X131.273 Y108.457 E.36356
G1 X131.81 Y108.457 E.0166
G1 X139.956 Y100.31 E.35625
G1 X139.956 Y100.847 E.01659
G1 X132.346 Y108.457 E.33278
G1 X132.883 Y108.457 E.0166
G1 X139.956 Y101.384 E.30932
G1 X139.956 Y101.92 E.01659
G1 X133.42 Y108.457 E.28585
G1 X133.956 Y108.457 E.0166
G1 X139.956 Y102.457 E.26238
G1 X139.956 Y102.994 E.01659
G1 X134.493 Y108.457 E.23891
G1 X135.03 Y108.457 E.0166
G1 X139.956 Y103.53 E.21544
G1 X139.956 Y104.067 E.01659
G1 X135.567 Y108.457 E.19197
G1 X136.103 Y108.457 E.0166
G1 X139.956 Y104.603 E.1685
G1 X139.956 Y105.14 E.01659
G1 X136.64 Y108.457 E.14503
G1 X137.177 Y108.457 E.0166
G1 X139.956 Y105.677 E.12156
G1 X139.956 Y106.213 E.01659
G1 X137.713 Y108.456 E.09809
G1 X138.25 Y108.456 E.0166
G1 X139.956 Y106.75 E.07462
G1 X139.956 Y107.287 E.01659
G1 X138.787 Y108.456 E.05115
G1 X139.323 Y108.456 E.0166
G1 X139.956 Y107.823 E.02768
G1 X139.956 Y108.293 E.01451
G3 X139.925 Y108.388 I-.184 J-.007 E.00314
G3 X139.69 Y108.626 I-2.087 J-1.826 E.01035
; WIPE_START
G1 X139.925 Y108.388 E-.12709
G1 X139.956 Y108.293 E-.0381
G1 X139.956 Y107.823 E-.17835
G1 X139.323 Y108.456 E-.34019
G1 X139.123 Y108.456 E-.07627
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.508 Y108.976 Z.8 F42000
G1 X108.472 Y110.549 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121033
G1 F15000
M204 S6000
G1 X108.446 Y110.405 E.00093
; LINE_WIDTH: 0.169238
G1 X108.419 Y110.261 E.00151
; LINE_WIDTH: 0.21603
G1 X108.397 Y110.123 E.00197
; LINE_WIDTH: 0.261402
G1 X108.374 Y109.985 E.00249
; LINE_WIDTH: 0.306774
G1 F13643.908
G1 X108.351 Y109.847 E.00301
; LINE_WIDTH: 0.349343
G1 F11748.474
G1 X108.331 Y109.71 E.00346
; LINE_WIDTH: 0.389086
G1 F10399.645
G1 X108.311 Y109.572 E.00391
; LINE_WIDTH: 0.428829
G1 F9328.635
G1 X108.292 Y109.435 E.00436
; LINE_WIDTH: 0.465695
G1 F8515.174
G1 X108.275 Y109.299 E.00471
; LINE_WIDTH: 0.499713
G1 F7881.035
G1 X108.257 Y109.164 E.00509
; LINE_WIDTH: 0.533731
G1 F7334.8
G1 X108.24 Y109.028 E.00547
; LINE_WIDTH: 0.566
G1 F6882.311
G1 X108.197 Y108.615 E.01771
; OBJECT_ID: 5
; WIPE_START
G1 X108.24 Y109.028 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.873 Y109 Z.8 F42000
G1 X173.964 Y108.789 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.867 Y108.789 E.00322
G1 X173.773 Y109.083 E.01023
G1 X173.265 Y108.655 E.02205
G3 X173.11 Y108.307 I.332 J-.356 E.01296
G1 X173.109 Y100.683 E.25291
G2 X152.691 Y104.189 I-9.904 J3.527 E.97562
G1 X152.691 Y108.221 E.13376
G1 X152.468 Y108.241 E.00742
G3 X152.309 Y106.388 I11.046 J-1.881 E.06174
G3 X152.319 Y103.742 I60.637 J-1.089 E.08781
G3 X163.457 Y93.311 I10.887 J.463 E.56074
G3 X172.7 Y98.874 I-.291 J10.944 E.3742
G1 X173.199 Y99.808 E.03512
G1 X184.619 Y99.809 E.37881
G3 X185.09 Y100.289 I-.024 J.494 E.02454
G1 X185.09 Y108.318 E.26631
G3 X184.609 Y108.788 I-.494 J-.024 E.02453
G1 X174.024 Y108.789 E.35112
M204 S10000
G1 X174.212 Y109.196 F42000
G1 F8843.478
M204 S6000
G1 X174.164 Y109.196 E.00158
G3 X173.494 Y111.048 I-16.697 J-4.995 E.06535
G1 X173.302 Y111.006 E.00653
G1 X173.302 Y109.218 E.0593
G3 X172.85 Y108.791 I.999 J-1.508 E.02073
G3 X172.703 Y108.327 I.794 J-.507 E.01633
G1 X172.702 Y100.761 E.25099
G2 X153.098 Y104.193 I-9.499 J3.448 E.93582
G1 X153.098 Y111.005 E.22597
G1 X152.904 Y111.045 E.00658
G3 X151.902 Y106.393 I10.362 J-4.665 E.15906
G3 X151.913 Y103.725 I61.111 J-1.094 E.0885
G3 X163.467 Y92.904 I11.294 J.48 E.58172
G3 X173.055 Y98.675 I-.302 J11.354 E.38819
G1 X173.443 Y99.4 E.0273
G1 X184.635 Y99.402 E.37125
G3 X185.497 Y100.269 I-.041 J.902 E.04456
G1 X185.497 Y108.333 E.26751
G3 X184.629 Y109.195 I-.91 J-.048 E.04447
G1 X174.272 Y109.196 E.34357
M204 S250
G1 X174.451 Y109.588 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X174.438 Y109.629 E.00132
G1 F9300
G3 X173.524 Y111.877 I-11.567 J-3.391 E.07466
G1 X173.262 Y112.332 E.01616
G1 X173.06 Y112.678 E.01229
G1 F4800
G1 X172.91 Y112.904 E.00834
G1 F9300
G1 X172.91 Y112.504 E.01229
G1 X172.91 Y109.439 E.09419
G1 F9547.055
G1 X172.91 Y109.401 E.00116
G3 X172.311 Y108.346 I.784 J-1.143 E.03857
G1 X172.31 Y100.836 E.23078
G1 X172.269 Y100.732 E.00342
G1 F9300
G2 X170.529 Y97.831 I-9.118 J3.495 E.10448
G1 X170.275 Y97.559 E.01144
G1 X170.001 Y97.268 E.01229
G1 F8400
G1 X169.72 Y97.003 E.01187
G1 F9300
G1 X169.428 Y96.75 E.01187
G2 X165.686 Y94.812 I-6.255 J7.501 E.13052
G1 X165.31 Y94.72 E.01187
G1 F8400
G2 X164.551 Y94.583 I-2.196 J9.95 E.02373
G1 F9300
G1 X164.153 Y94.543 E.01229
G1 X163.782 Y94.512 E.01143
G2 X162.24 Y94.542 I-.569 J10.335 E.04745
G1 X161.871 Y94.588 E.01142
G1 X161.475 Y94.643 E.01229
G1 F8400
G1 X161.096 Y94.719 E.01188
G1 F9300
G1 X160.709 Y94.821 E.01229
G1 X160.349 Y94.916 E.01143
G1 F8400
G1 X159.982 Y95.037 E.01187
G1 F9300
G1 X159.61 Y95.184 E.01229
G1 X159.282 Y95.314 E.01085
G1 F8400
G1 X158.915 Y95.485 E.01245
G1 F9300
G1 X158.563 Y95.676 E.01229
G1 X158.24 Y95.86 E.01144
G1 X157.926 Y96.06 E.01143
G1 X157.588 Y96.274 E.01229
G1 F8400
G1 X157.278 Y96.504 E.01186
G1 F9300
G1 X156.971 Y96.76 E.01229
G1 X156.699 Y96.986 E.01085
G1 F8400
G1 X156.404 Y97.263 E.01245
G1 F9300
G1 X156.133 Y97.539 E.01188
G1 F8400
G2 X155.627 Y98.122 I7.422 J6.969 E.02372
G1 F9300
G1 X155.391 Y98.427 E.01186
G1 F8400
G1 X155.167 Y98.743 E.01188
G1 F9300
G1 X154.956 Y99.082 E.01229
G1 X154.769 Y99.382 E.01085
G1 F8400
G1 X154.575 Y99.738 E.01245
G1 F9300
G1 X154.406 Y100.1 E.01229
G1 X154.25 Y100.438 E.01144
G2 X153.979 Y101.161 I9.327 J3.91 E.02373
G1 X153.864 Y101.53 E.01187
G1 F8400
G1 X153.765 Y101.903 E.01187
G1 F9300
G1 X153.685 Y102.261 E.01128
G1 F8400
G1 X153.613 Y102.66 E.01245
G1 F9300
G1 X153.565 Y103.057 E.01229
G1 X153.524 Y103.427 E.01145
G2 X153.49 Y104.796 I11.718 J.972 E.04211
G1 X153.49 Y111.707 E.21236
G1 X153.49 Y112.107 E.01229
G1 F9295.549
G1 X153.49 Y112.507 E.01229
G1 F4719.775
G1 X153.49 Y112.907 E.01229
M106 S255
G1 F1680
G1 X153.48 Y112.892 E.00056
M106 S165.75
G1 F4719.775
G1 X153.271 Y112.551 E.01229
G1 F9300
G1 X153.005 Y112.107 E.01591
G3 X151.51 Y105.796 I10.513 J-5.822 E.20177
G1 X151.51 Y104.801 E.03058
G3 X154.705 Y96.168 I11.881 J-.511 E.29046
G3 X163.476 Y92.512 I8.507 J8.061 E.30062
G3 X173.656 Y98.967 I-.286 J11.707 E.3891
G1 F9547.055
G1 X173.678 Y99.008 E.00143
G1 X184.65 Y99.01 E.33714
G3 X185.889 Y100.25 I-.057 J1.295 E.05914
G1 X185.889 Y108.349 E.24886
G3 X184.648 Y109.587 I-1.306 J-.068 E.05902
G1 X174.511 Y109.588 E.31151
M204 S10000
G1 X173.673 Y109.514 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.360914
G1 F11320.966
M204 S6000
G1 X173.707 Y109.294 E.00578
M204 S10000
G1 X173.673 Y109.514 F42000
; LINE_WIDTH: 0.312725
G1 F13342.998
M204 S6000
G1 X173.639 Y109.735 E.0049
; LINE_WIDTH: 0.264535
G1 F15000
G1 X173.604 Y109.955 E.00403
; LINE_WIDTH: 0.216537
G1 X173.579 Y110.099 E.00208
; LINE_WIDTH: 0.16869
G1 X173.553 Y110.244 E.0015
; LINE_WIDTH: 0.120844
G1 X173.528 Y110.388 E.00093
; WIPE_START
G1 X173.553 Y110.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.71 Y102.613 Z.8 F42000
G1 X173.764 Y99.971 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42354
G1 F9458.252
M204 S6000
G1 X173.35 Y100.386 E.01818
G1 X173.442 Y100.619 E.0078
G1 X173.442 Y100.831 E.00656
G1 X174.133 Y100.141 E.03028
G1 X174.671 Y100.141 E.01669
G1 X173.442 Y101.369 E.05388
G1 X173.443 Y101.908 E.01669
G1 X175.209 Y100.141 E.07749
G1 X175.747 Y100.141 E.01669
G1 X173.443 Y102.446 E.10109
G1 X173.443 Y102.984 E.01669
G1 X176.286 Y100.141 E.12469
G1 X176.824 Y100.141 E.01669
G1 X173.443 Y103.522 E.1483
G1 X173.443 Y104.06 E.01669
G1 X177.362 Y100.141 E.1719
G1 X177.9 Y100.141 E.01669
G1 X173.443 Y104.598 E.19551
G1 X173.443 Y105.137 E.01669
G1 X178.438 Y100.141 E.21911
G1 X178.977 Y100.141 E.01669
G1 X173.443 Y105.675 E.24272
G1 X173.443 Y106.213 E.01669
G1 X179.515 Y100.141 E.26632
G1 X180.053 Y100.141 E.01669
G1 X173.443 Y106.751 E.28992
G1 X173.443 Y107.289 E.01669
G1 X180.591 Y100.142 E.31353
G1 X181.13 Y100.142 E.01669
G1 X173.443 Y107.828 E.33713
G1 X173.444 Y108.272 E.01378
G1 X173.46 Y108.349 E.00245
G1 X181.668 Y100.142 E.36001
G1 X182.206 Y100.142 E.01669
G1 X173.892 Y108.456 E.36469
G1 X174.43 Y108.456 E.0167
G1 X182.744 Y100.142 E.36469
G1 X183.282 Y100.142 E.01669
G1 X174.968 Y108.456 E.36468
G1 X175.507 Y108.456 E.0167
G1 X183.821 Y100.142 E.36468
G1 X184.359 Y100.142 E.01669
G1 X176.045 Y108.456 E.36467
G1 X176.583 Y108.456 E.0167
G1 X184.752 Y100.287 E.35831
G1 X184.756 Y100.821 E.01656
G1 X177.122 Y108.456 E.33489
G1 X177.66 Y108.456 E.0167
G1 X184.756 Y101.359 E.31127
G1 X184.756 Y101.897 E.0167
G1 X178.198 Y108.456 E.28766
G1 X178.737 Y108.456 E.0167
G1 X184.756 Y102.436 E.26405
G1 X184.756 Y102.974 E.0167
G1 X179.275 Y108.455 E.24043
G1 X179.813 Y108.455 E.0167
G1 X184.756 Y103.512 E.21682
G1 X184.756 Y104.051 E.0167
G1 X180.352 Y108.455 E.19321
G1 X180.89 Y108.455 E.0167
G1 X184.756 Y104.589 E.16959
G1 X184.756 Y105.127 E.01669
G1 X181.428 Y108.455 E.14598
G1 X181.967 Y108.455 E.0167
G1 X184.756 Y105.665 E.12237
G1 X184.756 Y106.204 E.0167
G1 X182.505 Y108.455 E.09875
G1 X183.043 Y108.455 E.0167
G1 X184.756 Y106.742 E.07514
G1 X184.756 Y107.28 E.0167
G1 X183.582 Y108.455 E.05153
G1 X184.12 Y108.455 E.0167
G1 X184.756 Y107.819 E.02791
G1 X184.756 Y108.285 E.01446
G3 X184.727 Y108.385 I-.185 J0 E.00329
G3 X184.489 Y108.625 I-2.821 J-2.57 E.01048
; WIPE_START
G1 X184.727 Y108.385 E-.12838
G1 X184.756 Y108.285 E-.03975
G1 X184.756 Y107.819 E-.17717
G1 X184.12 Y108.455 E-.34201
G1 X183.929 Y108.455 E-.07269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X176.311 Y108.928 Z.8 F42000
G1 X152.872 Y110.385 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110034
G1 F15000
M204 S6000
G1 X152.857 Y110.302 E.00046
; LINE_WIDTH: 0.136252
G1 X152.841 Y110.219 E.00064
; LINE_WIDTH: 0.173604
G1 X152.817 Y110.075 E.00155
; LINE_WIDTH: 0.222099
G1 X152.793 Y109.931 E.00213
; LINE_WIDTH: 0.270593
G1 X152.768 Y109.787 E.00271
; LINE_WIDTH: 0.316068
G1 F13179.7
G1 X152.747 Y109.644 E.00322
; LINE_WIDTH: 0.358529
G1 F11406.541
G1 X152.726 Y109.501 E.00372
; LINE_WIDTH: 0.40099
G1 F10053.915
G1 X152.705 Y109.358 E.00422
; LINE_WIDTH: 0.440491
G1 F9054.987
G1 X152.686 Y109.216 E.00465
; LINE_WIDTH: 0.477023
G1 F8292.97
G1 X152.668 Y109.073 E.00508
; LINE_WIDTH: 0.513555
G1 F7649.254
G1 X152.65 Y108.931 E.00551
; LINE_WIDTH: 0.556667
G1 F7007.34
G1 X152.596 Y108.434 E.02093
; OBJECT_ID: 6
; WIPE_START
G1 X152.65 Y108.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X160.282 Y108.915 Z.8 F42000
G1 X219.302 Y108.79 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.202 Y108.79 E.00335
G1 X219.118 Y109.037 E.00866
G1 X218.665 Y108.655 E.01966
G3 X218.51 Y108.309 I.35 J-.364 E.01289
G1 X218.509 Y100.933 E.24468
G2 X197.491 Y104.489 I-10.204 J3.579 E1.00521
G1 X197.491 Y107.948 E.11473
G1 X197.264 Y107.964 E.00755
G3 X197.109 Y106.088 I14.817 J-2.165 E.06246
G3 X197.144 Y103.612 I31.414 J-.79 E.08216
G3 X208.906 Y93.324 I11.161 J.892 E.57372
G3 X217.979 Y98.883 I-.616 J11.19 E.36777
G1 X218.492 Y99.808 E.03509
G1 X230.019 Y99.809 E.38237
G3 X230.49 Y100.29 I-.024 J.494 E.02454
G1 X230.49 Y108.318 E.26631
G3 X230.009 Y108.788 I-.49 J-.02 E.02459
G1 X219.362 Y108.79 E.35317
M204 S10000
G1 X219.543 Y109.197 F42000
G1 F8843.478
M204 S6000
G1 X219.494 Y109.197 E.00164
G3 X218.898 Y110.81 I-15.243 J-4.712 E.05708
M73 P36 R16
G1 X218.702 Y110.77 E.00662
G1 X218.702 Y109.219 E.05147
G3 X218.25 Y108.791 I1 J-1.509 E.02073
G3 X218.103 Y108.328 I.795 J-.508 E.01631
G1 X218.102 Y101.009 E.24278
G2 X197.898 Y104.493 I-9.799 J3.501 E.96537
G1 X197.898 Y110.768 E.20817
G1 X197.704 Y110.809 E.00656
G3 X196.702 Y106.093 I10.647 J-4.727 E.16113
G3 X196.739 Y103.58 I31.803 J-.794 E.08336
G3 X208.928 Y92.918 I11.567 J.924 E.59459
G3 X218.331 Y98.678 I-.638 J11.597 E.38115
G1 X218.732 Y99.401 E.0274
G1 X230.035 Y99.402 E.37495
G3 X230.897 Y100.27 I-.041 J.902 E.04456
G1 X230.897 Y108.334 E.26751
G3 X230.029 Y109.195 I-.904 J-.043 E.04454
G1 X219.603 Y109.197 E.34585
M204 S250
G1 X219.775 Y109.589 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X219.761 Y109.63 E.00133
G1 F9300
G1 X219.584 Y110.151 E.01691
G1 F8400
G3 X219.257 Y110.967 I-11.279 J-4.05 E.02701
G1 F9300
G1 X219.061 Y111.385 E.01419
G1 F8400
G1 X218.846 Y111.787 E.01403
G1 X218.657 Y112.14 E.01229
G1 F7070.436
G1 X218.429 Y112.515 E.01349
G1 F2880
G1 X218.31 Y112.695 E.00662
G1 F6622.451
G1 X218.31 Y112.295 E.01229
G1 F9300
G1 X218.31 Y111.895 E.01229
G1 X218.31 Y109.439 E.07547
G1 F9547.055
G1 X218.31 Y109.401 E.00116
G3 X217.711 Y108.347 I.808 J-1.156 E.03851
G1 X217.71 Y101.083 E.2232
G1 X217.669 Y100.978 E.00347
G1 F9300
G1 X217.546 Y100.682 E.00984
G1 X217.393 Y100.313 E.01229
G1 F8400
G2 X217.031 Y99.602 I-9.514 J4.401 E.02451
G1 F9300
G1 X216.821 Y99.261 E.01229
G1 X216.606 Y98.927 E.01222
G1 X216.375 Y98.604 E.01221
G1 X216.143 Y98.278 E.01229
G1 F8400
G1 X215.888 Y97.97 E.01226
G1 F9300
G1 X215.616 Y97.678 E.01229
G1 X215.339 Y97.392 E.01221
G2 X214.443 Y96.601 I-7.884 J8.031 E.03675
G1 X214.126 Y96.359 E.01226
G1 F8400
G1 X213.797 Y96.133 E.01225
G1 F9300
G1 X213.457 Y95.925 E.01226
G2 X212.031 Y95.215 I-5.715 J9.695 E.049
G1 X211.66 Y95.069 E.01225
G1 F8400
G1 X211.281 Y94.943 E.01226
G1 F9300
G1 X210.897 Y94.834 E.01225
G2 X208.135 Y94.495 I-2.64 J10.08 E.08576
G1 X207.738 Y94.512 E.01222
G1 X207.339 Y94.535 E.01229
G1 F8400
G1 X206.943 Y94.581 E.01225
G1 F9300
G1 X206.549 Y94.651 E.01229
G1 X206.159 Y94.728 E.01221
G1 X205.774 Y94.825 E.01222
G1 X205.386 Y94.922 E.01229
G1 F8400
G1 X205.006 Y95.046 E.01226
G1 F9300
G1 X204.634 Y95.193 E.01229
G1 X204.264 Y95.338 E.01222
G1 F8400
G1 X203.902 Y95.506 E.01226
G1 F9300
G1 X203.55 Y95.696 E.01229
G1 X203.2 Y95.885 E.01221
G1 F8400
G2 X202.515 Y96.33 I4.99 J8.436 E.02513
G1 F9300
G1 X202.209 Y96.555 E.01165
G1 F8400
G1 X201.898 Y96.804 E.01225
G1 F9300
G1 X201.601 Y97.072 E.01229
G1 X201.311 Y97.344 E.01222
G1 X201.035 Y97.63 E.01221
G1 X200.757 Y97.918 E.01229
G1 F8400
G1 X200.501 Y98.224 E.01226
G1 F9300
G1 X200.263 Y98.545 E.01229
G1 X200.033 Y98.869 E.01221
G1 X199.819 Y99.204 E.01221
G1 X199.604 Y99.541 E.01229
G1 F8400
G1 X199.413 Y99.892 E.01227
G1 F9300
G1 X199.243 Y100.254 E.01229
G1 X199.076 Y100.615 E.01222
G2 X198.929 Y100.986 I9.613 J4.039 E.01226
G1 X198.802 Y101.363 E.01222
G1 X198.677 Y101.742 E.01229
G1 F8400
G2 X198.488 Y102.517 I10.113 J2.876 E.02451
G1 F9300
G1 X198.425 Y102.912 E.01229
G1 X198.37 Y103.306 E.01221
G2 X198.29 Y105.097 I12.328 J1.446 E.05514
G1 X198.29 Y112.295 E.22117
G1 X198.29 Y112.695 E.01229
G1 F5700
G1 X198.13 Y112.45 E.00897
G1 F9300
G1 X197.932 Y112.103 E.01229
G1 X197.659 Y111.618 E.01708
G3 X196.31 Y105.497 I10.856 J-5.602 E.1948
G1 X196.31 Y105.101 E.01216
G3 X200.586 Y95.319 I12.134 J-.521 E.33963
G3 X208.949 Y92.526 I7.724 J9.211 E.27739
G3 X218.94 Y98.968 I-.69 J12.04 E.38195
G1 F9547.055
G1 X218.963 Y99.009 E.00144
G1 X230.05 Y99.01 E.34069
G3 X231.289 Y100.25 I-.057 J1.295 E.05914
G1 X231.289 Y108.349 E.24886
G3 X230.048 Y109.588 I-1.3 J-.062 E.05909
G1 X219.835 Y109.589 E.31383
M204 S10000
G1 X219.048 Y109.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308112
G1 F13575.085
M204 S6000
G1 X219.075 Y109.267 E.00362
M204 S10000
G1 X219.048 Y109.433 F42000
; LINE_WIDTH: 0.267143
G1 F15000
M204 S6000
G1 X219.021 Y109.598 E.00306
; LINE_WIDTH: 0.226174
G1 X218.994 Y109.764 E.0025
; LINE_WIDTH: 0.185205
G1 X218.967 Y109.929 E.00194
; LINE_WIDTH: 0.147778
G1 X218.947 Y110.035 E.00092
; LINE_WIDTH: 0.113873
G1 X218.928 Y110.14 E.00062
M204 S10000
G1 X218.757 Y110.982 F42000
; LINE_WIDTH: 0.448641
G1 F8873.099
M204 S6000
G1 X218.544 Y111.935 E.03229
; WIPE_START
G1 X218.757 Y110.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X226.224 Y109.4 Z.8 F42000
G1 X229.881 Y108.625 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42563
G1 F9406.6
M204 S6000
G1 X230.133 Y108.373 E.0111
G2 X230.156 Y108.285 I-.134 J-.083 E.00289
G1 X230.156 Y107.808 E.01487
G1 X229.51 Y108.455 E.02853
G1 X228.968 Y108.455 E.01688
G1 X230.156 Y107.267 E.0524
G1 X230.156 Y106.726 E.01688
G1 X228.427 Y108.455 E.07628
G1 X227.886 Y108.455 E.01688
G1 X230.156 Y106.185 E.10015
G1 X230.156 Y105.643 E.01688
G1 X227.344 Y108.455 E.12402
G1 X226.803 Y108.456 E.01688
G1 X230.156 Y105.102 E.1479
G1 X230.156 Y104.561 E.01688
G1 X226.262 Y108.456 E.17177
G1 X225.72 Y108.456 E.01688
G1 X230.156 Y104.02 E.19564
G1 X230.156 Y103.478 E.01688
G1 X225.179 Y108.456 E.21952
G1 X224.638 Y108.456 E.01688
G1 X230.156 Y102.937 E.24339
G1 X230.156 Y102.396 E.01688
G1 X224.097 Y108.456 E.26726
G1 X223.555 Y108.456 E.01688
G1 X230.156 Y101.855 E.29114
G1 X230.156 Y101.313 E.01688
G1 X223.014 Y108.456 E.31501
G1 X222.473 Y108.456 E.01688
G1 X230.156 Y100.772 E.33888
G1 X230.156 Y100.315 E.01426
G2 X230.143 Y100.245 I-.15 J-.007 E.00225
G1 X221.931 Y108.456 E.36215
G1 X221.39 Y108.456 E.01688
G1 X229.704 Y100.142 E.36667
G1 X229.163 Y100.142 E.01688
G1 X220.849 Y108.456 E.36668
G1 X220.308 Y108.456 E.01688
G1 X228.622 Y100.142 E.36668
G1 X228.08 Y100.142 E.01688
G1 X219.766 Y108.456 E.36669
G1 X219.225 Y108.456 E.01688
G1 X227.539 Y100.142 E.36669
G1 X226.998 Y100.142 E.01688
G1 X218.847 Y108.293 E.35951
G1 X218.843 Y107.755 E.01678
G1 X226.457 Y100.142 E.33578
G1 X225.916 Y100.142 E.01688
G1 X218.843 Y107.214 E.31192
G1 X218.843 Y106.673 E.01688
G1 X225.375 Y100.142 E.28806
G1 X224.833 Y100.142 E.01688
G1 X218.843 Y106.132 E.26419
G1 X218.843 Y105.591 E.01688
G1 X224.292 Y100.142 E.24033
G1 X223.751 Y100.142 E.01688
G1 X218.843 Y105.05 E.21646
G1 X218.843 Y104.509 E.01688
G1 X223.21 Y100.142 E.1926
G1 X222.669 Y100.141 E.01688
G1 X218.843 Y103.967 E.16874
G1 X218.843 Y103.426 E.01688
G1 X222.128 Y100.141 E.14487
G1 X221.586 Y100.141 E.01688
G1 X218.843 Y102.885 E.12101
G1 X218.843 Y102.344 E.01688
G1 X221.045 Y100.141 E.09714
G1 X220.504 Y100.141 E.01688
M73 P37 R16
G1 X218.842 Y101.803 E.07328
G1 X218.842 Y101.262 E.01688
G1 X219.963 Y100.141 E.04942
G1 X219.422 Y100.141 E.01688
G1 X218.8 Y100.762 E.0274
G1 X218.649 Y100.373 E.01304
G1 X219.05 Y99.971 E.01771
; WIPE_START
G1 X218.649 Y100.373 E-.21576
G1 X218.8 Y100.762 E-.15884
G1 X219.422 Y100.141 E-.33386
G1 X219.557 Y100.141 E-.05155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X212.38 Y102.738 Z.8 F42000
G1 X197.395 Y108.159 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.567081
G1 F6868.119
M204 S6000
G1 X197.426 Y108.439 E.01206
; LINE_WIDTH: 0.534843
G1 F7318.219
G1 X197.456 Y108.72 E.01132
; LINE_WIDTH: 0.498451
G1 F7902.864
G1 X197.477 Y108.877 E.00586
; LINE_WIDTH: 0.457914
G1 F8674.841
G1 X197.497 Y109.033 E.00534
; LINE_WIDTH: 0.417376
G1 F9613.964
G1 X197.517 Y109.19 E.00482
; LINE_WIDTH: 0.374634
G1 F10852.742
G1 X197.54 Y109.339 E.00408
; LINE_WIDTH: 0.329661
G1 F12554.92
G1 X197.562 Y109.489 E.00353
; LINE_WIDTH: 0.284687
G1 F14890.373
G1 X197.585 Y109.638 E.00297
; LINE_WIDTH: 0.242902
G1 F15000
G1 X197.604 Y109.751 E.00187
; LINE_WIDTH: 0.204264
G1 X197.623 Y109.864 E.00151
; LINE_WIDTH: 0.165627
G1 X197.643 Y109.976 E.00115
; LINE_WIDTH: 0.12699
G1 X197.662 Y110.089 E.00078
; LINE_WIDTH: 0.102299
G1 X197.672 Y110.144 E.00027
; OBJECT_ID: 9
; WIPE_START
G1 X197.662 Y110.089 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X192.541 Y115.749 Z.8 F42000
G1 X137.403 Y176.69 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.302 Y176.69 E.00335
G1 X137.218 Y176.937 E.00866
G1 X136.765 Y176.555 E.01966
G3 X136.61 Y176.208 I.349 J-.363 E.01292
G1 X136.609 Y168.832 E.24465
G2 X115.591 Y172.389 I-10.204 J3.579 E1.00521
G1 X115.591 Y175.848 E.11473
G1 X115.364 Y175.864 E.00755
G3 X115.209 Y173.989 I14.827 J-2.166 E.06245
G3 X115.244 Y171.513 I31.416 J-.79 E.08216
G3 X127.006 Y161.224 I11.161 J.892 E.57373
G3 X136.079 Y166.782 I-.616 J11.19 E.36776
G1 X136.592 Y167.708 E.0351
G1 X148.119 Y167.709 E.38238
G3 X148.59 Y168.189 I-.024 J.494 E.02453
G1 X148.587 Y176.256 E.26759
G3 X148.109 Y176.688 I-.494 J-.066 E.02323
G1 X137.462 Y176.69 E.35317
M204 S10000
G1 X137.643 Y177.097 F42000
G1 F8843.478
M204 S6000
G1 X137.594 Y177.097 E.00164
G3 X136.998 Y178.71 I-15.242 J-4.712 E.05708
G1 X136.802 Y178.67 E.00662
G1 X136.802 Y177.119 E.05148
G3 X136.35 Y176.691 I.998 J-1.507 E.02073
G3 X136.203 Y176.228 I.756 J-.495 E.01634
G1 X136.202 Y168.909 E.24277
G2 X115.998 Y172.393 I-9.799 J3.501 E.96537
G1 X115.998 Y178.668 E.20816
G1 X115.804 Y178.709 E.00656
G3 X114.802 Y173.992 I10.647 J-4.728 E.16113
G3 X114.839 Y171.481 I31.797 J-.794 E.08335
G3 X127.028 Y160.818 I11.567 J.924 E.5946
G3 X136.431 Y166.578 I-.638 J11.597 E.38114
G1 X136.832 Y167.301 E.02741
G1 X148.135 Y167.302 E.37495
G3 X148.997 Y168.169 I-.041 J.902 E.04455
G1 X148.997 Y176.234 E.26752
G3 X148.129 Y177.095 I-.898 J-.037 E.0446
G1 X137.703 Y177.097 E.34585
M204 S250
G1 X137.875 Y177.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X137.861 Y177.53 E.00133
G1 F9300
G1 X137.684 Y178.051 E.01692
G1 F8400
G3 X137.357 Y178.867 I-11.257 J-4.042 E.027
G1 F9300
G1 X137.161 Y179.285 E.01419
G1 F8400
G1 X136.946 Y179.687 E.01403
G1 X136.757 Y180.04 E.01229
G1 F7071.894
G1 X136.529 Y180.415 E.0135
G1 F2880
G1 X136.41 Y180.595 E.00662
G1 F6622.451
G1 X136.41 Y180.195 E.01229
G1 F9300
G1 X136.41 Y179.795 E.01229
G1 X136.41 Y177.339 E.07547
G1 F9547.055
G1 X136.41 Y177.301 E.00116
G3 X135.811 Y176.247 I.808 J-1.156 E.03852
G1 X135.81 Y168.983 E.22319
G1 X135.769 Y168.878 E.00347
G1 F9300
G1 X135.646 Y168.582 E.00984
G1 X135.493 Y168.213 E.01229
G1 F8400
G2 X135.131 Y167.502 I-9.525 J4.406 E.02451
G1 F9300
G1 X134.921 Y167.161 E.01229
G1 X134.706 Y166.827 E.01222
G1 X134.475 Y166.504 E.01221
G1 X134.243 Y166.178 E.01229
G1 F8400
G1 X133.988 Y165.87 E.01226
G1 F9300
G1 X133.716 Y165.578 E.01229
G1 X133.44 Y165.292 E.01221
G2 X132.543 Y164.501 I-7.885 J8.031 E.03675
G1 X132.226 Y164.259 E.01225
G1 F8400
G1 X131.897 Y164.033 E.01226
G1 F9300
G1 X131.555 Y163.827 E.01229
G1 X131.213 Y163.622 E.01223
G1 F8400
G1 X130.842 Y163.429 E.01285
G1 F9300
G1 X130.477 Y163.265 E.01229
G1 X130.132 Y163.112 E.01161
G1 X129.76 Y162.969 E.01226
G1 F8400
G1 X129.381 Y162.843 E.01226
G1 F9300
G1 X128.995 Y162.739 E.01229
G1 X128.61 Y162.641 E.01221
G2 X126.235 Y162.395 I-2.253 J10.174 E.07351
G1 X125.838 Y162.412 E.01222
G1 X125.439 Y162.435 E.01229
G1 F8400
G1 X125.043 Y162.481 E.01225
G1 F9300
G1 X124.649 Y162.551 E.01229
G1 X124.259 Y162.628 E.01221
G1 X123.873 Y162.725 E.01222
G1 X123.486 Y162.822 E.01229
G1 F8400
G1 X123.106 Y162.946 E.01226
G1 F9300
G1 X122.734 Y163.093 E.01229
G1 X122.364 Y163.238 E.01222
G1 F8400
G1 X122.002 Y163.406 E.01226
G1 F9300
G1 X121.65 Y163.596 E.01229
G1 X121.3 Y163.785 E.01221
G1 F8400
G1 X120.961 Y163.995 E.01226
G1 F9300
G1 X120.634 Y164.226 E.01229
G1 X120.309 Y164.455 E.01222
G1 F8400
G1 X119.998 Y164.704 E.01225
G1 F9300
G1 X119.701 Y164.972 E.01229
G1 X119.411 Y165.244 E.01221
G1 X119.135 Y165.53 E.01222
G1 X118.857 Y165.818 E.01229
G1 F8400
G2 X118.357 Y166.439 I7.92 J6.884 E.02451
G1 F9300
G1 X118.128 Y166.766 E.01226
G1 X117.916 Y167.102 E.01222
G1 X117.704 Y167.441 E.01229
G1 F8400
G1 X117.513 Y167.792 E.01226
G1 F9300
G1 X117.338 Y168.15 E.01225
G1 X117.191 Y168.498 E.01161
G1 X117.034 Y168.866 E.01229
G1 F8400
G1 X116.895 Y169.261 E.01286
G1 F9300
G1 X116.777 Y169.642 E.01226
G1 F8400
G1 X116.675 Y170.028 E.01226
G1 F9300
G1 X116.596 Y170.42 E.01229
G1 X116.52 Y170.81 E.01221
G2 X116.39 Y172.997 I10.893 J1.746 E.06742
G1 X116.39 Y180.195 E.22117
G1 X116.39 Y180.595 E.01229
G1 F5700
G1 X116.23 Y180.35 E.00897
G1 F9300
G1 X116.032 Y180.003 E.01229
G1 X115.759 Y179.518 E.01708
G3 X114.41 Y173.397 I10.856 J-5.602 E.1948
G1 X114.41 Y173.001 E.01216
G3 X118.686 Y163.219 I12.134 J-.52 E.33963
G3 X127.049 Y160.426 I7.724 J9.211 E.27739
G3 X137.04 Y166.868 I-.691 J12.04 E.38195
G1 F9547.055
G1 X137.063 Y166.909 E.00144
G1 X148.151 Y166.91 E.3407
G3 X149.389 Y168.15 I-.057 J1.295 E.05913
G1 X149.389 Y176.249 E.24887
G3 X148.148 Y177.488 I-1.292 J-.053 E.05918
G1 X137.935 Y177.489 E.31384
M204 S10000
G1 X137.148 Y177.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308131
G1 F13574.122
M204 S6000
G1 X137.175 Y177.167 E.00362
M204 S10000
G1 X137.148 Y177.333 F42000
; LINE_WIDTH: 0.267151
G1 F15000
M204 S6000
G1 X137.121 Y177.498 E.00306
; LINE_WIDTH: 0.226171
G1 X137.094 Y177.664 E.0025
; LINE_WIDTH: 0.18519
G1 X137.067 Y177.829 E.00194
; LINE_WIDTH: 0.147745
G1 X137.047 Y177.935 E.00092
; LINE_WIDTH: 0.113862
G1 X137.028 Y178.04 E.00062
M204 S10000
G1 X136.857 Y178.882 F42000
; LINE_WIDTH: 0.448659
G1 F8872.699
M204 S6000
G1 X136.645 Y179.835 E.03229
; WIPE_START
G1 X136.857 Y178.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.324 Y177.3 Z.8 F42000
G1 X147.981 Y176.525 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42563
G1 F9406.6
M204 S6000
G1 X148.231 Y176.275 E.01103
G2 X148.256 Y176.186 I-.135 J-.087 E.0029
G1 X148.256 Y175.708 E.01492
G1 X147.609 Y176.355 E.02854
G1 X147.068 Y176.355 E.01688
G1 X148.256 Y175.167 E.05241
G1 X148.256 Y174.626 E.01688
G1 X146.527 Y176.355 E.07628
G1 X145.986 Y176.355 E.01688
G1 X148.256 Y174.084 E.10016
G1 X148.256 Y173.543 E.01688
G1 X145.444 Y176.355 E.12403
G1 X144.903 Y176.356 E.01688
G1 X148.256 Y173.002 E.1479
G1 X148.256 Y172.461 E.01688
G1 X144.362 Y176.356 E.17178
G1 X143.82 Y176.356 E.01688
G1 X148.256 Y171.92 E.19565
G1 X148.256 Y171.378 E.01688
G1 X143.279 Y176.356 E.21952
G1 X142.738 Y176.356 E.01688
G1 X148.256 Y170.837 E.2434
G1 X148.256 Y170.296 E.01688
G1 X142.196 Y176.356 E.26727
G1 X141.655 Y176.356 E.01688
G1 X148.256 Y169.755 E.29114
G1 X148.256 Y169.213 E.01688
G1 X141.114 Y176.356 E.31502
G1 X140.573 Y176.356 E.01688
G1 X148.256 Y168.672 E.33889
G1 X148.256 Y168.215 E.01426
G2 X148.243 Y168.145 I-.15 J-.007 E.00225
G1 X140.031 Y176.356 E.36215
G1 X139.49 Y176.356 E.01688
G1 X147.804 Y168.042 E.36667
G1 X147.263 Y168.042 E.01688
G1 X138.949 Y176.356 E.36668
G1 X138.407 Y176.356 E.01688
G1 X146.722 Y168.042 E.36668
G1 X146.18 Y168.042 E.01688
G1 X137.866 Y176.356 E.36669
G1 X137.325 Y176.356 E.01688
G1 X145.639 Y168.042 E.3667
G1 X145.098 Y168.042 E.01688
G1 X136.946 Y176.194 E.35953
G1 X136.943 Y175.655 E.01679
G1 X144.557 Y168.042 E.33578
G1 X144.016 Y168.042 E.01688
G1 X136.943 Y175.114 E.31191
G1 X136.943 Y174.573 E.01688
G1 X143.474 Y168.042 E.28805
G1 X142.933 Y168.042 E.01688
G1 X136.943 Y174.032 E.26419
G1 X136.943 Y173.491 E.01688
G1 X142.392 Y168.042 E.24032
G1 X141.851 Y168.042 E.01688
G1 X136.943 Y172.95 E.21646
G1 X136.943 Y172.408 E.01688
G1 X141.31 Y168.042 E.19259
G1 X140.769 Y168.041 E.01688
G1 X136.943 Y171.867 E.16873
G1 X136.943 Y171.326 E.01688
G1 X140.227 Y168.041 E.14487
G1 X139.686 Y168.041 E.01688
G1 X136.943 Y170.785 E.121
G1 X136.943 Y170.244 E.01688
G1 X139.145 Y168.041 E.09714
G1 X138.604 Y168.041 E.01688
G1 X136.943 Y169.703 E.07327
G1 X136.942 Y169.161 E.01688
G1 X138.063 Y168.041 E.04941
G1 X137.522 Y168.041 E.01688
G1 X136.9 Y168.662 E.02739
G1 X136.749 Y168.273 E.01304
G1 X137.15 Y167.871 E.0177
; WIPE_START
G1 X136.749 Y168.273 E-.21571
G1 X136.9 Y168.662 E-.15883
G1 X137.522 Y168.041 E-.33378
G1 X137.658 Y168.041 E-.05168
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.48 Y170.638 Z.8 F42000
G1 X115.495 Y176.059 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.567066
G1 F6868.317
M204 S6000
G1 X115.526 Y176.339 E.01206
; LINE_WIDTH: 0.534838
G1 F7318.297
G1 X115.557 Y176.62 E.01132
; LINE_WIDTH: 0.498465
G1 F7902.625
G1 X115.577 Y176.777 E.00586
; LINE_WIDTH: 0.457955
G1 F8673.979
G1 X115.597 Y176.933 E.00534
; LINE_WIDTH: 0.417444
G1 F9612.2
G1 X115.617 Y177.09 E.00482
; LINE_WIDTH: 0.374694
G1 F10850.77
G1 X115.64 Y177.239 E.00408
; LINE_WIDTH: 0.329681
G1 F12554.006
G1 X115.662 Y177.388 E.00353
; LINE_WIDTH: 0.284669
G1 F14891.515
G1 X115.685 Y177.538 E.00298
; LINE_WIDTH: 0.242839
G1 F15000
G1 X115.704 Y177.651 E.00187
; LINE_WIDTH: 0.204196
G1 X115.723 Y177.764 E.00151
; LINE_WIDTH: 0.165553
G1 X115.743 Y177.877 E.00114
; LINE_WIDTH: 0.126911
G1 X115.762 Y177.99 E.00078
; LINE_WIDTH: 0.102259
G1 X115.772 Y178.044 E.00027
; OBJECT_ID: 8
; WIPE_START
G1 X115.762 Y177.99 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X108.141 Y177.571 Z.8 F42000
G1 X92.064 Y176.689 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.967 Y176.689 E.00322
G1 X91.873 Y176.983 E.01023
G1 X91.365 Y176.555 E.02206
G3 X91.21 Y176.207 I.332 J-.356 E.01295
G1 X91.209 Y168.583 E.25291
G2 X70.791 Y172.089 I-9.904 J3.527 E.97562
G1 X70.791 Y176.121 E.13376
G1 X70.568 Y176.141 E.00742
G3 X70.409 Y174.288 I11.051 J-1.882 E.06174
G3 X70.418 Y171.664 I65.934 J-1.09 E.08706
G3 X81.557 Y161.211 I10.887 J.44 E.56151
G3 X90.8 Y166.774 I-.291 J10.944 E.3742
G1 X91.299 Y167.708 E.03512
G1 X102.719 Y167.709 E.37881
G3 X103.19 Y168.189 I-.024 J.494 E.02453
G1 X103.19 Y176.218 E.26632
G3 X102.719 Y176.688 I-.495 J-.024 E.02421
G1 X92.124 Y176.689 E.35146
M204 S10000
G1 X92.312 Y177.096 F42000
G1 F8843.478
M204 S6000
G1 X92.264 Y177.096 E.00158
G3 X91.594 Y178.948 I-16.542 J-4.942 E.06534
G1 X91.402 Y178.906 E.00652
G1 X91.402 Y177.118 E.05929
G3 X90.95 Y176.691 I.999 J-1.508 E.02073
G3 X90.803 Y176.227 I.794 J-.507 E.01633
G1 X90.802 Y168.661 E.25099
G2 X71.198 Y172.093 I-9.499 J3.448 E.93582
G1 X71.198 Y178.904 E.22593
G1 X71.004 Y178.944 E.00658
G3 X70.002 Y174.293 I10.366 J-4.666 E.15902
G3 X70.011 Y171.648 I66.387 J-1.094 E.08772
G3 X81.567 Y160.804 I11.294 J.456 E.58251
G3 X91.155 Y166.575 I-.302 J11.354 E.38819
G1 X91.543 Y167.3 E.0273
G1 X102.735 Y167.302 E.37125
G3 X103.597 Y168.169 I-.048 J.909 E.04447
G1 X103.597 Y176.234 E.26751
G3 X102.735 Y177.095 I-.91 J-.048 E.04428
G1 X92.372 Y177.096 E.34377
M204 S250
G1 X92.551 Y177.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X92.538 Y177.529 E.00132
G1 F9300
G3 X91.624 Y179.776 I-11.612 J-3.411 E.07466
G1 X91.362 Y180.232 E.01616
G1 X91.16 Y180.578 E.01229
G1 F4800
G1 X91.01 Y180.804 E.00834
G1 F9300
G1 X91.01 Y180.404 E.01229
G1 X91.01 Y177.338 E.09419
G1 F9547.055
G1 X91.01 Y177.301 E.00116
G3 X90.411 Y176.246 I.784 J-1.142 E.03857
G1 X90.41 Y168.736 E.23078
G1 X90.369 Y168.632 E.00342
G1 F9300
G2 X89.335 Y166.649 I-9.196 J3.531 E.06888
G1 X89.113 Y166.333 E.01187
G1 F8400
G2 X88.63 Y165.73 I-8.17 J6.052 E.02372
G1 F9300
G1 X88.356 Y165.439 E.01229
G1 X88.101 Y165.168 E.01144
G1 F8400
G1 X87.82 Y164.903 E.01187
G1 F9300
G1 X87.528 Y164.65 E.01186
G2 X83.786 Y162.712 I-6.255 J7.5 E.13052
G1 X83.41 Y162.62 E.01188
G1 F8400
G2 X82.651 Y162.483 I-2.194 J9.939 E.02373
G1 F9300
G1 X82.253 Y162.443 E.01229
G1 X81.882 Y162.412 E.01143
G2 X80.34 Y162.442 I-.569 J10.336 E.04745
G1 X79.971 Y162.488 E.01142
G1 X79.575 Y162.543 E.01229
G1 F8400
G1 X79.196 Y162.619 E.01187
G1 F9300
G1 X78.809 Y162.721 E.01229
G1 X78.449 Y162.816 E.01144
G1 F8400
G1 X78.082 Y162.937 E.01186
G1 F9300
G1 X77.711 Y163.084 E.01229
G1 X77.382 Y163.214 E.01085
G1 F8400
G1 X77.015 Y163.385 E.01245
G1 F9300
G1 X76.663 Y163.576 E.01229
G1 X76.34 Y163.76 E.01144
G1 X76.026 Y163.96 E.01143
G1 X75.688 Y164.174 E.01229
G1 F8400
G1 X75.378 Y164.404 E.01187
G1 F9300
G1 X75.07 Y164.66 E.01229
G1 X74.799 Y164.886 E.01085
G1 F8400
G1 X74.504 Y165.163 E.01245
G1 F9300
G1 X74.233 Y165.439 E.01188
G1 F8400
G1 X73.974 Y165.725 E.01186
G1 F9300
G1 X73.724 Y166.037 E.01229
G1 X73.491 Y166.328 E.01144
G1 F8400
G1 X73.267 Y166.643 E.01188
G1 F9300
G1 X73.056 Y166.982 E.01229
G1 X72.859 Y167.298 E.01143
G1 F8400
G1 X72.675 Y167.638 E.01187
G1 F9300
G1 X72.513 Y167.967 E.01128
G1 F8400
G1 X72.348 Y168.337 E.01245
G1 F9300
G1 X72.208 Y168.712 E.01229
G1 X72.079 Y169.061 E.01143
G1 X71.964 Y169.43 E.01187
G1 F8400
G1 X71.865 Y169.803 E.01186
G1 F9300
G1 X71.785 Y170.161 E.01128
G1 F8400
G1 X71.713 Y170.56 E.01245
G1 F9300
G1 X71.662 Y170.943 E.01187
G2 X71.59 Y172.696 I11.682 J1.356 E.05397
G1 X71.59 Y179.607 E.21236
G1 X71.59 Y180.007 E.01229
G1 F9295.549
G1 X71.59 Y180.407 E.01229
G1 F4719.775
G1 X71.59 Y180.807 E.01229
M106 S255
G1 F1680
G1 X71.58 Y180.792 E.00056
M106 S165.75
G1 F4719.775
G1 X71.371 Y180.451 E.01229
G1 F9300
G1 X71.105 Y180.007 E.01591
G3 X69.61 Y173.696 I10.513 J-5.822 E.20177
G1 X69.61 Y172.701 E.0306
G3 X72.805 Y164.067 I11.884 J-.509 E.29045
G3 X81.576 Y160.412 I8.507 J8.061 E.30061
G3 X91.756 Y166.867 I-.286 J11.707 E.3891
G1 F9547.055
G1 X91.778 Y166.908 E.00143
G1 X102.75 Y166.91 E.33714
G3 X103.989 Y168.15 I-.068 J1.306 E.05902
G1 X103.989 Y176.249 E.24886
G3 X102.75 Y177.487 I-1.306 J-.068 E.05895
G1 X92.611 Y177.488 E.31157
M204 S10000
G1 X91.773 Y177.414 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.360911
G1 F11321.103
M204 S6000
G1 X91.808 Y177.194 E.00578
M204 S10000
G1 X91.773 Y177.414 F42000
; LINE_WIDTH: 0.31269
G1 F13344.694
M204 S6000
G1 X91.739 Y177.635 E.0049
; LINE_WIDTH: 0.26447
G1 F15000
G1 X91.704 Y177.855 E.00403
; LINE_WIDTH: 0.216468
G1 X91.679 Y178 E.00207
; LINE_WIDTH: 0.168649
G1 X91.653 Y178.144 E.0015
; LINE_WIDTH: 0.12083
G1 X91.628 Y178.288 E.00093
; WIPE_START
G1 X91.653 Y178.144 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.81 Y170.513 Z.8 F42000
G1 X91.864 Y167.871 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42354
G1 F9458.252
M204 S6000
G1 X91.45 Y168.286 E.01818
G1 X91.542 Y168.52 E.00781
G1 X91.542 Y168.731 E.00656
G1 X92.233 Y168.041 E.03028
G1 X92.771 Y168.041 E.01669
G1 X91.542 Y169.269 E.05388
G1 X91.543 Y169.807 E.01669
G1 X93.309 Y168.041 E.07748
G1 X93.847 Y168.041 E.01669
G1 X91.543 Y170.346 E.10109
G1 X91.543 Y170.884 E.01669
G1 X94.385 Y168.041 E.12469
G1 X94.924 Y168.041 E.01669
G1 X91.543 Y171.422 E.1483
G1 X91.543 Y171.96 E.01669
G1 X95.462 Y168.041 E.1719
G1 X96 Y168.041 E.01669
G1 X91.543 Y172.498 E.19551
G1 X91.543 Y173.037 E.01669
G1 X96.538 Y168.041 E.21911
G1 X97.077 Y168.041 E.01669
G1 X91.543 Y173.575 E.24271
G1 X91.543 Y174.113 E.01669
G1 X97.615 Y168.041 E.26632
G1 X98.153 Y168.041 E.01669
G1 X91.543 Y174.651 E.28992
G1 X91.543 Y175.189 E.01669
G1 X98.691 Y168.042 E.31353
G1 X99.229 Y168.042 E.01669
G1 X91.543 Y175.728 E.33713
G1 X91.543 Y176.172 E.01378
G1 X91.56 Y176.249 E.00245
G1 X99.768 Y168.042 E.36
G1 X100.306 Y168.042 E.01669
G1 X91.992 Y176.356 E.36469
G1 X92.53 Y176.356 E.0167
G1 X100.844 Y168.042 E.36469
G1 X101.382 Y168.042 E.01669
G1 X93.068 Y176.356 E.36468
G1 X93.607 Y176.356 E.0167
G1 X101.921 Y168.042 E.36468
G1 X102.459 Y168.042 E.01669
G1 X94.145 Y176.356 E.36467
G1 X94.683 Y176.356 E.0167
G1 X102.852 Y168.187 E.35831
G1 X102.856 Y168.721 E.01656
G1 X95.222 Y176.356 E.33489
G1 X95.76 Y176.356 E.0167
G1 X102.856 Y169.259 E.31127
G1 X102.856 Y169.797 E.0167
G1 X96.298 Y176.356 E.28766
G1 X96.837 Y176.356 E.0167
G1 X102.856 Y170.336 E.26405
G1 X102.856 Y170.874 E.0167
G1 X97.375 Y176.355 E.24044
G1 X97.913 Y176.355 E.0167
G1 X102.856 Y171.412 E.21682
G1 X102.856 Y171.951 E.0167
G1 X98.452 Y176.355 E.19321
G1 X98.99 Y176.355 E.0167
G1 X102.856 Y172.489 E.1696
G1 X102.856 Y173.027 E.0167
G1 X99.528 Y176.355 E.14598
G1 X100.067 Y176.355 E.0167
G1 X102.856 Y173.565 E.12237
G1 X102.856 Y174.104 E.01669
G1 X100.605 Y176.355 E.09876
G1 X101.143 Y176.355 E.0167
G1 X102.856 Y174.642 E.07514
G1 X102.856 Y175.18 E.0167
G1 X101.682 Y176.355 E.05153
G1 X102.22 Y176.355 E.0167
G1 X102.856 Y175.718 E.02792
G1 X102.856 Y176.19 E.01463
G3 X102.824 Y176.288 I-.178 J-.004 E.00325
G3 X102.589 Y176.525 I-2.832 J-2.586 E.01035
; WIPE_START
G1 X102.824 Y176.288 E-.12679
G1 X102.856 Y176.19 E-.0392
G1 X102.856 Y175.718 E-.17928
G1 X102.22 Y176.355 E-.34203
G1 X102.029 Y176.355 E-.0727
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.411 Y176.828 Z.8 F42000
G1 X70.972 Y178.285 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110057
G1 F15000
M204 S6000
G1 X70.957 Y178.202 E.00046
; LINE_WIDTH: 0.136326
G1 X70.941 Y178.119 E.00064
; LINE_WIDTH: 0.173675
G1 X70.917 Y177.975 E.00155
; LINE_WIDTH: 0.222133
G1 X70.893 Y177.831 E.00213
; LINE_WIDTH: 0.270591
G1 X70.868 Y177.687 E.00271
; LINE_WIDTH: 0.316091
G1 F13178.579
G1 X70.847 Y177.544 E.00323
; LINE_WIDTH: 0.358599
G1 F11404.013
G1 X70.826 Y177.401 E.00373
; LINE_WIDTH: 0.401106
G1 F10050.641
G1 X70.805 Y177.257 E.00423
; LINE_WIDTH: 0.440553
G1 F9053.572
G1 X70.786 Y177.116 E.00463
; LINE_WIDTH: 0.476956
G1 F8294.244
G1 X70.768 Y176.974 E.00506
; LINE_WIDTH: 0.513359
G1 F7652.433
G1 X70.75 Y176.832 E.00548
; LINE_WIDTH: 0.556316
G1 F7012.134
G1 X70.697 Y176.334 E.02096
; OBJECT_ID: 7
; WIPE_START
G1 X70.75 Y176.832 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X63.118 Y176.786 Z.8 F42000
G1 X47.3 Y176.691 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X47.206 Y176.691 E.00311
G1 X47.108 Y177.014 E.0112
G1 X46.565 Y176.556 E.02357
G3 X46.41 Y176.209 I.335 J-.357 E.01294
G1 X46.409 Y168.419 E.25841
G2 X26.391 Y171.89 I-9.704 J3.493 E.95591
G1 X26.391 Y176.302 E.14636
G1 X26.168 Y176.322 E.00743
G3 X26.009 Y174.49 I10.928 J-1.869 E.06107
G3 X26.018 Y171.478 I76.375 J-1.29 E.0999
G3 X37.188 Y161.22 I10.701 J.442 E.55899
G3 X46.082 Y166.775 I-.523 J10.735 E.36336
G1 X46.569 Y167.709 E.03493
G1 X57.919 Y167.71 E.37651
G3 X58.39 Y168.19 I-.026 J.497 E.0245
G1 X58.39 Y176.219 E.26632
G3 X57.909 Y176.689 I-.497 J-.027 E.0245
G1 X47.36 Y176.691 E.34993
M204 S10000
G1 X47.554 Y177.098 F42000
G1 F8843.478
M204 S6000
G1 X47.508 Y177.098 E.00153
G3 X46.797 Y179.106 I-15.332 J-4.298 E.07072
G1 X46.602 Y179.066 E.0066
G1 X46.602 Y177.12 E.06455
G3 X46.15 Y176.692 I.998 J-1.507 E.02074
G3 X46.003 Y176.229 I.795 J-.507 E.01631
G1 X46.002 Y168.497 E.25646
G2 X26.798 Y171.894 I-9.299 J3.413 E.91613
G1 X26.798 Y179.068 E.23799
G1 X26.603 Y179.108 E.00661
G3 X25.602 Y174.493 I10.241 J-4.636 E.15781
G3 X25.611 Y171.462 I76.882 J-1.294 E.10055
G3 X37.207 Y160.814 I11.109 J.459 E.58029
G3 X46.44 Y166.58 I-.543 J11.144 E.37719
G1 X46.816 Y167.302 E.02701
G1 X57.935 Y167.303 E.36884
G3 X58.797 Y168.17 I-.047 J.909 E.04448
G1 X58.797 Y176.235 E.26751
G3 X57.929 Y177.097 I-.909 J-.048 E.04448
G1 X47.614 Y177.098 E.34218
M204 S250
G1 X47.798 Y177.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X47.786 Y177.531 E.00132
G1 F9300
G1 X47.626 Y178.055 E.01682
G1 F8400
G1 X47.485 Y178.461 E.01323
G1 F9300
G1 X47.333 Y178.831 E.01229
G1 X47.152 Y179.256 E.01418
G3 X46.766 Y180.025 I-11.737 J-5.4 E.02645
G1 X46.535 Y180.425 E.01418
G1 F6622.451
M73 P38 R16
G1 X46.33 Y180.768 E.01229
G1 F2880
G1 X46.21 Y180.944 E.00656
G1 F6622.451
G1 X46.21 Y180.544 E.01229
G1 F9300
G1 X46.21 Y180.144 E.01229
G1 X46.21 Y177.34 E.08618
G1 F9547.055
G1 X46.21 Y177.302 E.00116
G3 X45.611 Y176.248 I.784 J-1.143 E.03857
G1 X45.61 Y168.573 E.23582
G1 X45.569 Y168.471 E.00338
G1 F9300
G2 X43.604 Y165.36 I-8.917 J3.458 E.11378
G1 X43.339 Y165.09 E.01161
G1 F8400
G1 X43.063 Y164.832 E.0116
G1 F9300
G1 X42.755 Y164.577 E.01229
G1 X42.482 Y164.349 E.01092
G1 F8400
G1 X42.162 Y164.115 E.01218
G1 F9300
G1 X41.826 Y163.898 E.01229
G1 X41.541 Y163.72 E.01033
G2 X39.473 Y162.808 I-5 J8.538 E.06959
G1 X39.131 Y162.713 E.01093
G1 X38.744 Y162.612 E.01229
G1 F8400
G2 X38 Y162.479 I-2.127 J9.753 E.02321
G1 F9300
G1 X37.602 Y162.44 E.01229
G1 X37.248 Y162.411 E.01091
G2 X35.74 Y162.444 I-.535 J10.124 E.0464
G1 X35.388 Y162.488 E.01091
G1 X34.992 Y162.544 E.01229
G1 F8400
G1 X34.622 Y162.62 E.01161
G1 F9300
G1 X34.235 Y162.722 E.01229
G1 X33.894 Y162.821 E.01091
G1 X33.558 Y162.936 E.01091
G1 X33.18 Y163.065 E.01229
G1 F8400
G1 X32.832 Y163.212 E.0116
G1 F9300
G1 X32.473 Y163.389 E.01229
G1 X32.158 Y163.553 E.01092
G1 X31.851 Y163.732 E.0109
G1 X31.506 Y163.933 E.01229
G1 F8400
G1 X31.194 Y164.146 E.01161
G1 F9300
G1 X30.877 Y164.39 E.01229
G1 X30.596 Y164.607 E.01092
G1 F8400
G1 X30.311 Y164.856 E.0116
G1 F9300
G1 X30.026 Y165.136 E.01229
G1 X29.778 Y165.39 E.01091
G1 X29.542 Y165.656 E.01091
G1 X29.277 Y165.955 E.01229
G1 F8400
G1 X29.047 Y166.255 E.01161
G1 F9300
G1 X28.822 Y166.586 E.01229
G1 X28.629 Y166.884 E.01091
G1 X28.451 Y167.191 E.0109
G1 X28.25 Y167.536 E.01229
G1 F8400
G1 X28.083 Y167.876 E.01161
G1 F9300
G1 X27.929 Y168.244 E.01229
G1 X27.793 Y168.573 E.01092
G2 X27.556 Y169.29 I9.282 J3.459 E.0232
G1 X27.459 Y169.655 E.01161
G1 F8400
G2 X27.31 Y170.395 I9.704 J2.338 E.02321
G1 F9300
G1 X27.26 Y170.77 E.01161
G2 X27.19 Y172.498 I11.489 J1.332 E.05319
G1 X27.19 Y180.144 E.23496
G1 X27.19 Y180.544 E.01229
G1 F6803.787
G1 X27.19 Y180.944 E.01229
G1 F3000
G1 X27.059 Y180.751 E.00717
G1 F7269.874
G1 X26.827 Y180.377 E.01352
G1 F9300
G1 X26.636 Y180.026 E.01229
G1 X26.406 Y179.603 E.01479
G1 F8400
G3 X25.513 Y177.121 I11.646 J-5.59 E.08119
G1 F9300
G1 X25.437 Y176.728 E.01229
G1 X25.345 Y176.256 E.0148
G1 F8400
G1 X25.286 Y175.819 E.01354
G1 F9300
G1 X25.243 Y175.358 E.01423
G1 F8400
G3 X25.21 Y174.497 I11.19 J-.854 E.02647
G1 F9300
G1 X25.21 Y174.097 E.01229
G1 X25.21 Y172.502 E.04903
G3 X28.286 Y164.075 I11.685 J-.509 E.28289
G3 X35.867 Y160.441 I8.423 J7.847 E.26444
G1 X36.395 Y160.423 E.01624
G1 X36.795 Y160.411 E.01229
G1 F8400
G1 X37.225 Y160.422 E.01321
G1 F9300
G1 X37.624 Y160.456 E.01229
G1 X38.127 Y160.508 E.01554
G1 X38.626 Y160.585 E.01553
G1 X39.021 Y160.647 E.01229
G1 F8400
G1 X39.441 Y160.742 E.01322
G1 F9300
G1 X39.9 Y160.867 E.01463
G3 X47.032 Y166.869 I-3.261 J11.114 E.29478
G1 F9547.055
G1 X47.054 Y166.91 E.00142
G1 X57.95 Y166.911 E.33483
G3 X59.189 Y168.151 I-.068 J1.306 E.05902
G1 X59.189 Y176.25 E.24886
G3 X57.948 Y177.489 I-1.306 J-.068 E.05902
G1 X47.858 Y177.49 E.31004
M204 S10000
G1 X46.997 Y177.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362591
G1 F11261.581
M204 S6000
G1 X46.967 Y177.624 E.00542
; LINE_WIDTH: 0.323104
G1 F12848.716
G1 X46.936 Y177.83 E.00475
; LINE_WIDTH: 0.280716
G1 F15000
G1 X46.913 Y177.965 E.00265
; LINE_WIDTH: 0.235406
G1 X46.891 Y178.1 E.00214
; LINE_WIDTH: 0.190095
G1 X46.868 Y178.234 E.00164
; LINE_WIDTH: 0.149807
G1 X46.848 Y178.341 E.00095
; LINE_WIDTH: 0.114549
G1 X46.828 Y178.449 E.00064
M204 S10000
G1 X46.997 Y177.418 F42000
; LINE_WIDTH: 0.402079
G1 F10023.438
M204 S6000
G1 X47.028 Y177.212 E.00609
; WIPE_START
G1 X46.997 Y177.418 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X47.099 Y169.787 Z.8 F42000
G1 X47.125 Y167.872 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4224
G1 F9486.666
M204 S6000
G1 X46.714 Y168.283 E.01797
G1 X46.742 Y168.354 E.00237
G1 X46.742 Y168.791 E.01351
G1 X47.492 Y168.042 E.03276
G1 X48.028 Y168.042 E.01659
G1 X46.743 Y169.328 E.05623
G1 X46.743 Y169.865 E.01659
G1 X48.565 Y168.042 E.07969
G1 X49.101 Y168.042 E.01659
G1 X46.743 Y170.401 E.10315
G1 X46.743 Y170.938 E.01659
G1 X49.638 Y168.042 E.12662
G1 X50.175 Y168.042 E.01659
G1 X46.743 Y171.474 E.15008
G1 X46.743 Y172.011 E.01659
G1 X50.711 Y168.043 E.17354
G1 X51.248 Y168.043 E.01659
G1 X46.743 Y172.547 E.19701
G1 X46.743 Y173.084 E.01659
G1 X51.784 Y168.043 E.22047
G1 X52.321 Y168.043 E.01659
G1 X46.743 Y173.621 E.24393
G1 X46.743 Y174.157 E.01659
G1 X52.858 Y168.043 E.26739
G1 X53.394 Y168.043 E.01659
G1 X46.743 Y174.694 E.29086
G1 X46.743 Y175.23 E.01659
G1 X53.931 Y168.043 E.31432
G1 X54.468 Y168.043 E.01659
G1 X46.743 Y175.767 E.33778
G1 X46.744 Y176.173 E.01257
G2 X46.77 Y176.277 I.158 J.014 E.00337
G1 X55.004 Y168.043 E.36008
G1 X55.541 Y168.043 E.01659
G1 X47.226 Y176.357 E.3636
G1 X47.763 Y176.357 E.0166
G1 X56.077 Y168.043 E.36359
G1 X56.614 Y168.043 E.01659
G1 X48.3 Y176.357 E.36359
G1 X48.837 Y176.357 E.0166
G1 X57.151 Y168.043 E.36358
G1 X57.687 Y168.043 E.01659
G1 X49.373 Y176.357 E.36358
G1 X49.91 Y176.357 E.0166
G1 X58.056 Y168.211 E.35622
G1 X58.056 Y168.747 E.01657
G1 X50.447 Y176.357 E.33279
G1 X50.983 Y176.357 E.0166
G1 X58.056 Y169.284 E.30931
G1 X58.056 Y169.821 E.0166
G1 X51.52 Y176.357 E.28584
G1 X52.057 Y176.357 E.0166
G1 X58.056 Y170.357 E.26237
G1 X58.056 Y170.894 E.0166
G1 X52.594 Y176.357 E.2389
G1 X53.13 Y176.357 E.0166
G1 X58.056 Y171.431 E.21543
G1 X58.056 Y171.967 E.0166
G1 X53.667 Y176.357 E.19195
G1 X54.204 Y176.357 E.0166
G1 X58.056 Y172.504 E.16848
G1 X58.056 Y173.041 E.0166
G1 X54.741 Y176.357 E.14501
G1 X55.277 Y176.357 E.0166
G1 X58.056 Y173.577 E.12154
G1 X58.056 Y174.114 E.0166
G1 X55.814 Y176.356 E.09807
G1 X56.351 Y176.356 E.0166
G1 X58.056 Y174.651 E.07459
G1 X58.056 Y175.187 E.0166
G1 X56.887 Y176.356 E.05112
G1 X57.424 Y176.356 E.0166
G1 X58.056 Y175.724 E.02765
G1 X58.056 Y176.193 E.01449
G3 X58.024 Y176.292 I-.193 J-.009 E.00328
G3 X57.791 Y176.526 I-1.447 J-1.205 E.01021
; WIPE_START
G1 X58.024 Y176.292 E-.12528
G1 X58.056 Y176.193 E-.03977
G1 X58.056 Y175.724 E-.17811
G1 X57.424 Y176.356 E-.33979
G1 X57.221 Y176.356 E-.07706
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X49.607 Y176.876 Z.8 F42000
G1 X26.572 Y178.449 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121028
G1 F15000
M204 S6000
G1 X26.546 Y178.305 E.00093
; LINE_WIDTH: 0.169223
G1 X26.519 Y178.161 E.00151
; LINE_WIDTH: 0.216006
G1 X26.497 Y178.023 E.00197
; LINE_WIDTH: 0.261403
G1 X26.474 Y177.885 E.00249
; LINE_WIDTH: 0.306801
G1 F13642.511
G1 X26.451 Y177.747 E.00301
; LINE_WIDTH: 0.349372
G1 F11747.381
G1 X26.431 Y177.61 E.00346
; LINE_WIDTH: 0.389095
G1 F10399.372
G1 X26.411 Y177.472 E.00391
; LINE_WIDTH: 0.428819
G1 F9328.884
G1 X26.392 Y177.335 E.00436
; LINE_WIDTH: 0.465671
G1 F8515.662
G1 X26.375 Y177.2 E.00471
; LINE_WIDTH: 0.499651
G1 F7882.113
G1 X26.358 Y177.064 E.00509
; LINE_WIDTH: 0.53363
G1 F7336.308
G1 X26.341 Y176.928 E.00546
; LINE_WIDTH: 0.56594
G1 F6883.109
G1 X26.297 Y176.515 E.01772
; OBJECT_ID: 3
; WIPE_START
G1 X26.341 Y176.928 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X28.025 Y169.484 Z.8 F42000
G1 X32.736 Y148.669 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X32.677 Y148.657 E.002
G3 X26.391 Y141.01 I1.537 J-7.671 E.35553
G1 X26.391 Y106.99 E1.12848
G3 X34.19 Y99.191 I7.824 J.025 E.40606
G1 X87.71 Y99.191 E1.77533
G3 X95.509 Y106.99 I-.024 J7.823 E.40607
G1 X95.509 Y141.01 E1.12848
G3 X87.71 Y148.809 I-7.823 J-.024 E.40607
G1 X34.19 Y148.809 E1.77533
G3 X33.283 Y148.754 I.024 J-7.823 E.03019
G1 X32.795 Y148.678 E.01636
M204 S10000
G1 X32.8 Y148.267 F42000
G1 F8843.478
M204 S6000
G1 X32.756 Y148.258 E.00146
G3 X26.798 Y141.006 I1.457 J-7.271 E.33711
G1 X26.798 Y106.994 E1.12822
G3 X34.194 Y99.598 I7.417 J.02 E.38511
G1 X87.706 Y99.598 E1.77507
G3 X95.102 Y106.994 I-.019 J7.416 E.38512
G1 X95.102 Y141.006 E1.12822
G3 X87.706 Y148.402 I-7.416 J-.019 E.38512
G1 X34.194 Y148.402 E1.77508
G3 X33.33 Y148.349 I.019 J-7.416 E.02872
G1 X32.859 Y148.276 E.01583
M204 S250
G1 X32.863 Y147.87 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9300
M204 S5000
G1 X32.565 Y147.812 E.00935
G3 X29.443 Y146.146 I1.66 J-6.866 E.10989
G1 X29.147 Y145.841 E.01307
G1 X28.869 Y145.552 E.01229
G1 F8400
G1 X28.687 Y145.329 E.00887
G1 F9300
G1 X28.372 Y144.894 E.01649
G3 X27.724 Y143.683 I5.944 J-3.963 E.04229
G3 X27.19 Y140.402 I7.179 J-2.851 E.10293
G1 X27.19 Y107.598 E1.00798
G3 X27.195 Y106.725 I9.146 J-.383 E.02684
G1 X27.235 Y106.315 E.01265
G1 X27.274 Y105.917 E.01229
G1 F8400
G1 X27.325 Y105.633 E.00887
G1 F9300
G1 X27.454 Y105.097 E.01692
G3 X27.835 Y104.066 I6.822 J1.933 E.03383
G1 X28.028 Y103.702 E.01266
G1 X28.216 Y103.349 E.01229
G1 F8400
G1 X28.371 Y103.106 E.00887
G1 F9300
G1 X28.699 Y102.664 E.01691
G3 X29.043 Y102.252 I7.344 J5.789 E.0165
G1 F8400
G1 X29.243 Y102.043 E.00887
G1 F9300
G1 X29.648 Y101.67 E.01692
G3 X30.08 Y101.33 I4.641 J5.447 E.01691
G1 X30.438 Y101.099 E.01308
G1 X30.775 Y100.884 E.01229
G1 F8400
G1 X31.03 Y100.748 E.00886
G1 F9300
G1 X31.396 Y100.588 E.01229
G1 X31.775 Y100.427 E.01265
G3 X34.198 Y99.99 I2.471 J6.765 E.07602
G1 X87.702 Y99.99 E1.64403
G3 X93.03 Y102.448 I-.007 J7.02 E.18601
G1 X93.287 Y102.787 E.01306
G1 X93.529 Y103.105 E.01229
G1 F8400
G1 X93.684 Y103.349 E.00887
G1 F9300
G1 X93.872 Y103.702 E.01229
G1 X94.065 Y104.066 E.01265
G3 X94.515 Y105.364 I-6.411 J2.95 E.04228
G1 X94.589 Y105.769 E.01265
G1 X94.66 Y106.163 E.01229
G1 F8400
G1 X94.688 Y106.45 E.00887
G1 F9300
G1 X94.696 Y106.85 E.01229
G1 X94.71 Y107.598 E.02299
G1 X94.71 Y141.002 E1.02642
G3 X92.846 Y145.757 I-7.063 J-.027 E.16056
G1 X92.551 Y146.044 E.01265
G1 X92.263 Y146.321 E.01229
G1 F8400
G3 X91.809 Y146.679 I-4.388 J-5.1 E.01775
G1 F9300
G1 X91.36 Y146.972 E.01649
G3 X90.894 Y147.24 I-4.884 J-7.969 E.0165
G1 F8400
G1 X90.635 Y147.366 E.00887
G1 F9300
G1 X90.383 Y147.476 E.00846
G3 X87.102 Y148.01 I-2.851 J-7.179 E.10293
G1 X34.198 Y148.01 E1.6256
G3 X33.377 Y147.959 I.027 J-7.064 E.0253
G1 X32.923 Y147.88 E.01416
; WIPE_START
M204 S6000
G1 X32.565 Y147.812 E-.13849
G1 X31.774 Y147.577 E-.31353
G1 X31.265 Y147.366 E-.20916
G1 X31.036 Y147.244 E-.09883
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.74 Y141.233 Z.8 F42000
G1 X68.941 Y98.809 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y98.809 E.62195
G3 X95.891 Y107.01 I-.006 J8.207 E.42723
G1 X95.891 Y140.99 E1.12718
G3 X87.69 Y149.191 I-8.207 J-.006 E.42723
G1 X34.21 Y149.191 E1.77403
G3 X26.009 Y140.99 I.006 J-8.207 E.42724
G1 X26.009 Y107.01 E1.12718
G3 X34.21 Y98.809 I8.208 J.007 E.42722
G1 X52.959 Y98.809 E.62195
G1 X52.959 Y93.82 E.16551
G3 X53.48 Y93.309 I.495 J-.016 E.02719
G1 X68.464 Y93.31 E.49705
G3 X68.941 Y93.82 I-.015 J.493 E.02573
G1 X68.941 Y98.749 E.16352
M204 S10000
G1 X69.348 Y98.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y98.402 E.60858
G3 X96.298 Y107.006 I-.01 J8.614 E.44816
G1 X96.298 Y140.994 E1.12745
G3 X87.694 Y149.598 I-8.614 J-.01 E.44816
G1 X34.206 Y149.598 E1.7743
G3 X25.602 Y140.994 I.01 J-8.614 E.44816
G1 X25.602 Y107.006 E1.12745
G3 X34.206 Y98.402 I8.615 J.012 E.44815
G1 X52.552 Y98.402 E.60858
G1 X52.552 Y93.812 E.15227
G3 X53.468 Y92.902 I.906 J-.004 E.04765
G1 X68.479 Y92.903 E.49795
G3 X69.348 Y93.812 I-.036 J.905 E.0461
G1 X69.348 Y98.342 E.15028
M204 S250
G1 X69.74 Y98.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X69.779 Y98.01 E.00119
G1 F9300
G1 X87.098 Y98.01 E.53217
G3 X92.093 Y99.156 I.474 J9.39 E.15949
G3 X96.69 Y107.002 I-4.404 J7.85 E.29291
G1 X96.69 Y140.398 E1.02616
G3 X95.544 Y145.393 I-9.39 J.474 E.15949
G3 X87.698 Y149.99 I-7.85 J-4.404 E.29291
G1 X34.802 Y149.99 E1.62534
G3 X29.807 Y148.844 I-.474 J-9.39 E.15949
G3 X25.21 Y140.998 I4.404 J-7.85 E.29291
G1 X25.21 Y107.602 E1.02616
G3 X26.356 Y102.607 I9.404 J-.471 E.15948
G3 X34.202 Y98.01 I7.85 J4.404 E.29291
G1 X52.121 Y98.01 E.55061
G1 F9547.055
G1 X52.16 Y98.01 E.00119
G1 X52.16 Y93.804 E.12923
G3 X53.456 Y92.51 I1.3 J.006 E.06245
G1 X68.494 Y92.511 E.46206
G3 X69.74 Y93.804 I-.054 J1.299 E.06092
G1 X69.74 Y97.95 E.12739
; WIPE_START
M204 S6000
G1 X69.779 Y98.01 E-.02713
G1 X71.707 Y98.01 E-.73287
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.997 Y96.49 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51903
G1 F7561.278
M204 S6000
G1 X66.236 Y96.49 E.00924
G1 X66.235 Y96.014 E.01848
G1 X55.664 Y96.013 E.41013
G1 X55.664 Y96.489 E.01847
G1 X65.937 Y96.49 E.39857
M204 S10000
G1 X66.662 Y96.917 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.662 Y95.587 E.04085
G1 X55.238 Y95.587 E.35102
G1 X55.237 Y96.916 E.04084
G1 X66.602 Y96.917 E.34921
M204 S10000
G1 X67.04 Y97.294 F42000
G1 F9547.299
M204 S6000
G1 X67.039 Y95.21 E.06402
G1 X54.861 Y95.21 E.37418
G1 X54.86 Y97.293 E.06401
G1 X66.98 Y97.294 E.37239
M204 S10000
G1 X67.417 Y97.671 F42000
G1 F9547.299
M204 S6000
G1 X67.415 Y94.833 E.0872
G1 X54.484 Y94.832 E.39734
G1 X54.483 Y97.67 E.08718
G1 X67.357 Y97.671 E.39558
M204 S10000
G1 X67.794 Y98.048 F42000
G1 F9547.299
M204 S6000
G1 X67.792 Y94.456 E.11037
G1 X54.107 Y94.455 E.4205
G1 X54.106 Y98.047 E.11035
G1 X67.734 Y98.048 E.41876
M204 S10000
G1 X68.172 Y98.425 F42000
G1 F9547.299
M204 S6000
G1 X68.169 Y94.079 E.13354
G1 X53.73 Y94.078 E.44366
G1 X53.728 Y98.424 E.13352
G1 X68.112 Y98.425 E.44194
M204 S10000
G1 X68.549 Y98.803 F42000
G1 F9547.299
M204 S6000
G1 X68.546 Y93.858 E.15193
G1 X68.505 Y93.741 E.00381
G1 X68.375 Y93.702 E.00417
G1 X53.501 Y93.701 E.45702
G1 X53.385 Y93.744 E.00381
G1 X53.353 Y93.858 E.00363
G1 X53.351 Y98.801 E.15188
G1 X68.489 Y98.803 E.46512
; OBJECT_ID: 1
; WIPE_START
M73 P39 R16
G1 X66.489 Y98.802 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X69.178 Y91.659 Z.8 F42000
G1 X91.223 Y33.1 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.258 Y33.127 E.00148
G3 X94.509 Y39.19 I-4.071 J6.086 E.23758
G1 X94.509 Y73.21 E1.12848
G3 X87.21 Y80.509 I-7.322 J-.023 E.38003
G1 X33.69 Y80.509 E1.77533
G3 X26.391 Y73.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E1.12848
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X90.516 Y32.692 I-.023 J7.322 E.1139
G1 X91.171 Y33.07 E.02508
M204 S10000
G1 X91.017 Y33.451 F42000
G1 F8843.478
M204 S6000
G1 X91.032 Y33.465 E.00069
G3 X94.102 Y39.194 I-3.845 J5.747 E.22446
G1 X94.102 Y73.206 E1.12823
G3 X87.206 Y80.102 I-6.915 J-.018 E.35908
G1 X33.694 Y80.102 E1.77508
G3 X26.798 Y73.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E1.12822
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X90.331 Y33.054 I-.018 J6.915 E.10766
G1 X90.965 Y33.421 E.02428
M204 S250
G1 X90.817 Y33.788 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9300
M204 S5000
G3 X91.23 Y34.088 I-3.624 J5.434 E.01571
G1 F8400
G1 X91.437 Y34.258 E.00824
G1 F9300
G1 X91.803 Y34.597 E.01532
G3 X93.308 Y36.947 I-4.632 J4.623 E.08639
G3 X93.71 Y39.798 I-7.19 J2.469 E.08901
G1 X93.71 Y73.202 E1.02642
G3 X91.979 Y77.617 I-6.559 J-.025 E.14911
G1 X91.725 Y77.865 E.01087
G1 X91.437 Y78.142 E.01229
G1 F8400
G1 X91.23 Y78.312 E.00823
G1 F9300
G1 X90.815 Y78.61 E.01571
G3 X89.453 Y79.308 I-3.827 J-5.789 E.04711
G3 X86.602 Y79.71 I-2.469 J-7.19 E.08901
G1 X33.698 Y79.71 E1.6256
G3 X28.588 Y77.23 I.007 J-6.518 E.18059
G1 X28.294 Y76.827 E.01531
G1 F8400
G1 X28.149 Y76.602 E.00824
G1 F9300
G1 X27.904 Y76.153 E.01571
G3 X27.691 Y75.703 I7.744 J-3.946 E.01532
G1 F8400
G1 X27.592 Y75.453 E.00823
G1 F9300
G1 X27.443 Y74.965 E.0157
G3 X27.19 Y72.602 I7.342 J-1.98 E.07331
G1 X27.19 Y39.798 E1.00798
G3 X27.195 Y38.945 I8.673 J-.38 E.02623
G1 X27.229 Y38.592 E.01088
G1 X27.268 Y38.194 E.01229
G1 F8400
G1 X27.315 Y37.93 E.00823
G1 F9300
G1 X27.416 Y37.543 E.01229
G1 X27.51 Y37.189 E.01126
G3 X27.687 Y36.709 I6.309 J2.053 E.01571
G1 X27.894 Y36.256 E.01532
G1 F8400
G1 X28.02 Y36.019 E.00824
G1 F9300
G1 X28.236 Y35.682 E.01229
G1 X28.434 Y35.374 E.01127
G3 X29.874 Y33.934 I5.291 J3.851 E.06283
G1 X30.288 Y33.656 E.01532
G1 F8400
G1 X30.519 Y33.52 E.00823
G1 F9300
G3 X30.975 Y33.288 I3.177 J5.671 E.01573
G1 F8400
G1 X31.22 Y33.181 E.00823
G1 F9300
G1 X31.598 Y33.05 E.01229
G1 X31.933 Y32.936 E.01088
G3 X32.43 Y32.816 I1.796 J6.375 E.0157
G1 X32.922 Y32.737 E.01532
G1 F8400
G1 X33.189 Y32.71 E.00823
G1 F9300
G3 X33.698 Y32.69 I.51 J6.493 E.01565
G1 X87.202 Y32.69 E1.64404
G3 X90.766 Y33.755 I-.009 J6.531 E.11591
; WIPE_START
M204 S6000
G1 X91.23 Y34.088 E-.21704
G1 X91.437 Y34.258 E-.10186
G1 X91.803 Y34.597 E-.18946
G1 X92.15 Y34.972 E-.19424
G1 X92.241 Y35.093 E-.05739
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.694 Y33.956 Z.8 F42000
G1 X68.441 Y31.509 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I-.006 J7.707 E.40118
G1 X94.891 Y73.19 E1.12718
G3 X87.19 Y80.891 I-7.706 J-.005 E.40119
G1 X33.71 Y80.891 E1.77404
G3 X26.009 Y73.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E1.12718
G3 X33.71 Y31.509 I7.707 J.006 E.40118
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.52 E.16551
G3 X52.98 Y26.009 I.495 J-.016 E.02719
G1 X67.964 Y26.01 E.49704
G3 X68.441 Y26.53 I-.016 J.493 E.02607
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I-.011 J8.114 E.42211
G1 X95.298 Y73.194 E1.12745
G3 X87.194 Y81.298 I-8.113 J-.009 E.42212
G1 X33.706 Y81.298 E1.77431
G3 X25.602 Y73.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E1.12745
G3 X33.706 Y31.102 I8.115 J.011 E.42211
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.512 E.15227
G3 X52.968 Y25.602 I.903 J-.007 E.0477
G1 X67.979 Y25.603 E.49795
G3 X68.848 Y26.518 I-.031 J.9 E.04638
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X69.279 Y30.71 E.00119
G1 F9300
G1 X86.598 Y30.71 E.53217
G3 X91.349 Y31.793 I.448 J8.996 E.1516
G3 X95.69 Y39.202 I-4.159 J7.414 E.27662
G1 X95.69 Y72.598 E1.02616
G3 X94.607 Y77.348 I-8.996 J.448 E.1516
G3 X87.198 Y81.69 I-7.414 J-4.159 E.27663
G1 X34.302 Y81.69 E1.62534
G3 X29.552 Y80.607 I-.448 J-8.996 E.1516
G3 X25.21 Y73.198 I4.159 J-7.414 E.27663
G1 X25.21 Y39.802 E1.02616
G3 X26.293 Y35.052 I8.996 J-.448 E.1516
G3 X33.702 Y30.71 I7.414 J4.159 E.27663
G1 X51.621 Y30.71 E.55061
G1 F9547.055
G1 X51.66 Y30.71 E.00119
G1 X51.66 Y26.504 E.12923
G3 X52.956 Y25.21 I1.296 J.002 E.0625
G1 X67.994 Y25.211 E.46206
G3 X69.24 Y26.506 I-.046 J1.292 E.06108
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X69.279 Y30.71 E-.02713
G1 X71.207 Y30.71 E-.73287
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.496 Y29.19 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518935
G1 F7562.787
M204 S6000
G1 X65.734 Y29.19 E.00925
G1 X65.734 Y28.714 E.01847
G1 X55.164 Y28.713 E.40999
G1 X55.164 Y29.189 E.01846
G1 X65.436 Y29.19 E.39844
M204 S10000
G1 X66.161 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.287 E.04084
G1 X54.738 Y28.287 E.35096
G1 X54.737 Y29.616 E.04083
G1 X66.101 Y29.617 E.34918
M204 S10000
G1 X66.539 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.91 E.06402
G1 X54.361 Y27.91 E.37411
G1 X54.36 Y29.993 E.064
G1 X66.479 Y29.994 E.37237
M204 S10000
G1 X66.916 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.533 E.08719
G1 X53.984 Y27.532 E.39727
G1 X53.983 Y30.37 E.08718
G1 X66.856 Y30.371 E.39556
M204 S10000
G1 X67.294 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.156 E.11036
G1 X53.607 Y27.155 E.42042
G1 X53.606 Y30.747 E.11035
G1 X67.234 Y30.748 E.41875
M204 S10000
G1 X67.671 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.779 E.13353
G1 X53.23 Y26.778 E.44358
G1 X53.228 Y31.124 E.13352
G1 X67.611 Y31.125 E.44194
M204 S10000
G1 X68.049 Y31.502 F42000
G1 F9547.299
M204 S6000
G1 X68.043 Y26.54 E.15246
G1 X68.009 Y26.443 E.00317
G1 X67.875 Y26.402 E.0043
G1 X53 Y26.401 E.45704
G1 X52.884 Y26.446 E.00384
G1 X52.853 Y26.557 E.00352
G1 X52.851 Y31.501 E.15191
G1 X67.989 Y31.502 E.46512
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.989 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 3/15
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I-.457 J1.128 P1  F42000
G1 X175.393 Y75.826 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X175.235 Y76.27 E.01565
G3 X168.31 Y80.909 I-6.948 J-2.884 E.29305
G1 X114.79 Y80.909 E1.77533
G3 X107.291 Y73.41 I.023 J-7.523 E.39045
G1 X107.291 Y39.39 E1.12848
G3 X114.79 Y31.891 I7.523 J.023 E.39044
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.023 J7.523 E.39045
G1 X175.809 Y73.41 E1.12848
G3 X175.524 Y75.437 I-7.523 J-.023 E.06814
G1 X175.412 Y75.769 E.0116
M204 S10000
G1 X175.009 Y75.692 F42000
G1 F8843.478
M204 S6000
G1 X174.858 Y76.115 E.01489
G3 X168.306 Y80.502 I-6.571 J-2.728 E.27724
G1 X114.794 Y80.502 E1.77508
G3 X107.698 Y73.406 I.019 J-7.115 E.3695
G1 X107.698 Y39.394 E1.12822
G3 X114.794 Y32.298 I7.115 J.019 E.3695
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.019 J7.115 E.3695
G1 X175.402 Y73.406 E1.12822
G3 X175.133 Y75.327 I-7.115 J-.019 E.06455
G1 X175.028 Y75.636 E.01081
M204 S250
G1 X174.639 Y75.564 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X174.496 Y75.966 E.0131
G3 X168.302 Y80.11 I-6.208 J-2.578 E.24271
G1 X114.798 Y80.11 E1.64403
G3 X108.09 Y73.402 I.015 J-6.722 E.32357
G1 X108.09 Y39.398 E1.04485
G3 X114.798 Y32.69 I6.722 J.015 E.32357
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.015 J6.722 E.32357
G1 X175.01 Y73.402 E1.04485
G3 X174.755 Y75.221 I-6.722 J-.015 E.0566
G1 X174.658 Y75.507 E.0093
; WIPE_START
M204 S6000
G1 X174.496 Y75.966 E-.18486
G1 X174.279 Y76.446 E-.20037
G1 X173.879 Y77.128 E-.30019
G1 X173.761 Y77.285 E-.07458
; WIPE_END
M73 P40 R16
G1 E-.04 F1800
M204 S10000
G1 X170.192 Y70.538 Z1 F42000
G1 X149.541 Y31.509 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I-.009 J7.91 E.41156
G1 X176.191 Y73.39 E1.12718
G3 X168.29 Y81.291 I-7.906 J-.005 E.41161
G1 X114.81 Y81.291 E1.77403
G3 X106.909 Y73.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E1.12718
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.52 E.16551
G3 X134.08 Y26.009 I.495 J-.016 E.02718
G1 X149.06 Y26.01 E.49691
G3 X149.541 Y26.52 I-.011 J.493 E.02587
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.013 J8.317 E.43249
G1 X176.598 Y73.394 E1.12745
G3 X168.294 Y81.698 I-8.314 J-.01 E.43254
G1 X114.806 Y81.698 E1.7743
G3 X106.502 Y73.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E1.12745
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.512 E.15227
G3 X134.068 Y25.602 I.901 J-.009 E.04773
G1 X149.075 Y25.603 E.4978
G3 X149.948 Y26.512 I-.026 J.9 E.04632
G1 X149.948 Y31.042 E.15028
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.99 Y39.402 I-.018 J8.71 E.4193
G1 X176.99 Y73.398 E1.0446
G3 X168.298 Y82.09 I-8.706 J-.014 E.41935
G1 X114.802 Y82.09 E1.64378
G3 X106.11 Y73.398 I.014 J-8.706 E.41935
G1 X106.11 Y39.402 E1.0446
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.504 E.12923
G3 X134.056 Y25.21 I1.293 J-.001 E.06254
G1 X149.089 Y25.211 E.46191
G3 X150.34 Y26.504 I-.041 J1.292 E.06116
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 3 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X261 Y250 F20000
      M400 P200
      G39 S1
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z1.000
; object ids of this layer3 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X146.598 Y29.19 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518995
G1 F7561.834
M204 S6000
G1 X146.836 Y29.19 E.00924
G1 X146.836 Y28.714 E.01847
G1 X136.264 Y28.713 E.41011
M73 P40 R15
G1 X136.264 Y29.189 E.01846
G1 X146.538 Y29.19 E.39856
M204 S10000
G1 X147.263 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.262 Y28.287 E.04085
G1 X135.838 Y28.287 E.35103
G1 X135.837 Y29.616 E.04083
G1 X147.203 Y29.617 E.34922
M204 S10000
G1 X147.64 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X147.639 Y27.91 E.06402
G1 X135.461 Y27.91 E.37419
G1 X135.46 Y29.993 E.06401
G1 X147.58 Y29.994 E.3724
M204 S10000
G1 X148.017 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X148.016 Y27.533 E.0872
G1 X135.084 Y27.532 E.39735
G1 X135.083 Y30.37 E.08718
G1 X147.957 Y30.371 E.39558
M204 S10000
G1 X148.394 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X148.393 Y27.156 E.11037
G1 X134.707 Y27.155 E.42051
G1 X134.706 Y30.747 E.11035
G1 X148.334 Y30.748 E.41876
M204 S10000
G1 X148.772 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X148.77 Y26.779 E.13354
G1 X134.33 Y26.778 E.44368
G1 X134.328 Y31.124 E.13352
G1 X148.712 Y31.125 E.44194
M204 S10000
G1 X149.149 Y31.502 F42000
G1 F9547.299
M204 S6000
G1 X149.147 Y26.567 E.15166
G1 X149.104 Y26.441 E.00408
G1 X148.972 Y26.402 E.00423
G1 X134.101 Y26.401 E.45692
G1 X133.979 Y26.452 E.00406
G1 X133.953 Y26.558 E.00337
G1 X133.951 Y31.501 E.15187
G1 X149.089 Y31.502 E.46512
; OBJECT_ID: 4
; WIPE_START
G1 X147.089 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X145.369 Y38.938 Z1 F42000
G1 X129.214 Y108.791 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.106 Y108.791 E.00355
G1 X129.008 Y109.114 E.0112
G1 X128.465 Y108.656 E.02357
G3 X128.31 Y108.316 I.351 J-.364 E.01269
G1 X128.309 Y100.519 E.25865
G2 X108.291 Y103.99 I-9.704 J3.493 E.95591
G1 X108.291 Y108.402 E.14636
G1 X108.068 Y108.422 E.00743
G3 X107.909 Y106.59 I10.802 J-1.858 E.06107
G3 X107.918 Y103.578 I76.426 J-1.29 E.09989
G3 X119.088 Y93.32 I10.701 J.442 E.55899
G3 X127.982 Y98.875 I-.523 J10.735 E.36336
G1 X128.469 Y99.809 E.03493
G1 X139.819 Y99.81 E.37651
G3 X140.29 Y100.29 I-.027 J.497 E.0245
G1 X140.29 Y108.319 E.26631
G3 X139.809 Y108.789 I-.497 J-.027 E.0245
G1 X129.274 Y108.791 E.34948
M204 S10000
G1 X129.46 Y109.198 F42000
G1 F8843.478
M204 S6000
G1 X129.408 Y109.198 E.00174
G3 X128.697 Y111.206 I-15.424 J-4.33 E.07074
G1 X128.502 Y111.166 E.0066
G1 X128.502 Y109.22 E.06457
G3 X128.05 Y108.792 I.998 J-1.507 E.02073
G3 X127.903 Y108.333 I.798 J-.509 E.01618
G1 X127.902 Y100.597 E.2566
G2 X108.698 Y103.994 I-9.299 J3.413 E.91613
G1 X108.698 Y111.168 E.23799
G1 X108.503 Y111.208 E.00661
G3 X107.502 Y106.593 I10.222 J-4.632 E.15782
G3 X107.511 Y103.562 I76.888 J-1.294 E.10055
G3 X119.107 Y92.914 I11.109 J.459 E.58028
G3 X128.339 Y98.68 I-.543 J11.143 E.37719
G1 X128.716 Y99.402 E.02701
G1 X139.835 Y99.403 E.36884
G3 X140.697 Y100.27 I-.048 J.909 E.04448
G1 X140.697 Y108.335 E.26751
G3 X139.829 Y109.197 I-.909 J-.048 E.04448
G1 X129.52 Y109.198 E.34196
M204 S250
G1 X129.698 Y109.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.11 Y113.044 I-11.277 J-3.093 E.11735
G1 X128.11 Y109.402 E.11192
G3 X127.511 Y108.349 I.808 J-1.156 E.03847
G1 X127.51 Y100.673 E.23587
G2 X109.09 Y103.998 I-8.908 J3.336 E.81313
G1 X109.09 Y113.044 E.27797
G3 X107.11 Y106.597 I9.672 J-6.498 E.21023
G3 X107.119 Y103.547 I77.358 J-1.298 E.09374
G3 X119.125 Y92.522 I11.502 J.475 E.55651
G3 X128.954 Y99.01 I-.537 J11.503 E.37985
G1 X139.85 Y99.011 E.33483
G3 X141.089 Y100.251 I-.068 J1.306 E.05902
G1 X141.089 Y108.35 E.24886
G3 X139.848 Y109.589 I-1.306 J-.068 E.05903
G1 X129.758 Y109.59 E.31004
M204 S10000
G1 X128.897 Y109.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362648
G1 F11259.593
M204 S6000
G1 X128.867 Y109.724 E.00542
; LINE_WIDTH: 0.323189
G1 F12844.796
G1 X128.836 Y109.93 E.00475
; LINE_WIDTH: 0.280779
G1 F15000
G1 X128.813 Y110.065 E.00265
; LINE_WIDTH: 0.235379
G1 X128.79 Y110.2 E.00215
; LINE_WIDTH: 0.18998
G1 X128.768 Y110.335 E.00164
; LINE_WIDTH: 0.149678
G1 X128.748 Y110.442 E.00095
; LINE_WIDTH: 0.114506
G1 X128.728 Y110.549 E.00064
M204 S10000
G1 X128.897 Y109.518 F42000
; LINE_WIDTH: 0.402106
G1 F10022.673
M204 S6000
G1 X128.928 Y109.312 E.00609
; WIPE_START
G1 X128.897 Y109.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.474 Y108.186 Z1 F42000
G1 Z.6
M73 P41 R15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42445
G1 F9435.693
M204 S6000
G2 X128.838 Y108.529 I2.414 J-2.198 E.01556
G1 X128.86 Y108.457 E.00232
G1 X129.285 Y108.457 E.01322
G1 X128.643 Y107.816 E.0282
G1 X128.643 Y107.276 E.01678
G1 X129.824 Y108.457 E.05192
G1 X130.364 Y108.457 E.01677
G1 X128.643 Y106.737 E.07565
G1 X128.643 Y106.197 E.01678
G1 X130.903 Y108.457 E.09937
G1 X131.443 Y108.457 E.01677
G1 X128.643 Y105.657 E.1231
G1 X128.643 Y105.118 E.01678
G1 X131.982 Y108.457 E.14682
G1 X132.522 Y108.457 E.01677
G1 X128.643 Y104.578 E.17055
G1 X128.643 Y104.039 E.01678
G1 X133.061 Y108.457 E.19427
G1 X133.601 Y108.457 E.01677
G1 X128.643 Y103.499 E.21799
G1 X128.643 Y102.959 E.01678
G1 X134.14 Y108.457 E.24172
G1 X134.68 Y108.457 E.01677
G1 X128.643 Y102.42 E.26544
G1 X128.643 Y101.88 E.01678
G1 X135.219 Y108.457 E.28917
G1 X135.759 Y108.457 E.01677
G1 X128.642 Y101.34 E.31289
G1 X128.642 Y100.801 E.01678
G1 X136.298 Y108.457 E.33662
G1 X136.838 Y108.457 E.01677
G1 X128.523 Y100.142 E.36557
G1 X129.063 Y100.142 E.01678
G1 X137.377 Y108.457 E.36556
G1 X137.917 Y108.456 E.01677
G1 X129.603 Y100.142 E.36556
G1 X130.142 Y100.142 E.01678
G1 X138.456 Y108.456 E.36555
G1 X138.996 Y108.456 E.01677
G1 X130.682 Y100.142 E.36555
G1 X131.222 Y100.142 E.01678
G1 X139.535 Y108.456 E.36554
G1 X139.783 Y108.456 E.0077
G2 X139.948 Y108.329 I-.001 J-.173 E.00695
G1 X131.761 Y100.142 E.35995
G1 X132.301 Y100.143 E.01678
G1 X139.956 Y107.798 E.3366
G1 X139.956 Y107.259 E.01677
G1 X132.84 Y100.143 E.31288
G1 X133.38 Y100.143 E.01678
G1 X139.956 Y106.719 E.28915
G1 X139.956 Y106.18 E.01677
G1 X133.92 Y100.143 E.26542
G1 X134.459 Y100.143 E.01678
G1 X139.956 Y105.64 E.2417
G1 X139.956 Y105.1 E.01677
G1 X134.999 Y100.143 E.21797
G1 X135.539 Y100.143 E.01678
G1 X139.956 Y104.561 E.19425
G1 X139.956 Y104.021 E.01677
G1 X136.078 Y100.143 E.17052
G1 X136.618 Y100.143 E.01678
G1 X139.956 Y103.482 E.14679
G1 X139.956 Y102.942 E.01677
G1 X137.157 Y100.143 E.12307
G1 X137.697 Y100.143 E.01678
G1 X139.956 Y102.403 E.09934
G1 X139.956 Y101.863 E.01677
G1 X138.237 Y100.143 E.07562
G1 X138.776 Y100.143 E.01678
G1 X139.956 Y101.323 E.05189
G1 X139.956 Y100.784 E.01677
G1 X139.316 Y100.143 E.02816
G1 X139.793 Y100.143 E.01483
G3 X139.884 Y100.172 I-.006 J.176 E.00301
G3 X140.126 Y100.414 I-3.37 J3.621 E.01064
; WIPE_START
G1 X139.884 Y100.172 E-.12997
G1 X139.793 Y100.143 E-.03638
G1 X139.316 Y100.143 E-.18121
G1 X139.956 Y100.784 E-.34425
G1 X139.956 Y100.963 E-.06819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.536 Y102.751 Z1 F42000
G1 X108.197 Y108.615 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565996
G1 F6882.375
M204 S6000
G1 X108.24 Y109.027 E.01768
; LINE_WIDTH: 0.533827
G1 F7333.366
G1 X108.257 Y109.163 E.00548
; LINE_WIDTH: 0.499761
G1 F7880.21
G1 X108.274 Y109.299 E.0051
; LINE_WIDTH: 0.465695
G1 F8515.18
G1 X108.292 Y109.435 E.00472
; LINE_WIDTH: 0.428791
G1 F9329.548
G1 X108.311 Y109.573 E.00436
; LINE_WIDTH: 0.389013
G1 F10401.848
G1 X108.331 Y109.71 E.00391
; LINE_WIDTH: 0.349234
G1 F11752.65
G1 X108.351 Y109.847 E.00346
; LINE_WIDTH: 0.306703
G1 F13647.607
G1 X108.374 Y109.985 E.003
; LINE_WIDTH: 0.261428
G1 F15000
G1 X108.396 Y110.123 E.00248
; LINE_WIDTH: 0.216153
G1 X108.419 Y110.26 E.00197
; LINE_WIDTH: 0.169372
G1 X108.446 Y110.405 E.00151
; LINE_WIDTH: 0.121077
G1 X108.472 Y110.549 E.00093
; OBJECT_ID: 5
; WIPE_START
G1 X108.446 Y110.405 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X116.076 Y110.216 Z1 F42000
G1 X173.978 Y108.789 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.867 Y108.789 E.00369
G1 X173.773 Y109.083 E.01023
G1 X173.265 Y108.655 E.02206
G3 X173.11 Y108.307 I.349 J-.363 E.01292
G1 X173.109 Y100.683 E.25291
G2 X152.691 Y104.189 I-9.904 J3.527 E.97562
G1 X152.691 Y108.221 E.13376
G1 X152.468 Y108.241 E.00742
G3 X152.309 Y106.388 I11.044 J-1.881 E.06174
G3 X152.318 Y103.764 I65.927 J-1.09 E.08706
G3 X163.457 Y93.311 I10.887 J.44 E.56152
G3 X172.7 Y98.874 I-.291 J10.944 E.3742
G1 X173.199 Y99.808 E.03512
G1 X184.619 Y99.809 E.37881
G3 X185.09 Y100.289 I-.024 J.494 E.02454
G1 X185.09 Y108.317 E.26631
G3 X184.609 Y108.788 I-.494 J-.024 E.02454
G1 X174.038 Y108.789 E.35065
M204 S10000
G1 X174.219 Y109.196 F42000
G1 F8843.478
M204 S6000
G1 X174.164 Y109.196 E.00181
G3 X173.494 Y111.048 I-16.695 J-4.994 E.06535
G1 X173.302 Y111.006 E.00653
G1 X173.302 Y109.218 E.0593
G3 X172.85 Y108.791 I.999 J-1.508 E.02073
G3 X172.703 Y108.327 I.765 J-.498 E.01634
G1 X172.702 Y100.761 E.25099
G2 X153.098 Y104.193 I-9.499 J3.448 E.93582
G1 X153.098 Y111.005 E.22597
G1 X152.904 Y111.045 E.00658
G3 X151.902 Y106.393 I10.362 J-4.665 E.15906
G3 X151.911 Y103.748 I66.384 J-1.094 E.08772
G3 X163.467 Y92.904 I11.294 J.456 E.58251
G3 X173.055 Y98.675 I-.302 J11.354 E.38818
G1 X173.443 Y99.4 E.02731
G1 X184.635 Y99.402 E.37125
G3 X185.497 Y100.269 I-.041 J.902 E.04456
G1 X185.497 Y108.333 E.26751
G3 X184.629 Y109.195 I-.902 J-.041 E.04456
G1 X174.279 Y109.196 E.34334
M204 S250
G1 X174.451 Y109.588 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X172.91 Y112.904 I-12.028 J-3.574 E.11273
G1 X172.91 Y109.401 E.10764
G3 X172.311 Y108.346 I.808 J-1.156 E.03852
G1 X172.31 Y100.836 E.23078
G2 X153.49 Y104.196 I-9.108 J3.372 E.83135
G1 X153.49 Y112.907 E.26766
G3 X151.51 Y106.396 I9.911 J-6.571 E.21207
G3 X151.519 Y103.733 I66.874 J-1.098 E.08185
G3 X163.476 Y92.512 I11.686 J.472 E.55831
G3 X173.678 Y99.008 I-.288 J11.712 E.39054
G1 X184.65 Y99.01 E.33714
G3 X185.889 Y100.25 I-.057 J1.295 E.05914
G1 X185.889 Y108.349 E.24886
G3 X184.648 Y109.587 I-1.295 J-.057 E.05914
G1 X174.511 Y109.588 E.3115
M204 S10000
G1 X173.673 Y109.514 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.312765
G1 F13341.009
M204 S6000
G1 X173.639 Y109.735 E.0049
; LINE_WIDTH: 0.264615
G1 F15000
G1 X173.604 Y109.955 E.00403
; LINE_WIDTH: 0.216589
G1 X173.579 Y110.099 E.00208
; LINE_WIDTH: 0.168722
G1 X173.553 Y110.244 E.0015
; LINE_WIDTH: 0.120854
G1 X173.528 Y110.388 E.00093
M204 S10000
G1 X173.673 Y109.514 F42000
; LINE_WIDTH: 0.360915
G1 F11320.952
M204 S6000
G1 X173.707 Y109.294 E.00578
; WIPE_START
G1 X173.673 Y109.514 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.274 Y108.185 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42435
G1 F9438.167
M204 S6000
G2 X173.609 Y108.503 I2.255 J-2.038 E.01438
G1 X173.624 Y108.456 E.00153
G1 X174.085 Y108.456 E.01433
G1 X173.443 Y107.815 E.02819
G1 X173.443 Y107.275 E.01677
G1 X174.624 Y108.456 E.0519
G1 X175.164 Y108.456 E.01676
G1 X173.443 Y106.736 E.07562
G1 X173.443 Y106.196 E.01677
G1 X175.703 Y108.456 E.09933
G1 X176.242 Y108.456 E.01676
G1 X173.443 Y105.657 E.12304
G1 X173.443 Y105.117 E.01677
G1 X176.782 Y108.456 E.14675
G1 X177.321 Y108.456 E.01676
G1 X173.443 Y104.578 E.17046
G1 X173.443 Y104.038 E.01677
G1 X177.86 Y108.456 E.19418
G1 X178.4 Y108.456 E.01676
G1 X173.443 Y103.499 E.21789
G1 X173.443 Y102.959 E.01677
G1 X178.939 Y108.456 E.2416
G1 X179.478 Y108.455 E.01676
G1 X173.443 Y102.42 E.26531
G1 X173.443 Y101.88 E.01677
G1 X180.018 Y108.455 E.28902
G1 X180.557 Y108.455 E.01676
G1 X173.442 Y101.341 E.31274
G1 X173.442 Y100.801 E.01677
G1 X181.097 Y108.455 E.33645
G1 X181.636 Y108.455 E.01676
G1 X173.321 Y100.141 E.36547
G1 X173.861 Y100.141 E.01677
G1 X182.175 Y108.455 E.36547
G1 X182.715 Y108.455 E.01676
G1 X174.4 Y100.141 E.36546
G1 X174.94 Y100.141 E.01677
G1 X183.254 Y108.455 E.36546
G1 X183.793 Y108.455 E.01676
G1 X175.479 Y100.141 E.36545
G1 X176.019 Y100.141 E.01677
G1 X184.333 Y108.455 E.36545
G1 X184.568 Y108.455 E.00732
G2 X184.747 Y108.33 I.021 J-.161 E.00744
G1 X176.558 Y100.141 E.35996
G1 X177.098 Y100.141 E.01677
G1 X184.756 Y107.8 E.33665
G1 X184.756 Y107.26 E.01677
G1 X177.637 Y100.141 E.31293
G1 X178.177 Y100.141 E.01677
G1 X184.756 Y106.721 E.28922
G1 X184.756 Y106.182 E.01677
G1 X178.716 Y100.141 E.2655
G1 X179.256 Y100.141 E.01677
G1 X184.756 Y105.642 E.24179
G1 X184.756 Y105.103 E.01677
G1 X179.795 Y100.141 E.21808
G1 X180.335 Y100.142 E.01677
G1 X184.756 Y104.563 E.19436
G1 X184.756 Y104.024 E.01677
G1 X180.874 Y100.142 E.17065
G1 X181.414 Y100.142 E.01677
G1 X184.756 Y103.484 E.14694
G1 X184.756 Y102.945 E.01677
G1 X181.953 Y100.142 E.12322
G1 X182.493 Y100.142 E.01677
G1 X184.756 Y102.406 E.09951
G1 X184.756 Y101.866 E.01677
G1 X183.032 Y100.142 E.0758
G1 X183.572 Y100.142 E.01677
G1 X184.756 Y101.327 E.05208
G1 X184.756 Y100.787 E.01677
G1 X184.111 Y100.142 E.02837
G1 X184.586 Y100.142 E.01477
G3 X184.675 Y100.167 I.005 J.155 E.00291
G1 X184.926 Y100.418 E.01103
; WIPE_START
G1 X184.675 Y100.167 E-.13483
G1 X184.586 Y100.142 E-.03509
G1 X184.111 Y100.142 E-.18057
G1 X184.756 Y100.787 E-.34683
G1 X184.756 Y100.952 E-.06267
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.322 Y102.682 Z1 F42000
G1 X152.596 Y108.434 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556668
G1 F7007.338
M204 S6000
G1 X152.65 Y108.931 E.02094
; LINE_WIDTH: 0.513546
G1 F7649.4
G1 X152.668 Y109.073 E.0055
; LINE_WIDTH: 0.477076
G1 F8291.961
G1 X152.686 Y109.215 E.00507
; LINE_WIDTH: 0.440606
G1 F9052.374
G1 X152.705 Y109.357 E.00464
; LINE_WIDTH: 0.401128
G1 F10050.05
G1 X152.726 Y109.501 E.00422
; LINE_WIDTH: 0.358662
G1 F11401.729
G1 X152.747 Y109.644 E.00372
; LINE_WIDTH: 0.316196
G1 F13173.494
G1 X152.768 Y109.787 E.00322
; LINE_WIDTH: 0.270672
G1 F15000
G1 X152.793 Y109.931 E.00271
; LINE_WIDTH: 0.222096
G1 X152.817 Y110.075 E.00214
; LINE_WIDTH: 0.173519
G1 X152.841 Y110.22 E.00156
; LINE_WIDTH: 0.136162
G1 X152.857 Y110.302 E.00064
; LINE_WIDTH: 0.110005
G1 X152.872 Y110.385 E.00046
; OBJECT_ID: 6
; WIPE_START
G1 X152.857 Y110.302 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X160.487 Y110.129 Z1 F42000
G1 X219.315 Y108.79 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.202 Y108.79 E.00377
G1 X219.118 Y109.037 E.00866
G1 X218.665 Y108.655 E.01966
G3 X218.51 Y108.317 I.352 J-.365 E.0126
G1 X218.509 Y100.933 E.24497
G2 X197.491 Y104.489 I-10.204 J3.579 E1.00521
G1 X197.491 Y107.948 E.11473
G1 X197.264 Y107.964 E.00755
G3 X197.109 Y106.088 I14.816 J-2.165 E.06246
G3 X197.144 Y103.613 I31.437 J-.79 E.08215
G3 X208.906 Y93.324 I11.161 J.892 E.57373
G3 X217.979 Y98.882 I-.616 J11.19 E.36777
G1 X218.492 Y99.808 E.03509
G1 X230.019 Y99.809 E.38238
G3 X230.49 Y100.29 I-.024 J.494 E.02454
G1 X230.49 Y108.318 E.26631
G3 X230.009 Y108.788 I-.497 J-.027 E.0245
G1 X219.375 Y108.79 E.35275
M204 S10000
G1 X219.549 Y109.197 F42000
G1 F8843.478
M204 S6000
G1 X219.494 Y109.197 E.00185
G3 X218.898 Y110.81 I-15.245 J-4.713 E.05708
G1 X218.702 Y110.77 E.00662
G1 X218.702 Y109.219 E.05147
G3 X218.251 Y108.791 I.999 J-1.508 E.02073
G3 X218.103 Y108.333 I.799 J-.51 E.01614
G1 X218.102 Y101.009 E.24296
G2 X197.898 Y104.493 I-9.799 J3.501 E.96537
G1 X197.898 Y110.768 E.20817
G1 X197.704 Y110.809 E.00656
G3 X196.702 Y106.093 I10.646 J-4.727 E.16113
G3 X196.739 Y103.581 I31.82 J-.794 E.08336
G3 X208.928 Y92.918 I11.567 J.924 E.5946
G3 X218.331 Y98.678 I-.638 J11.597 E.38115
G1 X218.732 Y99.401 E.0274
G1 X230.035 Y99.402 E.37495
G3 X230.897 Y100.27 I-.041 J.902 E.04456
G1 X230.897 Y108.334 E.26751
G3 X230.029 Y109.195 I-.909 J-.048 E.04448
G1 X219.609 Y109.197 E.34564
M204 S250
G1 X219.775 Y109.589 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X218.31 Y112.695 I-12.291 J-3.897 E.10584
G1 X218.31 Y109.401 E.10121
G3 X217.711 Y108.349 I.809 J-1.157 E.03846
G1 X217.71 Y101.083 E.22325
G2 X198.29 Y104.497 I-9.408 J3.426 E.8587
G1 X198.29 Y112.695 E.2519
G3 X197.852 Y111.979 I11.408 J-7.469 E.02577
G3 X196.31 Y106.097 I10.501 J-5.897 E.18891
G3 X196.348 Y103.549 I32.186 J-.798 E.0783
G3 X208.949 Y92.526 I11.958 J.956 E.56939
G3 X218.963 Y99.009 I-.692 J12.044 E.3834
G1 X230.05 Y99.01 E.34069
G3 X231.289 Y100.25 I-.057 J1.295 E.05914
G1 X231.289 Y108.349 E.24886
G3 X230.048 Y109.588 I-1.306 J-.068 E.05902
G1 X219.835 Y109.589 E.31383
M204 S10000
G1 X219.048 Y109.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308117
G1 F13574.815
M204 S6000
G1 X219.075 Y109.267 E.00362
M204 S10000
G1 X219.048 Y109.433 F42000
; LINE_WIDTH: 0.267135
G1 F15000
M204 S6000
G1 X219.021 Y109.598 E.00306
; LINE_WIDTH: 0.226153
G1 X218.994 Y109.764 E.0025
; LINE_WIDTH: 0.185171
G1 X218.966 Y109.929 E.00194
; LINE_WIDTH: 0.147745
G1 X218.947 Y110.035 E.00092
; LINE_WIDTH: 0.113862
G1 X218.928 Y110.14 E.00062
M204 S10000
G1 X218.757 Y110.982 F42000
; LINE_WIDTH: 0.454245
G1 F8752.21
M204 S6000
G1 X218.547 Y111.931 E.03258
; WIPE_START
G1 X218.757 Y110.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X218.674 Y108.185 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42433
G1 F9438.662
M204 S6000
G2 X218.961 Y108.462 I1.985 J-1.769 E.01241
G1 X219.485 Y108.456 E.01628
G1 X218.843 Y107.815 E.02818
G1 X218.843 Y107.276 E.01677
G1 X220.024 Y108.456 E.05189
G1 X220.563 Y108.456 E.01676
G1 X218.843 Y106.736 E.0756
G1 X218.843 Y106.197 E.01677
G1 X221.103 Y108.456 E.09931
G1 X221.642 Y108.456 E.01676
G1 X218.843 Y105.657 E.12302
G1 X218.843 Y105.118 E.01677
G1 X222.181 Y108.456 E.14673
G1 X222.721 Y108.456 E.01676
G1 X218.843 Y104.578 E.17044
G1 X218.843 Y104.039 E.01677
G1 X223.26 Y108.456 E.19415
G1 X223.799 Y108.456 E.01676
G1 X218.843 Y103.499 E.21786
G1 X218.843 Y102.96 E.01677
G1 X224.339 Y108.456 E.24157
G1 X224.878 Y108.456 E.01676
G1 X218.843 Y102.42 E.26528
G1 X218.842 Y101.881 E.01677
G1 X225.417 Y108.456 E.28899
G1 X225.957 Y108.456 E.01676
G1 X218.842 Y101.341 E.3127
G1 X218.842 Y100.87 E.01466
G1 X218.799 Y100.759 E.00371
G1 X226.496 Y108.456 E.33831
G1 X227.035 Y108.455 E.01676
G1 X218.721 Y100.141 E.36545
G1 X219.26 Y100.141 E.01677
G1 X227.575 Y108.455 E.36545
G1 X228.114 Y108.455 E.01676
G1 X219.8 Y100.141 E.36544
G1 X220.339 Y100.141 E.01677
G1 X228.653 Y108.455 E.36544
G1 X229.193 Y108.455 E.01676
G1 X220.879 Y100.141 E.36543
G1 X221.418 Y100.141 E.01677
G1 X229.732 Y108.455 E.36543
G1 X229.968 Y108.455 E.00734
G2 X230.149 Y108.332 I.022 J-.162 E.00742
G1 X221.958 Y100.141 E.36003
G1 X222.497 Y100.141 E.01677
G1 X230.156 Y107.801 E.33666
G1 X230.156 Y107.261 E.01676
G1 X223.036 Y100.142 E.31295
G1 X223.576 Y100.142 E.01677
G1 X230.156 Y106.722 E.28924
G1 X230.156 Y106.183 E.01676
G1 X224.115 Y100.142 E.26553
G1 X224.655 Y100.142 E.01677
G1 X230.156 Y105.643 E.24182
G1 X230.156 Y105.104 E.01676
G1 X225.194 Y100.142 E.21811
G1 X225.734 Y100.142 E.01677
G1 X230.156 Y104.565 E.1944
G1 X230.156 Y104.025 E.01676
G1 X226.273 Y100.142 E.17068
G1 X226.813 Y100.142 E.01677
G1 X230.156 Y103.486 E.14697
G1 X230.156 Y102.946 E.01676
G1 X227.352 Y100.142 E.12326
G1 X227.892 Y100.142 E.01677
G1 X230.156 Y102.407 E.09955
G1 X230.156 Y101.868 E.01676
G1 X228.431 Y100.142 E.07584
G1 X228.97 Y100.142 E.01677
G1 X230.156 Y101.328 E.05213
G1 X230.156 Y100.789 E.01676
G1 X229.51 Y100.142 E.02842
G1 X229.988 Y100.142 E.01485
G3 X230.072 Y100.165 I.003 J.157 E.00275
G1 X230.326 Y100.419 E.01117
; WIPE_START
G1 X230.072 Y100.165 E-.1366
M73 P42 R15
G1 X229.988 Y100.142 E-.03317
G1 X229.51 Y100.142 E-.18154
G1 X230.156 Y100.789 E-.34746
G1 X230.156 Y100.95 E-.06124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X222.702 Y102.59 Z1 F42000
G1 X197.395 Y108.158 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56583
G1 F6884.56
M204 S6000
G1 X197.427 Y108.451 E.01253
; LINE_WIDTH: 0.531088
G1 F7374.514
G1 X197.459 Y108.743 E.01169
; LINE_WIDTH: 0.494336
G1 F7974.906
G1 X197.478 Y108.892 E.00552
; LINE_WIDTH: 0.455568
G1 F8724.145
G1 X197.498 Y109.04 E.00504
; LINE_WIDTH: 0.4168
G1 F9628.764
G1 X197.517 Y109.189 E.00457
; LINE_WIDTH: 0.374853
G1 F10845.562
G1 X197.54 Y109.339 E.00409
; LINE_WIDTH: 0.329759
G1 F12550.595
G1 X197.562 Y109.488 E.00354
; LINE_WIDTH: 0.284665
G1 F14891.726
G1 X197.585 Y109.638 E.00298
; LINE_WIDTH: 0.242805
G1 F15000
G1 X197.604 Y109.751 E.00186
; LINE_WIDTH: 0.204216
G1 X197.623 Y109.864 E.0015
; LINE_WIDTH: 0.165626
G1 X197.643 Y109.976 E.00114
; LINE_WIDTH: 0.127036
G1 X197.662 Y110.089 E.00078
; LINE_WIDTH: 0.102329
G1 X197.672 Y110.144 E.00027
; OBJECT_ID: 9
; WIPE_START
G1 X197.662 Y110.089 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X192.542 Y115.749 Z1 F42000
G1 X137.415 Y176.69 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.302 Y176.69 E.00377
G1 X137.218 Y176.937 E.00866
G1 X136.765 Y176.555 E.01966
G3 X136.61 Y176.208 I.349 J-.363 E.01293
G1 X136.609 Y168.832 E.24465
G2 X115.591 Y172.389 I-10.204 J3.579 E1.00521
G1 X115.591 Y175.848 E.11473
G1 X115.364 Y175.864 E.00755
G3 X115.209 Y173.989 I14.828 J-2.166 E.06245
G3 X115.244 Y171.513 I31.422 J-.79 E.08215
G3 X126.615 Y161.211 I11.159 J.891 E.56075
G3 X136.079 Y166.782 I-.245 J11.239 E.3806
G1 X136.592 Y167.708 E.0351
G1 X148.158 Y167.712 E.38365
G3 X148.59 Y168.189 I-.072 J.5 E.02316
G1 X148.59 Y176.218 E.26633
G3 X148.109 Y176.688 I-.494 J-.024 E.02453
G1 X137.475 Y176.69 E.35275
M204 S10000
G1 X137.649 Y177.097 F42000
G1 F8843.478
M204 S6000
G1 X137.594 Y177.097 E.00185
G3 X136.998 Y178.71 I-15.249 J-4.714 E.05708
G1 X136.802 Y178.67 E.00662
G1 X136.802 Y177.119 E.05147
G3 X136.35 Y176.691 I.998 J-1.507 E.02073
G3 X136.203 Y176.227 I.756 J-.495 E.01635
G1 X136.202 Y168.909 E.24276
G2 X115.998 Y172.393 I-9.799 J3.501 E.96537
G1 X115.998 Y178.668 E.20816
G1 X115.804 Y178.709 E.00656
G3 X114.802 Y173.992 I10.646 J-4.727 E.16113
G3 X114.839 Y171.481 I31.795 J-.794 E.08335
G3 X126.629 Y160.804 I11.565 J.923 E.58136
G3 X136.431 Y166.578 I-.259 J11.648 E.39424
G1 X136.832 Y167.301 E.02741
G1 X148.135 Y167.302 E.37495
G3 X148.997 Y168.169 I-.041 J.902 E.04455
G1 X148.997 Y176.234 E.26752
G3 X148.129 Y177.095 I-.902 J-.041 E.04455
G1 X137.709 Y177.097 E.34565
M204 S250
G1 X137.875 Y177.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X136.41 Y180.595 I-12.294 J-3.899 E.10584
G1 X136.41 Y177.301 E.10121
G3 X135.811 Y176.247 I.808 J-1.156 E.03852
G1 X135.81 Y168.983 E.22319
G2 X116.39 Y172.397 I-9.408 J3.426 E.8587
G1 X116.39 Y180.595 E.2519
G3 X114.41 Y173.997 I10.203 J-6.658 E.2146
G3 X114.448 Y171.45 I32.167 J-.798 E.07829
G3 X126.643 Y160.412 I11.956 J.954 E.5569
G3 X137.063 Y166.909 I-.252 J12.009 E.39604
G1 X148.151 Y166.91 E.3407
G3 X149.389 Y168.15 I-.057 J1.295 E.05912
G1 X149.389 Y176.249 E.24887
G3 X148.148 Y177.488 I-1.295 J-.057 E.05913
G1 X137.935 Y177.489 E.31384
M204 S10000
G1 X137.148 Y177.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308118
G1 F13574.78
M204 S6000
G1 X137.175 Y177.167 E.00362
M204 S10000
G1 X137.148 Y177.333 F42000
; LINE_WIDTH: 0.267142
G1 F15000
M204 S6000
G1 X137.121 Y177.498 E.00306
; LINE_WIDTH: 0.226165
G1 X137.094 Y177.664 E.0025
; LINE_WIDTH: 0.185189
G1 X137.067 Y177.829 E.00194
; LINE_WIDTH: 0.147745
G1 X137.047 Y177.935 E.00092
; LINE_WIDTH: 0.113862
G1 X137.028 Y178.04 E.00062
; WIPE_START
G1 X137.047 Y177.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.774 Y176.085 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42433
G1 F9438.662
M204 S6000
G2 X137.061 Y176.362 I1.984 J-1.768 E.01241
G1 X137.585 Y176.356 E.01628
G1 X136.943 Y175.715 E.02818
G1 X136.943 Y175.176 E.01677
G1 X138.124 Y176.356 E.05189
G1 X138.663 Y176.356 E.01676
G1 X136.943 Y174.636 E.0756
G1 X136.943 Y174.097 E.01677
G1 X139.203 Y176.356 E.09931
G1 X139.742 Y176.356 E.01676
G1 X136.943 Y173.557 E.12302
G1 X136.943 Y173.018 E.01677
G1 X140.281 Y176.356 E.14673
G1 X140.821 Y176.356 E.01676
G1 X136.943 Y172.478 E.17044
G1 X136.943 Y171.939 E.01677
G1 X141.36 Y176.356 E.19415
G1 X141.899 Y176.356 E.01676
G1 X136.943 Y171.399 E.21786
G1 X136.943 Y170.86 E.01677
G1 X142.439 Y176.356 E.24157
G1 X142.978 Y176.356 E.01676
G1 X136.943 Y170.32 E.26528
G1 X136.943 Y169.781 E.01677
G1 X143.517 Y176.356 E.28899
G1 X144.057 Y176.356 E.01676
G1 X136.942 Y169.241 E.31269
G1 X136.942 Y168.77 E.01466
G1 X136.899 Y168.659 E.00371
G1 X144.596 Y176.356 E.33831
G1 X145.135 Y176.355 E.01676
G1 X136.821 Y168.041 E.36545
G1 X137.36 Y168.041 E.01677
G1 X145.675 Y176.355 E.36545
G1 X146.214 Y176.355 E.01676
G1 X137.9 Y168.041 E.36544
G1 X138.439 Y168.041 E.01677
G1 X146.753 Y176.355 E.36544
G1 X147.293 Y176.355 E.01676
G1 X138.979 Y168.041 E.36543
G1 X139.518 Y168.041 E.01677
G1 X147.832 Y176.355 E.36542
G1 X148.084 Y176.355 E.00783
G2 X148.248 Y176.232 I.004 J-.165 E.00688
G1 X140.058 Y168.041 E.36
G1 X140.597 Y168.041 E.01677
G1 X148.256 Y175.701 E.33666
G1 X148.256 Y175.162 E.01676
G1 X141.136 Y168.042 E.31295
G1 X141.676 Y168.042 E.01677
G1 X148.256 Y174.622 E.28924
G1 X148.256 Y174.083 E.01676
G1 X142.215 Y168.042 E.26553
G1 X142.755 Y168.042 E.01677
G1 X148.256 Y173.543 E.24182
G1 X148.256 Y173.004 E.01676
G1 X143.294 Y168.042 E.21811
G1 X143.834 Y168.042 E.01677
G1 X148.256 Y172.465 E.1944
G1 X148.256 Y171.925 E.01676
G1 X144.373 Y168.042 E.17069
G1 X144.913 Y168.042 E.01677
G1 X148.256 Y171.386 E.14697
G1 X148.256 Y170.846 E.01676
G1 X145.452 Y168.042 E.12326
G1 X145.992 Y168.042 E.01677
G1 X148.256 Y170.307 E.09955
G1 X148.256 Y169.768 E.01676
G1 X146.531 Y168.042 E.07584
G1 X147.07 Y168.042 E.01677
G1 X148.256 Y169.228 E.05213
G1 X148.256 Y168.689 E.01676
G1 X147.61 Y168.042 E.02842
G1 X148.088 Y168.042 E.01485
G3 X148.172 Y168.065 I.003 J.156 E.00274
G1 X148.426 Y168.319 E.01118
; WIPE_START
G1 X148.172 Y168.065 E-.1367
G1 X148.088 Y168.042 E-.0331
G1 X147.61 Y168.042 E-.18154
G1 X148.256 Y168.689 E-.34748
G1 X148.256 Y168.85 E-.06119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.802 Y170.49 Z1 F42000
G1 X115.495 Y176.059 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565836
G1 F6884.481
M204 S6000
G1 X115.527 Y176.351 E.01252
; LINE_WIDTH: 0.531106
G1 F7374.242
G1 X115.559 Y176.643 E.01169
; LINE_WIDTH: 0.494356
G1 F7974.56
G1 X115.578 Y176.792 E.00552
; LINE_WIDTH: 0.455547
G1 F8724.594
G1 X115.598 Y176.94 E.00505
; LINE_WIDTH: 0.416738
G1 F9630.362
G1 X115.617 Y177.089 E.00457
; LINE_WIDTH: 0.374817
G1 F10846.747
G1 X115.64 Y177.239 E.00409
; LINE_WIDTH: 0.329771
G1 F12550.106
G1 X115.662 Y177.388 E.00353
; LINE_WIDTH: 0.284724
G1 F14888.116
G1 X115.685 Y177.538 E.00298
; LINE_WIDTH: 0.242915
G1 F15000
G1 X115.704 Y177.651 E.00187
; LINE_WIDTH: 0.204305
G1 X115.723 Y177.763 E.00151
; LINE_WIDTH: 0.165694
G1 X115.743 Y177.876 E.00115
; LINE_WIDTH: 0.127084
G1 X115.762 Y177.989 E.00078
; LINE_WIDTH: 0.102359
G1 X115.772 Y178.044 E.00027
; OBJECT_ID: 8
; WIPE_START
G1 X115.762 Y177.989 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X108.141 Y177.571 Z1 F42000
G1 X92.078 Y176.689 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.967 Y176.689 E.00368
G1 X91.873 Y176.983 E.01023
G1 X91.365 Y176.555 E.02206
G3 X91.21 Y176.214 I.351 J-.364 E.01269
G1 X91.209 Y168.583 E.25315
G2 X70.791 Y172.089 I-9.904 J3.527 E.97562
G1 X70.791 Y176.121 E.13376
G1 X70.568 Y176.141 E.00742
G3 X70.409 Y174.288 I11.048 J-1.882 E.06174
G3 X70.418 Y171.664 I65.935 J-1.09 E.08706
G3 X81.557 Y161.211 I10.887 J.44 E.56151
G3 X90.8 Y166.774 I-.291 J10.944 E.3742
G1 X91.299 Y167.708 E.03512
G1 X102.709 Y167.709 E.37849
G3 X103.19 Y168.189 I-.013 J.494 E.02486
G1 X103.19 Y176.218 E.26631
G3 X102.716 Y176.688 I-.497 J-.027 E.02427
G1 X92.138 Y176.689 E.35089
M204 S10000
G1 X92.319 Y177.096 F42000
G1 F8843.478
M204 S6000
G1 X92.264 Y177.096 E.00181
G3 X91.594 Y178.948 I-16.702 J-4.997 E.06535
G1 X91.402 Y178.906 E.00653
G1 X91.402 Y177.118 E.0593
G3 X90.95 Y176.691 I.998 J-1.507 E.02074
G3 X90.803 Y176.231 I.798 J-.509 E.01618
G1 X90.802 Y168.661 E.25113
G2 X71.198 Y172.093 I-9.499 J3.448 E.93582
G1 X71.198 Y178.901 E.22585
G1 X71.004 Y178.942 E.00657
G3 X70.002 Y174.293 I10.318 J-4.657 E.15896
G3 X70.011 Y171.648 I66.388 J-1.094 E.08773
G3 X81.567 Y160.804 I11.294 J.456 E.58251
G3 X91.155 Y166.575 I-.302 J11.354 E.38819
G1 X91.543 Y167.3 E.0273
G1 X102.729 Y167.302 E.37105
G3 X103.597 Y168.169 I-.034 J.902 E.04475
G1 X103.597 Y176.234 E.26751
G3 X102.733 Y177.095 I-.91 J-.048 E.04433
G1 X92.379 Y177.096 E.34348
M204 S250
G1 X92.551 Y177.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X91.01 Y180.804 I-12.031 J-3.575 E.11273
G1 X91.01 Y177.301 E.10764
G3 X90.411 Y176.248 I.808 J-1.157 E.03848
G1 X90.41 Y168.736 E.23082
G2 X71.59 Y172.096 I-9.108 J3.372 E.83135
G1 X71.59 Y180.807 E.26766
G3 X69.61 Y174.296 I9.911 J-6.571 E.21207
G3 X69.619 Y171.633 I66.874 J-1.098 E.08186
G3 X81.576 Y160.412 I11.686 J.472 E.55831
G3 X91.778 Y166.908 I-.288 J11.712 E.39054
G1 X102.748 Y166.91 E.33708
G3 X103.989 Y168.15 I-.055 J1.295 E.0592
G1 X103.989 Y176.249 E.24886
G3 X102.75 Y177.487 I-1.306 J-.068 E.05897
G1 X92.611 Y177.488 E.31155
M204 S10000
G1 X91.773 Y177.414 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.312676
G1 F13345.389
M204 S6000
G1 X91.739 Y177.635 E.0049
; LINE_WIDTH: 0.264452
G1 F15000
G1 X91.704 Y177.855 E.00403
; LINE_WIDTH: 0.216431
G1 X91.679 Y178 E.00207
; LINE_WIDTH: 0.168627
G1 X91.653 Y178.144 E.0015
; LINE_WIDTH: 0.120823
G1 X91.628 Y178.288 E.00093
M204 S10000
G1 X91.773 Y177.414 F42000
; LINE_WIDTH: 0.360901
G1 F11321.46
M204 S6000
G1 X91.807 Y177.194 E.00578
; WIPE_START
G1 X91.773 Y177.414 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.374 Y176.085 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42449
G1 F9434.704
M204 S6000
G2 X91.709 Y176.403 I2.256 J-2.039 E.01439
G1 X91.724 Y176.356 E.00153
G1 X92.185 Y176.356 E.01434
G1 X91.543 Y175.715 E.02821
G1 X91.543 Y175.175 E.01678
G1 X92.725 Y176.356 E.05194
G1 X93.264 Y176.356 E.01678
G1 X91.543 Y174.635 E.07567
G1 X91.543 Y174.095 E.01678
G1 X93.804 Y176.356 E.0994
G1 X94.343 Y176.356 E.01678
G1 X91.543 Y173.556 E.12313
G1 X91.543 Y173.016 E.01678
G1 X94.883 Y176.356 E.14686
G1 X95.422 Y176.356 E.01678
G1 X91.543 Y172.476 E.17059
G1 X91.543 Y171.937 E.01678
G1 X95.962 Y176.356 E.19432
G1 X96.501 Y176.356 E.01678
G1 X91.543 Y171.397 E.21805
G1 X91.543 Y170.857 E.01678
G1 X97.041 Y176.356 E.24178
G1 X97.581 Y176.355 E.01678
G1 X91.543 Y170.317 E.2655
G1 X91.543 Y169.778 E.01678
G1 X98.12 Y176.355 E.28923
G1 X98.66 Y176.355 E.01678
G1 X91.542 Y169.238 E.31296
G1 X91.542 Y168.698 E.01678
G1 X99.199 Y176.355 E.33669
G1 X99.739 Y176.355 E.01678
G1 X91.424 Y168.041 E.36561
G1 X91.964 Y168.041 E.01678
G1 X100.278 Y176.355 E.3656
G1 X100.818 Y176.355 E.01678
G1 X92.504 Y168.041 E.36559
G1 X93.043 Y168.041 E.01678
G1 X101.358 Y176.355 E.36559
G1 X101.897 Y176.355 E.01678
G1 X93.583 Y168.041 E.36558
G1 X94.123 Y168.041 E.01678
G1 X102.437 Y176.355 E.36558
G1 X102.673 Y176.355 E.00736
G2 X102.85 Y176.228 I.017 J-.162 E.00739
G1 X94.662 Y168.041 E.36001
G1 X95.202 Y168.041 E.01678
G1 X102.856 Y175.695 E.33658
G1 X102.856 Y175.156 E.01678
G1 X95.742 Y168.041 E.31285
G1 X96.282 Y168.041 E.01678
G1 X102.856 Y174.616 E.28912
G1 X102.856 Y174.077 E.01678
G1 X96.821 Y168.041 E.26538
G1 X97.361 Y168.041 E.01678
G1 X102.856 Y173.537 E.24165
G1 X102.856 Y172.997 E.01678
G1 X97.901 Y168.041 E.21792
G1 X98.44 Y168.042 E.01678
G1 X102.856 Y172.458 E.19419
G1 X102.856 Y171.918 E.01678
G1 X98.98 Y168.042 E.17046
G1 X99.52 Y168.042 E.01678
G1 X102.856 Y171.378 E.14673
G1 X102.856 Y170.839 E.01678
G1 X100.059 Y168.042 E.123
G1 X100.599 Y168.042 E.01678
G1 X102.856 Y170.299 E.09927
G1 X102.856 Y169.76 E.01678
G1 X101.139 Y168.042 E.07554
G1 X101.678 Y168.042 E.01678
G1 X102.856 Y169.22 E.05181
G1 X102.856 Y168.68 E.01678
G1 X102.218 Y168.042 E.02808
G1 X102.682 Y168.042 E.01442
G3 X102.789 Y168.074 I.002 J.19 E.00353
G1 X103.026 Y168.31 E.01042
; WIPE_START
G1 X102.789 Y168.074 E-.1273
G1 X102.682 Y168.042 E-.04256
G1 X102.218 Y168.042 E-.17621
G1 X102.856 Y168.68 E-.34311
G1 X102.856 Y168.867 E-.07081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.422 Y170.593 Z1 F42000
G1 X70.696 Y176.334 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556667
G1 F7007.347
M204 S6000
G1 X70.75 Y176.831 E.02092
; LINE_WIDTH: 0.513592
G1 F7648.639
G1 X70.768 Y176.973 E.0055
; LINE_WIDTH: 0.477096
G1 F8291.571
G1 X70.786 Y177.115 E.00507
; LINE_WIDTH: 0.4406
G1 F9052.511
G1 X70.805 Y177.258 E.00465
; LINE_WIDTH: 0.401097
G1 F10050.901
G1 X70.826 Y177.401 E.00423
; LINE_WIDTH: 0.358611
G1 F11403.579
G1 X70.847 Y177.544 E.00372
; LINE_WIDTH: 0.316124
G1 F13176.968
G1 X70.868 Y177.687 E.00322
; LINE_WIDTH: 0.27064
G1 F15000
G1 X70.893 Y177.831 E.00271
; LINE_WIDTH: 0.222119
G1 X70.917 Y177.975 E.00213
; LINE_WIDTH: 0.173599
G1 X70.941 Y178.119 E.00156
; LINE_WIDTH: 0.136236
G1 X70.957 Y178.202 E.00064
; LINE_WIDTH: 0.110028
G1 X70.972 Y178.285 E.00046
; OBJECT_ID: 7
; WIPE_START
G1 X70.957 Y178.202 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X63.34 Y177.715 Z1 F42000
G1 X47.315 Y176.691 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X47.21 Y176.691 E.00348
G1 X47.11 Y177.015 E.01127
G1 X46.565 Y176.556 E.02364
G3 X46.41 Y176.209 I.349 J-.363 E.01292
G1 X46.409 Y168.419 E.25841
G2 X26.391 Y171.89 I-9.704 J3.493 E.95591
G1 X26.391 Y176.302 E.14636
G1 X26.168 Y176.322 E.00743
G3 X26.009 Y174.49 I10.798 J-1.857 E.06107
G3 X26.018 Y171.478 I76.373 J-1.29 E.0999
G3 X37.188 Y161.22 I10.702 J.442 E.55898
G3 X46.082 Y166.775 I-.523 J10.735 E.36336
G1 X46.569 Y167.709 E.03494
G1 X57.919 Y167.71 E.37651
G3 X58.39 Y168.191 I-.027 J.497 E.0245
G1 X58.39 Y176.219 E.26631
G3 X57.919 Y176.689 I-.498 J-.027 E.02417
G1 X47.375 Y176.691 E.34977
M204 S10000
G1 X47.562 Y177.098 F42000
G1 F8843.478
M204 S6000
G1 X47.51 Y177.098 E.0017
G3 X46.797 Y179.106 I-15.463 J-4.361 E.07076
G1 X46.602 Y179.066 E.0066
G1 X46.602 Y177.12 E.06457
G3 X46.15 Y176.692 I.998 J-1.507 E.02073
G3 X46.003 Y176.229 I.765 J-.498 E.01634
G1 X46.002 Y168.497 E.25646
G2 X26.798 Y171.894 I-9.299 J3.413 E.91613
G1 X26.798 Y179.068 E.23799
G1 X26.603 Y179.108 E.00661
G3 X25.602 Y174.493 I10.219 J-4.631 E.15782
G3 X25.611 Y171.462 I76.88 J-1.294 E.10055
G3 X37.207 Y160.814 I11.109 J.459 E.58028
G3 X46.439 Y166.579 I-.543 J11.144 E.37719
G1 X46.816 Y167.302 E.02702
G1 X57.935 Y167.303 E.36885
G3 X58.797 Y168.171 I-.048 J.909 E.04448
G1 X58.797 Y176.235 E.2675
G3 X57.935 Y177.097 I-.91 J-.048 E.04428
G1 X47.622 Y177.098 E.34212
M204 S250
G1 X47.799 Y177.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X46.21 Y180.944 I-11.302 J-3.106 E.11736
G1 X46.21 Y177.302 E.11192
G3 X45.611 Y176.248 I.808 J-1.156 E.03852
G1 X45.61 Y168.573 E.23582
G2 X27.19 Y171.898 I-8.908 J3.336 E.81314
G1 X27.19 Y180.944 E.27798
G3 X25.21 Y174.497 I9.672 J-6.498 E.21023
G3 X25.219 Y171.447 I77.355 J-1.298 E.09374
G3 X37.225 Y160.422 I11.502 J.475 E.55651
G3 X47.054 Y166.91 I-.537 J11.503 E.37985
G1 X57.95 Y166.911 E.33483
G3 X59.189 Y168.151 I-.068 J1.306 E.05902
G1 X59.189 Y176.25 E.24885
G3 X57.951 Y177.489 I-1.306 J-.068 E.05896
G1 X47.859 Y177.49 E.31008
M204 S10000
G1 X46.994 Y177.44 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.351916
G1 F11650.663
M204 S6000
G1 X46.96 Y177.667 E.00578
; LINE_WIDTH: 0.305372
G1 F13716.807
G1 X46.925 Y177.893 E.00491
; LINE_WIDTH: 0.262978
G1 F15000
G1 X46.906 Y178.007 E.00207
; LINE_WIDTH: 0.224763
M73 P43 R15
G1 X46.887 Y178.121 E.00171
; LINE_WIDTH: 0.186548
G1 X46.868 Y178.234 E.00135
; LINE_WIDTH: 0.149807
G1 X46.848 Y178.341 E.00095
; LINE_WIDTH: 0.114549
G1 X46.828 Y178.449 E.00064
M204 S10000
G1 X46.994 Y177.44 F42000
; LINE_WIDTH: 0.398459
G1 F10125.477
M204 S6000
G1 X47.028 Y177.213 E.00665
; WIPE_START
G1 X46.994 Y177.44 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.574 Y176.086 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42445
G1 F9435.693
M204 S6000
G2 X46.942 Y176.432 I2.437 J-2.221 E.01571
G1 X46.965 Y176.357 E.00243
G1 X47.385 Y176.357 E.01306
G1 X46.743 Y175.716 E.0282
G1 X46.743 Y175.176 E.01678
G1 X47.924 Y176.357 E.05192
G1 X48.464 Y176.357 E.01677
G1 X46.743 Y174.637 E.07565
G1 X46.743 Y174.097 E.01678
G1 X49.003 Y176.357 E.09937
G1 X49.543 Y176.357 E.01677
G1 X46.743 Y173.557 E.1231
G1 X46.743 Y173.018 E.01678
G1 X50.082 Y176.357 E.14682
G1 X50.622 Y176.357 E.01677
G1 X46.743 Y172.478 E.17055
G1 X46.743 Y171.938 E.01678
G1 X51.161 Y176.357 E.19427
G1 X51.701 Y176.357 E.01677
G1 X46.743 Y171.399 E.21799
G1 X46.743 Y170.859 E.01678
G1 X52.24 Y176.357 E.24172
G1 X52.78 Y176.357 E.01677
G1 X46.743 Y170.32 E.26544
G1 X46.743 Y169.78 E.01678
G1 X53.319 Y176.357 E.28917
G1 X53.859 Y176.357 E.01677
G1 X46.742 Y169.24 E.31289
G1 X46.742 Y168.701 E.01678
G1 X54.398 Y176.357 E.33662
G1 X54.938 Y176.357 E.01677
G1 X46.623 Y168.042 E.36557
G1 X47.163 Y168.042 E.01678
G1 X55.477 Y176.356 E.36556
G1 X56.017 Y176.356 E.01677
G1 X47.703 Y168.042 E.36556
G1 X48.242 Y168.042 E.01678
G1 X56.556 Y176.356 E.36555
G1 X57.096 Y176.356 E.01677
G1 X48.782 Y168.042 E.36555
G1 X49.322 Y168.042 E.01678
G1 X57.635 Y176.356 E.36554
G1 X57.876 Y176.356 E.00747
G2 X58.05 Y176.235 I.007 J-.175 E.00708
G1 X49.861 Y168.042 E.36012
G1 X50.401 Y168.042 E.01678
G1 X58.056 Y175.698 E.3366
G1 X58.056 Y175.159 E.01677
G1 X50.94 Y168.043 E.31288
G1 X51.48 Y168.043 E.01678
G1 X58.056 Y174.619 E.28915
G1 X58.056 Y174.079 E.01677
G1 X52.02 Y168.043 E.26542
G1 X52.559 Y168.043 E.01678
G1 X58.056 Y173.54 E.2417
G1 X58.056 Y173 E.01678
G1 X53.099 Y168.043 E.21797
G1 X53.639 Y168.043 E.01678
G1 X58.056 Y172.461 E.19425
G1 X58.056 Y171.921 E.01677
G1 X54.178 Y168.043 E.17052
G1 X54.718 Y168.043 E.01678
G1 X58.056 Y171.382 E.14679
G1 X58.056 Y170.842 E.01677
G1 X55.257 Y168.043 E.12307
G1 X55.797 Y168.043 E.01678
G1 X58.056 Y170.303 E.09934
G1 X58.056 Y169.763 E.01677
G1 X56.337 Y168.043 E.07562
G1 X56.876 Y168.043 E.01678
G1 X58.056 Y169.223 E.05189
G1 X58.056 Y168.684 E.01677
G1 X57.416 Y168.043 E.02816
G1 X57.893 Y168.043 E.01483
G3 X57.984 Y168.072 I-.006 J.176 E.00302
G3 X58.226 Y168.314 I-3.411 J3.662 E.01063
; WIPE_START
G1 X57.984 Y168.072 E-.12992
G1 X57.893 Y168.043 E-.03641
G1 X57.416 Y168.043 E-.18123
G1 X58.056 Y168.684 E-.34424
G1 X58.056 Y168.863 E-.06821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X50.636 Y170.651 Z1 F42000
G1 X26.297 Y176.515 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.572979
G1 F6791.696
M204 S6000
G1 X26.334 Y176.862 E.01509
; LINE_WIDTH: 0.545222
G1 F7167.015
G1 X26.353 Y177.021 E.00654
; LINE_WIDTH: 0.506264
G1 F7769.61
G1 X26.372 Y177.179 E.00604
; LINE_WIDTH: 0.467307
G1 F8482.84
G1 X26.392 Y177.338 E.00553
; LINE_WIDTH: 0.428075
G1 F9346.907
G1 X26.412 Y177.475 E.00432
; LINE_WIDTH: 0.388583
G1 F10414.784
G1 X26.431 Y177.611 E.00388
; LINE_WIDTH: 0.349091
G1 F11758.143
G1 X26.451 Y177.747 E.00344
; LINE_WIDTH: 0.306689
G1 F13648.316
G1 X26.474 Y177.885 E.003
; LINE_WIDTH: 0.261387
G1 F15000
G1 X26.496 Y178.023 E.00249
; LINE_WIDTH: 0.216084
G1 X26.519 Y178.16 E.00197
; LINE_WIDTH: 0.169297
G1 X26.546 Y178.305 E.00151
; LINE_WIDTH: 0.121051
G1 X26.572 Y178.449 E.00093
; OBJECT_ID: 3
; WIPE_START
G1 X26.546 Y178.305 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X28.105 Y170.833 Z1 F42000
G1 X32.732 Y148.668 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X32.677 Y148.657 E.00188
G3 X26.391 Y141.01 I1.538 J-7.671 E.35552
G1 X26.391 Y106.99 E1.12848
G3 X34.19 Y99.191 I7.826 J.027 E.40603
G1 X87.71 Y99.191 E1.77533
G3 X95.509 Y106.99 I-.024 J7.823 E.40607
G1 X95.509 Y141.01 E1.12848
G3 X87.71 Y148.809 I-7.823 J-.024 E.40607
G1 X34.19 Y148.809 E1.77533
G3 X33.283 Y148.754 I.024 J-7.823 E.03018
G1 X32.791 Y148.677 E.01649
M204 S10000
G1 X32.796 Y148.266 F42000
G1 F8843.478
M204 S6000
G1 X32.756 Y148.257 E.00135
G3 X26.798 Y141.006 I1.457 J-7.271 E.3371
G1 X26.798 Y106.994 E1.12822
G3 X34.194 Y99.598 I7.419 J.022 E.38508
G1 X87.706 Y99.598 E1.77508
G3 X95.102 Y106.994 I-.019 J7.416 E.38512
G1 X95.102 Y141.006 E1.12822
G3 X87.706 Y148.402 I-7.416 J-.019 E.38512
G1 X34.194 Y148.402 E1.77508
G3 X33.33 Y148.349 I.019 J-7.416 E.02872
G1 X32.855 Y148.275 E.01596
M204 S250
G1 X32.857 Y147.879 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X32.833 Y147.873 E.00077
G3 X27.19 Y141.002 I1.38 J-6.886 E.29582
G1 X27.19 Y106.998 E1.04485
G3 X34.198 Y99.99 I7.026 J.018 E.33801
G1 X87.702 Y99.99 E1.64403
G3 X94.71 Y106.998 I-.015 J7.023 E.33805
G1 X94.71 Y141.002 E1.04485
G3 X87.702 Y148.01 I-7.023 J-.015 E.33805
G1 X34.198 Y148.01 E1.64403
G3 X33.376 Y147.96 I.015 J-7.023 E.0253
G1 X32.916 Y147.888 E.0143
; WIPE_START
M204 S6000
G1 X32.833 Y147.873 E-.03232
G1 X32.034 Y147.667 E-.31352
G1 X31.517 Y147.476 E-.20922
G1 X31.032 Y147.241 E-.20493
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.736 Y141.231 Z1 F42000
G1 X68.941 Y98.809 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y98.809 E.62195
G3 X95.891 Y107.01 I-.006 J8.207 E.42723
G1 X95.891 Y140.99 E1.12718
G3 X87.69 Y149.191 I-8.207 J-.006 E.42723
G1 X34.21 Y149.191 E1.77403
G3 X26.009 Y140.99 I.006 J-8.207 E.42724
G1 X26.009 Y107.01 E1.12718
G3 X34.21 Y98.809 I8.21 J.009 E.42718
G1 X52.959 Y98.809 E.62194
G1 X52.959 Y93.82 E.16551
G3 X53.48 Y93.309 I.495 J-.016 E.02719
G1 X68.46 Y93.31 E.49691
G3 X68.941 Y93.83 I-.012 J.493 E.02621
G1 X68.941 Y98.749 E.16318
M204 S10000
G1 X69.348 Y98.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y98.402 E.60858
G3 X96.298 Y107.006 I-.01 J8.614 E.44816
G1 X96.298 Y140.994 E1.12745
G3 X87.694 Y149.598 I-8.614 J-.01 E.44816
G1 X34.206 Y149.598 E1.7743
G3 X25.602 Y140.994 I.01 J-8.614 E.44817
G1 X25.602 Y107.006 E1.12745
G3 X34.206 Y98.402 I8.618 J.014 E.44811
G1 X52.552 Y98.402 E.60858
G1 X52.552 Y93.812 E.15227
G3 X53.468 Y92.902 I.901 J-.009 E.04773
G1 X68.474 Y92.903 E.4978
G3 X69.348 Y93.818 I-.026 J.9 E.04652
G1 X69.348 Y98.342 E.15008
M204 S250
G1 X69.74 Y98.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y98.01 E.5518
G3 X96.69 Y107.002 I-.015 J9.007 E.43382
G1 X96.69 Y140.998 E1.0446
G3 X87.698 Y149.99 I-9.007 J-.015 E.43382
G1 X34.202 Y149.99 E1.64378
G3 X25.21 Y140.998 I.015 J-9.007 E.43382
G1 X25.21 Y107.002 E1.0446
G3 X34.202 Y98.01 I9.011 J.019 E.43377
G1 X52.16 Y98.01 E.5518
G1 X52.16 Y93.804 E.12923
G3 X53.456 Y92.51 I1.293 J-.001 E.06255
G1 X68.489 Y92.511 E.46191
G3 X69.74 Y93.806 I-.041 J1.292 E.06122
G1 X69.74 Y97.95 E.12733
; WIPE_START
M204 S6000
G1 X71.74 Y97.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.996 Y96.49 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51906
G1 F7560.801
M204 S6000
G1 X66.234 Y96.49 E.00925
G1 X66.234 Y96.014 E.01848
G1 X55.664 Y96.013 E.41009
G1 X55.664 Y96.489 E.01847
G1 X65.936 Y96.49 E.39854
M204 S10000
G1 X66.661 Y96.917 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.66 Y95.587 E.04085
G1 X55.238 Y95.587 E.35096
G1 X55.237 Y96.916 E.04084
G1 X66.601 Y96.917 E.34918
M204 S10000
G1 X67.039 Y97.294 F42000
G1 F9547.299
M204 S6000
G1 X67.036 Y95.21 E.06403
G1 X54.861 Y95.21 E.37411
G1 X54.86 Y97.293 E.06401
G1 X66.979 Y97.294 E.37237
M204 S10000
G1 X67.416 Y97.671 F42000
G1 F9547.299
M204 S6000
G1 X67.413 Y94.833 E.0872
G1 X54.484 Y94.832 E.39727
G1 X54.483 Y97.67 E.08718
G1 X67.356 Y97.671 E.39556
M204 S10000
G1 X67.794 Y98.048 F42000
G1 F9547.299
M204 S6000
G1 X67.79 Y94.456 E.11037
G1 X54.107 Y94.455 E.42042
G1 X54.106 Y98.047 E.11035
G1 X67.734 Y98.048 E.41875
M204 S10000
G1 X68.171 Y98.425 F42000
G1 F9547.299
M204 S6000
G1 X68.166 Y94.079 E.13355
G1 X53.73 Y94.078 E.44358
G1 X53.728 Y98.424 E.13352
G1 X68.111 Y98.425 E.44194
M204 S10000
G1 X68.549 Y98.803 F42000
G1 F9547.299
M204 S6000
G1 X68.543 Y93.84 E.15249
G1 X68.509 Y93.744 E.00314
G1 X68.372 Y93.702 E.0044
G1 X53.501 Y93.701 E.45692
G1 X53.379 Y93.752 E.00406
G1 X53.353 Y93.858 E.00337
G1 X53.351 Y98.801 E.15187
G1 X68.489 Y98.803 E.46512
; OBJECT_ID: 1
; WIPE_START
G1 X66.489 Y98.802 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X69.185 Y91.662 Z1 F42000
G1 X91.287 Y33.142 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.753 Y33.489 E.01926
G3 X94.509 Y39.19 I-4.566 J5.724 E.21724
G1 X94.509 Y73.21 E1.12848
G3 X87.21 Y80.509 I-7.322 J-.023 E.38003
M73 P44 R15
G1 X33.69 Y80.509 E1.77533
G3 X26.391 Y73.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E1.12848
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X91.235 Y33.112 I-.023 J7.322 E.14154
M204 S10000
G1 X91.047 Y33.47 F42000
G1 F8843.478
M204 S6000
G1 X91.5 Y33.808 E.01875
G3 X94.102 Y39.194 I-4.313 J5.405 E.20521
G1 X94.102 Y73.206 E1.12822
G3 X87.206 Y80.102 I-6.915 J-.018 E.35908
G1 X33.694 Y80.102 E1.77508
G3 X26.798 Y73.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E1.12822
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X90.995 Y33.441 I-.018 J6.915 E.13315
M204 S250
G1 X90.814 Y33.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X93.71 Y39.198 I-3.626 J5.421 E.19621
G1 X93.71 Y73.202 E1.04485
G3 X87.202 Y79.71 I-6.522 J-.014 E.31393
G1 X33.698 Y79.71 E1.64403
G3 X27.19 Y73.202 I.014 J-6.522 E.31393
G1 X27.19 Y39.198 E1.04485
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.202 Y32.69 E1.64403
G3 X90.764 Y33.758 I-.014 J6.522 E.11587
; WIPE_START
M204 S6000
G1 X91.259 Y34.111 E-.23127
G1 X91.803 Y34.597 E-.27698
G1 X92.243 Y35.092 E-.25175
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P44 R14
G1 X84.696 Y33.956 Z1 F42000
G1 X68.441 Y31.509 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I-.005 J7.706 E.40119
G1 X94.891 Y73.19 E1.12718
G3 X87.19 Y80.891 I-7.706 J-.005 E.40119
G1 X33.71 Y80.891 E1.77403
G3 X26.009 Y73.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E1.12718
G3 X33.71 Y31.509 I7.706 J.005 E.40119
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.52 E.16551
G3 X52.98 Y26.009 I.498 J-.013 E.02714
G1 X67.96 Y26.01 E.49691
G3 X68.441 Y26.53 I-.012 J.493 E.0262
G1 X68.441 Y31.449 E.16318
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I-.01 J8.113 E.42212
G1 X95.298 Y73.194 E1.12745
G3 X87.194 Y81.298 I-8.113 J-.009 E.42212
G1 X33.706 Y81.298 E1.77431
G3 X25.602 Y73.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E1.12745
G3 X33.706 Y31.102 I8.113 J.009 E.42213
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.512 E.15226
G3 X52.968 Y25.602 I.906 J-.004 E.04766
G1 X67.975 Y25.603 E.4978
G3 X68.848 Y26.518 I-.027 J.9 E.04652
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X95.69 Y39.202 I-.014 J8.506 E.4097
G1 X95.69 Y73.198 E1.0446
G3 X87.198 Y81.69 I-8.506 J-.014 E.4097
G1 X33.702 Y81.69 E1.64378
G3 X25.21 Y73.198 I.014 J-8.506 E.4097
G1 X25.21 Y39.202 E1.0446
G3 X33.702 Y30.71 I8.506 J.014 E.4097
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.504 E.12923
G3 X52.956 Y25.21 I1.3 J.006 E.06245
G1 X67.989 Y25.211 E.46191
G3 X69.24 Y26.506 I-.041 J1.292 E.06122
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.496 Y29.19 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51896
G1 F7562.39
M204 S6000
G1 X65.734 Y29.19 E.00925
G1 X65.734 Y28.714 E.01847
G1 X55.164 Y28.713 E.41001
G1 X55.164 Y29.189 E.01846
G1 X65.436 Y29.19 E.39846
M204 S10000
G1 X66.161 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.287 E.04085
G1 X54.738 Y28.287 E.35096
G1 X54.737 Y29.616 E.04083
G1 X66.101 Y29.617 E.34918
M204 S10000
G1 X66.539 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.91 E.06402
G1 X54.361 Y27.91 E.37411
G1 X54.36 Y29.993 E.064
G1 X66.479 Y29.994 E.37237
M204 S10000
G1 X66.916 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.533 E.08719
G1 X53.984 Y27.532 E.39727
G1 X53.983 Y30.37 E.08718
G1 X66.856 Y30.371 E.39556
M204 S10000
G1 X67.294 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.156 E.11036
G1 X53.607 Y27.155 E.42042
G1 X53.606 Y30.747 E.11035
G1 X67.234 Y30.748 E.41875
M204 S10000
G1 X67.671 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.779 E.13354
G1 X53.23 Y26.778 E.44358
G1 X53.228 Y31.124 E.13352
G1 X67.611 Y31.125 E.44194
M204 S10000
G1 X68.049 Y31.502 F42000
G1 F9547.299
M204 S6000
G1 X68.043 Y26.54 E.15248
G1 X68.009 Y26.443 E.00314
G1 X67.872 Y26.402 E.0044
G1 X53.001 Y26.401 E.45692
G1 X52.88 Y26.451 E.00405
G1 X52.853 Y26.558 E.00339
G1 X52.851 Y31.501 E.15187
G1 X67.989 Y31.502 E.46512
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.989 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 4/15
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1 I-.457 J1.128 P1  F42000
G1 X175.398 Y75.839 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X175.234 Y76.272 E.01535
G3 X168.31 Y80.909 I-6.947 J-2.886 E.29298
G1 X114.79 Y80.909 E1.77533
G3 X107.291 Y73.41 I.023 J-7.523 E.39045
G1 X107.291 Y39.39 E1.12848
G3 X114.79 Y31.891 I7.523 J.023 E.39044
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.023 J7.523 E.39045
G1 X175.809 Y73.41 E1.12848
G3 X175.438 Y75.719 I-7.523 J-.023 E.07791
G1 X175.417 Y75.782 E.00221
M204 S10000
G1 X175.016 Y75.699 F42000
G1 F8843.478
M204 S6000
G1 X174.858 Y76.116 E.01482
G3 X168.306 Y80.502 I-6.571 J-2.729 E.2772
G1 X114.794 Y80.502 E1.77508
G3 X107.698 Y73.406 I.019 J-7.115 E.3695
G1 X107.698 Y39.394 E1.12822
G3 X114.794 Y32.298 I7.115 J.019 E.3695
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.019 J7.115 E.3695
G1 X175.402 Y73.406 E1.12822
G3 X175.051 Y75.593 I-7.115 J-.019 E.0738
G1 X175.035 Y75.642 E.00168
M204 S250
G1 X174.649 Y75.563 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X174.496 Y75.966 E.01326
G3 X168.302 Y80.11 I-6.208 J-2.579 E.2427
G1 X114.798 Y80.11 E1.64403
G3 X108.09 Y73.402 I.015 J-6.722 E.32357
G1 X108.09 Y39.398 E1.04485
G3 X114.798 Y32.69 I6.722 J.015 E.32357
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.015 J6.722 E.32357
G1 X175.01 Y73.402 E1.04485
G3 X174.679 Y75.472 I-6.722 J-.015 E.06469
G1 X174.667 Y75.506 E.00108
; WIPE_START
M204 S6000
G1 X174.496 Y75.966 E-.18674
G1 X174.154 Y76.679 E-.3001
G1 X173.879 Y77.128 E-.20022
G1 X173.763 Y77.281 E-.07293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.193 Y70.535 Z1.2 F42000
G1 X149.541 Y31.509 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
M73 P45 R14
G3 X176.191 Y39.41 I-.005 J7.906 E.41161
G1 X176.191 Y73.39 E1.12718
G3 X168.29 Y81.291 I-7.906 J-.005 E.41161
G1 X114.81 Y81.291 E1.77403
G3 X106.909 Y73.39 I-.006 J-7.895 E.41176
G1 X106.909 Y39.41 E1.12718
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.52 E.16551
G3 X134.08 Y26.009 I.495 J-.016 E.02719
G1 X149.056 Y26.01 E.49679
G3 X149.541 Y26.52 I-.008 J.493 E.02599
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.01 J8.314 E.43254
G1 X176.598 Y73.394 E1.12745
G3 X168.294 Y81.698 I-8.314 J-.01 E.43254
G1 X114.806 Y81.698 E1.7743
G3 X106.502 Y73.394 I-.002 J-8.302 E.4327
G1 X106.502 Y39.406 E1.12745
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.512 E.15226
G3 X134.068 Y25.602 I.901 J-.009 E.04773
G1 X149.07 Y25.603 E.49766
G3 X149.948 Y26.512 I-.022 J.9 E.04646
G1 X149.948 Y31.042 E.15028
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.99 Y39.402 I-.014 J8.706 E.41935
G1 X176.99 Y73.398 E1.0446
G3 X168.298 Y82.09 I-8.694 J-.002 E.41951
G1 X114.802 Y82.09 E1.64378
G3 X106.11 Y73.398 I.002 J-8.694 E.4195
G1 X106.11 Y39.402 E1.0446
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.504 E.12923
G3 X134.056 Y25.21 I1.293 J-.001 E.06254
G1 X149.084 Y25.211 E.46177
G3 X150.34 Y26.504 I-.037 J1.292 E.0613
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 4 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer4 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X146.598 Y29.19 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51902
G1 F7561.436
M204 S6000
G1 X146.836 Y29.19 E.00924
G1 X146.836 Y28.714 E.01848
G1 X136.264 Y28.713 E.41013
G1 X136.264 Y29.189 E.01847
G1 X146.538 Y29.19 E.39858
M204 S10000
G1 X147.263 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.262 Y28.287 E.04085
G1 X135.838 Y28.287 E.35103
G1 X135.837 Y29.616 E.04083
G1 X147.203 Y29.617 E.34922
M204 S10000
G1 X147.64 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X147.639 Y27.91 E.06403
G1 X135.461 Y27.91 E.37419
G1 X135.46 Y29.993 E.06401
G1 X147.58 Y29.994 E.3724
M204 S10000
G1 X148.017 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X148.016 Y27.533 E.0872
G1 X135.084 Y27.532 E.39735
G1 X135.083 Y30.37 E.08718
G1 X147.957 Y30.371 E.39558
M204 S10000
G1 X148.394 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X148.393 Y27.156 E.11037
G1 X134.707 Y27.155 E.42051
G1 X134.706 Y30.747 E.11035
G1 X148.334 Y30.748 E.41876
M204 S10000
G1 X148.772 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X148.77 Y26.779 E.13354
G1 X134.33 Y26.778 E.44368
G1 X134.328 Y31.124 E.13352
G1 X148.712 Y31.125 E.44194
M204 S10000
G1 X149.149 Y31.502 F42000
G1 F9547.299
M204 S6000
G1 X149.147 Y26.566 E.15167
G1 X149.104 Y26.441 E.00405
G1 X148.969 Y26.402 E.00433
G1 X134.101 Y26.401 E.45683
G1 X133.981 Y26.449 E.00397
G1 X133.953 Y26.558 E.00346
G1 X133.951 Y31.501 E.15187
G1 X149.089 Y31.502 E.46512
; OBJECT_ID: 4
; WIPE_START
G1 X147.089 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X145.369 Y38.938 Z1.2 F42000
G1 X129.214 Y108.791 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.106 Y108.791 E.00355
G1 X129.008 Y109.114 E.0112
G1 X128.465 Y108.656 E.02357
G3 X128.31 Y108.319 I.352 J-.365 E.0126
G1 X128.309 Y100.519 E.25873
G2 X108.291 Y103.99 I-9.706 J3.486 E.95628
G1 X108.291 Y108.402 E.14636
G1 X108.068 Y108.422 E.00743
G3 X107.909 Y106.59 I10.8 J-1.858 E.06107
G3 X107.918 Y103.578 I76.426 J-1.29 E.09989
G3 X118.763 Y93.312 I10.685 J.426 E.54838
G3 X127.982 Y98.874 I-.166 J10.697 E.37428
G1 X128.469 Y99.809 E.03496
G1 X139.819 Y99.81 E.37651
G3 X140.29 Y100.291 I-.027 J.497 E.0245
G1 X140.29 Y108.319 E.26632
G3 X139.809 Y108.789 I-.497 J-.027 E.02449
G1 X129.274 Y108.791 E.34949
M204 S10000
G1 X129.46 Y109.198 F42000
G1 F8843.478
M204 S6000
G1 X129.408 Y109.198 E.00174
G3 X128.697 Y111.206 I-12.984 J-3.467 E.07076
G1 X128.502 Y111.166 E.0066
G1 X128.502 Y109.22 E.06457
G3 X128.05 Y108.792 I.998 J-1.507 E.02073
G3 X127.903 Y108.334 I.799 J-.51 E.01614
G1 X127.902 Y100.597 E.25665
G2 X116.538 Y94.316 I-9.316 J3.434 E.46945
G2 X108.698 Y103.994 I2.065 J9.688 E.4468
G1 X108.698 Y111.168 E.23799
G1 X108.503 Y111.208 E.00661
G3 X107.502 Y106.593 I10.223 J-4.632 E.15782
G3 X107.511 Y103.562 I76.888 J-1.294 E.10055
G3 X118.773 Y92.905 I11.092 J.442 E.56941
G3 X128.339 Y98.679 I-.177 J11.104 E.3884
G1 X128.716 Y99.402 E.02703
G1 X139.835 Y99.403 E.36885
G3 X140.697 Y100.271 I-.048 J.909 E.04447
G1 X140.697 Y108.335 E.26751
G3 X139.829 Y109.197 I-.909 J-.048 E.04446
G1 X129.52 Y109.198 E.34196
M204 S250
G1 X129.698 Y109.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.11 Y113.044 I-11.277 J-3.093 E.11735
G1 X128.11 Y109.402 E.11192
G3 X127.511 Y108.35 I.808 J-1.157 E.03846
G1 X127.51 Y100.673 E.23588
G2 X109.09 Y103.998 I-8.909 J3.329 E.81345
G1 X109.09 Y113.044 E.27797
G3 X107.11 Y106.597 I9.53 J-6.455 E.21031
G3 X107.119 Y103.547 I77.358 J-1.298 E.09374
G3 X118.783 Y92.513 I11.484 J.457 E.54621
G3 X128.954 Y99.01 I-.215 J11.545 E.39019
G1 X139.85 Y99.011 E.33483
G3 X141.089 Y100.251 I-.068 J1.306 E.05902
G1 X141.089 Y108.35 E.24886
G3 X139.849 Y109.589 I-1.306 J-.068 E.05901
G1 X129.758 Y109.59 E.31005
M204 S10000
G1 X128.897 Y109.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362613
G1 F11260.805
M204 S6000
G1 X128.867 Y109.724 E.00542
; LINE_WIDTH: 0.323125
G1 F12847.768
G1 X128.836 Y109.93 E.00475
; LINE_WIDTH: 0.280717
G1 F15000
G1 X128.813 Y110.065 E.00265
; LINE_WIDTH: 0.235358
G1 X128.79 Y110.2 E.00214
; LINE_WIDTH: 0.19
G1 X128.768 Y110.335 E.00164
; LINE_WIDTH: 0.149726
G1 X128.748 Y110.442 E.00095
; LINE_WIDTH: 0.114522
G1 X128.728 Y110.549 E.00064
M204 S10000
G1 X128.897 Y109.518 F42000
; LINE_WIDTH: 0.402102
G1 F10022.787
M204 S6000
G1 X128.928 Y109.312 E.00609
; WIPE_START
G1 X128.897 Y109.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.999 Y101.887 Z1.2 F42000
G1 X129.025 Y99.972 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4223
G1 F9489.167
M204 S6000
G1 X128.614 Y100.383 E.01797
G1 X128.642 Y100.454 E.00236
G1 X128.643 Y100.891 E.01351
G1 X129.392 Y100.142 E.03275
G1 X129.928 Y100.142 E.01658
G1 X128.643 Y101.428 E.05619
G1 X128.643 Y101.964 E.01658
G1 X130.465 Y100.142 E.07964
G1 X131.001 Y100.142 E.01658
G1 X128.643 Y102.5 E.10308
G1 X128.643 Y103.036 E.01658
G1 X131.538 Y100.142 E.12653
G1 X132.074 Y100.142 E.01658
G1 X128.644 Y103.573 E.14997
G1 X128.644 Y104.109 E.01658
G1 X132.61 Y100.143 E.17342
G1 X133.147 Y100.143 E.01658
G1 X128.644 Y104.645 E.19686
G1 X128.644 Y105.182 E.01658
G1 X133.683 Y100.143 E.22031
G1 X134.22 Y100.143 E.01658
G1 X128.645 Y105.718 E.24375
G1 X128.645 Y106.254 E.01658
G1 X134.756 Y100.143 E.26719
G1 X135.293 Y100.143 E.01658
G1 X128.645 Y106.791 E.29064
G1 X128.645 Y107.327 E.01658
G1 X135.829 Y100.143 E.31408
G1 X136.366 Y100.143 E.01658
G1 X128.645 Y107.863 E.33753
G1 X128.646 Y108.309 E.01377
G2 X128.671 Y108.374 I.12 J-.01 E.0022
G1 X136.902 Y100.143 E.35985
G1 X137.439 Y100.143 E.01658
G1 X129.124 Y108.457 E.3635
G1 X129.661 Y108.457 E.01659
G1 X137.975 Y100.143 E.3635
G1 X138.512 Y100.143 E.01658
G1 X130.197 Y108.457 E.36349
G1 X130.734 Y108.457 E.01659
G1 X139.048 Y100.143 E.36349
G1 X139.584 Y100.143 E.01658
G1 X131.271 Y108.457 E.36348
G1 X131.807 Y108.457 E.01659
G1 X139.956 Y100.308 E.35628
G1 X139.956 Y100.844 E.01658
G1 X132.344 Y108.457 E.33283
G1 X132.88 Y108.457 E.01659
G1 X139.956 Y101.381 E.30937
G1 X139.956 Y101.917 E.01659
G1 X133.417 Y108.457 E.28591
G1 X133.954 Y108.457 E.01659
G1 X139.956 Y102.454 E.26245
G1 X139.956 Y102.99 E.01659
G1 X134.49 Y108.457 E.23899
G1 X135.027 Y108.457 E.01659
G1 X139.956 Y103.527 E.21553
G1 X139.956 Y104.064 E.01659
M73 P46 R14
G1 X135.563 Y108.457 E.19207
G1 X136.1 Y108.457 E.01659
G1 X139.956 Y104.6 E.16861
G1 X139.956 Y105.137 E.01659
G1 X136.636 Y108.457 E.14515
G1 X137.173 Y108.457 E.01659
G1 X139.956 Y105.673 E.12169
G1 X139.956 Y106.21 E.01659
G1 X137.71 Y108.456 E.09823
G1 X138.246 Y108.456 E.01659
G1 X139.956 Y106.746 E.07477
G1 X139.956 Y107.283 E.01659
G1 X138.783 Y108.456 E.05131
G1 X139.319 Y108.456 E.01659
G1 X139.956 Y107.819 E.02785
G1 X139.956 Y108.286 E.01444
G1 X139.942 Y108.359 E.0023
G3 X139.686 Y108.626 I-.968 J-.672 E.01147
; WIPE_START
G1 X139.942 Y108.359 E-.1404
G1 X139.956 Y108.286 E-.02827
G1 X139.956 Y107.819 E-.17747
G1 X139.319 Y108.456 E-.34236
G1 X139.131 Y108.456 E-.0715
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.516 Y108.976 Z1.2 F42000
G1 X108.472 Y110.549 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121057
G1 F15000
M204 S6000
G1 X108.446 Y110.405 E.00093
; LINE_WIDTH: 0.169312
G1 X108.419 Y110.26 E.00151
; LINE_WIDTH: 0.216094
G1 X108.396 Y110.123 E.00197
; LINE_WIDTH: 0.261417
G1 X108.374 Y109.985 E.00249
; LINE_WIDTH: 0.306739
G1 F13645.731
G1 X108.351 Y109.847 E.003
; LINE_WIDTH: 0.349258
G1 F11751.75
G1 X108.331 Y109.71 E.00346
; LINE_WIDTH: 0.388995
G1 F10402.387
G1 X108.311 Y109.573 E.00391
; LINE_WIDTH: 0.428732
G1 F9330.982
G1 X108.292 Y109.436 E.00436
; LINE_WIDTH: 0.465623
G1 F8516.629
G1 X108.275 Y109.3 E.00472
; LINE_WIDTH: 0.49971
G1 F7881.092
G1 X108.257 Y109.164 E.0051
; LINE_WIDTH: 0.533797
G1 F7333.821
G1 X108.24 Y109.028 E.00548
; LINE_WIDTH: 0.565966
G1 F6882.767
G1 X108.197 Y108.615 E.01769
; OBJECT_ID: 5
; WIPE_START
G1 X108.24 Y109.028 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.873 Y109 Z1.2 F42000
G1 X173.978 Y108.789 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.867 Y108.789 E.00369
G1 X173.773 Y109.083 E.01023
G1 X173.265 Y108.655 E.02206
G3 X173.11 Y108.307 I.35 J-.363 E.01292
G1 X173.109 Y100.683 E.25292
G2 X152.691 Y104.189 I-9.906 J3.52 E.97599
G1 X152.691 Y108.221 E.13376
G1 X152.468 Y108.241 E.00742
G3 X152.309 Y106.388 I11.044 J-1.881 E.06174
G3 X152.324 Y103.666 I50.156 J-1.09 E.09032
G3 X163.121 Y93.31 I10.882 J.539 E.54703
G3 X172.7 Y98.874 I.075 J10.899 E.38548
G1 X173.199 Y99.808 E.03511
G1 X184.619 Y99.809 E.37881
G3 X185.09 Y100.289 I-.024 J.494 E.02454
G1 X185.09 Y108.317 E.26631
G3 X184.609 Y108.788 I-.494 J-.024 E.02454
G1 X174.038 Y108.789 E.35066
M204 S10000
G1 X174.219 Y109.196 F42000
G1 F8843.478
M204 S6000
G1 X174.164 Y109.196 E.00181
G3 X173.494 Y111.048 I-16.694 J-4.994 E.06535
G1 X173.302 Y111.006 E.00653
G1 X173.302 Y109.218 E.0593
G3 X172.85 Y108.791 I.997 J-1.506 E.02073
G3 X172.703 Y108.327 I.769 J-.499 E.01634
G1 X172.702 Y100.761 E.25099
G2 X153.098 Y104.193 I-9.5 J3.441 E.93618
G1 X153.098 Y111.005 E.22597
G1 X152.904 Y111.045 E.00658
G3 X151.902 Y106.393 I10.362 J-4.665 E.15906
G3 X151.918 Y103.642 I50.069 J-1.094 E.09126
G3 X163.123 Y92.902 I11.284 J.558 E.56755
G3 X173.055 Y98.675 I.073 J11.306 E.39974
G1 X173.443 Y99.4 E.02729
G1 X184.635 Y99.402 E.37125
G3 X185.497 Y100.269 I-.041 J.902 E.04456
G1 X185.497 Y108.334 E.2675
G3 X184.629 Y109.195 I-.902 J-.041 E.04456
G1 X174.279 Y109.196 E.34334
M204 S250
G1 X174.451 Y109.588 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X172.91 Y112.904 I-12.027 J-3.573 E.11273
G1 X172.91 Y109.401 E.10764
G3 X172.311 Y108.346 I.808 J-1.156 E.03852
G1 X172.31 Y100.836 E.23078
G2 X153.49 Y104.196 I-9.109 J3.365 E.83167
G1 X153.49 Y112.907 E.26766
G3 X151.51 Y106.396 I9.911 J-6.571 E.21207
G3 X151.519 Y103.733 I66.879 J-1.098 E.08186
G1 X151.526 Y103.618 E.00352
G3 X163.124 Y92.51 I11.675 J.582 E.54397
G3 X173.678 Y99.008 I.044 J11.748 E.40116
G1 X184.65 Y99.01 E.33714
G3 X185.889 Y100.25 I-.057 J1.295 E.05914
G1 X185.889 Y108.349 E.24885
G3 X184.648 Y109.587 I-1.295 J-.057 E.05914
G1 X174.511 Y109.588 E.31151
M204 S10000
G1 X173.673 Y109.514 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.360921
G1 F11320.722
M204 S6000
G1 X173.707 Y109.294 E.00578
M204 S10000
G1 X173.673 Y109.514 F42000
; LINE_WIDTH: 0.312729
G1 F13342.793
M204 S6000
G1 X173.639 Y109.735 E.0049
; LINE_WIDTH: 0.264537
G1 F15000
G1 X173.604 Y109.955 E.00403
; LINE_WIDTH: 0.216521
G1 X173.579 Y110.099 E.00208
; LINE_WIDTH: 0.168681
G1 X173.553 Y110.244 E.0015
; LINE_WIDTH: 0.12084
G1 X173.528 Y110.388 E.00093
; WIPE_START
G1 X173.553 Y110.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.71 Y102.613 Z1.2 F42000
G1 X173.764 Y99.971 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42355
G1 F9458.004
M204 S6000
G1 X173.35 Y100.385 E.01816
G1 X173.442 Y100.619 E.00781
G1 X173.442 Y100.831 E.00655
G1 X174.132 Y100.141 E.03026
G1 X174.67 Y100.141 E.01669
G1 X173.442 Y101.369 E.05387
G1 X173.443 Y101.907 E.01669
G1 X175.209 Y100.141 E.07747
G1 X175.747 Y100.141 E.01669
G1 X173.443 Y102.445 E.10108
G1 X173.443 Y102.984 E.01669
G1 X176.285 Y100.141 E.12468
G1 X176.823 Y100.141 E.01669
G1 X173.443 Y103.522 E.14829
G1 X173.443 Y104.06 E.01669
G1 X177.362 Y100.141 E.17189
G1 X177.9 Y100.141 E.01669
G1 X173.443 Y104.598 E.1955
G1 X173.443 Y105.136 E.01669
G1 X178.438 Y100.141 E.21911
G1 X178.976 Y100.141 E.01669
G1 X173.443 Y105.675 E.24271
G1 X173.443 Y106.213 E.01669
G1 X179.515 Y100.141 E.26632
G1 X180.053 Y100.141 E.01669
G1 X173.443 Y106.751 E.28992
G1 X173.443 Y107.289 E.01669
G1 X180.591 Y100.142 E.31353
G1 X181.129 Y100.142 E.01669
G1 X173.443 Y107.827 E.33713
G1 X173.444 Y108.277 E.01396
G2 X173.459 Y108.35 I.111 J.014 E.00235
G1 X181.668 Y100.142 E.36006
G1 X182.206 Y100.142 E.01669
G1 X173.891 Y108.456 E.3647
G1 X174.43 Y108.456 E.0167
G1 X182.744 Y100.142 E.3647
G1 X183.282 Y100.142 E.01669
G1 X174.968 Y108.456 E.36469
G1 X175.506 Y108.456 E.0167
G1 X183.82 Y100.142 E.36469
G1 X184.359 Y100.142 E.01669
G1 X176.045 Y108.456 E.36468
G1 X176.583 Y108.456 E.0167
G1 X184.752 Y100.287 E.35832
G1 X184.756 Y100.821 E.01656
G1 X177.122 Y108.456 E.3349
G1 X177.66 Y108.456 E.0167
G1 X184.756 Y101.359 E.31128
G1 X184.756 Y101.897 E.0167
G1 X178.198 Y108.456 E.28767
G1 X178.737 Y108.456 E.0167
G1 X184.756 Y102.436 E.26406
G1 X184.756 Y102.974 E.0167
G1 X179.275 Y108.455 E.24044
G1 X179.813 Y108.455 E.0167
G1 X184.756 Y103.512 E.21683
G1 X184.756 Y104.051 E.0167
G1 X180.352 Y108.455 E.19321
G1 X180.89 Y108.455 E.0167
G1 X184.756 Y104.589 E.1696
G1 X184.756 Y105.127 E.0167
G1 X181.428 Y108.455 E.14598
G1 X181.967 Y108.455 E.0167
G1 X184.756 Y105.665 E.12237
G1 X184.756 Y106.204 E.0167
G1 X182.505 Y108.455 E.09875
G1 X183.043 Y108.455 E.0167
G1 X184.756 Y106.742 E.07514
G1 X184.756 Y107.28 E.0167
G1 X183.582 Y108.455 E.05153
G1 X184.12 Y108.455 E.0167
G1 X184.756 Y107.819 E.02791
G1 X184.756 Y108.285 E.01445
G3 X184.723 Y108.39 I-.186 J-.001 E.00349
G1 X184.489 Y108.625 E.01027
; WIPE_START
G1 X184.723 Y108.39 E-.12585
G1 X184.756 Y108.285 E-.04211
G1 X184.756 Y107.819 E-.1771
G1 X184.12 Y108.455 E-.34196
G1 X183.928 Y108.455 E-.07299
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X176.31 Y108.928 Z1.2 F42000
G1 X152.872 Y110.385 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110054
G1 F15000
M204 S6000
G1 X152.857 Y110.302 E.00046
; LINE_WIDTH: 0.136312
G1 X152.841 Y110.219 E.00064
; LINE_WIDTH: 0.17366
G1 X152.817 Y110.075 E.00156
; LINE_WIDTH: 0.22214
G1 X152.793 Y109.931 E.00213
; LINE_WIDTH: 0.27062
G1 X152.768 Y109.787 E.00271
; LINE_WIDTH: 0.316128
G1 F13176.803
G1 X152.747 Y109.644 E.00322
; LINE_WIDTH: 0.358621
G1 F11403.215
G1 X152.726 Y109.501 E.00373
; LINE_WIDTH: 0.401114
G1 F10050.434
G1 X152.705 Y109.357 E.00423
; LINE_WIDTH: 0.440606
G1 F9052.374
G1 X152.686 Y109.215 E.00464
; LINE_WIDTH: 0.477076
G1 F8291.961
G1 X152.668 Y109.073 E.00507
; LINE_WIDTH: 0.513546
G1 F7649.4
G1 X152.65 Y108.931 E.0055
; LINE_WIDTH: 0.556668
G1 F7007.338
G1 X152.596 Y108.434 E.02094
; OBJECT_ID: 6
; WIPE_START
G1 X152.65 Y108.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X160.282 Y108.915 Z1.2 F42000
G1 X219.315 Y108.79 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.202 Y108.79 E.00377
G1 X219.118 Y109.037 E.00866
G1 X218.665 Y108.655 E.01967
G3 X218.51 Y108.308 I.332 J-.356 E.01294
G1 X218.509 Y100.933 E.24465
G2 X197.491 Y104.489 I-10.204 J3.578 E1.00521
G1 X197.491 Y107.948 E.11473
G1 X197.264 Y107.964 E.00755
G3 X197.109 Y106.088 I14.815 J-2.165 E.06246
G3 X197.144 Y103.613 I31.437 J-.79 E.08215
G3 X208.564 Y93.313 I11.174 J.909 E.56212
G3 X217.979 Y98.882 I-.294 J11.241 E.37898
G1 X218.492 Y99.808 E.03509
G1 X230.019 Y99.809 E.38237
G3 X230.49 Y100.289 I-.024 J.494 E.02454
G1 X230.49 Y108.318 E.26632
G3 X230.009 Y108.788 I-.497 J-.027 E.02449
G1 X219.375 Y108.79 E.35275
M204 S10000
G1 X219.549 Y109.197 F42000
G1 F8843.478
M204 S6000
G1 X219.494 Y109.197 E.00185
G3 X218.898 Y110.81 I-15.237 J-4.71 E.05708
G1 X218.702 Y110.77 E.00662
G1 X218.702 Y109.219 E.05148
G3 X218.25 Y108.791 I.997 J-1.506 E.02073
G3 X218.103 Y108.328 I.794 J-.507 E.01633
G1 X218.102 Y101.009 E.24277
G2 X202.741 Y95.708 I-9.802 J3.497 E.6185
G2 X197.898 Y104.493 I5.567 J8.797 E.3472
G1 X197.898 Y110.768 E.20817
G1 X197.704 Y110.809 E.00656
G3 X196.702 Y106.093 I10.646 J-4.727 E.16113
G3 X196.739 Y103.581 I31.819 J-.794 E.08336
G3 X208.578 Y92.906 I11.581 J.942 E.58273
G3 X218.331 Y98.678 I-.309 J11.65 E.39262
G1 X218.732 Y99.401 E.0274
G1 X230.035 Y99.402 E.37495
G3 X230.897 Y100.27 I-.041 J.902 E.04456
G1 X230.897 Y108.334 E.26751
G3 X230.029 Y109.195 I-.909 J-.048 E.04446
G1 X219.609 Y109.197 E.34565
M204 S250
G1 X219.775 Y109.589 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X218.31 Y112.695 I-12.291 J-3.898 E.10584
G1 X218.31 Y109.401 E.10121
G3 X217.711 Y108.347 I.784 J-1.142 E.03857
G1 X217.71 Y101.083 E.22319
G2 X198.29 Y104.497 I-9.408 J3.426 E.8587
G1 X198.29 Y112.695 E.2519
G3 X197.829 Y111.936 I10.596 J-6.96 E.02727
G3 X196.31 Y106.097 I10.515 J-5.853 E.18741
G3 X196.348 Y103.549 I32.186 J-.798 E.0783
G3 X208.591 Y92.514 I11.972 J.973 E.55815
G3 X218.963 Y99.009 I-.298 J12.006 E.39455
G1 X230.05 Y99.01 E.34069
G3 X231.289 Y100.25 I-.057 J1.295 E.05914
G1 X231.289 Y108.349 E.24886
G3 X230.049 Y109.588 I-1.306 J-.068 E.05901
G1 X219.835 Y109.589 E.31384
M204 S10000
G1 X219.048 Y109.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308092
G1 F13576.12
M204 S6000
G1 X219.075 Y109.267 E.00363
M204 S10000
G1 X219.048 Y109.433 F42000
; LINE_WIDTH: 0.267066
G1 F15000
M204 S6000
G1 X219.021 Y109.598 E.00306
; LINE_WIDTH: 0.22604
G1 X218.994 Y109.764 E.0025
; LINE_WIDTH: 0.185013
G1 X218.966 Y109.93 E.00194
; LINE_WIDTH: 0.147617
G1 X218.947 Y110.035 E.00091
; LINE_WIDTH: 0.113819
G1 X218.928 Y110.14 E.00062
M204 S10000
G1 X218.757 Y110.982 F42000
; LINE_WIDTH: 0.45426
G1 F8751.899
M204 S6000
G1 X218.545 Y111.935 E.03274
; WIPE_START
G1 X218.757 Y110.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X226.224 Y109.401 Z1.2 F42000
G1 X229.887 Y108.625 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42575
G1 F9403.651
M204 S6000
G1 X230.125 Y108.387 E.01051
G2 X230.156 Y108.288 I-.151 J-.102 E.00326
G1 X230.156 Y107.814 E.0148
G1 X229.515 Y108.455 E.02828
G1 X228.974 Y108.455 E.01689
G1 X230.156 Y107.273 E.05217
G1 X230.156 Y106.731 E.01689
G1 X228.432 Y108.455 E.07606
G1 X227.891 Y108.455 E.01689
G1 X230.156 Y106.19 E.09995
G1 X230.156 Y105.648 E.01689
G1 X227.349 Y108.455 E.12384
G1 X226.808 Y108.456 E.01689
G1 X230.156 Y105.107 E.14772
G1 X230.156 Y104.566 E.01689
G1 X226.267 Y108.456 E.17161
G1 X225.725 Y108.456 E.01689
G1 X230.156 Y104.024 E.1955
G1 X230.156 Y103.483 E.01689
G1 X225.184 Y108.456 E.21939
G1 X224.642 Y108.456 E.01689
G1 X230.156 Y102.941 E.24328
G1 X230.156 Y102.4 E.01689
G1 X224.101 Y108.456 E.26717
G1 X223.559 Y108.456 E.01689
G1 X230.156 Y101.859 E.29105
G1 X230.156 Y101.317 E.01689
G1 X223.018 Y108.456 E.31494
G1 X222.476 Y108.456 E.01689
G1 X230.156 Y100.776 E.33883
G1 X230.145 Y100.246 E.01654
G1 X221.935 Y108.456 E.36222
G1 X221.393 Y108.456 E.01689
G1 X229.707 Y100.142 E.36679
G1 X229.166 Y100.142 E.01689
G1 X220.852 Y108.456 E.36679
G1 X220.31 Y108.456 E.01689
G1 X228.625 Y100.142 E.3668
G1 X228.083 Y100.142 E.01689
G1 X219.769 Y108.456 E.3668
G1 X219.228 Y108.456 E.01689
G1 X227.542 Y100.142 E.36681
G1 X227.001 Y100.142 E.01689
G1 X218.848 Y108.294 E.35966
G1 X218.843 Y107.758 E.01674
G1 X226.459 Y100.142 E.33599
G1 X225.918 Y100.142 E.01689
G1 X218.843 Y107.216 E.31211
G1 X218.843 Y106.675 E.01689
G1 X225.377 Y100.142 E.28823
G1 X224.835 Y100.142 E.01689
G1 X218.843 Y106.134 E.26435
G1 X218.843 Y105.592 E.01689
G1 X224.294 Y100.142 E.24047
G1 X223.752 Y100.142 E.01689
G1 X218.843 Y105.051 E.21659
G1 X218.843 Y104.51 E.01689
G1 X223.211 Y100.142 E.19271
G1 X222.67 Y100.141 E.01689
G1 X218.843 Y103.968 E.16884
G1 X218.843 Y103.427 E.01689
G1 X222.128 Y100.141 E.14496
G1 X221.587 Y100.141 E.01689
G1 X218.843 Y102.886 E.12108
G1 X218.843 Y102.344 E.01689
G1 X221.046 Y100.141 E.0972
G1 X220.504 Y100.141 E.01689
G1 X218.842 Y101.803 E.07332
G1 X218.842 Y101.262 E.01689
G1 X219.963 Y100.141 E.04944
G1 X219.422 Y100.141 E.01689
G1 X218.8 Y100.762 E.02741
G1 X218.649 Y100.373 E.01304
G1 X219.05 Y99.971 E.01771
; WIPE_START
G1 X218.649 Y100.373 E-.2157
G1 X218.8 Y100.762 E-.15889
G1 X219.422 Y100.141 E-.33386
G1 X219.557 Y100.141 E-.05155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X212.38 Y102.738 Z1.2 F42000
G1 X197.395 Y108.159 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56583
G1 F6884.56
M204 S6000
G1 X197.427 Y108.451 E.01253
; LINE_WIDTH: 0.531088
G1 F7374.514
G1 X197.459 Y108.743 E.01169
; LINE_WIDTH: 0.494312
G1 F7975.329
G1 X197.478 Y108.892 E.00552
; LINE_WIDTH: 0.455536
G1 F8724.82
G1 X197.498 Y109.04 E.00504
; LINE_WIDTH: 0.41676
G1 F9629.79
G1 X197.517 Y109.189 E.00457
; LINE_WIDTH: 0.374831
G1 F10846.307
G1 X197.54 Y109.339 E.00409
; LINE_WIDTH: 0.329771
G1 F12550.086
G1 X197.562 Y109.488 E.00353
; LINE_WIDTH: 0.284711
G1 F14888.89
G1 X197.585 Y109.638 E.00298
; LINE_WIDTH: 0.242892
G1 F15000
G1 X197.604 Y109.751 E.00187
; LINE_WIDTH: 0.204276
G1 X197.623 Y109.864 E.00151
; LINE_WIDTH: 0.165659
G1 X197.643 Y109.976 E.00114
; LINE_WIDTH: 0.127043
G1 X197.662 Y110.089 E.00078
; LINE_WIDTH: 0.102319
G1 X197.672 Y110.144 E.00027
; OBJECT_ID: 9
; WIPE_START
G1 X197.662 Y110.089 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X192.542 Y115.749 Z1.2 F42000
G1 X137.415 Y176.69 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.302 Y176.69 E.00377
G1 X137.218 Y176.937 E.00866
G1 X136.765 Y176.555 E.01966
G3 X136.61 Y176.208 I.349 J-.363 E.01292
G1 X136.609 Y168.832 E.24465
G2 X115.591 Y172.389 I-10.205 J3.577 E1.00529
G1 X115.591 Y175.848 E.11473
G1 X115.364 Y175.864 E.00755
G3 X115.209 Y173.989 I14.826 J-2.166 E.06245
G3 X115.244 Y171.513 I31.421 J-.79 E.08215
G1 X115.278 Y171.172 E.01138
G3 X126.664 Y161.213 I11.14 J1.248 E.55075
G3 X136.079 Y166.782 I-.267 J11.196 E.37913
G1 X136.592 Y167.708 E.03509
G1 X148.119 Y167.709 E.38238
G3 X148.59 Y168.189 I-.027 J.497 E.02448
G1 X148.59 Y176.218 E.26633
G3 X148.109 Y176.688 I-.497 J-.027 E.02449
G1 X137.475 Y176.69 E.35275
M204 S10000
G1 X137.649 Y177.097 F42000
G1 F8843.478
M204 S6000
G1 X137.594 Y177.097 E.00185
G3 X136.998 Y178.71 I-15.242 J-4.712 E.05708
G1 X136.802 Y178.67 E.00662
G1 X136.802 Y177.119 E.05148
G3 X136.351 Y176.691 I.999 J-1.508 E.02072
G3 X136.203 Y176.227 I.785 J-.505 E.01634
G1 X136.202 Y168.909 E.24277
G2 X115.998 Y172.393 I-9.799 J3.499 E.96545
G1 X115.998 Y178.668 E.20817
G1 X115.804 Y178.709 E.00656
G1 X115.757 Y178.602 E.0039
G3 X114.802 Y173.992 I10.713 J-4.622 E.15723
G3 X114.839 Y171.481 I31.795 J-.794 E.08335
G1 X114.873 Y171.131 E.01165
G3 X126.678 Y160.806 I11.545 J1.289 E.57108
M73 P47 R14
G3 X136.432 Y166.578 I-.281 J11.602 E.39278
G1 X136.832 Y167.301 E.0274
G1 X148.135 Y167.302 E.37495
G3 X148.997 Y168.169 I-.048 J.909 E.04446
G1 X148.997 Y176.234 E.26752
G3 X148.129 Y177.095 I-.909 J-.048 E.04447
G1 X137.709 Y177.097 E.34565
M204 S250
G1 X137.875 Y177.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X136.41 Y180.595 I-12.292 J-3.898 E.10584
G1 X136.41 Y177.301 E.10121
G3 X135.811 Y176.247 I.808 J-1.156 E.03852
G1 X135.81 Y168.983 E.22319
G2 X116.39 Y172.397 I-9.408 J3.424 E.85876
G1 X116.39 Y180.595 E.2519
G3 X114.726 Y176.725 I9.952 J-6.572 E.1301
G3 X114.41 Y173.997 I13.137 J-2.904 E.08456
G3 X114.448 Y171.45 I32.167 J-.798 E.07829
G1 X114.483 Y171.093 E.01102
G3 X114.974 Y168.772 I13.696 J1.682 E.07297
G3 X126.691 Y160.414 I11.449 J3.658 E.47416
G3 X129.045 Y160.706 I-.515 J13.79 E.07297
G3 X137.063 Y166.909 I-2.707 J11.782 E.32142
G1 X148.151 Y166.91 E.3407
G3 X149.389 Y168.15 I-.068 J1.306 E.059
G1 X149.389 Y176.249 E.24887
G3 X148.148 Y177.488 I-1.306 J-.068 E.05901
G1 X137.935 Y177.489 E.31384
M204 S10000
G1 X137.148 Y177.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308118
G1 F13574.782
M204 S6000
G1 X137.175 Y177.167 E.00362
M204 S10000
G1 X137.148 Y177.333 F42000
; LINE_WIDTH: 0.267142
G1 F15000
M204 S6000
G1 X137.121 Y177.498 E.00306
; LINE_WIDTH: 0.226165
G1 X137.094 Y177.664 E.0025
; LINE_WIDTH: 0.185189
G1 X137.067 Y177.829 E.00194
; LINE_WIDTH: 0.147759
G1 X137.047 Y177.935 E.00092
; LINE_WIDTH: 0.113867
G1 X137.028 Y178.04 E.00062
M204 S10000
G1 X136.857 Y178.882 F42000
; LINE_WIDTH: 0.454293
G1 F8751.195
M204 S6000
G1 X136.644 Y179.835 E.03274
; WIPE_START
G1 X136.857 Y178.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.324 Y177.299 Z1.2 F42000
G1 X147.979 Y176.525 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4256
G1 F9407.338
M204 S6000
G1 X148.233 Y176.27 E.01122
G2 X148.256 Y176.188 I-.128 J-.08 E.0027
G1 X148.256 Y175.706 E.01503
G1 X147.607 Y176.355 E.02862
G1 X147.066 Y176.355 E.01688
G1 X148.256 Y175.165 E.05249
G1 X148.256 Y174.624 E.01688
G1 X146.525 Y176.355 E.07636
G1 X145.984 Y176.355 E.01688
G1 X148.256 Y174.083 E.10023
G1 X148.256 Y173.541 E.01688
G1 X145.442 Y176.355 E.1241
G1 X144.901 Y176.356 E.01688
G1 X148.256 Y173 E.14797
G1 X148.256 Y172.459 E.01688
G1 X144.36 Y176.356 E.17184
G1 X143.819 Y176.356 E.01688
G1 X148.256 Y171.918 E.19571
G1 X148.256 Y171.377 E.01688
G1 X143.277 Y176.356 E.21958
G1 X142.736 Y176.356 E.01688
G1 X148.256 Y170.835 E.24345
G1 X148.256 Y170.294 E.01688
G1 X142.195 Y176.356 E.26731
G1 X141.654 Y176.356 E.01688
G1 X148.256 Y169.753 E.29118
G1 X148.256 Y169.212 E.01688
G1 X141.112 Y176.356 E.31505
G1 X140.571 Y176.356 E.01688
G1 X148.256 Y168.671 E.33892
G1 X148.256 Y168.229 E.01379
G1 X148.237 Y168.149 E.00256
G1 X140.03 Y176.356 E.36195
G1 X139.489 Y176.356 E.01688
G1 X147.803 Y168.042 E.36665
G1 X147.261 Y168.042 E.01687
G1 X138.947 Y176.356 E.36665
G1 X138.406 Y176.356 E.01688
G1 X146.72 Y168.042 E.36666
G1 X146.179 Y168.042 E.01687
G1 X137.865 Y176.356 E.36666
G1 X137.324 Y176.356 E.01688
G1 X145.638 Y168.042 E.36667
G1 X145.097 Y168.042 E.01687
G1 X136.946 Y176.192 E.35944
G1 X136.943 Y175.654 E.01678
G1 X144.556 Y168.042 E.33571
G1 X144.015 Y168.042 E.01687
G1 X136.943 Y175.113 E.31185
G1 X136.943 Y174.572 E.01687
G1 X143.474 Y168.042 E.28799
G1 X142.932 Y168.042 E.01687
G1 X136.943 Y174.031 E.26413
G1 X136.943 Y173.49 E.01687
G1 X142.391 Y168.042 E.24026
G1 X141.85 Y168.042 E.01687
G1 X136.943 Y172.949 E.2164
G1 X136.943 Y172.408 E.01687
G1 X141.309 Y168.042 E.19254
G1 X140.768 Y168.041 E.01687
G1 X136.943 Y171.866 E.16868
G1 X136.943 Y171.325 E.01687
G1 X140.227 Y168.041 E.14482
G1 X139.686 Y168.041 E.01687
G1 X136.943 Y170.784 E.12096
G1 X136.943 Y170.243 E.01687
G1 X139.144 Y168.041 E.0971
G1 X138.603 Y168.041 E.01687
G1 X136.943 Y169.702 E.07324
G1 X136.942 Y169.161 E.01687
G1 X138.062 Y168.041 E.04938
G1 X137.521 Y168.041 E.01687
G1 X136.9 Y168.662 E.02737
G1 X136.749 Y168.272 E.01303
G1 X137.15 Y167.871 E.01769
; WIPE_START
G1 X136.749 Y168.272 E-.21553
G1 X136.9 Y168.662 E-.15882
G1 X137.521 Y168.041 E-.33359
G1 X137.658 Y168.041 E-.05207
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.481 Y170.637 Z1.2 F42000
G1 X115.495 Y176.059 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565825
G1 F6884.623
M204 S6000
G1 X115.527 Y176.351 E.01252
; LINE_WIDTH: 0.531074
G1 F7374.73
G1 X115.559 Y176.643 E.01169
; LINE_WIDTH: 0.494279
G1 F7975.925
G1 X115.578 Y176.792 E.00552
; LINE_WIDTH: 0.455475
G1 F8726.11
G1 X115.598 Y176.941 E.00505
; LINE_WIDTH: 0.416672
G1 F9632.066
G1 X115.617 Y177.09 E.00457
; LINE_WIDTH: 0.374765
G1 F10848.446
G1 X115.64 Y177.239 E.00408
; LINE_WIDTH: 0.329775
G1 F12549.924
G1 X115.662 Y177.388 E.00353
; LINE_WIDTH: 0.284784
G1 F14884.407
G1 X115.685 Y177.537 E.00298
; LINE_WIDTH: 0.242967
G1 F15000
G1 X115.704 Y177.65 E.00187
; LINE_WIDTH: 0.2043
G1 X115.723 Y177.763 E.00151
; LINE_WIDTH: 0.165634
G1 X115.743 Y177.876 E.00115
; LINE_WIDTH: 0.126967
G1 X115.762 Y177.989 E.00079
; LINE_WIDTH: 0.102268
G1 X115.772 Y178.044 E.00027
; OBJECT_ID: 8
; WIPE_START
G1 X115.762 Y177.989 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X108.141 Y177.571 Z1.2 F42000
G1 X92.078 Y176.689 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.967 Y176.689 E.00368
G1 X91.873 Y176.983 E.01023
G1 X91.365 Y176.555 E.02206
G3 X91.21 Y176.213 I.351 J-.364 E.01273
G1 X91.209 Y168.583 E.25311
G2 X70.791 Y172.089 I-9.904 J3.527 E.97562
G1 X70.791 Y176.121 E.13376
G1 X70.568 Y176.141 E.00742
G3 X70.409 Y174.288 I11.049 J-1.882 E.06174
G3 X70.418 Y171.664 I65.935 J-1.09 E.08706
G3 X81.221 Y161.21 I10.901 J.456 E.55015
G3 X90.8 Y166.774 I.075 J10.898 E.38547
G1 X91.299 Y167.708 E.03513
G1 X102.709 Y167.709 E.37849
G3 X103.19 Y168.189 I-.013 J.494 E.02486
G1 X103.19 Y176.218 E.26632
G3 X102.715 Y176.688 I-.497 J-.027 E.02429
G1 X92.138 Y176.689 E.35086
M204 S10000
G1 X92.319 Y177.096 F42000
G1 F8843.478
M204 S6000
G1 X92.264 Y177.096 E.00181
G3 X91.594 Y178.948 I-16.709 J-4.999 E.06535
G1 X91.402 Y178.906 E.00653
G1 X91.402 Y177.118 E.0593
G3 X90.95 Y176.691 I.998 J-1.507 E.02073
G3 X90.803 Y176.231 I.798 J-.509 E.01621
G1 X90.802 Y168.661 E.25111
G2 X71.198 Y172.093 I-9.499 J3.448 E.93582
G1 X71.198 Y178.905 E.22597
G1 X71.004 Y178.945 E.00658
G3 X70.002 Y174.293 I10.362 J-4.665 E.15906
G3 X70.011 Y171.648 I66.388 J-1.094 E.08773
G3 X81.223 Y160.802 I11.309 J.472 E.57087
G3 X91.155 Y166.574 I.073 J11.306 E.39973
G1 X91.543 Y167.3 E.02731
G1 X102.729 Y167.302 E.37105
G3 X103.597 Y168.169 I-.034 J.902 E.04475
G1 X103.597 Y176.234 E.26751
G3 X102.733 Y177.095 I-.909 J-.048 E.04435
G1 X92.379 Y177.096 E.34346
M204 S250
G1 X92.551 Y177.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X91.01 Y180.804 I-11.36 J-3.264 E.11278
G1 X91.01 Y177.301 E.10764
G3 X90.411 Y176.247 I.808 J-1.156 E.03848
G1 X90.41 Y168.736 E.23081
G2 X71.59 Y172.096 I-9.108 J3.372 E.83135
G1 X71.59 Y180.807 E.26767
G3 X69.61 Y174.296 I9.911 J-6.571 E.21207
G3 X69.619 Y171.633 I66.874 J-1.098 E.08186
G3 X81.224 Y160.41 I11.701 J.489 E.54728
G3 X91.778 Y166.908 I.045 J11.747 E.40117
G1 X102.748 Y166.91 E.33708
G3 X103.989 Y168.15 I-.055 J1.295 E.0592
G1 X103.989 Y176.249 E.24886
G3 X102.75 Y177.487 I-1.306 J-.068 E.05898
G1 X92.611 Y177.488 E.31155
M204 S10000
G1 X91.773 Y177.414 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.360926
G1 F11320.547
M204 S6000
G1 X91.808 Y177.194 E.00578
M204 S10000
G1 X91.773 Y177.414 F42000
; LINE_WIDTH: 0.312676
G1 F13345.418
M204 S6000
G1 X91.739 Y177.635 E.00491
; LINE_WIDTH: 0.264426
G1 F15000
G1 X91.704 Y177.855 E.00403
; LINE_WIDTH: 0.2164
G1 X91.679 Y178 E.00207
; LINE_WIDTH: 0.168608
G1 X91.653 Y178.144 E.0015
; LINE_WIDTH: 0.120816
G1 X91.628 Y178.288 E.00093
; WIPE_START
G1 X91.653 Y178.144 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.81 Y170.513 Z1.2 F42000
G1 X91.864 Y167.871 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42354
G1 F9458.252
M204 S6000
G1 X91.45 Y168.286 E.01818
G1 X91.542 Y168.52 E.00781
G1 X91.542 Y168.731 E.00656
G1 X92.233 Y168.041 E.03028
G1 X92.771 Y168.041 E.01669
G1 X91.542 Y169.269 E.05388
G1 X91.543 Y169.808 E.01669
G1 X93.309 Y168.041 E.07749
G1 X93.847 Y168.041 E.01669
G1 X91.543 Y170.346 E.10109
G1 X91.543 Y170.884 E.01669
G1 X94.385 Y168.041 E.12469
G1 X94.924 Y168.041 E.01669
G1 X91.543 Y171.422 E.1483
G1 X91.543 Y171.96 E.01669
G1 X95.462 Y168.041 E.1719
G1 X96 Y168.041 E.01669
G1 X91.543 Y172.498 E.19551
G1 X91.543 Y173.037 E.01669
G1 X96.538 Y168.041 E.21911
G1 X97.077 Y168.041 E.01669
G1 X91.543 Y173.575 E.24272
G1 X91.543 Y174.113 E.01669
G1 X97.615 Y168.041 E.26632
G1 X98.153 Y168.041 E.01669
G1 X91.543 Y174.651 E.28992
G1 X91.543 Y175.189 E.01669
G1 X98.691 Y168.042 E.31353
G1 X99.229 Y168.042 E.01669
G1 X91.543 Y175.728 E.33713
G1 X91.543 Y176.181 E.01406
G1 X91.559 Y176.251 E.00221
G1 X99.768 Y168.042 E.36007
G1 X100.306 Y168.042 E.01669
G1 X91.992 Y176.356 E.36469
G1 X92.53 Y176.356 E.0167
G1 X100.844 Y168.042 E.36469
G1 X101.382 Y168.042 E.01669
G1 X93.068 Y176.356 E.36468
G1 X93.607 Y176.356 E.0167
G1 X101.921 Y168.042 E.36468
G1 X102.459 Y168.042 E.01669
G1 X94.145 Y176.356 E.36467
G1 X94.683 Y176.356 E.0167
G1 X102.852 Y168.187 E.35831
G1 X102.856 Y168.721 E.01656
G1 X95.222 Y176.356 E.33489
G1 X95.76 Y176.356 E.0167
G1 X102.856 Y169.259 E.31127
G1 X102.856 Y169.797 E.0167
G1 X96.298 Y176.356 E.28766
G1 X96.837 Y176.356 E.0167
G1 X102.856 Y170.336 E.26405
G1 X102.856 Y170.874 E.01669
G1 X97.375 Y176.355 E.24043
G1 X97.913 Y176.355 E.0167
G1 X102.856 Y171.412 E.21682
G1 X102.856 Y171.951 E.0167
G1 X98.452 Y176.355 E.19321
G1 X98.99 Y176.355 E.0167
G1 X102.856 Y172.489 E.16959
G1 X102.856 Y173.027 E.0167
G1 X99.528 Y176.355 E.14598
G1 X100.067 Y176.355 E.0167
G1 X102.856 Y173.565 E.12237
G1 X102.856 Y174.104 E.0167
G1 X100.605 Y176.355 E.09876
G1 X101.143 Y176.355 E.0167
G1 X102.856 Y174.642 E.07514
G1 X102.856 Y175.18 E.0167
G1 X101.682 Y176.355 E.05153
G1 X102.22 Y176.355 E.0167
G1 X102.856 Y175.718 E.02792
G1 X102.856 Y176.188 E.01457
G3 X102.825 Y176.287 I-.185 J-.004 E.00328
G3 X102.589 Y176.525 I-2.801 J-2.553 E.01038
; WIPE_START
G1 X102.825 Y176.287 E-.12715
G1 X102.856 Y176.188 E-.03964
G1 X102.856 Y175.718 E-.17845
G1 X102.22 Y176.355 E-.34202
G1 X102.029 Y176.355 E-.07274
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.411 Y176.828 Z1.2 F42000
G1 X70.972 Y178.285 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110034
G1 F15000
M204 S6000
G1 X70.957 Y178.202 E.00046
; LINE_WIDTH: 0.136252
G1 X70.941 Y178.119 E.00064
; LINE_WIDTH: 0.173634
G1 X70.917 Y177.975 E.00156
; LINE_WIDTH: 0.222148
G1 X70.893 Y177.831 E.00213
; LINE_WIDTH: 0.270663
G1 X70.868 Y177.687 E.00271
; LINE_WIDTH: 0.31615
G1 F13175.714
G1 X70.847 Y177.544 E.00322
; LINE_WIDTH: 0.35865
G1 F11402.148
G1 X70.826 Y177.401 E.00373
; LINE_WIDTH: 0.40115
G1 F10049.409
G1 X70.805 Y177.257 E.00423
; LINE_WIDTH: 0.440639
G1 F9051.619
G1 X70.786 Y177.115 E.00464
; LINE_WIDTH: 0.477088
G1 F8291.734
G1 X70.768 Y176.973 E.00507
; LINE_WIDTH: 0.513536
G1 F7649.552
G1 X70.75 Y176.831 E.00549
; LINE_WIDTH: 0.556635
G1 F7007.776
G1 X70.696 Y176.334 E.02094
; OBJECT_ID: 7
; WIPE_START
G1 X70.75 Y176.831 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X63.118 Y176.785 Z1.2 F42000
G1 X47.314 Y176.691 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X47.206 Y176.691 E.00355
G1 X47.108 Y177.014 E.0112
G1 X46.565 Y176.556 E.02357
G3 X46.41 Y176.209 I.35 J-.363 E.01292
G1 X46.409 Y168.419 E.25841
G2 X26.391 Y171.89 I-9.706 J3.486 E.95627
G1 X26.391 Y176.302 E.14636
G1 X26.168 Y176.322 E.00743
G3 X26.009 Y174.49 I10.796 J-1.857 E.06107
G3 X26.018 Y171.478 I76.373 J-1.29 E.0999
G3 X36.863 Y161.212 I10.685 J.426 E.54837
G3 X46.082 Y166.774 I-.166 J10.697 E.37428
G1 X46.569 Y167.709 E.03495
G1 X57.919 Y167.71 E.37651
G3 X58.39 Y168.184 I-.027 J.497 E.0243
G1 X58.39 Y176.219 E.26652
G3 X57.909 Y176.689 I-.493 J-.023 E.02455
G1 X47.374 Y176.691 E.34949
M204 S10000
G1 X47.561 Y177.098 F42000
G1 F8843.478
M204 S6000
G1 X47.508 Y177.098 E.00174
G3 X46.797 Y179.106 I-12.983 J-3.466 E.07076
G1 X46.602 Y179.066 E.0066
G1 X46.602 Y177.12 E.06457
G3 X46.15 Y176.692 I.997 J-1.505 E.02073
G3 X46.003 Y176.229 I.769 J-.499 E.01633
G1 X46.002 Y168.497 E.25646
G2 X26.798 Y171.894 I-9.3 J3.406 E.91648
G1 X26.798 Y179.068 E.23799
G1 X26.603 Y179.108 E.00661
G3 X25.602 Y174.493 I10.501 J-4.692 E.15776
G3 X25.611 Y171.462 I76.88 J-1.294 E.10055
G3 X36.873 Y160.805 I11.092 J.442 E.56941
G3 X46.439 Y166.579 I-.177 J11.104 E.38839
G1 X46.816 Y167.302 E.02703
G1 X57.935 Y167.303 E.36885
G3 X58.797 Y168.167 I-.048 J.909 E.04435
G1 X58.797 Y176.235 E.26763
G3 X57.929 Y177.097 I-.904 J-.042 E.04454
G1 X47.62 Y177.098 E.34196
M204 S250
G1 X47.798 Y177.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X46.21 Y180.944 I-11.731 J-3.301 E.11731
G1 X46.21 Y177.302 E.11192
G3 X45.611 Y176.248 I.808 J-1.156 E.03852
G1 X45.61 Y168.573 E.23582
G2 X27.19 Y171.898 I-8.909 J3.329 E.81345
G1 X27.19 Y180.944 E.27797
G3 X25.21 Y174.497 I9.531 J-6.455 E.21031
G3 X25.219 Y171.447 I77.355 J-1.298 E.09374
G3 X36.883 Y160.413 I11.484 J.457 E.54621
G3 X47.054 Y166.91 I-.215 J11.545 E.39019
G1 X57.951 Y166.911 E.33484
G3 X59.189 Y168.15 I-.068 J1.306 E.05898
G1 X59.189 Y176.25 E.24889
G3 X57.948 Y177.489 I-1.3 J-.061 E.0591
G1 X47.858 Y177.49 E.31004
M204 S10000
G1 X46.997 Y177.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362585
G1 F11261.805
M204 S6000
G1 X46.966 Y177.624 E.00543
; LINE_WIDTH: 0.323062
M73 P47 R13
G1 F12850.648
G1 X46.936 Y177.83 E.00475
; LINE_WIDTH: 0.280665
G1 F15000
G1 X46.913 Y177.965 E.00265
; LINE_WIDTH: 0.235367
G1 X46.891 Y178.1 E.00214
; LINE_WIDTH: 0.190069
G1 X46.868 Y178.234 E.00164
; LINE_WIDTH: 0.149793
G1 X46.848 Y178.342 E.00095
; LINE_WIDTH: 0.114544
G1 X46.828 Y178.449 E.00064
M204 S10000
G1 X46.997 Y177.418 F42000
; LINE_WIDTH: 0.402108
G1 F10022.618
M204 S6000
G1 X47.028 Y177.212 E.0061
; WIPE_START
G1 X46.997 Y177.418 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X47.099 Y169.787 Z1.2 F42000
G1 X47.125 Y167.872 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42236
G1 F9487.665
M204 S6000
G1 X46.714 Y168.283 E.01797
G1 X46.742 Y168.354 E.00237
G1 X46.742 Y168.792 E.01351
G1 X47.492 Y168.042 E.03277
G1 X48.028 Y168.042 E.01659
G1 X46.743 Y169.328 E.05622
G1 X46.743 Y169.865 E.01659
G1 X48.565 Y168.042 E.07968
G1 X49.101 Y168.042 E.01659
G1 X46.743 Y170.401 E.10314
G1 X46.743 Y170.938 E.01659
G1 X49.638 Y168.042 E.1266
G1 X50.175 Y168.042 E.01659
G1 X46.743 Y171.474 E.15006
G1 X46.743 Y172.011 E.01659
G1 X50.711 Y168.043 E.17351
G1 X51.248 Y168.043 E.01659
G1 X46.743 Y172.547 E.19697
G1 X46.743 Y173.084 E.01659
G1 X51.784 Y168.043 E.22043
G1 X52.321 Y168.043 E.01659
G1 X46.743 Y173.62 E.24389
G1 X46.743 Y174.157 E.01659
G1 X52.857 Y168.043 E.26735
G1 X53.394 Y168.043 E.01659
G1 X46.743 Y174.693 E.29081
G1 X46.743 Y175.23 E.01659
G1 X53.93 Y168.043 E.31426
G1 X54.467 Y168.043 E.01659
G1 X46.743 Y175.766 E.33772
G1 X46.744 Y176.179 E.01275
G2 X46.772 Y176.274 I.149 J.007 E.00314
G1 X55.003 Y168.043 E.35993
G1 X55.54 Y168.043 E.01659
G1 X47.226 Y176.357 E.36356
G1 X47.762 Y176.357 E.01659
G1 X56.077 Y168.043 E.36356
G1 X56.613 Y168.043 E.01659
G1 X48.299 Y176.357 E.36355
G1 X48.836 Y176.357 E.01659
G1 X57.15 Y168.043 E.36355
G1 X57.686 Y168.043 E.01659
G1 X49.372 Y176.357 E.36354
G1 X49.909 Y176.357 E.01659
M73 P48 R13
G1 X58.053 Y168.213 E.3561
G1 X58.056 Y168.746 E.01648
G1 X50.446 Y176.357 E.3328
G1 X50.982 Y176.357 E.01659
G1 X58.056 Y169.283 E.30933
G1 X58.056 Y169.819 E.01659
G1 X51.519 Y176.357 E.28586
G1 X52.056 Y176.357 E.01659
G1 X58.056 Y170.356 E.2624
G1 X58.056 Y170.893 E.01659
G1 X52.592 Y176.357 E.23893
G1 X53.129 Y176.357 E.01659
G1 X58.056 Y171.429 E.21546
G1 X58.056 Y171.966 E.01659
G1 X53.666 Y176.357 E.192
G1 X54.202 Y176.357 E.01659
G1 X58.056 Y172.503 E.16853
G1 X58.056 Y173.039 E.01659
G1 X54.739 Y176.357 E.14506
G1 X55.276 Y176.357 E.01659
G1 X58.056 Y173.576 E.12159
G1 X58.056 Y174.112 E.01659
G1 X55.812 Y176.356 E.09813
G1 X56.349 Y176.356 E.01659
G1 X58.056 Y174.649 E.07466
G1 X58.056 Y175.186 E.01659
G1 X56.886 Y176.356 E.05119
G1 X57.422 Y176.356 E.01659
G1 X58.056 Y175.722 E.02773
G1 X58.056 Y176.193 E.01455
G3 X58.026 Y176.287 I-.182 J-.007 E.00309
G3 X57.789 Y176.526 I-2.434 J-2.171 E.01041
; WIPE_START
G1 X58.026 Y176.287 E-.12787
G1 X58.056 Y176.193 E-.03756
G1 X58.056 Y175.722 E-.17877
G1 X57.422 Y176.356 E-.34076
G1 X57.225 Y176.356 E-.07505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X49.61 Y176.876 Z1.2 F42000
G1 X26.572 Y178.449 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121
G1 F15000
M204 S6000
G1 X26.546 Y178.305 E.00093
; LINE_WIDTH: 0.169174
G1 X26.519 Y178.161 E.00151
; LINE_WIDTH: 0.215946
G1 X26.497 Y178.023 E.00197
; LINE_WIDTH: 0.261352
G1 X26.474 Y177.885 E.00249
; LINE_WIDTH: 0.306758
G1 F13644.781
G1 X26.451 Y177.747 E.00301
; LINE_WIDTH: 0.349321
G1 F11749.339
G1 X26.431 Y177.61 E.00346
; LINE_WIDTH: 0.389057
G1 F10400.532
G1 X26.411 Y177.472 E.00391
; LINE_WIDTH: 0.428792
G1 F9329.517
G1 X26.392 Y177.335 E.00436
; LINE_WIDTH: 0.465719
G1 F8514.695
G1 X26.374 Y177.199 E.00473
; LINE_WIDTH: 0.499823
G1 F7879.132
G1 X26.357 Y177.063 E.00511
; LINE_WIDTH: 0.533928
G1 F7331.861
G1 X26.34 Y176.927 E.00549
; LINE_WIDTH: 0.566036
G1 F6881.839
G1 X26.297 Y176.515 E.01766
; OBJECT_ID: 3
; WIPE_START
G1 X26.34 Y176.927 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X28.023 Y169.482 Z1.2 F42000
G1 X32.728 Y148.667 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X32.677 Y148.657 E.00175
G3 X26.391 Y141.01 I1.537 J-7.671 E.35552
G1 X26.391 Y106.99 E1.12848
G3 X34.19 Y99.191 I7.828 J.029 E.406
G1 X87.71 Y99.191 E1.77533
G3 X95.509 Y106.99 I-.024 J7.823 E.40607
G1 X95.509 Y141.01 E1.12848
G3 X87.71 Y148.809 I-7.823 J-.024 E.40607
G1 X34.19 Y148.809 E1.77533
G3 X33.283 Y148.754 I.024 J-7.823 E.03019
G1 X32.788 Y148.677 E.01662
M204 S10000
G1 X32.792 Y148.266 F42000
G1 F8843.478
M204 S6000
G1 X32.756 Y148.257 E.00121
G3 X26.798 Y141.006 I1.457 J-7.271 E.3371
G1 X26.798 Y106.994 E1.12823
G3 X34.194 Y99.598 I7.42 J.024 E.38505
G1 X87.706 Y99.598 E1.77508
G3 X95.102 Y106.994 I-.019 J7.416 E.38512
G1 X95.102 Y141.006 E1.12822
G3 X87.706 Y148.402 I-7.416 J-.019 E.38512
G1 X34.194 Y148.402 E1.77508
G3 X33.33 Y148.349 I.019 J-7.416 E.02872
G1 X32.851 Y148.275 E.01609
M204 S250
G1 X32.853 Y147.879 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X32.833 Y147.873 E.00065
G3 X27.19 Y141.002 I1.38 J-6.886 E.29582
G1 X27.19 Y106.998 E1.04485
G3 X34.198 Y99.99 I7.028 J.02 E.33799
G1 X87.702 Y99.99 E1.64403
G3 X94.71 Y106.998 I-.015 J7.023 E.33805
G1 X94.71 Y141.002 E1.04485
G3 X87.702 Y148.01 I-7.023 J-.015 E.33805
G1 X34.198 Y148.01 E1.64403
G3 X33.376 Y147.96 I.015 J-7.023 E.0253
G1 X32.912 Y147.888 E.01443
; WIPE_START
M204 S6000
G1 X32.833 Y147.873 E-.0308
G1 X32.034 Y147.667 E-.31352
G1 X31.517 Y147.476 E-.20923
G1 X31.028 Y147.239 E-.20646
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.733 Y141.229 Z1.2 F42000
G1 X68.941 Y98.809 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y98.809 E.62194
G3 X95.891 Y107.01 I-.006 J8.207 E.42723
G1 X95.891 Y140.99 E1.12718
G3 X87.69 Y149.191 I-8.195 J.006 E.4274
G1 X34.21 Y149.191 E1.77403
G3 X26.009 Y140.99 I.006 J-8.207 E.42723
G1 X26.009 Y107.01 E1.12718
G3 X34.21 Y98.809 I8.207 J.006 E.42723
G1 X52.959 Y98.809 E.62194
G1 X52.959 Y93.82 E.16551
G3 X53.48 Y93.309 I.501 J-.01 E.02709
G1 X68.456 Y93.31 E.49678
G3 X68.941 Y93.82 I-.01 J.495 E.02597
G1 X68.941 Y98.749 E.16351
M204 S10000
G1 X69.348 Y98.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y98.402 E.60858
G3 X96.298 Y107.006 I-.011 J8.614 E.44816
G1 X96.298 Y140.994 E1.12745
G3 X87.694 Y149.598 I-8.602 J.002 E.44833
G1 X34.206 Y149.598 E1.7743
G3 X25.602 Y140.994 I.01 J-8.614 E.44816
G1 X25.602 Y107.006 E1.12745
G3 X34.206 Y98.402 I8.614 J.01 E.44816
G1 X52.552 Y98.402 E.60858
G1 X52.552 Y93.812 E.15226
G3 X53.468 Y92.902 I.911 J.001 E.04759
G1 X68.47 Y92.903 E.49766
G3 X69.348 Y93.812 I-.027 J.905 E.0464
G1 X69.348 Y98.342 E.15027
M204 S250
G1 X69.74 Y98.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y98.01 E.5518
G3 X96.69 Y107.002 I-.015 J9.007 E.43382
G1 X96.69 Y140.998 E1.0446
G3 X87.698 Y149.99 I-8.994 J-.002 E.43398
G1 X34.202 Y149.99 E1.64378
G3 X25.21 Y140.998 I.002 J-8.994 E.43398
G1 X25.21 Y107.002 E1.0446
G3 X34.202 Y98.01 I8.994 J.002 E.43398
G1 X52.16 Y98.01 E.5518
G1 X52.16 Y93.804 E.12923
G3 X53.456 Y92.51 I1.306 J.012 E.06237
G1 X68.484 Y92.511 E.46177
G3 X69.74 Y93.804 I-.044 J1.299 E.06121
G1 X69.74 Y97.95 E.12739
; WIPE_START
M204 S6000
G1 X71.74 Y97.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.997 Y96.49 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519075
G1 F7560.564
M204 S6000
G1 X66.236 Y96.49 E.00925
G1 X66.235 Y96.014 E.01848
G1 X55.664 Y96.013 E.41017
G1 X55.664 Y96.489 E.01847
G1 X65.937 Y96.49 E.39861
M204 S10000
G1 X66.663 Y96.917 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.662 Y95.587 E.04086
G1 X55.238 Y95.587 E.35102
G1 X55.237 Y96.916 E.04084
G1 X66.603 Y96.917 E.34921
M204 S10000
G1 X67.04 Y97.294 F42000
G1 F9547.299
M204 S6000
G1 X67.039 Y95.21 E.06403
G1 X54.861 Y95.21 E.37418
G1 X54.86 Y97.293 E.06401
G1 X66.98 Y97.294 E.3724
M204 S10000
G1 X67.417 Y97.671 F42000
G1 F9547.299
M204 S6000
G1 X67.416 Y94.833 E.0872
G1 X54.484 Y94.832 E.39734
G1 X54.483 Y97.67 E.08718
G1 X67.357 Y97.671 E.39558
M204 S10000
G1 X67.794 Y98.048 F42000
G1 F9547.299
M204 S6000
G1 X67.792 Y94.456 E.11037
G1 X54.107 Y94.455 E.42051
G1 X54.106 Y98.047 E.11035
G1 X67.734 Y98.048 E.41876
M204 S10000
G1 X68.172 Y98.425 F42000
G1 F9547.299
M204 S6000
G1 X68.169 Y94.079 E.13355
G1 X53.73 Y94.078 E.44367
G1 X53.728 Y98.424 E.13352
G1 X68.112 Y98.425 E.44194
M204 S10000
G1 X68.549 Y98.803 F42000
G1 F9547.299
M204 S6000
G1 X68.546 Y93.862 E.15182
G1 X68.505 Y93.742 E.0039
G1 X68.369 Y93.702 E.00435
G1 X53.501 Y93.701 E.45685
G1 X53.379 Y93.754 E.00408
G1 X53.353 Y93.857 E.00326
G1 X53.351 Y98.801 E.15191
G1 X68.489 Y98.803 E.46512
; OBJECT_ID: 1
; WIPE_START
G1 X66.489 Y98.802 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X69.187 Y91.663 Z1.2 F42000
G1 X91.297 Y33.15 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.943 Y33.646 E.02705
G3 X94.509 Y39.19 I-4.757 J5.567 E.20904
G1 X94.509 Y73.21 E1.12848
G3 X87.21 Y80.509 I-7.322 J-.023 E.38003
G1 X33.69 Y80.509 E1.77533
G3 X26.391 Y73.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E1.12848
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X91.245 Y33.118 I-.023 J7.322 E.14194
M204 S10000
G1 X91.051 Y33.474 F42000
G1 F8843.478
M204 S6000
G1 X91.679 Y33.956 E.02626
G3 X94.102 Y39.194 I-4.492 J5.257 E.1975
G1 X94.102 Y73.206 E1.12822
G3 X87.206 Y80.102 I-6.915 J-.018 E.35908
G1 X33.694 Y80.102 E1.77508
G3 X26.798 Y73.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E1.12822
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X91 Y33.444 I-.018 J6.915 E.13333
M204 S250
G1 X90.814 Y33.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X93.71 Y39.198 I-3.626 J5.421 E.19621
G1 X93.71 Y73.202 E1.04485
G3 X87.202 Y79.71 I-6.522 J-.014 E.31393
G1 X33.698 Y79.71 E1.64403
G3 X27.19 Y73.202 I.014 J-6.522 E.31393
G1 X27.19 Y39.198 E1.04485
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.202 Y32.69 E1.64403
G3 X90.764 Y33.758 I-.014 J6.522 E.11587
; WIPE_START
M204 S6000
G1 X91.428 Y34.25 E-.31393
G1 X91.803 Y34.597 E-.19422
M73 P49 R13
G1 X92.15 Y34.972 E-.19422
G1 X92.242 Y35.093 E-.05763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.694 Y33.957 Z1.2 F42000
G1 X68.441 Y31.509 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I.006 J7.695 E.40135
G1 X94.891 Y73.19 E1.12718
G3 X87.19 Y80.891 I-7.695 J.006 E.40134
G1 X33.71 Y80.891 E1.77403
G3 X31.1 Y80.437 I.006 J-7.76 E.08831
G3 X26.009 Y73.19 I2.624 J-7.255 E.31291
G1 X26.009 Y39.21 E1.12718
G3 X33.71 Y31.509 I7.695 J-.006 E.40135
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.52 E.16551
G3 X52.98 Y26.009 I.498 J-.013 E.02714
G1 X67.956 Y26.01 E.49678
G3 X68.441 Y26.53 I-.008 J.494 E.02633
G1 X68.441 Y31.449 E.16318
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I.002 J8.102 E.42229
G1 X95.298 Y73.194 E1.12745
G3 X87.194 Y81.298 I-8.102 J.002 E.42228
G1 X33.706 Y81.298 E1.77431
G3 X25.602 Y73.194 I-.002 J-8.102 E.42228
G1 X25.602 Y39.206 E1.12745
G3 X33.706 Y31.102 I8.102 J-.002 E.42229
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.512 E.15226
G3 X52.968 Y25.602 I.906 J-.004 E.04766
G1 X67.97 Y25.603 E.49766
G3 X68.848 Y26.518 I-.022 J.9 E.04666
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X95.62 Y38.122 I-.001 J8.492 E.37656
G3 X95.69 Y39.202 I-13.108 J1.392 E.03328
G1 X95.69 Y73.198 E1.0446
G3 X87.198 Y81.69 I-8.494 J-.002 E.40985
G1 X33.702 Y81.69 E1.64378
G3 X30.838 Y81.192 I.014 J-8.559 E.08975
G3 X25.21 Y73.198 I2.888 J-8.012 E.31997
G1 X25.21 Y39.202 E1.0446
G3 X33.702 Y30.71 I8.494 J.002 E.40985
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.504 E.12923
G3 X52.956 Y25.21 I1.3 J.006 E.06245
G1 X67.984 Y25.211 E.46176
G3 X69.24 Y26.506 I-.036 J1.292 E.06137
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.496 Y29.19 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51898
G1 F7562.073
M204 S6000
G1 X65.734 Y29.19 E.00925
G1 X65.734 Y28.714 E.01847
G1 X55.164 Y28.713 E.41002
G1 X55.164 Y29.189 E.01846
G1 X65.436 Y29.19 E.39848
M204 S10000
G1 X66.161 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.287 E.04085
G1 X54.738 Y28.287 E.35096
G1 X54.737 Y29.616 E.04083
G1 X66.101 Y29.617 E.34918
M204 S10000
G1 X66.539 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.91 E.06402
G1 X54.361 Y27.91 E.37411
G1 X54.36 Y29.993 E.064
G1 X66.479 Y29.994 E.37237
M204 S10000
G1 X66.916 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.533 E.0872
G1 X53.984 Y27.532 E.39727
G1 X53.983 Y30.37 E.08718
G1 X66.856 Y30.371 E.39556
M204 S10000
G1 X67.294 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.156 E.11037
G1 X53.607 Y27.155 E.42042
G1 X53.606 Y30.747 E.11035
G1 X67.234 Y30.748 E.41875
M204 S10000
G1 X67.671 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.779 E.13354
G1 X53.23 Y26.778 E.44358
G1 X53.228 Y31.124 E.13352
G1 X67.611 Y31.125 E.44194
M204 S10000
G1 X68.049 Y31.502 F42000
G1 F9547.299
M204 S6000
G1 X68.043 Y26.54 E.15249
G1 X68.009 Y26.444 E.00311
G1 X67.869 Y26.402 E.00451
G1 X53.001 Y26.401 E.45683
G1 X52.88 Y26.451 E.00402
G1 X52.853 Y26.558 E.0034
G1 X52.851 Y31.501 E.15187
G1 X67.989 Y31.502 E.46512
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.989 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 5/15
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S173.4
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-.457 J1.128 P1  F42000
G1 X175.399 Y75.836 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X175.234 Y76.272 E.01547
G3 X168.31 Y80.909 I-6.947 J-2.886 E.29298
G1 X114.79 Y80.909 E1.77533
G3 X107.291 Y73.41 I.023 J-7.523 E.39044
G1 X107.291 Y39.39 E1.12848
G3 X114.79 Y31.891 I7.523 J.023 E.39045
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.013 J7.512 E.39059
G1 X175.809 Y73.41 E1.12848
G3 X175.438 Y75.719 I-7.523 J-.023 E.07791
G1 X175.418 Y75.779 E.0021
M204 S10000
G1 X175.017 Y75.695 F42000
G1 F8843.478
M204 S6000
G1 X174.858 Y76.116 E.01494
G3 X168.306 Y80.502 I-6.571 J-2.729 E.2772
G1 X114.794 Y80.502 E1.77508
G3 X107.698 Y73.406 I.019 J-7.115 E.3695
G1 X107.698 Y39.394 E1.12822
G3 X114.794 Y32.298 I7.115 J.019 E.3695
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.009 J7.105 E.36964
G1 X175.402 Y73.406 E1.12822
G3 X175.051 Y75.594 I-7.115 J-.019 E.0738
G1 X175.036 Y75.638 E.00157
M204 S250
G1 X174.642 Y75.557 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X174.496 Y75.966 E.01334
G3 X168.302 Y80.11 I-6.208 J-2.579 E.24269
G1 X114.798 Y80.11 E1.64403
G3 X108.09 Y73.402 I.015 J-6.722 E.32357
G1 X108.09 Y39.398 E1.04485
G3 X114.798 Y32.69 I6.722 J.015 E.32357
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.005 J6.713 E.3237
G1 X175.01 Y73.402 E1.04485
G3 X174.755 Y75.22 I-6.722 J-.015 E.0566
G1 X174.661 Y75.501 E.00908
; WIPE_START
M204 S6000
G1 X174.496 Y75.966 E-.18781
G1 X174.154 Y76.679 E-.30011
G1 X173.879 Y77.128 E-.20022
G1 X173.768 Y77.281 E-.07187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.197 Y70.535 Z1.4 F42000
G1 X149.541 Y31.509 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I.006 J7.895 E.41177
G1 X176.191 Y73.39 E1.12718
G3 X168.29 Y81.291 I-7.895 J.006 E.41177
G1 X114.81 Y81.291 E1.77403
G3 X106.909 Y73.39 I-.006 J-7.895 E.41176
G1 X106.909 Y39.41 E1.12718
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.52 E.16551
G3 X134.08 Y26.009 I.495 J-.016 E.02718
G1 X149.052 Y26.01 E.49665
G3 X149.541 Y26.52 I-.004 J.493 E.02613
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
M73 P50 R13
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I.002 J8.302 E.4327
G1 X176.598 Y73.394 E1.12745
G3 X168.294 Y81.698 I-8.302 J.002 E.4327
G1 X114.806 Y81.698 E1.7743
G3 X106.502 Y73.394 I-.002 J-8.302 E.4327
G1 X106.502 Y39.406 E1.12745
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.512 E.15227
G3 X134.068 Y25.602 I.903 J-.007 E.0477
G1 X149.066 Y25.603 E.49751
G3 X149.948 Y26.512 I-.018 J.9 E.04661
G1 X149.948 Y31.042 E.15028
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.99 Y39.402 I-.002 J8.694 E.4195
G1 X176.99 Y73.398 E1.0446
G3 X168.298 Y82.09 I-8.694 J-.002 E.41951
G1 X114.802 Y82.09 E1.64378
G3 X106.11 Y73.398 I.002 J-8.694 E.41951
G1 X106.11 Y39.402 E1.0446
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.504 E.12923
G3 X134.056 Y25.21 I1.296 J.002 E.06251
G1 X149.079 Y25.211 E.46162
G3 X150.34 Y26.504 I-.032 J1.292 E.06145
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 5 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer5 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X149.171 Y26.441 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G2 X149.021 Y26.358 I-.147 J.09 E.00594
G1 X147.572 Y26.358 E.04805
G1 X147.447 Y26.49 E.00604
G1 X146.791 Y26.818 E.0243
G3 X145.377 Y26.358 I-.333 J-1.381 E.05193
G1 X142.331 Y26.358 E.10104
G1 X142.205 Y26.49 E.00606
G1 X141.55 Y26.818 E.0243
G3 X140.135 Y26.358 I-.333 J-1.382 E.05194
G1 X137.09 Y26.358 E.10102
G1 X136.964 Y26.49 E.00607
G1 X136.309 Y26.818 E.0243
G3 X134.894 Y26.357 I-.332 J-1.382 E.05195
G1 X134.099 Y26.357 E.02636
G2 X133.909 Y26.506 I-.032 J.155 E.00908
G1 X133.909 Y28.055 E.0514
G3 X134.671 Y28.145 I.277 J.925 E.02618
G3 X135.654 Y29.111 I-3.691 J4.74 E.0458
G2 X136.964 Y29.481 I1.092 J-1.363 E.04639
G1 X137.292 Y29.363 E.01155
G2 X138.274 Y28.397 I-3.69 J-4.739 E.0458
G3 X139.585 Y28.028 I1.092 J1.363 E.04639
G1 X139.912 Y28.145 E.01155
G3 X140.895 Y29.111 I-3.691 J4.74 E.0458
G2 X142.205 Y29.481 I1.092 J-1.363 E.04639
G1 X142.533 Y29.363 E.01155
G2 X143.516 Y28.397 I-3.691 J-4.74 E.0458
G3 X144.826 Y28.028 I1.092 J1.363 E.04639
G1 X145.154 Y28.145 E.01155
G3 X146.136 Y29.111 I-3.691 J4.74 E.0458
G2 X147.447 Y29.481 I1.092 J-1.363 E.04639
G1 X147.774 Y29.363 E.01155
G2 X148.757 Y28.397 I-3.691 J-4.74 E.0458
G1 X149.191 Y28.18 E.01611
G1 X149.192 Y30.676 E.0828
G1 X148.757 Y30.648 E.01447
G2 X147.623 Y31.546 I.85 J2.24 E.04875
G1 X145.326 Y31.546 E.07617
G2 X143.516 Y30.648 I-1.747 J1.25 E.06979
G2 X142.382 Y31.545 I.85 J2.239 E.04872
G1 X140.084 Y31.545 E.07621
G2 X138.274 Y30.648 I-1.747 J1.25 E.06976
G2 X137.141 Y31.545 I.849 J2.238 E.04869
G1 X134.843 Y31.545 E.07624
G2 X133.908 Y30.8 I-1.494 J.916 E.04046
G1 X133.908 Y29.172 E.05401
; OBJECT_ID: 4
; WIPE_START
G1 X133.908 Y30.8 E-.61876
G1 X134.24 Y30.966 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X133.748 Y38.583 Z1.4 F42000
G1 X129.214 Y108.791 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X129.106 Y108.791 E.00355
G1 X129.008 Y109.114 E.0112
G1 X128.464 Y108.656 E.02358
G3 X128.31 Y108.309 I.332 J-.356 E.01294
G1 X128.309 Y100.519 E.25841
G2 X108.291 Y103.99 I-9.704 J3.493 E.95591
G1 X108.291 Y108.402 E.14636
G1 X108.068 Y108.422 E.00743
G3 X107.909 Y106.59 I10.799 J-1.858 E.06107
G3 X107.918 Y103.578 I76.426 J-1.29 E.09989
G3 X118.809 Y93.313 I10.699 J.441 E.5497
G3 X127.982 Y98.875 I-.211 J10.695 E.37276
G1 X128.469 Y99.809 E.03495
G1 X139.819 Y99.81 E.37651
G3 X140.29 Y100.29 I-.027 J.497 E.02449
G1 X140.29 Y108.319 E.26632
G3 X139.809 Y108.789 I-.497 J-.027 E.02449
G1 X129.274 Y108.791 E.34949
M204 S10000
G1 X129.46 Y109.198 F42000
G1 F8843.478
M204 S6000
G1 X129.408 Y109.198 E.00174
G3 X128.697 Y111.206 I-15.418 J-4.328 E.07074
G1 X128.502 Y111.166 E.0066
G1 X128.502 Y109.22 E.06457
G3 X128.05 Y108.792 I.997 J-1.506 E.02073
G3 X127.903 Y108.329 I.794 J-.508 E.01633
G1 X127.902 Y100.597 E.25646
G2 X108.698 Y103.994 I-9.299 J3.413 E.91613
G1 X108.698 Y111.168 E.23799
G1 X108.503 Y111.208 E.00661
G3 X107.502 Y106.593 I10.222 J-4.632 E.15782
G3 X107.511 Y103.562 I76.888 J-1.294 E.10055
G3 X118.819 Y92.906 I11.107 J.458 E.57072
G3 X128.339 Y98.679 I-.222 J11.102 E.38687
G1 X128.716 Y99.402 E.02703
G1 X139.835 Y99.403 E.36885
G3 X140.697 Y100.27 I-.048 J.909 E.04447
G1 X140.697 Y108.335 E.26752
G3 X139.829 Y109.197 I-.909 J-.048 E.04446
G1 X129.52 Y109.198 E.34197
M204 S250
G1 X129.698 Y109.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.11 Y113.044 I-11.277 J-3.093 E.11735
G1 X128.11 Y109.402 E.11192
G3 X127.511 Y108.348 I.784 J-1.142 E.03857
G1 X127.51 Y100.673 E.23582
G2 X109.09 Y103.998 I-8.908 J3.336 E.81314
G1 X109.09 Y113.044 E.27798
G3 X107.11 Y106.597 I9.53 J-6.455 E.21031
G3 X107.119 Y103.547 I77.358 J-1.298 E.09374
G3 X118.829 Y92.514 I11.499 J.474 E.54741
G3 X128.954 Y99.01 I-.26 J11.542 E.38877
G1 X139.85 Y99.011 E.33483
G3 X141.089 Y100.251 I-.068 J1.306 E.05902
G1 X141.089 Y108.35 E.24887
G3 X139.849 Y109.589 I-1.306 J-.068 E.05901
G1 X129.758 Y109.59 E.31005
M204 S10000
G1 X128.897 Y109.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362627
G1 F11260.307
M204 S6000
G1 X128.867 Y109.724 E.00542
; LINE_WIDTH: 0.323156
G1 F12846.328
G1 X128.836 Y109.93 E.00475
; LINE_WIDTH: 0.280742
G1 F15000
G1 X128.813 Y110.065 E.00265
; LINE_WIDTH: 0.235357
G1 X128.79 Y110.2 E.00215
; LINE_WIDTH: 0.189973
G1 X128.768 Y110.335 E.00164
; LINE_WIDTH: 0.149679
G1 X128.748 Y110.442 E.00095
; LINE_WIDTH: 0.114506
G1 X128.728 Y110.549 E.00064
M204 S10000
G1 X128.897 Y109.518 F42000
; LINE_WIDTH: 0.402099
G1 F10022.872
M204 S6000
G1 X128.928 Y109.312 E.00609
; WIPE_START
G1 X128.897 Y109.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.489 Y108.442 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.848 Y108.442 E.02124
G1 X128.83 Y108.503 E.00208
G1 X128.692 Y108.384 E.00602
G3 X128.658 Y107.647 I1.212 J-.425 E.02484
G2 X129.996 Y107.287 I.108 J-2.266 E.04671
G3 X130.979 Y106.322 I4.674 J3.775 E.0458
G3 X132.617 Y106.574 I.582 J1.669 E.05721
G2 X133.6 Y107.539 I4.675 J-3.776 E.0458
G2 X135.238 Y107.287 I.582 J-1.67 E.05721
G3 X136.221 Y106.322 I4.674 J3.774 E.0458
G3 X137.858 Y106.574 I.582 J1.67 E.05721
G1 X138.514 Y107.265 E.03159
G2 X139.169 Y107.657 I.861 J-.695 E.02586
G1 X139.824 Y107.615 E.02178
G1 X139.941 Y107.556 E.00436
G1 X139.941 Y105.002 E.08473
G1 X139.169 Y104.667 E.02794
G2 X138.186 Y103.701 I-4.674 J3.775 E.0458
G2 X136.548 Y103.953 I-.582 J1.669 E.05721
G3 X135.565 Y104.919 I-4.674 J-3.774 E.0458
G3 X133.927 Y104.667 I-.582 J-1.67 E.05721
G2 X132.945 Y103.701 I-4.674 J3.774 E.0458
G2 X131.307 Y103.953 I-.582 J1.669 E.05721
G3 X130.324 Y104.919 I-4.673 J-3.774 E.0458
G3 X128.686 Y104.667 I-.582 J-1.67 E.05721
G1 X128.658 Y102.405 E.07502
G2 X129.996 Y102.046 I.111 J-2.261 E.04673
G3 X130.979 Y101.081 I4.674 J3.775 E.0458
G3 X132.617 Y101.333 I.582 J1.67 E.05721
G2 X133.6 Y102.298 I4.674 J-3.775 E.0458
G2 X135.238 Y102.046 I.582 J-1.67 E.05721
G3 X136.221 Y101.081 I4.674 J3.774 E.0458
G3 X137.858 Y101.333 I.582 J1.67 E.05721
G1 X138.514 Y102.024 E.03159
G2 X139.169 Y102.416 I.861 J-.695 E.02586
G1 X139.824 Y102.374 E.02178
G1 X139.941 Y102.315 E.00436
G1 X139.941 Y100.687 E.05401
; WIPE_START
G1 X139.941 Y102.315 E-.61876
G1 X139.824 Y102.374 E-.04994
G1 X139.584 Y102.389 E-.0913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.098 Y103.874 Z1.4 F42000
G1 X108.197 Y108.615 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565993
G1 F6882.415
M204 S6000
G1 X108.24 Y109.027 E.01768
; LINE_WIDTH: 0.533847
G1 F7333.073
G1 X108.257 Y109.163 E.00549
; LINE_WIDTH: 0.49974
G1 F7880.575
G1 X108.275 Y109.299 E.0051
; LINE_WIDTH: 0.465633
G1 F8516.428
G1 X108.292 Y109.436 E.00472
; LINE_WIDTH: 0.428732
G1 F9330.982
G1 X108.311 Y109.573 E.00436
; LINE_WIDTH: 0.388995
G1 F10402.387
G1 X108.331 Y109.71 E.00391
; LINE_WIDTH: 0.349258
G1 F11751.75
G1 X108.351 Y109.847 E.00346
; LINE_WIDTH: 0.306739
G1 F13645.731
G1 X108.374 Y109.985 E.003
; LINE_WIDTH: 0.261417
G1 F15000
G1 X108.396 Y110.123 E.00249
; LINE_WIDTH: 0.216094
G1 X108.419 Y110.26 E.00197
; LINE_WIDTH: 0.169312
G1 X108.446 Y110.405 E.00151
; LINE_WIDTH: 0.121057
G1 X108.472 Y110.549 E.00093
; OBJECT_ID: 5
; WIPE_START
G1 X108.446 Y110.405 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X116.076 Y110.217 Z1.4 F42000
G1 X173.978 Y108.789 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.867 Y108.789 E.00368
G1 X173.773 Y109.083 E.01023
G1 X173.265 Y108.655 E.02206
G3 X173.11 Y108.307 I.332 J-.356 E.01295
G1 X173.109 Y100.683 E.25291
G2 X152.691 Y104.189 I-9.906 J3.52 E.97601
G1 X152.691 Y108.221 E.13376
G1 X152.468 Y108.241 E.00741
G3 X152.309 Y106.388 I12.725 J-2.026 E.06172
G3 X152.318 Y103.764 I65.929 J-1.09 E.08706
G3 X163.169 Y93.31 I10.884 J.438 E.55194
G3 X172.7 Y98.874 I.028 J10.898 E.3839
G1 X173.199 Y99.808 E.03512
G1 X184.619 Y99.809 E.37882
G3 X185.09 Y100.289 I-.027 J.497 E.02449
G1 X185.09 Y108.318 E.26632
G3 X184.619 Y108.788 I-.495 J-.024 E.0242
G1 X174.038 Y108.789 E.35099
M204 S10000
G1 X174.219 Y109.196 F42000
G1 F8843.478
M204 S6000
G1 X174.164 Y109.196 E.00181
G3 X173.494 Y111.048 I-16.709 J-4.999 E.06536
G1 X173.302 Y111.006 E.00653
G1 X173.302 Y109.218 E.0593
G3 X172.85 Y108.791 I1 J-1.509 E.02073
G3 X172.703 Y108.327 I.794 J-.507 E.01633
G1 X172.702 Y100.761 E.25099
G2 X153.098 Y104.193 I-9.5 J3.441 E.9362
G1 X153.098 Y111.005 E.22597
G1 X152.904 Y111.045 E.00658
G3 X151.902 Y106.393 I10.664 J-4.73 E.159
G3 X151.911 Y103.748 I66.385 J-1.094 E.08772
G3 X163.17 Y92.903 I11.291 J.454 E.57267
G3 X173.055 Y98.675 I.027 J11.305 E.39816
G1 X173.443 Y99.4 E.0273
G1 X184.635 Y99.402 E.37125
G3 X185.497 Y100.269 I-.048 J.91 E.04447
G1 X185.497 Y108.334 E.26751
G3 X184.635 Y109.195 I-.903 J-.041 E.04436
G1 X174.279 Y109.196 E.34353
M204 S250
G1 X174.451 Y109.588 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X172.91 Y112.904 I-12.028 J-3.574 E.11273
G1 X172.91 Y109.401 E.10764
G3 X172.311 Y108.346 I.784 J-1.143 E.03857
G1 X172.31 Y100.836 E.23078
G2 X153.49 Y104.196 I-9.109 J3.365 E.83168
G1 X153.49 Y112.907 E.26766
G3 X151.51 Y106.396 I9.758 J-6.524 E.21215
G3 X151.519 Y103.733 I66.875 J-1.098 E.08185
G3 X163.172 Y92.511 I11.683 J.47 E.54895
G3 X173.678 Y99.008 I-.002 J11.747 E.39971
G1 X184.651 Y99.01 E.33715
G3 X185.889 Y100.25 I-.068 J1.307 E.05901
G1 X185.889 Y108.349 E.24886
G3 X184.65 Y109.587 I-1.296 J-.057 E.05908
G1 X174.511 Y109.588 E.31157
M204 S10000
G1 X173.673 Y109.514 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.360899
G1 F11321.513
M204 S6000
G1 X173.707 Y109.294 E.00578
M204 S10000
G1 X173.673 Y109.514 F42000
; LINE_WIDTH: 0.312732
G1 F13342.66
M204 S6000
G1 X173.639 Y109.735 E.0049
; LINE_WIDTH: 0.264564
G1 F15000
G1 X173.604 Y109.955 E.00403
; LINE_WIDTH: 0.216537
G1 X173.579 Y110.099 E.00208
; LINE_WIDTH: 0.16869
G1 X173.553 Y110.244 E.0015
; LINE_WIDTH: 0.120844
G1 X173.528 Y110.388 E.00093
; WIPE_START
G1 X173.553 Y110.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X174.25 Y108.441 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.602 Y108.477 E.02153
G3 X173.478 Y108.36 I.124 J-.255 E.00574
G3 X173.458 Y107.579 I1.798 J-.435 E.0261
G1 X173.941 Y107.548 E.01605
G1 X174.596 Y107.22 E.0243
G3 X175.579 Y106.255 I4.674 J3.775 E.0458
G3 X177.217 Y106.507 I.582 J1.669 E.05721
G2 X178.2 Y107.472 I4.675 J-3.776 E.0458
G2 X179.838 Y107.22 I.581 J-1.67 E.05721
G3 X180.821 Y106.255 I4.674 J3.774 E.0458
G3 X182.458 Y106.507 I.582 J1.67 E.05721
M73 P51 R13
G1 X183.114 Y107.198 E.03159
G2 X183.769 Y107.59 I.861 J-.695 E.02586
G1 X184.424 Y107.548 E.02178
G1 X184.741 Y107.389 E.01178
G1 X184.741 Y104.948 E.08099
G1 X184.424 Y104.928 E.01055
G1 X183.769 Y104.6 E.0243
G2 X182.786 Y103.634 I-4.674 J3.775 E.0458
G2 X181.148 Y103.886 I-.582 J1.669 E.05721
G3 X180.165 Y104.852 I-4.674 J-3.774 E.0458
G3 X178.527 Y104.6 I-.582 J-1.67 E.05721
G2 X177.545 Y103.634 I-4.674 J3.774 E.0458
G2 X175.907 Y103.886 I-.582 J1.669 E.05721
G1 X175.252 Y104.577 E.03159
G3 X173.458 Y104.686 I-.958 J-.957 E.06517
G1 X173.458 Y102.338 E.07788
G1 X173.941 Y102.307 E.01608
G1 X174.596 Y101.979 E.0243
G3 X175.579 Y101.014 I4.674 J3.775 E.0458
G3 X177.217 Y101.265 I.582 J1.67 E.05721
G2 X178.2 Y102.231 I4.674 J-3.775 E.0458
G2 X179.838 Y101.979 I.582 J-1.67 E.05721
G3 X180.821 Y101.014 I4.674 J3.774 E.0458
G3 X182.458 Y101.265 I.582 J1.67 E.05721
G1 X183.114 Y101.957 E.03159
G2 X183.769 Y102.349 I.861 J-.695 E.02586
G1 X184.424 Y102.307 E.02178
G1 X184.741 Y102.148 E.01178
G1 X184.741 Y100.52 E.05401
; WIPE_START
G1 X184.741 Y102.148 E-.61876
G1 X184.424 Y102.307 E-.13493
G1 X184.407 Y102.308 E-.00632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X176.913 Y103.751 Z1.4 F42000
G1 X152.596 Y108.434 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556697
G1 F7006.938
M204 S6000
G1 X152.65 Y108.931 E.02092
; LINE_WIDTH: 0.513585
G1 F7648.763
G1 X152.668 Y109.073 E.00551
; LINE_WIDTH: 0.477033
G1 F8292.774
G1 X152.686 Y109.216 E.00508
; LINE_WIDTH: 0.440482
G1 F9055.204
G1 X152.705 Y109.358 E.00465
; LINE_WIDTH: 0.400991
G1 F10053.882
G1 X152.726 Y109.501 E.00422
; LINE_WIDTH: 0.358572
G1 F11404.963
G1 X152.747 Y109.644 E.00372
; LINE_WIDTH: 0.316154
G1 F13175.548
G1 X152.768 Y109.787 E.00322
; LINE_WIDTH: 0.270696
G1 F15000
G1 X152.793 Y109.931 E.00271
; LINE_WIDTH: 0.222168
G1 X152.817 Y110.075 E.00213
; LINE_WIDTH: 0.17364
G1 X152.841 Y110.219 E.00156
; LINE_WIDTH: 0.136252
G1 X152.857 Y110.302 E.00064
; LINE_WIDTH: 0.110036
G1 X152.872 Y110.385 E.00046
; OBJECT_ID: 6
; WIPE_START
G1 X152.857 Y110.302 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X160.487 Y110.128 Z1.4 F42000
G1 X219.315 Y108.79 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.202 Y108.79 E.00377
G1 X219.118 Y109.037 E.00866
G1 X218.665 Y108.655 E.01966
G3 X218.51 Y108.317 I.352 J-.365 E.0126
G1 X218.509 Y100.933 E.24497
G2 X197.838 Y101.787 I-10.205 J3.571 E.91495
G2 X197.491 Y104.489 I10.583 J2.735 E.09061
G1 X197.491 Y107.948 E.11473
G1 X197.264 Y107.964 E.00755
G3 X197.109 Y106.088 I14.815 J-2.165 E.06246
G3 X197.144 Y103.613 I31.437 J-.79 E.08215
G3 X208.612 Y93.314 I11.157 J.89 E.56394
G3 X217.979 Y98.882 I-.342 J11.239 E.37738
G1 X218.492 Y99.808 E.03509
G1 X230.019 Y99.809 E.38238
G3 X230.49 Y100.29 I-.024 J.494 E.02453
G1 X230.49 Y108.318 E.26631
G3 X230.009 Y108.788 I-.494 J-.024 E.02453
G1 X219.375 Y108.79 E.35275
M204 S10000
G1 X219.549 Y109.197 F42000
G1 F8843.478
M204 S6000
G1 X219.494 Y109.197 E.00185
G3 X218.898 Y110.81 I-15.24 J-4.711 E.05708
G1 X218.702 Y110.77 E.00662
G1 X218.702 Y109.219 E.05147
G3 X218.25 Y108.791 I.998 J-1.507 E.02073
G3 X218.103 Y108.333 I.799 J-.51 E.01613
G1 X218.102 Y101.009 E.24296
G2 X197.898 Y104.493 I-9.799 J3.501 E.96538
G1 X197.898 Y110.768 E.20817
G1 X197.704 Y110.809 E.00656
G3 X196.702 Y106.093 I10.646 J-4.727 E.16113
G3 X196.739 Y103.581 I31.819 J-.794 E.08336
G3 X208.626 Y92.908 I11.563 J.922 E.58455
G3 X218.331 Y98.678 I-.357 J11.647 E.39102
G1 X218.732 Y99.401 E.0274
G1 X230.035 Y99.402 E.37495
G3 X230.897 Y100.27 I-.041 J.902 E.04456
G1 X230.897 Y108.334 E.26751
G3 X230.029 Y109.195 I-.902 J-.041 E.04455
G1 X219.609 Y109.197 E.34565
M204 S250
G1 X219.775 Y109.589 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X218.31 Y112.695 I-12.291 J-3.898 E.10584
G1 X218.31 Y109.401 E.10121
G3 X217.711 Y108.349 I.808 J-1.157 E.03846
G1 X217.71 Y101.083 E.22325
G2 X198.29 Y104.497 I-9.408 J3.426 E.8587
G1 X198.29 Y112.695 E.2519
G3 X196.31 Y106.097 I10.202 J-6.658 E.2146
G3 X196.348 Y103.549 I32.186 J-.798 E.0783
G3 X208.639 Y92.516 I11.954 J.954 E.55985
G3 X218.963 Y99.009 I-.346 J12.003 E.39306
G1 X230.051 Y99.01 E.3407
G3 X231.289 Y100.25 I-.057 J1.295 E.05914
G1 X231.289 Y108.349 E.24886
G3 X230.049 Y109.588 I-1.295 J-.057 E.05913
G1 X219.835 Y109.589 E.31384
M204 S10000
G1 X219.048 Y109.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308097
G1 F13575.863
M204 S6000
G1 X219.075 Y109.267 E.00362
M204 S10000
G1 X219.048 Y109.433 F42000
; LINE_WIDTH: 0.267109
G1 F15000
M204 S6000
G1 X219.021 Y109.598 E.00306
; LINE_WIDTH: 0.226122
G1 X218.994 Y109.764 E.0025
; LINE_WIDTH: 0.185134
G1 X218.966 Y109.929 E.00194
; LINE_WIDTH: 0.147697
G1 X218.947 Y110.035 E.00092
; LINE_WIDTH: 0.113846
G1 X218.928 Y110.14 E.00062
M204 S10000
G1 X218.757 Y110.982 F42000
; LINE_WIDTH: 0.45426
G1 F8751.899
M204 S6000
G1 X218.545 Y111.935 E.03274
; WIPE_START
G1 X218.757 Y110.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X219.57 Y108.441 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X218.96 Y108.441 E.02023
G3 X218.859 Y108.283 I.102 J-.177 E.00649
G1 X218.858 Y107.46 E.02729
G1 X219.041 Y107.448 E.00608
G1 X219.696 Y107.12 E.0243
G3 X220.679 Y106.155 I4.674 J3.775 E.0458
G1 X221.007 Y106.037 E.01155
G3 X222.317 Y106.407 I.219 J1.732 E.04639
G2 X223.3 Y107.372 I4.675 J-3.776 E.0458
G1 X223.627 Y107.49 E.01155
G2 X224.938 Y107.12 I.219 J-1.732 E.04639
G3 X225.921 Y106.155 I4.674 J3.774 E.0458
G1 X226.248 Y106.037 E.01155
G3 X227.558 Y106.407 I.219 J1.732 E.04639
G2 X228.541 Y107.372 I4.675 J-3.775 E.0458
G1 X228.869 Y107.49 E.01155
G2 X230.141 Y107.139 I.222 J-1.679 E.04498
G1 X230.141 Y104.867 E.07537
G3 X228.869 Y104.5 I-.203 J-1.687 E.04514
G2 X227.886 Y103.534 I-4.674 J3.775 E.0458
G1 X227.558 Y103.416 E.01155
G2 X226.248 Y103.786 I-.219 J1.732 E.04639
G3 X225.265 Y104.752 I-4.674 J-3.774 E.0458
G1 X224.938 Y104.869 E.01155
G3 X223.627 Y104.5 I-.219 J-1.732 E.04639
G2 X222.645 Y103.534 I-4.674 J3.774 E.0458
G1 X222.317 Y103.416 E.01155
G2 X221.007 Y103.786 I-.219 J1.732 E.04639
G3 X220.024 Y104.752 I-4.673 J-3.774 E.0458
G1 X219.696 Y104.869 E.01155
G1 X219.041 Y104.828 E.02178
G1 X218.858 Y104.736 E.0068
G1 X218.858 Y102.219 E.0835
G1 X219.041 Y102.207 E.00611
G1 X219.696 Y101.879 E.0243
G3 X220.679 Y100.914 I4.674 J3.775 E.0458
G1 X221.007 Y100.796 E.01155
G3 X222.317 Y101.166 I.219 J1.732 E.04639
G2 X223.3 Y102.131 I4.674 J-3.775 E.0458
G1 X223.627 Y102.249 E.01155
G2 X224.938 Y101.879 I.219 J-1.733 E.04639
G3 X225.921 Y100.914 I4.674 J3.774 E.0458
G1 X226.248 Y100.796 E.01155
G3 X227.558 Y101.166 I.219 J1.732 E.04639
G2 X228.541 Y102.131 I4.674 J-3.774 E.0458
G1 X228.869 Y102.249 E.01155
G2 X230.141 Y101.898 I.222 J-1.679 E.04498
G1 X230.134 Y100.27 E.054
; WIPE_START
G1 X230.141 Y101.898 E-.61856
G1 X229.809 Y102.064 E-.14144
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X222.308 Y103.475 Z1.4 F42000
G1 X197.395 Y108.159 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56584
G1 F6884.417
M204 S6000
G1 X197.427 Y108.451 E.01252
; LINE_WIDTH: 0.531121
G1 F7374.024
G1 X197.459 Y108.743 E.01169
; LINE_WIDTH: 0.494336
G1 F7974.912
G1 X197.478 Y108.892 E.00552
; LINE_WIDTH: 0.455527
G1 F8725.01
G1 X197.498 Y109.04 E.00505
; LINE_WIDTH: 0.416719
G1 F9630.862
G1 X197.517 Y109.189 E.00457
; LINE_WIDTH: 0.374794
G1 F10847.499
G1 X197.54 Y109.339 E.00409
; LINE_WIDTH: 0.329741
G1 F12551.377
G1 X197.562 Y109.488 E.00353
; LINE_WIDTH: 0.284689
G1 F14890.279
G1 X197.585 Y109.638 E.00298
; LINE_WIDTH: 0.242847
G1 F15000
G1 X197.604 Y109.751 E.00187
; LINE_WIDTH: 0.20422
G1 X197.623 Y109.864 E.00151
; LINE_WIDTH: 0.165593
G1 X197.643 Y109.977 E.00114
; LINE_WIDTH: 0.126966
G1 X197.662 Y110.089 E.00078
; LINE_WIDTH: 0.102277
G1 X197.672 Y110.144 E.00027
; OBJECT_ID: 9
; WIPE_START
G1 X197.662 Y110.089 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X192.542 Y115.75 Z1.4 F42000
G1 X137.415 Y176.69 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.302 Y176.69 E.00377
G1 X137.218 Y176.937 E.00866
G1 X136.765 Y176.555 E.01966
G3 X136.61 Y176.218 I.352 J-.365 E.0126
G1 X136.609 Y168.832 E.24498
G2 X115.591 Y172.389 I-10.204 J3.579 E1.0052
G1 X115.591 Y175.848 E.11473
G1 X115.364 Y175.864 E.00755
G3 X115.209 Y173.989 I14.826 J-2.166 E.06245
G3 X115.244 Y171.513 I31.415 J-.79 E.08216
G1 X115.274 Y171.22 E.00976
G3 X126.712 Y161.214 I11.139 J1.193 E.554
G3 X136.079 Y166.782 I-.342 J11.239 E.37738
G1 X136.592 Y167.708 E.03509
G1 X148.119 Y167.709 E.38238
G3 X148.59 Y168.189 I-.024 J.494 E.02452
G1 X148.587 Y176.256 E.26759
G3 X148.109 Y176.688 I-.498 J-.07 E.02319
G1 X137.475 Y176.69 E.35275
M204 S10000
G1 X137.649 Y177.097 F42000
G1 F8843.478
M204 S6000
G1 X137.594 Y177.097 E.00185
G3 X136.998 Y178.71 I-15.241 J-4.711 E.05708
G1 X136.802 Y178.67 E.00662
G1 X136.802 Y177.119 E.05147
G3 X136.35 Y176.691 I.998 J-1.507 E.02073
G3 X136.203 Y176.233 I.799 J-.51 E.01613
G1 X136.202 Y168.909 E.24296
G2 X115.998 Y172.393 I-9.799 J3.501 E.96537
G1 X115.998 Y178.668 E.20816
G1 X115.804 Y178.709 E.00656
G3 X114.802 Y173.992 I10.646 J-4.728 E.16113
G3 X114.839 Y171.48 I31.79 J-.794 E.08336
G1 X114.869 Y171.179 E.01003
G3 X126.726 Y160.808 I11.544 J1.234 E.57434
G3 X136.432 Y166.578 I-.357 J11.647 E.39102
G1 X136.832 Y167.301 E.0274
G1 X148.135 Y167.302 E.37495
G3 X148.997 Y168.169 I-.041 J.902 E.04454
G1 X148.997 Y176.234 E.26753
G3 X148.129 Y177.095 I-.902 J-.041 E.04455
G1 X137.709 Y177.097 E.34564
M204 S250
G1 X137.875 Y177.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X136.41 Y180.595 I-11.614 J-3.578 E.10588
G1 X136.41 Y177.301 E.10121
G3 X135.811 Y176.248 I.808 J-1.157 E.03846
G1 X135.81 Y168.983 E.22325
G2 X116.39 Y172.397 I-9.408 J3.426 E.8587
G1 X116.39 Y180.595 E.2519
G3 X114.41 Y173.997 I10.203 J-6.658 E.2146
G3 X114.478 Y171.141 I26.47 J-.795 E.08782
G3 X114.959 Y168.818 I13.586 J1.603 E.07297
G3 X126.739 Y160.416 I11.462 J3.61 E.47712
G3 X137.063 Y166.909 I-.346 J12.003 E.39306
G1 X148.151 Y166.91 E.3407
G3 X149.389 Y168.15 I-.057 J1.295 E.05912
G1 X149.389 Y176.249 E.24887
G3 X148.148 Y177.488 I-1.295 J-.057 E.05913
G1 X137.935 Y177.489 E.31384
M204 S10000
G1 X137.148 Y177.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308116
G1 F13574.876
M204 S6000
G1 X137.175 Y177.167 E.00362
M204 S10000
G1 X137.148 Y177.333 F42000
; LINE_WIDTH: 0.26714
G1 F15000
M204 S6000
G1 X137.121 Y177.498 E.00306
; LINE_WIDTH: 0.226164
G1 X137.094 Y177.664 E.0025
; LINE_WIDTH: 0.185188
G1 X137.067 Y177.829 E.00194
; LINE_WIDTH: 0.147759
G1 X137.047 Y177.935 E.00092
; LINE_WIDTH: 0.113867
G1 X137.028 Y178.04 E.00062
M204 S10000
G1 X136.857 Y178.882 F42000
; LINE_WIDTH: 0.454245
G1 F8752.219
M204 S6000
G1 X136.646 Y179.835 E.03274
; WIPE_START
G1 X136.857 Y178.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.67 Y176.341 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.06 Y176.341 E.02023
G3 X136.959 Y176.183 I.102 J-.177 E.00649
G1 X136.958 Y175.36 E.02729
G1 X137.141 Y175.348 E.00608
G1 X137.796 Y175.02 E.0243
G3 X138.779 Y174.055 I4.674 J3.775 E.0458
G1 X139.107 Y173.937 E.01155
G3 X140.417 Y174.307 I.219 J1.732 E.04639
G2 X141.4 Y175.272 I4.675 J-3.776 E.0458
G1 X141.727 Y175.39 E.01155
G2 X143.038 Y175.02 I.219 J-1.732 E.04639
G3 X144.021 Y174.055 I4.674 J3.774 E.0458
G1 X144.348 Y173.937 E.01155
G3 X145.658 Y174.307 I.219 J1.732 E.04639
G2 X146.641 Y175.272 I4.675 J-3.775 E.0458
G1 X146.969 Y175.39 E.01155
G2 X148.241 Y175.039 I.222 J-1.679 E.04499
G1 X148.241 Y172.767 E.07537
G3 X146.969 Y172.4 I-.203 J-1.687 E.04514
G2 X145.986 Y171.434 I-4.674 J3.775 E.0458
G1 X145.658 Y171.316 E.01155
G2 X144.348 Y171.686 I-.219 J1.732 E.04639
G3 X143.365 Y172.652 I-4.674 J-3.774 E.0458
G1 X143.038 Y172.769 E.01155
G3 X141.727 Y172.4 I-.219 J-1.732 E.04639
G2 X140.745 Y171.434 I-4.674 J3.774 E.0458
G1 X140.417 Y171.316 E.01155
G2 X139.107 Y171.686 I-.219 J1.732 E.04639
G3 X138.124 Y172.652 I-4.673 J-3.774 E.0458
G1 X137.796 Y172.769 E.01155
G1 X137.141 Y172.728 E.02178
G1 X136.958 Y172.636 E.0068
G1 X136.958 Y170.119 E.0835
G1 X137.141 Y170.107 E.00611
G1 X137.796 Y169.779 E.0243
G3 X138.779 Y168.814 I4.674 J3.775 E.0458
G1 X139.107 Y168.696 E.01155
G3 X140.417 Y169.066 I.219 J1.732 E.04639
G2 X141.4 Y170.031 I4.674 J-3.775 E.0458
G1 X141.727 Y170.149 E.01155
G2 X143.038 Y169.779 I.219 J-1.733 E.04639
G3 X144.021 Y168.814 I4.674 J3.774 E.0458
G1 X144.348 Y168.696 E.01155
G3 X145.658 Y169.066 I.219 J1.732 E.04639
G2 X146.641 Y170.031 I4.674 J-3.774 E.0458
G1 X146.969 Y170.149 E.01155
G2 X148.241 Y169.798 I.222 J-1.679 E.04498
G1 X148.227 Y168.171 E.05396
; WIPE_START
G1 X148.241 Y169.798 E-.61815
G1 X147.908 Y169.965 E-.14186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.407 Y171.375 Z1.4 F42000
G1 X115.495 Y176.059 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565815
G1 F6884.757
M204 S6000
G1 X115.527 Y176.351 E.01252
; LINE_WIDTH: 0.531083
G1 F7374.59
G1 X115.559 Y176.643 E.01169
; LINE_WIDTH: 0.494299
G1 F7975.572
G1 X115.578 Y176.792 E.00552
; LINE_WIDTH: 0.455495
G1 F8725.691
G1 X115.598 Y176.941 E.00505
; LINE_WIDTH: 0.416692
G1 F9631.558
G1 X115.617 Y177.089 E.00457
; LINE_WIDTH: 0.374798
M73 P51 R12
G1 F10847.357
G1 X115.64 Y177.239 E.00408
; LINE_WIDTH: 0.329795
G1 F12549.051
G1 X115.662 Y177.388 E.00353
; LINE_WIDTH: 0.284791
G1 F14884
G1 X115.685 Y177.537 E.00298
; LINE_WIDTH: 0.242985
G1 F15000
G1 X115.704 Y177.65 E.00187
; LINE_WIDTH: 0.204355
G1 X115.723 Y177.763 E.00151
; LINE_WIDTH: 0.165724
G1 X115.743 Y177.876 E.00115
; LINE_WIDTH: 0.127094
G1 X115.762 Y177.989 E.00079
; LINE_WIDTH: 0.102359
G1 X115.772 Y178.044 E.00027
; OBJECT_ID: 8
; WIPE_START
G1 X115.762 Y177.989 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X108.141 Y177.571 Z1.4 F42000
G1 X92.078 Y176.689 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.967 Y176.689 E.00368
G1 X91.873 Y176.983 E.01023
G1 X91.365 Y176.555 E.02206
G3 X91.21 Y176.207 I.349 J-.363 E.01292
G1 X91.209 Y168.583 E.25291
G2 X70.791 Y172.089 I-9.906 J3.52 E.976
G1 X70.791 Y176.121 E.13376
G1 X70.568 Y176.141 E.00742
G3 X70.409 Y174.288 I11.049 J-1.882 E.06174
G3 X70.418 Y171.664 I65.935 J-1.09 E.08706
G3 X81.269 Y161.21 I10.9 J.455 E.55172
G3 X90.8 Y166.774 I.029 J10.897 E.3839
G1 X91.299 Y167.708 E.03512
G1 X102.709 Y167.709 E.37849
G3 X103.19 Y168.186 I-.013 J.494 E.02476
G1 X103.19 Y176.218 E.26641
G3 X102.709 Y176.688 I-.497 J-.027 E.02449
G1 X92.138 Y176.689 E.35065
M204 S10000
G1 X92.319 Y177.096 F42000
G1 F8843.478
M204 S6000
G1 X92.264 Y177.096 E.00181
G3 X91.594 Y178.948 I-16.711 J-5 E.06535
G1 X91.402 Y178.906 E.00653
G1 X91.402 Y177.118 E.0593
G3 X90.95 Y176.691 I.999 J-1.508 E.02074
G3 X90.803 Y176.227 I.757 J-.495 E.01634
G1 X90.802 Y168.661 E.25099
G2 X71.198 Y172.093 I-9.5 J3.441 E.93618
G1 X71.198 Y178.905 E.22598
G1 X71.004 Y178.945 E.00658
G3 X70.002 Y174.293 I10.362 J-4.665 E.15906
G3 X70.011 Y171.648 I66.388 J-1.094 E.08773
G3 X81.27 Y160.803 I11.308 J.472 E.57244
G3 X91.155 Y166.575 I.027 J11.304 E.39816
G1 X91.543 Y167.3 E.0273
G1 X102.729 Y167.302 E.37106
G3 X103.597 Y168.168 I-.035 J.902 E.04469
G1 X103.597 Y176.234 E.26757
G3 X102.729 Y177.095 I-.909 J-.048 E.04447
G1 X92.379 Y177.096 E.34334
M204 S250
G1 X92.551 Y177.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X91.01 Y180.804 I-11.445 J-3.303 E.11278
G1 X91.01 Y177.301 E.10764
G3 X90.411 Y176.246 I.808 J-1.156 E.03852
G1 X90.41 Y168.736 E.23078
G2 X71.59 Y172.096 I-9.109 J3.365 E.83167
G1 X71.59 Y180.807 E.26767
G3 X69.61 Y174.296 I9.911 J-6.571 E.21207
G3 X69.619 Y171.633 I66.874 J-1.098 E.08186
G3 X81.272 Y160.411 I11.7 J.488 E.54874
G3 X91.778 Y166.908 I-.002 J11.746 E.39971
G1 X102.749 Y166.91 E.33709
G3 X103.989 Y168.149 I-.055 J1.295 E.05918
G1 X103.989 Y176.249 E.24888
G3 X102.748 Y177.487 I-1.306 J-.068 E.05901
G1 X92.611 Y177.488 E.31151
M204 S10000
G1 X91.773 Y177.415 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.36088
G1 F11322.197
M204 S6000
G1 X91.807 Y177.194 E.00578
M204 S10000
G1 X91.773 Y177.415 F42000
; LINE_WIDTH: 0.312648
G1 F13346.794
M204 S6000
G1 X91.739 Y177.635 E.0049
; LINE_WIDTH: 0.264416
G1 F15000
G1 X91.704 Y177.855 E.00403
; LINE_WIDTH: 0.2164
G1 X91.679 Y178 E.00207
; LINE_WIDTH: 0.168608
G1 X91.653 Y178.144 E.0015
; LINE_WIDTH: 0.120816
G1 X91.628 Y178.288 E.00093
; WIPE_START
G1 X91.653 Y178.144 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.35 Y176.341 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.702 Y176.377 E.02154
G3 X91.569 Y176.237 I.128 J-.254 E.00651
G3 X91.558 Y175.479 I2.154 J-.409 E.02528
G1 X92.041 Y175.448 E.01605
G1 X92.696 Y175.12 E.0243
G3 X93.679 Y174.155 I4.674 J3.775 E.0458
G3 X95.317 Y174.407 I.582 J1.669 E.05721
G2 X96.3 Y175.372 I4.675 J-3.776 E.0458
G2 X97.938 Y175.12 I.582 J-1.67 E.05721
G3 X98.921 Y174.155 I4.674 J3.774 E.0458
G3 X100.558 Y174.407 I.582 J1.67 E.05721
G1 X101.214 Y175.098 E.03159
G2 X101.869 Y175.49 I.861 J-.695 E.02586
G1 X102.524 Y175.448 E.02178
G1 X102.841 Y175.289 E.01178
G1 X102.841 Y172.848 E.08099
G1 X102.524 Y172.828 E.01055
G1 X101.869 Y172.5 E.0243
G2 X100.886 Y171.534 I-4.674 J3.775 E.0458
G2 X99.248 Y171.786 I-.582 J1.669 E.05721
G3 X98.265 Y172.752 I-4.674 J-3.774 E.0458
G3 X96.627 Y172.5 I-.582 J-1.67 E.05721
G2 X95.645 Y171.534 I-4.674 J3.774 E.0458
G2 X94.007 Y171.786 I-.582 J1.669 E.05721
G1 X93.352 Y172.477 E.03159
G3 X91.558 Y172.586 I-.958 J-.957 E.06517
G1 X91.558 Y170.238 E.07788
G1 X92.041 Y170.207 E.01608
G1 X92.696 Y169.879 E.0243
G3 X93.679 Y168.914 I4.674 J3.775 E.0458
G3 X95.317 Y169.165 I.582 J1.67 E.05721
G2 X96.3 Y170.131 I4.674 J-3.775 E.0458
G2 X97.938 Y169.879 I.582 J-1.67 E.05721
G3 X98.921 Y168.914 I4.674 J3.774 E.0458
G3 X100.558 Y169.165 I.582 J1.67 E.05721
G1 X101.214 Y169.857 E.03159
G2 X101.869 Y170.249 I.861 J-.695 E.02586
G1 X102.524 Y170.207 E.02178
G1 X102.841 Y170.048 E.01178
G1 X102.841 Y168.42 E.05401
; WIPE_START
G1 X102.841 Y170.048 E-.61876
G1 X102.524 Y170.207 E-.13493
G1 X102.507 Y170.208 E-.00631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.013 Y171.651 Z1.4 F42000
G1 X70.696 Y176.334 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556645
G1 F7007.643
M204 S6000
G1 X70.75 Y176.831 E.02093
; LINE_WIDTH: 0.513569
G1 F7649.01
G1 X70.768 Y176.973 E.00549
; LINE_WIDTH: 0.477108
G1 F8291.352
G1 X70.786 Y177.115 E.00507
; LINE_WIDTH: 0.440646
G1 F9051.467
G1 X70.805 Y177.257 E.00464
; LINE_WIDTH: 0.401147
G1 F10049.5
G1 X70.826 Y177.401 E.00423
; LINE_WIDTH: 0.358641
G1 F11402.493
G1 X70.847 Y177.544 E.00373
; LINE_WIDTH: 0.316134
G1 F13176.484
G1 X70.868 Y177.687 E.00323
; LINE_WIDTH: 0.270636
G1 F15000
G1 X70.893 Y177.831 E.00271
; LINE_WIDTH: 0.222107
G1 X70.917 Y177.975 E.00213
; LINE_WIDTH: 0.173578
G1 X70.941 Y178.119 E.00156
; LINE_WIDTH: 0.136207
G1 X70.957 Y178.202 E.00064
; LINE_WIDTH: 0.110019
G1 X70.972 Y178.285 E.00046
; OBJECT_ID: 7
; WIPE_START
G1 X70.957 Y178.202 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X63.34 Y177.715 Z1.4 F42000
G1 X47.314 Y176.691 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X47.206 Y176.691 E.00355
G1 X47.108 Y177.014 E.0112
G1 X46.565 Y176.556 E.02357
G3 X46.41 Y176.209 I.333 J-.356 E.01294
G1 X46.409 Y168.419 E.25841
G2 X34.593 Y161.81 I-9.711 J3.496 E.4898
G2 X26.391 Y171.89 I2.109 J10.094 E.4664
G1 X26.391 Y176.302 E.14636
G1 X26.168 Y176.322 E.00743
G3 X26.009 Y174.49 I10.798 J-1.857 E.06107
G3 X26.018 Y171.478 I76.373 J-1.29 E.0999
G3 X36.909 Y161.213 I10.699 J.441 E.54969
G3 X46.082 Y166.775 I-.235 J10.734 E.37262
G1 X46.569 Y167.709 E.03494
G1 X57.919 Y167.71 E.37651
G3 X58.39 Y168.19 I-.027 J.497 E.02449
G1 X58.39 Y176.219 E.26633
G3 X57.912 Y176.689 I-.497 J-.027 E.0244
G1 X47.374 Y176.691 E.34958
M204 S10000
G1 X47.561 Y177.098 F42000
G1 F8843.478
M204 S6000
G1 X47.508 Y177.098 E.00174
G3 X46.797 Y179.106 I-13.374 J-3.605 E.07076
G1 X46.602 Y179.066 E.0066
G1 X46.602 Y177.12 E.06457
G3 X46.15 Y176.692 I.997 J-1.506 E.02073
G3 X46.003 Y176.229 I.794 J-.507 E.01633
G1 X46.002 Y168.497 E.25646
G2 X26.798 Y171.894 I-9.3 J3.406 E.9165
G1 X26.798 Y179.068 E.23799
G1 X26.603 Y179.108 E.00661
G3 X25.602 Y174.493 I10.222 J-4.632 E.15782
G3 X25.611 Y171.462 I76.88 J-1.294 E.10055
G3 X36.919 Y160.806 I11.107 J.458 E.57072
G3 X46.439 Y166.579 I-.247 J11.143 E.38672
G1 X46.816 Y167.302 E.02702
G1 X57.935 Y167.303 E.36885
G3 X58.797 Y168.17 I-.048 J.909 E.04447
G1 X58.797 Y176.235 E.26752
G3 X57.931 Y177.097 I-.909 J-.048 E.04441
G1 X47.621 Y177.098 E.34201
M204 S250
G1 X47.798 Y177.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X46.21 Y180.944 I-11.732 J-3.302 E.11731
G1 X46.21 Y177.302 E.11192
G3 X45.611 Y176.248 I.784 J-1.142 E.03857
G1 X45.61 Y168.573 E.23582
G2 X27.19 Y171.898 I-8.909 J3.329 E.81346
G1 X27.19 Y180.944 E.27798
G3 X25.21 Y174.497 I9.531 J-6.455 E.21031
G3 X25.219 Y171.447 I77.355 J-1.298 E.09374
G3 X36.929 Y160.414 I11.499 J.474 E.54741
G3 X47.054 Y166.91 I-.235 J11.504 E.38892
G1 X57.951 Y166.911 E.33484
G3 X59.189 Y168.151 I-.068 J1.306 E.05901
G1 X59.189 Y176.25 E.24887
G3 X57.949 Y177.489 I-1.306 J-.068 E.059
G1 X47.858 Y177.49 E.31006
M204 S10000
G1 X46.997 Y177.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.36263
G1 F11260.232
M204 S6000
G1 X46.967 Y177.624 E.00542
; LINE_WIDTH: 0.323143
G1 F12846.907
G1 X46.936 Y177.83 E.00475
; LINE_WIDTH: 0.280729
G1 F15000
G1 X46.913 Y177.965 E.00265
; LINE_WIDTH: 0.235358
G1 X46.89 Y178.1 E.00214
; LINE_WIDTH: 0.189986
G1 X46.868 Y178.235 E.00164
; LINE_WIDTH: 0.149698
M73 P52 R12
G1 X46.848 Y178.342 E.00095
; LINE_WIDTH: 0.114513
G1 X46.828 Y178.449 E.00064
M204 S10000
G1 X46.997 Y177.418 F42000
; LINE_WIDTH: 0.402116
G1 F10022.4
M204 S6000
G1 X47.028 Y177.212 E.00609
; WIPE_START
G1 X46.997 Y177.418 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X47.589 Y176.342 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X46.949 Y176.342 E.02124
G1 X46.93 Y176.403 E.00208
G1 X46.792 Y176.284 E.00602
G3 X46.758 Y175.547 I1.21 J-.425 E.02484
G2 X48.096 Y175.187 I.108 J-2.266 E.04671
G3 X49.079 Y174.222 I4.674 J3.775 E.0458
G3 X50.717 Y174.474 I.582 J1.669 E.05721
G2 X51.7 Y175.439 I4.675 J-3.776 E.0458
G2 X53.338 Y175.187 I.582 J-1.67 E.05721
G3 X54.321 Y174.222 I4.674 J3.774 E.0458
G3 X55.958 Y174.474 I.582 J1.67 E.05721
G1 X56.614 Y175.165 E.03159
G2 X57.269 Y175.557 I.861 J-.695 E.02586
G1 X57.924 Y175.515 E.02178
G1 X58.041 Y175.456 E.00436
G1 X58.041 Y172.902 E.08473
G1 X57.269 Y172.567 E.02794
G2 X56.286 Y171.601 I-4.674 J3.775 E.0458
G2 X54.648 Y171.853 I-.582 J1.669 E.05721
G3 X53.665 Y172.819 I-4.674 J-3.774 E.0458
G3 X52.027 Y172.567 I-.582 J-1.67 E.05721
G2 X51.045 Y171.601 I-4.674 J3.774 E.0458
G2 X49.407 Y171.853 I-.582 J1.669 E.05721
G3 X48.424 Y172.819 I-4.673 J-3.774 E.0458
G3 X46.786 Y172.567 I-.582 J-1.67 E.05721
G1 X46.758 Y170.305 E.07502
G2 X48.096 Y169.946 I.111 J-2.261 E.04673
G3 X49.079 Y168.981 I4.674 J3.775 E.0458
G3 X50.717 Y169.232 I.582 J1.67 E.05721
G2 X51.7 Y170.198 I4.674 J-3.775 E.0458
G2 X53.338 Y169.946 I.582 J-1.67 E.05721
G3 X54.321 Y168.981 I4.674 J3.774 E.0458
G3 X55.958 Y169.232 I.582 J1.67 E.05721
G1 X56.614 Y169.924 E.03159
G2 X57.269 Y170.316 I.861 J-.695 E.02586
G1 X57.924 Y170.274 E.02178
G1 X58.041 Y170.215 E.00436
G1 X58.041 Y168.587 E.05401
; WIPE_START
G1 X58.041 Y170.215 E-.61876
G1 X57.924 Y170.274 E-.04994
G1 X57.684 Y170.289 E-.0913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X50.198 Y171.774 Z1.4 F42000
G1 X26.297 Y176.515 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565983
G1 F6882.539
M204 S6000
G1 X26.34 Y176.927 E.01768
; LINE_WIDTH: 0.533814
G1 F7333.56
G1 X26.357 Y177.063 E.00548
; LINE_WIDTH: 0.499722
G1 F7880.879
G1 X26.375 Y177.2 E.0051
; LINE_WIDTH: 0.46563
G1 F8516.482
G1 X26.392 Y177.336 E.00472
; LINE_WIDTH: 0.428746
G1 F9330.65
G1 X26.411 Y177.473 E.00435
; LINE_WIDTH: 0.389036
G1 F10401.146
G1 X26.431 Y177.61 E.00391
; LINE_WIDTH: 0.349327
G1 F11749.11
G1 X26.451 Y177.747 E.00346
; LINE_WIDTH: 0.306774
G1 F13643.907
G1 X26.474 Y177.885 E.00301
; LINE_WIDTH: 0.261402
G1 F15000
G1 X26.497 Y178.023 E.00249
; LINE_WIDTH: 0.21603
G1 X26.519 Y178.161 E.00197
; LINE_WIDTH: 0.169238
G1 X26.546 Y178.305 E.00151
; LINE_WIDTH: 0.121033
G1 X26.572 Y178.449 E.00093
; OBJECT_ID: 3
; WIPE_START
G1 X26.546 Y178.305 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X28.103 Y170.833 Z1.4 F42000
G1 X32.724 Y148.667 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X32.677 Y148.657 E.00161
G3 X26.391 Y141.01 I1.538 J-7.671 E.35552
G1 X26.391 Y106.99 E1.12848
G3 X34.19 Y99.191 I7.823 J.024 E.40607
G1 X87.71 Y99.191 E1.77533
G3 X95.509 Y106.99 I-.013 J7.812 E.40622
G1 X95.509 Y141.01 E1.12848
G3 X87.71 Y148.809 I-7.823 J-.024 E.40607
G1 X34.19 Y148.809 E1.77533
G3 X33.283 Y148.754 I.024 J-7.823 E.03019
G1 X32.783 Y148.676 E.01676
M204 S10000
G1 X32.788 Y148.265 F42000
G1 F8843.478
M204 S6000
G1 X32.756 Y148.259 E.00107
G3 X26.798 Y141.006 I1.447 J-7.262 E.33724
G1 X26.798 Y106.994 E1.12822
G3 X34.194 Y99.598 I7.416 J.019 E.38512
G1 X87.706 Y99.598 E1.77508
G3 X95.102 Y106.994 I-.009 J7.405 E.38527
G1 X95.102 Y141.006 E1.12822
G3 X87.706 Y148.402 I-7.416 J-.019 E.38512
G1 X34.194 Y148.402 E1.77508
G3 X33.33 Y148.35 I.009 J-7.405 E.02873
G1 X32.847 Y148.274 E.01623
M204 S250
G1 X32.849 Y147.878 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X32.832 Y147.875 E.00052
G3 X27.19 Y141.002 I1.371 J-6.878 E.29595
G1 X27.19 Y106.998 E1.04485
G3 X34.198 Y99.99 I7.023 J.015 E.33805
G1 X87.702 Y99.99 E1.64403
G3 X94.71 Y106.998 I-.005 J7.013 E.33818
G1 X94.71 Y141.002 E1.04485
G3 X87.702 Y148.01 I-7.023 J-.015 E.33805
G1 X34.198 Y148.01 E1.64403
G3 X33.376 Y147.961 I.005 J-7.013 E.02531
G1 X32.908 Y147.887 E.01456
; WIPE_START
M204 S6000
G1 X32.832 Y147.875 E-.0292
G1 X32.034 Y147.667 E-.31355
G1 X31.517 Y147.476 E-.20923
G1 X31.025 Y147.237 E-.20802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.73 Y141.228 Z1.4 F42000
G1 X68.941 Y98.809 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y98.809 E.62195
G3 X95.891 Y107.01 I.006 J8.195 E.42739
G1 X95.891 Y140.99 E1.12718
G3 X87.69 Y149.191 I-8.195 J.006 E.4274
G1 X34.21 Y149.191 E1.77403
G3 X26.009 Y140.99 I.006 J-8.207 E.42724
G1 X26.009 Y107.01 E1.12718
G3 X34.21 Y98.809 I8.207 J.006 E.42723
G1 X52.959 Y98.809 E.62194
G1 X52.959 Y93.82 E.1655
G3 X53.48 Y93.309 I.496 J-.015 E.02718
G1 X68.452 Y93.31 E.49665
G3 X68.941 Y93.82 I-.006 J.496 E.02609
G1 X68.941 Y98.749 E.16352
M204 S10000
G1 X69.348 Y98.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y98.402 E.60858
G3 X96.298 Y107.006 I.002 J8.602 E.44833
G1 X96.298 Y140.994 E1.12745
G3 X87.694 Y149.598 I-8.602 J.002 E.44833
G1 X34.206 Y149.598 E1.7743
G3 X25.602 Y140.994 I.01 J-8.614 E.44817
G1 X25.602 Y107.006 E1.12745
G3 X34.206 Y98.402 I8.614 J.01 E.44816
G1 X52.552 Y98.402 E.60858
G1 X52.552 Y93.812 E.15226
G3 X53.468 Y92.902 I.904 J-.006 E.04769
G1 X68.466 Y92.903 E.49751
G3 X69.348 Y93.812 I-.023 J.905 E.04654
G1 X69.348 Y98.342 E.15028
M204 S250
G1 X69.74 Y98.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y98.01 E.5518
G3 X96.69 Y107.002 I-.002 J8.994 E.43398
G1 X96.69 Y140.998 E1.0446
G3 X87.698 Y149.99 I-8.994 J-.002 E.43398
G1 X34.202 Y149.99 E1.64378
G3 X31.204 Y149.474 I.014 J-9.054 E.09392
G3 X25.21 Y140.998 I2.999 J-8.478 E.34006
G1 X25.21 Y107.002 E1.0446
G3 X31.643 Y98.383 I9.014 J.018 E.35409
G3 X34.202 Y98.01 I2.654 J9.242 E.07971
G1 X52.16 Y98.01 E.5518
G1 X52.16 Y93.804 E.12923
G3 X53.456 Y92.51 I1.297 J.003 E.06248
G1 X68.479 Y92.511 E.46162
G3 X69.74 Y93.804 I-.039 J1.299 E.06135
G1 X69.74 Y97.95 E.12739
; WIPE_START
M204 S6000
G1 X71.74 Y97.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X68.59 Y94.021 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G2 X68.42 Y93.658 I-.197 J-.129 E.01592
G1 X67.256 Y93.658 E.03862
G3 X65.536 Y94.46 I-1.642 J-1.277 E.06537
G3 X64.492 Y93.658 I.765 J-2.076 E.04434
G1 X62.015 Y93.658 E.08217
G3 X60.295 Y94.46 I-1.643 J-1.277 E.06538
G3 X59.251 Y93.658 I.765 J-2.076 E.04435
G1 X56.774 Y93.658 E.08216
G3 X55.054 Y94.46 I-1.643 J-1.277 E.06539
G3 X54.009 Y93.657 I.765 J-2.076 E.04436
G1 X53.498 Y93.657 E.01696
G2 X53.309 Y93.807 I-.022 J.166 E.00892
G1 X53.309 Y95.655 E.06131
G3 X54.071 Y95.745 I.277 J.925 E.02619
G3 X55.054 Y96.711 I-3.691 J4.74 E.0458
G2 X56.364 Y97.081 I1.092 J-1.363 E.04639
G1 X56.692 Y96.963 E.01155
G2 X57.674 Y95.997 I-3.69 J-4.739 E.0458
G3 X58.985 Y95.628 I1.092 J1.363 E.04639
G1 X59.312 Y95.745 E.01155
G3 X60.295 Y96.711 I-3.691 J4.74 E.0458
G2 X61.605 Y97.081 I1.092 J-1.363 E.04639
G1 X61.933 Y96.963 E.01155
G2 X62.916 Y95.997 I-3.691 J-4.74 E.0458
G3 X64.226 Y95.628 I1.092 J1.363 E.04639
G1 X64.554 Y95.745 E.01155
G3 X65.536 Y96.711 I-3.691 J4.74 E.0458
G2 X66.847 Y97.081 I1.092 J-1.363 E.04639
G1 X67.174 Y96.963 E.01155
G2 X68.157 Y95.997 I-3.691 J-4.74 E.0458
G1 X68.591 Y95.78 E.01611
G1 X68.592 Y98.276 E.0828
G2 X67.829 Y98.366 I-.278 J.926 E.02621
G3 X67.103 Y98.846 I-1.432 J-1.378 E.02911
G1 X64.64 Y98.846 E.0817
G1 X64.226 Y98.618 E.01568
G2 X62.916 Y98.248 I-1.092 J1.363 E.04639
G1 X62.588 Y98.366 E.01155
G3 X61.863 Y98.846 I-1.43 J-1.375 E.02907
G1 X59.398 Y98.845 E.08178
G1 X58.985 Y98.618 E.01564
G2 X57.674 Y98.248 I-1.092 J1.363 E.04639
G1 X57.347 Y98.366 E.01155
G3 X56.623 Y98.845 I-1.429 J-1.373 E.02903
G1 X54.155 Y98.845 E.08185
G2 X53.308 Y98.4 I-6.139 J10.671 E.03177
G1 X53.308 Y96.772 E.05401
; OBJECT_ID: 1
; WIPE_START
G1 X53.308 Y98.4 E-.61876
G1 X53.637 Y98.573 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X57.443 Y91.957 Z1.4 F42000
G1 X91.285 Y33.14 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X91.722 Y33.464 E.01804
G3 X94.509 Y39.19 I-4.535 J5.749 E.21855
G1 X94.509 Y73.21 E1.12848
G3 X87.21 Y80.509 I-7.312 J-.013 E.38018
G1 X33.69 Y80.509 E1.77533
G3 X26.391 Y73.21 I.013 J-7.312 E.38017
G1 X26.391 Y39.19 E1.12848
G3 X33.69 Y31.891 I7.312 J.013 E.38017
G1 X87.21 Y31.891 E1.77533
G3 X91.233 Y33.11 I-.023 J7.322 E.14146
M204 S10000
G1 X91.046 Y33.469 F42000
G1 F8843.478
M204 S6000
G1 X91.47 Y33.784 E.01751
G3 X94.102 Y39.194 I-4.283 J5.429 E.20649
G1 X94.102 Y73.206 E1.12822
G3 X87.206 Y80.102 I-6.905 J-.009 E.35922
G1 X33.694 Y80.102 E1.77508
G3 X26.798 Y73.206 I.009 J-6.905 E.35922
G1 X26.798 Y39.194 E1.12822
G3 X33.694 Y32.298 I6.905 J.009 E.35922
G1 X87.206 Y32.298 E1.77508
G3 X90.994 Y33.44 I-.018 J6.915 E.13312
M204 S250
G1 X90.814 Y33.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X93.71 Y39.198 I-3.626 J5.421 E.19621
G1 X93.71 Y73.202 E1.04485
G3 X87.202 Y79.71 I-6.513 J-.005 E.31405
G1 X33.698 Y79.71 E1.64403
G3 X27.19 Y73.202 I.005 J-6.513 E.31405
G1 X27.19 Y39.198 E1.04485
G3 X33.698 Y32.69 I6.513 J.005 E.31405
G1 X87.202 Y32.69 E1.64403
G3 X90.764 Y33.758 I-.014 J6.522 E.11587
; WIPE_START
M204 S6000
G1 X91.428 Y34.25 E-.31395
G1 X91.803 Y34.597 E-.19422
G1 X92.15 Y34.972 E-.19422
G1 X92.242 Y35.093 E-.05761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.694 Y33.956 Z1.4 F42000
G1 X68.441 Y31.509 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I.006 J7.695 E.40135
G1 X94.891 Y73.19 E1.12718
G3 X87.19 Y80.891 I-7.695 J.006 E.40134
G1 X33.71 Y80.891 E1.77403
G3 X26.009 Y73.19 I-.006 J-7.695 E.40134
M73 P53 R12
G1 X26.009 Y39.21 E1.12718
G3 X33.71 Y31.509 I7.695 J-.006 E.40135
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.52 E.16551
G3 X52.98 Y26.009 I.495 J-.016 E.02719
G1 X67.952 Y26.01 E.49665
G3 X68.441 Y26.52 I-.006 J.496 E.02609
G1 X68.441 Y31.449 E.16352
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I.002 J8.102 E.42228
G1 X95.298 Y73.194 E1.12745
G3 X87.194 Y81.298 I-8.113 J-.01 E.42212
G1 X33.706 Y81.298 E1.77431
G3 X25.602 Y73.194 I-.002 J-8.102 E.42228
G1 X25.602 Y39.206 E1.12745
G3 X33.706 Y31.102 I8.102 J-.002 E.42229
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.512 E.15226
G3 X52.968 Y25.602 I.901 J-.009 E.04773
G1 X67.966 Y25.603 E.49751
G3 X68.848 Y26.512 I-.023 J.905 E.04654
G1 X68.848 Y31.042 E.15028
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X95.69 Y39.202 I-.002 J8.494 E.40985
G1 X95.69 Y73.198 E1.0446
G3 X87.198 Y81.69 I-8.506 J-.014 E.4097
G1 X33.702 Y81.69 E1.64378
G3 X25.21 Y73.198 I.002 J-8.494 E.40985
G1 X25.21 Y39.202 E1.0446
G3 X33.702 Y30.71 I8.494 J.002 E.40985
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.504 E.12923
G3 X52.956 Y25.21 I1.293 J-.001 E.06254
G1 X67.979 Y25.211 E.46162
G3 X69.24 Y26.504 I-.039 J1.299 E.06135
G1 X69.24 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X67.84 Y26.358 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X66.211 Y26.358 E.05401
G3 X65.036 Y26.66 I-.944 J-1.237 E.04134
G3 X64.489 Y26.358 I.137 J-.896 E.02118
G1 X60.97 Y26.358 E.1167
G3 X59.795 Y26.66 I-.945 J-1.237 E.04136
G3 X59.247 Y26.358 I.137 J-.897 E.02119
G1 X55.73 Y26.358 E.11668
G3 X54.554 Y26.66 I-.945 J-1.238 E.04138
G3 X54.005 Y26.357 I.137 J-.897 E.02121
G1 X52.998 Y26.357 E.03341
G2 X52.809 Y26.507 I-.031 J.155 E.00911
G1 X52.809 Y27.855 E.04472
G3 X53.571 Y27.945 I.277 J.925 E.02618
G3 X54.554 Y28.911 I-3.691 J4.74 E.0458
G2 X55.864 Y29.281 I1.092 J-1.363 E.04639
G1 X56.192 Y29.163 E.01155
G2 X57.174 Y28.197 I-3.69 J-4.739 E.0458
G3 X58.485 Y27.828 I1.092 J1.363 E.04639
G1 X58.812 Y27.945 E.01155
G3 X59.795 Y28.911 I-3.691 J4.74 E.0458
G2 X61.105 Y29.281 I1.092 J-1.363 E.04639
G1 X61.433 Y29.163 E.01155
G2 X62.416 Y28.197 I-3.691 J-4.74 E.0458
G3 X63.726 Y27.828 I1.092 J1.363 E.04639
G1 X64.054 Y27.945 E.01155
G3 X65.036 Y28.911 I-3.691 J4.74 E.0458
G2 X66.347 Y29.281 I1.092 J-1.363 E.04639
G1 X66.674 Y29.163 E.01155
G2 X67.657 Y28.197 I-3.691 J-4.74 E.0458
G1 X68.091 Y27.98 E.0161
G1 X68.092 Y30.476 E.08279
G2 X67.329 Y30.566 I-.277 J.926 E.0262
G2 X66.347 Y31.532 I3.69 J4.739 E.0458
G1 X64.425 Y31.546 E.06375
G3 X63.726 Y30.818 I2.804 J-3.392 E.03354
G2 X62.416 Y30.448 I-1.092 J1.363 E.04639
G1 X62.088 Y30.566 E.01155
G2 X61.105 Y31.532 I3.691 J4.74 E.0458
G1 X59.183 Y31.545 E.06378
G3 X58.485 Y30.818 I2.801 J-3.388 E.03351
G2 X57.174 Y30.448 I-1.092 J1.363 E.04639
G1 X56.847 Y30.566 E.01155
G2 X55.864 Y31.532 I3.691 J4.74 E.0458
G1 X53.941 Y31.545 E.0638
G3 X53.243 Y30.818 I2.798 J-3.384 E.03348
G1 X52.808 Y30.6 E.01616
G1 X52.808 Y28.972 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X52.808 Y30.6 E-.61876
G1 X53.14 Y30.766 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 6/15
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I-.421 J1.142 P1  F42000
G1 X175.401 Y75.832 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X175.234 Y76.272 E.01559
G3 X168.31 Y80.909 I-6.947 J-2.886 E.29298
G1 X114.79 Y80.909 E1.77533
G3 X107.291 Y73.41 I.023 J-7.523 E.39045
G1 X107.291 Y39.39 E1.12848
G3 X114.79 Y31.891 I7.512 J.013 E.39059
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.018 J7.518 E.39051
G1 X175.809 Y73.41 E1.12848
G3 X175.438 Y75.719 I-7.523 J-.023 E.07791
G1 X175.42 Y75.776 E.00197
M204 S10000
G1 X175.019 Y75.692 F42000
G1 F8843.478
M204 S6000
G1 X174.858 Y76.116 E.01506
G3 X168.306 Y80.502 I-6.571 J-2.729 E.2772
G1 X114.794 Y80.502 E1.77508
G3 X107.698 Y73.406 I.019 J-7.115 E.3695
G1 X107.698 Y39.394 E1.12822
G3 X114.794 Y32.298 I7.105 J.009 E.36964
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.014 J7.11 E.36956
G1 X175.402 Y73.406 E1.12822
G3 X175.051 Y75.593 I-7.115 J-.019 E.0738
G1 X175.038 Y75.635 E.00144
M204 S250
G1 X174.651 Y75.556 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X174.496 Y75.966 E.01348
G3 X168.302 Y80.11 I-6.208 J-2.579 E.24269
G1 X114.798 Y80.11 E1.64403
G3 X108.09 Y73.402 I.015 J-6.722 E.32357
G1 X108.09 Y39.398 E1.04485
G3 X114.798 Y32.69 I6.713 J.005 E.3237
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.01 J6.718 E.32363
G1 X175.01 Y73.402 E1.04485
G3 X174.679 Y75.472 I-6.722 J-.015 E.06469
G1 X174.67 Y75.499 E.00086
; WIPE_START
M204 S6000
G1 X174.496 Y75.966 E-.18954
G1 X174.154 Y76.679 E-.30011
G1 X173.879 Y77.128 E-.20022
G1 X173.768 Y77.275 E-.07013
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.197 Y70.529 Z1.6 F42000
G1 X149.541 Y31.509 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I-.005 J7.906 E.41161
G1 X176.191 Y73.39 E1.12718
G3 X168.29 Y81.291 I-7.906 J-.005 E.41161
G1 X114.81 Y81.291 E1.77403
G3 X106.909 Y73.39 I-.006 J-7.895 E.41177
G1 X106.909 Y39.41 E1.12718
G3 X114.81 Y31.509 I7.895 J-.006 E.41176
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.52 E.1655
G3 X134.08 Y26.009 I.501 J-.01 E.02709
G1 X149.048 Y26.01 E.49652
G3 X149.541 Y26.52 I-.002 J.496 E.02623
G1 X149.541 Y31.449 E.16351
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.01 J8.314 E.43254
G1 X176.598 Y73.394 E1.12745
G3 X168.294 Y81.698 I-8.314 J-.01 E.43254
G1 X114.806 Y81.698 E1.7743
G3 X106.502 Y73.394 I-.002 J-8.302 E.4327
G1 X106.502 Y39.406 E1.12745
G3 X114.806 Y31.102 I8.302 J-.002 E.4327
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.512 E.15227
G3 X134.068 Y25.602 I.911 J.001 E.04759
G1 X149.061 Y25.603 E.49737
G3 X149.948 Y26.512 I-.019 J.905 E.04669
G1 X149.948 Y31.042 E.15028
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.909 Y38.227 I-.015 J8.707 E.38312
G3 X176.99 Y39.402 I-12.256 J1.438 E.03621
G1 X176.99 Y73.398 E1.0446
G3 X168.298 Y82.09 I-8.706 J-.014 E.41935
G1 X114.802 Y82.09 E1.64378
G3 X111.937 Y81.603 I.013 J-8.747 E.08972
G3 X106.244 Y74.91 I2.863 J-8.203 E.28306
G3 X106.11 Y73.398 I8.76 J-1.538 E.04671
G1 X106.11 Y39.402 E1.0446
G3 X114.802 Y30.71 I8.694 J.002 E.41951
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.504 E.12923
G3 X134.056 Y25.21 I1.306 J.012 E.06237
G1 X149.075 Y25.211 E.46148
G3 X150.34 Y26.504 I-.034 J1.299 E.0615
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 6 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P54 R12
G1 Z1.6
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer6 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X149.19 Y26.577 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G2 X149.017 Y26.358 I-.168 J-.045 E.01075
G1 X147.712 Y26.358 E.0433
G3 X146.136 Y26.714 I-1.126 J-1.319 E.05574
G1 X145.639 Y26.358 E.0203
G1 X142.471 Y26.358 E.10509
G3 X140.895 Y26.714 I-1.127 J-1.319 E.05575
G1 X140.397 Y26.358 E.02031
G1 X137.23 Y26.358 E.10507
G3 X135.654 Y26.714 I-1.127 J-1.319 E.05576
G1 X135.156 Y26.357 E.02033
G1 X134.099 Y26.357 E.03505
G2 X133.909 Y26.506 I-.025 J.163 E.00894
G1 X133.909 Y28.122 E.05361
G1 X134.343 Y28.173 E.01452
G1 X134.998 Y28.643 E.02674
G2 X136.964 Y29.335 I1.521 J-1.184 E.07303
G1 X137.619 Y28.865 E.02674
G3 X139.585 Y28.173 I1.521 J1.184 E.07303
G1 X140.24 Y28.643 E.02674
G2 X142.205 Y29.335 I1.521 J-1.184 E.07303
G1 X142.86 Y28.865 E.02674
G3 X144.826 Y28.173 I1.521 J1.184 E.07303
G1 X145.481 Y28.643 E.02674
G2 X147.447 Y29.335 I1.521 J-1.184 E.07303
G2 X148.757 Y28.301 I-5.128 J-7.847 E.05544
G1 X149.191 Y28.165 E.01509
G1 X149.192 Y30.742 E.0855
G1 X148.757 Y30.794 E.01454
G2 X147.774 Y31.546 I3.713 J5.874 E.04111
G1 X145.564 Y31.546 E.07329
G1 X145.481 Y31.486 E.0034
G2 X143.516 Y30.794 I-1.521 J1.184 E.07303
G2 X142.533 Y31.545 I3.712 J5.871 E.04109
G1 X140.322 Y31.545 E.07334
G1 X140.24 Y31.486 E.00337
G2 X138.274 Y30.794 I-1.521 J1.184 E.07303
G2 X137.292 Y31.545 I3.709 J5.867 E.04106
G1 X135.08 Y31.545 E.07338
G3 X134.343 Y30.922 I3.114 J-4.431 E.03205
G1 X133.908 Y30.785 E.01515
G1 X133.908 Y29.157 E.05401
; OBJECT_ID: 4
; WIPE_START
G1 X133.908 Y30.785 E-.61876
G1 X134.262 Y30.896 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X133.769 Y38.513 Z1.6 F42000
G1 X129.214 Y108.791 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X129.106 Y108.791 E.00355
G1 X129.008 Y109.114 E.0112
G1 X128.465 Y108.656 E.02357
G3 X128.31 Y108.319 I.352 J-.365 E.0126
G1 X128.309 Y100.519 E.25874
G2 X108.291 Y103.99 I-9.706 J3.486 E.95627
G1 X108.291 Y108.402 E.14636
G1 X108.068 Y108.422 E.00743
G3 X107.909 Y106.59 I10.798 J-1.857 E.06107
G3 X107.918 Y103.578 I76.426 J-1.29 E.09989
G3 X118.855 Y93.314 I10.684 J.425 E.55144
G3 X127.982 Y98.874 I-.281 J10.733 E.37108
G1 X128.469 Y99.809 E.03495
G1 X139.819 Y99.81 E.37652
G3 X140.29 Y100.29 I-.027 J.497 E.02449
G1 X140.29 Y108.319 E.26633
G3 X139.809 Y108.789 I-.497 J-.027 E.0245
G1 X129.274 Y108.791 E.34948
M204 S10000
G1 X129.46 Y109.198 F42000
G1 F8843.478
M204 S6000
G1 X129.408 Y109.198 E.00174
G3 X128.697 Y111.206 I-13.277 J-3.57 E.07076
G1 X128.502 Y111.166 E.0066
G1 X128.502 Y109.22 E.06457
G3 X128.051 Y108.792 I.998 J-1.507 E.02073
G3 X127.903 Y108.334 I.799 J-.51 E.01614
G1 X127.902 Y100.597 E.25665
G2 X108.698 Y103.994 I-9.3 J3.406 E.91648
G1 X108.698 Y111.168 E.23799
G1 X108.503 Y111.208 E.00661
G3 X107.502 Y106.593 I10.222 J-4.632 E.15782
G3 X107.511 Y103.562 I76.888 J-1.294 E.10055
G3 X118.865 Y92.907 I11.091 J.441 E.57246
G3 X128.339 Y98.679 I-.293 J11.142 E.38518
G1 X128.716 Y99.402 E.02703
G1 X139.835 Y99.403 E.36886
G3 X140.697 Y100.27 I-.048 J.909 E.04446
G1 X140.697 Y108.335 E.26752
G3 X139.829 Y109.197 I-.909 J-.048 E.04447
G1 X129.52 Y109.198 E.34196
M204 S250
G1 X129.698 Y109.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.11 Y113.044 I-11.277 J-3.093 E.11735
G1 X128.11 Y109.402 E.11192
G3 X127.511 Y108.35 I.808 J-1.157 E.03846
G1 X127.51 Y100.673 E.23588
G2 X109.09 Y103.998 I-8.909 J3.329 E.81345
G1 X109.09 Y113.044 E.27798
G3 X107.11 Y106.597 I9.672 J-6.498 E.21023
G3 X107.119 Y103.547 I77.358 J-1.298 E.09374
G3 X118.876 Y92.515 I11.483 J.457 E.54904
G3 X128.954 Y99.01 I-.281 J11.502 E.38751
G1 X139.851 Y99.011 E.33484
G3 X141.089 Y100.251 I-.068 J1.306 E.05901
G1 X141.089 Y108.35 E.24887
G3 X139.848 Y109.589 I-1.306 J-.068 E.05902
G1 X129.758 Y109.59 E.31004
M204 S10000
G1 X128.897 Y109.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362597
G1 F11261.387
M204 S6000
G1 X128.867 Y109.724 E.00542
; LINE_WIDTH: 0.323106
G1 F12848.632
G1 X128.836 Y109.93 E.00475
; LINE_WIDTH: 0.280697
G1 F15000
G1 X128.813 Y110.065 E.00265
; LINE_WIDTH: 0.235386
G1 X128.791 Y110.2 E.00214
; LINE_WIDTH: 0.190076
G1 X128.768 Y110.334 E.00164
; LINE_WIDTH: 0.149793
G1 X128.748 Y110.442 E.00095
; LINE_WIDTH: 0.114544
G1 X128.728 Y110.549 E.00064
M204 S10000
G1 X128.897 Y109.518 F42000
; LINE_WIDTH: 0.402088
G1 F10023.182
M204 S6000
G1 X128.928 Y109.312 E.00609
M204 S10000
G1 X129.335 Y108.442 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X128.848 Y108.442 E.01612
G1 X128.83 Y108.503 E.00208
G3 X128.661 Y108.307 I.12 J-.275 E.00887
G1 X128.66 Y107.493 E.027
G2 X129.996 Y107.384 I.553 J-1.455 E.04597
G1 X130.652 Y106.819 E.02868
G3 X132.617 Y106.478 I1.209 J1.133 E.07101
G1 X133.272 Y107.042 E.02868
G2 X135.238 Y107.384 I1.209 J-1.133 E.07101
G1 X135.893 Y106.819 E.02868
G3 X137.858 Y106.478 I1.209 J1.133 E.07101
G2 X139.169 Y107.511 I6.437 J-6.812 E.05544
G1 X139.824 Y107.589 E.02189
G1 X139.941 Y107.552 E.00409
G1 X139.941 Y104.955 E.08617
G1 X139.824 Y104.969 E.00393
G1 X139.169 Y104.763 E.02278
G1 X138.514 Y104.199 E.02868
G2 X136.548 Y103.857 I-1.209 J1.133 E.07101
G1 X135.893 Y104.421 E.02868
G3 X133.927 Y104.763 I-1.209 J-1.133 E.07101
G1 X133.272 Y104.199 E.02868
G2 X131.307 Y103.857 I-1.209 J1.133 E.07101
G1 X130.652 Y104.421 E.02868
G3 X128.686 Y104.763 I-1.209 J-1.133 E.07101
G1 X128.658 Y102.25 E.08336
G2 X129.996 Y102.142 I.513 J-1.99 E.04537
G1 X130.652 Y101.578 E.02868
G3 X132.617 Y101.236 I1.209 J1.133 E.07101
G1 X133.272 Y101.801 E.02868
G2 X135.238 Y102.142 I1.209 J-1.133 E.07101
G1 X135.893 Y101.578 E.02868
G3 X137.858 Y101.236 I1.209 J1.133 E.07101
G2 X139.169 Y102.27 I6.436 J-6.81 E.05544
G1 X139.824 Y102.348 E.02189
G1 X139.941 Y102.311 E.00409
G1 X139.941 Y100.683 E.05401
; WIPE_START
G1 X139.941 Y102.311 E-.61876
G1 X139.824 Y102.348 E-.04681
G1 X139.577 Y102.319 E-.09443
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.094 Y103.82 Z1.6 F42000
G1 X108.197 Y108.615 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.566024
G1 F6881.995
M204 S6000
G1 X108.24 Y109.027 E.01768
; LINE_WIDTH: 0.53387
G1 F7332.729
G1 X108.257 Y109.163 E.00549
; LINE_WIDTH: 0.499769
G1 F7880.07
G1 X108.275 Y109.299 E.00511
; LINE_WIDTH: 0.465668
G1 F8515.713
G1 X108.292 Y109.435 E.00473
; LINE_WIDTH: 0.428735
G1 F9330.906
G1 X108.311 Y109.573 E.00436
; LINE_WIDTH: 0.389004
G1 F10402.1
G1 X108.331 Y109.71 E.00391
; LINE_WIDTH: 0.349274
G1 F11751.137
G1 X108.351 Y109.847 E.00346
; LINE_WIDTH: 0.306756
G1 F13644.867
G1 X108.374 Y109.985 E.003
; LINE_WIDTH: 0.261427
G1 F15000
G1 X108.396 Y110.123 E.00249
; LINE_WIDTH: 0.216098
G1 X108.419 Y110.26 E.00197
; LINE_WIDTH: 0.169312
G1 X108.446 Y110.405 E.00151
; LINE_WIDTH: 0.121057
G1 X108.472 Y110.549 E.00093
; OBJECT_ID: 5
; WIPE_START
G1 X108.446 Y110.405 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X116.076 Y110.217 Z1.6 F42000
G1 X173.978 Y108.789 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.867 Y108.789 E.00368
G1 X173.773 Y109.083 E.01023
G1 X173.265 Y108.655 E.02206
G3 X173.11 Y108.307 I.332 J-.356 E.01295
G1 X173.109 Y100.683 E.25291
G2 X152.691 Y104.189 I-9.906 J3.52 E.976
G1 X152.691 Y108.221 E.13376
G1 X152.468 Y108.241 E.00742
G3 X152.309 Y106.388 I11.04 J-1.881 E.06174
G3 X152.318 Y103.764 I65.931 J-1.09 E.08706
G1 X152.33 Y103.572 E.0064
G3 X163.216 Y93.31 I10.879 J.636 E.54697
G3 X172.7 Y98.874 I-.018 J10.896 E.38233
G1 X173.199 Y99.808 E.03512
G1 X184.619 Y99.809 E.37882
G3 X185.09 Y100.289 I-.024 J.494 E.02453
G1 X185.09 Y108.318 E.26631
G3 X184.619 Y108.788 I-.495 J-.024 E.02421
G1 X174.038 Y108.789 E.35099
M204 S10000
G1 X174.219 Y109.196 F42000
G1 F8843.478
M204 S6000
G1 X174.164 Y109.196 E.00181
G3 X173.494 Y111.048 I-16.704 J-4.997 E.06535
G1 X173.302 Y111.006 E.00653
G1 X173.302 Y109.218 E.0593
G3 X172.85 Y108.791 I.998 J-1.507 E.02073
G3 X172.703 Y108.327 I.794 J-.507 E.01633
G1 X172.702 Y100.761 E.25099
G2 X153.098 Y104.193 I-9.5 J3.441 E.93618
G1 X153.098 Y111.005 E.22597
G1 X152.904 Y111.045 E.00658
G3 X151.902 Y106.393 I10.362 J-4.665 E.15906
G3 X151.911 Y103.748 I66.387 J-1.094 E.08772
G1 X151.923 Y103.547 E.00668
G3 X163.218 Y92.903 I11.286 J.661 E.56742
G3 X173.055 Y98.675 I-.02 J11.304 E.39659
G1 X173.443 Y99.4 E.0273
G1 X184.635 Y99.402 E.37125
G3 X185.497 Y100.269 I-.041 J.902 E.04456
G1 X185.497 Y108.334 E.26751
G3 X184.635 Y109.195 I-.903 J-.041 E.04436
G1 X174.279 Y109.196 E.34354
M204 S250
G1 X174.451 Y109.588 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X172.91 Y112.904 I-11.4 J-3.282 E.11278
G1 X172.91 Y109.401 E.10764
G3 X172.311 Y108.346 I.784 J-1.142 E.03857
G1 X172.31 Y100.836 E.23078
G2 X153.49 Y104.196 I-9.109 J3.365 E.83167
G1 X153.49 Y112.907 E.26766
G3 X151.51 Y106.396 I9.911 J-6.57 E.21207
G3 X151.519 Y103.733 I66.877 J-1.098 E.08186
G1 X151.532 Y103.524 E.00643
G3 X163.219 Y92.511 I11.678 J.685 E.54385
G3 X173.678 Y99.008 I-.049 J11.746 E.39825
G1 X184.651 Y99.01 E.33715
G3 X185.889 Y100.25 I-.057 J1.295 E.05914
G1 X185.889 Y108.349 E.24886
G3 X184.65 Y109.587 I-1.295 J-.057 E.05908
G1 X174.511 Y109.588 E.31157
M204 S10000
G1 X173.673 Y109.514 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.360896
G1 F11321.633
M204 S6000
G1 X173.707 Y109.294 E.00578
M204 S10000
G1 X173.673 Y109.514 F42000
; LINE_WIDTH: 0.312698
G1 F13344.345
M204 S6000
G1 X173.639 Y109.735 E.0049
; LINE_WIDTH: 0.264499
G1 F15000
G1 X173.604 Y109.955 E.00403
; LINE_WIDTH: 0.2165
G1 X173.579 Y110.1 E.00207
; LINE_WIDTH: 0.168668
G1 X173.553 Y110.244 E.0015
; LINE_WIDTH: 0.120836
G1 X173.528 Y110.388 E.00093
; WIPE_START
G1 X173.553 Y110.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X174.136 Y108.441 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.602 Y108.477 E.01775
G3 X173.478 Y108.36 I.125 J-.255 E.00574
G3 X173.458 Y107.465 I2.064 J-.492 E.02991
G1 X173.941 Y107.522 E.01613
G1 X174.596 Y107.316 E.02278
G1 X175.252 Y106.752 E.02868
G3 X177.217 Y106.411 I1.209 J1.133 E.07101
G1 X177.872 Y106.975 E.02868
G2 X179.838 Y107.316 I1.209 J-1.133 E.07101
G1 X180.493 Y106.752 E.02868
G3 X182.458 Y106.411 I1.209 J1.133 E.07101
G2 X183.769 Y107.444 I6.437 J-6.812 E.05544
G1 X184.424 Y107.522 E.02189
G1 X184.741 Y107.423 E.01104
G1 X184.741 Y104.864 E.08488
G1 X184.424 Y104.902 E.01061
G1 X183.769 Y104.696 E.02278
G1 X183.114 Y104.132 E.02868
G2 X181.148 Y103.79 I-1.209 J1.133 E.07101
G1 X180.493 Y104.354 E.02868
G3 X178.527 Y104.696 I-1.209 J-1.133 E.07101
G1 X177.872 Y104.132 E.02868
G2 X175.907 Y103.79 I-1.209 J1.133 E.07101
G1 X175.252 Y104.354 E.02868
G3 X173.458 Y104.75 I-1.176 J-1.07 E.06496
G1 X173.458 Y102.223 E.0838
G1 X173.941 Y102.281 E.01616
G1 X174.596 Y102.075 E.02278
G1 X175.252 Y101.511 E.02868
G3 X177.217 Y101.169 I1.209 J1.133 E.07101
G1 X177.872 Y101.734 E.02868
G2 X179.838 Y102.075 I1.209 J-1.133 E.07101
G1 X180.493 Y101.511 E.02868
G3 X182.458 Y101.169 I1.209 J1.133 E.07101
G2 X183.769 Y102.203 I6.436 J-6.81 E.05544
G1 X184.424 Y102.281 E.02189
G1 X184.741 Y102.181 E.01104
G1 X184.741 Y100.553 E.05401
; WIPE_START
G1 X184.741 Y102.181 E-.61876
G1 X184.424 Y102.281 E-.12647
G1 X184.385 Y102.276 E-.01477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X176.892 Y103.728 Z1.6 F42000
G1 X152.596 Y108.434 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556687
G1 F7007.074
M204 S6000
G1 X152.65 Y108.931 E.02092
; LINE_WIDTH: 0.513585
G1 F7648.763
G1 X152.668 Y109.073 E.00551
; LINE_WIDTH: 0.477033
G1 F8292.774
G1 X152.686 Y109.216 E.00508
; LINE_WIDTH: 0.440482
G1 F9055.203
G1 X152.705 Y109.358 E.00465
; LINE_WIDTH: 0.401005
G1 F10053.495
G1 X152.726 Y109.501 E.00422
; LINE_WIDTH: 0.358614
G1 F11403.475
G1 X152.747 Y109.644 E.00372
; LINE_WIDTH: 0.316222
G1 F13172.24
G1 X152.768 Y109.787 E.00322
; LINE_WIDTH: 0.270728
G1 F15000
G1 X152.793 Y109.931 E.00272
; LINE_WIDTH: 0.222144
G1 X152.817 Y110.075 E.00214
; LINE_WIDTH: 0.173561
G1 X152.841 Y110.22 E.00156
; LINE_WIDTH: 0.136177
G1 X152.857 Y110.302 E.00064
; LINE_WIDTH: 0.11001
G1 X152.872 Y110.385 E.00046
; OBJECT_ID: 6
; WIPE_START
G1 X152.857 Y110.302 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X160.487 Y110.128 Z1.6 F42000
G1 X219.315 Y108.79 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.202 Y108.79 E.00377
G1 X219.118 Y109.037 E.00866
G1 X218.665 Y108.655 E.01966
G3 X218.51 Y108.317 I.352 J-.365 E.0126
G1 X218.509 Y100.933 E.24497
G2 X197.491 Y104.489 I-10.206 J3.571 E1.0056
G1 X197.491 Y107.948 E.11473
G1 X197.264 Y107.964 E.00755
G3 X197.109 Y106.088 I14.815 J-2.165 E.06246
G3 X197.144 Y103.613 I31.437 J-.79 E.08215
G3 X208.66 Y93.316 I11.157 J.89 E.56555
G3 X217.979 Y98.882 I-.39 J11.237 E.37577
G1 X218.492 Y99.808 E.03509
G1 X230.019 Y99.809 E.38238
G3 X230.49 Y100.289 I-.024 J.494 E.02451
G1 X230.49 Y108.308 E.26601
G3 X230.009 Y108.788 I-.494 J-.013 E.02486
G1 X219.375 Y108.79 E.35274
M204 S10000
G1 X219.549 Y109.197 F42000
G1 F8843.478
M204 S6000
G1 X219.494 Y109.197 E.00185
G3 X218.898 Y110.81 I-15.243 J-4.712 E.05708
G1 X218.702 Y110.77 E.00662
G1 X218.702 Y109.219 E.05147
G3 X218.25 Y108.791 I.999 J-1.508 E.02073
G3 X218.103 Y108.333 I.799 J-.509 E.01613
G1 X218.102 Y101.009 E.24296
G2 X197.898 Y104.493 I-9.8 J3.493 E.96575
G1 X197.898 Y110.768 E.20817
G1 X197.704 Y110.809 E.00656
G3 X196.702 Y106.093 I10.647 J-4.728 E.16113
G3 X196.739 Y103.581 I31.819 J-.794 E.08336
G3 X208.674 Y92.909 I11.563 J.922 E.58616
G3 X218.331 Y98.678 I-.405 J11.646 E.38941
G1 X218.732 Y99.401 E.0274
G1 X230.035 Y99.402 E.37495
G3 X230.897 Y100.269 I-.041 J.902 E.04454
G1 X230.897 Y108.328 E.26733
G3 X230.029 Y109.195 I-.902 J-.035 E.04475
G1 X219.609 Y109.197 E.34564
M204 S250
G1 X219.775 Y109.589 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X218.31 Y112.695 I-11.633 J-3.587 E.10588
G1 X218.31 Y109.401 E.10121
G3 X217.711 Y108.349 I.809 J-1.157 E.03846
G1 X217.71 Y101.083 E.22325
G2 X198.29 Y104.497 I-9.409 J3.419 E.85903
G1 X198.29 Y112.695 E.2519
G3 X196.31 Y106.097 I10.203 J-6.658 E.2146
G3 X196.348 Y103.549 I32.186 J-.798 E.0783
G3 X208.688 Y92.517 I11.954 J.954 E.56134
G3 X218.963 Y99.009 I-.394 J12.001 E.39157
G1 X230.051 Y99.01 E.3407
G3 X231.289 Y100.25 I-.057 J1.295 E.05912
G1 X231.289 Y108.347 E.24881
G3 X230.048 Y109.588 I-1.295 J-.055 E.0592
G1 X219.835 Y109.589 E.31383
M204 S10000
G1 X219.048 Y109.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.30808
G1 F13576.703
M204 S6000
G1 X219.075 Y109.267 E.00362
M204 S10000
G1 X219.048 Y109.433 F42000
; LINE_WIDTH: 0.267063
G1 F15000
M204 S6000
G1 X219.021 Y109.598 E.00306
; LINE_WIDTH: 0.226046
G1 X218.994 Y109.764 E.0025
; LINE_WIDTH: 0.185029
G1 X218.966 Y109.929 E.00194
; LINE_WIDTH: 0.147631
G1 X218.947 Y110.035 E.00091
; LINE_WIDTH: 0.113824
M73 P55 R12
G1 X218.928 Y110.14 E.00062
M204 S10000
G1 X218.757 Y110.982 F42000
; LINE_WIDTH: 0.454245
G1 F8752.207
M204 S6000
G1 X218.546 Y111.936 E.03274
; WIPE_START
G1 X218.757 Y110.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X219.51 Y108.441 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X218.96 Y108.441 E.01826
G3 X218.859 Y108.283 I.102 J-.177 E.00649
G1 X218.858 Y107.401 E.02925
G1 X219.041 Y107.422 E.00611
G1 X219.696 Y107.217 E.02278
G3 X221.007 Y106.183 I6.437 J6.811 E.05544
G3 X222.972 Y106.875 I.444 J1.876 E.07303
G1 X223.627 Y107.344 E.02674
G2 X225.593 Y106.652 I.444 J-1.876 E.07303
G1 X226.248 Y106.183 E.02674
G3 X228.214 Y106.875 I.444 J1.876 E.07303
G1 X228.869 Y107.344 E.02674
G2 X230.141 Y107.228 I.507 J-1.472 E.04368
G1 X230.141 Y104.728 E.08293
G3 X228.214 Y104.032 I-.415 J-1.868 E.07176
G1 X227.558 Y103.562 E.02674
G2 X225.593 Y104.254 I-.444 J1.876 E.07303
G1 X224.938 Y104.724 E.02674
G3 X222.972 Y104.032 I-.444 J-1.876 E.07303
G1 X222.317 Y103.562 E.02674
G2 X220.352 Y104.254 I-.444 J1.876 E.07303
G1 X219.696 Y104.724 E.02674
G1 X219.041 Y104.802 E.02189
G1 X218.858 Y104.744 E.00638
G1 X218.858 Y102.159 E.08575
G1 X219.041 Y102.181 E.00614
G1 X219.696 Y101.975 E.02278
G3 X221.007 Y100.941 I6.438 J6.813 E.05544
G3 X222.972 Y101.634 I.444 J1.876 E.07303
G1 X223.627 Y102.103 E.02674
G2 X225.593 Y101.411 I.444 J-1.876 E.07303
G1 X226.248 Y100.941 E.02674
G3 X228.214 Y101.634 I.444 J1.876 E.07303
G1 X228.869 Y102.103 E.02674
G2 X230.141 Y101.987 I.507 J-1.472 E.04368
G1 X230.141 Y100.359 E.05401
; WIPE_START
G1 X230.141 Y101.987 E-.61876
G1 X229.787 Y102.098 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X222.285 Y103.502 Z1.6 F42000
G1 X197.395 Y108.159 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56583
G1 F6884.56
M204 S6000
G1 X197.427 Y108.451 E.01252
; LINE_WIDTH: 0.531088
G1 F7374.514
G1 X197.459 Y108.743 E.01169
; LINE_WIDTH: 0.494336
G1 F7974.906
G1 X197.478 Y108.892 E.00552
; LINE_WIDTH: 0.455568
G1 F8724.145
G1 X197.498 Y109.04 E.00504
; LINE_WIDTH: 0.4168
G1 F9628.764
G1 X197.517 Y109.189 E.00457
; LINE_WIDTH: 0.374853
G1 F10845.562
G1 X197.54 Y109.339 E.00409
; LINE_WIDTH: 0.329759
G1 F12550.595
G1 X197.562 Y109.488 E.00354
; LINE_WIDTH: 0.284665
G1 F14891.726
G1 X197.585 Y109.638 E.00298
; LINE_WIDTH: 0.242805
G1 F15000
G1 X197.604 Y109.751 E.00186
; LINE_WIDTH: 0.204216
G1 X197.623 Y109.864 E.0015
; LINE_WIDTH: 0.165626
G1 X197.643 Y109.976 E.00114
; LINE_WIDTH: 0.127036
G1 X197.662 Y110.089 E.00078
; LINE_WIDTH: 0.102329
G1 X197.672 Y110.144 E.00027
; OBJECT_ID: 9
; WIPE_START
G1 X197.662 Y110.089 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X192.542 Y115.749 Z1.6 F42000
G1 X137.415 Y176.69 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.302 Y176.69 E.00377
G1 X137.218 Y176.937 E.00865
G1 X136.765 Y176.555 E.01966
G3 X136.61 Y176.208 I.349 J-.363 E.01292
G1 X136.609 Y168.832 E.24465
G2 X115.591 Y172.389 I-10.206 J3.571 E1.00559
G1 X115.591 Y175.848 E.11473
G1 X115.364 Y175.864 E.00755
G3 X115.209 Y173.989 I14.828 J-2.166 E.06245
G3 X115.269 Y171.268 I26.25 J-.785 E.09031
G3 X126.76 Y161.216 I11.147 J1.149 E.55715
G3 X136.079 Y166.783 I-.363 J11.192 E.37593
G1 X136.592 Y167.708 E.03508
G1 X148.119 Y167.709 E.38238
G3 X148.59 Y168.189 I-.024 J.494 E.02452
G1 X148.587 Y176.256 E.2676
G3 X148.109 Y176.688 I-.5 J-.072 E.02317
G1 X137.475 Y176.69 E.35275
M204 S10000
G1 X137.649 Y177.097 F42000
G1 F8843.478
M204 S6000
G1 X137.594 Y177.097 E.00185
G3 X136.998 Y178.71 I-15.24 J-4.711 E.05708
G1 X136.802 Y178.67 E.00662
G1 X136.802 Y177.119 E.05148
G3 X136.35 Y176.691 I.997 J-1.506 E.02073
G3 X136.203 Y176.227 I.779 J-.502 E.01633
G1 X136.202 Y168.909 E.24277
G2 X115.998 Y172.393 I-9.8 J3.493 E.96574
G1 X115.998 Y178.668 E.20816
G1 X115.804 Y178.709 E.00656
G3 X114.802 Y173.992 I10.647 J-4.728 E.16113
G3 X114.864 Y171.228 I26.729 J-.787 E.09178
G3 X126.774 Y160.809 I11.553 J1.19 E.57748
G3 X136.432 Y166.578 I-.377 J11.599 E.38957
G1 X136.832 Y167.301 E.0274
G1 X148.135 Y167.302 E.37495
G3 X148.997 Y168.169 I-.041 J.902 E.04454
G1 X148.997 Y176.234 E.26752
G3 X148.129 Y177.095 I-.902 J-.041 E.04455
G1 X137.709 Y177.097 E.34565
M204 S250
G1 X137.875 Y177.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X136.41 Y180.595 I-11.634 J-3.588 E.10588
G1 X136.41 Y177.301 E.10122
G3 X135.811 Y176.247 I.808 J-1.156 E.03852
G1 X135.81 Y168.983 E.22319
G2 X116.39 Y172.397 I-9.409 J3.419 E.85903
G1 X116.39 Y180.595 E.2519
G3 X114.705 Y176.631 I10.015 J-6.598 E.13307
G3 X114.41 Y173.997 I13.218 J-2.813 E.08157
G3 X114.474 Y171.189 I27.208 J-.788 E.08633
G3 X114.945 Y168.864 I13.536 J1.536 E.07297
G3 X126.788 Y160.417 I11.475 J3.562 E.48009
G3 X137.063 Y166.909 I-.422 J12.045 E.39142
G1 X148.151 Y166.91 E.3407
G3 X149.389 Y168.15 I-.057 J1.295 E.05912
G1 X149.389 Y176.249 E.24887
G3 X148.148 Y177.488 I-1.295 J-.057 E.05913
G1 X137.935 Y177.489 E.31384
M204 S10000
G1 X137.148 Y177.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308177
G1 F13571.768
M204 S6000
G1 X137.176 Y177.167 E.00362
M204 S10000
G1 X137.148 Y177.333 F42000
; LINE_WIDTH: 0.267201
G1 F15000
M204 S6000
G1 X137.121 Y177.498 E.00306
; LINE_WIDTH: 0.226225
G1 X137.094 Y177.663 E.0025
; LINE_WIDTH: 0.185248
G1 X137.067 Y177.829 E.00194
; LINE_WIDTH: 0.147792
G1 X137.047 Y177.934 E.00092
; LINE_WIDTH: 0.113878
G1 X137.028 Y178.04 E.00062
M204 S10000
G1 X136.857 Y178.882 F42000
; LINE_WIDTH: 0.454249
G1 F8752.121
M204 S6000
G1 X136.647 Y179.835 E.03272
; WIPE_START
G1 X136.857 Y178.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.61 Y176.341 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.06 Y176.341 E.01827
G3 X136.959 Y176.176 I.102 J-.176 E.00671
G1 X136.958 Y175.301 E.02903
M73 P55 R11
G1 X137.141 Y175.322 E.00611
G1 X137.796 Y175.117 E.02278
G3 X139.107 Y174.083 I6.437 J6.811 E.05544
G3 X141.072 Y174.775 I.444 J1.876 E.07303
G1 X141.727 Y175.244 E.02674
G2 X143.693 Y174.552 I.444 J-1.876 E.07303
G1 X144.348 Y174.083 E.02674
G3 X146.314 Y174.775 I.444 J1.876 E.07303
G1 X146.969 Y175.244 E.02674
G2 X148.241 Y175.128 I.507 J-1.472 E.04368
G1 X148.241 Y172.628 E.08293
G3 X146.314 Y171.932 I-.415 J-1.868 E.07176
G1 X145.658 Y171.462 E.02674
G2 X143.693 Y172.154 I-.444 J1.876 E.07303
G1 X143.038 Y172.624 E.02674
G3 X141.072 Y171.932 I-.444 J-1.876 E.07303
G1 X140.417 Y171.462 E.02674
G2 X138.452 Y172.154 I-.444 J1.876 E.07303
G1 X137.796 Y172.624 E.02674
G1 X137.141 Y172.702 E.02189
G1 X136.958 Y172.644 E.00637
G1 X136.958 Y170.059 E.08575
G1 X137.141 Y170.081 E.00614
G1 X137.796 Y169.875 E.02278
G3 X139.107 Y168.841 I6.438 J6.813 E.05544
G3 X141.072 Y169.534 I.444 J1.876 E.07303
G1 X141.727 Y170.003 E.02674
G2 X143.693 Y169.311 I.444 J-1.876 E.07303
G1 X144.348 Y168.841 E.02674
G3 X146.314 Y169.534 I.444 J1.876 E.07303
G1 X146.969 Y170.003 E.02674
G2 X148.241 Y169.887 I.507 J-1.472 E.04368
G1 X148.241 Y168.259 E.05401
; WIPE_START
G1 X148.241 Y169.887 E-.61876
G1 X147.887 Y169.998 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.385 Y171.402 Z1.6 F42000
G1 X115.495 Y176.059 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56582
G1 F6884.687
M204 S6000
G1 X115.527 Y176.351 E.01253
; LINE_WIDTH: 0.531059
G1 F7374.953
G1 X115.559 Y176.643 E.0117
; LINE_WIDTH: 0.494279
G1 F7975.919
G1 X115.578 Y176.792 E.00552
; LINE_WIDTH: 0.455516
G1 F8725.244
G1 X115.598 Y176.94 E.00504
; LINE_WIDTH: 0.416754
G1 F9629.964
G1 X115.617 Y177.089 E.00457
; LINE_WIDTH: 0.37484
G1 F10846.002
G1 X115.64 Y177.239 E.00409
; LINE_WIDTH: 0.329759
G1 F12550.611
G1 X115.662 Y177.388 E.00354
; LINE_WIDTH: 0.284678
G1 F14890.942
G1 X115.685 Y177.538 E.00298
; LINE_WIDTH: 0.242812
G1 F15000
G1 X115.704 Y177.651 E.00186
; LINE_WIDTH: 0.204195
G1 X115.723 Y177.764 E.0015
; LINE_WIDTH: 0.165578
G1 X115.743 Y177.877 E.00114
; LINE_WIDTH: 0.126961
G1 X115.762 Y177.989 E.00078
; LINE_WIDTH: 0.102277
G1 X115.772 Y178.044 E.00027
; OBJECT_ID: 8
; WIPE_START
G1 X115.762 Y177.989 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X108.141 Y177.571 Z1.6 F42000
G1 X92.078 Y176.689 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.967 Y176.689 E.00369
G1 X91.873 Y176.983 E.01023
G1 X91.365 Y176.555 E.02206
G3 X91.21 Y176.207 I.342 J-.36 E.01293
G1 X91.209 Y168.583 E.25291
G2 X70.791 Y172.089 I-9.904 J3.527 E.97563
G1 X70.791 Y176.121 E.13376
G1 X70.568 Y176.141 E.00742
G3 X70.409 Y174.288 I11.049 J-1.882 E.06174
G3 X70.418 Y171.664 I65.935 J-1.09 E.08706
G3 X81.316 Y161.21 I10.884 J.438 E.55351
G3 X90.8 Y166.774 I-.018 J10.896 E.38232
G1 X91.299 Y167.708 E.03512
G1 X102.709 Y167.709 E.37849
G3 X103.19 Y168.189 I-.013 J.494 E.02485
G1 X103.19 Y176.218 E.26633
G3 X102.709 Y176.688 I-.497 J-.027 E.02449
G1 X92.138 Y176.689 E.35066
M204 S10000
G1 X92.319 Y177.096 F42000
G1 F8843.478
M204 S6000
G1 X92.264 Y177.096 E.00181
G3 X91.594 Y178.948 I-16.709 J-4.999 E.06535
G1 X91.402 Y178.906 E.00653
G1 X91.402 Y177.118 E.0593
G3 X90.95 Y176.691 I.998 J-1.507 E.02073
G3 X90.803 Y176.227 I.775 J-.501 E.01633
G1 X90.802 Y168.661 E.25099
G2 X71.198 Y172.093 I-9.499 J3.448 E.93582
G1 X71.198 Y178.905 E.22597
G1 X71.004 Y178.945 E.00658
G3 X70.002 Y174.293 I10.659 J-4.729 E.159
G3 X70.011 Y171.648 I66.388 J-1.094 E.08773
G3 X81.318 Y160.803 I11.29 J.454 E.57424
G3 X91.155 Y166.575 I-.02 J11.304 E.39659
G1 X91.543 Y167.3 E.0273
G1 X102.729 Y167.302 E.37106
G3 X103.597 Y168.169 I-.035 J.902 E.04474
G1 X103.597 Y176.234 E.26752
G3 X102.729 Y177.095 I-.909 J-.048 E.04447
G1 X92.379 Y177.096 E.34334
M204 S250
G1 X92.551 Y177.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X91.01 Y180.804 I-11.401 J-3.283 E.11278
G1 X91.01 Y177.301 E.10764
G3 X90.411 Y176.246 I.797 J-1.15 E.03854
G1 X90.41 Y168.736 E.23078
G2 X71.59 Y172.096 I-9.108 J3.372 E.83135
G1 X71.59 Y180.807 E.26767
G3 X70.122 Y177.713 I9.804 J-6.546 E.10561
G3 X69.61 Y174.296 I11.934 J-3.536 E.1065
G3 X69.619 Y171.633 I66.874 J-1.098 E.08186
G3 X81.319 Y160.411 I11.682 J.47 E.55041
G3 X91.778 Y166.908 I-.049 J11.746 E.39825
G1 X102.749 Y166.91 E.33709
G3 X103.989 Y168.15 I-.055 J1.295 E.05919
G1 X103.989 Y176.249 E.24887
G3 X102.748 Y177.487 I-1.306 J-.068 E.05901
G1 X92.611 Y177.488 E.31151
M204 S10000
G1 X91.773 Y177.414 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.36089
G1 F11321.823
M204 S6000
G1 X91.807 Y177.194 E.00578
M204 S10000
G1 X91.773 Y177.414 F42000
; LINE_WIDTH: 0.312654
G1 F13346.483
M204 S6000
G1 X91.739 Y177.635 E.0049
; LINE_WIDTH: 0.264418
G1 F15000
G1 X91.704 Y177.855 E.00403
; LINE_WIDTH: 0.2164
G1 X91.679 Y178 E.00207
; LINE_WIDTH: 0.168608
G1 X91.653 Y178.144 E.0015
; LINE_WIDTH: 0.120816
G1 X91.628 Y178.288 E.00093
; WIPE_START
G1 X91.653 Y178.144 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.236 Y176.341 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.702 Y176.377 E.01776
G3 X91.573 Y176.247 I.126 J-.253 E.00616
G3 X91.558 Y175.365 I2.247 J-.479 E.02946
G1 X92.041 Y175.422 E.01613
G1 X92.696 Y175.216 E.02278
G1 X93.352 Y174.652 E.02868
G3 X95.317 Y174.311 I1.209 J1.133 E.07101
G1 X95.972 Y174.875 E.02868
G2 X97.938 Y175.216 I1.209 J-1.133 E.07101
G1 X98.593 Y174.652 E.02868
G3 X100.558 Y174.311 I1.209 J1.133 E.07101
G2 X101.869 Y175.344 I6.437 J-6.812 E.05544
G1 X102.524 Y175.422 E.02189
G1 X102.841 Y175.323 E.01104
G1 X102.841 Y172.764 E.08488
G1 X102.524 Y172.802 E.01061
G1 X101.869 Y172.596 E.02278
G1 X101.214 Y172.032 E.02868
G2 X99.248 Y171.69 I-1.209 J1.133 E.07101
G1 X98.593 Y172.254 E.02868
G3 X96.627 Y172.596 I-1.209 J-1.133 E.07101
G1 X95.972 Y172.032 E.02868
G2 X94.007 Y171.69 I-1.209 J1.133 E.07101
G1 X93.352 Y172.254 E.02868
G3 X91.558 Y172.65 I-1.176 J-1.07 E.06496
G1 X91.558 Y170.123 E.0838
G1 X92.041 Y170.181 E.01616
G1 X92.696 Y169.975 E.02278
G1 X93.352 Y169.411 E.02868
G3 X95.317 Y169.069 I1.209 J1.133 E.07101
G1 X95.972 Y169.634 E.02868
G2 X97.938 Y169.975 I1.209 J-1.133 E.07101
G1 X98.593 Y169.411 E.02868
G3 X100.558 Y169.069 I1.209 J1.133 E.07101
G2 X101.869 Y170.103 I6.436 J-6.81 E.05544
G1 X102.524 Y170.181 E.02189
G1 X102.841 Y170.081 E.01104
G1 X102.841 Y168.453 E.05401
; WIPE_START
G1 X102.841 Y170.081 E-.61876
G1 X102.524 Y170.181 E-.12648
G1 X102.485 Y170.176 E-.01476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.992 Y171.628 Z1.6 F42000
G1 X70.696 Y176.334 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556657
G1 F7007.479
M204 S6000
G1 X70.75 Y176.831 E.02093
; LINE_WIDTH: 0.513558
G1 F7649.194
G1 X70.768 Y176.973 E.0055
; LINE_WIDTH: 0.477074
G1 F8292.001
G1 X70.786 Y177.115 E.00507
; LINE_WIDTH: 0.440589
G1 F9052.757
G1 X70.805 Y177.258 E.00465
; LINE_WIDTH: 0.401114
G1 F10050.429
G1 X70.826 Y177.401 E.00422
; LINE_WIDTH: 0.358661
G1 F11401.75
G1 X70.847 Y177.544 E.00372
; LINE_WIDTH: 0.316209
G1 F13172.901
G1 X70.868 Y177.687 E.00322
; LINE_WIDTH: 0.27073
G1 F15000
G1 X70.893 Y177.831 E.00271
; LINE_WIDTH: 0.222188
G1 X70.917 Y177.975 E.00213
; LINE_WIDTH: 0.173647
G1 X70.941 Y178.119 E.00156
; LINE_WIDTH: 0.136252
G1 X70.957 Y178.202 E.00064
; LINE_WIDTH: 0.110034
G1 X70.972 Y178.285 E.00046
; OBJECT_ID: 7
; WIPE_START
G1 X70.957 Y178.202 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X63.338 Y177.746 Z1.6 F42000
G1 X47.179 Y176.78 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X47.108 Y177.014 E.00809
G1 X46.565 Y176.556 E.02357
G3 X46.41 Y176.209 I.332 J-.356 E.01295
G1 X46.409 Y168.419 E.25841
G2 X26.391 Y171.89 I-9.704 J3.493 E.95591
G1 X26.391 Y176.302 E.14636
G1 X26.168 Y176.322 E.00743
G3 X26.009 Y174.49 I10.8 J-1.858 E.06107
G3 X26.018 Y171.478 I76.373 J-1.29 E.0999
G3 X36.955 Y161.214 I10.699 J.441 E.55122
G3 X46.082 Y166.775 I-.281 J10.733 E.37109
G1 X46.569 Y167.709 E.03494
G1 X57.919 Y167.71 E.37651
G3 X58.39 Y168.19 I-.027 J.497 E.02449
G1 X58.39 Y176.219 E.26632
G3 X57.913 Y176.689 I-.497 J-.027 E.02438
G1 X47.206 Y176.691 E.35515
G1 X47.197 Y176.723 E.00112
M204 S10000
G1 X47.554 Y177.098 F42000
G1 F8843.478
M204 S6000
G1 X47.508 Y177.098 E.00152
G3 X46.797 Y179.106 I-12.927 J-3.446 E.07076
G1 X46.602 Y179.066 E.0066
G1 X46.602 Y177.12 E.06457
G3 X46.15 Y176.692 I.997 J-1.506 E.02073
G3 X46.003 Y176.229 I.794 J-.507 E.01632
G1 X46.002 Y168.497 E.25646
G2 X26.798 Y171.894 I-9.3 J3.406 E.91648
G1 X26.798 Y179.068 E.23799
G1 X26.603 Y179.108 E.00661
G3 X25.602 Y174.493 I10.222 J-4.632 E.15782
G3 X25.611 Y171.462 I76.88 J-1.294 E.10055
G3 X36.965 Y160.807 I11.106 J.458 E.57225
G3 X46.439 Y166.579 I-.293 J11.142 E.38519
G1 X46.816 Y167.302 E.02702
G1 X57.935 Y167.303 E.36885
G3 X58.797 Y168.17 I-.048 J.909 E.04447
G1 X58.797 Y176.235 E.26752
G3 X57.931 Y177.097 I-.909 J-.048 E.0444
G1 X47.614 Y177.098 E.34225
M204 S250
G1 X47.798 Y177.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X47.399 Y178.683 I-12.852 J-3.635 E.03867
G3 X46.21 Y180.944 I-10.703 J-4.185 E.07868
G1 X46.21 Y177.302 E.11192
G3 X45.611 Y176.248 I.784 J-1.142 E.03857
G1 X45.61 Y168.573 E.23582
G2 X27.19 Y171.898 I-8.909 J3.329 E.81345
G1 X27.19 Y180.944 E.27798
G3 X25.21 Y174.497 I9.53 J-6.455 E.21031
G3 X25.219 Y171.447 I77.355 J-1.298 E.09374
G3 X36.976 Y160.415 I11.499 J.474 E.54883
G3 X47.054 Y166.91 I-.281 J11.502 E.38751
G1 X57.951 Y166.911 E.33484
G3 X59.189 Y168.151 I-.068 J1.306 E.05901
G1 X59.189 Y176.25 E.24887
G3 X57.949 Y177.489 I-1.306 J-.068 E.05899
G1 X47.858 Y177.49 E.31006
M204 S10000
G1 X46.997 Y177.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362578
G1 F11262.05
M204 S6000
G1 X46.966 Y177.624 E.00542
; LINE_WIDTH: 0.32306
G1 F12850.754
G1 X46.936 Y177.83 E.00475
; LINE_WIDTH: 0.280672
G1 F15000
G1 X46.913 Y177.965 E.00264
; LINE_WIDTH: 0.235387
G1 X46.891 Y178.1 E.00214
; LINE_WIDTH: 0.190103
G1 X46.868 Y178.234 E.00164
; LINE_WIDTH: 0.149835
G1 X46.848 Y178.341 E.00095
; LINE_WIDTH: 0.114558
G1 X46.828 Y178.449 E.00064
M204 S10000
G1 X46.997 Y177.418 F42000
; LINE_WIDTH: 0.402096
G1 F10022.942
M204 S6000
G1 X47.028 Y177.212 E.00609
M204 S10000
G1 X47.433 Y176.342 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X46.949 Y176.342 E.01609
G1 X46.93 Y176.403 E.00208
G3 X46.778 Y176.261 I.149 J-.313 E.007
G3 X46.758 Y175.392 I2.002 J-.48 E.02907
G2 X48.096 Y175.283 I.513 J-1.992 E.04536
G1 X48.752 Y174.719 E.02868
G3 X50.717 Y174.378 I1.209 J1.133 E.07101
G1 X51.372 Y174.942 E.02868
G2 X53.338 Y175.283 I1.209 J-1.133 E.07101
G1 X53.993 Y174.719 E.02868
G3 X55.958 Y174.378 I1.209 J1.133 E.07101
G2 X57.269 Y175.411 I6.437 J-6.812 E.05544
G1 X57.924 Y175.489 E.02189
G1 X58.041 Y175.452 E.00409
G1 X58.041 Y172.855 E.08617
G1 X57.924 Y172.869 E.00393
G1 X57.269 Y172.663 E.02278
G1 X56.614 Y172.099 E.02868
G2 X54.648 Y171.757 I-1.209 J1.133 E.07101
G1 X53.993 Y172.321 E.02868
G3 X52.027 Y172.663 I-1.209 J-1.133 E.07101
G1 X51.372 Y172.099 E.02868
G2 X49.407 Y171.757 I-1.209 J1.133 E.07101
G1 X48.752 Y172.321 E.02868
G3 X46.786 Y172.663 I-1.209 J-1.133 E.07101
G1 X46.758 Y170.15 E.08337
G2 X48.096 Y170.042 I.514 J-1.985 E.04539
G1 X48.752 Y169.478 E.02868
G3 X50.717 Y169.136 I1.209 J1.133 E.07101
G1 X51.372 Y169.701 E.02868
G2 X53.338 Y170.042 I1.209 J-1.133 E.07101
G1 X53.993 Y169.478 E.02868
G3 X55.958 Y169.136 I1.209 J1.133 E.07101
G2 X57.269 Y170.17 I6.436 J-6.81 E.05544
G1 X57.924 Y170.248 E.02189
G1 X58.041 Y170.211 E.00409
G1 X58.041 Y168.583 E.05401
; WIPE_START
G1 X58.041 Y170.211 E-.61876
G1 X57.924 Y170.248 E-.04681
G1 X57.677 Y170.219 E-.09443
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X50.194 Y171.72 Z1.6 F42000
G1 X26.297 Y176.515 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.566022
G1 F6882.024
M204 S6000
G1 X26.34 Y176.927 E.01767
; LINE_WIDTH: 0.533897
G1 F7332.323
G1 X26.357 Y177.063 E.00548
; LINE_WIDTH: 0.499811
G1 F7879.353
G1 X26.374 Y177.199 E.0051
; LINE_WIDTH: 0.465724
G1 F8514.588
G1 X26.392 Y177.335 E.00472
; LINE_WIDTH: 0.428791
G1 F9329.547
G1 X26.411 Y177.473 E.00436
; LINE_WIDTH: 0.389013
G1 F10401.845
G1 X26.431 Y177.61 E.00391
; LINE_WIDTH: 0.349234
G1 F11752.644
G1 X26.451 Y177.747 E.00346
; LINE_WIDTH: 0.306692
G1 F13648.152
G1 X26.474 Y177.885 E.003
; LINE_WIDTH: 0.261396
G1 F15000
G1 X26.496 Y178.023 E.00248
; LINE_WIDTH: 0.2161
G1 X26.519 Y178.16 E.00197
; LINE_WIDTH: 0.169328
G1 X26.546 Y178.305 E.00151
; LINE_WIDTH: 0.121062
G1 X26.572 Y178.449 E.00093
; OBJECT_ID: 3
; WIPE_START
G1 X26.546 Y178.305 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X28.102 Y170.833 Z1.6 F42000
G1 X32.72 Y148.666 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X32.677 Y148.657 E.00146
G3 X26.391 Y141.01 I1.538 J-7.671 E.35552
G1 X26.391 Y106.99 E1.12848
G3 X34.19 Y99.191 I7.812 J.013 E.40622
G1 X87.71 Y99.191 E1.77533
G3 X95.509 Y106.99 I-.013 J7.812 E.40622
G1 X95.509 Y141.01 E1.12848
G3 X87.71 Y148.809 I-7.812 J-.013 E.40622
G1 X34.19 Y148.809 E1.77533
G3 X33.283 Y148.753 I.024 J-7.823 E.03019
G1 X32.779 Y148.675 E.01691
M204 S10000
G1 X32.783 Y148.264 F42000
G1 F8843.478
M204 S6000
G1 X32.756 Y148.259 E.00093
G3 X26.798 Y141.006 I1.447 J-7.262 E.33724
G1 X26.798 Y106.994 E1.12822
G3 X34.194 Y99.598 I7.405 J.009 E.38527
G1 X87.706 Y99.598 E1.77508
G3 X95.102 Y106.994 I-.009 J7.405 E.38527
G1 X95.102 Y141.006 E1.12822
G3 X87.706 Y148.402 I-7.405 J-.009 E.38527
G1 X34.194 Y148.402 E1.77508
G3 X33.33 Y148.35 I.009 J-7.405 E.02873
G1 X32.843 Y148.274 E.01638
M204 S250
G1 X32.845 Y147.877 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X32.832 Y147.875 E.00038
G3 X27.19 Y141.002 I1.371 J-6.878 E.29595
G1 X27.19 Y106.998 E1.04485
G3 X34.198 Y99.99 I7.013 J.005 E.33818
G1 X87.702 Y99.99 E1.64403
G3 X94.71 Y106.998 I-.005 J7.013 E.33818
G1 X94.71 Y141.002 E1.04485
G3 X87.702 Y148.01 I-7.013 J-.005 E.33818
G1 X34.198 Y148.01 E1.64403
G3 X33.376 Y147.961 I.005 J-7.013 E.02531
G1 X32.904 Y147.887 E.01469
; WIPE_START
M204 S6000
G1 X32.832 Y147.875 E-.02753
G1 X32.034 Y147.667 E-.31361
M73 P56 R11
G1 X31.517 Y147.476 E-.20917
G1 X31.021 Y147.236 E-.20969
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.726 Y141.226 Z1.6 F42000
G1 X68.941 Y98.809 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y98.809 E.62195
G3 X95.891 Y107.01 I.006 J8.195 E.42739
G1 X95.891 Y140.99 E1.12718
G3 X87.69 Y149.191 I-8.195 J.006 E.4274
G1 X34.21 Y149.191 E1.77403
G3 X26.009 Y140.99 I-.006 J-8.195 E.4274
G1 X26.009 Y107.01 E1.12718
G3 X34.21 Y98.809 I8.195 J-.006 E.4274
G1 X52.959 Y98.809 E.62194
G1 X52.959 Y93.82 E.16551
G3 X53.48 Y93.309 I.495 J-.016 E.02719
G1 X68.448 Y93.31 E.49651
G3 X68.941 Y93.82 I-.002 J.496 E.02623
G1 X68.941 Y98.749 E.16352
M204 S10000
G1 X69.348 Y98.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y98.402 E.60858
G3 X96.298 Y107.006 I.002 J8.602 E.44833
G1 X96.298 Y140.994 E1.12745
G3 X87.694 Y149.598 I-8.602 J.002 E.44833
G1 X34.206 Y149.598 E1.7743
G3 X25.602 Y140.994 I-.002 J-8.602 E.44834
G1 X25.602 Y107.006 E1.12745
G3 X34.206 Y98.402 I8.602 J-.002 E.44833
G1 X52.552 Y98.402 E.60858
G1 X52.552 Y93.812 E.15226
G3 X53.468 Y92.902 I.901 J-.009 E.04773
G1 X68.461 Y92.903 E.49736
G3 X69.348 Y93.812 I-.019 J.905 E.04669
G1 X69.348 Y98.342 E.15028
M204 S250
G1 X69.74 Y98.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y98.01 E.5518
G3 X96.69 Y107.002 I-.002 J8.994 E.43398
G1 X96.69 Y140.998 E1.0446
G3 X87.698 Y149.99 I-8.994 J-.002 E.43398
G1 X34.202 Y149.99 E1.64378
G3 X31.238 Y149.486 I.013 J-9.05 E.09281
G3 X25.21 Y140.998 I2.988 J-8.507 E.34103
G1 X25.21 Y107.002 E1.0446
G3 X34.202 Y98.01 I8.994 J.002 E.43398
G1 X52.16 Y98.01 E.5518
G1 X52.16 Y93.804 E.12923
G3 X53.456 Y92.51 I1.293 J-.001 E.06254
G1 X68.475 Y92.511 E.46147
G3 X69.74 Y93.804 I-.034 J1.299 E.0615
G1 X69.74 Y97.95 E.12739
; WIPE_START
M204 S6000
G1 X71.74 Y97.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X68.59 Y94.226 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X68.59 Y93.804 E.014
G2 X68.494 Y93.672 I-.166 J.02 E.00566
G2 X67.46 Y93.658 I-.555 J2.912 E.03447
G3 X65.536 Y94.314 I-1.479 J-1.188 E.07117
G3 X64.664 Y93.658 I3.234 J-5.205 E.03626
G1 X62.219 Y93.658 E.0811
G3 X60.295 Y94.314 I-1.479 J-1.188 E.07118
G3 X59.422 Y93.658 I3.237 J-5.209 E.03627
G1 X56.978 Y93.658 E.08108
G3 X55.054 Y94.314 I-1.48 J-1.187 E.07119
G3 X54.181 Y93.657 I3.237 J-5.209 E.03628
G1 X53.499 Y93.657 E.02262
G2 X53.319 Y93.759 I-.01 J.194 E.00724
G2 X53.309 Y94.482 I1.821 J.386 E.02414
M204 S10000
G1 X53.307 Y98.589 F42000
G1 F8843.478
M204 S6000
G1 X53.307 Y98.845 E.0085
G1 X54.207 Y98.845 E.02983
G2 X53.308 Y98.385 I-1.182 J1.202 E.03402
G1 X53.309 Y95.722 E.08835
G1 X53.743 Y95.773 E.01452
G3 X55.054 Y96.807 I-5.126 J7.845 E.05544
G2 X57.019 Y96.465 I.756 J-1.475 E.07101
G1 X57.674 Y95.901 E.02868
G3 X59.64 Y96.243 I.756 J1.475 E.07101
G1 X60.295 Y96.807 E.02868
G2 X62.26 Y96.465 I.756 J-1.475 E.07101
G1 X62.916 Y95.901 E.02868
G3 X64.881 Y96.243 I.756 J1.475 E.07101
G1 X65.536 Y96.807 E.02868
G2 X67.502 Y96.465 I.756 J-1.475 E.07101
G1 X68.157 Y95.901 E.02868
G1 X68.591 Y95.765 E.0151
G1 X68.592 Y98.342 E.0855
G1 X68.157 Y98.394 E.01455
G1 X67.526 Y98.846 E.02575
G1 X64.691 Y98.846 E.09405
G2 X62.916 Y98.394 I-1.29 J1.356 E.0635
G1 X62.285 Y98.846 E.02572
G1 X59.449 Y98.845 E.0941
G2 X57.674 Y98.394 I-1.289 J1.355 E.06346
G1 X57.045 Y98.845 E.02569
G1 X55.417 Y98.845 E.05401
; OBJECT_ID: 1
; WIPE_START
G1 X57.045 Y98.845 E-.61876
G1 X57.347 Y98.629 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X60.86 Y91.853 Z1.6 F42000
G1 X91.297 Y33.15 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X91.943 Y33.646 E.02703
G3 X94.509 Y39.19 I-4.757 J5.567 E.20904
G1 X94.509 Y73.21 E1.12848
G3 X94.1 Y75.606 I-7.351 J-.02 E.08101
G3 X87.21 Y80.509 I-6.917 J-2.427 E.29903
G1 X33.69 Y80.509 E1.77533
G3 X26.391 Y73.21 I.013 J-7.312 E.38017
G1 X26.391 Y39.19 E1.12848
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X91.246 Y33.119 I-.023 J7.322 E.14196
M204 S10000
G1 X91.052 Y33.474 F42000
G1 F8843.478
M204 S6000
G1 X91.679 Y33.956 E.02624
G3 X94.102 Y39.194 I-4.492 J5.257 E.1975
G1 X94.102 Y73.206 E1.12822
G3 X87.206 Y80.102 I-6.905 J-.009 E.35922
G1 X33.694 Y80.102 E1.77508
G3 X26.798 Y73.206 I.009 J-6.905 E.35922
G1 X26.798 Y39.194 E1.12822
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X91 Y33.444 I-.018 J6.915 E.13335
M204 S250
G1 X90.814 Y33.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X93.71 Y39.198 I-3.626 J5.421 E.19621
G1 X93.71 Y73.202 E1.04485
G3 X87.202 Y79.71 I-6.513 J-.005 E.31405
G1 X33.698 Y79.71 E1.64403
G3 X27.19 Y73.202 I.005 J-6.513 E.31405
G1 X27.19 Y39.198 E1.04485
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.202 Y32.69 E1.64403
G3 X90.764 Y33.758 I-.014 J6.522 E.11587
; WIPE_START
M204 S6000
G1 X91.428 Y34.25 E-.31394
G1 X91.803 Y34.597 E-.19422
G1 X92.244 Y35.092 E-.25184
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.696 Y33.956 Z1.6 F42000
G1 X68.441 Y31.509 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I-.005 J7.706 E.40119
G1 X94.891 Y73.19 E1.12718
G3 X87.19 Y80.891 I-7.695 J.006 E.40134
G1 X33.71 Y80.891 E1.77404
G3 X26.009 Y73.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E1.12718
G3 X33.71 Y31.509 I7.695 J-.006 E.40135
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.52 E.1655
G3 X52.98 Y26.009 I.495 J-.016 E.0272
G1 X67.948 Y26.01 E.49652
G3 X68.441 Y26.52 I-.002 J.496 E.02622
G1 X68.441 Y31.449 E.16352
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I-.01 J8.113 E.42212
G1 X95.298 Y73.194 E1.12745
G3 X87.194 Y81.298 I-8.102 J.002 E.42228
G1 X33.706 Y81.298 E1.77431
G3 X25.602 Y73.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E1.12745
G3 X33.706 Y31.102 I8.102 J-.002 E.42228
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.512 E.15226
G3 X52.968 Y25.602 I.901 J-.009 E.04773
G1 X67.961 Y25.603 E.49737
G3 X68.848 Y26.512 I-.019 J.905 E.04668
G1 X68.848 Y31.042 E.15028
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X92.068 Y32.246 I-.038 J8.609 E.15929
G3 X95.611 Y38.054 I-4.918 J6.985 E.21501
G3 X95.69 Y39.202 I-11.959 J1.404 E.03538
G1 X95.69 Y73.198 E1.0446
G3 X88.346 Y81.611 I-8.492 J-.001 E.37445
G3 X87.198 Y81.69 I-1.404 J-11.96 E.03538
M73 P57 R11
G1 X33.702 Y81.69 E1.64378
G3 X25.21 Y73.198 I.014 J-8.506 E.4097
G1 X25.21 Y39.202 E1.0446
G3 X33.702 Y30.71 I8.494 J.002 E.40985
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.504 E.12923
G3 X52.956 Y25.21 I1.293 J-.001 E.06254
G1 X67.975 Y25.211 E.46148
G3 X69.24 Y26.504 I-.034 J1.299 E.0615
G1 X69.24 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X68.005 Y26.378 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G2 X67.917 Y26.358 I-.07 J.101 E.00306
G1 X66.38 Y26.358 E.051
G3 X65.036 Y26.514 I-.835 J-1.324 E.04639
G1 X64.818 Y26.358 E.00891
G1 X61.139 Y26.358 E.12205
G3 X59.795 Y26.514 I-.835 J-1.324 E.0464
G1 X59.576 Y26.358 E.00892
G1 X55.898 Y26.358 E.12203
G3 X54.554 Y26.514 I-.836 J-1.323 E.04641
G1 X54.335 Y26.357 E.00893
G1 X52.999 Y26.357 E.04431
G2 X52.809 Y26.506 I-.028 J.159 E.00901
G1 X52.809 Y27.922 E.04697
G1 X53.243 Y27.973 E.01452
G1 X53.898 Y28.443 E.02674
G2 X55.864 Y29.135 I1.521 J-1.184 E.07303
G1 X56.519 Y28.665 E.02674
G3 X58.485 Y27.973 I1.521 J1.184 E.07303
G1 X59.14 Y28.443 E.02674
G2 X61.105 Y29.135 I1.521 J-1.184 E.07303
G1 X61.76 Y28.665 E.02674
G3 X63.726 Y27.973 I1.521 J1.184 E.07303
G1 X64.381 Y28.443 E.02674
G2 X66.347 Y29.135 I1.521 J-1.184 E.07303
G2 X67.657 Y28.101 I-5.128 J-7.847 E.05544
G1 X68.091 Y27.965 E.01509
G1 X68.092 Y30.542 E.0855
G1 X67.657 Y30.594 E.01454
G2 X66.442 Y31.546 I4.715 J7.272 E.05128
G1 X64.743 Y31.546 E.05634
G1 X64.381 Y31.286 E.01478
G2 X62.416 Y30.594 I-1.521 J1.184 E.07303
G2 X61.201 Y31.545 I4.713 J7.269 E.05125
G1 X59.501 Y31.545 E.05638
G1 X59.14 Y31.286 E.01475
G2 X57.174 Y30.594 I-1.521 J1.184 E.07303
G2 X55.96 Y31.545 I4.711 J7.266 E.05122
G1 X54.259 Y31.545 E.05643
G3 X53.243 Y30.722 I4.094 J-6.094 E.04342
G1 X52.808 Y30.585 E.01515
G1 X52.808 Y28.957 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X52.808 Y30.585 E-.61876
G1 X53.162 Y30.696 E-.14125
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 7/15
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I-.422 J1.142 P1  F42000
G1 X175.402 Y75.829 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X175.237 Y76.273 E.01572
G3 X168.31 Y80.909 I-6.94 J-2.876 E.2931
G1 X114.79 Y80.909 E1.77533
G3 X107.291 Y73.41 I.023 J-7.523 E.39044
G1 X107.291 Y39.39 E1.12848
G3 X114.79 Y31.891 I7.512 J.013 E.39059
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.013 J7.512 E.39059
G1 X175.809 Y73.41 E1.12848
G3 X175.441 Y75.72 I-7.512 J-.013 E.07793
G1 X175.422 Y75.773 E.00185
M204 S10000
G1 X175.02 Y75.688 F42000
G1 F8843.478
M204 S6000
G1 X174.861 Y76.117 E.01519
G3 X168.306 Y80.502 I-6.564 J-2.721 E.27732
G1 X114.794 Y80.502 E1.77508
G3 X107.698 Y73.406 I.019 J-7.115 E.36949
G1 X107.698 Y39.394 E1.12822
G3 X114.794 Y32.298 I7.115 J.019 E.3695
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.009 J7.105 E.36964
G1 X175.402 Y73.406 E1.12822
G3 X175.054 Y75.594 I-7.105 J-.009 E.07382
G1 X175.04 Y75.632 E.00132
M204 S250
G1 X174.644 Y75.55 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X174.498 Y75.968 E.01359
G3 X168.302 Y80.11 I-6.201 J-2.571 E.2428
G1 X114.798 Y80.11 E1.64403
G3 X108.09 Y73.402 I.015 J-6.722 E.32357
G1 X108.09 Y39.398 E1.04485
G3 X114.798 Y32.69 I6.722 J.015 E.32357
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.005 J6.713 E.3237
G1 X175.01 Y73.402 E1.04485
G3 X174.757 Y75.221 I-6.713 J-.005 E.05661
G1 X174.664 Y75.493 E.00885
; WIPE_START
M204 S6000
G1 X174.498 Y75.968 E-.19081
G1 X174.154 Y76.679 E-.30017
G1 X173.879 Y77.128 E-.20022
G1 X173.77 Y77.272 E-.0688
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.199 Y70.527 Z1.8 F42000
G1 X149.541 Y31.509 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I-.005 J7.906 E.41161
G1 X176.191 Y73.39 E1.12718
G3 X168.29 Y81.291 I-7.906 J-.005 E.41161
G1 X114.81 Y81.291 E1.77403
G3 X106.909 Y73.39 I-.006 J-7.895 E.41177
G1 X106.909 Y39.41 E1.12718
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.52 E.16551
G3 X134.08 Y26.009 I.497 J-.013 E.02715
G1 X149.044 Y26.01 E.49638
G3 X149.541 Y26.52 I.002 J.496 E.02637
G1 X149.541 Y31.449 E.16351
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.01 J8.314 E.43254
G1 X176.598 Y73.394 E1.12745
G3 X168.294 Y81.698 I-8.314 J-.01 E.43254
G1 X114.806 Y81.698 E1.7743
G3 X106.502 Y73.394 I-.002 J-8.302 E.4327
G1 X106.502 Y39.406 E1.12745
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.512 E.15227
G3 X134.068 Y25.602 I.906 J-.004 E.04766
G1 X149.057 Y25.603 E.49722
G3 X149.948 Y26.512 I-.014 J.905 E.04683
G1 X149.948 Y31.042 E.15028
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.99 Y39.402 I-.014 J8.706 E.41935
G1 X176.99 Y73.398 E1.0446
G3 X168.298 Y82.09 I-8.706 J-.014 E.41935
G1 X114.802 Y82.09 E1.64378
G3 X111.97 Y81.614 I.013 J-8.748 E.08864
G3 X106.11 Y73.398 I2.855 J-8.234 E.33072
G1 X106.11 Y39.402 E1.0446
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.504 E.12923
G3 X134.056 Y25.21 I1.3 J.006 E.06245
G1 X149.07 Y25.211 E.46133
G3 X150.34 Y26.504 I-.03 J1.299 E.06164
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 7 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer7 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X149.174 Y26.531 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38314
G1 F10581.401
M204 S6000
G1 X149.09 Y26.399 E.00434
G1 X148.998 Y26.372 E.00266
G1 X134.1 Y26.372 E.41303
G1 X133.963 Y26.424 E.00405
G1 X133.924 Y26.531 E.00315
G1 X133.922 Y31.371 E.13418
G1 X133.949 Y31.503 E.00373
G1 X134.081 Y31.53 E.00373
G1 X149.019 Y31.532 E.41413
G1 X149.151 Y31.504 E.00373
G1 X149.178 Y31.372 E.00374
G1 X149.174 Y26.591 E.13255
M204 S10000
G1 X148.813 Y26.75 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X147.2 Y26.735 E.05352
G3 X146.602 Y26.735 I-.299 J-.662 E.02044
G1 X141.959 Y26.735 E.154
G3 X141.36 Y26.735 I-.3 J-.664 E.02049
G1 X136.719 Y26.735 E.15394
G3 X136.118 Y26.735 I-.3 J-.666 E.02055
G1 X134.49 Y26.735 E.05401
M204 S10000
G1 X136.286 Y31.168 F42000
G1 F8843.478
M204 S6000
G1 X137.914 Y31.168 E.05401
G3 X139.585 Y30.807 I1.192 J1.471 E.0588
G1 X140.08 Y31.168 E.02032
G1 X143.155 Y31.168 E.10201
G3 X144.826 Y30.807 I1.192 J1.471 E.05884
M73 P58 R11
G1 X145.322 Y31.169 E.02035
G1 X148.396 Y31.169 E.10196
G3 X148.815 Y30.894 I.609 J.471 E.01695
G1 X148.814 Y28.179 E.09006
G1 X148.102 Y28.664 E.02858
G3 X146.136 Y29.322 I-1.487 J-1.178 E.07274
G1 X145.481 Y28.844 E.02689
G2 X143.516 Y28.187 I-1.487 J1.178 E.07274
G1 X142.86 Y28.664 E.02689
G3 X140.895 Y29.322 I-1.487 J-1.178 E.07274
G1 X140.24 Y28.844 E.02689
G2 X138.274 Y28.187 I-1.487 J1.178 E.07274
G1 X137.619 Y28.664 E.02689
G3 X135.654 Y29.322 I-1.487 J-1.178 E.07274
G3 X134.343 Y28.29 I6.475 J-9.574 E.05536
G1 X134.286 Y28.273 E.00199
G1 X134.285 Y30.799 E.08379
G1 X134.838 Y31.168 E.02204
G1 X136.286 Y31.168 E.04805
; OBJECT_ID: 4
; WIPE_START
G1 X134.838 Y31.168 E-.55038
G1 X134.379 Y30.862 E-.20962
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X133.874 Y38.477 Z1.8 F42000
G1 X129.214 Y108.791 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X129.106 Y108.791 E.00355
G1 X129.008 Y109.114 E.0112
G1 X128.465 Y108.656 E.02357
G3 X128.31 Y108.309 I.349 J-.363 E.01292
G1 X128.309 Y100.519 E.25841
G2 X125.661 Y96.491 I-9.993 J3.686 E.16131
G2 X108.291 Y103.99 I-7.061 J7.511 E.7948
G1 X108.291 Y108.402 E.14636
G1 X108.068 Y108.422 E.00743
G3 X107.909 Y106.59 I10.798 J-1.857 E.06107
G3 X107.918 Y103.578 I76.426 J-1.29 E.09989
G3 X118.901 Y93.315 I10.684 J.425 E.55297
G3 X127.982 Y98.874 I-.328 J10.732 E.36955
G1 X128.469 Y99.809 E.03496
G1 X139.819 Y99.81 E.37651
G3 X140.29 Y100.287 I-.023 J.493 E.02442
G1 X140.29 Y108.319 E.26644
G3 X139.809 Y108.789 I-.497 J-.027 E.02449
G1 X129.274 Y108.791 E.34949
M204 S10000
G1 X129.46 Y109.198 F42000
G1 F8843.478
M204 S6000
G1 X129.408 Y109.198 E.00174
G3 X128.697 Y111.206 I-13.168 J-3.532 E.07076
G1 X128.502 Y111.166 E.0066
G1 X128.502 Y109.22 E.06457
G3 X128.051 Y108.793 I1 J-1.509 E.02072
G3 X127.903 Y108.329 I.779 J-.503 E.01634
G1 X127.902 Y100.597 E.25646
G2 X108.698 Y103.994 I-9.3 J3.406 E.91648
G1 X108.698 Y111.168 E.23799
G1 X108.503 Y111.208 E.00661
G3 X107.502 Y106.593 I10.222 J-4.632 E.15782
G3 X107.511 Y103.562 I76.888 J-1.294 E.10055
G3 X118.911 Y92.908 I11.091 J.441 E.57399
G3 X128.339 Y98.679 I-.339 J11.141 E.38365
G1 X128.716 Y99.402 E.02703
G1 X139.835 Y99.403 E.36885
G3 X140.697 Y100.268 I-.042 J.904 E.04446
G1 X140.697 Y108.335 E.26758
G3 X139.829 Y109.197 I-.909 J-.048 E.04447
G1 X129.52 Y109.198 E.34196
M204 S250
G1 X129.698 Y109.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.11 Y113.044 I-11.731 J-3.301 E.11731
G1 X128.11 Y109.402 E.11192
G3 X127.511 Y108.348 I.808 J-1.156 E.03852
G1 X127.51 Y100.673 E.23582
G2 X109.09 Y103.998 I-8.909 J3.329 E.81345
G1 X109.09 Y113.044 E.27797
G3 X107.11 Y106.597 I9.53 J-6.455 E.21031
G3 X107.119 Y103.547 I77.358 J-1.298 E.09374
G3 X118.922 Y92.517 I11.483 J.457 E.55046
G3 X128.954 Y99.01 I-.327 J11.501 E.38609
G1 X139.851 Y99.011 E.33484
G3 X141.089 Y100.25 I-.061 J1.3 E.05906
G1 X141.089 Y108.35 E.24889
G3 X139.849 Y109.589 I-1.306 J-.068 E.05901
G1 X129.758 Y109.59 E.31005
M204 S10000
G1 X128.897 Y109.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.402077
G1 F10023.473
M204 S6000
G1 X128.928 Y109.313 E.00609
M204 S10000
G1 X128.897 Y109.518 F42000
; LINE_WIDTH: 0.362591
G1 F11261.609
M204 S6000
G1 X128.867 Y109.724 E.00542
; LINE_WIDTH: 0.323104
G1 F12848.728
G1 X128.836 Y109.93 E.00475
; LINE_WIDTH: 0.28069
G1 F15000
G1 X128.813 Y110.065 E.00265
; LINE_WIDTH: 0.235366
G1 X128.791 Y110.2 E.00214
; LINE_WIDTH: 0.190042
G1 X128.768 Y110.334 E.00164
; LINE_WIDTH: 0.149773
G1 X128.748 Y110.442 E.00095
; LINE_WIDTH: 0.114538
G1 X128.728 Y110.549 E.00064
; WIPE_START
G1 X128.748 Y110.442 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.673 Y108.275 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383193
G1 F10579.74
M204 S6000
G2 X128.956 Y108.428 I.206 J-.044 E.01012
G1 X139.766 Y108.427 E.29976
G1 X139.897 Y108.365 E.00401
G1 X139.927 Y108.267 E.00282
G1 X139.927 Y100.333 E.22001
G1 X139.868 Y100.205 E.00391
G1 X139.768 Y100.173 E.00291
G1 X128.796 Y100.172 E.30422
G1 X128.647 Y100.206 E.00423
G2 X128.672 Y100.479 I.541 J.089 E.00769
G1 X128.673 Y108.215 E.2145
M204 S10000
G1 X129.035 Y100.628 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.035 Y102.256 E.05401
G1 X129.341 Y102.347 E.0106
G1 X129.996 Y102.257 E.02194
G2 X131.307 Y101.225 I-6.475 J-9.574 E.05536
G3 X133.272 Y101.599 I.731 J1.51 E.0711
G1 X133.927 Y102.153 E.02846
G2 X135.893 Y101.779 I.731 J-1.51 E.07111
G1 X136.548 Y101.225 E.02846
G3 X138.514 Y101.599 I.731 J1.51 E.07111
G1 X139.169 Y102.153 E.02846
G1 X139.564 Y102.27 E.01368
G1 X139.564 Y104.932 E.0883
G1 X139.169 Y104.878 E.01324
G3 X137.858 Y103.846 I6.475 J-9.574 E.05536
G2 X135.893 Y104.22 I-.731 J1.51 E.07111
G1 X135.238 Y104.774 E.02846
G3 X133.272 Y104.4 I-.731 J-1.51 E.07111
G1 X132.617 Y103.846 E.02846
G2 X130.652 Y104.22 I-.731 J1.51 E.07111
G1 X129.996 Y104.774 E.02846
G1 X129.341 Y104.967 E.02266
G1 X129.035 Y104.925 E.01025
G1 X129.036 Y107.498 E.08533
G1 X129.341 Y107.588 E.01057
G1 X129.996 Y107.498 E.02194
G2 X131.307 Y106.467 I-6.475 J-9.575 E.05536
G3 X133.272 Y106.84 I.731 J1.51 E.07111
G1 X133.927 Y107.394 E.02846
G2 X135.893 Y107.021 I.731 J-1.51 E.07111
G1 X136.548 Y106.467 E.02846
G3 X138.514 Y106.84 I.731 J1.51 E.07111
G1 X139.169 Y107.394 E.02846
G1 X139.564 Y107.511 E.01368
G1 X139.564 Y108.064 E.01833
G1 X138.489 Y108.064 E.03568
; WIPE_START
G1 X139.564 Y108.064 E-.40877
G1 X139.564 Y107.511 E-.21
G1 X139.208 Y107.406 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.615 Y108.182 Z1.8 F42000
G1 X108.472 Y110.549 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121057
G1 F15000
M204 S6000
G1 X108.446 Y110.405 E.00093
; LINE_WIDTH: 0.169312
G1 X108.419 Y110.26 E.00151
; LINE_WIDTH: 0.216098
G1 X108.396 Y110.123 E.00197
; LINE_WIDTH: 0.261427
G1 X108.374 Y109.985 E.00249
; LINE_WIDTH: 0.306756
G1 F13644.867
G1 X108.351 Y109.847 E.003
; LINE_WIDTH: 0.349274
G1 F11751.137
G1 X108.331 Y109.71 E.00346
; LINE_WIDTH: 0.389004
G1 F10402.1
G1 X108.311 Y109.573 E.00391
; LINE_WIDTH: 0.428735
G1 F9330.906
G1 X108.292 Y109.435 E.00436
; LINE_WIDTH: 0.465668
G1 F8515.713
G1 X108.275 Y109.299 E.00473
; LINE_WIDTH: 0.499769
G1 F7880.07
G1 X108.257 Y109.163 E.00511
; LINE_WIDTH: 0.53387
G1 F7332.729
G1 X108.24 Y109.027 E.00549
; LINE_WIDTH: 0.566024
G1 F6881.995
G1 X108.197 Y108.615 E.01768
; OBJECT_ID: 5
; WIPE_START
G1 X108.24 Y109.027 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.873 Y109 Z1.8 F42000
G1 X173.978 Y108.789 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.867 Y108.789 E.00368
G1 X173.773 Y109.083 E.01023
G1 X173.265 Y108.655 E.02206
G3 X173.11 Y108.307 I.332 J-.356 E.01295
G1 X173.109 Y100.683 E.25291
G2 X152.691 Y104.189 I-9.906 J3.52 E.976
G1 X152.691 Y108.221 E.13376
G1 X152.468 Y108.241 E.00742
G3 X152.309 Y106.388 I11.04 J-1.881 E.06174
G3 X152.318 Y103.764 I65.929 J-1.09 E.08706
G3 X163.264 Y93.31 I10.894 J.449 E.55494
G3 X172.7 Y98.874 I-.066 J10.896 E.38075
G1 X173.199 Y99.808 E.03512
G1 X184.619 Y99.809 E.37882
G3 X185.09 Y100.279 I-.024 J.495 E.02421
G1 X185.09 Y108.318 E.26664
G3 X184.619 Y108.788 I-.495 J-.024 E.0242
G1 X174.038 Y108.789 E.35099
M204 S10000
G1 X174.219 Y109.196 F42000
G1 F8843.478
M204 S6000
G1 X174.164 Y109.196 E.00181
G3 X173.494 Y111.048 I-16.709 J-4.999 E.06536
G1 X173.302 Y111.006 E.00653
G1 X173.302 Y109.218 E.0593
G3 X172.85 Y108.791 I1 J-1.509 E.02073
G3 X172.703 Y108.327 I.794 J-.507 E.01633
G1 X172.702 Y100.761 E.25099
G2 X153.098 Y104.193 I-9.5 J3.441 E.93618
G1 X153.098 Y111.005 E.22597
G1 X152.904 Y111.045 E.00658
G3 X151.902 Y106.393 I10.362 J-4.665 E.15906
G3 X151.911 Y103.748 I66.385 J-1.094 E.08772
G3 X163.265 Y92.903 I11.301 J.465 E.57567
G3 X173.055 Y98.675 I-.067 J11.304 E.39501
G1 X173.443 Y99.4 E.0273
G1 X184.635 Y99.402 E.37125
G3 X185.497 Y100.263 I-.041 J.903 E.04436
G1 X185.497 Y108.334 E.26771
G3 X184.635 Y109.195 I-.903 J-.041 E.04436
G1 X174.279 Y109.196 E.34354
M204 S250
G1 X174.451 Y109.588 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X172.91 Y112.904 I-11.444 J-3.302 E.11278
G1 X172.91 Y109.401 E.10764
G3 X172.311 Y108.346 I.784 J-1.143 E.03857
G1 X172.31 Y100.836 E.23078
G2 X153.49 Y104.196 I-9.109 J3.365 E.83167
G1 X153.49 Y112.907 E.26766
G3 X151.51 Y106.396 I9.911 J-6.571 E.21207
G3 X151.519 Y103.733 I66.875 J-1.098 E.08185
G3 X163.266 Y92.511 I11.693 J.481 E.55173
G3 X173.678 Y99.008 I-.097 J11.746 E.3968
G1 X184.651 Y99.01 E.33715
G3 X185.889 Y100.248 I-.057 J1.295 E.05907
G1 X185.889 Y108.349 E.24892
G3 X184.65 Y109.587 I-1.295 J-.057 E.05908
G1 X174.511 Y109.588 E.31157
M204 S10000
G1 X173.673 Y109.514 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.360897
G1 F11321.582
M204 S6000
G1 X173.707 Y109.294 E.00578
M204 S10000
G1 X173.673 Y109.514 F42000
; LINE_WIDTH: 0.31273
G1 F13342.721
M204 S6000
G1 X173.639 Y109.735 E.0049
; LINE_WIDTH: 0.264564
G1 F15000
G1 X173.604 Y109.955 E.00403
; LINE_WIDTH: 0.216537
G1 X173.579 Y110.099 E.00208
; LINE_WIDTH: 0.16869
G1 X173.553 Y110.244 E.0015
; LINE_WIDTH: 0.120844
G1 X173.528 Y110.388 E.00093
; WIPE_START
G1 X173.553 Y110.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.473 Y108.269 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.382926
G1 F10588.062
M204 S6000
G1 X173.544 Y108.396 E.00403
G2 X173.719 Y108.427 I.111 J-.116 E.00521
G1 X184.572 Y108.425 E.3007
G1 X184.69 Y108.373 E.00357
G1 X184.727 Y108.266 E.00313
G1 X184.727 Y100.327 E.21997
G1 X184.675 Y100.209 E.00357
G1 X184.568 Y100.171 E.00314
G1 X173.53 Y100.17 E.3058
; LINE_WIDTH: 0.399835
G1 F10086.435
G1 X173.446 Y100.193 E.00254
; LINE_WIDTH: 0.419532
G1 F9558.922
G1 X173.362 Y100.215 E.00268
G1 X173.472 Y100.644 E.0136
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X173.473 Y108.209 E.20958
M204 S10000
G1 X173.835 Y100.62 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.835 Y102.248 E.05401
G1 X174.596 Y102.19 E.02534
G2 X175.907 Y101.158 I-6.475 J-9.574 E.05536
G3 X177.872 Y101.532 I.731 J1.51 E.0711
G1 X178.527 Y102.086 E.02846
G2 X180.493 Y101.712 I.731 J-1.51 E.07111
G1 X181.148 Y101.158 E.02846
G3 X183.114 Y101.532 I.731 J1.51 E.07111
G1 X183.769 Y102.086 E.02846
G1 X184.364 Y102.262 E.0206
G1 X184.364 Y104.892 E.08725
G1 X183.769 Y104.81 E.01994
G3 X182.458 Y103.779 I6.475 J-9.574 E.05536
G2 X180.493 Y104.153 I-.731 J1.51 E.07111
G1 X179.838 Y104.707 E.02846
G3 X177.872 Y104.333 I-.731 J-1.51 E.07111
G1 X177.217 Y103.779 E.02846
G2 X175.252 Y104.153 I-.731 J1.51 E.07111
G1 X174.596 Y104.707 E.02846
G1 X173.835 Y104.886 E.02594
G1 X173.836 Y107.49 E.08638
G1 X174.596 Y107.431 E.02531
G2 X175.907 Y106.4 I-6.475 J-9.575 E.05536
G3 X177.872 Y106.773 I.731 J1.51 E.07111
G1 X178.527 Y107.327 E.02846
G2 X180.493 Y106.954 I.731 J-1.51 E.07111
G1 X181.148 Y106.4 E.02846
G3 X183.114 Y106.773 I.731 J1.51 E.07111
G1 X183.769 Y107.327 E.02846
G1 X184.364 Y107.503 E.0206
G1 X184.364 Y108.063 E.01855
G1 X183.295 Y108.063 E.03547
; WIPE_START
G1 X184.364 Y108.063 E-.40629
G1 X184.364 Y107.503 E-.21247
G1 X184.008 Y107.398 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X176.41 Y108.127 Z1.8 F42000
G1 X152.872 Y110.385 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11003
G1 F15000
M204 S6000
G1 X152.857 Y110.302 E.00046
; LINE_WIDTH: 0.136237
G1 X152.841 Y110.219 E.00064
; LINE_WIDTH: 0.173609
G1 X152.817 Y110.075 E.00156
; LINE_WIDTH: 0.222149
G1 X152.793 Y109.931 E.00213
; LINE_WIDTH: 0.27069
G1 X152.768 Y109.787 E.00271
; LINE_WIDTH: 0.316154
G1 F13175.548
G1 X152.747 Y109.644 E.00322
; LINE_WIDTH: 0.358572
G1 F11404.963
G1 X152.726 Y109.501 E.00372
; LINE_WIDTH: 0.400991
G1 F10053.882
G1 X152.705 Y109.358 E.00422
; LINE_WIDTH: 0.440482
G1 F9055.204
G1 X152.686 Y109.216 E.00465
; LINE_WIDTH: 0.477033
G1 F8292.774
G1 X152.668 Y109.073 E.00508
; LINE_WIDTH: 0.513585
G1 F7648.763
G1 X152.65 Y108.931 E.00551
; LINE_WIDTH: 0.556687
G1 F7007.074
G1 X152.596 Y108.434 E.02092
; OBJECT_ID: 6
; WIPE_START
G1 X152.65 Y108.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X160.282 Y108.915 Z1.8 F42000
G1 X219.315 Y108.79 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.202 Y108.79 E.00377
G1 X219.118 Y109.037 E.00866
G1 X218.665 Y108.655 E.01966
G3 X218.51 Y108.312 I.35 J-.364 E.01278
G1 X218.509 Y100.933 E.24479
G2 X197.491 Y104.489 I-10.206 J3.571 E1.0056
G1 X197.491 Y107.948 E.11473
G1 X197.264 Y107.963 E.00755
G3 X197.109 Y106.088 I14.814 J-2.165 E.06246
G3 X197.144 Y103.613 I31.437 J-.79 E.08215
G3 X208.709 Y93.318 I11.165 J.899 E.56703
G3 X217.979 Y98.883 I-.439 J11.236 E.37417
G1 X218.492 Y99.808 E.03509
G1 X230.019 Y99.809 E.38238
G3 X230.49 Y100.289 I-.027 J.498 E.02447
G1 X230.49 Y108.318 E.26634
G1 X230.477 Y108.41 E.00309
G3 X230.009 Y108.788 I-.481 J-.116 E.02145
G1 X219.375 Y108.79 E.35276
M204 S10000
G1 X219.549 Y109.197 F42000
G1 F8843.478
M204 S6000
G1 X219.494 Y109.197 E.00185
G3 X218.898 Y110.81 I-15.235 J-4.709 E.05708
G1 X218.702 Y110.77 E.00662
G1 X218.702 Y109.219 E.05148
G3 X218.251 Y108.791 I.999 J-1.508 E.02072
G3 X218.103 Y108.33 I.796 J-.509 E.01625
G1 X218.102 Y101.009 E.24285
G2 X197.898 Y104.493 I-9.8 J3.493 E.96575
G1 X197.898 Y110.768 E.20817
G1 X197.704 Y110.809 E.00656
G3 X196.702 Y106.093 I10.647 J-4.728 E.16113
G3 X196.739 Y103.581 I31.819 J-.794 E.08336
G3 X208.723 Y92.911 I11.572 J.932 E.58764
G3 X218.331 Y98.678 I-.454 J11.645 E.38781
G1 X218.732 Y99.401 E.02741
G1 X230.035 Y99.402 E.37495
G3 X230.897 Y100.269 I-.048 J.91 E.04445
G1 X230.897 Y108.334 E.26753
G3 X230.029 Y109.195 I-.907 J-.045 E.04449
G1 X219.609 Y109.197 E.34565
M204 S250
G1 X219.775 Y109.589 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X218.31 Y112.695 I-11.649 J-3.595 E.10588
G1 X218.31 Y109.401 E.10121
G3 X217.711 Y108.347 I.808 J-1.156 E.03849
G1 X217.71 Y101.083 E.22322
G2 X198.29 Y104.497 I-9.409 J3.419 E.85903
G1 X198.29 Y112.695 E.2519
G3 X196.594 Y108.683 I10.425 J-6.771 E.13452
G3 X196.31 Y106.097 I13.295 J-2.77 E.08008
G3 X196.348 Y103.549 I32.186 J-.798 E.0783
G3 X208.736 Y92.519 I11.963 J.964 E.56271
G3 X218.963 Y99.009 I-.443 J12.001 E.39008
G1 X230.051 Y99.01 E.3407
G3 X231.289 Y100.25 I-.068 J1.306 E.059
G1 X231.289 Y108.349 E.24887
G3 X230.049 Y109.588 I-1.303 J-.065 E.05904
G1 X219.835 Y109.589 E.31384
M204 S10000
G1 X219.048 Y109.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308082
G1 F13576.639
M204 S6000
G1 X219.075 Y109.267 E.00363
M204 S10000
G1 X219.048 Y109.433 F42000
; LINE_WIDTH: 0.267058
G1 F15000
M204 S6000
G1 X219.021 Y109.598 E.00306
; LINE_WIDTH: 0.226035
G1 X218.994 Y109.764 E.0025
; LINE_WIDTH: 0.185012
G1 X218.966 Y109.93 E.00194
; LINE_WIDTH: 0.147617
G1 X218.947 Y110.035 E.00091
; LINE_WIDTH: 0.113819
G1 X218.928 Y110.14 E.00062
M204 S10000
G1 X218.757 Y110.982 F42000
; LINE_WIDTH: 0.454293
G1 F8751.199
M204 S6000
G1 X218.544 Y111.935 E.03274
; WIPE_START
G1 X218.757 Y110.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X218.873 Y108.268 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X218.942 Y108.391 E.00391
G1 X219.056 Y108.427 E.00331
G1 X229.968 Y108.426 E.30233
G1 X230.099 Y108.358 E.0041
G1 X230.127 Y108.267 E.00264
G1 X230.127 Y100.331 E.21986
G1 X230.041 Y100.192 E.00453
G1 X229.968 Y100.172 E.00211
G1 X218.834 Y100.171 E.30846
; LINE_WIDTH: 0.39832
G1 F10129.432
G1 X218.75 Y100.196 E.00255
; LINE_WIDTH: 0.419014
G1 F9572.093
G1 X218.666 Y100.221 E.0027
G1 X218.686 Y100.388 E.00515
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X218.872 Y100.894 E.01495
G1 X218.873 Y108.208 E.20262
M204 S10000
G1 X219.136 Y100.543 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.235 Y100.796 E.009
G1 X219.235 Y102.153 E.04502
G1 X219.696 Y102.09 E.01546
G1 X220.352 Y101.612 E.02689
G3 X222.317 Y100.955 I1.487 J1.178 E.07274
G1 X222.972 Y101.432 E.02689
G2 X224.938 Y102.09 I1.487 J-1.178 E.07274
G1 X225.593 Y101.612 E.02689
G3 X227.558 Y100.955 I1.487 J1.178 E.07274
G3 X228.869 Y101.986 I-6.475 J9.574 E.05536
G1 X229.524 Y102.18 E.02266
G1 X229.764 Y102.147 E.00805
G1 X229.764 Y104.729 E.08567
G1 X229.524 Y104.8 E.00832
G1 X228.869 Y104.711 E.02194
G1 X228.214 Y104.233 E.02689
G2 X226.248 Y103.575 I-1.487 J1.178 E.07274
G1 X225.593 Y104.053 E.02689
G3 X223.627 Y104.711 I-1.487 J-1.178 E.07274
G1 X222.972 Y104.233 E.02689
G2 X221.007 Y103.575 I-1.487 J1.178 E.07274
G2 X219.696 Y104.607 I6.475 J9.574 E.05536
G1 X219.235 Y104.743 E.01595
G1 X219.236 Y107.394 E.08795
G1 X219.696 Y107.331 E.01543
G1 X220.352 Y106.854 E.02689
G3 X222.317 Y106.196 I1.487 J1.178 E.07274
G1 X222.972 Y106.673 E.02689
G2 X224.938 Y107.331 I1.487 J-1.178 E.07274
G1 X225.593 Y106.854 E.02689
G3 X227.558 Y106.196 I1.487 J1.178 E.07274
G3 X228.869 Y107.227 I-6.475 J9.574 E.05536
G1 X229.524 Y107.421 E.02266
G1 X229.764 Y107.388 E.00805
G1 X229.764 Y108.063 E.02239
G1 X228.811 Y108.063 E.03163
; WIPE_START
G1 X229.764 Y108.063 E-.36231
G1 X229.764 Y107.388 E-.25645
G1 X229.524 Y107.421 E-.09222
G1 X229.4 Y107.385 E-.04902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X221.796 Y108.046 Z1.8 F42000
G1 X197.672 Y110.144 Z1.8
M73 P59 R11
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.102277
G1 F15000
M204 S6000
G1 X197.662 Y110.089 E.00027
; LINE_WIDTH: 0.126956
G1 X197.643 Y109.977 E.00078
; LINE_WIDTH: 0.165563
G1 X197.623 Y109.864 E.00114
; LINE_WIDTH: 0.20417
G1 X197.604 Y109.751 E.0015
; LINE_WIDTH: 0.242777
G1 X197.585 Y109.638 E.00186
; LINE_WIDTH: 0.284632
G1 F14893.782
G1 X197.562 Y109.488 E.00298
; LINE_WIDTH: 0.329747
G1 F12551.12
G1 X197.54 Y109.339 E.00354
; LINE_WIDTH: 0.374863
G1 F10845.259
G1 X197.517 Y109.189 E.0041
; LINE_WIDTH: 0.416799
G1 F9628.782
G1 X197.498 Y109.04 E.00457
; LINE_WIDTH: 0.455528
G1 F8725.001
G1 X197.478 Y108.892 E.00504
; LINE_WIDTH: 0.494256
G1 F7976.322
G1 X197.459 Y108.743 E.00551
; LINE_WIDTH: 0.53102
G1 F7375.539
G1 X197.427 Y108.451 E.0117
; LINE_WIDTH: 0.56582
G1 F6884.683
G1 X197.395 Y108.158 E.01253
; OBJECT_ID: 9
; WIPE_START
G1 X197.427 Y108.451 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X192.386 Y114.182 Z1.8 F42000
G1 X137.415 Y176.69 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.302 Y176.69 E.00377
G1 X137.218 Y176.937 E.00866
G1 X136.765 Y176.555 E.01966
G3 X136.61 Y176.208 I.349 J-.363 E.01292
G1 X136.609 Y168.832 E.24465
M73 P59 R10
G2 X115.591 Y172.389 I-10.204 J3.579 E1.0052
G1 X115.591 Y175.848 E.11473
G1 X115.364 Y175.864 E.00755
G3 X115.209 Y173.989 I14.827 J-2.166 E.06245
G3 X115.264 Y171.316 I27.3 J-.776 E.08871
G3 X126.809 Y161.218 I11.152 J1.101 E.56035
G3 X136.079 Y166.783 I-.411 J11.19 E.37432
G1 X136.592 Y167.708 E.03508
G1 X148.119 Y167.709 E.38237
G3 X148.59 Y168.189 I-.024 J.494 E.02453
G1 X148.59 Y176.218 E.26633
G3 X148.109 Y176.688 I-.494 J-.024 E.02453
G1 X137.475 Y176.69 E.35275
M204 S10000
G1 X137.649 Y177.097 F42000
G1 F8843.478
M204 S6000
G1 X137.594 Y177.097 E.00185
G3 X136.998 Y178.71 I-15.241 J-4.711 E.05708
G1 X136.802 Y178.67 E.00662
G1 X136.802 Y177.119 E.05147
G3 X136.351 Y176.691 I.999 J-1.507 E.02073
G3 X136.203 Y176.227 I.756 J-.495 E.01635
G1 X136.202 Y168.909 E.24277
G2 X115.998 Y172.393 I-9.799 J3.501 E.96537
G1 X115.998 Y178.668 E.20816
G1 X115.804 Y178.709 E.00656
G3 X114.802 Y173.992 I10.647 J-4.728 E.16113
G3 X114.859 Y171.276 I27.755 J-.778 E.09018
G3 X126.823 Y160.811 I11.558 J1.142 E.58068
G3 X136.432 Y166.578 I-.425 J11.597 E.38796
G1 X136.832 Y167.301 E.0274
G1 X148.135 Y167.302 E.37495
G3 X148.997 Y168.169 I-.041 J.902 E.04455
G1 X148.997 Y176.234 E.26752
G3 X148.129 Y177.095 I-.902 J-.041 E.04455
G1 X137.709 Y177.097 E.34565
M204 S250
G1 X137.875 Y177.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X136.41 Y180.595 I-11.65 J-3.595 E.10588
G1 X136.41 Y177.301 E.10121
G3 X135.811 Y176.246 I.808 J-1.156 E.03852
G1 X135.81 Y168.983 E.22319
G2 X116.39 Y172.397 I-9.408 J3.426 E.8587
G1 X116.39 Y180.595 E.2519
G3 X114.694 Y176.583 I10.015 J-6.598 E.13457
G3 X114.41 Y173.997 I13.295 J-2.77 E.08008
G3 X114.469 Y171.237 I28.209 J-.779 E.08485
G3 X126.836 Y160.419 I11.948 J1.181 E.55603
G3 X137.063 Y166.909 I-.47 J12.044 E.38993
G1 X148.151 Y166.91 E.3407
G3 X149.389 Y168.15 I-.057 J1.295 E.05912
G1 X149.389 Y176.249 E.24887
G3 X148.148 Y177.488 I-1.295 J-.057 E.05913
G1 X137.935 Y177.489 E.31384
M204 S10000
G1 X137.148 Y177.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308094
G1 F13576.028
M204 S6000
G1 X137.175 Y177.167 E.00362
M204 S10000
G1 X137.148 Y177.333 F42000
; LINE_WIDTH: 0.267101
G1 F15000
M204 S6000
G1 X137.121 Y177.498 E.00306
; LINE_WIDTH: 0.226109
G1 X137.094 Y177.664 E.0025
; LINE_WIDTH: 0.185117
G1 X137.066 Y177.829 E.00194
; LINE_WIDTH: 0.147683
G1 X137.047 Y177.935 E.00092
; LINE_WIDTH: 0.113841
G1 X137.028 Y178.04 E.00062
M204 S10000
G1 X136.857 Y178.882 F42000
; LINE_WIDTH: 0.454293
G1 F8751.186
M204 S6000
G1 X136.645 Y179.835 E.03274
; WIPE_START
G1 X136.857 Y178.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.973 Y176.162 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X137.049 Y176.308 E.00456
G1 X137.156 Y176.327 E.00301
G1 X148.068 Y176.326 E.30233
G1 X148.197 Y176.261 E.00401
G1 X148.227 Y176.167 E.00275
G1 X148.227 Y168.232 E.21983
G1 X148.17 Y168.106 E.00385
G1 X148.068 Y168.072 E.00298
G1 X136.934 Y168.071 E.30846
; LINE_WIDTH: 0.39823
G1 F10131.998
G1 X136.85 Y168.096 E.00255
; LINE_WIDTH: 0.418812
G1 F9577.225
G1 X136.766 Y168.121 E.0027
G1 X136.786 Y168.288 E.00514
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X136.972 Y168.794 E.01495
G1 X136.973 Y176.102 E.20246
M204 S10000
G1 X137.236 Y168.443 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.335 Y168.696 E.00899
G1 X137.335 Y170.053 E.04502
G1 X137.796 Y169.99 E.01546
G1 X138.452 Y169.512 E.02689
G3 X140.417 Y168.855 I1.487 J1.178 E.07274
G1 X141.072 Y169.332 E.02689
G2 X143.038 Y169.99 I1.487 J-1.178 E.07274
G1 X143.693 Y169.512 E.02689
G3 X145.658 Y168.855 I1.487 J1.178 E.07274
G3 X146.969 Y169.886 I-6.475 J9.574 E.05536
G1 X147.624 Y170.08 E.02266
G1 X147.864 Y170.047 E.00805
G1 X147.864 Y172.629 E.08567
G1 X147.624 Y172.7 E.00832
G1 X146.969 Y172.611 E.02194
G1 X146.314 Y172.133 E.02689
G2 X144.348 Y171.475 I-1.487 J1.178 E.07274
G1 X143.693 Y171.953 E.02689
G3 X141.727 Y172.611 I-1.487 J-1.178 E.07274
G1 X141.072 Y172.133 E.02689
G2 X139.107 Y171.475 I-1.487 J1.178 E.07274
G2 X137.796 Y172.507 I6.475 J9.574 E.05536
G1 X137.335 Y172.643 E.01595
G1 X137.336 Y175.294 E.08795
G1 X137.796 Y175.231 E.01543
G1 X138.452 Y174.754 E.02689
G3 X140.417 Y174.096 I1.487 J1.178 E.07274
G1 X141.072 Y174.573 E.02689
G2 X143.038 Y175.231 I1.487 J-1.178 E.07274
G1 X143.693 Y174.754 E.02689
G3 X145.658 Y174.096 I1.487 J1.178 E.07274
G3 X146.969 Y175.127 I-6.475 J9.574 E.05536
G1 X147.624 Y175.321 E.02266
G1 X147.864 Y175.288 E.00805
G1 X147.864 Y175.963 E.02239
G1 X146.911 Y175.963 E.03163
; WIPE_START
G1 X147.864 Y175.963 E-.36231
G1 X147.864 Y175.288 E-.25645
G1 X147.624 Y175.321 E-.09222
G1 X147.5 Y175.285 E-.04902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.896 Y175.946 Z1.8 F42000
G1 X115.772 Y178.044 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.102278
G1 F15000
M204 S6000
G1 X115.762 Y177.989 E.00027
; LINE_WIDTH: 0.126983
G1 X115.743 Y177.876 E.00079
; LINE_WIDTH: 0.165645
G1 X115.723 Y177.763 E.00115
; LINE_WIDTH: 0.204307
G1 X115.704 Y177.65 E.00151
; LINE_WIDTH: 0.242969
G1 X115.685 Y177.537 E.00187
; LINE_WIDTH: 0.284788
G1 F14884.205
G1 X115.662 Y177.388 E.00298
; LINE_WIDTH: 0.329785
G1 F12549.488
G1 X115.64 Y177.239 E.00353
; LINE_WIDTH: 0.374782
G1 F10847.902
G1 X115.617 Y177.09 E.00408
; LINE_WIDTH: 0.416662
G1 F9632.32
G1 X115.598 Y176.941 E.00457
; LINE_WIDTH: 0.455445
G1 F8726.743
G1 X115.578 Y176.792 E.00504
; LINE_WIDTH: 0.494229
G1 F7976.807
G1 X115.559 Y176.643 E.00552
; LINE_WIDTH: 0.53103
G1 F7375.393
G1 X115.527 Y176.351 E.0117
; LINE_WIDTH: 0.56581
G1 F6884.815
G1 X115.495 Y176.059 E.01253
; OBJECT_ID: 8
; WIPE_START
G1 X115.527 Y176.351 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X107.895 Y176.461 Z1.8 F42000
G1 X92.078 Y176.689 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.967 Y176.689 E.00368
G1 X91.873 Y176.983 E.01023
G1 X91.365 Y176.555 E.02206
G3 X91.21 Y176.207 I.349 J-.363 E.01293
G1 X91.209 Y168.583 E.25291
G2 X70.791 Y172.089 I-9.906 J3.52 E.976
G1 X70.791 Y176.121 E.13376
G1 X70.568 Y176.141 E.00741
G3 X70.409 Y174.288 I11.046 J-1.882 E.06174
G3 X70.418 Y171.664 I65.94 J-1.09 E.08706
G3 X81.364 Y161.21 I10.894 J.449 E.55494
G3 X90.8 Y166.774 I-.066 J10.896 E.38074
G1 X91.299 Y167.708 E.03513
G1 X102.709 Y167.709 E.37849
G3 X103.19 Y168.189 I-.013 J.494 E.02485
G1 X103.19 Y176.218 E.26632
G3 X102.713 Y176.688 I-.497 J-.027 E.02438
G1 X92.138 Y176.689 E.35078
M204 S10000
G1 X92.319 Y177.096 F42000
G1 F8843.478
M204 S6000
G1 X92.264 Y177.096 E.00181
G3 X91.594 Y178.948 I-16.712 J-5 E.06535
G1 X91.402 Y178.906 E.00653
G1 X91.402 Y177.118 E.0593
G3 X90.95 Y176.691 I.999 J-1.508 E.02073
G3 X90.803 Y176.227 I.757 J-.496 E.01635
G1 X90.802 Y168.661 E.25099
G2 X71.198 Y172.093 I-9.5 J3.441 E.93618
G1 X71.198 Y178.905 E.22597
G1 X71.004 Y178.945 E.00658
G3 X70.002 Y174.293 I10.659 J-4.729 E.159
G3 X70.011 Y171.648 I66.391 J-1.094 E.08773
G3 X81.365 Y160.803 I11.301 J.465 E.57566
G3 X91.155 Y166.574 I-.067 J11.304 E.39501
G1 X91.543 Y167.3 E.02731
G1 X102.729 Y167.302 E.37106
G3 X103.597 Y168.169 I-.034 J.902 E.04474
G1 X103.597 Y176.234 E.26752
G3 X102.731 Y177.095 I-.909 J-.048 E.0444
G1 X92.379 Y177.096 E.34341
M204 S250
G1 X92.551 Y177.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X91.01 Y180.804 I-12.029 J-3.575 E.11273
G1 X91.01 Y177.301 E.10764
G3 X90.411 Y176.246 I.808 J-1.156 E.03852
G1 X90.41 Y168.736 E.23078
G2 X71.59 Y172.096 I-9.109 J3.365 E.83167
G1 X71.59 Y180.807 E.26767
G3 X70.109 Y177.668 I9.802 J-6.545 E.10705
G3 X69.61 Y174.296 I11.97 J-3.493 E.10506
G3 X69.619 Y171.633 I66.874 J-1.098 E.08186
G3 X81.366 Y160.411 I11.693 J.481 E.55173
G3 X91.778 Y166.908 I-.097 J11.746 E.3968
G1 X102.749 Y166.91 E.33709
G3 X103.989 Y168.15 I-.055 J1.295 E.05919
G1 X103.989 Y176.249 E.24887
G3 X102.749 Y177.487 I-1.306 J-.068 E.05899
G1 X92.611 Y177.488 E.31153
M204 S10000
G1 X91.773 Y177.414 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.360944
G1 F11319.931
M204 S6000
G1 X91.808 Y177.194 E.00578
M204 S10000
G1 X91.773 Y177.414 F42000
; LINE_WIDTH: 0.312734
G1 F13342.53
M204 S6000
G1 X91.739 Y177.635 E.0049
; LINE_WIDTH: 0.264525
G1 F15000
G1 X91.704 Y177.855 E.00403
; LINE_WIDTH: 0.216505
G1 X91.679 Y178 E.00207
; LINE_WIDTH: 0.168671
G1 X91.653 Y178.144 E.0015
; LINE_WIDTH: 0.120837
G1 X91.628 Y178.288 E.00093
; WIPE_START
G1 X91.653 Y178.144 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.573 Y176.161 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.382926
G1 F10588.064
M204 S6000
G1 X91.649 Y176.308 E.00457
G2 X91.819 Y176.327 I.103 J-.15 E.00492
G1 X102.667 Y176.325 E.30056
G1 X102.793 Y176.269 E.00383
G1 X102.827 Y176.166 E.003
G1 X102.827 Y168.217 E.22025
G1 X102.764 Y168.103 E.0036
G1 X102.668 Y168.071 E.00281
G1 X91.63 Y168.07 E.30581
; LINE_WIDTH: 0.39983
G1 F10086.576
G1 X91.546 Y168.093 E.00254
; LINE_WIDTH: 0.41952
G1 F9559.22
G1 X91.462 Y168.115 E.00268
G1 X91.572 Y168.544 E.0136
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X91.573 Y176.101 E.20937
M204 S10000
G1 X91.935 Y168.52 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.935 Y170.148 E.05401
G1 X92.696 Y170.09 E.02534
G2 X94.007 Y169.058 I-6.475 J-9.574 E.05536
G3 X95.972 Y169.432 I.731 J1.51 E.0711
G1 X96.627 Y169.986 E.02846
G2 X98.593 Y169.612 I.731 J-1.51 E.07111
G1 X99.248 Y169.058 E.02846
G3 X101.214 Y169.432 I.731 J1.51 E.07111
G1 X101.869 Y169.986 E.02846
G1 X102.464 Y170.162 E.0206
G1 X102.464 Y172.792 E.08725
G1 X101.869 Y172.71 E.01994
G3 X100.558 Y171.679 I6.475 J-9.574 E.05536
G2 X98.593 Y172.053 I-.731 J1.51 E.07111
G1 X97.938 Y172.607 E.02846
G3 X95.972 Y172.233 I-.731 J-1.51 E.07111
G1 X95.317 Y171.679 E.02846
G2 X93.352 Y172.053 I-.731 J1.51 E.07111
G1 X92.696 Y172.607 E.02846
G1 X91.935 Y172.786 E.02594
G1 X91.936 Y175.39 E.08638
G1 X92.696 Y175.331 E.02531
G2 X94.007 Y174.3 I-6.475 J-9.575 E.05536
G3 X95.972 Y174.673 I.731 J1.51 E.07111
G1 X96.627 Y175.227 E.02846
G2 X98.593 Y174.854 I.731 J-1.51 E.07111
G1 X99.248 Y174.3 E.02846
G3 X101.214 Y174.673 I.731 J1.51 E.07111
G1 X101.869 Y175.227 E.02846
G1 X102.464 Y175.403 E.0206
G1 X102.464 Y175.963 E.01855
G1 X101.395 Y175.963 E.03547
; WIPE_START
G1 X102.464 Y175.963 E-.40629
G1 X102.464 Y175.403 E-.21247
G1 X102.108 Y175.298 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.51 Y176.027 Z1.8 F42000
G1 X70.972 Y178.285 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110055
G1 F15000
M204 S6000
G1 X70.957 Y178.202 E.00046
; LINE_WIDTH: 0.136312
G1 X70.941 Y178.119 E.00064
; LINE_WIDTH: 0.173661
G1 X70.917 Y177.975 E.00155
; LINE_WIDTH: 0.22214
G1 X70.893 Y177.831 E.00213
; LINE_WIDTH: 0.27062
G1 X70.868 Y177.687 E.00271
; LINE_WIDTH: 0.31611
G1 F13177.656
G1 X70.847 Y177.544 E.00323
; LINE_WIDTH: 0.358618
G1 F11403.309
G1 X70.826 Y177.401 E.00373
; LINE_WIDTH: 0.401126
G1 F10050.085
G1 X70.805 Y177.257 E.00423
; LINE_WIDTH: 0.440626
G1 F9051.929
G1 X70.786 Y177.115 E.00464
; LINE_WIDTH: 0.477096
G1 F8291.584
G1 X70.768 Y176.973 E.00507
; LINE_WIDTH: 0.513565
G1 F7649.076
G1 X70.75 Y176.831 E.0055
; LINE_WIDTH: 0.556657
G1 F7007.479
G1 X70.696 Y176.334 E.02093
; OBJECT_ID: 7
; WIPE_START
G1 X70.75 Y176.831 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X63.118 Y176.785 Z1.8 F42000
G1 X47.314 Y176.691 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X47.206 Y176.691 E.00355
G1 X47.108 Y177.014 E.0112
G1 X46.565 Y176.556 E.02357
G3 X46.41 Y176.209 I.341 J-.359 E.01293
G1 X46.409 Y168.419 E.25841
G2 X43.761 Y164.391 I-9.993 J3.685 E.16131
G2 X27.441 Y167.37 I-7.061 J7.509 E.63953
G2 X26.391 Y171.89 I9.27 J4.536 E.15526
G1 X26.391 Y176.302 E.14636
G1 X26.168 Y176.322 E.00743
G3 X26.009 Y174.49 I10.799 J-1.857 E.06107
G3 X26.018 Y171.478 I76.373 J-1.29 E.0999
G3 X37.001 Y161.215 I10.684 J.425 E.55296
G3 X46.082 Y166.775 I-.303 J10.692 E.3697
G1 X46.569 Y167.709 E.03494
G1 X57.919 Y167.71 E.37651
G3 X58.39 Y168.19 I-.027 J.497 E.02449
G1 X58.39 Y176.219 E.26632
G3 X57.919 Y176.689 I-.498 J-.027 E.02417
G1 X47.374 Y176.691 E.34982
M204 S10000
G1 X47.561 Y177.098 F42000
G1 F8843.478
M204 S6000
G1 X47.508 Y177.098 E.00174
G3 X46.797 Y179.106 I-15.419 J-4.329 E.07074
G1 X46.602 Y179.066 E.0066
G1 X46.602 Y177.12 E.06457
G3 X46.15 Y176.692 I.998 J-1.507 E.02073
G3 X46.003 Y176.229 I.778 J-.502 E.01633
G1 X46.002 Y168.497 E.25646
G2 X34.747 Y162.194 I-9.315 J3.434 E.46577
G2 X26.798 Y171.894 I1.976 J9.726 E.45029
G1 X26.798 Y179.068 E.23799
G1 X26.603 Y179.108 E.00661
G3 X25.602 Y174.493 I10.222 J-4.632 E.15782
G3 X25.611 Y171.462 I76.88 J-1.294 E.10055
G3 X37.011 Y160.808 I11.091 J.441 E.574
G3 X46.439 Y166.579 I-.314 J11.099 E.38381
G1 X46.816 Y167.302 E.02702
G1 X57.935 Y167.303 E.36885
G3 X58.797 Y168.17 I-.048 J.909 E.04447
G1 X58.797 Y176.235 E.26752
G3 X57.935 Y177.097 I-.91 J-.048 E.04427
G1 X47.621 Y177.098 E.34216
M204 S250
G1 X47.798 Y177.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X46.21 Y180.944 I-11.278 J-3.093 E.11735
G1 X46.21 Y177.302 E.11192
G3 X45.611 Y176.248 I.795 J-1.149 E.03854
G1 X45.61 Y168.573 E.23582
G2 X27.19 Y171.898 I-8.909 J3.329 E.81345
G1 X27.19 Y180.944 E.27798
G3 X25.21 Y174.497 I9.53 J-6.455 E.21031
G3 X25.219 Y171.447 I77.355 J-1.298 E.09374
G3 X37.022 Y160.417 I11.482 J.457 E.55046
G3 X47.054 Y166.91 I-.328 J11.502 E.38608
G1 X57.951 Y166.911 E.33484
G3 X59.189 Y168.151 I-.068 J1.306 E.05901
G1 X59.189 Y176.25 E.24887
G3 X57.95 Y177.489 I-1.306 J-.068 E.05895
G1 X47.858 Y177.49 E.3101
M204 S10000
G1 X46.997 Y177.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.402103
G1 F10022.761
M204 S6000
G1 X47.028 Y177.212 E.00609
M204 S10000
G1 X46.997 Y177.418 F42000
; LINE_WIDTH: 0.362598
G1 F11261.35
M204 S6000
G1 X46.967 Y177.624 E.00542
; LINE_WIDTH: 0.323093
G1 F12849.226
G1 X46.936 Y177.83 E.00475
; LINE_WIDTH: 0.280674
G1 F15000
G1 X46.913 Y177.965 E.00265
; LINE_WIDTH: 0.235357
G1 X46.891 Y178.1 E.00214
; LINE_WIDTH: 0.190039
G1 X46.868 Y178.234 E.00164
; LINE_WIDTH: 0.149773
G1 X46.848 Y178.342 E.00095
; LINE_WIDTH: 0.114538
G1 X46.828 Y178.449 E.00064
; WIPE_START
G1 X46.848 Y178.342 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.774 Y176.173 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383195
G1 F10579.702
M204 S6000
G2 X46.937 Y176.35 I.242 J-.059 E.00696
G1 X47.056 Y176.328 E.00335
G1 X57.872 Y176.327 E.29991
G1 X57.995 Y176.267 E.00381
G1 X58.027 Y176.167 E.00289
G1 X58.027 Y168.232 E.22004
G1 X57.942 Y168.092 E.00454
G1 X57.868 Y168.073 E.00212
G1 X46.896 Y168.072 E.30423
G1 X46.747 Y168.106 E.00423
G2 X46.772 Y168.379 I.541 J.089 E.00769
G1 X46.774 Y176.113 E.21443
M204 S10000
G1 X47.135 Y168.528 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X47.135 Y170.156 E.05401
G1 X47.441 Y170.247 E.0106
G1 X48.096 Y170.157 E.02194
G2 X49.407 Y169.125 I-6.475 J-9.574 E.05536
G3 X51.372 Y169.499 I.731 J1.51 E.0711
G1 X52.027 Y170.053 E.02846
G2 X53.993 Y169.679 I.731 J-1.51 E.07111
G1 X54.648 Y169.125 E.02846
G3 X56.614 Y169.499 I.731 J1.51 E.07111
G1 X57.269 Y170.053 E.02846
G1 X57.664 Y170.17 E.01368
G1 X57.664 Y172.832 E.0883
G1 X57.269 Y172.778 E.01324
G3 X55.958 Y171.746 I6.475 J-9.574 E.05536
G2 X53.993 Y172.12 I-.731 J1.51 E.07111
G1 X53.338 Y172.674 E.02846
G3 X51.372 Y172.3 I-.731 J-1.51 E.07111
G1 X50.717 Y171.746 E.02846
G2 X48.752 Y172.12 I-.731 J1.51 E.07111
G1 X48.096 Y172.674 E.02846
G1 X47.441 Y172.867 E.02266
G1 X47.135 Y172.825 E.01025
G1 X47.136 Y175.398 E.08533
G1 X47.441 Y175.488 E.01057
G1 X48.096 Y175.398 E.02194
G2 X49.407 Y174.367 I-6.475 J-9.575 E.05536
G3 X51.372 Y174.74 I.731 J1.51 E.07111
G1 X52.027 Y175.294 E.02846
G2 X53.993 Y174.921 I.731 J-1.51 E.07111
G1 X54.648 Y174.367 E.02846
G3 X56.614 Y174.74 I.731 J1.51 E.07111
G1 X57.269 Y175.294 E.02846
G1 X57.664 Y175.411 E.01368
G1 X57.664 Y175.964 E.01833
G1 X56.589 Y175.964 E.03568
; WIPE_START
G1 X57.664 Y175.964 E-.40877
G1 X57.664 Y175.411 E-.20999
G1 X57.308 Y175.306 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X49.715 Y176.082 Z1.8 F42000
G1 X26.572 Y178.449 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121062
G1 F15000
M204 S6000
G1 X26.546 Y178.305 E.00093
; LINE_WIDTH: 0.169328
G1 X26.519 Y178.16 E.00151
; LINE_WIDTH: 0.2161
G1 X26.496 Y178.023 E.00197
; LINE_WIDTH: 0.261396
G1 X26.474 Y177.885 E.00248
; LINE_WIDTH: 0.306692
G1 F13648.152
G1 X26.451 Y177.747 E.003
; LINE_WIDTH: 0.349234
G1 F11752.644
G1 X26.431 Y177.61 E.00346
; LINE_WIDTH: 0.389013
G1 F10401.845
G1 X26.411 Y177.473 E.00391
; LINE_WIDTH: 0.428791
G1 F9329.547
G1 X26.392 Y177.335 E.00436
; LINE_WIDTH: 0.465724
G1 F8514.588
G1 X26.374 Y177.199 E.00472
; LINE_WIDTH: 0.499811
G1 F7879.353
G1 X26.357 Y177.063 E.0051
; LINE_WIDTH: 0.533897
G1 F7332.323
G1 X26.34 Y176.927 E.00548
; LINE_WIDTH: 0.566025
G1 F6881.994
G1 X26.297 Y176.515 E.01767
; OBJECT_ID: 3
; WIPE_START
G1 X26.34 Y176.927 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X28.02 Y169.482 Z1.8 F42000
G1 X32.715 Y148.665 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X32.677 Y148.657 E.00132
G3 X26.391 Y141.01 I1.538 J-7.671 E.35552
G1 X26.391 Y106.99 E1.12848
G3 X34.19 Y99.191 I7.812 J.013 E.40622
G1 X87.71 Y99.191 E1.77533
G3 X95.509 Y106.99 I-.013 J7.812 E.40622
G1 X95.509 Y141.01 E1.12848
G3 X87.71 Y148.809 I-7.812 J-.013 E.40622
G1 X34.19 Y148.809 E1.77533
G3 X33.283 Y148.754 I.024 J-7.823 E.03019
G1 X32.775 Y148.675 E.01705
M204 S10000
G1 X32.779 Y148.264 F42000
G1 F8843.478
M204 S6000
G1 X32.756 Y148.257 E.00078
G3 X26.798 Y141.006 I1.457 J-7.271 E.3371
G1 X26.798 Y106.994 E1.12822
G3 X34.194 Y99.598 I7.405 J.009 E.38527
G1 X87.706 Y99.598 E1.77508
G3 X95.102 Y106.994 I-.009 J7.405 E.38527
G1 X95.102 Y141.006 E1.12822
G3 X87.706 Y148.402 I-7.405 J-.009 E.38527
G1 X34.194 Y148.402 E1.77508
G3 X33.33 Y148.349 I.019 J-7.416 E.02872
G1 X32.838 Y148.273 E.01652
M204 S250
G1 X32.84 Y147.877 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X32.833 Y147.873 E.00025
G3 X27.19 Y141.002 I1.38 J-6.886 E.29582
G1 X27.19 Y106.998 E1.04485
G3 X34.198 Y99.99 I7.013 J.005 E.33818
G1 X87.702 Y99.99 E1.64403
G3 X94.71 Y106.998 I-.005 J7.013 E.33818
G1 X94.71 Y141.002 E1.04485
G3 X87.702 Y148.01 I-7.013 J-.005 E.33818
G1 X34.198 Y148.01 E1.64403
G3 X33.376 Y147.96 I.015 J-7.023 E.0253
G1 X32.9 Y147.886 E.01483
; WIPE_START
M204 S6000
G1 X32.833 Y147.873 E-.02582
G1 X32.034 Y147.667 E-.31358
G1 X31.517 Y147.476 E-.20917
G1 X31.017 Y147.234 E-.21144
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.723 Y141.225 Z1.8 F42000
G1 X68.941 Y98.809 Z1.8
M73 P60 R10
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y98.809 E.62194
G3 X95.891 Y107.01 I-.006 J8.207 E.42723
G1 X95.891 Y140.99 E1.12718
G3 X87.69 Y149.191 I-8.195 J.006 E.4274
G1 X34.21 Y149.191 E1.77403
G3 X26.009 Y140.99 I-.006 J-8.195 E.4274
G1 X26.009 Y107.01 E1.12718
G3 X34.21 Y98.809 I8.195 J-.006 E.4274
G1 X52.959 Y98.809 E.62194
G1 X52.959 Y93.82 E.16551
G3 X53.48 Y93.309 I.497 J-.014 E.02715
G1 X68.444 Y93.31 E.49638
G3 X68.941 Y93.83 I.004 J.494 E.02674
G1 X68.941 Y98.749 E.16319
M204 S10000
G1 X69.348 Y98.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y98.402 E.60858
G3 X96.298 Y107.006 I-.01 J8.614 E.44816
G1 X96.298 Y140.994 E1.12745
G3 X87.694 Y149.598 I-8.602 J.002 E.44833
G1 X34.206 Y149.598 E1.7743
G3 X25.602 Y140.994 I-.002 J-8.602 E.44834
G1 X25.602 Y107.006 E1.12745
G3 X34.206 Y98.402 I8.602 J-.002 E.44834
G1 X52.552 Y98.402 E.60858
G1 X52.552 Y93.812 E.15227
G3 X53.468 Y92.902 I.906 J-.004 E.04766
G1 X68.457 Y92.903 E.49722
G3 X69.348 Y93.818 I-.009 J.9 E.0471
G1 X69.348 Y98.342 E.15008
M204 S250
G1 X69.74 Y98.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y98.01 E.5518
G3 X96.69 Y107.002 I-.015 J9.007 E.43382
G1 X96.69 Y140.998 E1.0446
G3 X87.698 Y149.99 I-8.994 J-.002 E.43398
G1 X34.202 Y149.99 E1.64378
G3 X25.21 Y140.998 I.002 J-8.994 E.43398
G1 X25.21 Y107.002 E1.0446
G3 X25.702 Y104.072 I9.05 J.013 E.0917
G3 X34.202 Y98.01 I8.502 J2.931 E.34227
G1 X52.16 Y98.01 E.5518
G1 X52.16 Y93.804 E.12923
G3 X53.456 Y92.51 I1.3 J.006 E.06245
G1 X68.47 Y92.511 E.46133
G3 X69.74 Y93.806 I-.022 J1.292 E.0618
G1 X69.74 Y97.95 E.12733
; WIPE_START
M204 S6000
G1 X71.74 Y97.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.939 Y98.469 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X64.31 Y98.469 E.05401
G1 X64.226 Y98.407 E.00346
G2 X63.059 Y98.469 I-.515 J1.323 E.03994
G1 X59.068 Y98.468 E.13239
G1 X58.985 Y98.407 E.00343
G2 X57.82 Y98.468 I-.515 J1.32 E.03987
G1 X56.192 Y98.468 E.05401
M204 S10000
G1 X63.599 Y94.035 F42000
G1 F8843.478
M204 S6000
G1 X61.971 Y94.035 E.05401
G1 X61.605 Y94.301 E.015
G3 X60.295 Y94.197 I-.54 J-1.503 E.04494
G1 X60.103 Y94.035 E.00835
G1 X56.73 Y94.035 E.1119
G1 X56.364 Y94.301 E.015
G3 X55.054 Y94.197 I-.54 J-1.503 E.04494
G1 X54.861 Y94.035 E.00835
G1 X53.686 Y94.035 E.03898
G1 X53.686 Y95.873 E.06099
G1 X54.398 Y96.444 E.0303
G2 X56.364 Y96.818 I1.234 J-1.136 E.07111
G1 X57.019 Y96.264 E.02846
G3 X58.985 Y95.89 I1.234 J1.136 E.0711
G1 X59.64 Y96.444 E.02846
G2 X61.605 Y96.818 I1.234 J-1.136 E.07111
G1 X62.26 Y96.264 E.02846
G3 X64.226 Y95.89 I1.234 J1.136 E.07111
G1 X64.881 Y96.444 E.02846
G2 X66.847 Y96.818 I1.234 J-1.136 E.07111
G3 X68.157 Y95.787 I7.785 J8.542 E.05536
G1 X68.214 Y95.779 E.00191
G1 X68.213 Y94.035 E.05784
G1 X67.212 Y94.035 E.03322
G1 X66.847 Y94.301 E.01499
G3 X65.536 Y94.197 I-.54 J-1.503 E.04494
G1 X65.344 Y94.035 E.00834
G1 X63.716 Y94.035 E.05401
M204 S10000
G1 X68.574 Y93.831 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38314
G1 F10581.392
M204 S6000
G1 X68.573 Y93.804 E.00076
G2 X68.397 Y93.672 I-.178 J.054 E.0065
G1 X53.5 Y93.672 E.41302
G1 X53.35 Y93.742 E.0046
G1 X53.324 Y93.831 E.00256
G1 X53.322 Y98.671 E.13418
G1 X53.349 Y98.803 E.00373
G1 X53.481 Y98.83 E.00373
G1 X68.419 Y98.832 E.41413
G1 X68.551 Y98.805 E.00374
G1 X68.578 Y98.673 E.00373
G1 X68.574 Y93.891 E.13255
; OBJECT_ID: 1
; WIPE_START
G1 X68.576 Y95.891 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X71.175 Y88.715 Z1.8 F42000
G1 X91.297 Y33.15 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.946 Y33.643 E.02702
G3 X94.509 Y39.19 I-4.749 J5.56 E.20913
G1 X94.509 Y73.21 E1.12848
G3 X87.21 Y80.509 I-7.312 J-.013 E.38017
G1 X33.69 Y80.509 E1.77533
G3 X26.391 Y73.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E1.12848
G3 X33.69 Y31.891 I7.312 J.013 E.38017
G1 X87.21 Y31.891 E1.77533
G3 X91.248 Y33.116 I-.013 J7.312 E.14201
M204 S10000
G1 X91.016 Y33.45 F42000
G1 F8843.478
M204 S6000
G1 X91.032 Y33.465 E.00072
G3 X94.102 Y39.194 I-3.844 J5.748 E.22447
G1 X94.102 Y73.206 E1.12822
G3 X87.206 Y80.102 I-6.905 J-.009 E.35922
G1 X33.694 Y80.102 E1.77508
G3 X26.798 Y73.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E1.12822
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X90.332 Y33.054 I-.018 J6.915 E.10766
G1 X90.964 Y33.42 E.02424
M204 S250
G1 X90.816 Y33.788 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X93.71 Y39.198 I-3.619 J5.415 E.19629
G1 X93.71 Y73.202 E1.04485
G3 X87.202 Y79.71 I-6.513 J-.005 E.31405
G1 X33.698 Y79.71 E1.64403
G3 X27.19 Y73.202 I.014 J-6.522 E.31393
G1 X27.19 Y39.198 E1.04485
G3 X33.698 Y32.69 I6.513 J.005 E.31405
G1 X87.202 Y32.69 E1.64403
G3 X90.766 Y33.755 I-.005 J6.513 E.11591
; WIPE_START
M204 S6000
G1 X91.428 Y34.25 E-.314
G1 X91.803 Y34.597 E-.19422
G1 X92.243 Y35.092 E-.25178
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.696 Y33.956 Z1.8 F42000
G1 X68.441 Y31.509 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I.006 J7.695 E.40135
G1 X94.891 Y73.19 E1.12718
G3 X87.19 Y80.891 I-7.706 J-.005 E.40119
G1 X33.71 Y80.891 E1.77404
G3 X26.009 Y73.19 I-.006 J-7.695 E.40134
G1 X26.009 Y39.21 E1.12718
G3 X33.71 Y31.509 I7.706 J.005 E.40119
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.52 E.16551
G3 X52.98 Y26.009 I.498 J-.013 E.02713
G1 X67.944 Y26.01 E.49638
G3 X68.441 Y26.53 I.004 J.494 E.02674
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I.002 J8.102 E.42228
G1 X95.298 Y73.194 E1.12745
G3 X87.194 Y81.298 I-8.113 J-.009 E.42212
G1 X33.706 Y81.298 E1.77431
G3 X25.602 Y73.194 I-.002 J-8.102 E.42228
G1 X25.602 Y39.206 E1.12745
G3 X33.706 Y31.102 I8.113 J.009 E.42212
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.512 E.15226
G3 X52.968 Y25.602 I.904 J-.005 E.04768
G1 X67.957 Y25.603 E.49722
G3 X68.848 Y26.518 I-.009 J.9 E.0471
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X95.69 Y39.202 I-.002 J8.494 E.40985
G1 X95.69 Y73.198 E1.0446
G3 X87.198 Y81.69 I-8.506 J-.014 E.4097
G1 X33.702 Y81.69 E1.64378
G3 X25.21 Y73.198 I.002 J-8.494 E.40985
G1 X25.21 Y39.202 E1.0446
G3 X33.702 Y30.71 I8.506 J.014 E.4097
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.504 E.12923
G3 X52.956 Y25.21 I1.296 J.002 E.0625
G1 X67.97 Y25.211 E.46133
M73 P61 R10
G3 X69.24 Y26.506 I-.022 J1.292 E.0618
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X67.713 Y29.066 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X67.715 Y30.694 E.05401
G1 X67.015 Y31.169 E.02803
G1 X64.967 Y31.169 E.06795
G1 X64.381 Y31.085 E.01963
G1 X63.726 Y30.607 E.02689
G2 X62.416 Y30.711 I-.54 J1.503 E.04494
G1 X61.775 Y31.168 E.02611
G1 X59.722 Y31.168 E.0681
G1 X59.14 Y31.085 E.01951
G1 X58.485 Y30.607 E.02689
G2 X57.174 Y30.711 I-.54 J1.503 E.04494
G1 X56.534 Y31.168 E.02608
G1 X54.477 Y31.168 E.06825
G1 X53.898 Y31.085 E.01938
G1 X53.185 Y30.599 E.02863
G1 X53.186 Y28.073 E.08379
G1 X53.243 Y28.09 E.00199
G2 X54.554 Y29.122 I7.785 J-8.542 E.05536
G2 X56.519 Y28.464 I.478 J-1.836 E.07274
G1 X57.174 Y27.987 E.02689
G3 X59.14 Y28.644 I.478 J1.836 E.07274
G1 X59.795 Y29.122 E.02689
G2 X61.76 Y28.464 I.478 J-1.836 E.07274
G1 X62.416 Y27.987 E.02689
G3 X64.381 Y28.644 I.478 J1.836 E.07274
G1 X65.036 Y29.122 E.02689
G2 X67.002 Y28.464 I.478 J-1.836 E.07274
G1 X67.711 Y27.979 E.02851
G1 X67.71 Y26.735 E.04127
G1 X67.326 Y26.735 E.01275
M204 S10000
G1 X67.99 Y26.4 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38314
G1 F10581.391
M204 S6000
G1 X67.897 Y26.372 E.00269
G1 X53 Y26.372 E.41302
G1 X52.85 Y26.442 E.00457
G1 X52.824 Y26.531 E.00259
G1 X52.822 Y31.371 E.13418
G1 X52.849 Y31.503 E.00373
G1 X52.981 Y31.53 E.00373
G1 X67.919 Y31.532 E.41413
G1 X68.051 Y31.504 E.00374
G1 X68.078 Y31.372 E.00374
G1 X68.073 Y26.531 E.13421
G2 X68.027 Y26.447 I-.082 J-.01 E.00283
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10581.391
G1 X68.073 Y26.531 E-.03633
G1 X68.075 Y28.436 E-.72368
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 8/15
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S153
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I-.492 J1.113 P1  F42000
G1 X175.403 Y75.825 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X175.234 Y76.272 E.01584
G3 X168.31 Y80.909 I-6.947 J-2.886 E.29298
G1 X114.79 Y80.909 E1.77533
G3 X107.291 Y73.41 I.023 J-7.523 E.39044
G1 X107.291 Y39.39 E1.12848
G3 X114.79 Y31.891 I7.512 J.013 E.39059
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.013 J7.512 E.3906
G1 X175.809 Y73.41 E1.12848
G3 X175.438 Y75.719 I-7.523 J-.023 E.07791
G1 X175.422 Y75.768 E.00173
M204 S10000
G1 X175.021 Y75.685 F42000
G1 F8843.478
M204 S6000
G1 X174.858 Y76.116 E.01531
G3 X168.306 Y80.502 I-6.571 J-2.729 E.2772
G1 X114.794 Y80.502 E1.77507
G3 X107.698 Y73.406 I.019 J-7.115 E.3695
G1 X107.698 Y39.394 E1.12822
G3 X114.794 Y32.298 I7.105 J.009 E.36964
G1 X168.306 Y32.298 E1.77507
G3 X175.402 Y39.394 I-.009 J7.105 E.36964
G1 X175.402 Y73.406 E1.12822
G3 X175.051 Y75.593 I-7.115 J-.019 E.0738
G1 X175.04 Y75.628 E.00119
M204 S250
G1 X174.645 Y75.546 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X174.496 Y75.966 E.0137
G3 X168.302 Y80.11 I-6.208 J-2.579 E.24269
G1 X114.798 Y80.11 E1.64403
G3 X108.09 Y73.402 I.015 J-6.722 E.32357
G1 X108.09 Y39.398 E1.04485
G3 X114.798 Y32.69 I6.713 J.005 E.3237
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.005 J6.713 E.3237
G1 X175.01 Y73.402 E1.04485
G3 X174.755 Y75.22 I-6.722 J-.015 E.0566
G1 X174.665 Y75.49 E.00873
; WIPE_START
M204 S6000
G1 X174.496 Y75.966 E-.19221
G1 X174.154 Y76.679 E-.30011
G1 X173.879 Y77.128 E-.20022
G1 X173.772 Y77.269 E-.06747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.2 Y70.524 Z2 F42000
G1 X149.541 Y31.509 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I.006 J7.895 E.41177
G1 X176.191 Y73.39 E1.12718
G3 X168.29 Y81.291 I-7.895 J.006 E.41177
G1 X114.81 Y81.291 E1.77403
G3 X106.909 Y73.39 I-.006 J-7.895 E.41177
G1 X106.909 Y39.41 E1.12718
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.52 E.1655
G3 X134.08 Y26.009 I.498 J-.014 E.02715
G1 X149.039 Y26.01 E.49624
G3 X149.541 Y26.53 I.008 J.494 E.02688
G1 X149.541 Y31.449 E.16319
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I.002 J8.302 E.43271
G1 X176.598 Y73.394 E1.12745
G3 X168.294 Y81.698 I-8.302 J.002 E.4327
G1 X114.806 Y81.698 E1.7743
G3 X106.502 Y73.394 I-.002 J-8.302 E.4327
G1 X106.502 Y39.406 E1.12745
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.512 E.15227
G3 X134.068 Y25.602 I.906 J-.004 E.04766
G1 X149.053 Y25.602 E.49707
G3 X149.948 Y26.518 I-.005 J.9 E.04725
G1 X149.948 Y31.042 E.15008
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.899 Y38.158 I-.001 J8.692 E.38112
G3 X176.99 Y39.402 I-11.723 J1.481 E.03836
G1 X176.99 Y73.398 E1.0446
G3 X168.298 Y82.09 I-8.694 J-.002 E.41951
G1 X114.802 Y82.09 E1.64378
G3 X106.11 Y73.398 I.002 J-8.694 E.41951
G1 X106.11 Y39.402 E1.0446
G3 X114.802 Y30.71 I8.694 J.002 E.4195
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.504 E.12923
G3 X134.056 Y25.21 I1.3 J.006 E.06245
G1 X149.065 Y25.21 E.46119
G3 X150.34 Y26.506 I-.018 J1.292 E.06195
G1 X150.34 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 8 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer8 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X146.73 Y31.727 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41583
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X149.171 Y31.087 E.1396
G1 X149.17 Y30.605 E.02664
G1 X145.667 Y31.524 E.20038
G1 X143.833 Y31.524 E.1015
G1 X149.17 Y30.124 E.30529
G1 X149.169 Y29.642 E.02664
G1 X141.999 Y31.524 E.4102
G1 X140.164 Y31.524 E.1015
G1 X149.169 Y29.161 E.51511
G1 X149.168 Y28.679 E.02664
G1 X138.33 Y31.524 E.62001
G1 X136.495 Y31.523 E.1015
G1 X149.167 Y28.198 E.72492
G1 X149.167 Y27.716 E.02664
G1 X134.661 Y31.523 E.82983
G1 X133.929 Y31.523 E.04051
G1 X133.929 Y31.234 E.01601
G1 X149.166 Y27.235 E.87168
G1 X149.166 Y26.753 E.02664
G1 X133.929 Y30.752 E.87163
G1 X133.929 Y30.27 E.02665
G1 X148.756 Y26.379 E.84818
G1 X146.921 Y26.379 E.10153
G1 X133.93 Y29.789 E.7432
G1 X133.93 Y29.307 E.02665
G1 X145.086 Y26.379 E.63823
G1 X143.251 Y26.379 E.10153
G1 X133.93 Y28.825 E.53325
G1 X133.93 Y28.344 E.02665
G1 X141.416 Y26.379 E.42827
G1 X139.582 Y26.379 E.10153
M73 P62 R10
G1 X133.93 Y27.862 E.32329
G1 X133.93 Y27.38 E.02665
G1 X137.747 Y26.379 E.21831
G1 X135.912 Y26.379 E.10153
G1 X133.931 Y26.899 E.11334
G1 X133.931 Y26.513 E.02135
G3 X133.992 Y26.401 I.16 J.015 E.00725
G1 X134.848 Y26.176 E.04901
M106 S153
; OBJECT_ID: 4
; WIPE_START
G1 X133.992 Y26.401 E-.33658
G1 X133.945 Y26.45 E-.02564
G1 X133.931 Y26.513 E-.02458
G1 X133.931 Y26.899 E-.14659
G1 X134.507 Y26.747 E-.22662
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X134.016 Y34.364 Z2 F42000
G1 X129.214 Y108.791 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X129.106 Y108.791 E.00355
G1 X129.008 Y109.114 E.0112
G1 X128.465 Y108.656 E.02357
G3 X128.31 Y108.309 I.332 J-.356 E.01295
G1 X128.309 Y100.519 E.25841
G2 X116.602 Y93.888 I-9.724 J3.518 E.48594
G2 X108.291 Y103.99 I2.001 J10.116 E.47007
G1 X108.291 Y108.402 E.14636
G1 X108.068 Y108.422 E.00743
G3 X107.909 Y106.59 I10.798 J-1.857 E.06107
G3 X107.918 Y103.578 I76.426 J-1.29 E.09989
G3 X118.947 Y93.317 I10.684 J.425 E.5545
G3 X127.982 Y98.874 I-.375 J10.732 E.36802
G1 X128.469 Y99.809 E.03495
G1 X139.819 Y99.81 E.37651
G3 X140.29 Y100.291 I-.027 J.497 E.0245
G1 X140.29 Y108.319 E.26631
G3 X139.809 Y108.789 I-.497 J-.027 E.0245
G1 X129.274 Y108.791 E.34949
M204 S10000
G1 X129.46 Y109.198 F42000
G1 F8843.478
M204 S6000
G1 X129.408 Y109.198 E.00174
G3 X128.697 Y111.206 I-12.833 J-3.413 E.07076
G1 X128.502 Y111.166 E.0066
G1 X128.502 Y109.22 E.06457
G3 X128.051 Y108.793 I.999 J-1.508 E.02072
G3 X127.903 Y108.329 I.794 J-.508 E.01633
G1 X127.902 Y100.597 E.25646
G2 X116.683 Y94.287 I-9.304 J3.412 E.46474
G2 X108.698 Y103.994 I1.919 J9.717 E.4517
G1 X108.698 Y111.168 E.23799
G1 X108.503 Y111.208 E.00661
G3 X107.502 Y106.593 I10.222 J-4.632 E.15782
G3 X107.511 Y103.562 I76.888 J-1.294 E.10055
G3 X118.958 Y92.91 I11.091 J.441 E.57553
G3 X128.339 Y98.679 I-.386 J11.141 E.38213
G1 X128.716 Y99.402 E.02703
G1 X139.835 Y99.403 E.36885
G3 X140.697 Y100.271 I-.048 J.909 E.04448
G1 X140.697 Y108.335 E.2675
G3 X139.829 Y109.197 I-.909 J-.047 E.04447
G1 X129.52 Y109.198 E.34196
M204 S250
G1 X129.698 Y109.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.11 Y113.044 I-11.731 J-3.301 E.11731
G1 X128.11 Y109.402 E.11192
G3 X127.511 Y108.348 I.784 J-1.143 E.03857
G1 X127.51 Y100.673 E.23582
G2 X109.09 Y103.998 I-8.909 J3.329 E.81346
G1 X109.09 Y113.044 E.27798
G3 X107.11 Y106.597 I9.53 J-6.455 E.21031
G3 X107.119 Y103.547 I77.358 J-1.298 E.09374
G3 X118.968 Y92.518 I11.483 J.457 E.55188
G3 X128.954 Y99.01 I-.374 J11.501 E.38467
G1 X139.85 Y99.011 E.33483
G3 X141.089 Y100.251 I-.068 J1.306 E.05902
G1 X141.089 Y108.35 E.24885
G3 X139.849 Y109.589 I-1.306 J-.068 E.05902
G1 X129.758 Y109.59 E.31005
M204 S10000
G1 X128.897 Y109.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362604
G1 F11261.136
M204 S6000
G1 X128.867 Y109.724 E.00542
; LINE_WIDTH: 0.323122
G1 F12847.911
G1 X128.836 Y109.93 E.00475
; LINE_WIDTH: 0.280704
G1 F15000
G1 X128.813 Y110.065 E.00265
; LINE_WIDTH: 0.235318
G1 X128.79 Y110.2 E.00215
; LINE_WIDTH: 0.189933
G1 X128.768 Y110.335 E.00164
; LINE_WIDTH: 0.149664
G1 X128.748 Y110.442 E.00095
; LINE_WIDTH: 0.114502
G1 X128.728 Y110.549 E.00064
M204 S10000
G1 X128.897 Y109.518 F42000
; LINE_WIDTH: 0.402086
G1 F10023.223
M204 S6000
G1 X128.928 Y109.312 E.00609
; WIPE_START
G1 X128.897 Y109.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.498 Y101.896 Z2 F42000
G1 X128.476 Y101.49 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40752
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X129.107 Y100.179 E.0773
G1 X129.615 Y100.179 E.02698
G1 X128.679 Y102.124 E.11469
G1 X128.679 Y103.178 E.05604
G1 X130.123 Y100.179 E.17688
G1 X130.631 Y100.179 E.02698
G1 X128.679 Y104.233 E.23908
G1 X128.68 Y105.287 E.05604
G1 X131.138 Y100.179 E.30128
G1 X131.646 Y100.179 E.02698
G1 X128.68 Y106.342 E.36347
G1 X128.68 Y107.397 E.05604
G1 X132.154 Y100.179 E.42567
G1 X132.662 Y100.179 E.02698
G1 X128.716 Y108.376 E.48345
G1 X128.768 Y108.421 E.00365
G1 X129.202 Y108.421 E.02307
G1 X133.169 Y100.179 E.48608
G1 X133.677 Y100.179 E.02698
G1 X129.71 Y108.421 E.48608
G1 X130.218 Y108.421 E.02699
G1 X134.185 Y100.179 E.48607
G1 X134.693 Y100.179 E.02698
G1 X130.726 Y108.421 E.48607
G1 X131.233 Y108.421 E.02699
G1 X135.2 Y100.179 E.48606
G1 X135.708 Y100.179 E.02698
G1 X131.741 Y108.421 E.48606
G1 X132.249 Y108.421 E.02699
G1 X136.216 Y100.18 E.48605
G1 X136.723 Y100.18 E.02698
G1 X132.757 Y108.421 E.48605
G1 X133.265 Y108.421 E.02699
G1 X137.231 Y100.18 E.48604
G1 X137.739 Y100.18 E.02698
G1 X133.772 Y108.42 E.48603
G1 X134.28 Y108.42 E.02699
G1 X138.247 Y100.18 E.48603
G1 X138.754 Y100.18 E.02698
G1 X134.788 Y108.42 E.48602
G1 X135.296 Y108.42 E.02699
G1 X139.262 Y100.18 E.48602
G1 X139.77 Y100.18 E.02698
G1 X135.804 Y108.42 E.48601
G1 X136.311 Y108.42 E.02699
G1 X139.92 Y100.923 E.44218
G1 X139.92 Y101.978 E.05606
G1 X136.819 Y108.42 E.37996
G1 X137.327 Y108.42 E.02699
G1 X139.92 Y103.033 E.31774
G1 X139.92 Y104.088 E.05606
G1 X137.835 Y108.42 E.25552
G1 X138.342 Y108.42 E.02699
G1 X139.92 Y105.143 E.1933
G1 X139.92 Y106.197 E.05606
G1 X138.85 Y108.42 E.13108
G1 X139.358 Y108.42 E.02699
G1 X139.92 Y107.252 E.06885
G1 X139.92 Y108.29 E.05513
G1 X139.768 Y108.622 E.01942
M106 S153
; WIPE_START
G1 X139.92 Y108.29 E-.13889
G1 X139.92 Y107.252 E-.39419
G1 X139.661 Y107.79 E-.22692
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.058 Y108.463 Z2 F42000
G1 X108.472 Y110.549 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121057
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X108.446 Y110.405 E.00093
; LINE_WIDTH: 0.169312
G1 X108.419 Y110.26 E.00151
; LINE_WIDTH: 0.216098
G1 X108.396 Y110.123 E.00197
; LINE_WIDTH: 0.261427
G1 X108.374 Y109.985 E.00249
; LINE_WIDTH: 0.306756
G1 F13644.867
G1 X108.351 Y109.847 E.003
; LINE_WIDTH: 0.349274
G1 F11751.137
G1 X108.331 Y109.71 E.00346
; LINE_WIDTH: 0.389004
G1 F10402.1
G1 X108.311 Y109.573 E.00391
; LINE_WIDTH: 0.428735
G1 F9330.906
G1 X108.292 Y109.435 E.00436
; LINE_WIDTH: 0.465668
G1 F8515.713
M73 P62 R9
G1 X108.275 Y109.299 E.00473
; LINE_WIDTH: 0.499769
G1 F7880.07
G1 X108.257 Y109.163 E.00511
; LINE_WIDTH: 0.53387
G1 F7332.729
G1 X108.24 Y109.027 E.00549
; LINE_WIDTH: 0.566024
G1 F6881.995
G1 X108.197 Y108.615 E.01768
; OBJECT_ID: 5
; WIPE_START
G1 X108.24 Y109.027 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.873 Y109 Z2 F42000
G1 X173.978 Y108.789 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.867 Y108.789 E.00368
G1 X173.773 Y109.083 E.01023
G1 X173.265 Y108.655 E.02206
G3 X173.11 Y108.307 I.35 J-.363 E.01292
G1 X173.109 Y100.683 E.25291
G2 X159.97 Y94.2 I-9.92 J3.548 E.53744
G2 X152.691 Y104.189 I3.26 J10.022 E.43811
G1 X152.691 Y108.221 E.13376
G1 X152.468 Y108.241 E.00742
G3 X152.309 Y106.388 I11.04 J-1.881 E.06174
G3 X152.318 Y103.764 I65.934 J-1.09 E.08706
G1 X152.335 Y103.477 E.00955
G3 X163.311 Y93.31 I10.865 J.722 E.54709
G3 X172.7 Y98.874 I-.139 J10.939 E.37902
G1 X173.199 Y99.808 E.03513
G1 X184.619 Y99.809 E.37881
G3 X185.09 Y100.289 I-.02 J.49 E.02458
G1 X185.09 Y108.308 E.26598
G3 X184.612 Y108.788 I-.494 J-.013 E.02477
G1 X174.038 Y108.789 E.35075
M204 S10000
G1 X174.219 Y109.196 F42000
G1 F8843.478
M204 S6000
G1 X174.164 Y109.196 E.00181
G3 X173.494 Y111.048 I-16.709 J-4.999 E.06536
G1 X173.302 Y111.006 E.00653
G1 X173.302 Y109.218 E.0593
G3 X172.85 Y108.791 I.999 J-1.507 E.02073
G3 X172.703 Y108.327 I.795 J-.508 E.01632
G1 X172.702 Y100.761 E.25099
G2 X153.098 Y104.193 I-9.5 J3.444 E.93603
G1 X153.098 Y111.005 E.22597
G1 X152.904 Y111.045 E.00658
G3 X151.902 Y106.393 I10.362 J-4.665 E.15906
G3 X151.911 Y103.748 I66.39 J-1.094 E.08773
G1 X151.929 Y103.453 E.00983
G3 X163.312 Y92.903 I11.272 J.747 E.56754
G3 X173.055 Y98.675 I-.141 J11.347 E.39328
G1 X173.443 Y99.4 E.0273
G1 X184.635 Y99.402 E.37125
G3 X185.497 Y100.269 I-.037 J.898 E.04461
G1 X185.497 Y108.328 E.26731
G3 X184.631 Y109.195 I-.902 J-.034 E.0447
G1 X174.279 Y109.196 E.34339
M204 S250
G1 X174.451 Y109.588 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X172.91 Y112.904 I-12.028 J-3.574 E.11273
G1 X172.91 Y109.401 E.10764
G3 X172.311 Y108.346 I.808 J-1.156 E.03852
G1 X172.31 Y100.836 E.23078
G2 X153.49 Y104.196 I-9.109 J3.368 E.83153
G1 X153.49 Y112.907 E.26766
G3 X151.51 Y106.396 I9.911 J-6.571 E.21207
G3 X151.519 Y103.733 I66.877 J-1.098 E.08186
G1 X151.537 Y103.429 E.00935
G3 X163.314 Y92.511 I11.663 J.77 E.54396
G3 X173.678 Y99.008 I-.12 J11.707 E.39549
G1 X184.65 Y99.01 E.33714
G3 X185.889 Y100.25 I-.053 J1.291 E.05918
G1 X185.889 Y108.347 E.24879
G3 X184.649 Y109.587 I-1.295 J-.055 E.05919
G1 X174.511 Y109.588 E.31152
M204 S10000
G1 X173.673 Y109.514 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.360912
G1 F11321.06
M204 S6000
G1 X173.707 Y109.294 E.00578
M204 S10000
G1 X173.673 Y109.514 F42000
; LINE_WIDTH: 0.312739
G1 F13342.284
M204 S6000
G1 X173.639 Y109.735 E.0049
; LINE_WIDTH: 0.264567
G1 F15000
G1 X173.604 Y109.955 E.00403
; LINE_WIDTH: 0.216537
G1 X173.579 Y110.099 E.00208
; LINE_WIDTH: 0.16869
G1 X173.553 Y110.244 E.0015
; LINE_WIDTH: 0.120844
G1 X173.528 Y110.388 E.00093
; WIPE_START
G1 X173.553 Y110.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X176.037 Y108.622 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42264
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X184.612 Y108.407 E.49026
G2 X184.72 Y108.277 I-.003 J-.112 E.01092
G1 X184.72 Y107.931 E.01978
G1 X173.48 Y108.213 E.64268
G1 X173.48 Y107.741 E.02702
G1 X184.72 Y107.458 E.64268
G1 X184.72 Y106.985 E.02702
G1 X173.48 Y107.268 E.64269
G1 X173.48 Y106.795 E.02702
M73 P63 R9
G1 X184.72 Y106.513 E.64269
G1 X184.72 Y106.04 E.02702
G1 X173.48 Y106.322 E.6427
G1 X173.48 Y105.849 E.02702
G1 X184.72 Y105.567 E.6427
G1 X184.72 Y105.094 E.02702
G1 X173.48 Y105.377 E.64271
G1 X173.479 Y104.904 E.02702
G1 X184.72 Y104.621 E.64271
G1 X184.72 Y104.149 E.02702
G1 X173.479 Y104.431 E.64271
G1 X173.479 Y103.958 E.02702
G1 X184.72 Y103.676 E.64272
G1 X184.72 Y103.203 E.02702
G1 X173.479 Y103.485 E.64272
G1 X173.479 Y103.013 E.02702
G1 X184.72 Y102.73 E.64273
G1 X184.72 Y102.258 E.02702
G1 X173.479 Y102.54 E.64273
G1 X173.479 Y102.067 E.02702
G1 X184.72 Y101.785 E.64273
G1 X184.72 Y101.312 E.02702
G1 X173.479 Y101.594 E.64274
G1 X173.479 Y101.122 E.02702
G1 X184.72 Y100.839 E.64274
G1 X184.72 Y100.366 E.02702
G1 X173.479 Y100.649 E.64275
G1 X173.479 Y100.613 E.00207
G1 X173.308 Y100.18 E.02658
G1 X181.455 Y99.976 E.46585
M106 S153
; WIPE_START
G1 X179.456 Y100.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X172.172 Y102.306 Z2 F42000
G1 X152.596 Y108.434 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556687
; LAYER_HEIGHT: 0.2
G1 F7007.074
M204 S6000
G1 X152.65 Y108.931 E.02092
; LINE_WIDTH: 0.513585
G1 F7648.763
G1 X152.668 Y109.073 E.00551
; LINE_WIDTH: 0.477033
G1 F8292.774
G1 X152.686 Y109.216 E.00508
; LINE_WIDTH: 0.440482
G1 F9055.204
G1 X152.705 Y109.358 E.00465
; LINE_WIDTH: 0.400991
G1 F10053.882
G1 X152.726 Y109.501 E.00422
; LINE_WIDTH: 0.358572
G1 F11404.963
G1 X152.747 Y109.644 E.00372
; LINE_WIDTH: 0.316154
G1 F13175.548
G1 X152.768 Y109.787 E.00322
; LINE_WIDTH: 0.27069
G1 F15000
G1 X152.793 Y109.931 E.00271
; LINE_WIDTH: 0.222149
G1 X152.817 Y110.075 E.00213
; LINE_WIDTH: 0.173609
G1 X152.841 Y110.219 E.00156
; LINE_WIDTH: 0.136237
G1 X152.857 Y110.302 E.00064
; LINE_WIDTH: 0.11003
G1 X152.872 Y110.385 E.00046
; OBJECT_ID: 6
; WIPE_START
G1 X152.857 Y110.302 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X160.487 Y110.128 Z2 F42000
G1 X219.315 Y108.79 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.202 Y108.79 E.00377
G1 X219.118 Y109.037 E.00865
G1 X218.665 Y108.655 E.01966
G3 X218.51 Y108.308 I.332 J-.356 E.01295
G1 X218.509 Y100.933 E.24465
G2 X197.491 Y104.489 I-10.204 J3.578 E1.00521
G1 X197.491 Y107.948 E.11473
G1 X197.264 Y107.964 E.00755
G3 X197.109 Y106.088 I14.816 J-2.165 E.06246
G3 X197.144 Y103.613 I31.437 J-.79 E.08215
G3 X208.757 Y93.319 I11.173 J.908 E.56853
G3 X217.979 Y98.882 I-.46 J11.189 E.37271
G1 X218.492 Y99.808 E.03509
G1 X230.11 Y99.821 E.3854
G3 X230.49 Y100.289 I-.117 J.483 E.02148
G1 X230.49 Y108.318 E.26633
G1 X230.477 Y108.411 E.0031
G3 X230.009 Y108.788 I-.482 J-.119 E.02143
G1 X219.375 Y108.79 E.35275
M204 S10000
G1 X219.549 Y109.197 F42000
G1 F8843.478
M204 S6000
G1 X219.494 Y109.197 E.00185
G3 X218.898 Y110.81 I-15.238 J-4.71 E.05708
G1 X218.702 Y110.77 E.00662
G1 X218.702 Y109.219 E.05148
G3 X218.25 Y108.791 I.998 J-1.507 E.02073
G3 X218.103 Y108.327 I.795 J-.508 E.01633
G1 X218.102 Y101.009 E.24277
G2 X197.898 Y104.493 I-9.8 J3.493 E.96575
G1 X197.898 Y110.768 E.20817
G1 X197.704 Y110.809 E.00656
G3 X196.702 Y106.093 I10.647 J-4.728 E.16113
G3 X196.739 Y103.581 I31.819 J-.794 E.08336
G3 X208.771 Y92.913 I11.58 J.941 E.58914
G3 X218.331 Y98.678 I-.474 J11.596 E.38636
G1 X218.732 Y99.401 E.0274
G1 X230.035 Y99.402 E.37495
G3 X230.897 Y100.269 I-.048 J.909 E.04446
G1 X230.897 Y108.334 E.26752
G3 X230.029 Y109.195 I-.909 J-.048 E.04447
G1 X219.609 Y109.197 E.34565
M204 S250
G1 X219.775 Y109.589 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X218.31 Y112.695 I-11.662 J-3.601 E.10588
G1 X218.31 Y109.401 E.10121
G3 X217.711 Y108.347 I.784 J-1.142 E.03857
G1 X217.71 Y101.083 E.22319
G2 X198.29 Y104.497 I-9.409 J3.419 E.85903
G1 X198.29 Y112.695 E.2519
G3 X196.31 Y106.097 I10.037 J-6.608 E.21468
G3 X196.348 Y103.549 I32.186 J-.798 E.0783
G3 X197.179 Y100.024 I12.701 J1.133 E.11169
G3 X208.784 Y92.521 I11.143 J4.509 E.45239
G3 X218.963 Y99.009 I-.52 J12.043 E.38845
G1 X230.05 Y99.01 E.34069
G3 X231.289 Y100.25 I-.068 J1.306 E.05901
G1 X231.289 Y108.349 E.24887
G3 X230.049 Y109.588 I-1.306 J-.068 E.05901
G1 X219.835 Y109.589 E.31384
M204 S10000
G1 X219.048 Y109.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.267136
G1 F15000
M204 S6000
G1 X219.021 Y109.598 E.00306
; LINE_WIDTH: 0.226138
G1 X218.994 Y109.764 E.0025
; LINE_WIDTH: 0.18514
G1 X218.966 Y109.929 E.00194
; LINE_WIDTH: 0.147697
G1 X218.947 Y110.035 E.00092
; LINE_WIDTH: 0.113846
G1 X218.928 Y110.14 E.00062
M204 S10000
G1 X219.048 Y109.433 F42000
; LINE_WIDTH: 0.308135
G1 F13573.93
M204 S6000
G1 X219.075 Y109.267 E.00362
; WIPE_START
G1 X219.048 Y109.433 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X218.757 Y110.982 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.454245
G1 F8752.21
M204 S6000
G1 X218.546 Y111.936 E.03274
; WIPE_START
G1 X218.757 Y110.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X218.677 Y107.072 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41011
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X218.899 Y108.354 E.07002
G2 X219.098 Y108.42 I.143 J-.097 E.01211
G1 X219.378 Y108.42 E.01506
G1 X218.88 Y105.542 E.15719
G1 X218.879 Y102.841 E.14537
G1 X219.844 Y108.42 E.30472
G1 X220.311 Y108.42 E.02513
G1 X218.885 Y100.178 E.4502
G1 X219.352 Y100.178 E.02513
G1 X220.778 Y108.42 E.45019
G1 X221.245 Y108.42 E.02513
G1 X219.819 Y100.178 E.45019
G1 X220.286 Y100.178 E.02513
G1 X221.712 Y108.42 E.45018
G1 X222.179 Y108.42 E.02513
G1 X220.753 Y100.178 E.45017
G1 X221.22 Y100.178 E.02513
G1 X222.646 Y108.42 E.45017
G1 X223.113 Y108.419 E.02513
G1 X221.687 Y100.178 E.45016
G1 X222.154 Y100.178 E.02513
G1 X223.58 Y108.419 E.45016
G1 X224.047 Y108.419 E.02513
G1 X222.621 Y100.178 E.45015
G1 X223.088 Y100.178 E.02513
G1 X224.514 Y108.419 E.45015
G1 X224.981 Y108.419 E.02513
G1 X223.555 Y100.178 E.45014
G1 X224.022 Y100.178 E.02513
G1 X225.448 Y108.419 E.45014
G1 X225.915 Y108.419 E.02513
G1 X224.489 Y100.178 E.45013
G1 X224.956 Y100.178 E.02513
G1 X226.382 Y108.419 E.45012
G1 X226.849 Y108.419 E.02513
G1 X225.423 Y100.178 E.45012
G1 X225.89 Y100.178 E.02513
G1 X227.316 Y108.419 E.45011
G1 X227.782 Y108.419 E.02513
G1 X226.356 Y100.178 E.45011
G1 X226.823 Y100.178 E.02513
G1 X228.249 Y108.419 E.4501
G1 X228.716 Y108.419 E.02513
G1 X227.29 Y100.178 E.4501
G1 X227.757 Y100.178 E.02513
G1 X229.183 Y108.419 E.45009
G1 X229.65 Y108.419 E.02513
G1 X228.224 Y100.179 E.45009
G1 X228.691 Y100.179 E.02513
G1 X230.105 Y108.346 E.44614
G2 X230.12 Y108.285 I-.097 J-.057 E.00346
G1 X230.12 Y105.737 E.13716
G1 X229.158 Y100.179 E.30358
G1 X229.625 Y100.179 E.02513
G1 X230.12 Y103.038 E.15619
G1 X230.12 Y100.34 E.14523
G1 X230.059 Y99.986 E.01933
M106 S153
; WIPE_START
G1 X230.12 Y100.34 E-.13645
G1 X230.12 Y101.981 E-.62355
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X222.62 Y103.397 Z2 F42000
G1 X197.395 Y108.158 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565815
; LAYER_HEIGHT: 0.2
G1 F6884.751
M204 S6000
G1 X197.427 Y108.451 E.01253
; LINE_WIDTH: 0.531044
G1 F7375.173
G1 X197.459 Y108.743 E.0117
; LINE_WIDTH: 0.494279
G1 F7975.919
G1 X197.478 Y108.892 E.00552
; LINE_WIDTH: 0.455516
G1 F8725.244
G1 X197.498 Y109.04 E.00504
; LINE_WIDTH: 0.416754
G1 F9629.964
G1 X197.517 Y109.189 E.00457
; LINE_WIDTH: 0.374831
G1 F10846.307
G1 X197.54 Y109.339 E.00409
; LINE_WIDTH: 0.329771
G1 F12550.086
G1 X197.562 Y109.488 E.00353
; LINE_WIDTH: 0.284711
G1 F14888.89
G1 X197.585 Y109.638 E.00298
; LINE_WIDTH: 0.242893
G1 F15000
G1 X197.604 Y109.751 E.00187
; LINE_WIDTH: 0.204278
G1 X197.623 Y109.863 E.00151
; LINE_WIDTH: 0.165663
G1 X197.643 Y109.976 E.00114
; LINE_WIDTH: 0.127048
G1 X197.662 Y110.089 E.00078
; LINE_WIDTH: 0.102329
G1 X197.672 Y110.144 E.00027
; OBJECT_ID: 9
; WIPE_START
G1 X197.662 Y110.089 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X192.542 Y115.749 Z2 F42000
G1 X137.415 Y176.69 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.302 Y176.69 E.00377
G1 X137.218 Y176.937 E.00866
G1 X136.765 Y176.555 E.01966
G3 X136.61 Y176.208 I.349 J-.363 E.01292
G1 X136.609 Y168.832 E.24465
G2 X115.591 Y172.389 I-10.206 J3.571 E1.00559
G1 X115.591 Y175.848 E.11473
G1 X115.364 Y175.864 E.00755
G3 X115.209 Y173.989 I14.825 J-2.166 E.06245
G3 X115.259 Y171.364 I28.786 J-.763 E.08711
G3 X126.857 Y161.219 I11.148 J1.043 E.56369
G3 X136.079 Y166.783 I-.46 J11.189 E.37272
G1 X136.592 Y167.708 E.03508
G1 X148.158 Y167.712 E.38366
G3 X148.59 Y168.189 I-.072 J.5 E.02315
G1 X148.587 Y176.256 E.2676
G3 X148.109 Y176.688 I-.499 J-.072 E.02317
G1 X137.475 Y176.69 E.35275
M204 S10000
G1 X137.649 Y177.097 F42000
G1 F8843.478
M204 S6000
G1 X137.594 Y177.097 E.00185
G3 X136.998 Y178.71 I-15.242 J-4.712 E.05708
G1 X136.802 Y178.67 E.00662
G1 X136.802 Y177.119 E.05147
G3 X136.35 Y176.691 I.998 J-1.506 E.02073
G3 X136.203 Y176.227 I.756 J-.495 E.01634
G1 X136.202 Y168.909 E.24277
G2 X115.998 Y172.393 I-9.8 J3.493 E.96574
G1 X115.998 Y178.668 E.20816
G1 X115.804 Y178.709 E.00656
G3 X114.802 Y173.992 I10.646 J-4.727 E.16113
G3 X114.854 Y171.324 I29.189 J-.765 E.08857
G3 X126.871 Y160.812 I11.553 J1.083 E.58403
G3 X136.432 Y166.578 I-.474 J11.596 E.38636
G1 X136.832 Y167.301 E.0274
G1 X148.135 Y167.302 E.37495
G3 X148.997 Y168.169 I-.041 J.902 E.04454
G1 X148.997 Y176.234 E.26752
G3 X148.129 Y177.095 I-.902 J-.041 E.04455
G1 X137.709 Y177.097 E.34564
M204 S250
G1 X137.875 Y177.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X136.41 Y180.595 I-11.664 J-3.602 E.10588
G1 X136.41 Y177.301 E.10121
G3 X135.811 Y176.247 I.808 J-1.156 E.03852
G1 X135.81 Y168.983 E.22319
G2 X116.39 Y172.397 I-9.409 J3.419 E.85902
G1 X116.39 Y180.595 E.2519
G3 X114.41 Y173.997 I10.037 J-6.608 E.21468
G3 X114.464 Y171.285 I29.602 J-.766 E.08336
G3 X126.884 Y160.421 I11.944 J1.122 E.55913
G3 X137.063 Y166.909 I-.52 J12.043 E.38845
G1 X148.151 Y166.91 E.3407
G3 X149.389 Y168.15 I-.057 J1.295 E.05912
G1 X149.389 Y176.249 E.24887
G3 X148.148 Y177.488 I-1.295 J-.057 E.05913
G1 X137.935 Y177.489 E.31384
M204 S10000
G1 X137.148 Y177.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.267148
G1 F15000
M204 S6000
G1 X137.121 Y177.498 E.00306
; LINE_WIDTH: 0.226169
G1 X137.094 Y177.664 E.0025
; LINE_WIDTH: 0.18519
G1 X137.067 Y177.829 E.00194
; LINE_WIDTH: 0.147759
G1 X137.047 Y177.935 E.00092
; LINE_WIDTH: 0.113867
G1 X137.028 Y178.04 E.00062
M204 S10000
G1 X137.148 Y177.333 F42000
; LINE_WIDTH: 0.308127
G1 F13574.312
M204 S6000
G1 X137.175 Y177.167 E.00362
; WIPE_START
G1 X137.148 Y177.333 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.857 Y178.882 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.454245
M73 P64 R9
G1 F8752.207
M204 S6000
G1 X136.646 Y179.836 E.03274
; WIPE_START
G1 X136.857 Y178.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.777 Y174.975 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41013
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X136.997 Y176.243 E.06927
G2 X137.068 Y176.32 I.144 J-.061 E.00577
G1 X137.477 Y176.32 E.02203
G1 X136.98 Y173.445 E.15706
G1 X136.979 Y170.744 E.14538
G1 X137.944 Y176.32 E.3046
G1 X138.411 Y176.32 E.02513
G1 X136.985 Y168.078 E.45024
G1 X137.452 Y168.078 E.02514
G1 X138.878 Y176.32 E.45023
G1 X139.345 Y176.32 E.02513
G1 X137.919 Y168.078 E.45023
G1 X138.386 Y168.078 E.02514
G1 X139.812 Y176.32 E.45022
G1 X140.279 Y176.32 E.02513
G1 X138.853 Y168.078 E.45022
G1 X139.32 Y168.078 E.02514
G1 X140.746 Y176.32 E.45021
G1 X141.213 Y176.319 E.02513
G1 X139.787 Y168.078 E.45021
G1 X140.254 Y168.078 E.02514
G1 X141.68 Y176.319 E.4502
G1 X142.147 Y176.319 E.02513
G1 X140.721 Y168.078 E.4502
G1 X141.188 Y168.078 E.02514
G1 X142.614 Y176.319 E.45019
G1 X143.081 Y176.319 E.02513
G1 X141.654 Y168.078 E.45018
G1 X142.121 Y168.078 E.02514
G1 X143.548 Y176.319 E.45018
G1 X144.014 Y176.319 E.02513
G1 X142.588 Y168.078 E.45017
G1 X143.055 Y168.078 E.02514
G1 X144.481 Y176.319 E.45017
G1 X144.948 Y176.319 E.02513
G1 X143.522 Y168.078 E.45016
G1 X143.989 Y168.078 E.02514
G1 X145.415 Y176.319 E.45016
G1 X145.882 Y176.319 E.02513
G1 X144.456 Y168.078 E.45015
G1 X144.923 Y168.078 E.02514
G1 X146.349 Y176.319 E.45015
G1 X146.816 Y176.319 E.02513
G1 X145.39 Y168.078 E.45014
G1 X145.857 Y168.078 E.02514
G1 X147.283 Y176.319 E.45014
G1 X147.75 Y176.319 E.02513
G1 X146.324 Y168.079 E.45013
G1 X146.791 Y168.079 E.02514
G1 X148.205 Y176.247 E.44623
G2 X148.22 Y176.183 I-.104 J-.059 E.00361
G1 X148.22 Y173.637 E.13706
G1 X147.258 Y168.079 E.30361
G1 X147.725 Y168.079 E.02514
G1 X148.22 Y170.938 E.1562
G1 X148.22 Y168.239 E.14526
G1 X148.159 Y167.887 E.01926
M106 S153
; WIPE_START
G1 X148.22 Y168.239 E-.136
G1 X148.22 Y169.882 E-.624
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.72 Y171.297 Z2 F42000
G1 X115.495 Y176.059 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56582
; LAYER_HEIGHT: 0.2
G1 F6884.688
M204 S6000
G1 X115.527 Y176.351 E.01253
; LINE_WIDTH: 0.531059
G1 F7374.954
G1 X115.559 Y176.643 E.0117
; LINE_WIDTH: 0.494279
G1 F7975.924
G1 X115.578 Y176.792 E.00552
; LINE_WIDTH: 0.455475
G1 F8726.107
G1 X115.598 Y176.941 E.00505
; LINE_WIDTH: 0.416672
G1 F9632.058
G1 X115.617 Y177.09 E.00457
; LINE_WIDTH: 0.374782
G1 F10847.902
G1 X115.64 Y177.239 E.00408
; LINE_WIDTH: 0.329785
G1 F12549.488
G1 X115.662 Y177.388 E.00353
; LINE_WIDTH: 0.284788
G1 F14884.205
G1 X115.685 Y177.537 E.00298
; LINE_WIDTH: 0.242973
G1 F15000
G1 X115.704 Y177.65 E.00187
; LINE_WIDTH: 0.204317
G1 X115.723 Y177.763 E.00151
; LINE_WIDTH: 0.165661
G1 X115.743 Y177.876 E.00115
; LINE_WIDTH: 0.127006
G1 X115.762 Y177.989 E.00079
; LINE_WIDTH: 0.102299
G1 X115.772 Y178.044 E.00027
; OBJECT_ID: 8
; WIPE_START
G1 X115.762 Y177.989 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X108.141 Y177.571 Z2 F42000
G1 X92.078 Y176.689 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.967 Y176.689 E.00368
G1 X91.873 Y176.983 E.01023
G1 X91.365 Y176.555 E.02206
G3 X91.21 Y176.207 I.339 J-.359 E.01294
G1 X91.209 Y168.583 E.25291
G2 X70.791 Y172.089 I-9.904 J3.527 E.97563
G1 X70.791 Y176.121 E.13376
G1 X70.568 Y176.141 E.00741
G3 X70.409 Y174.288 I11.046 J-1.882 E.06174
G3 X70.418 Y171.664 I65.935 J-1.09 E.08706
G3 X81.411 Y161.21 I10.884 J.438 E.55665
G3 X90.8 Y166.774 I-.139 J10.939 E.37903
G1 X91.299 Y167.708 E.03512
G1 X102.709 Y167.709 E.37848
G3 X103.19 Y168.189 I-.013 J.494 E.02487
G1 X103.19 Y176.218 E.26631
G3 X102.719 Y176.688 I-.498 J-.027 E.02417
G1 X92.138 Y176.689 E.35099
M204 S10000
G1 X92.319 Y177.096 F42000
G1 F8843.478
M204 S6000
G1 X92.264 Y177.096 E.00181
G3 X91.594 Y178.948 I-16.7 J-4.996 E.06535
G1 X91.402 Y178.906 E.00653
G1 X91.402 Y177.118 E.0593
G3 X90.95 Y176.691 I.998 J-1.507 E.02073
G3 X90.803 Y176.227 I.782 J-.503 E.01633
G1 X90.802 Y168.661 E.25099
G2 X71.198 Y172.093 I-9.499 J3.448 E.93582
G1 X71.198 Y178.905 E.22598
G1 X71.004 Y178.946 E.00658
G3 X70.002 Y174.293 I10.659 J-4.729 E.159
G3 X70.011 Y171.648 I66.388 J-1.094 E.08773
G3 X81.412 Y160.803 I11.291 J.454 E.57738
G3 X91.155 Y166.575 I-.141 J11.348 E.39329
G1 X91.543 Y167.3 E.0273
G1 X102.729 Y167.302 E.37105
G3 X103.597 Y168.169 I-.034 J.902 E.04476
G1 X103.597 Y176.234 E.2675
G3 X102.735 Y177.095 I-.91 J-.048 E.04428
G1 X92.379 Y177.096 E.34353
M204 S250
G1 X92.551 Y177.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X91.01 Y180.804 I-12.029 J-3.575 E.11273
G1 X91.01 Y177.301 E.10764
G3 X90.411 Y176.246 I.793 J-1.148 E.03855
G1 X90.41 Y168.736 E.23078
G2 X71.59 Y172.096 I-9.108 J3.372 E.83135
G1 X71.59 Y180.807 E.26767
G3 X69.61 Y174.296 I9.752 J-6.522 E.21216
G3 X69.619 Y171.633 I66.874 J-1.098 E.08186
G3 X81.414 Y160.411 I11.683 J.47 E.55332
G3 X91.778 Y166.908 I-.12 J11.707 E.39549
G1 X102.748 Y166.91 E.33708
G3 X103.989 Y168.15 I-.055 J1.295 E.05921
G1 X103.989 Y176.249 E.24885
G3 X102.75 Y177.487 I-1.307 J-.068 E.05896
G1 X92.611 Y177.488 E.31157
M204 S10000
G1 X91.773 Y177.414 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.312699
G1 F13344.251
M204 S6000
G1 X91.739 Y177.635 E.0049
; LINE_WIDTH: 0.264487
G1 F15000
G1 X91.704 Y177.855 E.00403
; LINE_WIDTH: 0.216484
G1 X91.679 Y178 E.00207
; LINE_WIDTH: 0.168659
G1 X91.653 Y178.144 E.0015
; LINE_WIDTH: 0.120833
G1 X91.628 Y178.288 E.00093
M204 S10000
G1 X91.773 Y177.414 F42000
; LINE_WIDTH: 0.360912
G1 F11321.046
M204 S6000
G1 X91.808 Y177.194 E.00578
M204 S10000
G1 X91.399 Y176.297 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42031
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G2 X91.862 Y176.32 I.404 J-3.472 E.0262
G1 X98.853 Y176.319 E.39526
G1 X91.58 Y175.837 E.41208
G1 X91.58 Y175.366 E.02665
G1 X102.82 Y176.11 E.63681
G1 X102.82 Y175.639 E.02665
G1 X91.58 Y174.895 E.63681
G1 X91.58 Y174.423 E.02665
G1 X102.82 Y175.167 E.63682
G1 X102.82 Y174.696 E.02665
G1 X91.58 Y173.952 E.63682
G1 X91.58 Y173.481 E.02665
G1 X102.82 Y174.225 E.63683
G1 X102.82 Y173.753 E.02665
G1 X91.579 Y173.009 E.63683
G1 X91.579 Y172.538 E.02665
G1 X102.82 Y173.282 E.63683
G1 X102.82 Y172.811 E.02665
G1 X91.579 Y172.067 E.63684
G1 X91.579 Y171.595 E.02665
G1 X102.82 Y172.339 E.63684
G1 X102.82 Y171.868 E.02665
G1 X91.579 Y171.124 E.63685
G1 X91.579 Y170.653 E.02665
G1 X102.82 Y171.397 E.63685
G1 X102.82 Y170.925 E.02665
G1 X91.579 Y170.181 E.63686
G1 X91.579 Y169.71 E.02665
G1 X102.82 Y170.454 E.63686
G1 X102.82 Y169.983 E.02665
G1 X91.579 Y169.238 E.63686
G1 X91.579 Y168.767 E.02665
G1 X102.82 Y169.511 E.63687
G1 X102.82 Y169.04 E.02665
G1 X91.491 Y168.29 E.64187
G1 X91.406 Y168.077 E.01293
G1 X95.403 Y168.078 E.22596
G1 X102.82 Y168.569 E.42019
G2 X102.813 Y168.165 I-1.388 J-.176 E.0229
G2 X102.745 Y168.092 I-.145 J.067 E.00571
G1 X99.471 Y167.876 E.1855
M106 S153
; WIPE_START
G1 X101.466 Y168.008 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.099 Y170.001 Z2 F42000
G1 X70.696 Y176.334 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556657
; LAYER_HEIGHT: 0.2
G1 F7007.479
M204 S6000
G1 X70.75 Y176.831 E.02093
; LINE_WIDTH: 0.513555
G1 F7649.248
G1 X70.768 Y176.973 E.0055
; LINE_WIDTH: 0.477064
G1 F8292.188
G1 X70.786 Y177.115 E.00507
; LINE_WIDTH: 0.440573
G1 F9053.126
G1 X70.805 Y177.258 E.00465
; LINE_WIDTH: 0.401073
G1 F10051.576
G1 X70.826 Y177.401 E.00423
; LINE_WIDTH: 0.358579
G1 F11404.736
G1 X70.847 Y177.544 E.00373
; LINE_WIDTH: 0.316084
G1 F13178.901
G1 X70.868 Y177.687 E.00322
; LINE_WIDTH: 0.270573
G1 F15000
G1 X70.893 Y177.831 E.00271
; LINE_WIDTH: 0.222079
G1 X70.917 Y177.975 E.00213
; LINE_WIDTH: 0.173585
G1 X70.941 Y178.119 E.00155
; LINE_WIDTH: 0.136237
G1 X70.957 Y178.202 E.00064
; LINE_WIDTH: 0.110029
G1 X70.972 Y178.285 E.00046
; OBJECT_ID: 7
; WIPE_START
G1 X70.957 Y178.202 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X63.34 Y177.715 Z2 F42000
G1 X47.314 Y176.691 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X47.206 Y176.691 E.00355
G1 X47.108 Y177.014 E.0112
G1 X46.565 Y176.556 E.02357
G3 X46.41 Y176.209 I.349 J-.363 E.01292
G1 X46.409 Y168.419 E.25841
G2 X26.391 Y171.89 I-9.706 J3.485 E.95629
G1 X26.391 Y176.302 E.14636
G1 X26.168 Y176.322 E.00743
G3 X26.009 Y174.49 I10.8 J-1.858 E.06107
G3 X26.018 Y171.478 I76.373 J-1.29 E.0999
G3 X37.047 Y161.217 I10.684 J.425 E.55449
G3 X46.082 Y166.775 I-.375 J10.732 E.36803
G1 X46.569 Y167.709 E.03494
G1 X57.919 Y167.71 E.37651
G3 X58.39 Y168.191 I-.027 J.497 E.0245
G1 X58.39 Y176.219 E.26631
G3 X57.919 Y176.689 I-.498 J-.027 E.02418
G1 X47.374 Y176.691 E.34981
M204 S10000
G1 X47.561 Y177.098 F42000
G1 F8843.478
M204 S6000
G1 X47.508 Y177.098 E.00174
G3 X46.797 Y179.106 I-12.833 J-3.413 E.07076
G1 X46.602 Y179.066 E.0066
G1 X46.602 Y177.12 E.06456
G3 X46.15 Y176.692 I.997 J-1.505 E.02073
G3 X46.003 Y176.229 I.756 J-.495 E.01634
G1 X46.002 Y168.497 E.25646
G2 X26.798 Y171.894 I-9.3 J3.406 E.9165
G1 X26.798 Y179.068 E.23799
G1 X26.603 Y179.108 E.00661
G3 X25.602 Y174.493 I10.222 J-4.632 E.15782
G3 X25.611 Y171.462 I76.88 J-1.294 E.10055
G3 X37.058 Y160.81 I11.091 J.441 E.57553
G3 X46.439 Y166.579 I-.386 J11.141 E.38213
G1 X46.816 Y167.302 E.02702
G1 X57.935 Y167.303 E.36885
G3 X58.797 Y168.171 I-.048 J.909 E.04448
G1 X58.797 Y176.235 E.2675
G3 X57.935 Y177.097 I-.909 J-.048 E.04428
G1 X47.62 Y177.098 E.34215
M204 S250
G1 X47.798 Y177.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X46.21 Y180.944 I-11.732 J-3.302 E.11731
G1 X46.21 Y177.302 E.11192
G3 X45.611 Y176.248 I.808 J-1.156 E.03852
G1 X45.61 Y168.573 E.23582
G2 X27.19 Y171.898 I-8.909 J3.329 E.81346
G1 X27.19 Y180.944 E.27798
G3 X25.21 Y174.497 I9.53 J-6.455 E.21031
G3 X25.219 Y171.447 I77.355 J-1.298 E.09374
G3 X37.068 Y160.418 I11.483 J.457 E.55188
G3 X47.054 Y166.91 I-.374 J11.501 E.38467
G1 X57.95 Y166.911 E.33483
G3 X59.189 Y168.151 I-.068 J1.306 E.05903
G1 X59.189 Y176.25 E.24885
G3 X57.95 Y177.489 I-1.306 J-.068 E.05896
G1 X47.858 Y177.49 E.3101
M204 S10000
G1 X46.997 Y177.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362567
G1 F11262.429
M204 S6000
G1 X46.966 Y177.624 E.00542
; LINE_WIDTH: 0.323056
G1 F12850.918
G1 X46.936 Y177.83 E.00475
; LINE_WIDTH: 0.280652
G1 F15000
G1 X46.913 Y177.965 E.00265
; LINE_WIDTH: 0.235327
G1 X46.89 Y178.1 E.00214
; LINE_WIDTH: 0.190003
G1 X46.868 Y178.235 E.00164
; LINE_WIDTH: 0.149726
G1 X46.848 Y178.342 E.00095
; LINE_WIDTH: 0.114522
M73 P65 R9
G1 X46.828 Y178.449 E.00064
M204 S10000
G1 X46.997 Y177.418 F42000
; LINE_WIDTH: 0.402078
G1 F10023.442
M204 S6000
G1 X47.028 Y177.212 E.00609
; WIPE_START
G1 X46.997 Y177.418 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.599 Y169.796 Z2 F42000
G1 X46.576 Y169.357 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40848
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X47.21 Y168.079 E.07615
G1 X47.721 Y168.079 E.02732
G1 X46.779 Y169.981 E.11331
G1 X46.779 Y171.013 E.05511
G1 X48.233 Y168.079 E.17482
G1 X48.745 Y168.079 E.02732
G1 X46.779 Y172.045 E.23633
G1 X46.78 Y173.077 E.05511
G1 X49.256 Y168.079 E.29783
G1 X49.768 Y168.079 E.02732
G1 X46.78 Y174.109 E.35934
G1 X46.78 Y175.142 E.05511
G1 X50.28 Y168.079 E.42085
G1 X50.791 Y168.079 E.02732
G1 X46.78 Y176.174 E.48236
G2 X46.868 Y176.321 I.267 J-.06 E.00932
G1 X47.219 Y176.321 E.01872
G1 X51.303 Y168.079 E.49113
G1 X51.815 Y168.079 E.02732
G1 X47.73 Y176.321 E.49112
G1 X48.242 Y176.321 E.02732
G1 X52.326 Y168.079 E.49112
G1 X52.838 Y168.079 E.02732
G1 X48.754 Y176.321 E.49111
G1 X49.266 Y176.321 E.02732
G1 X53.35 Y168.079 E.49111
G1 X53.862 Y168.079 E.02732
G1 X49.777 Y176.321 E.4911
G1 X50.289 Y176.321 E.02732
G1 X54.373 Y168.08 E.4911
G1 X54.885 Y168.08 E.02732
G1 X50.801 Y176.321 E.49109
G1 X51.313 Y176.32 E.02732
G1 X55.397 Y168.08 E.49108
G1 X55.908 Y168.08 E.02732
G1 X51.824 Y176.32 E.49108
G1 X52.336 Y176.32 E.02732
G1 X56.42 Y168.08 E.49107
G1 X56.932 Y168.08 E.02732
G1 X52.848 Y176.32 E.49107
G1 X53.359 Y176.32 E.02732
G1 X57.443 Y168.08 E.49106
G3 X57.947 Y168.096 I.194 J1.847 E.027
G1 X53.871 Y176.32 E.49011
G1 X54.383 Y176.32 E.02732
G1 X58.02 Y168.981 E.43735
G1 X58.02 Y170.013 E.05513
G1 X54.895 Y176.32 E.37582
G1 X55.406 Y176.32 E.02732
G1 X58.02 Y171.046 E.31428
G1 X58.02 Y172.079 E.05513
G1 X55.918 Y176.32 E.25275
G1 X56.43 Y176.32 E.02732
G1 X58.02 Y173.111 E.19122
G1 X58.02 Y174.144 E.05513
G1 X56.941 Y176.32 E.12969
G1 X57.453 Y176.32 E.02732
G1 X58.02 Y175.176 E.06816
G1 X58.02 Y176.19 E.05413
G1 X57.865 Y176.522 E.01959
M106 S153
; WIPE_START
G1 X58.02 Y176.19 E-.13943
G1 X58.02 Y175.176 E-.38526
G1 X57.745 Y175.731 E-.23531
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X50.141 Y176.394 Z2 F42000
G1 X26.572 Y178.449 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121062
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X26.546 Y178.305 E.00093
; LINE_WIDTH: 0.169328
G1 X26.519 Y178.16 E.00151
; LINE_WIDTH: 0.2161
G1 X26.496 Y178.023 E.00197
; LINE_WIDTH: 0.261396
G1 X26.474 Y177.885 E.00248
; LINE_WIDTH: 0.306692
G1 F13648.152
G1 X26.451 Y177.747 E.003
; LINE_WIDTH: 0.349234
G1 F11752.644
G1 X26.431 Y177.61 E.00346
; LINE_WIDTH: 0.389013
G1 F10401.845
G1 X26.411 Y177.473 E.00391
; LINE_WIDTH: 0.428791
G1 F9329.547
G1 X26.392 Y177.335 E.00436
; LINE_WIDTH: 0.465724
G1 F8514.588
G1 X26.374 Y177.199 E.00472
; LINE_WIDTH: 0.499811
G1 F7879.353
G1 X26.357 Y177.063 E.0051
; LINE_WIDTH: 0.533897
G1 F7332.323
G1 X26.34 Y176.927 E.00548
; LINE_WIDTH: 0.566022
G1 F6882.024
G1 X26.297 Y176.515 E.01767
; OBJECT_ID: 3
; WIPE_START
G1 X26.34 Y176.927 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X28.019 Y169.482 Z2 F42000
G1 X32.711 Y148.665 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X32.677 Y148.657 E.00117
G3 X26.391 Y141.01 I1.538 J-7.671 E.35552
G1 X26.391 Y106.99 E1.12848
G3 X34.19 Y99.191 I7.823 J.024 E.40607
G1 X87.71 Y99.191 E1.77533
G3 X95.509 Y106.99 I-.013 J7.812 E.40622
G1 X95.509 Y141.01 E1.12848
G3 X87.71 Y148.809 I-7.812 J-.013 E.40622
G1 X34.19 Y148.809 E1.77533
G3 X33.283 Y148.754 I.024 J-7.823 E.03019
G1 X32.77 Y148.674 E.0172
M204 S10000
G1 X32.775 Y148.263 F42000
G1 F8843.478
M204 S6000
G1 X32.756 Y148.257 E.00064
G3 X26.798 Y141.006 I1.457 J-7.271 E.3371
G1 X26.798 Y106.994 E1.12822
G3 X30.176 Y100.789 I7.438 J.027 E.24423
G3 X34.194 Y99.598 I4.044 J6.272 E.14091
G1 X87.706 Y99.598 E1.77508
G3 X95.102 Y106.994 I-.009 J7.405 E.38527
G1 X95.102 Y141.006 E1.12822
G3 X87.706 Y148.402 I-7.405 J-.009 E.38527
G1 X34.194 Y148.402 E1.77508
G3 X33.33 Y148.349 I.019 J-7.416 E.02872
G1 X32.834 Y148.272 E.01667
M204 S250
G1 X32.836 Y147.876 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X32.833 Y147.873 E.00013
G3 X27.19 Y141.002 I1.38 J-6.886 E.29582
G1 X27.19 Y106.998 E1.04485
G3 X34.198 Y99.99 I7.023 J.015 E.33805
G1 X87.702 Y99.99 E1.64403
G3 X94.71 Y106.998 I-.015 J7.023 E.33805
G1 X94.71 Y141.002 E1.04485
G3 X87.702 Y148.01 I-7.013 J-.005 E.33818
G1 X34.198 Y148.01 E1.64403
G3 X33.376 Y147.96 I.015 J-7.023 E.0253
G1 X32.895 Y147.885 E.01497
; WIPE_START
M204 S6000
G1 X32.833 Y147.873 E-.02415
G1 X32.034 Y147.667 E-.31358
G1 X31.517 Y147.476 E-.20917
G1 X31.017 Y147.246 E-.20917
G1 X31.009 Y147.241 E-.00394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.715 Y141.232 Z2 F42000
G1 X68.941 Y98.809 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y98.809 E.62195
G3 X95.891 Y107.01 I.006 J8.195 E.42739
G1 X95.891 Y140.99 E1.12718
G3 X87.69 Y149.191 I-8.195 J.006 E.4274
G1 X34.21 Y149.191 E1.77403
G3 X26.009 Y140.99 I.006 J-8.207 E.42724
G1 X26.009 Y107.01 E1.12718
G3 X34.21 Y98.809 I8.207 J.006 E.42723
G1 X52.959 Y98.809 E.62194
G1 X52.959 Y93.82 E.16551
G3 X53.48 Y93.309 I.497 J-.013 E.02714
G1 X68.439 Y93.31 E.49624
G3 X68.941 Y93.82 I.006 J.496 E.02651
G1 X68.941 Y98.749 E.16351
M204 S10000
G1 X69.348 Y98.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y98.402 E.60858
G3 X96.298 Y107.006 I.002 J8.602 E.44833
G1 X96.298 Y140.994 E1.12745
G3 X87.694 Y149.598 I-8.602 J.002 E.44833
G1 X34.206 Y149.598 E1.7743
G3 X25.602 Y140.994 I.01 J-8.614 E.44817
G1 X25.602 Y107.006 E1.12745
G3 X34.206 Y98.402 I8.614 J.01 E.44816
G1 X52.552 Y98.402 E.60858
G1 X52.552 Y93.812 E.15227
G3 X53.468 Y92.902 I.906 J-.004 E.04766
G1 X68.453 Y92.902 E.49707
G3 X69.348 Y93.812 I-.01 J.905 E.04699
G1 X69.348 Y98.342 E.15027
M204 S250
G1 X69.74 Y98.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y98.01 E.5518
G3 X96.69 Y107.002 I-.002 J8.994 E.43398
G1 X96.69 Y140.998 E1.0446
G3 X88.985 Y149.896 I-8.992 J-.001 E.39428
G3 X87.698 Y149.99 I-1.533 J-12.13 E.03968
G1 X34.202 Y149.99 E1.64378
G3 X25.21 Y140.998 I.015 J-9.007 E.43382
G1 X25.21 Y107.002 E1.0446
G3 X34.202 Y98.01 I9.007 J.015 E.43382
G1 X52.16 Y98.01 E.5518
G1 X52.16 Y93.804 E.12923
G3 X53.456 Y92.51 I1.3 J.006 E.06245
G1 X68.465 Y92.51 E.46118
G3 X69.74 Y93.804 I-.025 J1.299 E.06179
G1 X69.74 Y97.95 E.12739
; WIPE_START
M204 S6000
G1 X71.74 Y97.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X67.88 Y99.027 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41098
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X68.571 Y98.271 E.05534
G1 X68.571 Y97.588 E.03692
G1 X67.441 Y98.825 E.09052
G1 X66.816 Y98.825 E.03375
G1 X68.57 Y96.905 E.14052
G1 X68.57 Y96.222 E.03691
G1 X66.192 Y98.825 E.19053
G1 X65.567 Y98.825 E.03375
G1 X68.57 Y95.539 E.24053
G1 X68.569 Y94.856 E.03692
G1 X64.943 Y98.824 E.29053
G1 X64.319 Y98.824 E.03375
G1 X68.569 Y94.174 E.34054
G1 X68.569 Y93.807 E.01978
G2 X68.396 Y93.679 I-.148 J.019 E.01297
G1 X63.694 Y98.824 E.37672
G1 X63.07 Y98.824 E.03375
G1 X67.772 Y93.679 E.37671
G1 X67.147 Y93.679 E.03375
G1 X62.445 Y98.824 E.37671
G1 X61.821 Y98.824 E.03375
G1 X66.523 Y93.679 E.37671
G1 X65.898 Y93.679 E.03375
G1 X61.197 Y98.824 E.3767
M73 P66 R9
G1 X60.572 Y98.824 E.03375
G1 X65.274 Y93.679 E.3767
G1 X64.649 Y93.679 E.03375
G1 X59.948 Y98.824 E.3767
G1 X59.323 Y98.824 E.03375
G1 X64.025 Y93.679 E.37669
G1 X63.4 Y93.679 E.03375
G1 X58.699 Y98.824 E.37669
G1 X58.074 Y98.824 E.03375
G1 X62.776 Y93.679 E.37669
G1 X62.151 Y93.679 E.03375
G1 X57.45 Y98.824 E.37668
G1 X56.826 Y98.824 E.03375
G1 X61.527 Y93.679 E.37668
G1 X60.903 Y93.679 E.03375
G1 X56.201 Y98.824 E.37667
G1 X55.577 Y98.823 E.03375
G1 X60.278 Y93.679 E.37667
G1 X59.654 Y93.679 E.03375
G1 X54.952 Y98.823 E.37667
G1 X54.328 Y98.823 E.03375
G1 X59.029 Y93.679 E.37666
G1 X58.405 Y93.679 E.03375
G1 X53.704 Y98.823 E.37666
G1 X53.329 Y98.823 E.02025
G1 X53.329 Y98.55 E.01478
G1 X57.78 Y93.679 E.35664
G1 X57.156 Y93.679 E.03375
G1 X53.329 Y97.866 E.30659
G1 X53.329 Y97.183 E.03695
G1 X56.531 Y93.679 E.25653
G1 X55.907 Y93.679 E.03375
G1 X53.33 Y96.499 E.20648
G1 X53.33 Y95.815 E.03695
G1 X55.282 Y93.679 E.15643
G1 X54.658 Y93.679 E.03375
G1 X53.33 Y95.132 E.10637
G1 X53.33 Y94.448 E.03695
G1 X54.033 Y93.679 E.05632
G1 X53.5 Y93.679 E.02882
G2 X53.372 Y93.72 I-.029 J.131 E.00763
G1 X53.128 Y93.986 E.01951
M106 S153
; OBJECT_ID: 1
; WIPE_START
G1 X53.372 Y93.72 E-.13717
G1 X53.415 Y93.688 E-.02034
G1 X53.5 Y93.679 E-.03255
G1 X54.033 Y93.679 E-.20262
G1 X53.381 Y94.392 E-.36731
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X57.399 Y87.903 Z2 F42000
G1 X91.297 Y33.15 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X91.946 Y33.643 E.02702
G3 X94.509 Y39.19 I-4.749 J5.56 E.20913
G1 X94.509 Y73.21 E1.12848
G3 X87.21 Y80.509 I-7.312 J-.013 E.38018
G1 X33.69 Y80.509 E1.77533
G3 X26.391 Y73.21 I.013 J-7.312 E.38017
G1 X26.391 Y39.19 E1.12848
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X91.248 Y33.116 I-.013 J7.312 E.14202
M204 S10000
G1 X91.016 Y33.45 F42000
G1 F8843.478
M204 S6000
G1 X91.034 Y33.462 E.00072
G3 X94.102 Y39.194 I-3.837 J5.741 E.22456
G1 X94.102 Y73.206 E1.12822
G3 X87.206 Y80.102 I-6.915 J-.018 E.35908
G1 X33.694 Y80.102 E1.77508
G3 X26.798 Y73.206 I.009 J-6.905 E.35922
G1 X26.798 Y39.194 E1.12823
G3 X33.694 Y32.298 I6.905 J.009 E.35922
G1 X87.206 Y32.298 E1.77508
G3 X90.333 Y33.051 I-.009 J6.905 E.10769
G1 X90.964 Y33.42 E.02424
M204 S250
G1 X90.816 Y33.788 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X93.71 Y39.198 I-3.619 J5.415 E.19629
G1 X93.71 Y73.202 E1.04485
G3 X87.202 Y79.71 I-6.513 J-.005 E.31405
G1 X33.698 Y79.71 E1.64403
G3 X27.19 Y73.202 I.005 J-6.513 E.31405
G1 X27.19 Y39.198 E1.04485
G3 X33.698 Y32.69 I6.513 J.005 E.31405
G1 X87.202 Y32.69 E1.64403
G3 X90.766 Y33.755 I-.005 J6.513 E.11591
; WIPE_START
M204 S6000
G1 X91.428 Y34.25 E-.314
G1 X91.803 Y34.597 E-.19422
G1 X92.243 Y35.092 E-.25178
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.696 Y33.956 Z2 F42000
G1 X68.441 Y31.509 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I-.002 J7.703 E.40123
G1 X94.891 Y73.19 E1.12718
G3 X87.19 Y80.891 I-7.695 J.006 E.40134
G1 X33.71 Y80.891 E1.77403
G3 X26.009 Y73.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E1.12718
G3 X33.71 Y31.509 I7.695 J-.006 E.40135
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.52 E.16551
G3 X52.98 Y26.009 I.495 J-.016 E.02718
G1 X67.939 Y26.01 E.49624
G3 X68.441 Y26.53 I.008 J.494 E.02688
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
M73 P66 R8
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I-.007 J8.11 E.42217
G1 X95.298 Y73.194 E1.12745
G3 X87.194 Y81.298 I-8.102 J.002 E.42228
G1 X33.706 Y81.298 E1.77431
G3 X25.602 Y73.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E1.12745
G3 X33.706 Y31.102 I8.102 J-.002 E.42228
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.512 E.15227
G3 X52.968 Y25.602 I.901 J-.009 E.04773
G1 X67.953 Y25.602 E.49707
G3 X68.848 Y26.518 I-.005 J.9 E.04725
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X95.69 Y39.202 I-.011 J8.503 E.40974
G1 X95.69 Y73.198 E1.0446
G3 X87.198 Y81.69 I-8.494 J-.002 E.40985
G1 X33.702 Y81.69 E1.64378
G3 X25.21 Y73.198 I.014 J-8.506 E.4097
G1 X25.21 Y39.202 E1.0446
G3 X33.702 Y30.71 I8.494 J.002 E.40985
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.504 E.12923
G3 X52.956 Y25.21 I1.293 J-.001 E.06255
G1 X67.965 Y25.21 E.46118
G3 X69.24 Y26.506 I-.017 J1.292 E.06195
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.63 Y31.727 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41581
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X68.071 Y31.086 E.13958
G1 X68.07 Y30.605 E.02664
G1 X64.567 Y31.524 E.20036
G1 X62.733 Y31.524 E.10149
G1 X68.07 Y30.124 E.30525
G1 X68.069 Y29.642 E.02664
G1 X60.899 Y31.524 E.41015
G1 X59.064 Y31.524 E.10149
G1 X68.069 Y29.161 E.51504
G1 X68.068 Y28.679 E.02664
G1 X57.23 Y31.524 E.61993
G1 X55.396 Y31.523 E.10149
G1 X68.067 Y28.198 E.72483
G1 X68.067 Y27.716 E.02664
G1 X53.562 Y31.523 E.82972
G1 X52.829 Y31.523 E.04054
G1 X52.829 Y31.234 E.016
G1 X68.066 Y27.235 E.87159
G1 X68.066 Y26.753 E.02664
G1 X52.829 Y30.752 E.87155
G1 X52.829 Y30.271 E.02665
G1 X67.657 Y26.379 E.84813
G1 X65.822 Y26.379 E.10152
G1 X52.83 Y29.789 E.74317
G1 X52.83 Y29.307 E.02665
G1 X63.987 Y26.379 E.63821
G1 X62.152 Y26.379 E.10152
G1 X52.83 Y28.826 E.53324
G1 X52.83 Y28.344 E.02665
G1 X60.317 Y26.379 E.42828
G1 X58.483 Y26.379 E.10152
G1 X52.83 Y27.862 E.32332
G1 X52.83 Y27.381 E.02665
G1 X56.648 Y26.379 E.21835
G1 X54.813 Y26.379 E.10152
G1 X52.831 Y26.899 E.11339
G1 X52.831 Y26.509 E.02156
G3 X52.893 Y26.401 I.145 J.011 E.00712
G1 X53.75 Y26.176 E.04902
M106 S153
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X52.893 Y26.401 E-.33668
G1 X52.84 Y26.465 E-.03129
G1 X52.831 Y26.509 E-.01736
G1 X52.831 Y26.899 E-.14811
G1 X53.407 Y26.748 E-.22656
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 9/15
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S165.75
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2 I-.454 J1.129 P1  F42000
G1 X175.404 Y75.822 Z2
G1 Z1.8
M73 P67 R8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X175.234 Y76.272 E.01596
G3 X168.31 Y80.909 I-6.947 J-2.886 E.29298
G1 X114.79 Y80.909 E1.77533
G3 X107.291 Y73.41 I.023 J-7.523 E.39045
G1 X107.291 Y39.39 E1.12848
G3 X114.79 Y31.891 I7.527 J.028 E.39038
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.023 J7.523 E.39045
G1 X175.809 Y73.41 E1.12848
G3 X175.438 Y75.719 I-7.523 J-.023 E.07791
G1 X175.423 Y75.765 E.0016
M204 S10000
G1 X175.023 Y75.681 F42000
G1 F8843.478
M204 S6000
G1 X174.858 Y76.116 E.01543
G3 X168.306 Y80.502 I-6.571 J-2.729 E.2772
G1 X114.794 Y80.502 E1.77507
G3 X107.698 Y73.406 I.019 J-7.115 E.3695
G1 X107.698 Y39.394 E1.12822
G3 X114.794 Y32.298 I7.12 J.023 E.36943
G1 X168.306 Y32.298 E1.77507
G3 X175.402 Y39.394 I-.019 J7.115 E.3695
G1 X175.402 Y73.406 E1.12822
G3 X175.051 Y75.593 I-7.115 J-.019 E.0738
G1 X175.041 Y75.624 E.00107
M204 S250
G1 X174.655 Y75.546 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X174.496 Y75.966 E.01383
G3 X168.302 Y80.11 I-6.208 J-2.579 E.2427
G1 X114.798 Y80.11 E1.64403
G3 X108.09 Y73.402 I.015 J-6.722 E.32357
G1 X108.09 Y39.398 E1.04485
G3 X114.798 Y32.69 I6.727 J.019 E.32352
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.015 J6.722 E.32357
G1 X175.01 Y73.402 E1.04485
G3 X174.679 Y75.472 I-6.722 J-.015 E.06469
G1 X174.673 Y75.488 E.00052
; WIPE_START
M204 S6000
G1 X174.496 Y75.966 E-.19377
G1 X174.279 Y76.446 E-.20017
G1 X173.879 Y77.128 E-.30019
G1 X173.777 Y77.268 E-.06587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.205 Y70.523 Z2.2 F42000
G1 X149.541 Y31.509 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I.006 J7.895 E.41177
G1 X176.191 Y73.39 E1.12718
G3 X168.29 Y81.291 I-7.895 J.006 E.41177
G1 X114.81 Y81.291 E1.77403
G3 X106.909 Y73.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E1.12718
G3 X114.81 Y31.509 I7.895 J-.006 E.41176
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.52 E.16551
G3 X134.08 Y26.009 I.498 J-.013 E.02714
G1 X149.035 Y26.009 E.4961
G3 X149.541 Y26.52 I.012 J.494 E.02669
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I.002 J8.302 E.4327
G1 X176.598 Y73.394 E1.12745
G3 X168.294 Y81.698 I-8.302 J.002 E.4327
G1 X114.806 Y81.698 E1.7743
G3 X106.502 Y73.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E1.12745
G3 X114.806 Y31.102 I8.302 J-.002 E.4327
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.512 E.15227
G3 X134.068 Y25.602 I.904 J-.005 E.04768
G1 X149.048 Y25.602 E.49692
G3 X149.948 Y26.512 I0 J.9 E.04721
G1 X149.948 Y31.042 E.15027
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.99 Y39.402 I-.002 J8.694 E.41951
G1 X176.99 Y73.398 E1.0446
G3 X168.298 Y82.09 I-8.694 J-.002 E.41951
G1 X114.802 Y82.09 E1.64378
G3 X106.11 Y73.398 I.014 J-8.706 E.41935
G1 X106.11 Y39.402 E1.0446
G3 X114.802 Y30.71 I8.694 J.002 E.41951
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.504 E.12923
G3 X134.056 Y25.21 I1.296 J.002 E.0625
G1 X149.06 Y25.21 E.46104
G3 X150.34 Y26.504 I-.013 J1.292 E.06203
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 9 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer9 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X146.597 Y29.19 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51914
G1 F7559.531
M204 S6000
G1 X146.836 Y29.19 E.00925
G1 X146.835 Y28.714 E.01849
G1 X136.264 Y28.713 E.41023
G1 X136.264 Y29.189 E.01847
G1 X146.537 Y29.19 E.39867
M204 S10000
G1 X147.263 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.262 Y28.287 E.04087
G1 X135.838 Y28.287 E.35103
G1 X135.837 Y29.616 E.04084
G1 X147.203 Y29.617 E.34922
M204 S10000
G1 X147.64 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X147.639 Y27.91 E.06404
G1 X135.461 Y27.91 E.37419
G1 X135.46 Y29.993 E.06401
G1 X147.58 Y29.994 E.3724
M204 S10000
G1 X148.017 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X148.016 Y27.533 E.08721
G1 X135.084 Y27.532 E.39735
G1 X135.083 Y30.37 E.08718
G1 X147.957 Y30.371 E.39558
M204 S10000
G1 X148.394 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X148.393 Y27.156 E.11038
G1 X134.707 Y27.155 E.42051
G1 X134.706 Y30.747 E.11035
G1 X148.334 Y30.748 E.41876
M204 S10000
G1 X148.772 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X148.77 Y26.779 E.13356
G1 X134.33 Y26.778 E.44368
G1 X134.328 Y31.124 E.13352
G1 X148.712 Y31.125 E.44194
M204 S10000
G1 X149.149 Y31.502 F42000
G1 F9547.299
M204 S6000
G1 X149.147 Y26.564 E.15172
G1 X149.105 Y26.444 E.00391
G1 X148.952 Y26.402 E.00488
G1 X134.101 Y26.401 E.45631
G1 X133.981 Y26.45 E.00399
G1 X133.953 Y26.558 E.00344
G1 X133.951 Y31.501 E.15187
G1 X149.089 Y31.502 E.46512
; OBJECT_ID: 4
; WIPE_START
G1 X147.089 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X145.369 Y38.938 Z2.2 F42000
G1 X129.214 Y108.791 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P68 R8
G1 F8843.478
M204 S6000
G1 X129.106 Y108.791 E.00355
G1 X129.008 Y109.114 E.0112
G1 X128.464 Y108.656 E.02358
G3 X128.31 Y108.309 I.338 J-.358 E.01293
G1 X128.309 Y100.519 E.25841
G2 X116.638 Y93.88 I-9.725 J3.519 E.48471
G2 X108.291 Y103.99 I1.965 J10.123 E.4713
G1 X108.291 Y108.402 E.14636
G1 X108.068 Y108.422 E.00743
G3 X107.909 Y106.59 I10.798 J-1.857 E.06107
G3 X107.918 Y103.578 I76.424 J-1.29 E.09989
G3 X118.993 Y93.318 I10.685 J.425 E.55603
G3 X127.982 Y98.874 I-.397 J10.691 E.36664
G1 X128.469 Y99.809 E.03495
G1 X139.819 Y99.81 E.37651
G3 X140.29 Y100.29 I-.027 J.497 E.02449
G1 X140.29 Y108.319 E.26632
G3 X139.809 Y108.789 I-.497 J-.027 E.0245
G1 X129.274 Y108.791 E.34948
M204 S10000
G1 X129.46 Y109.198 F42000
G1 F8843.478
M204 S6000
G1 X129.408 Y109.198 E.00174
G3 X128.697 Y111.206 I-12.917 J-3.443 E.07076
G1 X128.502 Y111.166 E.0066
G1 X128.502 Y109.22 E.06457
G3 X128.05 Y108.792 I.998 J-1.507 E.02073
G3 X127.903 Y108.328 I.785 J-.504 E.01633
G1 X127.902 Y100.597 E.25646
G2 X108.698 Y103.994 I-9.3 J3.406 E.91649
G1 X108.698 Y111.168 E.23799
G1 X108.503 Y111.208 E.00661
G3 X107.502 Y106.593 I10.222 J-4.632 E.15782
G3 X107.511 Y103.562 I76.886 J-1.294 E.10055
G3 X119.004 Y92.911 I11.092 J.442 E.57706
G3 X128.339 Y98.679 I-.408 J11.099 E.38075
G1 X128.716 Y99.402 E.02703
G1 X139.835 Y99.403 E.36885
G3 X140.697 Y100.27 I-.048 J.909 E.04447
G1 X140.697 Y108.335 E.26751
G3 X139.829 Y109.197 I-.909 J-.048 E.04448
G1 X129.52 Y109.198 E.34196
M204 S250
G1 X129.698 Y109.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.11 Y113.044 I-11.327 J-3.115 E.11735
G1 X128.11 Y109.402 E.11192
G3 X127.511 Y108.348 I.791 J-1.147 E.03855
G1 X127.51 Y100.673 E.23582
G2 X109.09 Y103.998 I-8.909 J3.329 E.81345
G1 X109.09 Y113.044 E.27798
G3 X107.11 Y106.597 I9.53 J-6.455 E.21031
G3 X107.119 Y103.547 I77.357 J-1.298 E.09374
G3 X119.014 Y92.519 I11.483 J.457 E.5533
G3 X128.954 Y99.01 I-.422 J11.502 E.38325
G1 X139.85 Y99.011 E.33483
G3 X141.089 Y100.251 I-.068 J1.306 E.05901
G1 X141.089 Y108.35 E.24886
G3 X139.848 Y109.589 I-1.306 J-.068 E.05902
G1 X129.758 Y109.59 E.31004
M204 S10000
G1 X128.897 Y109.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362587
G1 F11261.729
M204 S6000
G1 X128.867 Y109.724 E.00542
; LINE_WIDTH: 0.323089
G1 F12849.391
G1 X128.836 Y109.93 E.00475
; LINE_WIDTH: 0.280654
G1 F15000
G1 X128.813 Y110.065 E.00265
; LINE_WIDTH: 0.235297
G1 X128.79 Y110.2 E.00214
; LINE_WIDTH: 0.189939
G1 X128.768 Y110.335 E.00164
; LINE_WIDTH: 0.149665
G1 X128.748 Y110.442 E.00095
; LINE_WIDTH: 0.114502
G1 X128.728 Y110.549 E.00064
M204 S10000
G1 X128.897 Y109.518 F42000
; LINE_WIDTH: 0.402085
G1 F10023.261
M204 S6000
G1 X128.928 Y109.312 E.00609
; WIPE_START
G1 X128.897 Y109.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.474 Y108.186 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4245
G1 F9434.457
M204 S6000
G2 X128.838 Y108.529 I2.411 J-2.197 E.01556
G1 X128.86 Y108.457 E.00232
G1 X129.285 Y108.457 E.01322
G1 X128.643 Y107.816 E.0282
G1 X128.643 Y107.276 E.01678
G1 X129.824 Y108.457 E.05193
G1 X130.364 Y108.457 E.01678
G1 X128.643 Y106.737 E.07566
G1 X128.643 Y106.197 E.01678
G1 X130.903 Y108.457 E.09939
G1 X131.443 Y108.457 E.01678
G1 X128.643 Y105.657 E.12312
G1 X128.643 Y105.118 E.01678
G1 X131.983 Y108.457 E.14685
G1 X132.522 Y108.457 E.01678
G1 X128.643 Y104.578 E.17058
G1 X128.643 Y104.038 E.01678
G1 X133.062 Y108.457 E.19431
G1 X133.601 Y108.457 E.01678
G1 X128.643 Y103.498 E.21804
G1 X128.643 Y102.959 E.01678
G1 X134.141 Y108.457 E.24177
G1 X134.68 Y108.457 E.01678
G1 X128.643 Y102.419 E.2655
G1 X128.643 Y101.879 E.01678
G1 X135.22 Y108.457 E.28923
G1 X135.76 Y108.457 E.01678
G1 X128.642 Y101.34 E.31296
G1 X128.642 Y100.8 E.01678
G1 X136.299 Y108.457 E.33669
G1 X136.839 Y108.457 E.01678
G1 X128.524 Y100.142 E.36562
G1 X129.064 Y100.142 E.01678
G1 X137.378 Y108.457 E.36561
G1 X137.918 Y108.456 E.01678
G1 X129.604 Y100.142 E.3656
G1 X130.143 Y100.142 E.01678
G1 X138.457 Y108.456 E.3656
G1 X138.997 Y108.456 E.01678
G1 X130.683 Y100.142 E.36559
G1 X131.223 Y100.142 E.01678
G1 X139.537 Y108.456 E.36559
G1 X139.79 Y108.456 E.00787
G2 X139.95 Y108.335 I.003 J-.162 E.00673
G1 X131.762 Y100.142 E.36014
G1 X132.302 Y100.143 E.01678
G1 X139.956 Y107.797 E.33659
G1 X139.956 Y107.257 E.01678
G1 X132.842 Y100.143 E.31285
G1 X133.382 Y100.143 E.01678
G1 X139.956 Y106.718 E.28912
G1 X139.956 Y106.178 E.01678
G1 X133.921 Y100.143 E.26539
G1 X134.461 Y100.143 E.01678
G1 X139.956 Y105.638 E.24166
G1 X139.956 Y105.099 E.01678
G1 X135.001 Y100.143 E.21793
G1 X135.54 Y100.143 E.01678
G1 X139.956 Y104.559 E.19419
G1 X139.956 Y104.019 E.01678
G1 X136.08 Y100.143 E.17046
G1 X136.62 Y100.143 E.01678
G1 X139.956 Y103.48 E.14673
G1 X139.956 Y102.94 E.01678
G1 X137.159 Y100.143 E.123
G1 X137.699 Y100.143 E.01678
G1 X139.956 Y102.4 E.09927
G1 X139.956 Y101.861 E.01678
G1 X138.239 Y100.143 E.07553
G1 X138.778 Y100.143 E.01678
G1 X139.956 Y101.321 E.0518
G1 X139.956 Y100.782 E.01678
G1 X139.318 Y100.143 E.02807
G1 X139.793 Y100.143 E.01476
G3 X139.887 Y100.174 I-.007 J.182 E.00312
G3 X140.126 Y100.412 I-2.115 J2.367 E.01049
; WIPE_START
G1 X139.887 Y100.174 E-.12817
G1 X139.793 Y100.143 E-.03761
G1 X139.318 Y100.143 E-.18037
G1 X139.956 Y100.782 E-.34302
G1 X139.956 Y100.968 E-.07084
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.536 Y102.755 Z2.2 F42000
G1 X108.197 Y108.615 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.566024
G1 F6881.995
M204 S6000
G1 X108.24 Y109.027 E.01768
; LINE_WIDTH: 0.53387
G1 F7332.729
G1 X108.257 Y109.163 E.00549
; LINE_WIDTH: 0.499769
G1 F7880.07
G1 X108.275 Y109.299 E.00511
; LINE_WIDTH: 0.465668
G1 F8515.713
G1 X108.292 Y109.435 E.00473
; LINE_WIDTH: 0.428735
G1 F9330.906
G1 X108.311 Y109.573 E.00436
; LINE_WIDTH: 0.389004
G1 F10402.1
G1 X108.331 Y109.71 E.00391
; LINE_WIDTH: 0.349274
G1 F11751.137
G1 X108.351 Y109.847 E.00346
; LINE_WIDTH: 0.306756
G1 F13644.867
G1 X108.374 Y109.985 E.003
; LINE_WIDTH: 0.261427
G1 F15000
G1 X108.396 Y110.123 E.00249
; LINE_WIDTH: 0.216098
G1 X108.419 Y110.26 E.00197
; LINE_WIDTH: 0.169312
G1 X108.446 Y110.405 E.00151
; LINE_WIDTH: 0.121057
G1 X108.472 Y110.549 E.00093
; OBJECT_ID: 5
; WIPE_START
G1 X108.446 Y110.405 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X116.076 Y110.217 Z2.2 F42000
G1 X173.978 Y108.789 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.867 Y108.789 E.00369
G1 X173.773 Y109.083 E.01023
G1 X173.265 Y108.655 E.02206
G3 X173.11 Y108.307 I.332 J-.356 E.01295
G1 X173.109 Y100.683 E.25291
G2 X152.691 Y104.189 I-9.906 J3.519 E.97606
G1 X152.691 Y108.221 E.13376
G1 X152.468 Y108.241 E.00742
G3 X152.309 Y106.388 I11.611 J-1.93 E.06173
G3 X152.318 Y103.764 I65.931 J-1.09 E.08706
G3 X163.358 Y93.31 I10.898 J.452 E.55805
G3 X172.7 Y98.874 I-.163 J10.898 E.3776
G1 X173.199 Y99.808 E.03512
G1 X184.619 Y99.809 E.37881
G3 X185.09 Y100.279 I-.024 J.495 E.02421
G1 X185.09 Y108.318 E.26665
G3 X184.609 Y108.788 I-.497 J-.027 E.02449
G1 X174.038 Y108.789 E.35066
M204 S10000
G1 X174.219 Y109.196 F42000
G1 F8843.478
M204 S6000
G1 X174.164 Y109.196 E.00181
G3 X173.494 Y111.048 I-16.699 J-4.996 E.06535
G1 X173.302 Y111.006 E.00653
G1 X173.302 Y109.218 E.0593
G3 X172.85 Y108.791 I.998 J-1.506 E.02073
G3 X172.703 Y108.327 I.794 J-.507 E.01633
G1 X172.702 Y100.761 E.25099
G2 X153.098 Y104.193 I-9.5 J3.44 E.93625
G1 X153.098 Y111.005 E.22597
G1 X152.904 Y111.045 E.00658
G3 X151.902 Y106.393 I10.664 J-4.73 E.159
G3 X151.911 Y103.748 I66.387 J-1.094 E.08772
G3 X163.36 Y92.903 I11.305 J.469 E.57877
G3 X173.055 Y98.675 I-.164 J11.305 E.39187
G1 X173.443 Y99.4 E.0273
G1 X184.635 Y99.402 E.37125
G3 X185.497 Y100.263 I-.041 J.903 E.04436
G1 X185.497 Y108.334 E.26771
G3 X184.629 Y109.195 I-.909 J-.048 E.04447
G1 X174.279 Y109.196 E.34334
M204 S250
G1 X174.451 Y109.588 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X172.91 Y112.904 I-12.028 J-3.574 E.11273
G1 X172.91 Y109.401 E.10764
G3 X172.311 Y108.346 I.784 J-1.143 E.03857
G1 X172.31 Y100.836 E.23078
G2 X153.49 Y104.196 I-9.109 J3.364 E.83173
G1 X153.49 Y112.907 E.26766
G3 X151.51 Y106.396 I9.758 J-6.524 E.21215
G3 X151.519 Y103.733 I66.877 J-1.098 E.08186
G3 X163.361 Y92.511 I11.697 J.485 E.55461
G3 X173.678 Y99.008 I-.194 J11.749 E.39388
G1 X184.65 Y99.01 E.33714
G3 X185.889 Y100.248 I-.057 J1.296 E.05908
G1 X185.889 Y108.349 E.24892
G3 X184.648 Y109.587 I-1.306 J-.068 E.05902
G1 X174.511 Y109.588 E.31151
M204 S10000
G1 X173.673 Y109.514 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.312723
G1 F13343.099
M204 S6000
G1 X173.639 Y109.735 E.0049
; LINE_WIDTH: 0.264548
G1 F15000
G1 X173.604 Y109.955 E.00403
; LINE_WIDTH: 0.216537
G1 X173.579 Y110.099 E.00208
; LINE_WIDTH: 0.16869
G1 X173.553 Y110.244 E.0015
; LINE_WIDTH: 0.120844
G1 X173.528 Y110.388 E.00093
M204 S10000
G1 X173.673 Y109.514 F42000
; LINE_WIDTH: 0.360898
G1 F11321.563
M204 S6000
G1 X173.707 Y109.294 E.00578
; WIPE_START
G1 X173.673 Y109.514 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.274 Y108.185 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4245
G1 F9434.457
M204 S6000
G2 X173.609 Y108.503 I2.254 J-2.039 E.01438
G1 X173.624 Y108.456 E.00153
G1 X174.085 Y108.456 E.01433
G1 X173.443 Y107.815 E.0282
G1 X173.443 Y107.275 E.01678
G1 X174.624 Y108.456 E.05193
G1 X175.164 Y108.456 E.01678
G1 X173.443 Y106.735 E.07566
G1 X173.443 Y106.196 E.01678
G1 X175.703 Y108.456 E.09939
G1 X176.243 Y108.456 E.01678
G1 X173.443 Y105.656 E.12312
G1 X173.443 Y105.116 E.01678
G1 X176.783 Y108.456 E.14685
G1 X177.322 Y108.456 E.01678
G1 X173.443 Y104.577 E.17058
G1 X173.443 Y104.037 E.01678
G1 X177.862 Y108.456 E.19431
G1 X178.401 Y108.456 E.01678
G1 X173.443 Y103.497 E.21804
G1 X173.443 Y102.957 E.01678
G1 X178.941 Y108.456 E.24177
G1 X179.48 Y108.455 E.01678
G1 X173.443 Y102.418 E.2655
G1 X173.443 Y101.878 E.01678
G1 X180.02 Y108.455 E.28923
G1 X180.56 Y108.455 E.01678
G1 X173.442 Y101.338 E.31296
G1 X173.442 Y100.799 E.01678
G1 X181.099 Y108.455 E.33669
G1 X181.639 Y108.455 E.01678
G1 X173.324 Y100.141 E.36561
G1 X173.864 Y100.141 E.01678
G1 X182.178 Y108.455 E.36561
G1 X182.718 Y108.455 E.01678
G1 X174.404 Y100.141 E.3656
G1 X174.943 Y100.141 E.01678
G1 X183.257 Y108.455 E.3656
G1 X183.797 Y108.455 E.01678
G1 X175.483 Y100.141 E.36559
G1 X176.023 Y100.141 E.01678
G1 X184.337 Y108.455 E.36559
G1 X184.59 Y108.455 E.00788
G2 X184.748 Y108.327 I-.007 J-.17 E.00679
G1 X176.562 Y100.141 E.35996
G1 X177.102 Y100.141 E.01678
G1 X184.756 Y107.796 E.33659
G1 X184.756 Y107.256 E.01678
G1 X177.642 Y100.141 E.31286
G1 X178.181 Y100.141 E.01678
G1 X184.756 Y106.716 E.28913
G1 X184.756 Y106.177 E.01678
G1 X178.721 Y100.141 E.26539
G1 X179.261 Y100.141 E.01678
G1 X184.756 Y105.637 E.24166
G1 X184.756 Y105.097 E.01678
G1 X179.801 Y100.141 E.21793
G1 X180.34 Y100.142 E.01678
G1 X184.756 Y104.558 E.1942
G1 X184.756 Y104.018 E.01678
G1 X180.88 Y100.142 E.17046
G1 X181.42 Y100.142 E.01678
G1 X184.756 Y103.478 E.14673
G1 X184.756 Y102.939 E.01678
G1 X181.959 Y100.142 E.123
G1 X182.499 Y100.142 E.01678
G1 X184.756 Y102.399 E.09927
G1 X184.756 Y101.86 E.01678
G1 X183.039 Y100.142 E.07554
G1 X183.578 Y100.142 E.01678
G1 X184.756 Y101.32 E.0518
G1 X184.756 Y100.78 E.01678
G1 X184.118 Y100.142 E.02807
G1 X184.586 Y100.142 E.01456
G3 X184.691 Y100.175 I-.001 J.185 E.00347
G1 X184.926 Y100.41 E.01033
; WIPE_START
G1 X184.691 Y100.175 E-.12629
G1 X184.586 Y100.142 E-.0418
G1 X184.118 Y100.142 E-.17792
G1 X184.756 Y100.78 E-.34306
G1 X184.756 Y100.967 E-.07093
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.322 Y102.693 Z2.2 F42000
G1 X152.596 Y108.434 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556697
G1 F7006.937
M204 S6000
G1 X152.65 Y108.931 E.02092
; LINE_WIDTH: 0.513585
G1 F7648.763
G1 X152.668 Y109.073 E.00551
; LINE_WIDTH: 0.477033
G1 F8292.774
G1 X152.686 Y109.216 E.00508
; LINE_WIDTH: 0.440482
G1 F9055.204
G1 X152.705 Y109.358 E.00465
; LINE_WIDTH: 0.400991
G1 F10053.882
G1 X152.726 Y109.501 E.00422
; LINE_WIDTH: 0.358572
G1 F11404.963
G1 X152.747 Y109.644 E.00372
; LINE_WIDTH: 0.316154
G1 F13175.548
G1 X152.768 Y109.787 E.00322
; LINE_WIDTH: 0.27069
G1 F15000
G1 X152.793 Y109.931 E.00271
; LINE_WIDTH: 0.222149
G1 X152.817 Y110.075 E.00213
; LINE_WIDTH: 0.173609
G1 X152.841 Y110.219 E.00156
; LINE_WIDTH: 0.136237
G1 X152.857 Y110.302 E.00064
; LINE_WIDTH: 0.11003
G1 X152.872 Y110.385 E.00046
; OBJECT_ID: 6
; WIPE_START
G1 X152.857 Y110.302 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X160.487 Y110.128 Z2.2 F42000
G1 X219.315 Y108.79 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.202 Y108.79 E.00377
G1 X219.118 Y109.037 E.00866
G1 X218.665 Y108.655 E.01967
G3 X218.51 Y108.317 I.352 J-.365 E.0126
G1 X218.509 Y100.933 E.24497
G2 X197.491 Y104.489 I-10.206 J3.571 E1.00559
G1 X197.491 Y107.948 E.11473
G1 X197.264 Y107.964 E.00755
G3 X197.109 Y106.088 I14.819 J-2.165 E.06246
G3 X197.144 Y103.613 I31.437 J-.79 E.08215
G3 X208.805 Y93.321 I11.158 J.891 E.57036
G3 X217.979 Y98.882 I-.538 J11.235 E.37096
G1 X218.492 Y99.808 E.0351
G1 X230.019 Y99.809 E.38238
G3 X230.49 Y100.289 I-.024 J.494 E.02452
G1 X230.49 Y108.318 E.26633
G3 X230.009 Y108.788 I-.494 J-.024 E.02453
G1 X219.375 Y108.79 E.35275
M204 S10000
G1 X219.549 Y109.197 F42000
G1 F8843.478
M204 S6000
G1 X219.494 Y109.197 E.00185
G3 X218.898 Y110.81 I-15.238 J-4.71 E.05708
G1 X218.702 Y110.77 E.00662
G1 X218.702 Y109.219 E.05148
G3 X218.25 Y108.791 I.998 J-1.507 E.02073
G3 X218.103 Y108.333 I.799 J-.509 E.01613
G1 X218.102 Y101.009 E.24296
G2 X197.898 Y104.493 I-9.8 J3.493 E.96574
G1 X197.898 Y110.768 E.20817
G1 X197.704 Y110.809 E.00656
G3 X196.702 Y106.093 I10.646 J-4.727 E.16113
G3 X196.739 Y103.581 I31.819 J-.794 E.08336
G3 X208.819 Y92.914 I11.564 J.923 E.59097
G3 X218.331 Y98.678 I-.553 J11.644 E.3846
G1 X218.732 Y99.401 E.02741
G1 X230.035 Y99.402 E.37495
G3 X230.897 Y100.269 I-.041 J.902 E.04455
G1 X230.897 Y108.334 E.26752
G3 X230.029 Y109.195 I-.902 J-.041 E.04456
G1 X219.609 Y109.197 E.34565
M204 S250
G1 X219.775 Y109.589 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X218.31 Y112.695 I-12.292 J-3.898 E.10584
G1 X218.31 Y109.401 E.10121
G3 X217.711 Y108.349 I.808 J-1.157 E.03846
G1 X217.71 Y101.083 E.22325
G2 X198.29 Y104.497 I-9.409 J3.419 E.85903
G1 X198.29 Y112.695 E.2519
G3 X196.31 Y106.097 I10.202 J-6.658 E.2146
G3 X196.348 Y103.549 I32.186 J-.798 E.0783
G3 X208.833 Y92.522 I11.955 J.954 E.5658
G3 X218.963 Y99.009 I-.541 J11.998 E.38712
G1 X230.05 Y99.01 E.34069
G3 X231.289 Y100.25 I-.057 J1.295 E.05913
G1 X231.289 Y108.349 E.24887
G3 X230.048 Y109.588 I-1.295 J-.057 E.05914
G1 X219.835 Y109.589 E.31383
M204 S10000
G1 X219.048 Y109.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308108
G1 F13575.296
M204 S6000
G1 X219.075 Y109.267 E.00362
M204 S10000
G1 X219.048 Y109.433 F42000
; LINE_WIDTH: 0.267117
G1 F15000
M204 S6000
G1 X219.021 Y109.598 E.00306
; LINE_WIDTH: 0.226126
G1 X218.994 Y109.764 E.0025
; LINE_WIDTH: 0.185136
G1 X218.966 Y109.929 E.00194
; LINE_WIDTH: 0.147697
M73 P69 R8
G1 X218.947 Y110.035 E.00092
; LINE_WIDTH: 0.113846
G1 X218.928 Y110.14 E.00062
M204 S10000
G1 X218.757 Y110.982 F42000
; LINE_WIDTH: 0.454293
G1 F8751.195
M204 S6000
G1 X218.544 Y111.935 E.03274
; WIPE_START
G1 X218.757 Y110.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X218.674 Y108.185 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42449
G1 F9434.704
M204 S6000
G2 X218.961 Y108.462 I1.987 J-1.769 E.01242
G1 X219.485 Y108.456 E.0163
G1 X218.843 Y107.815 E.02821
G1 X218.843 Y107.275 E.01678
G1 X220.025 Y108.456 E.05194
G1 X220.564 Y108.456 E.01678
G1 X218.843 Y106.735 E.07567
G1 X218.843 Y106.196 E.01678
G1 X221.104 Y108.456 E.0994
G1 X221.643 Y108.456 E.01678
G1 X218.843 Y105.656 E.12313
G1 X218.843 Y105.116 E.01678
G1 X222.183 Y108.456 E.14686
G1 X222.722 Y108.456 E.01678
G1 X218.843 Y104.577 E.17059
G1 X218.843 Y104.037 E.01678
G1 X223.262 Y108.456 E.19432
G1 X223.802 Y108.456 E.01678
G1 X218.843 Y103.497 E.21805
G1 X218.843 Y102.957 E.01678
G1 X224.341 Y108.456 E.24178
G1 X224.881 Y108.456 E.01678
G1 X218.843 Y102.418 E.26551
G1 X218.842 Y101.878 E.01678
G1 X225.42 Y108.456 E.28924
G1 X225.96 Y108.456 E.01678
G1 X218.842 Y101.338 E.31297
G1 X218.842 Y100.87 E.01456
G1 X218.797 Y100.753 E.0039
G1 X226.499 Y108.456 E.3387
G1 X227.039 Y108.455 E.01678
G1 X218.724 Y100.141 E.36561
G1 X219.264 Y100.141 E.01678
G1 X227.578 Y108.455 E.3656
G1 X228.118 Y108.455 E.01678
G1 X219.804 Y100.141 E.36559
G1 X220.343 Y100.141 E.01678
G1 X228.658 Y108.455 E.36559
G1 X229.197 Y108.455 E.01678
G1 X220.883 Y100.141 E.36558
G1 X221.423 Y100.141 E.01678
G1 X229.737 Y108.455 E.36558
G1 X229.99 Y108.455 E.00786
G2 X230.149 Y108.328 I-.007 J-.171 E.00679
G1 X221.963 Y100.141 E.35996
G1 X222.502 Y100.141 E.01678
G1 X230.156 Y107.796 E.33658
G1 X230.156 Y107.256 E.01678
G1 X223.042 Y100.142 E.31284
G1 X223.582 Y100.142 E.01678
G1 X230.156 Y106.716 E.28911
G1 X230.156 Y106.177 E.01678
G1 X224.121 Y100.142 E.26538
G1 X224.661 Y100.142 E.01678
G1 X230.156 Y105.637 E.24165
G1 X230.156 Y105.098 E.01678
G1 X225.201 Y100.142 E.21792
G1 X225.74 Y100.142 E.01678
G1 X230.156 Y104.558 E.19419
G1 X230.156 Y104.018 E.01678
G1 X226.28 Y100.142 E.17046
G1 X226.82 Y100.142 E.01678
G1 X230.156 Y103.479 E.14673
G1 X230.156 Y102.939 E.01678
G1 X227.359 Y100.142 E.123
G1 X227.899 Y100.142 E.01678
G1 X230.156 Y102.399 E.09927
G1 X230.156 Y101.86 E.01678
G1 X228.439 Y100.142 E.07554
G1 X228.978 Y100.142 E.01678
G1 X230.156 Y101.32 E.0518
G1 X230.156 Y100.781 E.01678
G1 X229.518 Y100.142 E.02807
G1 X229.988 Y100.142 E.01461
G3 X230.088 Y100.173 I-.003 J.189 E.00331
G1 X230.326 Y100.411 E.01045
; WIPE_START
G1 X230.088 Y100.173 E-.12773
G1 X229.988 Y100.142 E-.03997
G1 X229.518 Y100.142 E-.1785
G1 X230.156 Y100.781 E-.3431
G1 X230.156 Y100.967 E-.07071
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X222.702 Y102.603 Z2.2 F42000
G1 X197.395 Y108.159 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56583
G1 F6884.56
M204 S6000
G1 X197.427 Y108.451 E.01253
; LINE_WIDTH: 0.531088
G1 F7374.514
G1 X197.459 Y108.743 E.01169
; LINE_WIDTH: 0.494312
G1 F7975.329
G1 X197.478 Y108.892 E.00552
; LINE_WIDTH: 0.455536
G1 F8724.82
G1 X197.498 Y109.04 E.00504
; LINE_WIDTH: 0.41676
G1 F9629.79
G1 X197.517 Y109.189 E.00457
; LINE_WIDTH: 0.374831
G1 F10846.307
G1 X197.54 Y109.339 E.00409
; LINE_WIDTH: 0.329771
G1 F12550.086
G1 X197.562 Y109.488 E.00353
; LINE_WIDTH: 0.284711
G1 F14888.89
G1 X197.585 Y109.638 E.00298
; LINE_WIDTH: 0.242892
G1 F15000
G1 X197.604 Y109.751 E.00187
; LINE_WIDTH: 0.204276
G1 X197.623 Y109.864 E.00151
; LINE_WIDTH: 0.165659
G1 X197.643 Y109.976 E.00114
; LINE_WIDTH: 0.127043
G1 X197.662 Y110.089 E.00078
; LINE_WIDTH: 0.102319
G1 X197.672 Y110.144 E.00027
; OBJECT_ID: 9
; WIPE_START
G1 X197.662 Y110.089 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X192.542 Y115.749 Z2.2 F42000
G1 X137.415 Y176.69 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.302 Y176.69 E.00377
G1 X137.218 Y176.937 E.00866
G1 X136.765 Y176.555 E.01966
G3 X136.61 Y176.218 I.352 J-.365 E.0126
G1 X136.609 Y168.832 E.24497
G2 X115.591 Y172.389 I-10.204 J3.579 E1.0052
G1 X115.591 Y175.848 E.11473
G1 X115.364 Y175.864 E.00755
G3 X115.209 Y173.989 I14.827 J-2.166 E.06245
G3 X115.254 Y171.412 I30.928 J-.744 E.0855
G3 X126.905 Y161.221 I11.152 J.993 E.56694
G3 X136.079 Y166.783 I-.538 J11.235 E.37097
G1 X136.592 Y167.708 E.03508
G1 X148.158 Y167.712 E.38366
G3 X148.59 Y168.189 I-.072 J.5 E.02316
G1 X148.59 Y176.218 E.26633
G3 X148.109 Y176.688 I-.494 J-.024 E.02453
G1 X137.475 Y176.69 E.35275
M204 S10000
G1 X137.649 Y177.097 F42000
G1 F8843.478
M204 S6000
G1 X137.594 Y177.097 E.00185
G3 X136.998 Y178.71 I-16.443 J-5.155 E.05708
G1 X136.802 Y178.67 E.00662
G1 X136.802 Y177.119 E.05147
G3 X136.351 Y176.691 I.998 J-1.507 E.02073
G3 X136.203 Y176.233 I.799 J-.51 E.01614
G1 X136.202 Y168.909 E.24296
G2 X115.998 Y172.393 I-9.799 J3.501 E.96537
G1 X115.998 Y178.668 E.20817
G1 X115.804 Y178.709 E.00656
G3 X114.802 Y173.992 I10.647 J-4.728 E.16113
G3 X114.849 Y171.372 I31.219 J-.747 E.08697
G3 X126.919 Y160.814 I11.557 J1.034 E.58727
G3 X136.432 Y166.578 I-.553 J11.644 E.38461
G1 X136.832 Y167.301 E.0274
G1 X148.135 Y167.302 E.37495
G3 X148.997 Y168.169 I-.041 J.902 E.04455
G1 X148.997 Y176.234 E.26752
G3 X148.129 Y177.095 I-.902 J-.041 E.04455
G1 X137.709 Y177.097 E.34564
M204 S250
G1 X137.875 Y177.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X136.41 Y180.595 I-11.734 J-3.635 E.10587
G1 X136.41 Y177.301 E.10121
G3 X135.811 Y176.248 I.809 J-1.157 E.03846
G1 X135.81 Y168.983 E.22325
G2 X116.39 Y172.397 I-9.408 J3.426 E.8587
G1 X116.39 Y180.595 E.2519
G3 X114.673 Y176.488 I10.423 J-6.77 E.13751
G3 X114.41 Y173.997 I13.554 J-2.691 E.07709
G3 X114.459 Y171.333 I31.545 J-.749 E.08188
G3 X126.933 Y160.422 I11.947 J1.073 E.56213
G3 X137.063 Y166.909 I-.541 J11.998 E.38712
G1 X148.15 Y166.91 E.34069
G3 X149.389 Y168.15 I-.057 J1.295 E.05913
G1 X149.389 Y176.249 E.24887
G3 X148.148 Y177.488 I-1.295 J-.057 E.05913
G1 X137.935 Y177.489 E.31384
M204 S10000
G1 X137.148 Y177.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308115
G1 F13574.922
M204 S6000
G1 X137.175 Y177.167 E.00362
M204 S10000
G1 X137.148 Y177.333 F42000
; LINE_WIDTH: 0.26714
G1 F15000
M204 S6000
G1 X137.121 Y177.498 E.00306
; LINE_WIDTH: 0.226164
G1 X137.094 Y177.664 E.0025
; LINE_WIDTH: 0.185188
G1 X137.067 Y177.829 E.00194
; LINE_WIDTH: 0.147745
G1 X137.047 Y177.935 E.00092
; LINE_WIDTH: 0.113862
G1 X137.028 Y178.04 E.00062
M204 S10000
G1 X136.857 Y178.882 F42000
; LINE_WIDTH: 0.454298
G1 F8751.092
M204 S6000
G1 X136.645 Y179.835 E.03274
; WIPE_START
G1 X136.857 Y178.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.774 Y176.085 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42449
G1 F9434.704
M204 S6000
G2 X137.061 Y176.362 I1.987 J-1.769 E.01242
G1 X137.585 Y176.356 E.0163
G1 X136.943 Y175.715 E.02821
G1 X136.943 Y175.175 E.01678
G1 X138.125 Y176.356 E.05194
G1 X138.664 Y176.356 E.01678
G1 X136.943 Y174.635 E.07567
G1 X136.943 Y174.096 E.01678
G1 X139.204 Y176.356 E.0994
G1 X139.743 Y176.356 E.01678
G1 X136.943 Y173.556 E.12313
G1 X136.943 Y173.016 E.01678
G1 X140.283 Y176.356 E.14686
G1 X140.822 Y176.356 E.01678
G1 X136.943 Y172.477 E.17059
G1 X136.943 Y171.937 E.01678
G1 X141.362 Y176.356 E.19432
G1 X141.901 Y176.356 E.01678
G1 X136.943 Y171.397 E.21805
G1 X136.943 Y170.857 E.01678
G1 X142.441 Y176.356 E.24178
G1 X142.981 Y176.356 E.01678
G1 X136.943 Y170.318 E.26551
G1 X136.943 Y169.778 E.01678
G1 X143.52 Y176.356 E.28923
G1 X144.06 Y176.356 E.01678
G1 X136.942 Y169.238 E.31296
G1 X136.942 Y168.77 E.01457
G1 X136.897 Y168.653 E.00389
G1 X144.599 Y176.356 E.33869
G1 X145.139 Y176.355 E.01678
G1 X136.824 Y168.041 E.3656
G1 X137.364 Y168.041 E.01678
G1 X145.678 Y176.355 E.3656
G1 X146.218 Y176.355 E.01678
G1 X137.904 Y168.041 E.36559
G1 X138.443 Y168.041 E.01678
G1 X146.758 Y176.355 E.36559
G1 X147.297 Y176.355 E.01678
G1 X138.983 Y168.041 E.36558
G1 X139.523 Y168.041 E.01678
G1 X147.837 Y176.355 E.36558
G1 X148.084 Y176.355 E.00768
G2 X148.249 Y176.228 I-.019 J-.194 E.00684
G1 X140.062 Y168.041 E.35996
G1 X140.602 Y168.041 E.01678
G1 X148.256 Y175.696 E.33658
G1 X148.256 Y175.156 E.01678
G1 X141.142 Y168.042 E.31285
G1 X141.682 Y168.042 E.01678
G1 X148.256 Y174.617 E.28912
G1 X148.256 Y174.077 E.01678
G1 X142.221 Y168.042 E.26538
G1 X142.761 Y168.042 E.01678
G1 X148.256 Y173.537 E.24165
G1 X148.256 Y172.998 E.01678
G1 X143.301 Y168.042 E.21792
G1 X143.84 Y168.042 E.01678
G1 X148.256 Y172.458 E.19419
G1 X148.256 Y171.918 E.01678
G1 X144.38 Y168.042 E.17046
G1 X144.92 Y168.042 E.01678
G1 X148.256 Y171.379 E.14673
G1 X148.256 Y170.839 E.01678
G1 X145.459 Y168.042 E.123
G1 X145.999 Y168.042 E.01678
G1 X148.256 Y170.3 E.09927
G1 X148.256 Y169.76 E.01678
G1 X146.539 Y168.042 E.07554
G1 X147.078 Y168.042 E.01678
G1 X148.256 Y169.22 E.05181
G1 X148.256 Y168.681 E.01678
G1 X147.618 Y168.042 E.02807
G1 X148.088 Y168.042 E.0146
G3 X148.188 Y168.073 I-.003 J.189 E.00332
G1 X148.426 Y168.311 E.01045
; WIPE_START
G1 X148.188 Y168.073 E-.12776
G1 X148.088 Y168.042 E-.04001
G1 X147.618 Y168.042 E-.17845
G1 X148.256 Y168.681 E-.34311
G1 X148.256 Y168.867 E-.07068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.802 Y170.503 Z2.2 F42000
G1 X115.495 Y176.059 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565815
G1 F6884.753
M204 S6000
G1 X115.527 Y176.351 E.01253
; LINE_WIDTH: 0.531044
G1 F7375.175
G1 X115.559 Y176.643 E.0117
; LINE_WIDTH: 0.494245
G1 F7976.512
G1 X115.578 Y176.792 E.00552
; LINE_WIDTH: 0.455455
G1 F8726.53
G1 X115.598 Y176.941 E.00504
; LINE_WIDTH: 0.416665
G1 F9632.233
G1 X115.617 Y177.09 E.00457
; LINE_WIDTH: 0.374782
G1 F10847.9
G1 X115.64 Y177.239 E.00408
; LINE_WIDTH: 0.329785
G1 F12549.488
G1 X115.662 Y177.388 E.00353
; LINE_WIDTH: 0.284788
G1 F14884.205
G1 X115.685 Y177.537 E.00298
; LINE_WIDTH: 0.242985
G1 F15000
G1 X115.704 Y177.65 E.00187
; LINE_WIDTH: 0.204355
G1 X115.723 Y177.763 E.00151
; LINE_WIDTH: 0.165724
G1 X115.743 Y177.876 E.00115
; LINE_WIDTH: 0.127094
G1 X115.762 Y177.989 E.00079
; LINE_WIDTH: 0.102349
G1 X115.772 Y178.044 E.00027
; OBJECT_ID: 8
; WIPE_START
G1 X115.762 Y177.989 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X108.141 Y177.571 Z2.2 F42000
G1 X92.078 Y176.689 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.967 Y176.689 E.00368
G1 X91.873 Y176.983 E.01023
G1 X91.365 Y176.555 E.02206
G3 X91.21 Y176.207 I.349 J-.363 E.01293
G1 X91.209 Y168.583 E.25291
G2 X70.791 Y172.089 I-9.906 J3.52 E.976
G1 X70.791 Y176.121 E.13376
G1 X70.568 Y176.141 E.00742
G3 X70.409 Y174.288 I11.049 J-1.882 E.06174
G3 X70.418 Y171.664 I65.936 J-1.09 E.08706
G1 X70.438 Y171.329 E.01112
G3 X81.458 Y161.21 I10.877 J.785 E.54692
G3 X90.8 Y166.774 I-.162 J10.898 E.3776
G1 X91.299 Y167.708 E.03513
G1 X102.709 Y167.709 E.37848
G3 X103.19 Y168.189 I-.013 J.494 E.02486
G1 X103.19 Y176.218 E.26633
G3 X102.709 Y176.688 I-.497 J-.027 E.02449
G1 X92.138 Y176.689 E.35066
M204 S10000
G1 X92.319 Y177.096 F42000
G1 F8843.478
M204 S6000
G1 X92.264 Y177.096 E.00181
G3 X91.594 Y178.948 I-16.7 J-4.996 E.06535
G1 X91.402 Y178.906 E.00653
G1 X91.402 Y177.118 E.0593
G3 X90.95 Y176.691 I.999 J-1.507 E.02073
G3 X90.803 Y176.227 I.785 J-.505 E.01633
G1 X90.802 Y168.661 E.25099
G2 X71.198 Y172.093 I-9.5 J3.441 E.93618
G1 X71.198 Y178.905 E.22598
G1 X71.004 Y178.946 E.00658
G3 X70.002 Y174.293 I10.362 J-4.665 E.15906
G3 X70.011 Y171.648 I66.389 J-1.094 E.08773
G1 X70.032 Y171.305 E.0114
G3 X81.46 Y160.803 I11.284 J.81 E.56736
G3 X91.155 Y166.574 I-.164 J11.305 E.39186
G1 X91.543 Y167.3 E.02731
G1 X102.729 Y167.302 E.37105
G3 X103.597 Y168.169 I-.034 J.902 E.04475
G1 X103.597 Y176.234 E.26751
G3 X102.729 Y177.095 I-.909 J-.048 E.04447
G1 X92.379 Y177.096 E.34334
M204 S250
G1 X92.551 Y177.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X91.01 Y180.804 I-12.03 J-3.575 E.11273
G1 X91.01 Y177.301 E.10764
G3 X90.411 Y176.246 I.808 J-1.156 E.03852
G1 X90.41 Y168.736 E.23078
G2 X71.59 Y172.096 I-9.109 J3.365 E.83167
G1 X71.59 Y180.807 E.26766
G3 X69.61 Y174.296 I9.911 J-6.571 E.21207
G3 X69.619 Y171.633 I66.876 J-1.098 E.08186
G1 X69.64 Y171.282 E.0108
G3 X81.461 Y160.411 I11.675 J.834 E.54379
G3 X91.778 Y166.908 I-.194 J11.748 E.39389
G1 X102.748 Y166.91 E.33708
G3 X103.989 Y168.15 I-.055 J1.295 E.0592
G1 X103.989 Y176.249 E.24886
G3 X102.748 Y177.487 I-1.306 J-.068 E.05902
G1 X92.611 Y177.488 E.31151
M204 S10000
G1 X91.773 Y177.414 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.312708
G1 F13343.81
M204 S6000
G1 X91.739 Y177.635 E.0049
; LINE_WIDTH: 0.26449
G1 F15000
G1 X91.704 Y177.855 E.00403
; LINE_WIDTH: 0.216484
G1 X91.679 Y178 E.00207
; LINE_WIDTH: 0.168659
G1 X91.653 Y178.144 E.0015
; LINE_WIDTH: 0.120833
G1 X91.628 Y178.288 E.00093
M204 S10000
G1 X91.773 Y177.414 F42000
; LINE_WIDTH: 0.360927
G1 F11320.517
M204 S6000
G1 X91.807 Y177.194 E.00578
; WIPE_START
G1 X91.773 Y177.414 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.374 Y176.084 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42449
G1 F9434.704
M204 S6000
G2 X91.709 Y176.403 I2.254 J-2.036 E.01439
G1 X91.724 Y176.356 E.00153
G1 X92.185 Y176.356 E.01434
G1 X91.543 Y175.714 E.02821
G1 X91.543 Y175.175 E.01678
G1 X92.725 Y176.356 E.05194
G1 X93.264 Y176.356 E.01678
G1 X91.543 Y174.635 E.07567
G1 X91.543 Y174.095 E.01678
G1 X93.804 Y176.356 E.0994
G1 X94.343 Y176.356 E.01678
G1 X91.543 Y173.556 E.12313
G1 X91.543 Y173.016 E.01678
G1 X94.883 Y176.356 E.14686
G1 X95.422 Y176.356 E.01678
G1 X91.543 Y172.476 E.17059
G1 X91.543 Y171.937 E.01678
G1 X95.962 Y176.356 E.19432
G1 X96.502 Y176.356 E.01678
G1 X91.543 Y171.397 E.21805
G1 X91.543 Y170.857 E.01678
G1 X97.041 Y176.356 E.24178
G1 X97.581 Y176.355 E.01678
G1 X91.543 Y170.317 E.26551
G1 X91.543 Y169.778 E.01678
G1 X98.12 Y176.355 E.28924
G1 X98.66 Y176.355 E.01678
G1 X91.542 Y169.238 E.31296
G1 X91.542 Y168.698 E.01678
G1 X99.199 Y176.355 E.33669
G1 X99.739 Y176.355 E.01678
G1 X91.424 Y168.041 E.36561
G1 X91.964 Y168.041 E.01678
G1 X100.278 Y176.355 E.3656
G1 X100.818 Y176.355 E.01678
G1 X92.504 Y168.041 E.36559
G1 X93.043 Y168.041 E.01678
G1 X101.358 Y176.355 E.36559
G1 X101.897 Y176.355 E.01678
G1 X93.583 Y168.041 E.36558
G1 X94.123 Y168.041 E.01678
G1 X102.437 Y176.355 E.36558
G1 X102.69 Y176.355 E.00787
G2 X102.848 Y176.227 I-.006 J-.17 E.00679
G1 X94.663 Y168.041 E.35995
G1 X95.202 Y168.041 E.01678
G1 X102.856 Y175.695 E.33658
G1 X102.856 Y175.156 E.01678
G1 X95.742 Y168.041 E.31284
G1 X96.282 Y168.041 E.01678
G1 X102.856 Y174.616 E.28911
G1 X102.856 Y174.077 E.01678
G1 X96.821 Y168.041 E.26538
G1 X97.361 Y168.041 E.01678
G1 X102.856 Y173.537 E.24165
G1 X102.856 Y172.997 E.01678
G1 X97.901 Y168.041 E.21792
G1 X98.44 Y168.042 E.01678
G1 X102.856 Y172.458 E.19419
G1 X102.856 Y171.918 E.01678
G1 X98.98 Y168.042 E.17046
G1 X99.52 Y168.042 E.01678
G1 X102.856 Y171.378 E.14673
G1 X102.856 Y170.839 E.01678
G1 X100.059 Y168.042 E.123
G1 X100.599 Y168.042 E.01678
G1 X102.856 Y170.299 E.09927
G1 X102.856 Y169.76 E.01678
M73 P70 R8
G1 X101.139 Y168.042 E.07553
G1 X101.678 Y168.042 E.01678
G1 X102.856 Y169.22 E.0518
G1 X102.856 Y168.68 E.01678
G1 X102.218 Y168.042 E.02807
G1 X102.681 Y168.042 E.01441
G3 X102.789 Y168.074 I.002 J.19 E.00354
G1 X103.026 Y168.31 E.01041
; WIPE_START
G1 X102.789 Y168.074 E-.12725
G1 X102.681 Y168.042 E-.04267
G1 X102.218 Y168.042 E-.17612
G1 X102.856 Y168.68 E-.34309
G1 X102.856 Y168.867 E-.07087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.422 Y170.593 Z2.2 F42000
G1 X70.696 Y176.334 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556645
G1 F7007.643
M204 S6000
G1 X70.75 Y176.831 E.02093
; LINE_WIDTH: 0.513569
G1 F7649.01
G1 X70.768 Y176.973 E.00549
; LINE_WIDTH: 0.477108
G1 F8291.352
G1 X70.786 Y177.115 E.00507
; LINE_WIDTH: 0.440646
G1 F9051.467
G1 X70.805 Y177.257 E.00464
; LINE_WIDTH: 0.401147
G1 F10049.5
G1 X70.826 Y177.401 E.00423
; LINE_WIDTH: 0.358641
G1 F11402.493
G1 X70.847 Y177.544 E.00373
; LINE_WIDTH: 0.316134
G1 F13176.484
G1 X70.868 Y177.687 E.00323
; LINE_WIDTH: 0.270636
G1 F15000
G1 X70.893 Y177.831 E.00271
; LINE_WIDTH: 0.222107
G1 X70.917 Y177.975 E.00213
; LINE_WIDTH: 0.173578
G1 X70.941 Y178.119 E.00156
; LINE_WIDTH: 0.136207
G1 X70.957 Y178.202 E.00064
; LINE_WIDTH: 0.110019
G1 X70.972 Y178.285 E.00046
; OBJECT_ID: 7
; WIPE_START
G1 X70.957 Y178.202 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X63.34 Y177.715 Z2.2 F42000
G1 X47.314 Y176.691 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X47.206 Y176.691 E.00355
G1 X47.108 Y177.014 E.0112
G1 X46.565 Y176.556 E.02357
G3 X46.41 Y176.218 I.352 J-.365 E.0126
G1 X46.409 Y168.419 E.25873
G2 X26.391 Y171.89 I-9.706 J3.486 E.95627
G1 X26.391 Y176.302 E.14636
G1 X26.168 Y176.322 E.00743
G3 X26.009 Y174.49 I10.797 J-1.857 E.06107
G3 X26.018 Y171.478 I76.371 J-1.29 E.0999
G3 X37.093 Y161.218 I10.685 J.426 E.55603
G3 X46.082 Y166.775 I-.423 J10.732 E.3665
G1 X46.569 Y167.709 E.03494
G1 X57.919 Y167.71 E.37651
G3 X58.39 Y168.19 I-.027 J.497 E.02449
G1 X58.39 Y176.219 E.26632
G3 X57.909 Y176.689 I-.497 J-.027 E.0245
G1 X47.374 Y176.691 E.34949
M204 S10000
G1 X47.561 Y177.098 F42000
G1 F8843.478
M204 S6000
G1 X47.508 Y177.098 E.00174
G3 X46.797 Y179.106 I-12.923 J-3.445 E.07076
G1 X46.602 Y179.066 E.0066
G1 X46.602 Y177.12 E.06456
G3 X46.15 Y176.692 I.998 J-1.507 E.02073
G3 X46.003 Y176.234 I.799 J-.51 E.01614
G1 X46.002 Y168.497 E.25665
G2 X26.798 Y171.894 I-9.3 J3.406 E.91648
G1 X26.798 Y179.068 E.23799
G1 X26.603 Y179.108 E.00661
G3 X25.602 Y174.493 I10.222 J-4.632 E.15782
G3 X25.611 Y171.462 I76.879 J-1.294 E.10055
G3 X37.104 Y160.811 I11.092 J.442 E.57706
G3 X46.439 Y166.579 I-.434 J11.141 E.3806
G1 X46.816 Y167.302 E.02702
G1 X57.935 Y167.303 E.36885
G3 X58.797 Y168.17 I-.048 J.909 E.04447
G1 X58.797 Y176.235 E.26751
G3 X57.929 Y177.097 I-.909 J-.048 E.04448
G1 X47.62 Y177.098 E.34196
M204 S250
G1 X47.798 Y177.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X46.21 Y180.944 I-11.278 J-3.093 E.11735
G1 X46.21 Y177.302 E.11192
G3 X45.611 Y176.249 I.808 J-1.157 E.03846
G1 X45.61 Y168.573 E.23588
G2 X27.19 Y171.898 I-8.909 J3.329 E.81345
G1 X27.19 Y180.944 E.27798
G3 X25.21 Y174.497 I9.53 J-6.455 E.21031
G3 X25.219 Y171.447 I77.353 J-1.298 E.09374
G3 X37.114 Y160.419 I11.484 J.457 E.5533
G3 X47.054 Y166.91 I-.421 J11.501 E.38326
G1 X57.95 Y166.911 E.33483
G3 X59.189 Y168.151 I-.068 J1.306 E.05902
G1 X59.189 Y176.25 E.24886
G3 X57.948 Y177.489 I-1.306 J-.068 E.05902
G1 X47.858 Y177.49 E.31004
M204 S10000
G1 X46.997 Y177.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362653
G1 F11259.407
M204 S6000
G1 X46.967 Y177.624 E.00542
; LINE_WIDTH: 0.323205
G1 F12844.104
G1 X46.936 Y177.83 E.00475
; LINE_WIDTH: 0.280785
G1 F15000
G1 X46.913 Y177.965 E.00265
; LINE_WIDTH: 0.235399
G1 X46.891 Y178.1 E.00215
; LINE_WIDTH: 0.190013
G1 X46.868 Y178.235 E.00164
; LINE_WIDTH: 0.149712
G1 X46.848 Y178.342 E.00095
; LINE_WIDTH: 0.114518
G1 X46.828 Y178.449 E.00064
M204 S10000
M73 P70 R7
G1 X46.997 Y177.418 F42000
; LINE_WIDTH: 0.402101
G1 F10022.8
M204 S6000
G1 X47.028 Y177.213 E.00609
; WIPE_START
G1 X46.997 Y177.418 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X46.576 Y176.088 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4245
G1 F9434.457
M204 S6000
G2 X46.938 Y176.429 I2.4 J-2.188 E.01547
G1 X46.96 Y176.357 E.00232
G1 X47.385 Y176.357 E.01322
G1 X46.746 Y175.718 E.02811
G1 X46.745 Y175.178 E.01679
G1 X47.924 Y176.357 E.05185
G1 X48.464 Y176.357 E.01678
G1 X46.745 Y174.638 E.07558
G1 X46.745 Y174.099 E.01679
G1 X49.003 Y176.357 E.09932
G1 X49.543 Y176.357 E.01678
G1 X46.745 Y173.559 E.12306
G1 X46.744 Y173.019 E.01679
G1 X50.083 Y176.357 E.1468
G1 X50.622 Y176.357 E.01678
G1 X46.744 Y172.479 E.17053
G1 X46.744 Y171.939 E.01679
G1 X51.162 Y176.357 E.19427
G1 X51.701 Y176.357 E.01678
G1 X46.744 Y171.399 E.21801
G1 X46.743 Y170.859 E.01679
G1 X52.241 Y176.357 E.24174
G1 X52.78 Y176.357 E.01678
G1 X46.743 Y170.32 E.26548
G1 X46.743 Y169.78 E.01679
G1 X53.32 Y176.357 E.28922
G1 X53.86 Y176.357 E.01678
G1 X46.743 Y169.24 E.31295
G1 X46.742 Y168.7 E.01679
G1 X54.399 Y176.357 E.33669
G1 X54.939 Y176.357 E.01678
G1 X46.624 Y168.042 E.36562
G1 X47.164 Y168.042 E.01678
G1 X55.478 Y176.356 E.36561
G1 X56.018 Y176.356 E.01678
G1 X47.704 Y168.042 E.36561
G1 X48.243 Y168.042 E.01678
G1 X56.557 Y176.356 E.3656
G1 X57.097 Y176.356 E.01678
G1 X48.783 Y168.042 E.36559
G1 X49.323 Y168.042 E.01678
G1 X57.637 Y176.356 E.36559
G1 X57.885 Y176.356 E.00771
G2 X58.048 Y176.228 I-.003 J-.172 E.00694
G1 X49.862 Y168.042 E.35995
G1 X50.402 Y168.042 E.01678
G1 X58.056 Y175.697 E.33659
G1 X58.056 Y175.157 E.01678
G1 X50.942 Y168.043 E.31285
G1 X51.482 Y168.043 E.01678
G1 X58.056 Y174.618 E.28912
G1 X58.056 Y174.078 E.01678
G1 X52.021 Y168.043 E.26539
G1 X52.561 Y168.043 E.01678
G1 X58.056 Y173.538 E.24166
G1 X58.056 Y172.999 E.01678
G1 X53.101 Y168.043 E.21792
G1 X53.64 Y168.043 E.01678
G1 X58.056 Y172.459 E.19419
G1 X58.056 Y171.919 E.01678
G1 X54.18 Y168.043 E.17046
G1 X54.72 Y168.043 E.01678
G1 X58.056 Y171.38 E.14673
G1 X58.056 Y170.84 E.01678
G1 X55.259 Y168.043 E.123
G1 X55.799 Y168.043 E.01678
G1 X58.056 Y170.3 E.09926
G1 X58.056 Y169.761 E.01678
G1 X56.339 Y168.043 E.07553
G1 X56.878 Y168.043 E.01678
G1 X58.056 Y169.221 E.0518
G1 X58.056 Y168.682 E.01678
G1 X57.418 Y168.043 E.02807
G1 X57.886 Y168.043 E.01456
G3 X57.982 Y168.069 I.002 J.183 E.00313
G3 X58.226 Y168.312 I-2.13 J2.39 E.01069
; WIPE_START
G1 X57.982 Y168.069 E-.13064
G1 X57.886 Y168.043 E-.03774
G1 X57.418 Y168.043 E-.17788
G1 X58.056 Y168.682 E-.34301
G1 X58.056 Y168.868 E-.07074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X50.636 Y170.654 Z2.2 F42000
G1 X26.297 Y176.515 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.566022
G1 F6882.024
M204 S6000
G1 X26.34 Y176.927 E.01767
; LINE_WIDTH: 0.533897
G1 F7332.323
G1 X26.357 Y177.063 E.00548
; LINE_WIDTH: 0.499811
G1 F7879.353
G1 X26.374 Y177.199 E.0051
; LINE_WIDTH: 0.465724
G1 F8514.588
G1 X26.392 Y177.335 E.00472
; LINE_WIDTH: 0.428791
G1 F9329.547
G1 X26.411 Y177.473 E.00436
; LINE_WIDTH: 0.389013
G1 F10401.845
G1 X26.431 Y177.61 E.00391
; LINE_WIDTH: 0.349234
G1 F11752.644
G1 X26.451 Y177.747 E.00346
; LINE_WIDTH: 0.306692
G1 F13648.152
G1 X26.474 Y177.885 E.003
; LINE_WIDTH: 0.261396
G1 F15000
G1 X26.496 Y178.023 E.00248
; LINE_WIDTH: 0.2161
G1 X26.519 Y178.16 E.00197
; LINE_WIDTH: 0.169328
G1 X26.546 Y178.305 E.00151
; LINE_WIDTH: 0.121062
G1 X26.572 Y178.449 E.00093
; OBJECT_ID: 3
; WIPE_START
G1 X26.546 Y178.305 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X28.099 Y170.832 Z2.2 F42000
G1 X32.707 Y148.664 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X32.677 Y148.657 E.00103
G3 X26.391 Y141.01 I1.536 J-7.669 E.35554
G1 X26.391 Y106.99 E1.12848
G3 X34.19 Y99.191 I7.823 J.024 E.40607
G1 X87.71 Y99.191 E1.77533
G3 X95.509 Y106.99 I-.024 J7.823 E.40607
G1 X95.509 Y141.01 E1.12848
G3 X87.71 Y148.809 I-7.823 J-.024 E.40607
G1 X34.19 Y148.809 E1.77533
G3 X33.283 Y148.754 I.022 J-7.821 E.03019
G1 X32.766 Y148.673 E.01734
M204 S10000
G1 X32.77 Y148.262 F42000
G1 F8843.478
M204 S6000
G1 X32.756 Y148.258 E.0005
G3 X26.798 Y141.006 I1.456 J-7.27 E.33712
G1 X26.798 Y106.994 E1.12823
G3 X34.194 Y99.598 I7.416 J.019 E.38512
G1 X87.706 Y99.598 E1.77508
G3 X95.102 Y106.994 I-.019 J7.416 E.38512
G1 X95.102 Y141.006 E1.12822
G3 X87.706 Y148.402 I-7.416 J-.019 E.38512
G1 X34.194 Y148.402 E1.77508
G3 X33.33 Y148.35 I.017 J-7.414 E.02872
G1 X32.83 Y148.271 E.01681
M204 S250
G1 X32.833 Y147.873 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X27.19 Y141.002 I1.379 J-6.885 E.29584
G1 X27.19 Y106.998 E1.04485
G3 X34.198 Y99.99 I7.023 J.015 E.33805
G1 X87.702 Y99.99 E1.64403
G3 X94.71 Y106.998 I-.015 J7.023 E.33805
G1 X94.71 Y141.002 E1.04485
G3 X87.702 Y148.01 I-7.023 J-.015 E.33805
G1 X34.198 Y148.01 E1.64403
G3 X32.892 Y147.885 I.013 J-7.021 E.04038
; WIPE_START
M204 S6000
G1 X32.034 Y147.667 E-.33625
G1 X31.517 Y147.476 E-.20923
G1 X31.017 Y147.246 E-.20917
G1 X31.005 Y147.239 E-.00535
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.712 Y141.23 Z2.2 F42000
G1 X68.941 Y98.809 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y98.809 E.62195
G3 X95.891 Y107.01 I.008 J8.193 E.42743
G1 X95.891 Y140.99 E1.12718
G3 X87.69 Y149.191 I-8.195 J.006 E.4274
G1 X34.21 Y149.191 E1.77403
G3 X26.009 Y140.99 I-.006 J-8.195 E.4274
G1 X26.009 Y107.01 E1.12718
G3 X34.21 Y98.809 I8.195 J-.006 E.4274
G1 X52.959 Y98.809 E.62194
G1 X52.959 Y93.82 E.16551
G3 X53.48 Y93.309 I.495 J-.016 E.02719
G1 X68.435 Y93.309 E.4961
G3 X68.941 Y93.83 I.012 J.494 E.02702
G1 X68.941 Y98.749 E.16318
M204 S10000
G1 X69.348 Y98.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y98.402 E.60858
G3 X96.298 Y107.006 I.004 J8.6 E.44837
G1 X96.298 Y140.994 E1.12745
G3 X87.694 Y149.598 I-8.602 J.002 E.44833
G1 X34.206 Y149.598 E1.7743
G3 X25.602 Y140.994 I-.002 J-8.602 E.44834
G1 X25.602 Y107.006 E1.12745
G3 X34.206 Y98.402 I8.602 J-.002 E.44833
G1 X52.552 Y98.402 E.60858
G1 X52.552 Y93.812 E.15227
G3 X53.468 Y92.902 I.901 J-.009 E.04773
G1 X68.448 Y92.902 E.49692
G3 X69.348 Y93.818 I0 J.9 E.0474
G1 X69.348 Y98.342 E.15008
M204 S250
G1 X69.74 Y98.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y98.01 E.5518
G3 X96.69 Y107.002 I0 J8.992 E.43401
G1 X96.69 Y140.998 E1.0446
G3 X87.698 Y149.99 I-8.994 J-.002 E.43398
G1 X34.202 Y149.99 E1.64378
G3 X25.21 Y140.998 I.002 J-8.994 E.43398
G1 X25.21 Y107.002 E1.0446
G3 X34.202 Y98.01 I8.994 J.002 E.43398
G1 X52.16 Y98.01 E.5518
G1 X52.16 Y93.804 E.12923
G3 X53.456 Y92.51 I1.293 J-.001 E.06255
G1 X68.46 Y92.51 E.46104
G3 X69.74 Y93.806 I-.013 J1.292 E.0621
G1 X69.74 Y97.95 E.12733
; WIPE_START
M204 S6000
G1 X71.74 Y97.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.996 Y96.49 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5192
G1 F7558.58
M204 S6000
G1 X66.234 Y96.49 E.00926
G1 X66.234 Y96.014 E.01849
G1 X55.664 Y96.013 E.41021
G1 X55.664 Y96.489 E.01848
G1 X65.936 Y96.49 E.39865
M204 S10000
G1 X66.661 Y96.917 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.66 Y95.587 E.04087
G1 X55.238 Y95.587 E.35096
M73 P71 R7
G1 X55.237 Y96.916 E.04084
G1 X66.601 Y96.917 E.34918
M204 S10000
G1 X67.039 Y97.294 F42000
G1 F9547.299
M204 S6000
G1 X67.036 Y95.21 E.06404
G1 X54.861 Y95.21 E.37411
G1 X54.86 Y97.293 E.06401
G1 X66.979 Y97.294 E.37237
M204 S10000
G1 X67.416 Y97.671 F42000
G1 F9547.299
M204 S6000
G1 X67.413 Y94.833 E.08722
G1 X54.484 Y94.832 E.39727
G1 X54.483 Y97.67 E.08718
G1 X67.356 Y97.671 E.39556
M204 S10000
G1 X67.794 Y98.048 F42000
G1 F9547.299
M204 S6000
G1 X67.79 Y94.456 E.11039
G1 X54.107 Y94.455 E.42042
G1 X54.106 Y98.047 E.11035
G1 X67.734 Y98.048 E.41875
M204 S10000
G1 X68.171 Y98.425 F42000
G1 F9547.299
M204 S6000
G1 X68.166 Y94.079 E.13356
G1 X53.73 Y94.078 E.44358
G1 X53.728 Y98.424 E.13352
G1 X68.111 Y98.425 E.44194
M204 S10000
G1 X68.549 Y98.803 F42000
G1 F9547.299
M204 S6000
G1 X68.543 Y93.854 E.15204
G1 X68.496 Y93.734 E.00399
G1 X68.364 Y93.702 E.00418
G1 X53.501 Y93.701 E.45667
G1 X53.386 Y93.743 E.00376
G1 X53.353 Y93.858 E.00368
G1 X53.351 Y98.801 E.15188
G1 X68.489 Y98.803 E.46512
; OBJECT_ID: 1
; WIPE_START
G1 X66.489 Y98.802 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X69.185 Y91.662 Z2.2 F42000
G1 X91.286 Y33.141 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.722 Y33.464 E.01802
G3 X94.509 Y39.19 I-4.535 J5.749 E.21855
G1 X94.509 Y73.21 E1.12848
G3 X87.21 Y80.509 I-7.322 J-.023 E.38003
G1 X33.69 Y80.509 E1.77533
G3 X26.391 Y73.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E1.12848
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X91.234 Y33.111 I-.023 J7.322 E.14148
M204 S10000
G1 X91.047 Y33.47 F42000
G1 F8843.478
M204 S6000
G1 X91.47 Y33.784 E.01748
G3 X94.102 Y39.194 I-4.283 J5.429 E.20649
G1 X94.102 Y73.206 E1.12822
G3 X87.206 Y80.102 I-6.915 J-.018 E.35908
G1 X33.694 Y80.102 E1.77508
G3 X26.798 Y73.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E1.12822
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77507
G3 X90.995 Y33.441 I-.018 J6.915 E.13314
M204 S250
G1 X90.814 Y33.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X93.71 Y39.198 I-3.626 J5.421 E.19621
G1 X93.71 Y73.202 E1.04485
G3 X87.202 Y79.71 I-6.522 J-.014 E.31393
G1 X33.698 Y79.71 E1.64403
G3 X27.19 Y73.202 I.014 J-6.522 E.31393
G1 X27.19 Y39.198 E1.04485
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.202 Y32.69 E1.64403
G3 X90.764 Y33.758 I-.014 J6.522 E.11587
; WIPE_START
M204 S6000
G1 X91.428 Y34.25 E-.31395
G1 X91.803 Y34.597 E-.19422
G1 X92.243 Y35.092 E-.25182
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.696 Y33.956 Z2.2 F42000
G1 X68.441 Y31.509 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I.006 J7.695 E.40135
G1 X94.891 Y73.19 E1.12718
G3 X87.19 Y80.891 I-7.695 J.006 E.40134
G1 X33.71 Y80.891 E1.77403
G3 X26.009 Y73.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E1.12718
G3 X33.71 Y31.509 I7.695 J-.006 E.40135
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.52 E.16551
G3 X52.98 Y26.009 I.494 J-.017 E.02721
G1 X67.935 Y26.009 E.49609
G3 X68.441 Y26.53 I.012 J.494 E.02702
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I.002 J8.102 E.42228
G1 X95.298 Y73.194 E1.12745
G3 X87.194 Y81.298 I-8.102 J.002 E.42228
G1 X33.706 Y81.298 E1.77431
G3 X25.602 Y73.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E1.12745
G3 X33.706 Y31.102 I8.102 J-.002 E.42228
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.512 E.15227
G3 X52.968 Y25.602 I.9 J-.01 E.04775
G1 X67.948 Y25.602 E.49692
G3 X68.848 Y26.518 I0 J.9 E.0474
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X95.69 Y39.202 I-.002 J8.494 E.40985
G1 X95.69 Y73.198 E1.0446
G3 X87.198 Y81.69 I-8.494 J-.002 E.40985
G1 X33.702 Y81.69 E1.64378
G3 X25.21 Y73.198 I.014 J-8.506 E.4097
G1 X25.21 Y39.202 E1.0446
G3 X33.702 Y30.71 I8.494 J.002 E.40985
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.504 E.12923
G3 X52.956 Y25.21 I1.292 J-.003 E.06256
G1 X67.96 Y25.21 E.46104
G3 X69.24 Y26.506 I-.013 J1.292 E.0621
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.496 Y29.19 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5191
G1 F7560.166
M204 S6000
G1 X65.734 Y29.19 E.00925
G1 X65.734 Y28.714 E.01849
G1 X55.164 Y28.713 E.41012
G1 X55.164 Y29.189 E.01847
G1 X65.436 Y29.19 E.39857
M204 S10000
G1 X66.161 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.287 E.04086
G1 X54.738 Y28.287 E.35096
G1 X54.737 Y29.616 E.04083
G1 X66.101 Y29.617 E.34918
M204 S10000
G1 X66.539 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.91 E.06404
G1 X54.361 Y27.91 E.37411
G1 X54.36 Y29.993 E.06401
G1 X66.479 Y29.994 E.37237
M204 S10000
G1 X66.916 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.533 E.08721
G1 X53.984 Y27.532 E.39727
G1 X53.983 Y30.37 E.08718
G1 X66.856 Y30.371 E.39556
M204 S10000
G1 X67.294 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.156 E.11038
G1 X53.607 Y27.155 E.42042
G1 X53.606 Y30.747 E.11035
G1 X67.234 Y30.748 E.41875
M204 S10000
G1 X67.671 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.779 E.13355
G1 X53.23 Y26.778 E.44358
G1 X53.228 Y31.124 E.13352
G1 X67.611 Y31.125 E.44194
M204 S10000
G1 X68.049 Y31.502 F42000
G1 F9547.299
M204 S6000
G1 X68.043 Y26.555 E.15202
G1 X67.996 Y26.434 E.004
G1 X67.864 Y26.402 E.00418
G1 X53.001 Y26.401 E.45669
G1 X52.888 Y26.442 E.00368
G1 X52.853 Y26.56 E.00379
G1 X52.851 Y31.501 E.1518
G1 X67.989 Y31.502 E.46512
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.989 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 10/15
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I-.457 J1.128 P1  F42000
G1 X175.406 Y75.819 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X175.234 Y76.272 E.01608
G3 X168.31 Y80.909 I-6.947 J-2.886 E.29297
G1 X114.79 Y80.909 E1.77533
G3 X107.291 Y73.41 I.023 J-7.523 E.39045
G1 X107.291 Y39.39 E1.12848
G3 X114.79 Y31.891 I7.526 J.026 E.39041
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.026 J7.526 E.3904
G1 X175.809 Y73.41 E1.12848
G3 X175.438 Y75.719 I-7.523 J-.023 E.07791
M73 P72 R7
G1 X175.424 Y75.762 E.00149
M204 S10000
G1 X175.024 Y75.678 F42000
G1 F8843.478
M204 S6000
G1 X174.858 Y76.116 E.01555
G3 X168.306 Y80.502 I-6.571 J-2.729 E.2772
G1 X114.794 Y80.502 E1.77508
G3 X107.698 Y73.406 I.019 J-7.115 E.3695
G1 X107.698 Y39.394 E1.12822
G3 X114.794 Y32.298 I7.118 J.022 E.36946
G1 X168.306 Y32.298 E1.77507
G3 X175.402 Y39.394 I-.022 J7.118 E.36946
G1 X175.402 Y73.406 E1.12822
G3 X175.051 Y75.594 I-7.115 J-.019 E.0738
G1 X175.042 Y75.621 E.00096
M204 S250
G1 X174.648 Y75.54 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X174.496 Y75.966 E.01392
G3 X168.302 Y80.11 I-6.208 J-2.579 E.2427
G1 X114.798 Y80.11 E1.64403
G3 X108.09 Y73.402 I.015 J-6.722 E.32357
G1 X108.09 Y39.398 E1.04485
G3 X114.798 Y32.69 I6.725 J.017 E.32354
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.017 J6.725 E.32354
G1 X175.01 Y73.402 E1.04485
G3 X174.755 Y75.22 I-6.722 J-.015 E.0566
G1 X174.667 Y75.483 E.00851
; WIPE_START
M204 S6000
G1 X174.496 Y75.966 E-.19491
G1 X174.154 Y76.679 E-.30014
G1 X173.879 Y77.128 E-.2003
G1 X173.776 Y77.264 E-.06464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.204 Y70.519 Z2.4 F42000
G1 X149.541 Y31.509 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I-.005 J7.906 E.41161
G1 X176.191 Y73.39 E1.12718
G3 X168.29 Y81.291 I-7.91 J-.009 E.41156
G1 X114.81 Y81.291 E1.77403
G3 X106.909 Y73.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E1.12718
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.52 E.16551
G3 X134.08 Y26.009 I.497 J-.013 E.02715
G1 X149.031 Y26.009 E.49596
G3 X149.541 Y26.52 I.016 J.494 E.02684
G1 X149.541 Y31.449 E.16351
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.01 J8.314 E.43254
G1 X176.598 Y73.394 E1.12745
G3 X168.294 Y81.698 I-8.317 J-.013 E.43249
G1 X114.806 Y81.698 E1.7743
G3 X106.502 Y73.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E1.12745
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.512 E.15227
G3 X134.068 Y25.602 I.906 J-.004 E.04766
G1 X149.044 Y25.602 E.49677
G3 X149.948 Y26.512 I.004 J.9 E.04735
G1 X149.948 Y31.042 E.15027
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.99 Y39.402 I-.014 J8.706 E.41935
G1 X176.99 Y73.398 E1.0446
G3 X168.298 Y82.09 I-8.71 J-.018 E.4193
G1 X114.802 Y82.09 E1.64378
G3 X106.11 Y73.398 I.014 J-8.706 E.41935
G1 X106.11 Y39.402 E1.0446
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.504 E.12923
G3 X134.056 Y25.21 I1.3 J.006 E.06245
G1 X149.056 Y25.21 E.46089
G3 X150.34 Y26.504 I-.008 J1.292 E.06217
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 10 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer10 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X146.597 Y29.19 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519165
G1 F7559.135
M204 S6000
G1 X146.836 Y29.19 E.00925
G1 X146.835 Y28.714 E.01849
G1 X136.264 Y28.713 E.41025
G1 X136.264 Y29.189 E.01847
G1 X146.537 Y29.19 E.39869
M204 S10000
G1 X147.263 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.262 Y28.287 E.04087
G1 X135.838 Y28.287 E.35103
G1 X135.837 Y29.616 E.04084
G1 X147.203 Y29.617 E.34922
M204 S10000
G1 X147.64 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X147.639 Y27.91 E.06404
G1 X135.461 Y27.909 E.37419
G1 X135.46 Y29.993 E.06401
G1 X147.58 Y29.994 E.3724
M204 S10000
G1 X148.017 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X148.016 Y27.533 E.08721
G1 X135.084 Y27.532 E.39735
G1 X135.083 Y30.37 E.08718
G1 X147.957 Y30.371 E.39558
M204 S10000
G1 X148.394 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X148.393 Y27.156 E.11039
G1 X134.707 Y27.155 E.42051
G1 X134.706 Y30.747 E.11035
G1 X148.334 Y30.748 E.41876
M204 S10000
G1 X148.772 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X148.77 Y26.778 E.13356
G1 X134.33 Y26.778 E.44368
G1 X134.328 Y31.124 E.13352
G1 X148.712 Y31.125 E.44194
M204 S10000
G1 X149.149 Y31.502 F42000
G1 F9547.299
M204 S6000
G1 X149.147 Y26.564 E.15174
G1 X149.106 Y26.445 E.00388
G1 X148.949 Y26.401 E.005
G1 X134.101 Y26.401 E.4562
G1 X133.981 Y26.45 E.00401
G1 X133.953 Y26.558 E.00342
G1 X133.951 Y31.501 E.15187
G1 X149.089 Y31.502 E.46512
; OBJECT_ID: 4
; WIPE_START
G1 X147.089 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X145.369 Y38.938 Z2.4 F42000
G1 X129.217 Y108.791 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.106 Y108.791 E.00365
G1 X129.008 Y109.114 E.0112
G1 X128.465 Y108.656 E.02356
G3 X128.31 Y108.319 I.352 J-.365 E.0126
G1 X128.309 Y100.519 E.25874
G2 X108.291 Y103.99 I-9.704 J3.493 E.95591
G1 X108.291 Y108.402 E.14636
G1 X108.068 Y108.422 E.00743
G3 X107.909 Y106.59 I10.798 J-1.857 E.06107
G3 X107.918 Y103.578 I76.424 J-1.29 E.09989
G3 X119.022 Y93.319 I10.7 J.441 E.55677
G3 X127.982 Y98.874 I-.452 J10.733 E.36554
G1 X128.469 Y99.809 E.03496
G1 X139.819 Y99.81 E.37651
G3 X140.29 Y100.29 I-.027 J.497 E.02449
G1 X140.29 Y108.319 E.26632
G3 X139.809 Y108.789 I-.497 J-.027 E.02449
G1 X129.277 Y108.791 E.34939
M204 S10000
G1 X129.462 Y109.198 F42000
G1 F8843.478
M204 S6000
G1 X129.408 Y109.198 E.00179
G3 X128.697 Y111.206 I-15.44 J-4.336 E.07074
G1 X128.502 Y111.166 E.0066
G1 X128.502 Y109.22 E.06456
G3 X128.05 Y108.792 I.999 J-1.508 E.02073
G3 X127.903 Y108.334 I.8 J-.51 E.01613
G1 X127.902 Y100.597 E.25665
G2 X108.698 Y103.994 I-9.299 J3.413 E.91613
G1 X108.698 Y111.168 E.23799
G1 X108.503 Y111.208 E.00661
G3 X107.502 Y106.593 I10.222 J-4.632 E.15782
G3 X107.511 Y103.562 I76.886 J-1.294 E.10055
G3 X119.039 Y92.912 I11.107 J.458 E.57803
G3 X128.339 Y98.679 I-.471 J11.142 E.37941
G1 X128.716 Y99.402 E.02703
G1 X139.835 Y99.403 E.36885
G3 X140.697 Y100.27 I-.048 J.909 E.04447
G1 X140.697 Y108.335 E.26751
G3 X139.829 Y109.197 I-.909 J-.048 E.04447
M73 P73 R7
G1 X129.522 Y109.198 E.34192
M204 S250
G1 X129.698 Y109.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.11 Y113.042 I-11.235 J-3.077 E.1173
G1 X128.11 Y109.402 E.11186
G3 X127.511 Y108.35 I.808 J-1.157 E.03846
G1 X127.51 Y100.673 E.23588
G2 X109.09 Y103.998 I-8.908 J3.336 E.81314
G1 X109.09 Y113.044 E.27798
G3 X107.11 Y106.597 I9.672 J-6.498 E.21023
G3 X107.119 Y103.547 I77.357 J-1.298 E.09374
G3 X119.056 Y92.52 I11.5 J.474 E.55439
G3 X128.954 Y99.01 I-.466 J11.502 E.38195
G1 X139.85 Y99.011 E.33483
G3 X141.089 Y100.251 I-.068 J1.306 E.05901
G1 X141.089 Y108.35 E.24886
G3 X139.849 Y109.589 I-1.306 J-.068 E.05902
G1 X129.758 Y109.59 E.31005
M204 S10000
G1 X128.897 Y109.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362965
G1 F11248.425
M204 S6000
G1 X128.867 Y109.723 E.00541
; LINE_WIDTH: 0.323735
G1 F12819.829
G1 X128.836 Y109.928 E.00474
; LINE_WIDTH: 0.284037
G1 F14930.523
G1 X128.816 Y110.045 E.00234
; LINE_WIDTH: 0.243872
G1 F15000
G1 X128.796 Y110.163 E.00195
; LINE_WIDTH: 0.203708
G1 X128.776 Y110.281 E.00156
; LINE_WIDTH: 0.163543
G1 X128.756 Y110.398 E.00117
; LINE_WIDTH: 0.120199
G1 X128.728 Y110.549 E.00097
M204 S10000
G1 X128.897 Y109.518 F42000
; LINE_WIDTH: 0.402195
G1 F10020.188
M204 S6000
G1 X128.928 Y109.313 E.00607
; WIPE_START
G1 X128.897 Y109.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.999 Y101.886 Z2.4 F42000
G1 X129.025 Y99.972 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42232
G1 F9488.666
M204 S6000
G1 X128.614 Y100.383 E.01797
G1 X128.642 Y100.454 E.00236
G1 X128.643 Y100.891 E.01351
G1 X129.392 Y100.142 E.03275
G1 X129.928 Y100.142 E.01659
G1 X128.643 Y101.428 E.0562
G1 X128.643 Y101.964 E.01658
G1 X130.465 Y100.142 E.07965
G1 X131.001 Y100.142 E.01659
G1 X128.643 Y102.5 E.10309
G1 X128.643 Y103.037 E.01658
G1 X131.538 Y100.142 E.12654
G1 X132.074 Y100.142 E.01659
G1 X128.644 Y103.573 E.14999
G1 X128.644 Y104.109 E.01658
G1 X132.611 Y100.143 E.17344
G1 X133.147 Y100.143 E.01659
G1 X128.644 Y104.646 E.19688
G1 X128.644 Y105.182 E.01658
G1 X133.684 Y100.143 E.22033
G1 X134.22 Y100.143 E.01659
G1 X128.645 Y105.718 E.24378
G1 X128.645 Y106.255 E.01658
G1 X134.757 Y100.143 E.26722
G1 X135.293 Y100.143 E.01659
G1 X128.645 Y106.791 E.29067
G1 X128.645 Y107.327 E.01658
G1 X135.83 Y100.143 E.31412
G1 X136.366 Y100.143 E.01659
G1 X128.645 Y107.864 E.33756
G1 X128.646 Y108.309 E.01376
G2 X128.671 Y108.374 I.121 J-.01 E.00221
G1 X136.903 Y100.143 E.35988
G1 X137.439 Y100.143 E.01659
G1 X129.125 Y108.457 E.36352
G1 X129.661 Y108.457 E.01659
G1 X137.976 Y100.143 E.36352
G1 X138.512 Y100.143 E.01659
G1 X130.198 Y108.457 E.36351
G1 X130.735 Y108.457 E.01659
G1 X139.049 Y100.143 E.36351
G1 X139.585 Y100.143 E.01659
G1 X131.271 Y108.457 E.3635
G1 X131.808 Y108.457 E.01659
G1 X139.955 Y100.31 E.35623
G1 X139.956 Y100.845 E.01655
G1 X132.344 Y108.457 E.33282
G1 X132.881 Y108.457 E.01659
G1 X139.956 Y101.382 E.30935
G1 X139.956 Y101.918 E.01659
G1 X133.418 Y108.457 E.28589
G1 X133.954 Y108.457 E.01659
G1 X139.956 Y102.455 E.26243
G1 X139.956 Y102.991 E.01659
G1 X134.491 Y108.457 E.23897
G1 X135.027 Y108.457 E.01659
G1 X139.956 Y103.528 E.21551
G1 X139.956 Y104.064 E.01659
G1 X135.564 Y108.457 E.19204
G1 X136.101 Y108.457 E.01659
G1 X139.956 Y104.601 E.16858
G1 X139.956 Y105.137 E.01659
G1 X136.637 Y108.457 E.14512
G1 X137.174 Y108.457 E.01659
G1 X139.956 Y105.674 E.12166
G1 X139.956 Y106.211 E.01659
G1 X137.711 Y108.456 E.0982
G1 X138.247 Y108.456 E.01659
G1 X139.956 Y106.747 E.07473
G1 X139.956 Y107.284 E.01659
G1 X138.784 Y108.456 E.05127
G1 X139.32 Y108.456 E.01659
G1 X139.956 Y107.82 E.02781
G1 X139.956 Y108.286 E.0144
G1 X139.942 Y108.359 E.0023
G3 X139.687 Y108.626 I-.936 J-.638 E.01146
; WIPE_START
G1 X139.942 Y108.359 E-.14018
G1 X139.956 Y108.286 E-.02825
G1 X139.956 Y107.82 E-.17704
G1 X139.32 Y108.456 E-.34182
G1 X139.129 Y108.456 E-.0727
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.514 Y108.976 Z2.4 F42000
G1 X108.472 Y110.549 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121057
G1 F15000
M204 S6000
G1 X108.446 Y110.405 E.00093
; LINE_WIDTH: 0.169313
G1 X108.419 Y110.26 E.00151
; LINE_WIDTH: 0.216098
G1 X108.396 Y110.123 E.00197
; LINE_WIDTH: 0.261427
G1 X108.374 Y109.985 E.00249
; LINE_WIDTH: 0.306756
G1 F13644.867
G1 X108.351 Y109.847 E.003
; LINE_WIDTH: 0.349274
G1 F11751.137
G1 X108.331 Y109.71 E.00346
; LINE_WIDTH: 0.389004
G1 F10402.1
G1 X108.311 Y109.573 E.00391
; LINE_WIDTH: 0.428735
G1 F9330.906
G1 X108.292 Y109.435 E.00436
; LINE_WIDTH: 0.465668
G1 F8515.713
G1 X108.275 Y109.299 E.00473
; LINE_WIDTH: 0.499769
G1 F7880.07
G1 X108.257 Y109.163 E.00511
; LINE_WIDTH: 0.53387
G1 F7332.729
G1 X108.24 Y109.027 E.00549
; LINE_WIDTH: 0.566024
G1 F6881.995
G1 X108.197 Y108.615 E.01768
; OBJECT_ID: 5
; WIPE_START
G1 X108.24 Y109.027 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.873 Y109 Z2.4 F42000
G1 X173.978 Y108.789 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.867 Y108.789 E.00368
G1 X173.773 Y109.083 E.01023
G1 X173.265 Y108.655 E.02206
G3 X173.11 Y108.307 I.336 J-.357 E.01294
G1 X173.109 Y100.683 E.25291
G2 X152.691 Y104.189 I-9.904 J3.527 E.97562
G1 X152.691 Y108.221 E.13376
G1 X152.468 Y108.241 E.00742
G3 X152.309 Y106.388 I11.04 J-1.881 E.06174
G3 X152.318 Y103.764 I65.924 J-1.09 E.08706
G3 X163.389 Y93.311 I10.885 J.439 E.55924
G3 X172.665 Y98.814 I-.218 J10.937 E.37417
G1 X173.203 Y99.808 E.03746
G1 X184.619 Y99.809 E.3787
G3 X185.09 Y100.282 I-.027 J.497 E.02426
G1 X185.09 Y108.318 E.26655
G3 X184.609 Y108.788 I-.494 J-.024 E.02453
G1 X174.038 Y108.789 E.35066
M204 S10000
G1 X174.219 Y109.196 F42000
G1 F8843.478
M204 S6000
G1 X174.164 Y109.196 E.00181
G3 X173.494 Y111.048 I-16.704 J-4.997 E.06535
G1 X173.302 Y111.006 E.00653
G1 X173.302 Y109.218 E.0593
G3 X172.85 Y108.791 I.999 J-1.508 E.02073
G3 X172.703 Y108.327 I.787 J-.505 E.01633
G1 X172.702 Y100.761 E.25099
G2 X153.098 Y104.193 I-9.499 J3.448 E.93582
G1 X153.098 Y111.005 E.22597
G1 X152.904 Y111.045 E.00658
G3 X151.902 Y106.393 I10.362 J-4.665 E.15906
G3 X151.911 Y103.748 I66.38 J-1.094 E.08772
G3 X163.397 Y92.904 I11.292 J.455 E.5802
G3 X173.02 Y98.615 I-.227 J11.346 E.38817
G1 X173.445 Y99.4 E.02964
G1 X184.635 Y99.402 E.37118
G3 X185.497 Y100.265 I-.048 J.91 E.04433
G1 X185.497 Y108.334 E.26765
G3 X184.629 Y109.195 I-.905 J-.044 E.04452
G1 X174.279 Y109.196 E.34334
M204 S250
G1 X174.451 Y109.588 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X172.91 Y112.904 I-12.028 J-3.574 E.11273
G1 X172.91 Y109.401 E.10764
G3 X172.311 Y108.346 I.789 J-1.146 E.03856
G1 X172.31 Y100.836 E.23078
G2 X153.49 Y104.196 I-9.108 J3.372 E.83135
G1 X153.49 Y112.907 E.26766
G3 X151.51 Y106.396 I9.911 J-6.571 E.21207
G3 X151.519 Y103.733 I66.873 J-1.098 E.08185
G3 X163.405 Y92.511 I11.684 J.471 E.55613
G3 X173.679 Y99.008 I-.214 J11.711 E.39271
G1 X184.651 Y99.01 E.33712
G3 X185.889 Y100.248 I-.068 J1.307 E.05897
G1 X185.889 Y108.349 E.24891
G3 X184.648 Y109.587 I-1.301 J-.063 E.05907
G1 X174.511 Y109.588 E.31151
M204 S10000
G1 X173.673 Y109.514 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.360907
G1 F11321.222
M204 S6000
G1 X173.707 Y109.294 E.00578
M204 S10000
G1 X173.673 Y109.514 F42000
; LINE_WIDTH: 0.312705
G1 F13344.001
M204 S6000
G1 X173.639 Y109.735 E.0049
; LINE_WIDTH: 0.264502
G1 F15000
G1 X173.604 Y109.955 E.00403
; LINE_WIDTH: 0.2165
G1 X173.579 Y110.1 E.00207
; LINE_WIDTH: 0.168668
G1 X173.553 Y110.244 E.0015
; LINE_WIDTH: 0.120836
G1 X173.528 Y110.388 E.00093
; WIPE_START
G1 X173.553 Y110.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.709 Y102.613 Z2.4 F42000
G1 X173.764 Y99.971 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42342
G1 F9461.235
M204 S6000
G1 X173.35 Y100.385 E.01815
G1 X173.442 Y100.619 E.00781
G1 X173.442 Y100.83 E.00654
G1 X174.132 Y100.141 E.03024
G1 X174.67 Y100.141 E.01668
G1 X173.442 Y101.368 E.05383
G1 X173.443 Y101.906 E.01668
G1 X175.208 Y100.141 E.07742
G1 X175.746 Y100.141 E.01668
G1 X173.443 Y102.445 E.10101
G1 X173.443 Y102.983 E.01668
G1 X176.284 Y100.141 E.12459
G1 X176.822 Y100.141 E.01668
G1 X173.443 Y103.521 E.14818
G1 X173.443 Y104.059 E.01668
G1 X177.36 Y100.141 E.17177
G1 X177.898 Y100.141 E.01668
G1 X173.443 Y104.597 E.19536
G1 X173.443 Y105.135 E.01668
G1 X178.436 Y100.141 E.21895
G1 X178.974 Y100.141 E.01668
G1 X173.443 Y105.673 E.24254
G1 X173.443 Y106.211 E.01668
G1 X179.512 Y100.141 E.26613
G1 X180.05 Y100.141 E.01668
G1 X173.443 Y106.749 E.28972
G1 X173.443 Y107.287 E.01668
G1 X180.589 Y100.142 E.31331
G1 X181.127 Y100.142 E.01668
G1 X173.443 Y107.825 E.3369
G1 X173.444 Y108.273 E.01389
G1 X173.459 Y108.347 E.00236
G1 X181.665 Y100.142 E.35981
G1 X182.203 Y100.142 E.01668
G1 X173.888 Y108.456 E.36458
G1 X174.426 Y108.456 E.01669
G1 X182.741 Y100.142 E.36457
G1 X183.279 Y100.142 E.01668
G1 X174.965 Y108.456 E.36457
G1 X175.503 Y108.456 E.01669
G1 X183.817 Y100.142 E.36456
G1 X184.355 Y100.142 E.01668
G1 X176.041 Y108.456 E.36456
G1 X176.579 Y108.456 E.01669
G1 X184.747 Y100.288 E.35814
G1 X184.756 Y100.817 E.01639
G1 X177.117 Y108.456 E.33497
G1 X177.656 Y108.456 E.01669
G1 X184.756 Y101.355 E.31137
G1 X184.756 Y101.893 E.01668
G1 X178.194 Y108.456 E.28777
G1 X178.732 Y108.456 E.01669
G1 X184.756 Y102.431 E.26417
G1 X184.756 Y102.969 E.01668
G1 X179.27 Y108.455 E.24057
G1 X179.808 Y108.455 E.01669
G1 X184.756 Y103.507 E.21698
G1 X184.756 Y104.045 E.01668
G1 X180.346 Y108.455 E.19338
G1 X180.885 Y108.455 E.01669
G1 X184.756 Y104.583 E.16978
G1 X184.756 Y105.121 E.01668
G1 X181.423 Y108.455 E.14618
G1 X181.961 Y108.455 E.01669
G1 X184.756 Y105.66 E.12258
G1 X184.756 Y106.198 E.01668
G1 X182.499 Y108.455 E.09899
G1 X183.037 Y108.455 E.01669
G1 X184.756 Y106.736 E.07539
G1 X184.756 Y107.274 E.01668
G1 X183.575 Y108.455 E.05179
G1 X184.114 Y108.455 E.01669
G1 X184.756 Y107.812 E.02819
G1 X184.756 Y108.285 E.01466
G3 X184.733 Y108.374 I-.158 J.006 E.0029
G1 X184.482 Y108.625 E.01099
; WIPE_START
G1 X184.733 Y108.374 E-.13475
G1 X184.756 Y108.285 E-.03503
G1 X184.756 Y107.812 E-.17963
G1 X184.114 Y108.455 E-.3455
G1 X183.942 Y108.455 E-.0651
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X176.324 Y108.928 Z2.4 F42000
G1 X152.872 Y110.385 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11003
G1 F15000
M204 S6000
G1 X152.857 Y110.302 E.00046
; LINE_WIDTH: 0.136237
G1 X152.841 Y110.219 E.00064
; LINE_WIDTH: 0.173609
G1 X152.817 Y110.075 E.00156
; LINE_WIDTH: 0.222149
G1 X152.793 Y109.931 E.00213
; LINE_WIDTH: 0.27069
G1 X152.768 Y109.787 E.00271
; LINE_WIDTH: 0.316154
G1 F13175.548
G1 X152.747 Y109.644 E.00322
; LINE_WIDTH: 0.358572
G1 F11404.963
G1 X152.726 Y109.501 E.00372
; LINE_WIDTH: 0.400991
G1 F10053.882
G1 X152.705 Y109.358 E.00422
; LINE_WIDTH: 0.440482
G1 F9055.204
G1 X152.686 Y109.216 E.00465
; LINE_WIDTH: 0.477033
G1 F8292.774
G1 X152.668 Y109.073 E.00508
; LINE_WIDTH: 0.513585
G1 F7648.763
G1 X152.65 Y108.931 E.00551
; LINE_WIDTH: 0.556687
G1 F7007.074
G1 X152.596 Y108.434 E.02092
; OBJECT_ID: 6
; WIPE_START
G1 X152.65 Y108.931 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X160.282 Y108.915 Z2.4 F42000
G1 X219.315 Y108.79 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.202 Y108.79 E.00377
G1 X219.118 Y109.037 E.00866
G1 X218.665 Y108.655 E.01967
G3 X218.51 Y108.317 I.352 J-.365 E.0126
G1 X218.509 Y100.933 E.24497
G2 X197.491 Y104.489 I-10.204 J3.579 E1.00521
G1 X197.491 Y107.948 E.11473
G1 X197.264 Y107.964 E.00755
G3 X197.109 Y106.088 I14.817 J-2.165 E.06246
G3 X197.144 Y103.613 I31.436 J-.79 E.08215
G3 X208.854 Y93.323 I11.159 J.891 E.57197
G3 X217.979 Y98.882 I-.589 J11.236 E.36936
G1 X218.492 Y99.808 E.03509
G1 X230.019 Y99.809 E.38237
G3 X230.49 Y100.289 I-.023 J.494 E.02453
G1 X230.49 Y108.318 E.26633
G3 X230.009 Y108.788 I-.497 J-.027 E.0245
G1 X219.375 Y108.79 E.35274
M204 S10000
G1 X219.549 Y109.197 F42000
G1 F8843.478
M204 S6000
G1 X219.494 Y109.197 E.00185
G3 X218.898 Y110.81 I-15.238 J-4.71 E.05708
G1 X218.702 Y110.77 E.00662
G1 X218.702 Y109.219 E.05147
G3 X218.25 Y108.791 I.998 J-1.507 E.02073
G3 X218.103 Y108.333 I.799 J-.51 E.01613
G1 X218.102 Y101.009 E.24296
G2 X197.898 Y104.493 I-9.799 J3.501 E.96537
G1 X197.898 Y110.768 E.20817
G1 X197.704 Y110.809 E.00656
G3 X196.702 Y106.093 I10.647 J-4.728 E.16113
G3 X196.739 Y103.581 I31.819 J-.794 E.08336
G3 X208.868 Y92.916 I11.565 J.923 E.59258
G3 X218.331 Y98.678 I-.604 J11.644 E.383
G1 X218.732 Y99.401 E.02741
G1 X230.035 Y99.402 E.37495
G3 X230.897 Y100.269 I-.043 J.905 E.04452
G1 X230.897 Y108.334 E.26752
G3 X230.029 Y109.195 I-.909 J-.048 E.04448
G1 X219.609 Y109.197 E.34564
M204 S250
G1 X219.775 Y109.589 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X218.31 Y112.695 I-12.292 J-3.898 E.10584
G1 X218.31 Y109.401 E.10121
G3 X217.711 Y108.349 I.808 J-1.157 E.03846
G1 X217.71 Y101.083 E.22325
G2 X198.29 Y104.497 I-9.408 J3.426 E.8587
G1 X198.29 Y112.695 E.2519
G3 X196.563 Y108.541 I10.041 J-6.612 E.13906
G3 X196.31 Y106.097 I13.752 J-2.656 E.0756
G3 X196.348 Y103.549 I32.185 J-.798 E.0783
G3 X208.881 Y92.524 I11.956 J.955 E.56729
G3 X218.963 Y99.009 I-.591 J11.998 E.38564
G1 X230.05 Y99.01 E.34069
G3 X231.289 Y100.25 I-.063 J1.301 E.05907
G1 X231.289 Y108.349 E.24887
G3 X230.048 Y109.588 I-1.306 J-.068 E.05902
G1 X219.835 Y109.589 E.31384
M204 S10000
G1 X219.048 Y109.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308102
G1 F13575.577
M204 S6000
G1 X219.075 Y109.267 E.00362
M204 S10000
G1 X219.048 Y109.433 F42000
; LINE_WIDTH: 0.267113
G1 F15000
M204 S6000
G1 X219.021 Y109.598 E.00306
; LINE_WIDTH: 0.226124
G1 X218.994 Y109.764 E.0025
; LINE_WIDTH: 0.185135
G1 X218.966 Y109.929 E.00194
; LINE_WIDTH: 0.147697
G1 X218.947 Y110.035 E.00092
; LINE_WIDTH: 0.113846
G1 X218.928 Y110.14 E.00062
M204 S10000
G1 X218.757 Y110.982 F42000
; LINE_WIDTH: 0.454293
G1 F8751.195
M204 S6000
G1 X218.544 Y111.935 E.03274
; WIPE_START
G1 X218.757 Y110.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X226.224 Y109.4 Z2.4 F42000
G1 X229.885 Y108.625 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4257
G1 F9404.88
M204 S6000
G1 X230.128 Y108.382 E.01071
G2 X230.156 Y108.292 I-.146 J-.096 E.003
G1 X230.156 Y107.812 E.01496
G1 X229.513 Y108.455 E.02838
G1 X228.972 Y108.455 E.01689
G1 X230.156 Y107.271 E.05226
G1 X230.156 Y106.729 E.01689
G1 X228.43 Y108.455 E.07614
G1 X227.889 Y108.455 E.01689
M73 P73 R6
G1 X230.156 Y106.188 E.10002
G1 X230.156 Y105.647 E.01689
G1 X227.348 Y108.455 E.1239
G1 X226.806 Y108.456 E.01689
G1 X230.156 Y105.105 E.14778
G1 X230.156 Y104.564 E.01689
G1 X226.265 Y108.456 E.17167
G1 X225.723 Y108.456 E.01689
G1 X230.156 Y104.023 E.19555
G1 X230.156 Y103.481 E.01689
G1 X225.182 Y108.456 E.21943
G1 X224.641 Y108.456 E.01689
G1 X230.156 Y102.94 E.24331
M73 P74 R6
G1 X230.156 Y102.399 E.01689
G1 X224.099 Y108.456 E.26719
G1 X223.558 Y108.456 E.01689
G1 X230.156 Y101.857 E.29108
G1 X230.156 Y101.316 E.01689
G1 X223.016 Y108.456 E.31496
G1 X222.475 Y108.456 E.01689
G1 X230.156 Y100.775 E.33884
G1 X230.156 Y100.329 E.01391
G1 X230.138 Y100.252 E.00247
G1 X221.934 Y108.456 E.36191
G1 X221.392 Y108.456 E.01689
G1 X229.706 Y100.142 E.36674
G1 X229.165 Y100.142 E.01688
G1 X220.851 Y108.456 E.36675
G1 X220.309 Y108.456 E.01689
G1 X228.624 Y100.142 E.36675
G1 X228.082 Y100.142 E.01688
G1 X219.768 Y108.456 E.36676
G1 X219.227 Y108.456 E.01689
G1 X227.541 Y100.142 E.36676
G1 X227 Y100.142 E.01688
G1 X218.846 Y108.296 E.35968
G1 X218.843 Y107.757 E.01681
G1 X226.459 Y100.142 E.33592
G1 X225.917 Y100.142 E.01688
G1 X218.843 Y107.216 E.31204
G1 X218.843 Y106.674 E.01688
G1 X225.376 Y100.142 E.28817
G1 X224.835 Y100.142 E.01688
G1 X218.843 Y106.133 E.2643
G1 X218.843 Y105.592 E.01688
G1 X224.293 Y100.142 E.24042
G1 X223.752 Y100.142 E.01688
G1 X218.843 Y105.051 E.21655
G1 X218.843 Y104.51 E.01688
G1 X223.211 Y100.142 E.19268
G1 X222.67 Y100.141 E.01688
G1 X218.843 Y103.968 E.16881
G1 X218.843 Y103.427 E.01688
G1 X222.128 Y100.141 E.14493
G1 X221.587 Y100.141 E.01688
G1 X218.843 Y102.886 E.12106
G1 X218.843 Y102.345 E.01688
G1 X221.046 Y100.141 E.09719
G1 X220.505 Y100.141 E.01688
G1 X218.842 Y101.803 E.07331
G1 X218.842 Y101.262 E.01688
G1 X219.963 Y100.141 E.04944
G1 X219.422 Y100.141 E.01688
G1 X218.801 Y100.763 E.02741
G1 X218.649 Y100.373 E.01304
G1 X219.05 Y99.971 E.01772
; WIPE_START
G1 X218.649 Y100.373 E-.21583
G1 X218.801 Y100.763 E-.15886
G1 X219.422 Y100.141 E-.33396
G1 X219.557 Y100.141 E-.05135
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X212.38 Y102.738 Z2.4 F42000
G1 X197.395 Y108.159 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56582
G1 F6884.687
M204 S6000
G1 X197.427 Y108.451 E.01253
; LINE_WIDTH: 0.531059
G1 F7374.953
G1 X197.459 Y108.743 E.01169
; LINE_WIDTH: 0.494268
G1 F7976.106
G1 X197.478 Y108.892 E.00552
; LINE_WIDTH: 0.455485
G1 F8725.913
G1 X197.498 Y109.041 E.00505
; LINE_WIDTH: 0.416701
G1 F9631.323
G1 X197.517 Y109.189 E.00457
; LINE_WIDTH: 0.374805
G1 F10847.157
G1 X197.54 Y109.339 E.00409
; LINE_WIDTH: 0.329773
G1 F12549.996
G1 X197.562 Y109.488 E.00353
; LINE_WIDTH: 0.284741
G1 F14887.037
G1 X197.585 Y109.638 E.00298
; LINE_WIDTH: 0.24291
G1 F15000
G1 X197.604 Y109.751 E.00187
; LINE_WIDTH: 0.204288
G1 X197.623 Y109.863 E.00151
; LINE_WIDTH: 0.165667
G1 X197.643 Y109.976 E.00115
; LINE_WIDTH: 0.127045
G1 X197.662 Y110.089 E.00078
; LINE_WIDTH: 0.102319
G1 X197.672 Y110.144 E.00027
; OBJECT_ID: 9
; WIPE_START
G1 X197.662 Y110.089 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X192.542 Y115.749 Z2.4 F42000
G1 X137.415 Y176.69 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.302 Y176.69 E.00377
G1 X137.218 Y176.937 E.00866
G1 X136.765 Y176.555 E.01966
G3 X136.61 Y176.208 I.349 J-.363 E.01292
G1 X136.609 Y168.833 E.24465
G2 X115.591 Y172.389 I-10.204 J3.579 E1.00521
G1 X115.591 Y175.848 E.11473
G1 X115.364 Y175.864 E.00755
G3 X115.209 Y173.989 I14.826 J-2.166 E.06245
G3 X115.288 Y171.071 I25.34 J-.772 E.09686
G3 X126.954 Y161.223 I11.131 J1.352 E.55705
G3 X136.079 Y166.783 I-.589 J11.235 E.36937
G1 X136.592 Y167.708 E.03508
G1 X148.119 Y167.709 E.38238
G3 X148.59 Y168.189 I-.027 J.497 E.02449
G1 X148.59 Y176.218 E.26632
G3 X148.109 Y176.688 I-.497 J-.027 E.02449
G1 X137.475 Y176.69 E.35275
M204 S10000
G1 X137.649 Y177.097 F42000
G1 F8843.478
M204 S6000
G1 X137.594 Y177.097 E.00185
G3 X136.998 Y178.71 I-15.241 J-4.711 E.05708
G1 X136.802 Y178.67 E.00662
G1 X136.802 Y177.119 E.05147
G3 X136.35 Y176.691 I.998 J-1.507 E.02073
G3 X136.203 Y176.227 I.766 J-.498 E.01634
G1 X136.202 Y168.909 E.24276
G2 X115.998 Y172.393 I-9.799 J3.501 E.96537
G1 X115.998 Y178.668 E.20817
G1 X115.804 Y178.709 E.00656
G3 X114.802 Y173.992 I10.647 J-4.728 E.16113
G3 X114.884 Y171.023 I25.81 J-.773 E.0986
G3 X126.968 Y160.816 I11.536 J1.401 E.5771
G3 X136.432 Y166.578 I-.604 J11.644 E.38301
G1 X136.832 Y167.301 E.0274
G1 X148.135 Y167.302 E.37495
G3 X148.997 Y168.169 I-.048 J.909 E.04446
G1 X148.997 Y176.234 E.26752
G3 X148.129 Y177.095 I-.909 J-.048 E.04447
G1 X137.709 Y177.097 E.34565
M204 S250
G1 X137.875 Y177.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X136.41 Y180.595 I-12.227 J-3.867 E.10585
G1 X136.41 Y177.301 E.10121
G3 X135.811 Y176.246 I.808 J-1.156 E.03852
G1 X135.81 Y168.983 E.22319
G2 X116.39 Y172.397 I-9.408 J3.426 E.8587
G1 X116.39 Y180.595 E.2519
G3 X114.663 Y176.441 I10.04 J-6.611 E.13906
G3 X114.41 Y173.997 I13.751 J-2.656 E.0756
G3 X114.495 Y170.977 I26.273 J-.774 E.09288
G3 X126.981 Y160.424 I11.926 J1.448 E.55247
G3 X137.063 Y166.909 I-.591 J11.998 E.38564
G1 X148.15 Y166.91 E.34069
G3 X149.389 Y168.15 I-.068 J1.306 E.05901
G1 X149.389 Y176.249 E.24887
G3 X148.148 Y177.488 I-1.306 J-.068 E.05901
G1 X137.935 Y177.489 E.31384
M204 S10000
G1 X137.148 Y177.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308129
G1 F13574.218
M204 S6000
G1 X137.175 Y177.167 E.00362
M204 S10000
G1 X137.148 Y177.333 F42000
; LINE_WIDTH: 0.267149
G1 F15000
M204 S6000
G1 X137.121 Y177.498 E.00306
; LINE_WIDTH: 0.22617
G1 X137.094 Y177.664 E.0025
; LINE_WIDTH: 0.18519
G1 X137.067 Y177.829 E.00194
; LINE_WIDTH: 0.147759
G1 X137.047 Y177.935 E.00092
; LINE_WIDTH: 0.113867
G1 X137.028 Y178.04 E.00062
M204 S10000
G1 X136.857 Y178.882 F42000
; LINE_WIDTH: 0.454245
G1 F8752.21
M204 S6000
G1 X136.645 Y179.834 E.03269
; WIPE_START
G1 X136.857 Y178.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.324 Y177.301 Z2.4 F42000
G1 X147.989 Y176.525 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42578
G1 F9402.915
M204 S6000
G2 X148.225 Y176.288 I-1.685 J-1.917 E.01046
G2 X148.256 Y176.192 I-.155 J-.104 E.00319
G1 X148.256 Y175.716 E.01486
G1 X147.617 Y176.355 E.02822
G1 X147.075 Y176.355 E.01689
G1 X148.256 Y175.174 E.05212
G1 X148.256 Y174.633 E.01689
G1 X146.534 Y176.355 E.07601
G1 X145.992 Y176.355 E.01689
G1 X148.256 Y174.091 E.0999
G1 X148.256 Y173.55 E.01689
G1 X145.451 Y176.355 E.12379
G1 X144.909 Y176.356 E.01689
G1 X148.256 Y173.008 E.14768
G1 X148.256 Y172.467 E.01689
G1 X144.368 Y176.356 E.17157
G1 X143.826 Y176.356 E.01689
G1 X148.256 Y171.925 E.19547
G1 X148.256 Y171.384 E.01689
G1 X143.285 Y176.356 E.21936
G1 X142.743 Y176.356 E.01689
G1 X148.256 Y170.843 E.24325
G1 X148.256 Y170.301 E.01689
G1 X142.202 Y176.356 E.26714
G1 X141.66 Y176.356 E.01689
G1 X148.256 Y169.76 E.29103
G1 X148.256 Y169.218 E.01689
G1 X141.119 Y176.356 E.31493
G1 X140.577 Y176.356 E.01689
G1 X148.256 Y168.677 E.33882
G1 X148.256 Y168.229 E.01396
G1 X148.238 Y168.154 E.00243
G1 X140.036 Y176.356 E.3619
G1 X139.494 Y176.356 E.01689
G1 X147.808 Y168.042 E.36682
G1 X147.267 Y168.042 E.01689
G1 X138.953 Y176.356 E.36682
G1 X138.411 Y176.356 E.01689
G1 X146.725 Y168.042 E.36683
G1 X146.184 Y168.042 E.01689
G1 X137.87 Y176.356 E.36683
G1 X137.328 Y176.356 E.01689
G1 X145.643 Y168.042 E.36684
G1 X145.101 Y168.042 E.01689
G1 X136.947 Y176.196 E.35978
G1 X136.943 Y175.658 E.01679
G1 X144.56 Y168.042 E.33604
G1 X144.018 Y168.042 E.01689
G1 X136.943 Y175.117 E.31216
G1 X136.943 Y174.575 E.01689
G1 X143.477 Y168.042 E.28827
G1 X142.936 Y168.042 E.01689
G1 X136.943 Y174.034 E.26439
G1 X136.943 Y173.493 E.01689
G1 X142.394 Y168.042 E.24051
G1 X141.853 Y168.042 E.01689
G1 X136.943 Y172.951 E.21662
G1 X136.943 Y172.41 E.01689
G1 X141.311 Y168.042 E.19274
G1 X140.77 Y168.041 E.01689
G1 X136.943 Y171.869 E.16886
G1 X136.943 Y171.327 E.01689
G1 X140.229 Y168.041 E.14498
G1 X139.687 Y168.041 E.01689
G1 X136.943 Y170.786 E.12109
G1 X136.943 Y170.245 E.01689
G1 X139.146 Y168.041 E.09721
G1 X138.604 Y168.041 E.01689
G1 X136.943 Y169.703 E.07333
G1 X136.942 Y169.162 E.01689
G1 X138.063 Y168.041 E.04944
G1 X137.522 Y168.041 E.01689
G1 X136.9 Y168.662 E.02741
G1 X136.749 Y168.273 E.01305
G1 X137.15 Y167.871 E.01771
; WIPE_START
G1 X136.749 Y168.273 E-.21568
G1 X136.9 Y168.662 E-.1589
G1 X137.522 Y168.041 E-.33385
G1 X137.657 Y168.041 E-.05157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.48 Y170.638 Z2.4 F42000
G1 X115.495 Y176.059 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565825
G1 F6884.624
M204 S6000
G1 X115.527 Y176.351 E.01253
; LINE_WIDTH: 0.531074
G1 F7374.734
G1 X115.559 Y176.643 E.01169
; LINE_WIDTH: 0.494285
G1 F7975.811
G1 X115.578 Y176.792 E.00552
; LINE_WIDTH: 0.455495
G1 F8725.701
G1 X115.598 Y176.941 E.00505
; LINE_WIDTH: 0.416704
G1 F9631.235
G1 X115.617 Y177.089 E.00457
; LINE_WIDTH: 0.374805
G1 F10847.157
G1 X115.64 Y177.239 E.00409
; LINE_WIDTH: 0.329773
G1 F12549.995
G1 X115.662 Y177.388 E.00353
; LINE_WIDTH: 0.284742
G1 F14887.035
G1 X115.685 Y177.538 E.00298
; LINE_WIDTH: 0.242913
G1 F15000
G1 X115.704 Y177.651 E.00187
; LINE_WIDTH: 0.204298
G1 X115.723 Y177.763 E.00151
; LINE_WIDTH: 0.165683
G1 X115.743 Y177.876 E.00115
; LINE_WIDTH: 0.127067
G1 X115.762 Y177.989 E.00079
; LINE_WIDTH: 0.102329
G1 X115.772 Y178.044 E.00027
; OBJECT_ID: 8
; WIPE_START
G1 X115.762 Y177.989 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X108.141 Y177.571 Z2.4 F42000
G1 X92.078 Y176.689 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.967 Y176.689 E.00368
G1 X91.873 Y176.983 E.01023
G1 X91.365 Y176.555 E.02206
G3 X91.21 Y176.207 I.336 J-.357 E.01294
G1 X91.209 Y168.583 E.25291
G2 X70.791 Y172.089 I-9.904 J3.527 E.97562
G1 X70.791 Y176.121 E.13376
G1 X70.568 Y176.141 E.00742
G3 X70.409 Y174.288 I11.047 J-1.882 E.06174
G3 X70.418 Y171.664 I65.94 J-1.09 E.08706
G3 X81.489 Y161.211 I10.885 J.439 E.55924
G3 X90.8 Y166.774 I-.219 J10.941 E.37645
G1 X91.299 Y167.708 E.03513
G1 X102.709 Y167.709 E.37848
G3 X103.19 Y168.189 I-.009 J.49 E.02491
G1 X103.19 Y176.208 E.26599
G3 X102.709 Y176.688 I-.494 J-.013 E.02486
G1 X92.138 Y176.689 E.35066
M204 S10000
G1 X92.319 Y177.096 F42000
G1 F8843.478
M204 S6000
G1 X92.264 Y177.096 E.00181
G3 X91.594 Y178.948 I-16.71 J-5 E.06535
G1 X91.402 Y178.906 E.00653
G1 X91.402 Y177.118 E.0593
G3 X90.95 Y176.691 I.998 J-1.507 E.02073
G3 X90.803 Y176.227 I.787 J-.505 E.01633
G1 X90.802 Y168.661 E.25099
G2 X71.198 Y172.093 I-9.499 J3.448 E.93582
G1 X71.198 Y178.905 E.22598
G1 X71.004 Y178.946 E.00658
G3 X70.002 Y174.293 I10.362 J-4.665 E.15906
G3 X70.011 Y171.648 I66.389 J-1.094 E.08773
G3 X81.497 Y160.804 I11.292 J.455 E.5802
G3 X91.155 Y166.575 I-.229 J11.35 E.39048
G1 X91.543 Y167.3 E.0273
G1 X102.729 Y167.302 E.37105
G3 X103.597 Y168.169 I-.03 J.898 E.0448
G1 X103.597 Y176.228 E.26731
G3 X102.729 Y177.095 I-.902 J-.034 E.04475
G1 X92.379 Y177.096 E.34334
M204 S250
G1 X92.551 Y177.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X91.01 Y180.804 I-12.029 J-3.575 E.11273
G1 X91.01 Y177.301 E.10764
G3 X90.411 Y176.246 I.789 J-1.145 E.03856
G1 X90.41 Y168.736 E.23078
G2 X71.59 Y172.096 I-9.108 J3.372 E.83135
G1 X71.59 Y180.807 E.26766
G3 X69.61 Y174.296 I9.911 J-6.571 E.21207
G3 X69.619 Y171.633 I66.876 J-1.098 E.08186
G3 X81.505 Y160.411 I11.684 J.471 E.55613
G3 X91.778 Y166.908 I-.214 J11.709 E.3927
G1 X102.748 Y166.91 E.33708
G3 X103.989 Y168.15 I-.051 J1.291 E.05924
G1 X103.989 Y176.247 E.2488
G3 X102.748 Y177.487 I-1.295 J-.055 E.0592
G1 X92.611 Y177.488 E.31151
M204 S10000
G1 X91.773 Y177.414 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.360932
G1 F11320.355
M204 S6000
G1 X91.807 Y177.194 E.00578
M204 S10000
G1 X91.773 Y177.414 F42000
; LINE_WIDTH: 0.312743
G1 F13342.093
M204 S6000
G1 X91.739 Y177.635 E.0049
; LINE_WIDTH: 0.264555
G1 F15000
G1 X91.704 Y177.855 E.00403
; LINE_WIDTH: 0.216537
G1 X91.679 Y177.999 E.00208
; LINE_WIDTH: 0.16869
G1 X91.653 Y178.144 E.0015
; LINE_WIDTH: 0.120844
G1 X91.628 Y178.288 E.00093
; WIPE_START
G1 X91.653 Y178.144 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.81 Y170.513 Z2.4 F42000
G1 X91.864 Y167.871 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42354
G1 F9458.252
M204 S6000
G1 X91.45 Y168.286 E.01818
G1 X91.542 Y168.519 E.00781
G1 X91.542 Y168.731 E.00656
G1 X92.233 Y168.041 E.03028
G1 X92.771 Y168.041 E.01669
G1 X91.542 Y169.269 E.05388
G1 X91.543 Y169.807 E.01669
G1 X93.309 Y168.041 E.07748
G1 X93.847 Y168.041 E.01669
G1 X91.543 Y170.346 E.10109
G1 X91.543 Y170.884 E.01669
G1 X94.385 Y168.041 E.12469
G1 X94.924 Y168.041 E.01669
G1 X91.543 Y171.422 E.1483
G1 X91.543 Y171.96 E.01669
G1 X95.462 Y168.041 E.1719
G1 X96 Y168.041 E.01669
G1 X91.543 Y172.498 E.19551
G1 X91.543 Y173.037 E.01669
G1 X96.538 Y168.041 E.21911
G1 X97.077 Y168.041 E.01669
G1 X91.543 Y173.575 E.24271
G1 X91.543 Y174.113 E.01669
G1 X97.615 Y168.041 E.26632
G1 X98.153 Y168.041 E.01669
G1 X91.543 Y174.651 E.28992
G1 X91.543 Y175.189 E.01669
G1 X98.691 Y168.042 E.31353
G1 X99.229 Y168.042 E.01669
G1 X91.543 Y175.728 E.33713
G1 X91.543 Y176.173 E.01381
G1 X91.56 Y176.25 E.00243
G1 X99.768 Y168.042 E.36003
G1 X100.306 Y168.042 E.01669
G1 X91.992 Y176.356 E.36469
G1 X92.53 Y176.356 E.0167
G1 X100.844 Y168.042 E.36469
G1 X101.382 Y168.042 E.01669
G1 X93.068 Y176.356 E.36468
G1 X93.607 Y176.356 E.0167
G1 X101.921 Y168.042 E.36468
G1 X102.459 Y168.042 E.01669
G1 X94.145 Y176.356 E.36467
G1 X94.683 Y176.356 E.0167
G1 X102.852 Y168.187 E.35831
G1 X102.856 Y168.721 E.01656
G1 X95.222 Y176.356 E.33489
G1 X95.76 Y176.356 E.0167
G1 X102.856 Y169.259 E.31127
G1 X102.856 Y169.797 E.0167
G1 X96.298 Y176.356 E.28766
G1 X96.837 Y176.356 E.0167
G1 X102.856 Y170.336 E.26405
G1 X102.856 Y170.874 E.0167
G1 X97.375 Y176.355 E.24044
G1 X97.913 Y176.355 E.0167
G1 X102.856 Y171.412 E.21682
G1 X102.856 Y171.951 E.0167
G1 X98.452 Y176.355 E.19321
G1 X98.99 Y176.355 E.0167
G1 X102.856 Y172.489 E.1696
G1 X102.856 Y173.027 E.0167
G1 X99.528 Y176.355 E.14598
G1 X100.067 Y176.355 E.0167
G1 X102.856 Y173.565 E.12237
G1 X102.856 Y174.104 E.0167
G1 X100.605 Y176.355 E.09876
G1 X101.143 Y176.355 E.0167
G1 X102.856 Y174.642 E.07514
G1 X102.856 Y175.18 E.0167
G1 X101.682 Y176.355 E.05153
G1 X102.22 Y176.355 E.0167
G1 X102.856 Y175.718 E.02792
G1 X102.856 Y176.18 E.01432
G3 X102.825 Y176.288 I-.19 J.002 E.00352
G3 X102.589 Y176.525 I-2.8 J-2.554 E.01038
; WIPE_START
G1 X102.825 Y176.288 E-.12711
G1 X102.856 Y176.18 E-.04255
G1 X102.856 Y175.718 E-.17547
G1 X102.22 Y176.355 E-.34204
G1 X102.028 Y176.355 E-.07283
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.411 Y176.828 Z2.4 F42000
G1 X70.972 Y178.285 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110013
G1 F15000
M204 S6000
G1 X70.957 Y178.202 E.00046
; LINE_WIDTH: 0.136191
G1 X70.941 Y178.119 E.00064
; LINE_WIDTH: 0.173546
G1 X70.917 Y177.975 E.00156
; LINE_WIDTH: 0.222088
G1 X70.893 Y177.831 E.00213
; LINE_WIDTH: 0.270629
G1 X70.868 Y177.687 E.00271
; LINE_WIDTH: 0.316134
G1 F13176.484
G1 X70.847 Y177.544 E.00323
; LINE_WIDTH: 0.358641
G1 F11402.493
G1 X70.826 Y177.401 E.00373
; LINE_WIDTH: 0.401147
G1 F10049.5
G1 X70.805 Y177.257 E.00423
; LINE_WIDTH: 0.440646
G1 F9051.467
G1 X70.786 Y177.115 E.00464
; LINE_WIDTH: 0.477108
G1 F8291.352
G1 X70.768 Y176.973 E.00507
; LINE_WIDTH: 0.513569
G1 F7649.01
G1 X70.75 Y176.831 E.00549
; LINE_WIDTH: 0.556645
G1 F7007.643
G1 X70.696 Y176.334 E.02093
; OBJECT_ID: 7
; WIPE_START
G1 X70.75 Y176.831 E-.76
; WIPE_END
M73 P75 R6
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X63.118 Y176.785 Z2.4 F42000
G1 X47.317 Y176.691 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X47.206 Y176.691 E.00365
G1 X47.108 Y177.014 E.0112
G1 X46.565 Y176.556 E.02357
G3 X46.41 Y176.209 I.336 J-.357 E.01294
G1 X46.409 Y168.419 E.25841
G2 X26.391 Y171.89 I-9.704 J3.493 E.95591
G1 X26.391 Y176.302 E.14636
G1 X26.168 Y176.322 E.00743
G3 X26.009 Y174.49 I10.798 J-1.857 E.06107
G3 X26.018 Y171.478 I76.371 J-1.29 E.0999
G3 X37.122 Y161.219 I10.7 J.442 E.55677
G3 X46.082 Y166.775 I-.452 J10.733 E.36556
G1 X46.569 Y167.709 E.03494
G1 X57.919 Y167.71 E.37651
G3 X58.39 Y168.19 I-.027 J.497 E.0245
G1 X58.39 Y176.219 E.26632
G3 X57.916 Y176.689 I-.497 J-.027 E.02427
G1 X47.377 Y176.691 E.34962
M204 S10000
G1 X47.562 Y177.098 F42000
G1 F8843.478
M204 S6000
G1 X47.508 Y177.098 E.00179
G3 X46.797 Y179.106 I-15.436 J-4.335 E.07074
G1 X46.602 Y179.066 E.0066
G1 X46.602 Y177.12 E.06457
G3 X46.15 Y176.692 I.999 J-1.508 E.02073
G3 X46.003 Y176.229 I.788 J-.505 E.01632
G1 X46.002 Y168.497 E.25646
G2 X26.798 Y171.894 I-9.299 J3.413 E.91613
G1 X26.798 Y179.068 E.23799
G1 X26.603 Y179.108 E.00661
G3 X25.602 Y174.493 I10.222 J-4.632 E.15782
G3 X25.611 Y171.462 I76.879 J-1.294 E.10055
G3 X37.139 Y160.812 I11.107 J.458 E.57803
G3 X46.439 Y166.579 I-.471 J11.142 E.37942
G1 X46.816 Y167.302 E.02702
G1 X57.935 Y167.303 E.36885
G3 X58.797 Y168.17 I-.047 J.909 E.04447
G1 X58.797 Y176.235 E.26751
G3 X57.933 Y177.097 I-.909 J-.048 E.04434
G1 X47.622 Y177.098 E.34205
M204 S250
G1 X47.798 Y177.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X46.21 Y180.942 I-11.235 J-3.077 E.1173
G1 X46.21 Y177.302 E.11186
G3 X45.611 Y176.248 I.789 J-1.145 E.03856
G1 X45.61 Y168.573 E.23582
G2 X27.19 Y171.898 I-8.908 J3.336 E.81314
G1 X27.19 Y180.944 E.27798
G3 X25.21 Y174.497 I9.714 J-6.511 E.21021
G3 X25.219 Y171.447 I77.353 J-1.298 E.09374
G3 X37.156 Y160.42 I11.5 J.474 E.55439
G3 X47.054 Y166.91 I-.466 J11.502 E.38195
G1 X57.95 Y166.911 E.33483
G3 X59.189 Y168.151 I-.068 J1.306 E.05902
G1 X59.189 Y176.25 E.24886
G3 X57.95 Y177.489 I-1.306 J-.068 E.05898
G1 X47.858 Y177.49 E.31008
M204 S10000
G1 X46.997 Y177.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362977
G1 F11248.009
M204 S6000
G1 X46.967 Y177.623 E.00541
; LINE_WIDTH: 0.323739
G1 F12819.652
G1 X46.936 Y177.828 E.00474
; LINE_WIDTH: 0.284027
G1 F14931.138
G1 X46.916 Y177.945 E.00235
; LINE_WIDTH: 0.243842
G1 F15000
G1 X46.896 Y178.063 E.00196
; LINE_WIDTH: 0.203658
G1 X46.876 Y178.181 E.00156
; LINE_WIDTH: 0.163473
G1 X46.856 Y178.298 E.00117
; LINE_WIDTH: 0.120145
G1 X46.828 Y178.449 E.00096
M204 S10000
G1 X46.997 Y177.418 F42000
; LINE_WIDTH: 0.402215
G1 F10019.639
M204 S6000
G1 X47.028 Y177.212 E.00607
; WIPE_START
G1 X46.997 Y177.418 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X47.099 Y169.786 Z2.4 F42000
G1 X47.125 Y167.872 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42232
G1 F9488.666
M204 S6000
G1 X46.714 Y168.283 E.01797
G1 X46.742 Y168.354 E.00237
G1 X46.742 Y168.791 E.01351
G1 X47.492 Y168.042 E.03276
G1 X48.028 Y168.042 E.01659
G1 X46.743 Y169.328 E.05621
G1 X46.743 Y169.864 E.01659
G1 X48.565 Y168.042 E.07967
G1 X49.101 Y168.042 E.01659
G1 X46.743 Y170.401 E.10312
G1 X46.743 Y170.937 E.01659
G1 X49.638 Y168.042 E.12657
G1 X50.174 Y168.042 E.01659
G1 X46.743 Y171.474 E.15003
G1 X46.743 Y172.01 E.01659
G1 X50.711 Y168.043 E.17348
G1 X51.247 Y168.043 E.01659
G1 X46.743 Y172.547 E.19693
G1 X46.743 Y173.083 E.01659
G1 X51.784 Y168.043 E.22039
G1 X52.32 Y168.043 E.01659
G1 X46.743 Y173.62 E.24384
G1 X46.743 Y174.156 E.01659
G1 X52.857 Y168.043 E.26729
G1 X53.393 Y168.043 E.01659
G1 X46.743 Y174.693 E.29074
G1 X46.743 Y175.229 E.01659
G1 X53.93 Y168.043 E.3142
G1 X54.466 Y168.043 E.01659
G1 X46.743 Y175.766 E.33765
G1 X46.744 Y176.174 E.01264
G2 X46.77 Y176.276 I.156 J.013 E.0033
G1 X55.003 Y168.043 E.35995
G1 X55.539 Y168.043 E.01659
G1 X47.225 Y176.357 E.36352
G1 X47.761 Y176.357 E.01659
G1 X56.076 Y168.043 E.36352
G1 X56.612 Y168.043 E.01659
G1 X48.298 Y176.357 E.36351
G1 X48.835 Y176.357 E.01659
G1 X57.149 Y168.043 E.36351
G1 X57.685 Y168.043 E.01659
G1 X49.371 Y176.357 E.3635
G1 X49.908 Y176.357 E.01659
G1 X58.056 Y168.209 E.35626
G1 X58.056 Y168.745 E.01658
G1 X50.444 Y176.357 E.33282
G1 X50.981 Y176.357 E.01659
G1 X58.056 Y169.282 E.30935
G1 X58.056 Y169.818 E.01659
G1 X51.518 Y176.357 E.28589
G1 X52.054 Y176.357 E.01659
G1 X58.056 Y170.355 E.26243
G1 X58.056 Y170.891 E.01659
G1 X52.591 Y176.357 E.23897
G1 X53.127 Y176.357 E.01659
G1 X58.056 Y171.428 E.21551
G1 X58.056 Y171.964 E.01659
G1 X53.664 Y176.357 E.19204
G1 X54.201 Y176.357 E.01659
G1 X58.056 Y172.501 E.16858
G1 X58.056 Y173.037 E.01659
G1 X54.737 Y176.357 E.14512
G1 X55.274 Y176.357 E.01659
G1 X58.056 Y173.574 E.12166
G1 X58.056 Y174.111 E.01659
G1 X55.811 Y176.356 E.0982
G1 X56.347 Y176.356 E.01659
G1 X58.056 Y174.647 E.07473
G1 X58.056 Y175.184 E.01659
G1 X56.884 Y176.356 E.05127
G1 X57.42 Y176.356 E.01659
G1 X58.056 Y175.72 E.02781
G1 X58.05 Y176.235 E.01592
G3 X57.787 Y176.526 I-.812 J-.469 E.0122
; WIPE_START
G1 X58.027 Y176.284 E-.12954
G1 X58.05 Y176.235 E-.02035
G1 X58.056 Y175.72 E-.19571
G1 X57.42 Y176.356 E-.34182
G1 X57.229 Y176.356 E-.07259
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X49.615 Y176.876 Z2.4 F42000
G1 X26.572 Y178.449 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.115067
G1 F15000
M204 S6000
G1 X26.552 Y178.337 E.00067
; LINE_WIDTH: 0.151343
G1 X26.531 Y178.225 E.001
; LINE_WIDTH: 0.189555
G1 X26.511 Y178.105 E.00146
; LINE_WIDTH: 0.229717
G1 X26.491 Y177.985 E.00186
; LINE_WIDTH: 0.269878
G1 X26.471 Y177.865 E.00225
; LINE_WIDTH: 0.31004
G1 F13477.127
G1 X26.451 Y177.744 E.00265
; LINE_WIDTH: 0.349892
G1 F11727.479
G1 X26.431 Y177.608 E.00345
; LINE_WIDTH: 0.389415
G1 F10389.766
G1 X26.411 Y177.472 E.00389
; LINE_WIDTH: 0.428939
G1 F9325.983
G1 X26.392 Y177.335 E.00434
; LINE_WIDTH: 0.465708
G1 F8514.908
G1 X26.374 Y177.199 E.00472
; LINE_WIDTH: 0.499753
G1 F7880.346
G1 X26.357 Y177.064 E.0051
; LINE_WIDTH: 0.533798
G1 F7333.804
G1 X26.34 Y176.928 E.00548
; LINE_WIDTH: 0.565952
G1 F6882.955
G1 X26.297 Y176.515 E.01769
; OBJECT_ID: 3
; WIPE_START
G1 X26.34 Y176.928 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X28.001 Y169.478 Z2.4 F42000
G1 X32.642 Y148.651 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X32.081 Y148.513 E.01916
G3 X26.391 Y141.01 I2.133 J-7.527 E.3352
G1 X26.391 Y106.99 E1.12848
G3 X34.19 Y99.191 I7.823 J.024 E.40607
G1 X87.71 Y99.191 E1.77533
G3 X95.509 Y106.99 I-.024 J7.823 E.40607
G1 X95.509 Y141.01 E1.12848
G3 X87.71 Y148.809 I-7.823 J-.024 E.40607
G1 X34.19 Y148.809 E1.77533
G3 X32.701 Y148.661 I.024 J-7.823 E.04972
M204 S10000
G1 X32.73 Y148.253 F42000
G1 F8843.478
M204 S6000
G1 X31.914 Y148.036 E.02801
G3 X26.798 Y141.006 I2.3 J-7.05 E.30819
G1 X26.798 Y106.994 E1.12822
G3 X34.194 Y99.598 I7.416 J.019 E.38512
G1 X87.706 Y99.598 E1.77508
G3 X95.102 Y106.994 I-.019 J7.416 E.38512
G1 X95.102 Y141.006 E1.12822
G3 X87.706 Y148.402 I-7.416 J-.019 E.38512
G1 X34.194 Y148.402 E1.77508
G3 X32.789 Y148.264 I.019 J-7.416 E.04691
M204 S250
G1 X32.829 Y147.874 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X32.035 Y147.664 E.02524
G3 X27.19 Y141.002 I2.178 J-6.677 E.27046
G1 X27.19 Y106.998 E1.04485
G3 X34.198 Y99.99 I7.023 J.015 E.33805
G1 X87.702 Y99.99 E1.64403
G3 X94.71 Y106.998 I-.015 J7.023 E.33805
G1 X94.71 Y141.002 E1.04485
G3 X87.702 Y148.01 I-7.023 J-.015 E.33805
G1 X34.198 Y148.01 E1.64404
G3 X32.888 Y147.884 I.015 J-7.023 E.04051
; WIPE_START
M204 S6000
G1 X32.035 Y147.664 E-.33461
G1 X31.517 Y147.476 E-.20919
G1 X31.018 Y147.246 E-.20913
G1 X31.001 Y147.237 E-.00707
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.708 Y141.228 Z2.4 F42000
G1 X68.941 Y98.809 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y98.809 E.62194
G3 X95.891 Y107.01 I-.006 J8.207 E.42723
G1 X95.891 Y140.99 E1.12718
G3 X87.69 Y149.191 I-8.207 J-.006 E.42723
G1 X34.21 Y149.191 E1.77403
G3 X26.009 Y140.99 I.006 J-8.207 E.42724
G1 X26.009 Y107.01 E1.12718
G3 X34.21 Y98.809 I8.207 J.006 E.42723
G1 X52.959 Y98.809 E.62194
G1 X52.959 Y93.83 E.16517
G3 X53.48 Y93.309 I.501 J-.02 E.02743
G1 X68.431 Y93.309 E.49596
G3 X68.941 Y93.83 I.016 J.495 E.02716
G1 X68.941 Y98.749 E.16319
M204 S10000
G1 X69.348 Y98.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y98.402 E.60858
G3 X96.298 Y107.006 I-.01 J8.614 E.44816
G1 X96.298 Y140.994 E1.12745
G3 X87.694 Y149.598 I-8.614 J-.01 E.44816
G1 X34.206 Y149.598 E1.7743
G3 X25.602 Y140.994 I.01 J-8.614 E.44817
G1 X25.602 Y107.006 E1.12745
G3 X34.206 Y98.402 I8.614 J.01 E.44816
G1 X52.552 Y98.402 E.60858
G1 X52.552 Y93.818 E.15207
G3 X53.468 Y92.902 I.911 J-.005 E.04779
G1 X68.444 Y92.902 E.49677
G3 X69.348 Y93.818 I.004 J.901 E.04755
G1 X69.348 Y98.342 E.15008
M204 S250
G1 X69.74 Y98.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y98.01 E.5518
G3 X96.69 Y107.002 I-.015 J9.007 E.43382
G1 X96.69 Y140.998 E1.0446
G3 X87.698 Y149.99 I-9.007 J-.015 E.43382
G1 X34.202 Y149.99 E1.64378
G3 X25.21 Y140.998 I.015 J-9.007 E.43382
G1 X25.21 Y107.002 E1.0446
G3 X34.202 Y98.01 I9.007 J.015 E.43382
G1 X52.16 Y98.01 E.5518
G1 X52.16 Y93.806 E.12917
G3 X53.456 Y92.51 I1.306 J.01 E.06244
G1 X68.456 Y92.51 E.46089
G3 X69.74 Y93.806 I-.008 J1.292 E.06224
G1 X69.74 Y97.95 E.12733
; WIPE_START
M204 S6000
G1 X71.74 Y97.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.995 Y96.49 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51922
G1 F7558.261
M204 S6000
G1 X66.234 Y96.49 E.00926
G1 X66.234 Y96.014 E.0185
G1 X55.666 Y96.013 E.41014
G1 X55.666 Y96.489 E.01848
G1 X65.935 Y96.49 E.39859
M204 S10000
G1 X66.661 Y96.917 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.66 Y95.587 E.04087
G1 X55.24 Y95.587 E.35089
G1 X55.239 Y96.916 E.04084
G1 X66.601 Y96.917 E.34913
M204 S10000
G1 X67.039 Y97.294 F42000
G1 F9547.299
M204 S6000
G1 X67.036 Y95.21 E.06405
G1 X54.864 Y95.209 E.37403
G1 X54.861 Y97.293 E.06401
G1 X66.979 Y97.294 E.37233
M204 S10000
G1 X67.416 Y97.671 F42000
G1 F9547.299
M204 S6000
G1 X67.413 Y94.833 E.08722
G1 X54.487 Y94.832 E.39718
G1 X54.484 Y97.67 E.08718
G1 X67.356 Y97.671 E.39553
M204 S10000
G1 X67.794 Y98.048 F42000
G1 F9547.299
M204 S6000
G1 X67.79 Y94.456 E.11039
G1 X54.11 Y94.455 E.42032
M73 P76 R6
G1 X54.106 Y98.047 E.11035
G1 X67.734 Y98.048 E.41873
M204 S10000
G1 X68.171 Y98.425 F42000
G1 F9547.299
M204 S6000
G1 X68.166 Y94.078 E.13357
G1 X53.734 Y94.078 E.44347
G1 X53.729 Y98.424 E.13352
G1 X68.111 Y98.425 E.44193
M204 S10000
G1 X68.549 Y98.803 F42000
G1 F9547.299
M204 S6000
G1 X68.543 Y93.854 E.15205
G1 X68.496 Y93.734 E.00396
G1 X68.36 Y93.701 E.00429
G1 X53.501 Y93.701 E.45656
G1 X53.384 Y93.743 E.00382
G1 X53.357 Y93.854 E.00352
G1 X53.351 Y98.801 E.152
G1 X68.489 Y98.803 E.46512
; OBJECT_ID: 1
; WIPE_START
G1 X66.489 Y98.802 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X69.187 Y91.663 Z2.4 F42000
G1 X91.298 Y33.151 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.943 Y33.646 E.027
G3 X94.509 Y39.19 I-4.756 J5.567 E.20905
G1 X94.509 Y73.21 E1.12848
G3 X87.21 Y80.509 I-7.322 J-.023 E.38003
G1 X33.69 Y80.509 E1.77533
G3 X26.391 Y73.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E1.12848
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X91.247 Y33.119 I-.023 J7.322 E.14199
M204 S10000
G1 X91.053 Y33.475 F42000
G1 F8843.478
M204 S6000
G1 X91.679 Y33.955 E.0262
G3 X94.102 Y39.194 I-4.492 J5.257 E.19751
G1 X94.102 Y73.206 E1.12822
G3 X87.206 Y80.102 I-6.915 J-.018 E.35908
G1 X33.694 Y80.102 E1.77508
G3 X26.798 Y73.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E1.12822
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X91.001 Y33.444 I-.018 J6.915 E.13338
M204 S250
G1 X90.814 Y33.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X93.71 Y39.198 I-3.626 J5.421 E.19621
G1 X93.71 Y73.202 E1.04485
G3 X87.202 Y79.71 I-6.522 J-.014 E.31393
G1 X33.698 Y79.71 E1.64403
G3 X27.19 Y73.202 I.014 J-6.522 E.31393
G1 X27.19 Y39.198 E1.04485
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.202 Y32.69 E1.64403
G3 X90.764 Y33.758 I-.014 J6.522 E.11587
; WIPE_START
M204 S6000
G1 X91.428 Y34.25 E-.31394
G1 X91.829 Y34.624 E-.20851
G1 X92.244 Y35.092 E-.23756
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.696 Y33.956 Z2.4 F42000
G1 X68.441 Y31.509 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.187 Y31.509 E.62186
G3 X94.891 Y39.21 I-.002 J7.706 E.40128
G1 X94.891 Y73.19 E1.12718
G3 X87.19 Y80.891 I-7.706 J-.005 E.40119
G1 X33.71 Y80.891 E1.77403
G3 X26.009 Y73.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E1.12718
G3 X33.71 Y31.509 I7.706 J.005 E.40119
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.53 E.16518
G3 X52.98 Y26.009 I.495 J-.025 E.02752
G1 X67.931 Y26.009 E.49596
G3 X68.441 Y26.53 I.016 J.495 E.02716
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.193 Y31.102 E.60852
G3 X95.298 Y39.206 I-.008 J8.113 E.42218
G1 X95.298 Y73.194 E1.12745
G3 X87.194 Y81.298 I-8.113 J-.01 E.42212
G1 X33.706 Y81.298 E1.77431
G3 X25.602 Y73.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E1.12745
G3 X33.706 Y31.102 I8.113 J.009 E.42212
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.518 E.15207
G3 X52.968 Y25.602 I.906 J-.01 E.04785
G1 X67.944 Y25.602 E.49678
G3 X68.848 Y26.518 I.004 J.901 E.04755
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.197 Y30.71 E.55178
G3 X95.69 Y39.202 I-.013 J8.506 E.40972
G1 X95.69 Y73.198 E1.0446
G3 X87.198 Y81.69 I-8.506 J-.014 E.4097
G1 X33.702 Y81.69 E1.64378
G3 X25.21 Y73.198 I.014 J-8.506 E.4097
G1 X25.21 Y39.202 E1.0446
G3 X33.702 Y30.71 I8.506 J.014 E.4097
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.506 E.12917
G3 X52.956 Y25.21 I1.3 J.004 E.06251
G1 X67.956 Y25.21 E.46089
G3 X69.24 Y26.506 I-.008 J1.292 E.06224
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.496 Y29.19 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519125
G1 F7559.77
M204 S6000
G1 X65.734 Y29.19 E.00925
G1 X65.734 Y28.714 E.01849
G1 X55.166 Y28.713 E.41006
G1 X55.166 Y29.189 E.01847
G1 X65.436 Y29.19 E.39852
M204 S10000
G1 X66.161 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.287 E.04087
G1 X54.74 Y28.287 E.35089
G1 X54.739 Y29.616 E.04084
G1 X66.101 Y29.617 E.34913
M204 S10000
G1 X66.539 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.91 E.06404
G1 X54.364 Y27.91 E.37403
G1 X54.361 Y29.993 E.06401
G1 X66.479 Y29.994 E.37233
M204 S10000
G1 X66.916 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.533 E.08721
G1 X53.987 Y27.532 E.39718
G1 X53.984 Y30.37 E.08718
G1 X66.856 Y30.371 E.39553
M204 S10000
G1 X67.294 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.156 E.11038
G1 X53.61 Y27.155 E.42032
G1 X53.606 Y30.747 E.11035
G1 X67.234 Y30.748 E.41873
M204 S10000
G1 X67.671 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.779 E.13356
G1 X53.234 Y26.778 E.44347
G1 X53.229 Y31.124 E.13352
G1 X67.611 Y31.125 E.44193
M204 S10000
G1 X68.049 Y31.502 F42000
G1 F9547.299
M204 S6000
G1 X68.043 Y26.554 E.15205
G1 X67.996 Y26.434 E.00395
G1 X67.86 Y26.401 E.0043
G1 X53.001 Y26.401 E.45656
G1 X52.882 Y26.445 E.0039
G1 X52.857 Y26.554 E.00344
G1 X52.851 Y31.501 E.152
G1 X67.989 Y31.502 E.46512
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.989 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 11/15
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I-.457 J1.128 P1  F42000
G1 X175.407 Y75.816 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X175.233 Y76.272 E.01618
G3 X168.31 Y80.909 I-6.948 J-2.887 E.29296
G1 X114.79 Y80.909 E1.77533
G3 X107.291 Y73.41 I.023 J-7.523 E.39045
G1 X107.291 Y39.39 E1.12848
G3 X114.79 Y31.891 I7.524 J.024 E.39043
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.023 J7.522 E.39045
G1 X175.809 Y73.41 E1.12848
G3 X175.438 Y75.719 I-7.524 J-.024 E.07791
G1 X175.425 Y75.759 E.00139
M204 S10000
G1 X175.025 Y75.675 F42000
G1 F8843.478
M204 S6000
G1 X174.858 Y76.116 E.01565
G3 X168.306 Y80.502 I-6.572 J-2.73 E.27719
G1 X114.794 Y80.502 E1.77507
G3 X107.698 Y73.406 I.019 J-7.115 E.3695
G1 X107.698 Y39.394 E1.12823
G3 X114.794 Y32.298 I7.116 J.02 E.36948
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.018 J7.115 E.3695
G1 X175.402 Y73.406 E1.12822
G3 X175.051 Y75.593 I-7.116 J-.02 E.0738
G1 X175.043 Y75.618 E.00086
M204 S250
G1 X174.649 Y75.537 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X174.495 Y75.966 E.01402
G3 X168.302 Y80.11 I-6.209 J-2.58 E.24269
G1 X114.798 Y80.11 E1.64403
G3 X108.09 Y73.402 I.015 J-6.722 E.32358
G1 X108.09 Y39.398 E1.04485
G3 X114.798 Y32.69 I6.723 J.015 E.32356
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.014 J6.722 E.32358
G1 X175.01 Y73.402 E1.04485
G3 X174.755 Y75.22 I-6.723 J-.015 E.0566
G1 X174.668 Y75.48 E.0084
; WIPE_START
M204 S6000
G1 X174.495 Y75.966 E-.19614
G1 X174.155 Y76.679 E-.30009
M73 P77 R6
G1 X173.879 Y77.128 E-.20034
G1 X173.778 Y77.261 E-.06343
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.205 Y70.517 Z2.6 F42000
G1 X149.541 Y31.509 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I-.005 J7.906 E.41161
G1 X176.191 Y73.39 E1.12718
G3 X168.29 Y81.291 I-7.907 J-.006 E.41159
G1 X114.81 Y81.291 E1.77403
G3 X106.909 Y73.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E1.12718
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.52 E.16551
G3 X134.08 Y26.009 I.495 J-.016 E.02719
G1 X149.027 Y26.009 E.49582
G3 X149.541 Y26.52 I.02 J.494 E.02697
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.01 J8.314 E.43254
G1 X176.598 Y73.394 E1.12745
G3 X168.294 Y81.698 I-8.315 J-.011 E.43252
G1 X114.806 Y81.698 E1.7743
G3 X106.502 Y73.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E1.12745
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.512 E.15227
G3 X134.068 Y25.602 I.902 J-.007 E.04771
G1 X149.039 Y25.602 E.49662
G3 X149.948 Y26.512 I.008 J.901 E.04751
G1 X149.948 Y31.042 E.15027
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.99 Y39.402 I-.014 J8.706 E.41935
G1 X176.99 Y73.398 E1.0446
G3 X168.298 Y82.09 I-8.708 J-.015 E.41933
G1 X114.802 Y82.09 E1.64378
G3 X106.11 Y73.398 I.014 J-8.706 E.41935
G1 X106.11 Y39.402 E1.0446
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.504 E.12923
G3 X134.056 Y25.21 I1.296 J.002 E.06251
G1 X149.051 Y25.21 E.46075
G3 X150.34 Y26.504 I-.004 J1.293 E.06232
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 11 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.6 F4000
            G39.3 S1
            G0 Z2.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer11 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X146.597 Y29.19 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51919
G1 F7558.737
M204 S6000
G1 X146.836 Y29.19 E.00925
G1 X146.835 Y28.713 E.01849
G1 X136.264 Y28.713 E.41027
G1 X136.264 Y29.189 E.01847
G1 X146.537 Y29.19 E.39871
M204 S10000
G1 X147.263 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.262 Y28.287 E.04087
G1 X135.838 Y28.287 E.35103
G1 X135.837 Y29.616 E.04084
G1 X147.203 Y29.617 E.34922
M204 S10000
G1 X147.64 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X147.639 Y27.91 E.06404
G1 X135.461 Y27.909 E.37419
G1 X135.46 Y29.993 E.06401
G1 X147.58 Y29.994 E.3724
M204 S10000
G1 X148.017 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X148.016 Y27.533 E.08722
G1 X135.084 Y27.532 E.39735
G1 X135.083 Y30.37 E.08718
G1 X147.957 Y30.371 E.39558
M204 S10000
G1 X148.394 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X148.393 Y27.155 E.11039
G1 X134.707 Y27.155 E.42051
G1 X134.706 Y30.747 E.11035
G1 X148.334 Y30.748 E.41876
M204 S10000
G1 X148.772 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X148.77 Y26.778 E.13356
G1 X134.33 Y26.778 E.44368
G1 X134.328 Y31.124 E.13352
G1 X148.712 Y31.125 E.44194
M204 S10000
G1 X149.149 Y31.502 F42000
G1 F9547.299
M204 S6000
M73 P77 R5
G1 X149.147 Y26.564 E.15175
G1 X149.106 Y26.445 E.00386
G1 X148.945 Y26.401 E.00511
G1 X134.101 Y26.401 E.4561
G1 X133.99 Y26.438 E.00361
G1 X133.953 Y26.562 E.00395
G1 X133.951 Y31.501 E.15176
G1 X149.089 Y31.502 E.46512
; OBJECT_ID: 4
; WIPE_START
G1 X147.089 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X145.369 Y38.938 Z2.6 F42000
G1 X129.214 Y108.791 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X129.106 Y108.791 E.00355
G1 X129.008 Y109.114 E.0112
G1 X128.465 Y108.656 E.02357
G3 X128.31 Y108.309 I.349 J-.363 E.01292
G1 X128.309 Y100.519 E.25841
G2 X108.291 Y103.99 I-9.704 J3.493 E.9559
G1 X108.291 Y108.401 E.14632
G1 X108.068 Y108.421 E.00742
G3 X107.909 Y106.59 I10.736 J-1.853 E.06104
G3 X107.918 Y103.578 I76.422 J-1.29 E.09989
G3 X119.066 Y93.32 I10.701 J.442 E.55826
G3 X127.982 Y98.875 I-.5 J10.734 E.36407
G1 X128.469 Y99.809 E.03495
G1 X139.819 Y99.81 E.37651
G3 X140.29 Y100.29 I-.027 J.497 E.02447
G1 X140.29 Y108.319 E.26634
G3 X139.809 Y108.789 I-.497 J-.027 E.0245
G1 X129.274 Y108.791 E.34948
M204 S10000
G1 X129.46 Y109.198 F42000
G1 F8843.478
M204 S6000
G1 X129.408 Y109.198 E.00174
G3 X128.697 Y111.206 I-15.419 J-4.329 E.07074
G1 X128.502 Y111.166 E.0066
G1 X128.502 Y109.22 E.06456
G3 X128.05 Y108.792 I.999 J-1.508 E.02073
G3 X127.903 Y108.329 I.791 J-.506 E.01633
G1 X127.902 Y100.597 E.25646
G2 X108.698 Y103.994 I-9.299 J3.413 E.91613
G1 X108.698 Y111.168 E.23799
G1 X108.503 Y111.208 E.00661
G3 X107.502 Y106.593 I10.221 J-4.632 E.15782
G3 X107.511 Y103.562 I76.884 J-1.294 E.10055
G3 X119.085 Y92.913 I11.108 J.459 E.57954
G3 X128.339 Y98.679 I-.519 J11.143 E.37792
G1 X128.716 Y99.402 E.02702
G1 X139.835 Y99.403 E.36885
G3 X140.697 Y100.27 I-.048 J.909 E.04446
G1 X140.697 Y108.335 E.26753
G3 X139.829 Y109.197 I-.909 J-.048 E.04448
G1 X129.52 Y109.198 E.34195
M204 S250
G1 X129.698 Y109.59 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.11 Y113.044 I-11.262 J-3.087 E.11733
G1 X128.11 Y109.402 E.11189
G3 X127.511 Y108.348 I.808 J-1.156 E.03852
G1 X127.51 Y100.673 E.23582
G2 X109.09 Y103.998 I-8.908 J3.336 E.81314
G1 X109.09 Y113.044 E.27798
G3 X107.11 Y106.597 I9.672 J-6.498 E.21023
G3 X107.119 Y103.547 I77.355 J-1.298 E.09374
G3 X119.102 Y92.521 I11.501 J.475 E.5558
G3 X128.954 Y99.01 I-.513 J11.502 E.38055
G1 X139.851 Y99.011 E.33483
G3 X141.089 Y100.251 I-.068 J1.306 E.05902
G1 X141.089 Y108.35 E.24886
G3 X139.848 Y109.589 I-1.306 J-.068 E.05902
G1 X129.758 Y109.59 E.31004
M204 S10000
G1 X128.897 Y109.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.362598
G1 F11261.333
M204 S6000
G1 X128.867 Y109.724 E.00542
; LINE_WIDTH: 0.32312
G1 F12847.996
G1 X128.836 Y109.93 E.00475
; LINE_WIDTH: 0.280704
G1 F15000
G1 X128.813 Y110.065 E.00265
; LINE_WIDTH: 0.235318
G1 X128.79 Y110.2 E.00215
; LINE_WIDTH: 0.189933
G1 X128.768 Y110.335 E.00164
; LINE_WIDTH: 0.149665
G1 X128.748 Y110.442 E.00095
; LINE_WIDTH: 0.114502
G1 X128.728 Y110.549 E.00064
M204 S10000
G1 X128.897 Y109.518 F42000
; LINE_WIDTH: 0.402077
G1 F10023.483
M204 S6000
G1 X128.928 Y109.313 E.00609
; WIPE_START
G1 X128.897 Y109.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.474 Y108.186 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42451
G1 F9434.209
M204 S6000
G2 X128.838 Y108.529 I2.417 J-2.201 E.01557
G1 X128.86 Y108.457 E.00232
M73 P78 R5
G1 X129.285 Y108.457 E.01323
G1 X128.643 Y107.816 E.02821
G1 X128.643 Y107.276 E.01678
G1 X129.825 Y108.457 E.05194
G1 X130.364 Y108.457 E.01678
G1 X128.643 Y106.736 E.07568
G1 X128.643 Y106.197 E.01678
G1 X130.904 Y108.457 E.09941
G1 X131.443 Y108.457 E.01678
G1 X128.643 Y105.657 E.12314
G1 X128.643 Y105.117 E.01678
G1 X131.983 Y108.457 E.14687
G1 X132.523 Y108.457 E.01678
G1 X128.643 Y104.577 E.1706
G1 X128.643 Y104.038 E.01678
G1 X133.062 Y108.457 E.19433
G1 X133.602 Y108.457 E.01678
G1 X128.643 Y103.498 E.21807
G1 X128.643 Y102.958 E.01678
G1 X134.141 Y108.457 E.2418
G1 X134.681 Y108.457 E.01678
G1 X128.643 Y102.419 E.26553
G1 X128.643 Y101.879 E.01678
G1 X135.22 Y108.457 E.28926
G1 X135.76 Y108.457 E.01678
G1 X128.642 Y101.339 E.31299
G1 X128.642 Y100.799 E.01678
G1 X136.3 Y108.457 E.33673
G1 X136.839 Y108.457 E.01678
G1 X128.525 Y100.142 E.36563
G1 X129.065 Y100.142 E.01678
G1 X137.379 Y108.457 E.36562
G1 X137.918 Y108.456 E.01678
G1 X129.604 Y100.142 E.36561
G1 X130.144 Y100.142 E.01678
G1 X138.458 Y108.456 E.36561
G1 X138.998 Y108.456 E.01678
G1 X130.684 Y100.142 E.3656
G1 X131.223 Y100.142 E.01678
G1 X139.537 Y108.456 E.3656
G1 X139.79 Y108.456 E.00785
G2 X139.95 Y108.335 I.005 J-.16 E.00675
G1 X131.763 Y100.142 E.36014
G1 X132.303 Y100.143 E.01678
G1 X139.956 Y107.796 E.33657
G1 X139.956 Y107.257 E.01678
G1 X132.842 Y100.143 E.31284
G1 X133.382 Y100.143 E.01678
G1 X139.956 Y106.717 E.2891
G1 X139.956 Y106.177 E.01678
G1 X133.922 Y100.143 E.26537
G1 X134.462 Y100.143 E.01678
G1 X139.956 Y105.638 E.24164
G1 X139.956 Y105.098 E.01678
G1 X135.001 Y100.143 E.2179
G1 X135.541 Y100.143 E.01678
G1 X139.956 Y104.558 E.19417
G1 X139.956 Y104.019 E.01678
G1 X136.081 Y100.143 E.17043
G1 X136.62 Y100.143 E.01678
G1 X139.956 Y103.479 E.1467
G1 X139.956 Y102.939 E.01678
G1 X137.16 Y100.143 E.12297
G1 X137.7 Y100.143 E.01678
G1 X139.956 Y102.4 E.09923
G1 X139.956 Y101.86 E.01678
G1 X138.24 Y100.143 E.0755
G1 X138.779 Y100.143 E.01678
G1 X139.956 Y101.32 E.05177
G1 X139.956 Y100.781 E.01678
G1 X139.319 Y100.143 E.02803
G1 X139.793 Y100.143 E.01473
G3 X139.888 Y100.174 I-.007 J.185 E.00316
G3 X140.126 Y100.411 I-1.83 J2.079 E.01044
; WIPE_START
G1 X139.888 Y100.174 E-.12746
G1 X139.793 Y100.143 E-.03813
G1 X139.319 Y100.143 E-.18006
G1 X139.956 Y100.781 E-.3426
G1 X139.956 Y100.97 E-.07176
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.536 Y102.756 Z2.6 F42000
G1 X108.198 Y108.614 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565992
G1 F6882.424
M204 S6000
G1 X108.24 Y109.027 E.01773
; LINE_WIDTH: 0.533841
G1 F7333.166
G1 X108.257 Y109.163 E.00548
; LINE_WIDTH: 0.499761
G1 F7880.205
G1 X108.274 Y109.299 E.0051
; LINE_WIDTH: 0.465682
G1 F8515.44
G1 X108.292 Y109.435 E.00472
; LINE_WIDTH: 0.428755
G1 F9330.431
G1 X108.311 Y109.573 E.00436
; LINE_WIDTH: 0.388983
G1 F10402.732
G1 X108.331 Y109.71 E.00391
; LINE_WIDTH: 0.349212
G1 F11753.508
G1 X108.351 Y109.847 E.00346
; LINE_WIDTH: 0.3067
G1 F13647.769
G1 X108.374 Y109.985 E.003
; LINE_WIDTH: 0.261418
G1 F15000
G1 X108.396 Y110.123 E.00248
; LINE_WIDTH: 0.216137
G1 X108.419 Y110.26 E.00197
; LINE_WIDTH: 0.169343
G1 X108.446 Y110.405 E.00151
; LINE_WIDTH: 0.121067
G1 X108.472 Y110.549 E.00093
; OBJECT_ID: 5
; WIPE_START
G1 X108.446 Y110.405 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X116.076 Y110.217 Z2.6 F42000
G1 X173.978 Y108.789 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X173.867 Y108.789 E.00368
G1 X173.773 Y109.083 E.01023
G1 X173.265 Y108.655 E.02206
G3 X173.11 Y108.307 I.335 J-.357 E.01294
G1 X173.109 Y100.683 E.25291
G2 X152.691 Y104.189 I-9.904 J3.527 E.97563
G1 X152.691 Y108.221 E.13376
G1 X152.468 Y108.241 E.00742
G3 X152.309 Y106.388 I11.042 J-1.881 E.06174
G3 X152.318 Y103.764 I65.921 J-1.09 E.08706
G3 X163.434 Y93.311 I10.886 J.439 E.56076
G3 X172.689 Y98.854 I-.267 J10.942 E.37418
G1 X173.201 Y99.808 E.0359
G1 X184.619 Y99.809 E.37877
G3 X185.09 Y100.289 I-.024 J.494 E.02453
G1 X185.09 Y108.318 E.26632
G3 X184.609 Y108.788 I-.494 J-.023 E.02454
G1 X174.038 Y108.789 E.35066
M204 S10000
G1 X174.219 Y109.196 F42000
G1 F8843.478
M204 S6000
G1 X174.164 Y109.196 E.00181
G3 X173.494 Y111.048 I-16.713 J-5 E.06535
G1 X173.302 Y111.006 E.00653
G1 X173.302 Y109.218 E.0593
G3 X172.85 Y108.791 I.999 J-1.508 E.02073
G3 X172.703 Y108.327 I.791 J-.506 E.01633
G1 X172.702 Y100.761 E.25099
G2 X153.098 Y104.193 I-9.499 J3.448 E.93583
G1 X153.098 Y111.005 E.22597
G1 X152.904 Y111.045 E.00658
G3 X151.902 Y106.393 I10.363 J-4.665 E.15906
G3 X151.911 Y103.748 I66.377 J-1.094 E.08772
G3 X163.443 Y92.904 I11.293 J.456 E.58174
G3 X173.044 Y98.655 I-.277 J11.351 E.38818
G1 X173.444 Y99.4 E.02809
G1 X184.635 Y99.402 E.37123
G3 X185.497 Y100.269 I-.048 J.91 E.04446
G1 X185.497 Y108.334 E.26751
G3 X184.629 Y109.195 I-.904 J-.043 E.04454
G1 X174.279 Y109.196 E.34334
M204 S250
G1 X174.451 Y109.588 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X172.91 Y112.904 I-12.028 J-3.574 E.11273
G1 X172.91 Y109.401 E.10764
G3 X172.311 Y108.346 I.787 J-1.144 E.03856
G1 X172.31 Y100.836 E.23078
G2 X153.49 Y104.196 I-9.108 J3.372 E.83136
G1 X153.49 Y112.907 E.26766
G3 X151.51 Y106.396 I9.911 J-6.57 E.21207
G3 X151.519 Y103.733 I66.87 J-1.098 E.08185
G3 X163.452 Y92.512 I11.685 J.471 E.55759
G3 X173.679 Y99.008 I-.263 J11.711 E.39126
G1 X184.651 Y99.01 E.33714
G3 X185.889 Y100.25 I-.068 J1.307 E.05901
G1 X185.889 Y108.349 E.24886
G3 X184.648 Y109.587 I-1.3 J-.061 E.05909
G1 X174.511 Y109.588 E.31151
M204 S10000
G1 X173.673 Y109.514 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.312739
G1 F13342.284
M204 S6000
G1 X173.639 Y109.735 E.0049
; LINE_WIDTH: 0.264567
G1 F15000
G1 X173.604 Y109.955 E.00403
; LINE_WIDTH: 0.216537
G1 X173.579 Y110.099 E.00208
; LINE_WIDTH: 0.16869
G1 X173.553 Y110.244 E.0015
; LINE_WIDTH: 0.120844
G1 X173.528 Y110.388 E.00093
M204 S10000
G1 X173.673 Y109.514 F42000
; LINE_WIDTH: 0.360912
G1 F11321.06
M204 S6000
G1 X173.707 Y109.294 E.00578
; WIPE_START
G1 X173.673 Y109.514 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.274 Y108.185 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42434
G1 F9438.414
M204 S6000
G2 X173.609 Y108.503 I2.257 J-2.042 E.01437
G1 X173.624 Y108.456 E.00153
G1 X174.085 Y108.456 E.01432
G1 X173.443 Y107.815 E.02818
G1 X173.443 Y107.275 E.01677
G1 X174.624 Y108.456 E.05189
G1 X175.163 Y108.456 E.01676
G1 X173.443 Y106.736 E.0756
G1 X173.443 Y106.197 E.01677
G1 X175.703 Y108.456 E.09931
G1 X176.242 Y108.456 E.01676
G1 X173.443 Y105.657 E.12302
G1 X173.443 Y105.118 E.01677
G1 X176.781 Y108.456 E.14673
G1 X177.321 Y108.456 E.01676
G1 X173.443 Y104.578 E.17044
G1 X173.443 Y104.039 E.01677
G1 X177.86 Y108.456 E.19415
G1 X178.399 Y108.456 E.01676
G1 X173.443 Y103.499 E.21786
G1 X173.443 Y102.96 E.01677
G1 X178.939 Y108.456 E.24157
G1 X179.478 Y108.455 E.01676
G1 X173.443 Y102.42 E.26529
G1 X173.443 Y101.881 E.01677
G1 X180.017 Y108.455 E.289
G1 X180.557 Y108.455 E.01676
G1 X173.442 Y101.341 E.31271
G1 X173.442 Y100.802 E.01677
G1 X181.096 Y108.455 E.33642
G1 X181.635 Y108.455 E.01676
G1 X173.321 Y100.141 E.36546
G1 X173.86 Y100.141 E.01677
G1 X182.175 Y108.455 E.36546
G1 X182.714 Y108.455 E.01676
G1 X174.4 Y100.141 E.36545
G1 X174.939 Y100.141 E.01677
G1 X183.253 Y108.455 E.36545
G1 X183.793 Y108.455 E.01676
G1 X175.479 Y100.141 E.36544
G1 X176.018 Y100.141 E.01677
G1 X184.332 Y108.455 E.36543
G1 X184.59 Y108.455 E.00801
G2 X184.747 Y108.331 I-.007 J-.171 E.00667
G1 X176.558 Y100.141 E.35997
G1 X177.097 Y100.141 E.01677
G1 X184.756 Y107.8 E.33666
G1 X184.756 Y107.261 E.01677
G1 X177.637 Y100.141 E.31295
G1 X178.176 Y100.141 E.01677
G1 X184.756 Y106.722 E.28924
G1 X184.756 Y106.182 E.01677
G1 X178.716 Y100.141 E.26552
G1 X179.255 Y100.141 E.01677
G1 X184.756 Y105.643 E.24181
G1 X184.756 Y105.103 E.01677
G1 X179.795 Y100.141 E.2181
G1 X180.334 Y100.142 E.01677
G1 X184.756 Y104.564 E.19439
G1 X184.756 Y104.025 E.01677
G1 X180.873 Y100.142 E.17068
G1 X181.413 Y100.142 E.01677
G1 X184.756 Y103.485 E.14696
G1 X184.756 Y102.946 E.01677
G1 X181.952 Y100.142 E.12325
G1 X182.492 Y100.142 E.01677
G1 X184.756 Y102.406 E.09954
G1 X184.756 Y101.867 E.01677
G1 X183.031 Y100.142 E.07583
G1 X183.571 Y100.142 E.01677
G1 X184.756 Y101.327 E.05211
G1 X184.756 Y100.788 E.01677
G1 X184.11 Y100.142 E.0284
G1 X184.586 Y100.142 E.01479
G3 X184.671 Y100.163 I.006 J.154 E.00275
G1 X184.926 Y100.418 E.01121
; WIPE_START
G1 X184.671 Y100.163 E-.13709
G1 X184.586 Y100.142 E-.0332
G1 X184.11 Y100.142 E-.18088
G1 X184.756 Y100.788 E-.34724
G1 X184.756 Y100.95 E-.06159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.323 Y102.68 Z2.6 F42000
G1 X152.596 Y108.434 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556658
G1 F7007.474
M204 S6000
G1 X152.65 Y108.931 E.02093
; LINE_WIDTH: 0.513535
G1 F7649.576
G1 X152.668 Y109.073 E.0055
; LINE_WIDTH: 0.477003
G1 F8293.347
G1 X152.686 Y109.216 E.00508
; LINE_WIDTH: 0.440472
G1 F9055.43
G1 X152.705 Y109.358 E.00465
; LINE_WIDTH: 0.400988
G1 F10053.968
G1 X152.726 Y109.501 E.00422
; LINE_WIDTH: 0.358563
G1 F11405.305
G1 X152.747 Y109.644 E.00372
; LINE_WIDTH: 0.316138
G1 F13176.31
G1 X152.768 Y109.787 E.00322
; LINE_WIDTH: 0.270666
G1 F15000
G1 X152.793 Y109.931 E.00271
; LINE_WIDTH: 0.222117
G1 X152.817 Y110.075 E.00213
; LINE_WIDTH: 0.173568
G1 X152.841 Y110.219 E.00156
; LINE_WIDTH: 0.136207
G1 X152.857 Y110.302 E.00064
; LINE_WIDTH: 0.110019
G1 X152.872 Y110.385 E.00046
; OBJECT_ID: 6
; WIPE_START
G1 X152.857 Y110.302 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X160.487 Y110.128 Z2.6 F42000
G1 X219.315 Y108.79 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.202 Y108.79 E.00377
G1 X219.118 Y109.037 E.00866
G1 X218.665 Y108.655 E.01966
G3 X218.51 Y108.318 I.352 J-.365 E.0126
G1 X218.509 Y100.933 E.24497
G2 X197.491 Y104.489 I-10.204 J3.579 E1.00521
G1 X197.491 Y107.948 E.11473
G1 X197.264 Y107.964 E.00755
G3 X197.109 Y106.088 I14.818 J-2.165 E.06246
G3 X197.144 Y103.613 I31.443 J-.79 E.08215
G3 X208.883 Y93.324 I11.16 J.891 E.57296
G3 X217.979 Y98.882 I-.591 J11.189 E.36852
G1 X218.492 Y99.808 E.0351
G1 X230.019 Y99.809 E.38238
G3 X230.49 Y100.281 I-.023 J.494 E.02428
G1 X230.49 Y108.318 E.26659
G3 X230.009 Y108.788 I-.493 J-.023 E.02455
G1 X219.375 Y108.79 E.35275
M204 S10000
G1 X219.549 Y109.197 F42000
G1 F8843.478
M204 S6000
G1 X219.494 Y109.197 E.00185
G3 X218.898 Y110.81 I-15.245 J-4.713 E.05708
G1 X218.702 Y110.77 E.00662
G1 X218.702 Y109.219 E.05148
G3 X218.25 Y108.791 I.998 J-1.507 E.02073
G3 X218.103 Y108.333 I.8 J-.51 E.01613
G1 X218.102 Y101.009 E.24296
G2 X197.898 Y104.493 I-9.799 J3.501 E.96537
G1 X197.898 Y110.768 E.20817
G1 X197.704 Y110.809 E.00656
G3 X196.702 Y106.093 I10.646 J-4.727 E.16113
G3 X196.739 Y103.581 I31.825 J-.794 E.08335
G3 X208.905 Y92.917 I11.566 J.924 E.59382
G3 X218.331 Y98.678 I-.613 J11.596 E.38192
G1 X218.732 Y99.401 E.02741
G1 X230.035 Y99.402 E.37495
G3 X230.897 Y100.265 I-.043 J.905 E.04437
G1 X230.897 Y108.334 E.26767
G3 X230.029 Y109.195 I-.904 J-.042 E.04453
G1 X219.609 Y109.197 E.34565
M204 S250
G1 X219.775 Y109.589 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X218.31 Y112.695 I-12.271 J-3.888 E.10584
G1 X218.31 Y109.401 E.10121
G3 X217.711 Y108.348 I.808 J-1.157 E.03846
G1 X217.71 Y101.083 E.22325
G2 X198.29 Y104.497 I-9.408 J3.426 E.8587
G1 X198.29 Y112.695 E.2519
G3 X196.31 Y106.097 I10.037 J-6.608 E.21468
G3 X196.348 Y103.549 I32.193 J-.798 E.07829
G3 X208.925 Y92.526 I11.957 J.955 E.56866
G3 X218.963 Y99.009 I-.669 J12.048 E.38411
G1 X230.051 Y99.01 E.34069
G3 X231.289 Y100.249 I-.062 J1.301 E.05903
G1 X231.289 Y108.349 E.24891
G3 X230.049 Y109.588 I-1.3 J-.061 E.05909
G1 X219.835 Y109.589 E.31384
M204 S10000
G1 X219.048 Y109.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308112
G1 F13575.069
M204 S6000
G1 X219.075 Y109.267 E.00363
M204 S10000
G1 X219.048 Y109.433 F42000
; LINE_WIDTH: 0.267092
G1 F15000
M204 S6000
G1 X219.021 Y109.598 E.00306
; LINE_WIDTH: 0.226071
G1 X218.994 Y109.764 E.0025
; LINE_WIDTH: 0.185051
G1 X218.966 Y109.929 E.00194
; LINE_WIDTH: 0.14765
G1 X218.947 Y110.035 E.00091
; LINE_WIDTH: 0.11383
G1 X218.928 Y110.14 E.00062
M204 S10000
G1 X218.757 Y110.982 F42000
; LINE_WIDTH: 0.454244
G1 F8752.226
M204 S6000
G1 X218.546 Y111.935 E.03272
; WIPE_START
G1 X218.757 Y110.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X218.674 Y108.185 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42449
G1 F9434.704
M204 S6000
G2 X218.961 Y108.462 I1.987 J-1.769 E.01242
G1 X219.485 Y108.456 E.0163
G1 X218.843 Y107.815 E.02821
G1 X218.843 Y107.275 E.01678
G1 X220.025 Y108.456 E.05194
G1 X220.564 Y108.456 E.01678
G1 X218.843 Y106.735 E.07567
G1 X218.843 Y106.196 E.01678
G1 X221.104 Y108.456 E.0994
G1 X221.643 Y108.456 E.01678
G1 X218.843 Y105.656 E.12313
G1 X218.843 Y105.116 E.01678
G1 X222.183 Y108.456 E.14686
G1 X222.722 Y108.456 E.01678
G1 X218.843 Y104.577 E.17059
G1 X218.843 Y104.037 E.01678
G1 X223.262 Y108.456 E.19432
G1 X223.802 Y108.456 E.01678
G1 X218.843 Y103.497 E.21805
G1 X218.843 Y102.957 E.01678
G1 X224.341 Y108.456 E.24178
G1 X224.881 Y108.456 E.01678
G1 X218.843 Y102.418 E.26551
G1 X218.843 Y101.878 E.01678
G1 X225.42 Y108.456 E.28924
G1 X225.96 Y108.456 E.01678
G1 X218.842 Y101.338 E.31297
G1 X218.842 Y100.87 E.01456
G1 X218.797 Y100.753 E.0039
G1 X226.499 Y108.456 E.3387
G1 X227.039 Y108.455 E.01678
G1 X218.724 Y100.141 E.3656
G1 X219.264 Y100.141 E.01678
G1 X227.578 Y108.455 E.3656
G1 X228.118 Y108.455 E.01678
G1 X219.804 Y100.141 E.36559
G1 X220.343 Y100.141 E.01678
G1 X228.658 Y108.455 E.36559
G1 X229.197 Y108.455 E.01678
G1 X220.883 Y100.141 E.36558
G1 X221.423 Y100.141 E.01678
G1 X229.737 Y108.455 E.36558
G1 X229.984 Y108.455 E.00768
G2 X230.148 Y108.327 I-.003 J-.174 E.00695
G1 X221.963 Y100.141 E.35994
G1 X222.502 Y100.141 E.01678
G1 X230.156 Y107.796 E.33658
G1 X230.156 Y107.256 E.01678
G1 X223.042 Y100.142 E.31284
G1 X223.582 Y100.142 E.01678
G1 X230.156 Y106.716 E.28911
G1 X230.156 Y106.177 E.01678
G1 X224.121 Y100.142 E.26538
G1 X224.661 Y100.142 E.01678
G1 X230.156 Y105.637 E.24165
G1 X230.156 Y105.098 E.01678
G1 X225.201 Y100.142 E.21792
G1 X225.74 Y100.142 E.01678
G1 X230.156 Y104.558 E.19419
G1 X230.156 Y104.018 E.01678
G1 X226.28 Y100.142 E.17046
G1 X226.82 Y100.142 E.01678
G1 X230.156 Y103.479 E.14673
G1 X230.156 Y102.939 E.01678
G1 X227.359 Y100.142 E.123
G1 X227.899 Y100.142 E.01678
G1 X230.156 Y102.399 E.09927
G1 X230.156 Y101.86 E.01678
G1 X228.439 Y100.142 E.07553
G1 X228.978 Y100.142 E.01678
G1 X230.156 Y101.32 E.0518
G1 X230.156 Y100.781 E.01678
G1 X229.518 Y100.142 E.02807
G1 X229.993 Y100.142 E.01476
G3 X230.087 Y100.173 I-.007 J.182 E.00311
G3 X230.326 Y100.411 I-2.09 J2.34 E.0105
; WIPE_START
G1 X230.087 Y100.173 E-.12823
G1 X229.993 Y100.142 E-.03755
G1 X229.518 Y100.142 E-.18045
G1 X230.156 Y100.781 E-.34309
G1 X230.156 Y100.967 E-.07068
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P79 R5
G1 X222.702 Y102.603 Z2.6 F42000
G1 X197.395 Y108.159 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565825
G1 F6884.623
M204 S6000
G1 X197.427 Y108.451 E.01252
; LINE_WIDTH: 0.531074
G1 F7374.73
G1 X197.459 Y108.743 E.01169
; LINE_WIDTH: 0.494278
G1 F7975.94
G1 X197.478 Y108.892 E.00552
; LINE_WIDTH: 0.455473
G1 F8726.165
G1 X197.498 Y109.041 E.00505
; LINE_WIDTH: 0.416668
G1 F9632.178
G1 X197.517 Y109.19 E.00457
; LINE_WIDTH: 0.374762
G1 F10848.551
G1 X197.54 Y109.339 E.00408
; LINE_WIDTH: 0.329765
G1 F12550.343
G1 X197.562 Y109.488 E.00353
; LINE_WIDTH: 0.284768
G1 F14885.389
G1 X197.585 Y109.638 E.00298
; LINE_WIDTH: 0.242965
G1 F15000
G1 X197.604 Y109.75 E.00187
; LINE_WIDTH: 0.204335
G1 X197.623 Y109.863 E.00151
; LINE_WIDTH: 0.165705
G1 X197.643 Y109.976 E.00115
; LINE_WIDTH: 0.127075
G1 X197.662 Y110.089 E.00079
; LINE_WIDTH: 0.102332
G1 X197.672 Y110.144 E.00027
; OBJECT_ID: 9
; WIPE_START
G1 X197.662 Y110.089 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X192.542 Y115.749 Z2.6 F42000
G1 X137.416 Y176.69 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X137.302 Y176.69 E.0038
G1 X137.218 Y176.937 E.00865
G1 X136.765 Y176.555 E.01966
G3 X136.61 Y176.208 I.349 J-.363 E.01292
G1 X136.609 Y168.833 E.24465
G2 X115.591 Y172.389 I-10.204 J3.579 E1.00521
G1 X115.591 Y175.848 E.11473
G1 X115.364 Y175.864 E.00755
G3 X115.209 Y173.989 I14.827 J-2.166 E.06245
G3 X115.244 Y171.513 I31.419 J-.79 E.08216
G3 X126.983 Y161.224 I11.161 J.893 E.57294
G3 X136.079 Y166.783 I-.591 J11.189 E.36854
G1 X136.592 Y167.708 E.03509
G1 X148.119 Y167.709 E.38237
G3 X148.59 Y168.189 I-.027 J.497 E.02449
G1 X148.59 Y176.218 E.26633
G3 X148.109 Y176.688 I-.497 J-.027 E.02449
G1 X137.476 Y176.69 E.35272
M204 S10000
G1 X137.65 Y177.097 F42000
G1 F8843.478
M204 S6000
G1 X137.594 Y177.097 E.00186
G3 X136.998 Y178.71 I-15.498 J-4.806 E.05708
G1 X136.802 Y178.67 E.00662
G1 X136.802 Y177.119 E.05148
G3 X136.351 Y176.691 I.998 J-1.506 E.02072
G3 X136.203 Y176.227 I.756 J-.495 E.01635
G1 X136.202 Y168.909 E.24276
G2 X115.998 Y172.393 I-9.799 J3.501 E.96537
G1 X115.998 Y178.668 E.20817
G1 X115.804 Y178.709 E.00656
G3 X114.802 Y173.992 I10.646 J-4.727 E.16113
G3 X114.839 Y171.481 I31.801 J-.794 E.08335
G3 X127.005 Y160.817 I11.567 J.925 E.5938
G3 X136.432 Y166.578 I-.613 J11.596 E.38193
G1 X136.832 Y167.301 E.0274
G1 X148.135 Y167.302 E.37495
G3 X148.997 Y168.169 I-.048 J.909 E.04447
G1 X148.997 Y176.234 E.26752
G3 X148.129 Y177.095 I-.909 J-.048 E.04447
G1 X137.71 Y177.097 E.34563
M204 S250
G1 X137.875 Y177.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X136.41 Y180.595 I-12.292 J-3.898 E.10584
G1 X136.41 Y177.301 E.10121
G3 X135.811 Y176.246 I.808 J-1.156 E.03852
G1 X135.81 Y168.983 E.22319
G2 X116.39 Y172.397 I-9.408 J3.426 E.8587
G1 X116.39 Y180.595 E.2519
G3 X114.41 Y173.997 I10.037 J-6.608 E.21468
G3 X114.448 Y171.449 I32.176 J-.798 E.07829
G3 X127.025 Y160.426 I11.958 J.956 E.56864
G3 X137.063 Y166.909 I-.667 J12.044 E.38413
G1 X148.151 Y166.91 E.34069
G3 X149.389 Y168.15 I-.068 J1.306 E.05901
G1 X149.389 Y176.249 E.24887
G3 X148.149 Y177.488 I-1.306 J-.068 E.05902
G1 X137.935 Y177.489 E.31384
M204 S10000
G1 X137.148 Y177.333 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.308161
G1 F13572.594
M204 S6000
G1 X137.175 Y177.167 E.00362
M204 S10000
G1 X137.148 Y177.333 F42000
; LINE_WIDTH: 0.267241
G1 F15000
M204 S6000
G1 X137.121 Y177.498 E.00306
; LINE_WIDTH: 0.226321
G1 X137.094 Y177.663 E.0025
; LINE_WIDTH: 0.1854
G1 X137.067 Y177.828 E.00194
; LINE_WIDTH: 0.147949
G1 X137.047 Y177.934 E.00092
; LINE_WIDTH: 0.11393
G1 X137.028 Y178.039 E.00062
M204 S10000
G1 X136.857 Y178.882 F42000
; LINE_WIDTH: 0.454303
G1 F8750.979
M204 S6000
G1 X136.646 Y179.835 E.03274
; WIPE_START
G1 X136.857 Y178.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.774 Y176.085 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42452
G1 F9433.962
M204 S6000
G2 X137.061 Y176.362 I1.987 J-1.768 E.01242
G1 X137.585 Y176.356 E.01631
G1 X136.943 Y175.715 E.02822
G1 X136.943 Y175.175 E.01678
G1 X138.125 Y176.356 E.05195
G1 X138.664 Y176.356 E.01678
G1 X136.943 Y174.635 E.07569
G1 X136.943 Y174.095 E.01678
G1 X139.204 Y176.356 E.09942
G1 X139.744 Y176.356 E.01678
G1 X136.943 Y173.556 E.12315
G1 X136.943 Y173.016 E.01678
G1 X140.283 Y176.356 E.14689
G1 X140.823 Y176.356 E.01678
G1 X136.943 Y172.476 E.17062
G1 X136.943 Y171.936 E.01678
G1 X141.362 Y176.356 E.19435
G1 X141.902 Y176.356 E.01678
G1 X136.943 Y171.397 E.21809
G1 X136.943 Y170.857 E.01678
G1 X142.442 Y176.356 E.24182
G1 X142.981 Y176.356 E.01678
G1 X136.943 Y170.317 E.26555
G1 X136.943 Y169.777 E.01678
G1 X143.521 Y176.356 E.28929
G1 X144.06 Y176.356 E.01678
G1 X136.942 Y169.238 E.31302
G1 X136.942 Y168.77 E.01455
G1 X136.896 Y168.652 E.00394
G1 X144.6 Y176.356 E.33877
G1 X145.14 Y176.355 E.01678
G1 X136.825 Y168.041 E.36563
G1 X137.365 Y168.041 E.01678
G1 X145.679 Y176.355 E.36563
G1 X146.219 Y176.355 E.01678
G1 X137.905 Y168.041 E.36562
G1 X138.444 Y168.041 E.01678
G1 X146.758 Y176.355 E.36562
G1 X147.298 Y176.355 E.01678
G1 X138.984 Y168.041 E.36561
G1 X139.524 Y168.041 E.01678
G1 X147.838 Y176.355 E.36561
G1 X148.07 Y176.355 E.00722
G2 X148.248 Y176.226 I.024 J-.155 E.00759
G1 X140.064 Y168.041 E.35993
G1 X140.603 Y168.041 E.01678
G1 X148.256 Y175.695 E.33656
G1 X148.256 Y175.155 E.01678
G1 X141.143 Y168.042 E.31282
G1 X141.683 Y168.042 E.01678
G1 X148.256 Y174.615 E.28909
G1 X148.256 Y174.076 E.01678
G1 X142.222 Y168.042 E.26535
G1 X142.762 Y168.042 E.01678
G1 X148.256 Y173.536 E.24162
G1 X148.256 Y172.996 E.01678
G1 X143.302 Y168.042 E.21788
G1 X143.842 Y168.042 E.01678
G1 X148.256 Y172.457 E.19415
G1 X148.256 Y171.917 E.01678
G1 X144.381 Y168.042 E.17041
G1 X144.921 Y168.042 E.01678
G1 X148.256 Y171.377 E.14668
G1 X148.256 Y170.838 E.01678
G1 X145.461 Y168.042 E.12294
G1 X146 Y168.042 E.01678
G1 X148.256 Y170.298 E.09921
G1 X148.256 Y169.758 E.01678
G1 X146.54 Y168.042 E.07547
G1 X147.08 Y168.042 E.01678
G1 X148.256 Y169.219 E.05174
G1 X148.256 Y168.679 E.01678
G1 X147.62 Y168.042 E.02801
G1 X148.093 Y168.042 E.01472
G3 X148.192 Y168.075 I-.009 J.192 E.0033
G1 X148.426 Y168.309 E.01028
; WIPE_START
G1 X148.192 Y168.075 E-.12564
G1 X148.093 Y168.042 E-.0398
G1 X147.62 Y168.042 E-.17986
G1 X148.256 Y168.679 E-.34224
G1 X148.256 Y168.87 E-.07246
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.801 Y170.506 Z2.6 F42000
G1 X115.495 Y176.059 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.56584
G1 F6884.417
M204 S6000
G1 X115.527 Y176.351 E.01252
; LINE_WIDTH: 0.531121
G1 F7374.02
G1 X115.559 Y176.643 E.01169
; LINE_WIDTH: 0.494328
G1 F7975.056
G1 X115.578 Y176.792 E.00553
; LINE_WIDTH: 0.455503
G1 F8725.531
G1 X115.598 Y176.941 E.00505
; LINE_WIDTH: 0.416678
G1 F9631.92
G1 X115.617 Y177.09 E.00458
; LINE_WIDTH: 0.374761
G1 F10848.582
G1 X115.64 Y177.239 E.00408
; LINE_WIDTH: 0.329762
G1 F12550.472
G1 X115.662 Y177.388 E.00353
; LINE_WIDTH: 0.284763
G1 F14885.691
G1 X115.685 Y177.538 E.00298
; LINE_WIDTH: 0.242957
G1 F15000
G1 X115.704 Y177.65 E.00187
; LINE_WIDTH: 0.204311
G1 X115.723 Y177.763 E.00151
; LINE_WIDTH: 0.165666
G1 X115.743 Y177.876 E.00115
; LINE_WIDTH: 0.12702
G1 X115.762 Y177.989 E.00079
; LINE_WIDTH: 0.102309
G1 X115.772 Y178.044 E.00027
; OBJECT_ID: 8
; WIPE_START
G1 X115.762 Y177.989 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X108.141 Y177.571 Z2.6 F42000
G1 X92.078 Y176.689 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.967 Y176.689 E.00369
G1 X91.873 Y176.983 E.01023
G1 X91.365 Y176.554 E.02207
G3 X91.21 Y176.207 I.349 J-.363 E.01292
G1 X91.209 Y168.583 E.25291
G2 X70.791 Y172.089 I-9.904 J3.527 E.97562
G1 X70.791 Y176.121 E.13376
G1 X70.568 Y176.141 E.00742
G3 X70.409 Y174.288 I11.049 J-1.882 E.06175
G3 X70.418 Y171.664 I65.931 J-1.09 E.08706
G3 X81.534 Y161.211 I10.886 J.439 E.56076
G3 X90.8 Y166.773 I-.267 J10.943 E.37494
G1 X91.299 Y167.708 E.03513
G1 X102.709 Y167.709 E.37849
G3 X103.19 Y168.189 I-.013 J.494 E.02486
G1 X103.19 Y176.218 E.26632
G3 X102.71 Y176.688 I-.494 J-.024 E.0245
G1 X92.138 Y176.689 E.35068
M204 S10000
G1 X92.319 Y177.096 F42000
G1 F8843.478
M204 S6000
G1 X92.264 Y177.096 E.00181
G3 X91.594 Y178.948 I-16.712 J-5 E.06535
G1 X91.402 Y178.906 E.00653
G1 X91.402 Y177.118 E.0593
G3 X90.95 Y176.691 I.999 J-1.508 E.02073
G3 X90.803 Y176.227 I.791 J-.506 E.01633
G1 X90.802 Y168.661 E.25099
G2 X71.198 Y172.093 I-9.499 J3.448 E.93582
G1 X71.198 Y178.905 E.22598
G1 X71.004 Y178.946 E.00658
G3 X70.002 Y174.293 I10.362 J-4.665 E.15906
G3 X70.011 Y171.648 I66.388 J-1.094 E.08773
G3 X81.543 Y160.804 I11.293 J.456 E.58174
G3 X91.155 Y166.574 I-.277 J11.352 E.38895
G1 X91.543 Y167.3 E.02731
G1 X102.729 Y167.302 E.37106
G3 X103.597 Y168.169 I-.034 J.902 E.04475
G1 X103.597 Y176.234 E.26751
G3 X102.73 Y177.095 I-.909 J-.048 E.04445
G1 X92.379 Y177.096 E.34336
M204 S250
G1 X92.551 Y177.488 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X91.01 Y180.804 I-12.029 J-3.574 E.11273
G1 X91.01 Y177.301 E.10764
G3 X90.411 Y176.246 I.808 J-1.156 E.03852
G1 X90.41 Y168.736 E.23078
G2 X71.59 Y172.096 I-9.108 J3.372 E.83135
G1 X71.59 Y180.807 E.26766
G3 X69.61 Y174.296 I9.906 J-6.569 E.21208
G3 X69.619 Y171.633 I66.874 J-1.098 E.08186
G3 X81.552 Y160.412 I11.685 J.471 E.55759
G3 X91.778 Y166.908 I-.263 J11.711 E.39125
G1 X102.749 Y166.91 E.33708
G3 X103.989 Y168.15 I-.055 J1.295 E.0592
G1 X103.989 Y176.249 E.24886
G3 X102.749 Y177.487 I-1.306 J-.068 E.05901
G1 X92.611 Y177.488 E.31151
M204 S10000
G1 X91.773 Y177.414 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.31276
G1 F13341.245
M204 S6000
G1 X91.739 Y177.635 E.0049
; LINE_WIDTH: 0.2646
G1 F15000
G1 X91.704 Y177.855 E.00403
; LINE_WIDTH: 0.216589
G1 X91.679 Y177.999 E.00208
; LINE_WIDTH: 0.168722
G1 X91.653 Y178.144 E.0015
; LINE_WIDTH: 0.120854
G1 X91.628 Y178.288 E.00093
M204 S10000
G1 X91.773 Y177.414 F42000
; LINE_WIDTH: 0.36092
G1 F11320.762
M204 S6000
G1 X91.807 Y177.194 E.00578
; WIPE_START
G1 X91.773 Y177.414 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.374 Y176.084 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42449
G1 F9434.704
M204 S6000
G2 X91.709 Y176.403 I2.258 J-2.04 E.01439
G1 X91.724 Y176.356 E.00153
G1 X92.185 Y176.356 E.01434
G1 X91.543 Y175.714 E.02821
G1 X91.543 Y175.175 E.01678
G1 X92.725 Y176.356 E.05194
G1 X93.264 Y176.356 E.01678
G1 X91.543 Y174.635 E.07567
G1 X91.543 Y174.095 E.01678
G1 X93.804 Y176.356 E.0994
G1 X94.343 Y176.356 E.01678
G1 X91.543 Y173.556 E.12313
G1 X91.543 Y173.016 E.01678
G1 X94.883 Y176.356 E.14686
G1 X95.422 Y176.356 E.01678
G1 X91.543 Y172.476 E.17059
G1 X91.543 Y171.937 E.01678
G1 X95.962 Y176.356 E.19432
G1 X96.502 Y176.356 E.01678
G1 X91.543 Y171.397 E.21805
G1 X91.543 Y170.857 E.01678
G1 X97.041 Y176.356 E.24178
G1 X97.581 Y176.355 E.01678
G1 X91.543 Y170.317 E.26551
G1 X91.543 Y169.778 E.01678
G1 X98.12 Y176.355 E.28924
G1 X98.66 Y176.355 E.01678
G1 X91.542 Y169.238 E.31297
G1 X91.542 Y168.698 E.01678
G1 X99.199 Y176.355 E.33669
G1 X99.739 Y176.355 E.01678
G1 X91.424 Y168.041 E.36561
G1 X91.964 Y168.041 E.01678
G1 X100.278 Y176.355 E.3656
G1 X100.818 Y176.355 E.01678
G1 X92.504 Y168.041 E.36559
G1 X93.043 Y168.041 E.01678
G1 X101.358 Y176.355 E.36559
G1 X101.897 Y176.355 E.01678
G1 X93.583 Y168.041 E.36558
G1 X94.123 Y168.041 E.01678
G1 X102.437 Y176.355 E.36558
G1 X102.69 Y176.355 E.00787
G2 X102.849 Y176.228 I-.008 J-.173 E.00678
G1 X94.663 Y168.041 E.35999
G1 X95.202 Y168.041 E.01678
G1 X102.856 Y175.695 E.33658
G1 X102.856 Y175.156 E.01678
G1 X95.742 Y168.041 E.31284
G1 X96.282 Y168.041 E.01678
G1 X102.856 Y174.616 E.28911
G1 X102.856 Y174.077 E.01678
G1 X96.821 Y168.041 E.26538
G1 X97.361 Y168.041 E.01678
G1 X102.856 Y173.537 E.24165
G1 X102.856 Y172.997 E.01678
G1 X97.901 Y168.041 E.21792
G1 X98.44 Y168.042 E.01678
G1 X102.856 Y172.458 E.19419
G1 X102.856 Y171.918 E.01678
G1 X98.98 Y168.042 E.17046
G1 X99.52 Y168.042 E.01678
G1 X102.856 Y171.378 E.14673
G1 X102.856 Y170.839 E.01678
G1 X100.059 Y168.042 E.123
G1 X100.599 Y168.042 E.01678
G1 X102.856 Y170.299 E.09927
G1 X102.856 Y169.76 E.01678
G1 X101.139 Y168.042 E.07553
G1 X101.678 Y168.042 E.01678
G1 X102.856 Y169.22 E.0518
G1 X102.856 Y168.68 E.01678
G1 X102.218 Y168.042 E.02807
G1 X102.682 Y168.042 E.01442
G3 X102.789 Y168.074 I.002 J.19 E.00353
G1 X103.026 Y168.31 E.01042
; WIPE_START
G1 X102.789 Y168.074 E-.12732
G1 X102.682 Y168.042 E-.04255
G1 X102.218 Y168.042 E-.17619
G1 X102.856 Y168.68 E-.34309
G1 X102.856 Y168.867 E-.07086
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.422 Y170.593 Z2.6 F42000
G1 X70.696 Y176.334 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556789
G1 F7005.684
M204 S6000
G1 X70.75 Y176.83 E.02088
; LINE_WIDTH: 0.51265
G1 F7663.976
G1 X70.769 Y176.98 E.0058
; LINE_WIDTH: 0.473831
G1 F8354.409
G1 X70.789 Y177.13 E.00532
; LINE_WIDTH: 0.435011
G1 F9181.558
G1 X70.808 Y177.28 E.00484
; LINE_WIDTH: 0.395498
G1 F10210.506
G1 X70.828 Y177.416 E.00394
; LINE_WIDTH: 0.355294
G1 F11524.646
G1 X70.848 Y177.551 E.00349
; LINE_WIDTH: 0.31509
G1 F13227.026
G1 X70.868 Y177.687 E.00304
; LINE_WIDTH: 0.270723
G1 F15000
G1 X70.893 Y177.831 E.00271
; LINE_WIDTH: 0.222169
G1 X70.917 Y177.975 E.00213
; LINE_WIDTH: 0.173615
G1 X70.941 Y178.119 E.00156
; LINE_WIDTH: 0.136236
G1 X70.957 Y178.202 E.00064
; LINE_WIDTH: 0.110029
G1 X70.972 Y178.285 E.00046
; OBJECT_ID: 7
; WIPE_START
G1 X70.957 Y178.202 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X63.34 Y177.715 Z2.6 F42000
G1 X47.313 Y176.691 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X47.206 Y176.691 E.00354
G1 X47.108 Y177.014 E.0112
G1 X46.565 Y176.556 E.02357
G3 X46.41 Y176.218 I.352 J-.365 E.0126
G1 X46.409 Y168.419 E.25873
G2 X26.391 Y171.89 I-9.704 J3.493 E.95591
G1 X26.391 Y176.302 E.14636
G1 X26.168 Y176.322 E.00743
G3 X26.009 Y174.49 I10.801 J-1.858 E.06107
G3 X26.018 Y171.478 I76.371 J-1.29 E.0999
G3 X37.167 Y161.22 I10.701 J.442 E.55826
G3 X46.082 Y166.775 I-.5 J10.734 E.36407
G1 X46.569 Y167.709 E.03494
G1 X57.919 Y167.71 E.37651
G3 X58.39 Y168.191 I-.027 J.497 E.0245
G1 X58.39 Y176.219 E.26631
G3 X57.909 Y176.689 I-.497 J-.027 E.0245
G1 X47.373 Y176.691 E.3495
M204 S10000
G1 X47.56 Y177.098 F42000
G1 F8843.478
M204 S6000
G1 X47.508 Y177.098 E.00174
G3 X46.797 Y179.106 I-15.419 J-4.329 E.07074
G1 X46.602 Y179.066 E.0066
G1 X46.602 Y177.12 E.06456
G3 X46.15 Y176.692 I.997 J-1.506 E.02073
G3 X46.003 Y176.234 I.799 J-.51 E.01614
G1 X46.002 Y168.497 E.25665
G2 X26.798 Y171.894 I-9.299 J3.413 E.91613
G1 X26.798 Y179.068 E.23799
G1 X26.603 Y179.108 E.00661
G3 X25.602 Y174.493 I10.223 J-4.632 E.15782
G3 X25.611 Y171.462 I76.879 J-1.294 E.10055
G3 X37.185 Y160.813 I11.108 J.459 E.57954
G3 X46.439 Y166.579 I-.519 J11.143 E.37792
G1 X46.816 Y167.302 E.02702
G1 X57.935 Y167.303 E.36885
G3 X58.797 Y168.171 I-.048 J.909 E.04448
G1 X58.797 Y176.235 E.2675
G3 X57.929 Y177.097 I-.909 J-.048 E.04448
G1 X47.62 Y177.098 E.34197
M204 S250
G1 X47.798 Y177.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X46.21 Y180.944 I-11.261 J-3.087 E.11733
G1 X46.21 Y177.302 E.11189
G3 X45.611 Y176.249 I.808 J-1.157 E.03846
G1 X45.61 Y168.573 E.23588
G2 X27.19 Y171.898 I-8.908 J3.336 E.81314
G1 X27.19 Y180.944 E.27798
G3 X25.21 Y174.497 I9.686 J-6.502 E.21023
G3 X25.219 Y171.447 I77.353 J-1.298 E.09374
G3 X37.202 Y160.421 I11.501 J.475 E.55581
G3 X47.054 Y166.91 I-.513 J11.502 E.38055
G1 X57.951 Y166.911 E.33483
G3 X59.189 Y168.151 I-.068 J1.306 E.05902
G1 X59.189 Y176.25 E.24886
G3 X57.948 Y177.489 I-1.306 J-.068 E.05902
G1 X47.858 Y177.49 E.31004
M204 S10000
G1 X46.997 Y177.418 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.36259
G1 F11261.613
M204 S6000
G1 X46.966 Y177.624 E.00542
; LINE_WIDTH: 0.32309
G1 F12849.339
G1 X46.936 Y177.83 E.00475
; LINE_WIDTH: 0.28187
G1 F15000
G1 X46.914 Y177.958 E.00252
; LINE_WIDTH: 0.238906
G1 X46.893 Y178.086 E.00207
; LINE_WIDTH: 0.195942
G1 X46.871 Y178.213 E.00162
; LINE_WIDTH: 0.155068
G1 X46.85 Y178.331 E.00109
; LINE_WIDTH: 0.116303
G1 X46.828 Y178.448 E.00071
M204 S10000
G1 X46.997 Y177.418 F42000
; LINE_WIDTH: 0.40209
G1 F10023.108
M204 S6000
G1 X47.028 Y177.212 E.00609
; WIPE_START
G1 X46.997 Y177.418 E-.76
; WIPE_END
M73 P80 R5
G1 E-.04 F1800
M204 S10000
G1 X46.576 Y176.088 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42443
G1 F9436.188
M204 S6000
G2 X46.938 Y176.429 I2.399 J-2.184 E.01547
G1 X46.96 Y176.357 E.00232
G1 X47.385 Y176.357 E.01322
G1 X46.745 Y175.718 E.02811
G1 X46.745 Y175.178 E.01678
G1 X47.924 Y176.357 E.05184
G1 X48.464 Y176.357 E.01677
G1 X46.745 Y174.638 E.07557
G1 X46.745 Y174.099 E.01678
G1 X49.003 Y176.357 E.0993
G1 X49.543 Y176.357 E.01677
G1 X46.745 Y173.559 E.12303
G1 X46.744 Y173.019 E.01678
G1 X50.082 Y176.357 E.14675
G1 X50.622 Y176.357 E.01677
G1 X46.744 Y172.479 E.17048
G1 X46.744 Y171.94 E.01678
G1 X51.161 Y176.357 E.19421
G1 X51.701 Y176.357 E.01677
G1 X46.744 Y171.4 E.21794
G1 X46.743 Y170.86 E.01678
G1 X52.24 Y176.357 E.24167
G1 X52.78 Y176.357 E.01677
G1 X46.743 Y170.32 E.2654
G1 X46.743 Y169.781 E.01678
G1 X53.319 Y176.357 E.28912
G1 X53.859 Y176.357 E.01677
G1 X46.743 Y169.241 E.31285
G1 X46.742 Y168.701 E.01678
G1 X54.398 Y176.357 E.33658
G1 X54.938 Y176.357 E.01677
G1 X46.623 Y168.042 E.36555
G1 X47.163 Y168.042 E.01677
G1 X55.477 Y176.356 E.36554
G1 X56.017 Y176.356 E.01677
G1 X47.702 Y168.042 E.36554
G1 X48.242 Y168.042 E.01678
G1 X56.556 Y176.356 E.36553
G1 X57.095 Y176.356 E.01677
G1 X48.781 Y168.042 E.36553
G1 X49.321 Y168.042 E.01677
G1 X57.635 Y176.356 E.36552
G1 X57.89 Y176.356 E.00792
G2 X58.048 Y176.23 I-.006 J-.169 E.00675
G1 X49.861 Y168.042 E.35995
G1 X50.4 Y168.042 E.01678
G1 X58.056 Y175.699 E.33661
G1 X58.056 Y175.159 E.01677
G1 X50.94 Y168.043 E.31288
G1 X51.479 Y168.043 E.01677
G1 X58.056 Y174.62 E.28916
G1 X58.056 Y174.08 E.01677
G1 X52.019 Y168.043 E.26544
G1 X52.559 Y168.043 E.01678
G1 X58.056 Y173.541 E.24171
G1 X58.056 Y173.001 E.01677
G1 X53.098 Y168.043 E.21799
G1 X53.638 Y168.043 E.01677
G1 X58.056 Y172.461 E.19427
G1 X58.056 Y171.922 E.01677
G1 X54.177 Y168.043 E.17054
G1 X54.717 Y168.043 E.01677
G1 X58.056 Y171.382 E.14682
G1 X58.056 Y170.843 E.01677
G1 X55.257 Y168.043 E.1231
G1 X55.796 Y168.043 E.01678
G1 X58.056 Y170.303 E.09937
G1 X58.056 Y169.764 E.01677
G1 X56.336 Y168.043 E.07565
G1 X56.875 Y168.043 E.01677
G1 X58.056 Y169.224 E.05193
G1 X58.056 Y168.685 E.01677
G1 X57.415 Y168.043 E.0282
G1 X57.893 Y168.043 E.01485
G3 X57.983 Y168.072 I-.006 J.175 E.00299
G1 X58.226 Y168.315 E.01068
; WIPE_START
G1 X57.983 Y168.072 E-.13051
G1 X57.893 Y168.043 E-.03604
G1 X57.415 Y168.043 E-.18158
G1 X58.056 Y168.685 E-.34472
G1 X58.056 Y168.861 E-.06715
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X50.636 Y170.65 Z2.6 F42000
G1 X26.297 Y176.515 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.565985
G1 F6882.511
M204 S6000
G1 X26.34 Y176.927 E.01768
; LINE_WIDTH: 0.533814
G1 F7333.571
G1 X26.357 Y177.063 E.00548
; LINE_WIDTH: 0.49972
G1 F7880.92
G1 X26.375 Y177.199 E.0051
; LINE_WIDTH: 0.465626
G1 F8516.562
G1 X26.392 Y177.336 E.00472
; LINE_WIDTH: 0.428753
G1 F9330.478
G1 X26.411 Y177.472 E.00435
; LINE_WIDTH: 0.389097
G1 F10399.306
G1 X26.431 Y177.609 E.0039
; LINE_WIDTH: 0.349442
G1 F11744.687
G1 X26.451 Y177.746 E.00346
; LINE_WIDTH: 0.305586
G1 F13705.644
G1 X26.475 Y177.892 E.00315
; LINE_WIDTH: 0.257557
G1 F15000
G1 X26.499 Y178.037 E.00257
; LINE_WIDTH: 0.209528
G1 X26.523 Y178.182 E.002
; LINE_WIDTH: 0.163357
G1 X26.548 Y178.315 E.00133
; LINE_WIDTH: 0.119071
G1 X26.572 Y178.449 E.00084
; OBJECT_ID: 3
; WIPE_START
G1 X26.548 Y178.315 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X28.087 Y170.84 Z2.6 F42000
G1 X32.653 Y148.654 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X32.378 Y148.591 E.00938
G3 X26.391 Y141.01 I1.836 J-7.605 E.34536
G1 X26.391 Y106.99 E1.12848
G3 X34.19 Y99.191 I7.823 J.024 E.40607
G1 X87.71 Y99.191 E1.77533
G3 X95.509 Y106.99 I-.024 J7.823 E.40607
G1 X95.509 Y141.01 E1.12848
G3 X87.71 Y148.809 I-7.823 J-.024 E.40607
G1 X34.19 Y148.809 E1.77533
G3 X32.713 Y148.664 I.024 J-7.823 E.04933
M204 S10000
G1 X32.726 Y148.252 F42000
G1 F8843.478
M204 S6000
G1 X31.914 Y148.037 E.02788
G3 X26.798 Y141.006 I2.3 J-7.05 E.3082
G1 X26.798 Y106.994 E1.12823
G3 X34.194 Y99.598 I7.416 J.019 E.38512
G1 X87.706 Y99.598 E1.77508
G3 X95.102 Y106.994 I-.019 J7.416 E.38512
G1 X95.102 Y141.006 E1.12823
G3 X87.706 Y148.402 I-7.416 J-.019 E.38512
G1 X34.194 Y148.402 E1.77508
G3 X32.785 Y148.263 I.019 J-7.416 E.04704
M204 S250
G1 X32.825 Y147.873 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X32.035 Y147.664 E.02512
G3 X27.19 Y141.002 I2.178 J-6.677 E.27046
G1 X27.19 Y106.998 E1.04485
G3 X34.198 Y99.99 I7.023 J.015 E.33805
G1 X87.702 Y99.99 E1.64404
G3 X94.71 Y106.998 I-.015 J7.023 E.33805
G1 X94.71 Y141.002 E1.04485
G3 X87.702 Y148.01 I-7.023 J-.015 E.33805
G1 X34.198 Y148.01 E1.64404
G3 X32.884 Y147.883 I.015 J-7.023 E.04062
; WIPE_START
M204 S6000
G1 X32.035 Y147.664 E-.33324
G1 X31.517 Y147.476 E-.20918
G1 X31.002 Y147.227 E-.21758
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.71 Y141.219 Z2.6 F42000
G1 X68.941 Y98.809 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.689 Y98.809 E.6219
G3 X95.891 Y107.01 I-.005 J8.207 E.42727
G1 X95.891 Y140.99 E1.12718
G3 X87.69 Y149.191 I-8.207 J-.006 E.42723
G1 X34.21 Y149.191 E1.77403
G3 X26.009 Y140.99 I.006 J-8.207 E.42724
G1 X26.009 Y107.01 E1.12718
G3 X34.21 Y98.809 I8.207 J.006 E.42723
G1 X52.959 Y98.809 E.62194
G1 X52.959 Y93.82 E.16551
G3 X53.48 Y93.309 I.495 J-.016 E.02719
G1 X68.427 Y93.309 E.49581
G3 X68.941 Y93.83 I.02 J.495 E.02731
G1 X68.941 Y98.749 E.16319
M204 S10000
G1 X69.348 Y98.402 F42000
G1 F8843.478
M204 S6000
G1 X87.693 Y98.402 E.60855
G3 X96.298 Y107.006 I-.01 J8.614 E.44819
G1 X96.298 Y140.994 E1.12745
G3 X87.694 Y149.598 I-8.614 J-.01 E.44816
G1 X34.206 Y149.598 E1.7743
G3 X25.602 Y140.994 I.01 J-8.614 E.44817
G1 X25.602 Y107.006 E1.12745
G3 X34.206 Y98.402 I8.614 J.01 E.44816
G1 X52.552 Y98.402 E.60858
G1 X52.552 Y93.812 E.15227
G3 X53.468 Y92.902 I.901 J-.009 E.04773
G1 X68.439 Y92.902 E.49662
G3 X69.348 Y93.818 I.008 J.901 E.04771
G1 X69.348 Y98.342 E.15008
M204 S250
G1 X69.74 Y98.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.697 Y98.01 E.55178
G3 X96.69 Y107.002 I-.014 J9.007 E.43383
G1 X96.69 Y140.998 E1.0446
G3 X87.698 Y149.99 I-9.007 J-.015 E.43382
G1 X34.202 Y149.99 E1.64378
G3 X25.21 Y140.998 I.015 J-9.007 E.43382
G1 X25.21 Y107.002 E1.0446
G3 X34.202 Y98.01 I9.007 J.015 E.43382
G1 X52.16 Y98.01 E.5518
G1 X52.16 Y93.804 E.12923
G3 X53.456 Y92.51 I1.293 J-.001 E.06254
G1 X68.451 Y92.51 E.46074
G3 X69.74 Y93.806 I-.003 J1.293 E.06239
G1 X69.74 Y97.95 E.12733
; WIPE_START
M204 S6000
G1 X71.74 Y97.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.995 Y96.49 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51925
G1 F7557.786
M204 S6000
G1 X66.234 Y96.49 E.00926
G1 X66.233 Y96.013 E.0185
G1 X55.664 Y96.013 E.41025
G1 X55.664 Y96.489 E.01848
G1 X65.935 Y96.49 E.39869
M204 S10000
G1 X66.661 Y96.917 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.66 Y95.587 E.04088
G1 X55.238 Y95.587 E.35096
G1 X55.237 Y96.916 E.04084
G1 X66.601 Y96.917 E.34918
M204 S10000
G1 X67.039 Y97.294 F42000
G1 F9547.299
M204 S6000
G1 X67.036 Y95.21 E.06405
G1 X54.861 Y95.209 E.37411
G1 X54.86 Y97.293 E.06401
G1 X66.979 Y97.294 E.37237
M204 S10000
G1 X67.416 Y97.671 F42000
G1 F9547.299
M204 S6000
G1 X67.413 Y94.833 E.08722
G1 X54.484 Y94.832 E.39727
G1 X54.483 Y97.67 E.08718
G1 X67.356 Y97.671 E.39556
M204 S10000
G1 X67.794 Y98.048 F42000
G1 F9547.299
M204 S6000
G1 X67.79 Y94.455 E.1104
G1 X54.107 Y94.455 E.42042
G1 X54.106 Y98.047 E.11035
G1 X67.734 Y98.048 E.41875
M204 S10000
G1 X68.171 Y98.425 F42000
G1 F9547.299
M204 S6000
G1 X68.166 Y94.078 E.13357
G1 X53.73 Y94.078 E.44358
G1 X53.728 Y98.424 E.13352
G1 X68.111 Y98.425 E.44194
M204 S10000
G1 X68.549 Y98.803 F42000
G1 F9547.299
M204 S6000
G1 X68.543 Y93.853 E.1521
G1 X68.498 Y93.736 E.00384
G1 X68.358 Y93.701 E.00444
G1 X53.501 Y93.701 E.45648
G1 X53.387 Y93.743 E.00374
G1 X53.353 Y93.858 E.0037
G1 X53.351 Y98.801 E.15187
G1 X68.489 Y98.803 E.46512
; OBJECT_ID: 1
; WIPE_START
G1 X66.489 Y98.802 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X69.187 Y91.663 Z2.6 F42000
G1 X91.298 Y33.151 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X91.943 Y33.646 E.02699
G3 X94.509 Y39.19 I-4.757 J5.567 E.20905
G1 X94.509 Y73.21 E1.12848
M73 P81 R5
G3 X87.21 Y80.509 I-7.322 J-.023 E.38003
G1 X33.69 Y80.509 E1.77533
G3 X26.391 Y73.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E1.12848
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X91.247 Y33.119 I-.023 J7.322 E.142
M204 S10000
G1 X91.053 Y33.475 F42000
G1 F8843.478
M204 S6000
G1 X91.679 Y33.955 E.02619
G3 X94.102 Y39.194 I-4.492 J5.257 E.19751
G1 X94.102 Y73.206 E1.12823
G3 X87.206 Y80.102 I-6.915 J-.018 E.35908
G1 X33.694 Y80.102 E1.77508
G3 X26.798 Y73.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E1.12823
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X91.001 Y33.445 I-.018 J6.915 E.13339
M204 S250
G1 X90.814 Y33.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X93.71 Y39.198 I-3.626 J5.421 E.19621
G1 X93.71 Y73.202 E1.04485
G3 X87.202 Y79.71 I-6.522 J-.014 E.31392
G1 X33.698 Y79.71 E1.64404
G3 X27.19 Y73.202 I.014 J-6.522 E.31393
G1 X27.19 Y39.198 E1.04485
G3 X33.698 Y32.69 I6.522 J.014 E.31392
G1 X87.202 Y32.69 E1.64403
G3 X90.764 Y33.758 I-.014 J6.522 E.11587
; WIPE_START
M204 S6000
G1 X91.428 Y34.25 E-.31387
G1 X91.803 Y34.597 E-.19433
G1 X92.15 Y34.972 E-.19428
G1 X92.242 Y35.093 E-.05752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.694 Y33.956 Z2.6 F42000
G1 X68.441 Y31.509 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I-.005 J7.706 E.4012
G1 X94.891 Y73.19 E1.12718
G3 X87.19 Y80.891 I-7.706 J-.005 E.40119
G1 X33.71 Y80.891 E1.77403
G3 X26.009 Y73.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E1.12718
G3 X33.71 Y31.509 I7.706 J.005 E.40119
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.53 E.16517
G3 X52.98 Y26.009 I.495 J-.025 E.02753
G1 X67.927 Y26.009 E.49581
G3 X68.441 Y26.53 I.02 J.495 E.0273
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I-.009 J8.113 E.42213
G1 X95.298 Y73.194 E1.12745
G3 X87.194 Y81.298 I-8.113 J-.01 E.42212
G1 X33.706 Y81.298 E1.7743
G3 X25.602 Y73.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E1.12745
G3 X33.706 Y31.102 I8.113 J.009 E.42213
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.518 E.15207
G3 X52.968 Y25.602 I.906 J-.01 E.04786
G1 X67.939 Y25.602 E.49662
G3 X68.848 Y26.518 I.008 J.901 E.0477
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X95.69 Y39.202 I-.014 J8.506 E.4097
G1 X95.69 Y73.198 E1.0446
G3 X87.198 Y81.69 I-8.506 J-.014 E.4097
G1 X33.702 Y81.69 E1.64378
G3 X25.21 Y73.198 I.014 J-8.506 E.4097
G1 X25.21 Y39.202 E1.0446
G3 X33.702 Y30.71 I8.506 J.014 E.4097
M73 P81 R4
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.506 E.12917
G3 X52.956 Y25.21 I1.3 J.004 E.06251
G1 X67.951 Y25.21 E.46074
G3 X69.24 Y26.506 I-.003 J1.293 E.06239
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.496 Y29.19 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51915
G1 F7559.372
M204 S6000
G1 X65.734 Y29.19 E.00926
G1 X65.734 Y28.713 E.01849
G1 X55.166 Y28.713 E.41008
G1 X55.166 Y29.189 E.01847
G1 X65.436 Y29.19 E.39854
M204 S10000
G1 X66.161 Y29.617 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.287 E.04087
G1 X54.74 Y28.287 E.35089
G1 X54.739 Y29.616 E.04084
G1 X66.101 Y29.617 E.34913
M204 S10000
G1 X66.539 Y29.994 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.91 E.06404
G1 X54.364 Y27.91 E.37403
G1 X54.361 Y29.993 E.06401
G1 X66.479 Y29.994 E.37233
M204 S10000
G1 X66.916 Y30.371 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.533 E.08721
G1 X53.987 Y27.532 E.39718
G1 X53.984 Y30.37 E.08718
G1 X66.856 Y30.371 E.39553
M204 S10000
G1 X67.294 Y30.748 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.155 E.11039
G1 X53.61 Y27.155 E.42032
G1 X53.606 Y30.747 E.11035
G1 X67.234 Y30.748 E.41873
M204 S10000
G1 X67.671 Y31.125 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.778 E.13356
G1 X53.234 Y26.778 E.44347
G1 X53.229 Y31.124 E.13352
G1 X67.611 Y31.125 E.44193
M204 S10000
G1 X68.049 Y31.502 F42000
G1 F9547.299
M204 S6000
G1 X68.043 Y26.553 E.15209
G1 X67.998 Y26.436 E.00384
G1 X67.858 Y26.401 E.00444
G1 X53.002 Y26.401 E.45648
G1 X52.882 Y26.445 E.0039
G1 X52.857 Y26.554 E.00346
G1 X52.851 Y31.501 E.15199
G1 X67.989 Y31.502 E.46512
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.989 Y31.502 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 12/15
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S155.55
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I-.457 J1.128 P1  F42000
G1 X174.752 Y75.571 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X174.588 Y76.005 E.01423
G3 X168.302 Y80.21 I-6.301 J-2.617 E.24631
G1 X114.798 Y80.21 E1.64403
G3 X107.99 Y73.402 I.015 J-6.823 E.3284
G1 X107.99 Y39.398 E1.04485
G3 X114.798 Y32.59 I6.813 J.005 E.32852
G1 X168.302 Y32.59 E1.64403
G3 X175.11 Y39.398 I-.011 J6.819 E.32845
G1 X175.11 Y73.402 E1.04485
G3 X174.774 Y75.503 I-6.823 J-.015 E.06566
G1 X174.77 Y75.514 E.00035
; WIPE_START
M204 S6000
G1 X174.588 Y76.005 E-.19881
G1 X174.368 Y76.492 E-.20311
G1 X173.962 Y77.183 E-.30467
G1 X173.88 Y77.297 E-.05341
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.431 Y70.488 Z2.8 F42000
G1 X150.338 Y30.81 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X168.298 Y30.81 E.55187
G3 X176.89 Y39.402 I-.014 J8.606 E.41452
G1 X176.89 Y73.398 E1.0446
G3 X168.298 Y81.99 I-8.606 J-.014 E.41452
G1 X114.802 Y81.99 E1.64378
G3 X106.293 Y74.579 I0 J-8.591 E.37828
G3 X106.21 Y73.398 I11.912 J-1.43 E.03638
G1 X106.21 Y39.402 E1.0446
G3 X114.802 Y30.81 I8.594 J.002 E.41468
G1 X132.762 Y30.81 E.55187
G1 X132.76 Y26.506 E.13224
G3 X134.056 Y25.21 I1.293 J-.003 E.06261
G1 X149.046 Y25.21 E.4606
G3 X150.34 Y26.506 I.001 J1.293 E.06253
G1 X150.338 Y30.75 E.1304
; WIPE_START
M204 S6000
G1 X152.338 Y30.757 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 2
M625
; object ids of layer 12 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer12 end: 1,2,3,4,5,6,7,8,9
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X175.673 Y77.386 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X172.286 Y80.773 E.14717
G1 X171.299 Y81.226
G1 X176.126 Y76.399 E.20977
G1 X176.386 Y75.606
G1 X170.506 Y81.486 E.25552
G1 X169.816 Y81.643
G1 X172.282 Y79.177 E.10715
; WIPE_START
M204 S6000
G1 X170.867 Y80.591 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X171.086 Y79.839 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X169.192 Y81.734 E.08232
G1 X168.616 Y81.776
G1 X170.253 Y80.139 E.07113
G1 X169.556 Y80.303
G1 X168.076 Y81.783 E.0643
G1 X167.543 Y81.783
G1 X168.938 Y80.387 E.06064
M73 P82 R4
G1 X168.376 Y80.416
G1 X167.01 Y81.783 E.05939
G1 X166.476 Y81.783
G1 X167.842 Y80.417 E.05933
G1 X167.308 Y80.417
G1 X165.943 Y81.783 E.05933
G1 X165.41 Y81.783
G1 X166.775 Y80.417 E.05933
G1 X166.242 Y80.417
G1 X164.877 Y81.783 E.05933
G1 X164.343 Y81.783
G1 X165.709 Y80.417 E.05933
G1 X165.175 Y80.417
G1 X163.81 Y81.783 E.05933
G1 X163.277 Y81.783
G1 X164.642 Y80.417 E.05933
G1 X164.109 Y80.417
G1 X162.744 Y81.783 E.05933
G1 X162.21 Y81.783
G1 X163.576 Y80.417 E.05933
G1 X163.042 Y80.417
G1 X161.677 Y81.783 E.05933
G1 X161.144 Y81.783
G1 X162.509 Y80.417 E.05933
G1 X161.976 Y80.417
G1 X160.611 Y81.783 E.05933
G1 X160.077 Y81.783
G1 X161.443 Y80.417 E.05933
G1 X160.909 Y80.417
G1 X159.544 Y81.783 E.05933
G1 X159.011 Y81.783
G1 X160.376 Y80.417 E.05933
G1 X159.843 Y80.417
G1 X158.478 Y81.783 E.05933
G1 X157.944 Y81.783
G1 X159.31 Y80.417 E.05933
G1 X158.776 Y80.417
G1 X157.411 Y81.783 E.05933
G1 X156.878 Y81.783
G1 X158.243 Y80.417 E.05933
G1 X157.71 Y80.417
G1 X156.345 Y81.783 E.05933
G1 X155.811 Y81.783
G1 X157.177 Y80.417 E.05933
G1 X156.643 Y80.417
G1 X155.278 Y81.783 E.05933
G1 X154.745 Y81.783
G1 X156.11 Y80.417 E.05933
G1 X155.577 Y80.417
G1 X154.212 Y81.783 E.05933
G1 X153.678 Y81.783
G1 X155.043 Y80.417 E.05933
G1 X154.51 Y80.417
G1 X153.145 Y81.783 E.05933
G1 X152.612 Y81.783
G1 X153.977 Y80.417 E.05933
G1 X153.444 Y80.417
G1 X152.078 Y81.783 E.05933
G1 X151.545 Y81.783
G1 X152.91 Y80.417 E.05933
G1 X152.377 Y80.417
G1 X151.012 Y81.783 E.05933
G1 X150.479 Y81.783
G1 X151.844 Y80.417 E.05933
G1 X151.311 Y80.417
G1 X149.945 Y81.783 E.05933
G1 X149.412 Y81.783
G1 X150.777 Y80.417 E.05933
G1 X150.244 Y80.417
G1 X148.879 Y81.783 E.05933
G1 X148.346 Y81.783
G1 X149.711 Y80.417 E.05933
G1 X149.178 Y80.417
G1 X147.812 Y81.783 E.05933
G1 X147.279 Y81.783
G1 X148.644 Y80.417 E.05933
G1 X148.111 Y80.417
G1 X146.746 Y81.783 E.05933
G1 X146.213 Y81.783
G1 X147.578 Y80.417 E.05933
G1 X147.045 Y80.417
G1 X145.679 Y81.783 E.05933
G1 X145.146 Y81.783
G1 X146.511 Y80.417 E.05933
G1 X145.978 Y80.417
G1 X144.613 Y81.783 E.05933
G1 X144.08 Y81.783
G1 X145.445 Y80.417 E.05933
G1 X144.912 Y80.417
G1 X143.546 Y81.783 E.05933
G1 X143.013 Y81.783
G1 X144.378 Y80.417 E.05933
G1 X143.845 Y80.417
G1 X142.48 Y81.783 E.05933
G1 X141.947 Y81.783
G1 X143.312 Y80.417 E.05933
G1 X142.779 Y80.417
G1 X141.413 Y81.783 E.05933
G1 X140.88 Y81.783
G1 X142.245 Y80.417 E.05933
G1 X141.712 Y80.417
G1 X140.347 Y81.783 E.05933
G1 X139.814 Y81.783
G1 X141.179 Y80.417 E.05933
G1 X140.646 Y80.417
G1 X139.28 Y81.783 E.05933
G1 X138.747 Y81.783
G1 X140.112 Y80.417 E.05933
G1 X139.579 Y80.417
G1 X138.214 Y81.783 E.05933
G1 X137.681 Y81.783
G1 X139.046 Y80.417 E.05933
G1 X138.513 Y80.417
G1 X137.147 Y81.783 E.05933
G1 X136.614 Y81.783
G1 X137.979 Y80.417 E.05933
G1 X137.446 Y80.417
G1 X136.081 Y81.783 E.05933
G1 X135.547 Y81.783
G1 X136.913 Y80.417 E.05933
G1 X136.379 Y80.417
G1 X135.014 Y81.783 E.05933
G1 X134.481 Y81.783
G1 X135.846 Y80.417 E.05933
G1 X135.313 Y80.417
G1 X133.948 Y81.783 E.05933
G1 X133.414 Y81.783
G1 X134.78 Y80.417 E.05933
G1 X134.246 Y80.417
G1 X132.881 Y81.783 E.05933
G1 X132.348 Y81.783
G1 X133.713 Y80.417 E.05933
G1 X133.18 Y80.417
G1 X131.815 Y81.783 E.05933
G1 X131.281 Y81.783
G1 X132.647 Y80.417 E.05933
G1 X132.113 Y80.417
G1 X130.748 Y81.783 E.05933
G1 X130.215 Y81.783
G1 X131.58 Y80.417 E.05933
G1 X131.047 Y80.417
G1 X129.682 Y81.783 E.05933
G1 X129.148 Y81.783
G1 X130.514 Y80.417 E.05933
G1 X129.98 Y80.417
G1 X128.615 Y81.783 E.05933
G1 X128.082 Y81.783
G1 X129.447 Y80.417 E.05933
G1 X128.914 Y80.417
G1 X127.549 Y81.783 E.05933
G1 X127.015 Y81.783
G1 X128.381 Y80.417 E.05933
G1 X127.847 Y80.417
G1 X126.482 Y81.783 E.05933
G1 X125.949 Y81.783
G1 X127.314 Y80.417 E.05933
G1 X126.781 Y80.417
G1 X125.416 Y81.783 E.05933
G1 X124.882 Y81.783
G1 X126.248 Y80.417 E.05933
G1 X125.714 Y80.417
G1 X124.349 Y81.783 E.05933
G1 X123.816 Y81.783
G1 X125.181 Y80.417 E.05933
G1 X124.648 Y80.417
G1 X123.283 Y81.783 E.05933
G1 X122.749 Y81.783
G1 X124.115 Y80.417 E.05933
G1 X123.581 Y80.417
G1 X122.216 Y81.783 E.05933
G1 X121.683 Y81.783
G1 X123.048 Y80.417 E.05933
G1 X122.515 Y80.417
G1 X121.15 Y81.783 E.05933
G1 X120.616 Y81.783
G1 X121.982 Y80.417 E.05933
G1 X121.448 Y80.417
G1 X120.083 Y81.783 E.05933
G1 X119.55 Y81.783
G1 X120.915 Y80.417 E.05933
G1 X120.382 Y80.417
G1 X119.017 Y81.783 E.05933
G1 X118.483 Y81.783
G1 X119.848 Y80.417 E.05933
G1 X119.315 Y80.417
G1 X117.95 Y81.783 E.05933
G1 X117.417 Y81.783
G1 X118.782 Y80.417 E.05933
G1 X118.249 Y80.417
G1 X116.883 Y81.783 E.05933
G1 X116.35 Y81.783
G1 X117.715 Y80.417 E.05933
G1 X117.182 Y80.417
G1 X115.817 Y81.783 E.05933
G1 X115.284 Y81.783
G1 X116.649 Y80.417 E.05933
G1 X116.116 Y80.417
G1 X114.751 Y81.782 E.05928
G1 X114.237 Y81.762
G1 X115.582 Y80.417 E.05844
G1 X115.049 Y80.417
G1 X113.751 Y81.716 E.05641
G1 X113.29 Y81.644
G1 X114.521 Y80.412 E.05353
G1 X114.026 Y80.374
G1 X112.848 Y81.552 E.0512
G1 X112.428 Y81.439
G1 X113.561 Y80.306 E.04922
G1 X113.121 Y80.213
G1 X112.025 Y81.308 E.0476
G1 X111.638 Y81.162
G1 X112.704 Y80.096 E.04634
G1 X112.308 Y79.959
G1 X111.266 Y81.001 E.04527
G1 X110.91 Y80.824
G1 X111.931 Y79.803 E.04436
G1 X111.571 Y79.63
G1 X110.567 Y80.633 E.04362
G1 X110.237 Y80.43
G1 X111.228 Y79.439 E.04307
G1 X110.9 Y79.234
G1 X109.92 Y80.214 E.0426
G1 X109.615 Y79.986
G1 X110.589 Y79.012 E.04234
G1 X110.291 Y78.776
G1 X109.323 Y79.745 E.04209
G1 X109.043 Y79.491
G1 X110.008 Y78.526 E.04194
G1 X109.74 Y78.261
G1 X108.775 Y79.226 E.04194
G1 X108.519 Y78.949
G1 X109.486 Y77.982 E.04201
G1 X109.246 Y77.688
G1 X108.275 Y78.66 E.04223
G1 X108.042 Y78.359
G1 X109.022 Y77.38 E.04255
G1 X108.811 Y77.057
G1 X107.823 Y78.045 E.04295
G1 X107.617 Y77.718
G1 X108.618 Y76.717 E.0435
G1 X108.439 Y76.362
G1 X107.423 Y77.378 E.04414
G1 X107.243 Y77.025
G1 X108.279 Y75.989 E.045
G1 X108.136 Y75.598
G1 X107.077 Y76.658 E.04602
G1 X106.926 Y76.275
G1 X108.015 Y75.187 E.04731
G1 X107.915 Y74.754
G1 X106.793 Y75.875 E.04875
G1 X106.676 Y75.459
G1 X107.841 Y74.294 E.05062
G1 X107.796 Y73.806
G1 X106.577 Y75.025 E.05297
G1 X106.501 Y74.568
G1 X107.783 Y73.286 E.0557
G1 X107.783 Y72.753
G1 X106.446 Y74.089 E.05807
G1 X106.421 Y73.581
G1 X107.783 Y72.219 E.05917
G1 X107.783 Y71.686
G1 X106.417 Y73.051 E.05933
G1 X106.417 Y72.518
G1 X107.783 Y71.153 E.05933
G1 X107.783 Y70.62
G1 X106.417 Y71.985 E.05933
G1 X106.417 Y71.452
G1 X107.783 Y70.086 E.05933
G1 X107.783 Y69.553
G1 X106.417 Y70.918 E.05933
G1 X106.417 Y70.385
G1 X107.783 Y69.02 E.05933
G1 X107.783 Y68.487
G1 X106.417 Y69.852 E.05933
G1 X106.417 Y69.319
G1 X107.783 Y67.953 E.05933
G1 X107.783 Y67.42
G1 X106.417 Y68.785 E.05933
G1 X106.417 Y68.252
G1 X107.783 Y66.887 E.05933
G1 X107.783 Y66.354
G1 X106.417 Y67.719 E.05933
G1 X106.417 Y67.186
G1 X107.783 Y65.82 E.05933
G1 X107.783 Y65.287
G1 X106.417 Y66.652 E.05933
G1 X106.417 Y66.119
G1 X107.783 Y64.754 E.05933
G1 X107.783 Y64.221
G1 X106.417 Y65.586 E.05933
G1 X106.417 Y65.053
G1 X107.783 Y63.687 E.05933
G1 X107.783 Y63.154
G1 X106.417 Y64.519 E.05933
G1 X106.417 Y63.986
G1 X107.783 Y62.621 E.05933
G1 X107.783 Y62.088
G1 X106.417 Y63.453 E.05933
G1 X106.417 Y62.92
G1 X107.783 Y61.554 E.05933
G1 X107.783 Y61.021
G1 X106.417 Y62.386 E.05933
G1 X106.417 Y61.853
G1 X107.783 Y60.488 E.05933
G1 X107.783 Y59.955
G1 X106.417 Y61.32 E.05933
G1 X106.417 Y60.787
G1 X107.783 Y59.421 E.05933
G1 X107.783 Y58.888
G1 X106.417 Y60.253 E.05933
G1 X106.417 Y59.72
G1 X107.783 Y58.355 E.05933
G1 X107.783 Y57.822
G1 X106.417 Y59.187 E.05933
G1 X106.417 Y58.653
G1 X107.783 Y57.288 E.05933
G1 X107.783 Y56.755
G1 X106.417 Y58.12 E.05933
G1 X106.417 Y57.587
G1 X107.783 Y56.222 E.05933
G1 X107.783 Y55.688
G1 X106.417 Y57.054 E.05933
G1 X106.417 Y56.52
G1 X107.783 Y55.155 E.05933
G1 X107.783 Y54.622
G1 X106.417 Y55.987 E.05933
G1 X106.417 Y55.454
G1 X107.783 Y54.089 E.05933
G1 X107.783 Y53.555
G1 X106.417 Y54.921 E.05933
G1 X106.417 Y54.387
G1 X107.783 Y53.022 E.05933
G1 X107.783 Y52.489
G1 X106.417 Y53.854 E.05933
G1 X106.417 Y53.321
G1 X107.783 Y51.956 E.05933
G1 X107.783 Y51.422
G1 X106.417 Y52.788 E.05933
G1 X106.417 Y52.254
G1 X107.783 Y50.889 E.05933
G1 X107.783 Y50.356
G1 X106.417 Y51.721 E.05933
M73 P83 R4
G1 X106.417 Y51.188
G1 X107.783 Y49.823 E.05933
G1 X107.783 Y49.289
G1 X106.417 Y50.655 E.05933
G1 X106.417 Y50.121
G1 X107.783 Y48.756 E.05933
G1 X107.783 Y48.223
G1 X106.417 Y49.588 E.05933
G1 X106.417 Y49.055
G1 X107.783 Y47.69 E.05933
G1 X107.783 Y47.156
G1 X106.417 Y48.522 E.05933
G1 X106.417 Y47.988
G1 X107.783 Y46.623 E.05933
G1 X107.783 Y46.09
G1 X106.417 Y47.455 E.05933
G1 X106.417 Y46.922
G1 X107.783 Y45.557 E.05933
G1 X107.783 Y45.023
G1 X106.417 Y46.389 E.05933
G1 X106.417 Y45.855
G1 X107.783 Y44.49 E.05933
G1 X107.783 Y43.957
G1 X106.417 Y45.322 E.05933
G1 X106.417 Y44.789
G1 X107.783 Y43.424 E.05933
G1 X107.783 Y42.89
G1 X106.417 Y44.256 E.05933
G1 X106.417 Y43.722
G1 X107.783 Y42.357 E.05933
G1 X107.783 Y41.824
G1 X106.417 Y43.189 E.05933
G1 X106.417 Y42.656
G1 X107.783 Y41.291 E.05933
G1 X107.783 Y40.757
G1 X106.417 Y42.123 E.05933
G1 X106.417 Y41.589
G1 X107.783 Y40.224 E.05933
G1 X107.783 Y39.691
G1 X106.417 Y41.056 E.05933
G1 X106.417 Y40.523
G1 X107.787 Y39.153 E.05953
G1 X107.831 Y38.576
G1 X106.417 Y39.989 E.06143
G1 X106.417 Y39.456
G1 X107.938 Y37.935 E.06609
G1 X108.135 Y37.205
G1 X106.434 Y38.907 E.07394
G1 X106.489 Y38.318
G1 X108.504 Y36.303 E.08759
; WIPE_START
M204 S6000
G1 X107.09 Y37.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.658 Y41.606 Z2.8 F42000
G1 X174.077 Y77.382 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X176.543 Y74.916 E.10715
G1 X176.634 Y74.292
G1 X174.739 Y76.186 E.08232
G1 X175.04 Y75.353
G1 X176.676 Y73.716 E.07113
G1 X176.683 Y73.176
G1 X175.203 Y74.656 E.0643
G1 X175.287 Y74.038
G1 X176.683 Y72.643 E.06064
G1 X176.683 Y72.11
G1 X175.316 Y73.476 E.05939
G1 X175.317 Y72.942
G1 X176.683 Y71.576 E.05933
G1 X176.683 Y71.043
G1 X175.317 Y72.408 E.05933
G1 X175.317 Y71.875
G1 X176.683 Y70.51 E.05933
G1 X176.683 Y69.977
G1 X175.317 Y71.342 E.05933
G1 X175.317 Y70.809
G1 X176.683 Y69.443 E.05933
G1 X176.683 Y68.91
G1 X175.317 Y70.275 E.05933
G1 X175.317 Y69.742
G1 X176.683 Y68.377 E.05933
G1 X176.683 Y67.844
G1 X175.317 Y69.209 E.05933
G1 X175.317 Y68.676
G1 X176.683 Y67.31 E.05933
G1 X176.683 Y66.777
G1 X175.317 Y68.142 E.05933
G1 X175.317 Y67.609
G1 X176.683 Y66.244 E.05933
G1 X176.683 Y65.711
G1 X175.317 Y67.076 E.05933
G1 X175.317 Y66.543
G1 X176.683 Y65.177 E.05933
G1 X176.683 Y64.644
G1 X175.317 Y66.009 E.05933
G1 X175.317 Y65.476
G1 X176.683 Y64.111 E.05933
G1 X176.683 Y63.578
G1 X175.317 Y64.943 E.05933
G1 X175.317 Y64.41
G1 X176.683 Y63.044 E.05933
G1 X176.683 Y62.511
G1 X175.317 Y63.876 E.05933
G1 X175.317 Y63.343
G1 X176.683 Y61.978 E.05933
G1 X176.683 Y61.445
G1 X175.317 Y62.81 E.05933
G1 X175.317 Y62.277
G1 X176.683 Y60.911 E.05933
G1 X176.683 Y60.378
G1 X175.317 Y61.743 E.05933
G1 X175.317 Y61.21
G1 X176.683 Y59.845 E.05933
G1 X176.683 Y59.312
G1 X175.317 Y60.677 E.05933
G1 X175.317 Y60.143
G1 X176.683 Y58.778 E.05933
G1 X176.683 Y58.245
G1 X175.317 Y59.61 E.05933
G1 X175.317 Y59.077
G1 X176.683 Y57.712 E.05933
G1 X176.683 Y57.178
G1 X175.317 Y58.544 E.05933
G1 X175.317 Y58.01
G1 X176.683 Y56.645 E.05933
G1 X176.683 Y56.112
G1 X175.317 Y57.477 E.05933
G1 X175.317 Y56.944
G1 X176.683 Y55.579 E.05933
G1 X176.683 Y55.045
G1 X175.317 Y56.411 E.05932
G1 X175.317 Y55.877
G1 X176.683 Y54.512 E.05933
G1 X176.683 Y53.979
G1 X175.317 Y55.344 E.05933
G1 X175.317 Y54.811
G1 X176.683 Y53.446 E.05933
G1 X176.683 Y52.912
G1 X175.317 Y54.278 E.05933
G1 X175.317 Y53.744
G1 X176.683 Y52.379 E.05933
G1 X176.683 Y51.846
G1 X175.317 Y53.211 E.05933
G1 X175.317 Y52.678
G1 X176.683 Y51.313 E.05933
G1 X176.683 Y50.779
G1 X175.317 Y52.145 E.05933
G1 X175.317 Y51.611
G1 X176.683 Y50.246 E.05933
G1 X176.683 Y49.713
G1 X175.317 Y51.078 E.05933
G1 X175.317 Y50.545
G1 X176.683 Y49.18 E.05933
G1 X176.683 Y48.646
G1 X175.317 Y50.012 E.05933
G1 X175.317 Y49.478
G1 X176.683 Y48.113 E.05933
G1 X176.683 Y47.58
G1 X175.317 Y48.945 E.05933
G1 X175.317 Y48.412
G1 X176.683 Y47.047 E.05933
G1 X176.683 Y46.513
G1 X175.317 Y47.879 E.05933
G1 X175.317 Y47.345
G1 X176.683 Y45.98 E.05933
G1 X176.683 Y45.447
G1 X175.317 Y46.812 E.05933
G1 X175.317 Y46.279
G1 X176.683 Y44.914 E.05933
G1 X176.683 Y44.38
G1 X175.317 Y45.746 E.05933
G1 X175.317 Y45.212
G1 X176.683 Y43.847 E.05933
G1 X176.683 Y43.314
G1 X175.317 Y44.679 E.05933
G1 X175.317 Y44.146
G1 X176.683 Y42.781 E.05933
G1 X176.683 Y42.247
G1 X175.317 Y43.613 E.05933
G1 X175.317 Y43.079
G1 X176.683 Y41.714 E.05933
G1 X176.683 Y41.181
G1 X175.317 Y42.546 E.05933
G1 X175.317 Y42.013
G1 X176.683 Y40.648 E.05933
G1 X176.683 Y40.114
G1 X175.317 Y41.479 E.05933
G1 X175.317 Y40.946
G1 X176.683 Y39.581 E.05933
G1 X176.675 Y39.055
G1 X175.317 Y40.413 E.059
G1 X175.317 Y39.88
G1 X176.639 Y38.558 E.05741
G1 X176.579 Y38.085
G1 X175.316 Y39.347 E.05485
G1 X175.295 Y38.836
G1 X176.493 Y37.637 E.0521
G1 X176.39 Y37.208
G1 X175.239 Y38.358 E.05
G1 X175.156 Y37.908
G1 X176.268 Y36.796 E.04832
G1 X176.127 Y36.404
G1 X175.05 Y37.481 E.04682
G1 X174.92 Y37.077
G1 X175.972 Y36.026 E.04568
G1 X175.802 Y35.662
G1 X174.773 Y36.691 E.04471
G1 X174.606 Y36.325
G1 X175.618 Y35.313 E.04398
G1 X175.42 Y34.978
G1 X174.424 Y35.974 E.04328
G1 X174.224 Y35.641
G1 X175.209 Y34.656 E.0428
G1 X174.985 Y34.346
G1 X174.01 Y35.322 E.0424
G1 X173.78 Y35.018
G1 X174.75 Y34.048 E.04214
G1 X174.502 Y33.763
G1 X173.535 Y34.729 E.04201
G1 X173.278 Y34.454
G1 X174.243 Y33.489 E.04194
G1 X173.971 Y33.227
G1 X173.004 Y34.194 E.04201
G1 X172.717 Y33.948
G1 X173.686 Y32.979 E.04214
G1 X173.39 Y32.742
G1 X172.415 Y33.716 E.04235
G1 X172.098 Y33.501
G1 X173.082 Y32.517 E.04275
G1 X172.761 Y32.304
G1 X171.766 Y33.299 E.04322
G1 X171.418 Y33.114
G1 X172.427 Y32.105 E.04387
G1 X172.08 Y31.919
G1 X171.053 Y32.946 E.04464
G1 X170.67 Y32.796
G1 X171.718 Y31.747 E.04555
G1 X171.342 Y31.591
G1 X170.267 Y32.665 E.04669
G1 X169.843 Y32.556
G1 X170.95 Y31.449 E.04811
G1 X170.542 Y31.324
G1 X169.397 Y32.469 E.04977
G1 X168.921 Y32.411
G1 X170.115 Y31.218 E.05185
G1 X169.668 Y31.131
G1 X168.414 Y32.385 E.05449
G1 X167.883 Y32.383
G1 X169.199 Y31.067 E.05717
G1 X168.704 Y31.028
G1 X167.35 Y32.383 E.05885
G1 X166.817 Y32.383
G1 X168.182 Y31.017 E.05933
G1 X167.649 Y31.017
G1 X166.284 Y32.383 E.05933
G1 X165.75 Y32.383
G1 X167.115 Y31.017 E.05933
G1 X166.582 Y31.017
G1 X165.217 Y32.383 E.05933
G1 X164.684 Y32.383
G1 X166.049 Y31.017 E.05933
G1 X165.516 Y31.017
G1 X164.15 Y32.383 E.05933
G1 X163.617 Y32.383
G1 X164.982 Y31.017 E.05933
G1 X164.449 Y31.017
G1 X163.084 Y32.383 E.05933
G1 X162.551 Y32.383
G1 X163.916 Y31.017 E.05933
G1 X163.383 Y31.017
G1 X162.017 Y32.383 E.05933
G1 X161.484 Y32.383
G1 X162.849 Y31.017 E.05933
G1 X162.316 Y31.017
G1 X160.951 Y32.383 E.05933
G1 X160.418 Y32.383
G1 X161.783 Y31.017 E.05933
G1 X161.25 Y31.017
G1 X159.884 Y32.383 E.05933
G1 X159.351 Y32.383
G1 X160.716 Y31.017 E.05933
G1 X160.183 Y31.017
G1 X158.818 Y32.383 E.05933
G1 X158.285 Y32.383
G1 X159.65 Y31.017 E.05933
G1 X159.117 Y31.017
G1 X157.751 Y32.383 E.05933
G1 X157.218 Y32.383
G1 X158.583 Y31.017 E.05933
G1 X158.05 Y31.017
G1 X156.685 Y32.383 E.05933
G1 X156.152 Y32.383
G1 X157.517 Y31.017 E.05933
G1 X156.984 Y31.017
G1 X155.618 Y32.383 E.05933
G1 X155.085 Y32.383
G1 X156.45 Y31.017 E.05933
G1 X155.917 Y31.017
G1 X154.552 Y32.383 E.05933
G1 X154.019 Y32.383
G1 X155.384 Y31.017 E.05933
G1 X154.851 Y31.017
G1 X153.485 Y32.383 E.05933
G1 X152.952 Y32.383
G1 X154.317 Y31.017 E.05933
G1 X153.784 Y31.017
G1 X152.419 Y32.383 E.05933
G1 X151.886 Y32.383
G1 X153.251 Y31.017 E.05933
G1 X152.718 Y31.017
G1 X151.352 Y32.383 E.05933
G1 X150.819 Y32.383
G1 X152.184 Y31.017 E.05933
G1 X151.651 Y31.017
G1 X150.286 Y32.383 E.05933
G1 X149.753 Y32.383
G1 X151.118 Y31.017 E.05933
G1 X150.585 Y31.017
G1 X149.219 Y32.383 E.05933
G1 X148.686 Y32.383
G1 X150.13 Y30.938 E.06276
G1 X150.13 Y30.405
G1 X148.153 Y32.383 E.08594
G1 X147.62 Y32.383
G1 X150.131 Y29.871 E.10913
G1 X150.131 Y29.338
G1 X147.086 Y32.383 E.13231
G1 X146.553 Y32.383
G1 X150.131 Y28.804 E.1555
G1 X150.132 Y28.271
G1 X146.02 Y32.383 E.17868
G1 X145.486 Y32.383
G1 X150.132 Y27.737 E.20187
G1 X150.132 Y27.204
G1 X144.953 Y32.383 E.22505
G1 X144.42 Y32.383
G1 X150.133 Y26.67 E.24824
G1 X150.085 Y26.185
G1 X143.887 Y32.383 E.26933
G1 X143.353 Y32.383
G1 X149.903 Y25.834 E.28459
G1 X149.621 Y25.582
G1 X142.82 Y32.383 E.29553
G1 X142.287 Y32.383
G1 X149.235 Y25.434 E.30193
G1 X148.719 Y25.417
G1 X141.754 Y32.383 E.30267
G1 X141.22 Y32.383
G1 X148.186 Y25.417 E.30267
G1 X147.652 Y25.417
G1 X140.687 Y32.383 E.30267
G1 X140.154 Y32.383
G1 X147.119 Y25.417 E.30267
G1 X146.586 Y25.417
G1 X139.621 Y32.383 E.30267
G1 X139.087 Y32.383
G1 X146.053 Y25.417 E.30267
G1 X145.519 Y25.417
G1 X138.554 Y32.383 E.30267
G1 X138.021 Y32.383
G1 X144.986 Y25.417 E.30267
G1 X144.453 Y25.417
G1 X137.488 Y32.383 E.30267
G1 X136.954 Y32.383
G1 X143.92 Y25.417 E.30267
G1 X143.386 Y25.417
G1 X136.421 Y32.383 E.30267
G1 X135.888 Y32.383
G1 X142.853 Y25.417 E.30267
G1 X142.32 Y25.417
G1 X135.355 Y32.383 E.30267
G1 X134.821 Y32.383
G1 X141.787 Y25.417 E.30267
G1 X141.253 Y25.417
G1 X134.288 Y32.383 E.30267
G1 X133.755 Y32.383
G1 X140.72 Y25.417 E.30267
G1 X140.187 Y25.417
G1 X133.222 Y32.383 E.30267
G1 X132.688 Y32.383
G1 X139.653 Y25.417 E.30267
G1 X139.12 Y25.417
G1 X132.155 Y32.383 E.30267
G1 X131.622 Y32.383
G1 X138.587 Y25.417 E.30267
G1 X138.054 Y25.417
G1 X132.97 Y30.502 E.22093
G1 X132.969 Y29.969
G1 X137.52 Y25.417 E.19777
G1 X136.987 Y25.417
G1 X132.969 Y29.436 E.17461
G1 X132.969 Y28.903
G1 X136.454 Y25.417 E.15145
M73 P84 R4
G1 X135.921 Y25.417
G1 X132.968 Y28.37 E.12829
G1 X132.968 Y27.837
G1 X135.387 Y25.417 E.10513
G1 X134.854 Y25.417
G1 X132.968 Y27.304 E.08197
G1 X132.968 Y26.771
G1 X134.321 Y25.417 E.05881
; WIPE_START
M204 S6000
G1 X132.968 Y26.771 E-.72732
G1 X132.968 Y26.857 E-.03269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.454 Y31.017 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X131.089 Y32.383 E.05933
G1 X130.555 Y32.383
G1 X131.92 Y31.017 E.05933
G1 X131.387 Y31.017
G1 X130.022 Y32.383 E.05933
G1 X129.489 Y32.383
G1 X130.854 Y31.017 E.05933
G1 X130.321 Y31.017
G1 X128.955 Y32.383 E.05933
G1 X128.422 Y32.383
G1 X129.787 Y31.017 E.05933
G1 X129.254 Y31.017
G1 X127.889 Y32.383 E.05933
G1 X127.356 Y32.383
G1 X128.721 Y31.017 E.05933
G1 X128.188 Y31.017
G1 X126.822 Y32.383 E.05933
G1 X126.289 Y32.383
G1 X127.654 Y31.017 E.05933
G1 X127.121 Y31.017
G1 X125.756 Y32.383 E.05933
G1 X125.223 Y32.383
G1 X126.588 Y31.017 E.05933
G1 X126.055 Y31.017
G1 X124.689 Y32.383 E.05933
G1 X124.156 Y32.383
G1 X125.521 Y31.017 E.05933
G1 X124.988 Y31.017
G1 X123.623 Y32.383 E.05933
G1 X123.09 Y32.383
G1 X124.455 Y31.017 E.05933
G1 X123.922 Y31.017
G1 X122.556 Y32.383 E.05933
G1 X122.023 Y32.383
G1 X123.388 Y31.017 E.05933
G1 X122.855 Y31.017
G1 X121.49 Y32.383 E.05933
G1 X120.957 Y32.383
G1 X122.322 Y31.017 E.05933
G1 X121.789 Y31.017
G1 X120.423 Y32.383 E.05933
G1 X119.89 Y32.383
G1 X121.255 Y31.017 E.05933
G1 X120.722 Y31.017
G1 X119.357 Y32.383 E.05933
G1 X118.824 Y32.383
G1 X120.189 Y31.017 E.05933
G1 X119.656 Y31.017
G1 X118.29 Y32.383 E.05933
G1 X117.757 Y32.383
G1 X119.122 Y31.017 E.05933
G1 X118.589 Y31.017
G1 X117.224 Y32.383 E.05933
G1 X116.691 Y32.383
G1 X118.056 Y31.017 E.05933
G1 X117.523 Y31.017
G1 X116.157 Y32.383 E.05933
G1 X115.624 Y32.383
G1 X116.989 Y31.017 E.05933
G1 X116.456 Y31.017
G1 X115.091 Y32.383 E.05933
G1 X114.553 Y32.387
G1 X115.923 Y31.017 E.05953
G1 X115.389 Y31.017
G1 X113.976 Y32.431 E.06143
G1 X113.335 Y32.538
G1 X114.856 Y31.017 E.06609
G1 X114.307 Y31.034
G1 X112.605 Y32.735 E.07394
G1 X111.703 Y33.104
G1 X113.718 Y31.089 E.08758
G1 X113.076 Y31.198
G1 X106.598 Y37.676 E.28149
G1 X106.783 Y36.958
G1 X112.358 Y31.383 E.24226
G1 X111.52 Y31.687
G1 X107.087 Y36.12 E.19266
G1 X107.651 Y35.023
G1 X110.423 Y32.251 E.12046
; WIPE_START
M204 S6000
G1 X109.009 Y33.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.408 Y41.287 Z2.8 F42000
G1 X111.41 Y79.523 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0955913
G1 F15000
M204 S6000
G1 X111.362 Y79.53 E.00021
G1 X111.298 Y79.481 E.00034
; WIPE_START
G1 X111.362 Y79.53 E-.46965
G1 X111.41 Y79.523 E-.29035
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.042 Y79.633 Z2.8 F42000
G1 X169.218 Y80.353 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.137433
G1 F15000
M204 S6000
G1 X169.007 Y80.456 E.00181
; WIPE_START
G1 X169.218 Y80.353 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X163.007 Y75.917 Z2.8 F42000
G1 X108.273 Y36.824 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.144927
G1 F15000
M204 S6000
G1 X108.07 Y37.14 E.00312
; WIPE_START
G1 X108.273 Y36.824 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.788 Y35.781 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.100884
G1 F15000
M204 S6000
G1 X108.72 Y35.869 E.00052
; LINE_WIDTH: 0.126509
G1 X108.651 Y35.958 E.00077
; LINE_WIDTH: 0.158827
G1 X108.572 Y36.064 E.00124
; LINE_WIDTH: 0.196588
G1 X108.494 Y36.169 E.00165
G1 X108.517 Y36.316 E.00185
; WIPE_START
G1 X108.494 Y36.169 E-.40231
G1 X108.572 Y36.064 E-.35769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.268 Y33.108 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0989819
G1 F15000
M204 S6000
G2 X108.508 Y33.868 I16.203 J16.963 E.00491
; WIPE_START
G1 X109.268 Y33.108 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.967 Y31.946 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.108528
G1 F15000
M204 S6000
G1 X110.846 Y32.036 E.0008
; LINE_WIDTH: 0.149234
G1 X110.726 Y32.125 E.0013
; LINE_WIDTH: 0.183238
G1 X110.605 Y32.219 E.00175
; LINE_WIDTH: 0.210518
G1 X110.484 Y32.312 E.00209
; WIPE_START
G1 X110.605 Y32.219 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.715 Y33.117 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.19539
G1 F15000
M204 S6000
G1 X111.569 Y33.094 E.00183
; LINE_WIDTH: 0.197391
G1 X111.463 Y33.173 E.00166
; LINE_WIDTH: 0.158406
G1 X111.356 Y33.252 E.00126
; LINE_WIDTH: 0.12614
G1 X111.268 Y33.32 E.00075
; LINE_WIDTH: 0.100821
G1 X111.181 Y33.388 E.00052
; WIPE_START
G1 X111.268 Y33.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.476 Y30.808 Z2.8 F42000
G1 X133.982 Y25.403 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.307928
G1 F13584.53
M204 S6000
G1 X133.647 Y25.627 E.00869
; LINE_WIDTH: 0.348408
G1 F11784.42
G2 X133.495 Y25.745 I1.128 J1.613 E.00481
; LINE_WIDTH: 0.371236
G1 F10965.07
G2 X133.218 Y26.04 I1.254 J1.452 E.01084
; LINE_WIDTH: 0.333002
G1 F12410.306
G1 X132.955 Y26.403 E.01059
; WIPE_START
G1 X133.218 Y26.04 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.954 Y28.382 Z2.8 F42000
G1 X113.269 Y32.472 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.16031
G1 F15000
M204 S6000
G1 X113.013 Y32.616 E.00281
; WIPE_START
G1 X113.269 Y32.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.902 Y32.467 Z2.8 F42000
G1 X168.941 Y32.431 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.11037
G1 F15000
M204 S6000
G1 X168.732 Y32.334 E.00127
; WIPE_START
G1 X168.941 Y32.431 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.123 Y39.971 Z2.8 F42000
G1 X175.386 Y73.547 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.116998
G1 F15000
M204 S6000
G1 X175.29 Y73.769 E.00146
; WIPE_START
G1 X175.386 Y73.547 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X175.596 Y65.917 Z2.8 F42000
G1 X176.384 Y37.179 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0974931
G1 F15000
M204 S6000
G1 X176.3 Y37.031 E.00076
; WIPE_START
G1 X176.384 Y37.179 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X176.294 Y44.811 Z2.8 F42000
G1 X175.916 Y76.903 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.10575
G1 F15000
M204 S6000
G1 X175.85 Y76.995 E.00058
; LINE_WIDTH: 0.140897
G1 X175.784 Y77.088 E.0009
; LINE_WIDTH: 0.176045
G1 X175.719 Y77.18 E.00123
; LINE_WIDTH: 0.206897
G1 X175.611 Y77.325 E.00241
; WIPE_START
G1 X175.719 Y77.18 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X174.801 Y76.248 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.202804
G1 F15000
M204 S6000
G1 X174.723 Y76.363 E.00181
; LINE_WIDTH: 0.1696
G1 X174.642 Y76.476 E.00144
; LINE_WIDTH: 0.123099
G1 X174.561 Y76.591 E.00092
; LINE_WIDTH: 0.0939736
G1 X174.524 Y76.641 E.00026
M204 S10000
G1 X174.138 Y77.442 F42000
; LINE_WIDTH: 0.210523
G1 F15000
M204 S6000
G1 X173.852 Y77.775 E.00599
; LINE_WIDTH: 0.150409
G1 X173.28 Y78.381 E.0073
G1 X172.675 Y78.952 E.00729
; LINE_WIDTH: 0.210541
G1 X172.342 Y79.237 E.00599
; WIPE_START
G1 X172.675 Y78.952 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X175.2 Y78.155 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.104641
G1 F15000
M204 S6000
G1 X175.065 Y78.315 E.00105
; LINE_WIDTH: 0.14369
G1 X174.849 Y78.563 E.0027
; LINE_WIDTH: 0.182332
G1 X174.629 Y78.806 E.00372
; LINE_WIDTH: 0.214434
G3 X173.706 Y79.729 I-16.13 J-15.207 E.01826
; LINE_WIDTH: 0.182318
G1 X173.463 Y79.949 E.00372
; LINE_WIDTH: 0.143674
G1 X173.215 Y80.165 E.0027
; LINE_WIDTH: 0.104644
G1 X173.055 Y80.3 E.00105
; WIPE_START
G1 X173.215 Y80.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X171.541 Y79.624 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0941118
G1 F15000
M204 S6000
G1 X171.49 Y79.662 E.00026
; LINE_WIDTH: 0.123323
G1 X171.376 Y79.742 E.00091
; LINE_WIDTH: 0.170075
G1 X171.26 Y79.825 E.00147
; LINE_WIDTH: 0.202978
G1 X171.148 Y79.901 E.00177
M204 S10000
G1 X170.611 Y80.024 F42000
; LINE_WIDTH: 0.147636
G1 F15000
M204 S6000
G1 X170.318 Y80.205 E.00294
; OBJECT_ID: 4
; WIPE_START
G1 X170.611 Y80.024 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X164.419 Y84.487 Z2.8 F42000
G1 X129.595 Y109.59 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X128.21 Y112.712 I-11.182 J-3.091 E.10534
G1 X128.21 Y109.461 E.09989
G3 X127.511 Y108.348 I.647 J-1.182 E.0422
G1 X127.51 Y100.398 E.24426
G2 X108.99 Y103.998 I-8.909 J3.604 E.81409
G1 X108.99 Y112.713 E.26779
G3 X107.21 Y106.598 I9.823 J-6.176 E.19824
G3 X107.219 Y103.548 I76.939 J-1.298 E.09371
G1 X107.232 Y103.322 E.00696
G3 X119.226 Y92.628 I11.371 J.679 E.54807
G3 X128.842 Y99.01 I-.666 J11.44 E.37165
G1 X139.851 Y99.011 E.33825
G3 X141.089 Y100.251 I-.057 J1.295 E.05913
G1 X141.089 Y108.348 E.24879
G3 X139.849 Y109.589 I-1.295 J-.055 E.0592
G1 X129.655 Y109.59 E.31323
; WIPE_START
M204 S6000
G1 X129.274 Y110.575 E-.40154
G1 X128.935 Y111.386 E-.3337
G1 X128.906 Y111.444 E-.02477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.407 Y110.029 Z2.8 F42000
G1 X139.85 Y109.38 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X140.88 Y108.349 E.04479
G1 X140.881 Y107.815
G1 X139.315 Y109.381 E.06807
G1 X138.782 Y109.381
G1 X140.881 Y107.282 E.09124
G1 X140.881 Y106.748
G1 X138.248 Y109.381 E.11442
G1 X137.715 Y109.381
G1 X140.881 Y106.215 E.13759
G1 X140.881 Y105.682
G1 X137.182 Y109.382 E.16077
G1 X136.649 Y109.382
G1 X140.881 Y105.149 E.18394
G1 X140.881 Y104.615
G1 X136.115 Y109.382 E.20712
G1 X135.582 Y109.382
G1 X140.881 Y104.082 E.23029
G1 X140.881 Y103.549
G1 X135.049 Y109.382 E.25347
G1 X134.515 Y109.382
G1 X140.881 Y103.016 E.27664
G1 X140.881 Y102.482
G1 X133.982 Y109.382 E.29982
G1 X133.449 Y109.382
G1 X140.881 Y101.949 E.32299
G1 X140.881 Y101.416
G1 X132.915 Y109.382 E.34617
G1 X132.382 Y109.382
G1 X140.881 Y100.883 E.36934
G1 X140.881 Y100.349
G1 X131.849 Y109.382 E.39252
G1 X131.315 Y109.382
G1 X140.803 Y99.895 E.41227
G1 X140.595 Y99.569
G1 X130.782 Y109.382 E.42644
G1 X130.249 Y109.382
G1 X140.294 Y99.337 E.43652
G1 X139.877 Y99.221
G1 X129.715 Y109.382 E.44156
; WIPE_START
M204 S6000
G1 X131.13 Y107.968 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.047 Y110.584 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X128.417 Y111.214 E.02737
G1 X128.417 Y110.68
G1 X129.32 Y109.778 E.03922
G1 X128.417 Y110.147
G1 X139.346 Y99.218 E.47491
G1 X138.813 Y99.218
G1 X128.417 Y109.614 E.45174
G1 X128.258 Y109.24
G1 X138.28 Y99.218 E.43551
G1 X137.747 Y99.218
G1 X127.972 Y108.993 E.42477
G1 X127.778 Y108.654
G1 X137.213 Y99.218 E.41003
G1 X136.68 Y99.218
G1 X127.718 Y108.18 E.38943
G1 X127.718 Y107.647
G1 X136.147 Y99.218 E.36627
G1 X135.614 Y99.218
G1 X127.718 Y107.113 E.3431
G1 X127.718 Y106.58
G1 X135.081 Y99.218 E.31993
G1 X134.547 Y99.218
G1 X127.718 Y106.047 E.29676
G1 X127.718 Y105.514
G1 X134.014 Y99.218 E.2736
G1 X133.481 Y99.218
G1 X127.718 Y104.981 E.25043
G1 X127.718 Y104.447
G1 X132.948 Y99.218 E.22726
G1 X132.415 Y99.218
G1 X127.718 Y103.914 E.2041
G1 X127.718 Y103.381
G1 X131.881 Y99.217 E.18093
G1 X131.348 Y99.217
G1 X127.718 Y102.848 E.15776
G1 X127.718 Y102.315
G1 X130.815 Y99.217 E.1346
G1 X130.282 Y99.217
G1 X127.718 Y101.782 E.11143
G1 X127.718 Y101.248
G1 X129.749 Y99.217 E.08826
G1 X129.215 Y99.217
G1 X127.717 Y100.715 E.0651
G1 X127.666 Y100.234
G1 X128.705 Y99.194 E.04517
G1 X128.521 Y98.845
G1 X127.502 Y99.864 E.04429
G1 X127.327 Y99.506
G1 X128.334 Y98.499 E.04377
G1 X128.137 Y98.163
G1 X127.14 Y99.16 E.04333
G1 X126.941 Y98.825
G1 X127.93 Y97.836 E.04298
G1 X127.713 Y97.52
G1 X126.731 Y98.502 E.04265
G1 X126.511 Y98.189
G1 X127.486 Y97.214 E.04236
M73 P85 R4
G1 X127.25 Y96.916
G1 X126.28 Y97.887 E.04216
G1 X126.038 Y97.595
G1 X127.005 Y96.628 E.04203
G1 X126.752 Y96.348
G1 X125.786 Y97.314 E.04197
G1 X125.524 Y97.043
G1 X126.49 Y96.077 E.04196
G1 X126.219 Y95.815
G1 X125.252 Y96.781 E.042
G1 X124.969 Y96.531
G1 X125.937 Y95.563 E.04208
G1 X125.647 Y95.32
G1 X124.676 Y96.291 E.0422
G1 X124.373 Y96.061
G1 X125.348 Y95.086 E.04239
G1 X125.04 Y94.861
G1 X124.058 Y95.842 E.04265
G1 X123.733 Y95.634
G1 X124.723 Y94.645 E.04298
G1 X124.396 Y94.438
G1 X123.397 Y95.437 E.04339
G1 X123.05 Y95.251
G1 X124.06 Y94.241 E.04388
G1 X123.712 Y94.055
G1 X122.69 Y95.077 E.0444
G1 X122.318 Y94.916
G1 X123.354 Y93.88 E.04501
G1 X122.986 Y93.715
G1 X121.933 Y94.768 E.04572
M73 P85 R3
G1 X121.535 Y94.633
G1 X122.606 Y93.562 E.04654
G1 X122.214 Y93.42
G1 X121.122 Y94.513 E.04749
G1 X120.693 Y94.408
G1 X121.81 Y93.291 E.04857
G1 X121.393 Y93.175
G1 X120.246 Y94.322 E.04986
G1 X119.779 Y94.255
G1 X120.962 Y93.072 E.0514
G1 X120.516 Y92.985
G1 X119.293 Y94.209 E.05316
G1 X118.783 Y94.185
G1 X120.055 Y92.914 E.05524
G1 X119.573 Y92.862
G1 X118.245 Y94.19 E.05774
G1 X117.674 Y94.228
G1 X119.072 Y92.83 E.06075
G1 X118.548 Y92.82
G1 X117.063 Y94.305 E.06453
G1 X116.403 Y94.432
G1 X118 Y92.835 E.06936
G1 X117.421 Y92.88
G1 X115.673 Y94.629 E.07598
G1 X114.834 Y94.935
G1 X116.804 Y92.965 E.0856
G1 X116.145 Y93.091
G1 X113.795 Y95.44 E.1021
; WIPE_START
M204 S6000
G1 X115.209 Y94.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.349 Y101.102 Z2.8 F42000
G1 X108.336 Y111.031 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X108.783 Y110.585 E.01942
G1 X108.783 Y110.051
G1 X108.181 Y110.653 E.02616
G1 X108.037 Y110.264
G1 X108.783 Y109.518 E.03239
G1 X108.783 Y108.985
G1 X107.906 Y109.861 E.03809
G1 X107.788 Y109.446
G1 X108.783 Y108.452 E.04322
G1 X108.783 Y107.918
G1 X107.683 Y109.018 E.04777
G1 X107.595 Y108.573
G1 X108.783 Y107.385 E.0516
G1 X108.783 Y106.852
G1 X107.522 Y108.112 E.05476
G1 X107.467 Y107.634
G1 X108.783 Y106.319 E.05715
G1 X108.783 Y105.785
G1 X107.432 Y107.136 E.0587
G1 X107.418 Y106.617
G1 X108.783 Y105.252 E.05931
G1 X108.783 Y104.719
G1 X107.417 Y106.084 E.05933
G1 X107.417 Y105.551
G1 X108.783 Y104.186 E.05933
G1 X108.79 Y103.645
G1 X107.417 Y105.018 E.05963
G1 X107.417 Y104.484
G1 X108.828 Y103.073 E.06131
G1 X108.904 Y102.465
G1 X107.418 Y103.95 E.06454
G1 X107.436 Y103.4
G1 X109.033 Y101.802 E.06943
G1 X109.232 Y101.07
G1 X107.482 Y102.82 E.07604
G1 X107.563 Y102.206
G1 X109.534 Y100.235 E.08564
G1 X110.038 Y99.197
G1 X107.693 Y101.542 E.10192
G1 X107.88 Y100.822
G1 X115.421 Y93.281 E.32768
G1 X114.615 Y93.554
G1 X108.152 Y100.016 E.28082
G1 X108.565 Y99.071
G1 X113.673 Y93.962 E.22199
; WIPE_START
M204 S6000
G1 X112.259 Y95.376 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.422 Y94.68 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X109.28 Y97.822 E.13651
; WIPE_START
M204 S6000
G1 X110.695 Y96.408 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.564 Y101.287 Z2.8 F42000
G1 X128.722 Y111.395 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.133991
G1 F15000
M204 S6000
G1 X128.399 Y111.365 E.00241
M204 S10000
G1 X128.844 Y111.08 F42000
; LINE_WIDTH: 0.108501
G1 F15000
M204 S6000
G1 X128.775 Y111.181 E.00065
; LINE_WIDTH: 0.149158
G1 X128.706 Y111.281 E.00105
; LINE_WIDTH: 0.186789
G1 X128.597 Y111.436 E.00222
; WIPE_START
G1 X128.706 Y111.281 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.174 Y109.705 Z2.8 F42000
G1 X140.793 Y108.73 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.106925
G1 F15000
M204 S6000
G3 X140.703 Y108.853 I-1.604 J-1.076 E.00079
; LINE_WIDTH: 0.146572
G3 X140.386 Y109.177 I-2.332 J-1.971 E.00383
; LINE_WIDTH: 0.111723
G3 X140.233 Y109.29 I-1.037 J-1.241 E.00106
; WIPE_START
G1 X140.386 Y109.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.791 Y109.941 Z2.8 F42000
G1 X128.453 Y110.378 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.109728
G1 F15000
M204 S6000
G1 X128.417 Y110.194 E.00102
; WIPE_START
G1 X128.453 Y110.378 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.736 Y103.245 Z2.8 F42000
G1 X121.954 Y93.314 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0914755
G1 F15000
M204 S6000
G3 X121.842 Y93.299 I-.042 J-.101 E.00047
; WIPE_START
G1 X121.954 Y93.314 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.242 Y92.993 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0899221
G1 F15000
M204 S6000
G1 X120.075 Y92.912 E.00071
; WIPE_START
G1 X120.242 Y92.993 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.763 Y93.182 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0997774
G1 F15000
M204 S6000
G1 X115.481 Y93.341 E.0015
; WIPE_START
G1 X115.763 Y93.182 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.802 Y94.204 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0901137
G1 F15000
M204 S6000
G1 X118.589 Y94.112 E.00089
; WIPE_START
G1 X118.802 Y94.204 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.771 Y94.873 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.19638
G1 F15000
M204 S6000
G1 X114.671 Y94.94 E.00151
; LINE_WIDTH: 0.166429
G1 X114.569 Y95.009 E.00124
; LINE_WIDTH: 0.135347
G1 X114.485 Y95.069 E.00078
; LINE_WIDTH: 0.10389
G1 X114.401 Y95.128 E.00051
M204 S10000
G1 X113.734 Y95.379 F42000
; LINE_WIDTH: 0.200403
G1 F15000
M204 S6000
G1 X113.524 Y95.54 E.00339
; LINE_WIDTH: 0.155334
G1 X113.36 Y95.671 E.00193
; LINE_WIDTH: 0.111089
G1 X113.195 Y95.803 E.00117
; WIPE_START
G1 X113.36 Y95.671 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.04 Y94.301 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.100965
G1 F15000
M204 S6000
G1 X112.954 Y94.367 E.00051
; LINE_WIDTH: 0.126573
G1 X112.868 Y94.432 E.00074
; LINE_WIDTH: 0.16193
G1 X112.675 Y94.586 E.0024
; LINE_WIDTH: 0.207012
G1 X112.482 Y94.74 E.0033
; WIPE_START
G1 X112.675 Y94.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.122 Y93.754 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.102759
G1 F15000
M204 S6000
G1 X114.04 Y93.81 E.00048
; LINE_WIDTH: 0.141783
G1 X113.887 Y93.917 E.0015
; LINE_WIDTH: 0.190644
G1 X113.735 Y94.024 E.00224
; WIPE_START
G1 X113.887 Y93.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.002 Y95.802 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0930942
G1 F15000
M204 S6000
G2 X110.389 Y96.416 I17.129 J17.732 E.00355
; WIPE_START
G1 X111.002 Y95.802 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.341 Y97.882 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.204637
G1 F15000
M204 S6000
G1 X109.14 Y98.132 E.00422
; LINE_WIDTH: 0.157568
G1 X109.019 Y98.287 E.00184
; LINE_WIDTH: 0.111304
G1 X108.898 Y98.442 E.0011
; WIPE_START
G1 X109.019 Y98.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.408 Y98.59 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.101891
G1 F15000
M204 S6000
G1 X110.319 Y98.7 E.00068
; LINE_WIDTH: 0.129517
G1 X110.228 Y98.812 E.00101
; LINE_WIDTH: 0.163429
G1 X110.103 Y98.974 E.00201
; LINE_WIDTH: 0.203297
G1 X109.977 Y99.136 E.00268
; WIPE_START
G1 X110.103 Y98.974 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.353 Y100.704 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.193064
G1 F15000
M204 S6000
G2 X109.168 Y101.007 I15.803 J9.853 E.00434
; WIPE_START
G1 X109.353 Y100.704 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.755 Y101.604 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.100377
G1 F15000
M204 S6000
G1 X107.623 Y101.857 E.00133
; OBJECT_ID: 5
; WIPE_START
G1 X107.755 Y101.604 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X115.333 Y102.513 Z2.8 F42000
G1 X174.347 Y109.588 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X173.01 Y112.57 I-11.521 J-3.374 E.10071
G1 X173.01 Y109.46 E.09556
G3 X172.311 Y108.346 I.647 J-1.182 E.0422
G1 X172.31 Y100.558 E.23931
G2 X153.39 Y104.196 I-9.108 J3.65 E.83191
G1 X153.39 Y112.568 E.25725
G3 X151.61 Y106.396 I10.01 J-6.23 E.19991
G3 X151.619 Y103.737 I66.807 J-1.098 E.08171
G1 X151.633 Y103.51 E.00701
G3 X163.443 Y92.611 I11.588 J.709 E.5454
G3 X173.567 Y99.008 I-.256 J11.613 E.38659
G1 X184.651 Y99.01 E.34058
G3 X185.889 Y100.248 I-.057 J1.295 E.05907
G1 X185.889 Y108.349 E.24893
G3 X184.649 Y109.587 I-1.295 J-.057 E.05913
G1 X174.407 Y109.588 E.31471
; WIPE_START
M204 S6000
G1 X174.162 Y110.163 E-.23725
G1 X173.84 Y110.994 E-.33871
G1 X173.631 Y111.431 E-.18404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.353 Y111.272 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109988
G1 F15000
M204 S6000
G1 X173.226 Y111.765 E.00278
; WIPE_START
G1 X173.353 Y111.272 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X180.876 Y109.982 Z2.8 F42000
G1 X184.383 Y109.38 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X185.681 Y108.081 E.05644
G1 X185.681 Y107.548
G1 X183.849 Y109.38 E.07961
G1 X183.316 Y109.38
G1 X185.681 Y107.015 E.10279
G1 X185.681 Y106.481
G1 X182.783 Y109.38 E.12596
G1 X182.249 Y109.38
G1 X185.681 Y105.948 E.14914
G1 X185.681 Y105.415
G1 X181.716 Y109.38 E.17231
G1 X181.183 Y109.38
G1 X185.681 Y104.882 E.19549
G1 X185.681 Y104.348
G1 X180.649 Y109.38 E.21866
G1 X180.116 Y109.38
G1 X185.681 Y103.815 E.24184
G1 X185.681 Y103.282
G1 X179.583 Y109.38 E.26501
G1 X179.05 Y109.381
G1 X185.681 Y102.749 E.28819
G1 X185.681 Y102.215
G1 X178.516 Y109.381 E.31136
G1 X177.983 Y109.381
G1 X185.681 Y101.682 E.33454
G1 X185.681 Y101.149
G1 X177.45 Y109.381 E.35771
G1 X176.916 Y109.381
G1 X185.681 Y100.616 E.38089
G1 X185.662 Y100.102
G1 X176.383 Y109.381 E.40322
G1 X175.85 Y109.381
G1 X185.512 Y99.719 E.41988
G1 X185.257 Y99.44
G1 X175.316 Y109.381 E.43197
G1 X174.783 Y109.381
G1 X184.904 Y99.26 E.4398
G1 X184.414 Y99.217
G1 X174.25 Y109.381 E.44168
G1 X173.906 Y110.258
G1 X173.217 Y110.947 E.02993
G1 X173.217 Y110.413
G1 X174.17 Y109.461 E.04138
G1 X173.217 Y109.88
G1 X183.881 Y99.217 E.46337
G1 X183.347 Y99.217
G1 X173.214 Y109.351 E.44036
G1 X172.905 Y109.126
G1 X182.814 Y99.217 E.43061
G1 X182.281 Y99.217
G1 X172.662 Y108.836 E.41799
G1 X172.528 Y108.436
G1 X181.748 Y99.217 E.40063
G1 X181.215 Y99.217
G1 X172.518 Y107.913 E.37789
G1 X172.518 Y107.38
G1 X180.681 Y99.217 E.35472
G1 X180.148 Y99.216
G1 X172.518 Y106.846 E.33156
G1 X172.518 Y106.313
G1 X179.615 Y99.216 E.30839
G1 X179.082 Y99.216
G1 X172.518 Y105.78 E.28522
G1 X172.518 Y105.247
G1 X178.549 Y99.216 E.26206
G1 X178.015 Y99.216
G1 X172.518 Y104.714 E.23889
G1 X172.518 Y104.18
G1 X177.482 Y99.216 E.21572
G1 X176.949 Y99.216
G1 X172.518 Y103.647 E.19256
G1 X172.518 Y103.114
G1 X176.416 Y99.216 E.16939
G1 X175.883 Y99.216
G1 X172.518 Y102.581 E.14622
G1 X172.518 Y102.048
G1 X175.349 Y99.216 E.12305
G1 X174.816 Y99.216
G1 X172.518 Y101.515 E.09989
G1 X172.517 Y100.981
G1 X174.283 Y99.216 E.07672
G1 X173.75 Y99.216
G1 X172.497 Y100.468 E.05443
G1 X172.336 Y100.096
G1 X173.364 Y99.069 E.04463
G1 X173.176 Y98.723
G1 X172.165 Y99.734 E.04395
G1 X171.982 Y99.384
G1 X172.982 Y98.383 E.04347
G1 X172.779 Y98.054
G1 X171.788 Y99.045 E.04307
G1 X171.582 Y98.717
G1 X172.566 Y97.733 E.04277
G1 X172.344 Y97.422
G1 X171.366 Y98.4 E.04251
G1 X171.14 Y98.093
G1 X172.113 Y97.12 E.0423
G1 X171.872 Y96.828
G1 X170.903 Y97.797 E.0421
G1 X170.656 Y97.511
G1 X171.622 Y96.544 E.04198
G1 X171.363 Y96.27
G1 X170.399 Y97.234 E.04192
G1 X170.132 Y96.968
G1 X171.097 Y96.003 E.04194
G1 X170.821 Y95.745
G1 X169.855 Y96.712 E.04201
G1 X169.567 Y96.466
G1 X170.537 Y95.497 E.04211
G1 X170.242 Y95.258
G1 X169.27 Y96.23 E.04224
G1 X168.962 Y96.004
G1 X169.939 Y95.028 E.04244
M73 P86 R3
G1 X169.627 Y94.807
G1 X168.644 Y95.79 E.04272
G1 X168.314 Y95.586
G1 X169.306 Y94.594 E.04309
G1 X168.976 Y94.391
G1 X167.974 Y95.393 E.04351
G1 X167.623 Y95.211
G1 X168.636 Y94.198 E.04402
G1 X168.285 Y94.016
G1 X167.259 Y95.041 E.04456
G1 X166.884 Y94.883
G1 X167.923 Y93.844 E.04517
G1 X167.551 Y93.683
G1 X166.495 Y94.739 E.04589
G1 X166.093 Y94.608
G1 X167.169 Y93.532 E.04676
G1 X166.774 Y93.394
G1 X165.675 Y94.493 E.04774
G1 X165.241 Y94.393
G1 X166.367 Y93.268 E.04889
G1 X165.946 Y93.154
G1 X164.791 Y94.31 E.05019
G1 X164.322 Y94.246
G1 X165.512 Y93.055 E.05173
G1 X165.063 Y92.971
G1 X163.832 Y94.202 E.05349
G1 X163.319 Y94.183
G1 X164.597 Y92.904 E.05555
G1 X164.113 Y92.855
G1 X162.776 Y94.192 E.0581
G1 X162.203 Y94.231
G1 X163.609 Y92.825 E.06109
G1 X163.083 Y92.818
G1 X161.588 Y94.314 E.06499
G1 X160.924 Y94.444
G1 X162.533 Y92.836 E.06991
G1 X161.948 Y92.887
G1 X160.19 Y94.645 E.07639
G1 X159.349 Y94.953
G1 X161.329 Y92.973 E.08605
G1 X160.665 Y93.103
G1 X158.312 Y95.456 E.10225
; WIPE_START
M204 S6000
G1 X159.726 Y94.042 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.23 Y97.005 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X159.941 Y93.294 E.16127
; WIPE_START
M204 S6000
G1 X158.527 Y94.708 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.11 Y101.948 Z2.8 F42000
G1 X153.183 Y110.718 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X152.824 Y111.076 E.01556
G1 X152.664 Y110.703
G1 X153.183 Y110.184 E.02253
G1 X153.183 Y109.651
G1 X152.515 Y110.319 E.02901
G1 X152.378 Y109.923
G1 X153.183 Y109.118 E.03497
G1 X153.183 Y108.585
G1 X152.253 Y109.514 E.04038
G1 X152.142 Y109.092
G1 X153.183 Y108.051 E.04524
G1 X153.183 Y107.518
G1 X152.046 Y108.655 E.04941
G1 X151.963 Y108.204
G1 X153.183 Y106.985 E.05298
G1 X153.183 Y106.452
G1 X151.897 Y107.737 E.05585
G1 X151.85 Y107.251
G1 X153.183 Y105.918 E.05793
G1 X153.183 Y105.385
G1 X151.824 Y106.744 E.05904
G1 X151.817 Y106.217
G1 X153.183 Y104.852 E.05933
G1 X153.183 Y104.319
G1 X151.817 Y105.684 E.05933
G1 X151.817 Y105.15
G1 X153.192 Y103.776 E.05973
G1 X153.234 Y103.2
G1 X151.817 Y104.617 E.06157
G1 X151.82 Y104.082
G1 X153.313 Y102.588 E.0649
G1 X153.446 Y101.922
G1 X151.839 Y103.529 E.06981
G1 X151.888 Y102.947
G1 X153.648 Y101.187 E.07646
G1 X153.952 Y100.35
G1 X151.973 Y102.328 E.08598
G1 X152.106 Y101.663
G1 X154.456 Y99.312 E.10215
; WIPE_START
M204 S6000
G1 X153.042 Y100.726 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.049 Y97.186 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X152.296 Y100.939 E.16309
G1 X152.57 Y100.132
G1 X159.132 Y93.57 E.28515
G1 X158.191 Y93.977
G1 X152.983 Y99.185 E.22629
; WIPE_START
M204 S6000
G1 X154.398 Y97.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.694 Y97.942 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X156.946 Y94.689 E.14133
; WIPE_START
M204 S6000
G1 X155.532 Y96.104 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.599 Y98.986 Z2.8 F42000
G1 X185.695 Y108.407 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.273749
G1 F15000
M204 S6000
G1 X185.465 Y108.745 E.00769
; LINE_WIDTH: 0.32919
G1 F12575.556
G3 X185.073 Y109.143 I-1.72 J-1.3 E.01306
; LINE_WIDTH: 0.288028
G1 F14687.446
G1 X184.726 Y109.39 E.00851
; WIPE_START
G1 X185.073 Y109.143 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.515 Y110.204 Z2.8 F42000
G1 X173.726 Y110.735 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.175805
G1 F15000
M204 S6000
G1 X173.628 Y110.877 E.00187
; LINE_WIDTH: 0.213987
G1 X173.53 Y111.019 E.00241
; LINE_WIDTH: 0.252375
G1 X173.43 Y111.163 E.003
G1 X173.293 Y111.155 E.00234
; LINE_WIDTH: 0.226541
G1 X173.199 Y110.946 E.00343
; WIPE_START
G1 X173.293 Y111.155 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X168.312 Y105.371 Z2.8 F42000
G1 X159.286 Y94.891 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.197905
G1 F15000
M204 S6000
G1 X159.194 Y94.953 E.0014
; LINE_WIDTH: 0.171526
G1 X159.101 Y95.016 E.00119
; LINE_WIDTH: 0.140516
G1 X159.009 Y95.08 E.00089
; LINE_WIDTH: 0.105707
G1 X158.917 Y95.145 E.00057
M204 S10000
G1 X158.251 Y95.395 F42000
; LINE_WIDTH: 0.198932
G1 F15000
M204 S6000
G1 X158.034 Y95.561 E.00347
; LINE_WIDTH: 0.153016
G1 X157.876 Y95.687 E.00182
; LINE_WIDTH: 0.109789
G1 X157.717 Y95.813 E.0011
; WIPE_START
G1 X157.876 Y95.687 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.558 Y94.316 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.111902
G1 F15000
M204 S6000
G1 X157.399 Y94.437 E.00112
; LINE_WIDTH: 0.159028
G1 X157.203 Y94.593 E.00238
; LINE_WIDTH: 0.205792
G1 X157.006 Y94.749 E.00333
; WIPE_START
G1 X157.203 Y94.593 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X155.659 Y95.678 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.101143
G1 F15000
M204 S6000
G2 X154.682 Y96.655 I24.68 J25.665 E.00655
; WIPE_START
G1 X155.659 Y95.678 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.754 Y98.002 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.21087
G1 F15000
M204 S6000
G1 X153.587 Y98.209 E.00364
; LINE_WIDTH: 0.175426
G1 X153.496 Y98.326 E.0016
; LINE_WIDTH: 0.14052
G1 X153.404 Y98.443 E.00118
; LINE_WIDTH: 0.105615
G1 X153.313 Y98.561 E.00076
; WIPE_START
G1 X153.404 Y98.443 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.82 Y98.71 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.111457
G1 F15000
M204 S6000
G1 X154.666 Y98.901 E.00137
; LINE_WIDTH: 0.156737
G1 X154.53 Y99.076 E.00205
; LINE_WIDTH: 0.200569
G1 X154.394 Y99.25 E.00284
M204 S10000
G1 X154.144 Y99.918 F42000
; LINE_WIDTH: 0.0927888
G1 F15000
M204 S6000
G1 X154.114 Y99.96 E.00021
; LINE_WIDTH: 0.116634
G1 X154.039 Y100.069 E.0008
; LINE_WIDTH: 0.154697
G1 X153.964 Y100.178 E.00121
; LINE_WIDTH: 0.19276
G1 X153.889 Y100.287 E.00162
; WIPE_START
G1 X153.964 Y100.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.045 Y99.247 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.201256
G1 F15000
M204 S6000
G1 X152.938 Y99.396 E.00237
; LINE_WIDTH: 0.161306
G1 X152.856 Y99.515 E.0014
; LINE_WIDTH: 0.112549
G1 X152.774 Y99.634 E.00082
; WIPE_START
G1 X152.856 Y99.515 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.36 Y101.003 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.197217
G1 F15000
M204 S6000
G1 X152.194 Y101.277 E.00403
; WIPE_START
G1 X152.36 Y101.003 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.268 Y102.92 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.133863
G1 F15000
M204 S6000
G1 X153.166 Y103.132 E.00174
; WIPE_START
G1 X153.268 Y102.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.207 Y110.553 Z2.8 F42000
G1 X153.201 Y111.212 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.124129
G1 F15000
M204 S6000
G1 X152.929 Y111.246 E.00182
G1 X152.844 Y111.121 E.001
; OBJECT_ID: 6
; WIPE_START
G1 X152.929 Y111.246 E-.26937
G1 X153.201 Y111.212 E-.49063
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X160.832 Y111.026 Z2.8 F42000
G1 X219.67 Y109.589 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X218.41 Y112.351 I-11.658 J-3.65 E.09355
G1 X218.41 Y109.46 E.08884
G3 X217.711 Y108.347 I.647 J-1.182 E.0422
G1 X217.71 Y100.801 E.23185
G2 X198.19 Y104.497 I-9.409 J3.7 E.85946
G1 X198.19 Y112.355 E.24148
G3 X196.41 Y106.097 I10.163 J-6.273 E.2025
G3 X196.47 Y103.327 I27.649 J-.784 E.08516
G3 X208.676 Y92.616 I11.84 J1.183 E.54916
G3 X218.85 Y99.009 I-.412 J11.948 E.38682
G1 X230.051 Y99.01 E.34416
G3 X231.289 Y100.25 I-.057 J1.295 E.05914
G1 X231.289 Y108.347 E.24879
G3 X230.049 Y109.588 I-1.295 J-.055 E.0592
G1 X219.73 Y109.589 E.31705
; WIPE_START
M204 S6000
G1 X219.475 Y110.159 E-.23756
G1 X219.137 Y110.991 E-.34114
G1 X218.924 Y111.418 E-.1813
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X226.429 Y110.027 Z2.8 F42000
G1 X229.916 Y109.38 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X231.081 Y108.214 E.05066
G1 X231.081 Y107.681
G1 X229.382 Y109.38 E.07383
G1 X228.849 Y109.38
G1 X231.081 Y107.148 E.09701
G1 X231.081 Y106.615
G1 X228.316 Y109.38 E.12018
G1 X227.782 Y109.38
G1 X231.081 Y106.081 E.14336
G1 X231.081 Y105.548
G1 X227.249 Y109.38 E.16653
G1 X226.716 Y109.381
G1 X231.081 Y105.015 E.18971
G1 X231.081 Y104.482
G1 X226.183 Y109.381 E.21288
G1 X225.649 Y109.381
G1 X231.081 Y103.948 E.23606
G1 X231.081 Y103.415
G1 X225.116 Y109.381 E.25923
G1 X224.583 Y109.381
G1 X231.081 Y102.882 E.28241
G1 X231.081 Y102.349
G1 X224.049 Y109.381 E.30558
G1 X223.516 Y109.381
G1 X231.081 Y101.815 E.32876
G1 X231.081 Y101.282
G1 X222.983 Y109.381 E.35193
G1 X222.449 Y109.381
G1 X231.081 Y100.749 E.37511
G1 X231.077 Y100.22
G1 X221.916 Y109.381 E.39811
G1 X221.383 Y109.381
G1 X230.961 Y99.803 E.41623
G1 X230.73 Y99.501
G1 X220.849 Y109.381 E.42936
G1 X220.316 Y109.381
G1 X230.402 Y99.296 E.43827
G1 X229.947 Y99.217
G1 X219.783 Y109.381 E.44168
G1 X219.387 Y109.778
G1 X218.617 Y110.547 E.03342
G1 X218.617 Y110.013
G1 X229.414 Y99.217 E.46915
G1 X228.88 Y99.217
G1 X218.617 Y109.48 E.44598
G1 X218.381 Y109.184
G1 X228.347 Y99.217 E.4331
G1 X227.814 Y99.217
G1 X218.114 Y108.917 E.4215
G1 X217.947 Y108.55
G1 X227.281 Y99.217 E.40558
G1 X226.748 Y99.217
G1 X217.918 Y108.046 E.38367
G1 X217.918 Y107.513
G1 X226.214 Y99.217 E.3605
G1 X225.681 Y99.217
G1 X217.918 Y106.98 E.33733
G1 X217.918 Y106.446
G1 X225.148 Y99.217 E.31417
G1 X224.615 Y99.217
G1 X217.918 Y105.913 E.291
G1 X217.918 Y105.38
G1 X224.082 Y99.217 E.26783
G1 X223.548 Y99.217
G1 X217.918 Y104.847 E.24467
G1 X217.918 Y104.314
G1 X223.015 Y99.217 E.2215
G1 X222.482 Y99.216
G1 X217.918 Y103.781 E.19833
G1 X217.918 Y103.247
G1 X221.949 Y99.216 E.17517
G1 X221.416 Y99.216
G1 X217.918 Y102.714 E.152
G1 X217.918 Y102.181
G1 X220.882 Y99.216 E.12883
G1 X220.349 Y99.216
G1 X217.918 Y101.648 E.10567
G1 X217.917 Y101.115
G1 X219.816 Y99.216 E.0825
G1 X219.283 Y99.216
G1 X217.865 Y100.633 E.06159
G1 X217.705 Y100.261
G1 X218.75 Y99.216 E.0454
G1 X218.545 Y98.888
G1 X217.533 Y99.899 E.04396
G1 X217.35 Y99.549
G1 X218.352 Y98.547 E.04353
G1 X218.149 Y98.217
G1 X217.156 Y99.21 E.04316
G1 X216.951 Y98.881
G1 X217.936 Y97.896 E.04279
G1 X217.714 Y97.585
G1 X216.736 Y98.563 E.0425
G1 X216.511 Y98.255
G1 X217.484 Y97.282 E.04228
G1 X217.245 Y96.987
G1 X216.276 Y97.956 E.04211
G1 X216.031 Y97.669
G1 X216.999 Y96.701 E.04204
G1 X216.742 Y96.424
G1 X215.776 Y97.39 E.04197
G1 X215.512 Y97.121
G1 X216.476 Y96.157 E.0419
G1 X216.202 Y95.898
G1 X215.237 Y96.862 E.04193
G1 X214.953 Y96.614
G1 X215.92 Y95.646 E.04204
G1 X215.63 Y95.403
G1 X214.658 Y96.375 E.04222
G1 X214.354 Y96.146
G1 X215.331 Y95.169 E.04246
G1 X215.022 Y94.945
G1 X214.04 Y95.927 E.04267
G1 X213.715 Y95.719
G1 X214.703 Y94.73 E.04296
G1 X214.377 Y94.524
G1 X213.38 Y95.521 E.04333
G1 X213.033 Y95.334
G1 X214.041 Y94.326 E.04377
G1 X213.695 Y94.138
G1 X212.676 Y95.158 E.0443
G1 X212.307 Y94.993
G1 X213.341 Y93.96 E.04491
G1 X212.974 Y93.793
G1 X211.926 Y94.842 E.04557
G1 X211.532 Y94.702
G1 X212.597 Y93.637 E.04628
G1 X212.209 Y93.492
G1 X211.123 Y94.577 E.04717
G1 X210.701 Y94.467
G1 X211.809 Y93.358 E.04817
G1 X211.397 Y93.237
G1 X210.263 Y94.371 E.04931
G1 X209.808 Y94.293
G1 X210.973 Y93.128 E.05064
G1 X210.534 Y93.034
G1 X209.334 Y94.233 E.05212
G1 X208.838 Y94.197
G1 X210.08 Y92.955 E.05396
G1 X209.609 Y92.892
G1 X208.318 Y94.183 E.05611
G1 X207.772 Y94.196
G1 X209.121 Y92.847 E.05861
G1 X208.613 Y92.822
G1 X207.193 Y94.242 E.0617
G1 X206.573 Y94.328
G1 X208.082 Y92.82 E.06556
G1 X207.526 Y92.842
G1 X205.902 Y94.466 E.07056
G1 X205.164 Y94.671
M73 P87 R3
G1 X206.937 Y92.898 E.07705
G1 X206.313 Y92.989
G1 X204.319 Y94.982 E.08664
G1 X203.284 Y95.485
G1 X205.646 Y93.123 E.10265
G1 X204.916 Y93.319
G1 X201.449 Y96.786 E.15068
; WIPE_START
M204 S6000
G1 X202.863 Y95.372 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X200.392 Y102.594 Z2.8 F42000
G1 X197.595 Y110.772 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X197.983 Y110.384 E.01686
G1 X197.983 Y109.851
G1 X197.439 Y110.395 E.02364
G1 X197.293 Y110.007
G1 X197.983 Y109.318 E.02997
G1 X197.983 Y108.785
G1 X197.159 Y109.608 E.03579
G1 X197.037 Y109.197
G1 X197.983 Y108.251 E.04108
G1 X197.983 Y107.718
G1 X196.929 Y108.772 E.0458
G1 X196.834 Y108.333
G1 X197.983 Y107.185 E.04991
G1 X197.983 Y106.652
G1 X196.755 Y107.879 E.05335
G1 X196.692 Y107.409
G1 X197.983 Y106.118 E.05607
G1 X197.983 Y105.585
G1 X196.648 Y106.92 E.058
G1 X196.624 Y106.411
G1 X197.983 Y105.052 E.05906
G1 X197.983 Y104.519
G1 X196.617 Y105.884 E.05933
G1 X196.617 Y105.351
G1 X197.998 Y103.97 E.05998
G1 X198.044 Y103.391
G1 X196.617 Y104.817 E.06199
G1 X196.622 Y104.28
G1 X198.13 Y102.772 E.06552
G1 X198.265 Y102.103
G1 X196.645 Y103.723 E.0704
G1 X196.697 Y103.137
G1 X198.472 Y101.363 E.07712
G1 X198.78 Y100.521
G1 X196.79 Y102.512 E.08651
G1 X196.925 Y101.844
G1 X199.285 Y99.483 E.10258
; WIPE_START
M204 S6000
G1 X197.871 Y100.897 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X200.589 Y97.646 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X197.121 Y101.114 E.15073
G1 X197.399 Y100.303
G1 X204.104 Y93.598 E.29135
G1 X203.159 Y94.01
G1 X197.813 Y99.355 E.2323
; WIPE_START
M204 S6000
G1 X199.227 Y97.941 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X198.515 Y98.12 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X201.926 Y94.709 E.14823
; WIPE_START
M204 S6000
G1 X200.512 Y96.123 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X199.232 Y103.648 Z2.8 F42000
G1 X198.001 Y110.88 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.197334
G1 F15000
M204 S6000
G1 X197.746 Y110.978 E.00344
; LINE_WIDTH: 0.1763
G1 X197.721 Y110.957 E.00035
; LINE_WIDTH: 0.147183
G1 X197.696 Y110.937 E.00027
; LINE_WIDTH: 0.110398
G1 X197.614 Y110.818 E.00079
; WIPE_START
G1 X197.696 Y110.937 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X198.134 Y103.318 Z2.8 F42000
G1 X198.216 Y101.886 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.104347
G1 F15000
M204 S6000
G1 X198.28 Y102.117 E.0012
; WIPE_START
G1 X198.216 Y101.886 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X197.875 Y99.417 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.195676
G1 F15000
M204 S6000
G1 X197.75 Y99.592 E.00268
; LINE_WIDTH: 0.153139
G1 X197.677 Y99.699 E.00116
; LINE_WIDTH: 0.109825
G1 X197.604 Y99.805 E.0007
; WIPE_START
G1 X197.677 Y99.699 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X198.973 Y100.089 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0916238
G1 F15000
M204 S6000
G1 X198.948 Y100.125 E.00018
; LINE_WIDTH: 0.114747
G1 X198.871 Y100.236 E.00079
; LINE_WIDTH: 0.153678
G1 X198.795 Y100.347 E.00122
; LINE_WIDTH: 0.192609
G1 X198.718 Y100.459 E.00165
; WIPE_START
G1 X198.795 Y100.347 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X199.642 Y98.889 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.105468
G1 F15000
M204 S6000
G1 X199.523 Y99.036 E.00096
; LINE_WIDTH: 0.147504
G1 X199.401 Y99.193 E.0017
; LINE_WIDTH: 0.197541
G1 X199.278 Y99.35 E.00251
G1 X199.298 Y99.495 E.00185
; WIPE_START
G1 X199.278 Y99.35 E-.32281
G1 X199.401 Y99.193 E-.43719
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X198.576 Y98.181 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.211104
G1 F15000
M204 S6000
G1 X198.413 Y98.382 E.00355
; LINE_WIDTH: 0.176063
G1 X198.322 Y98.499 E.0016
; LINE_WIDTH: 0.140905
G1 X198.232 Y98.616 E.00118
; LINE_WIDTH: 0.105747
G1 X198.141 Y98.733 E.00076
; WIPE_START
G1 X198.232 Y98.616 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X200.744 Y95.594 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.112144
G1 F15000
M204 S6000
G2 X199.397 Y96.941 I16.291 J17.632 E.01075
; WIPE_START
G1 X200.105 Y96.204 E-.40763
G1 X200.744 Y95.594 E-.35237
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X201.461 Y96.798 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.235297
G1 F15000
M204 S6000
G1 X201.315 Y96.795 E.00228
G1 X200.529 Y97.586 E.01748
; WIPE_START
G1 X201.315 Y96.795 E-.67244
G1 X201.461 Y96.798 E-.08756
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X203.223 Y95.424 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.197924
G1 F15000
M204 S6000
G1 X203.003 Y95.591 E.00349
; LINE_WIDTH: 0.172731
G1 X203.001 Y95.593 E.00003
; LINE_WIDTH: 0.151372
G1 X202.847 Y95.714 E.00173
; LINE_WIDTH: 0.109278
G1 X202.694 Y95.836 E.00106
; WIPE_START
G1 X202.847 Y95.714 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X202.53 Y94.344 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.106137
G1 F15000
M204 S6000
G1 X202.413 Y94.434 E.00076
; LINE_WIDTH: 0.142062
G1 X202.295 Y94.524 E.0012
; LINE_WIDTH: 0.176858
G1 X202.141 Y94.647 E.00215
; LINE_WIDTH: 0.210512
G1 X201.987 Y94.77 E.00269
; WIPE_START
G1 X202.141 Y94.647 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X205.099 Y94.606 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.117526
G1 F15000
M204 S6000
G1 X204.796 Y94.796 E.00217
; WIPE_START
G1 X205.099 Y94.606 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.788 Y94.212 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.132486
G1 F15000
M204 S6000
G1 X207.571 Y94.13 E.00169
; WIPE_START
G1 X207.788 Y94.212 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.785 Y94.293 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.105192
G1 F15000
M204 S6000
G1 X209.623 Y94.211 E.00092
; WIPE_START
G1 X209.785 Y94.293 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X217.197 Y96.115 Z2.8 F42000
G1 X230.564 Y99.4 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.102226
G1 F15000
M204 S6000
G2 X230.447 Y99.315 I-.908 J1.124 E.0007
; WIPE_START
G1 X230.564 Y99.4 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X230.988 Y107.021 Z2.8 F42000
G1 X231.072 Y108.531 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.18573
G1 F15000
M204 S6000
G1 X230.911 Y108.763 E.00328
; LINE_WIDTH: 0.234136
G3 X230.496 Y109.186 I-1.81 J-1.361 E.00925
; LINE_WIDTH: 0.191236
G1 X230.236 Y109.371 E.00386
; WIPE_START
G1 X230.496 Y109.186 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X231.06 Y108.525 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0898421
G1 F15000
M204 S6000
G1 X230.752 Y109.103 E.00251
; WIPE_START
G1 X231.06 Y108.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X223.506 Y109.615 Z2.8 F42000
G1 X219.231 Y110.232 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.224871
G1 F15000
M204 S6000
G1 X219.107 Y110.417 E.0033
; LINE_WIDTH: 0.271813
G1 X218.982 Y110.601 E.00416
; LINE_WIDTH: 0.318754
G1 F13051.35
G1 X218.857 Y110.786 E.00501
; LINE_WIDTH: 0.36473
G1 F11186.739
G1 X218.808 Y110.842 E.00196
; LINE_WIDTH: 0.398599
G1 F10121.492
G3 X218.777 Y110.856 I-.023 J-.011 E.00108
; LINE_WIDTH: 0.377048
G1 F10774.327
G1 X218.732 Y110.8 E.00196
; LINE_WIDTH: 0.332543
G1 F12429.963
G1 X218.688 Y110.743 E.0017
; LINE_WIDTH: 0.288038
G1 F14686.811
G1 X218.643 Y110.686 E.00144
; LINE_WIDTH: 0.243533
G1 F15000
G1 X218.599 Y110.63 E.00118
; OBJECT_ID: 9
; WIPE_START
G1 X218.643 Y110.686 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X212.759 Y115.547 Z2.8 F42000
G1 X137.77 Y177.489 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X136.51 Y180.251 I-11.658 J-3.65 E.09355
G1 X136.51 Y177.36 E.08884
G3 X135.811 Y176.247 I.647 J-1.182 E.0422
G1 X135.81 Y168.701 E.23185
G2 X116.29 Y172.397 I-9.409 J3.7 E.85946
G1 X116.29 Y180.255 E.24148
G3 X114.51 Y173.997 I10.163 J-6.273 E.2025
G3 X114.57 Y171.227 I27.652 J-.784 E.08516
G3 X126.776 Y160.516 I11.84 J1.183 E.54916
G3 X136.95 Y166.909 I-.412 J11.948 E.38682
G1 X148.151 Y166.91 E.34416
G3 X149.389 Y168.15 I-.057 J1.295 E.05913
G1 X149.389 Y176.249 E.24887
G3 X148.149 Y177.488 I-1.291 J-.053 E.05917
G1 X137.83 Y177.489 E.31705
; WIPE_START
M204 S6000
G1 X137.575 Y178.059 E-.2376
G1 X137.237 Y178.891 E-.34109
G1 X137.024 Y179.318 E-.18131
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.493 Y173.994 Z2.8 F42000
G1 X144.151 Y172.38 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.221325
G1 F15000
M204 S6000
G1 X143.943 Y172.027 E.00595
G1 X143.989 Y171.926 E.00162
; WIPE_START
G1 X143.943 Y172.027 E-.16262
G1 X144.151 Y172.38 E-.59738
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.016 Y177.28 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X149.181 Y176.114 E.05066
G1 X149.181 Y175.581
G1 X147.482 Y177.28 E.07383
G1 X146.949 Y177.28
G1 X149.181 Y175.048 E.09701
G1 X149.181 Y174.515
G1 X146.416 Y177.28 E.12018
G1 X145.882 Y177.28
G1 X149.181 Y173.981 E.14336
G1 X149.181 Y173.448
G1 X145.349 Y177.28 E.16653
G1 X144.816 Y177.281
G1 X149.181 Y172.915 E.18971
G1 X149.181 Y172.382
G1 X144.283 Y177.281 E.21288
G1 X143.749 Y177.281
G1 X149.181 Y171.848 E.23606
G1 X149.181 Y171.315
G1 X143.216 Y177.281 E.25923
G1 X142.683 Y177.281
G1 X149.181 Y170.782 E.28241
G1 X149.181 Y170.249
G1 X142.149 Y177.281 E.30558
G1 X141.616 Y177.281
G1 X149.181 Y169.715 E.32876
G1 X149.181 Y169.182
G1 X141.083 Y177.281 E.35193
G1 X140.549 Y177.281
G1 X149.181 Y168.649 E.37511
G1 X149.177 Y168.12
G1 X140.016 Y177.281 E.39811
G1 X139.483 Y177.281
G1 X149.06 Y167.704 E.41619
G1 X148.83 Y167.401
G1 X144.125 Y172.105 E.20444
G1 X143.786 Y171.911
G1 X148.502 Y167.196 E.2049
; WIPE_START
M204 S6000
G1 X147.087 Y168.61 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.954 Y172.277 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X138.949 Y177.281 E.21748
G1 X138.416 Y177.281
G1 X143.756 Y171.941 E.23206
; WIPE_START
M204 S6000
G1 X142.342 Y173.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.493 Y167.723 Z2.8 F42000
G1 X148.047 Y167.117 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X137.883 Y177.281 E.44168
G1 X137.487 Y177.678
G1 X136.717 Y178.447 E.03342
G1 X136.717 Y177.913
G1 X147.514 Y167.117 E.46915
G1 X146.98 Y167.117
G1 X136.717 Y177.38 E.44598
G1 X136.481 Y177.084
G1 X146.447 Y167.117 E.4331
G1 X145.914 Y167.117
G1 X136.214 Y176.817 E.4215
G1 X136.047 Y176.45
G1 X145.381 Y167.117 E.40558
G1 X144.848 Y167.117
G1 X136.018 Y175.946 E.38367
G1 X136.018 Y175.413
G1 X144.314 Y167.117 E.3605
G1 X143.781 Y167.117
G1 X136.018 Y174.88 E.33733
G1 X136.018 Y174.346
G1 X143.248 Y167.117 E.31417
G1 X142.715 Y167.117
G1 X136.018 Y173.813 E.291
G1 X136.018 Y173.28
G1 X142.182 Y167.117 E.26783
G1 X141.648 Y167.117
G1 X136.018 Y172.747 E.24467
G1 X136.018 Y172.214
G1 X141.115 Y167.117 E.2215
G1 X140.582 Y167.116
G1 X136.018 Y171.681 E.19833
G1 X136.018 Y171.147
G1 X140.049 Y167.116 E.17517
G1 X139.516 Y167.116
G1 X136.018 Y170.614 E.152
G1 X136.018 Y170.081
G1 X138.982 Y167.116 E.12883
G1 X138.449 Y167.116
G1 X136.018 Y169.548 E.10567
G1 X136.017 Y169.015
G1 X137.916 Y167.116 E.0825
G1 X137.383 Y167.116
G1 X135.966 Y168.533 E.06159
G1 X135.805 Y168.161
G1 X136.85 Y167.116 E.0454
G1 X136.645 Y166.788
G1 X135.633 Y167.799 E.04396
G1 X135.45 Y167.449
G1 X136.452 Y166.447 E.04353
G1 X136.249 Y166.117
G1 X135.256 Y167.11 E.04315
G1 X135.051 Y166.781
G1 X136.036 Y165.796 E.04279
G1 X135.814 Y165.485
G1 X134.836 Y166.463 E.0425
G1 X134.611 Y166.155
G1 X135.584 Y165.182 E.04227
G1 X135.345 Y164.887
G1 X134.376 Y165.856 E.04211
G1 X134.131 Y165.569
G1 X135.099 Y164.601 E.04204
G1 X134.842 Y164.324
G1 X133.876 Y165.29 E.04197
G1 X133.612 Y165.021
G1 X134.576 Y164.057 E.0419
G1 X134.302 Y163.798
G1 X133.337 Y164.762 E.04193
G1 X133.053 Y164.514
G1 X134.02 Y163.546 E.04204
G1 X133.73 Y163.303
G1 X132.758 Y164.275 E.04222
G1 X132.454 Y164.046
G1 X133.431 Y163.069 E.04246
G1 X133.122 Y162.845
G1 X132.14 Y163.827 E.04267
G1 X131.815 Y163.619
G1 X132.803 Y162.63 E.04296
G1 X132.477 Y162.424
G1 X131.48 Y163.421 E.04333
G1 X131.133 Y163.234
G1 X132.141 Y162.226 E.04377
G1 X131.795 Y162.038
G1 X130.776 Y163.058 E.0443
G1 X130.407 Y162.893
G1 X131.441 Y161.86 E.04491
G1 X131.074 Y161.693
G1 X130.026 Y162.742 E.04557
G1 X129.632 Y162.602
G1 X130.697 Y161.537 E.04628
G1 X130.309 Y161.392
G1 X129.223 Y162.477 E.04717
G1 X128.801 Y162.367
G1 X129.909 Y161.258 E.04817
G1 X129.497 Y161.137
G1 X128.363 Y162.271 E.04931
G1 X127.908 Y162.193
G1 X129.073 Y161.028 E.05064
G1 X128.634 Y160.934
G1 X127.434 Y162.133 E.05212
G1 X126.938 Y162.097
G1 X128.18 Y160.855 E.05396
G1 X127.709 Y160.792
G1 X126.418 Y162.083 E.05611
G1 X125.872 Y162.096
G1 X127.221 Y160.747 E.05861
G1 X126.713 Y160.722
G1 X125.293 Y162.142 E.0617
G1 X124.673 Y162.228
G1 X126.182 Y160.72 E.06556
G1 X125.626 Y160.742
G1 X124.002 Y162.366 E.07056
G1 X123.264 Y162.571
G1 X125.037 Y160.798 E.07705
G1 X124.413 Y160.889
G1 X122.419 Y162.882 E.08664
G1 X121.384 Y163.385
G1 X123.746 Y161.023 E.10265
G1 X123.016 Y161.219
G1 X119.548 Y164.687 E.15069
; WIPE_START
M204 S6000
G1 X120.963 Y163.272 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.603 Y170.531 Z2.8 F42000
G1 X116.083 Y178.284 Z2.8
G1 Z2.4
G1 E.8 F1800
M73 P88 R3
G1 F9547.055
M204 S2000
G1 X115.695 Y178.672 E.01686
G1 X115.539 Y178.295
G1 X116.083 Y177.751 E.02364
G1 X116.083 Y177.218
G1 X115.393 Y177.907 E.02997
G1 X115.259 Y177.508
G1 X116.083 Y176.685 E.03579
G1 X116.083 Y176.151
G1 X115.137 Y177.097 E.04108
G1 X115.029 Y176.672
G1 X116.083 Y175.618 E.04581
G1 X116.083 Y175.085
G1 X114.934 Y176.233 E.0499
G1 X114.855 Y175.779
G1 X116.083 Y174.552 E.05335
G1 X116.083 Y174.018
G1 X114.792 Y175.309 E.05607
G1 X114.748 Y174.82
G1 X116.083 Y173.485 E.058
G1 X116.083 Y172.952
G1 X114.724 Y174.311 E.05905
G1 X114.717 Y173.784
G1 X116.083 Y172.419 E.05933
G1 X116.098 Y171.87
G1 X114.717 Y173.251 E.05998
G1 X114.717 Y172.717
G1 X116.144 Y171.291 E.06199
G1 X116.23 Y170.672
G1 X114.722 Y172.18 E.06552
G1 X114.745 Y171.623
G1 X116.365 Y170.003 E.0704
G1 X116.572 Y169.263
G1 X114.797 Y171.037 E.07712
G1 X114.89 Y170.412
G1 X116.881 Y168.421 E.08651
G1 X117.385 Y167.383
G1 X115.025 Y169.744 E.10258
G1 X115.221 Y169.014
G1 X118.69 Y165.545 E.15074
; WIPE_START
M204 S6000
G1 X117.275 Y166.96 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.499 Y168.203 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X122.204 Y161.498 E.29135
G1 X121.259 Y161.91
G1 X115.913 Y167.255 E.2323
; WIPE_START
M204 S6000
G1 X117.327 Y165.841 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.615 Y166.02 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X120.026 Y162.609 E.14823
; WIPE_START
M204 S6000
G1 X118.612 Y164.023 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.1 Y162.545 Z2.8 F42000
G1 X127.885 Y162.193 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10519
G1 F15000
M204 S6000
G1 X127.723 Y162.111 E.00092
; WIPE_START
G1 X127.885 Y162.193 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.888 Y162.112 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.132503
G1 F15000
M204 S6000
G1 X125.671 Y162.03 E.00169
; WIPE_START
G1 X125.888 Y162.112 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.199 Y162.506 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.117443
G1 F15000
M204 S6000
G1 X122.896 Y162.696 E.00217
; WIPE_START
G1 X123.199 Y162.506 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.63 Y162.244 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.106128
G1 F15000
M204 S6000
G1 X120.513 Y162.334 E.00076
; LINE_WIDTH: 0.142034
G1 X120.395 Y162.424 E.0012
; LINE_WIDTH: 0.176826
G1 X120.241 Y162.547 E.00215
; LINE_WIDTH: 0.2105
G1 X120.087 Y162.67 E.00269
; WIPE_START
G1 X120.241 Y162.547 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.323 Y163.324 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.197919
G1 F15000
M204 S6000
G1 X121.103 Y163.491 E.00349
; LINE_WIDTH: 0.172719
G1 X121.101 Y163.493 E.00003
; LINE_WIDTH: 0.151359
G1 X120.947 Y163.614 E.00173
; LINE_WIDTH: 0.109274
G1 X120.794 Y163.736 E.00106
; WIPE_START
G1 X120.947 Y163.614 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.561 Y164.699 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.235307
G1 F15000
M204 S6000
G1 X119.415 Y164.695 E.00228
G1 X118.63 Y165.485 E.01747
; WIPE_START
G1 X119.415 Y164.695 E-.67223
G1 X119.561 Y164.699 E-.08777
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.844 Y163.494 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.112145
G1 F15000
M204 S6000
G2 X117.497 Y164.841 I16.298 J17.639 E.01075
; WIPE_START
G1 X118.205 Y164.104 E-.40773
G1 X118.844 Y163.494 E-.35227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.742 Y166.789 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.105468
G1 F15000
M204 S6000
G1 X117.623 Y166.936 E.00096
; LINE_WIDTH: 0.147504
G1 X117.501 Y167.093 E.0017
; LINE_WIDTH: 0.197516
G1 X117.378 Y167.25 E.00251
G1 X117.398 Y167.395 E.00185
; WIPE_START
G1 X117.378 Y167.25 E-.3229
G1 X117.501 Y167.093 E-.4371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.676 Y166.081 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.211112
G1 F15000
M204 S6000
G1 X116.513 Y166.282 E.00354
; LINE_WIDTH: 0.176075
G1 X116.422 Y166.399 E.0016
; LINE_WIDTH: 0.140913
G1 X116.332 Y166.516 E.00118
; LINE_WIDTH: 0.105751
G1 X116.241 Y166.633 E.00076
M204 S10000
G1 X115.975 Y167.317 F42000
; LINE_WIDTH: 0.195654
G1 F15000
M204 S6000
G1 X115.85 Y167.492 E.00268
; LINE_WIDTH: 0.153118
G1 X115.777 Y167.599 E.00116
; LINE_WIDTH: 0.109818
G1 X115.704 Y167.705 E.0007
M204 S10000
G1 X115.562 Y168.265 F42000
; LINE_WIDTH: 0.206007
G1 F15000
M204 S6000
G1 X115.354 Y168.582 E.00503
; WIPE_START
G1 X115.562 Y168.265 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.279 Y175.893 Z2.8 F42000
G1 X115.227 Y177.273 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0989694
G1 F15000
M204 S6000
G1 X115.143 Y177.126 E.00078
; WIPE_START
G1 X115.227 Y177.273 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.101 Y178.78 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.197349
G1 F15000
M204 S6000
G1 X115.846 Y178.878 E.00344
; LINE_WIDTH: 0.176313
G1 X115.821 Y178.857 E.00035
; LINE_WIDTH: 0.147178
G1 X115.796 Y178.837 E.00027
; LINE_WIDTH: 0.110392
G1 X115.714 Y178.718 E.00079
; WIPE_START
G1 X115.796 Y178.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.425 Y178.588 Z2.8 F42000
G1 X137.331 Y178.132 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.224908
G1 F15000
M204 S6000
G1 X137.207 Y178.317 E.0033
; LINE_WIDTH: 0.271835
G1 X137.082 Y178.501 E.00416
; LINE_WIDTH: 0.318761
G1 F13050.998
G1 X136.957 Y178.686 E.00501
; LINE_WIDTH: 0.364654
G1 F11189.381
G1 X136.908 Y178.742 E.00195
; LINE_WIDTH: 0.39852
G1 F10123.742
G3 X136.877 Y178.756 I-.024 J-.011 E.00108
; LINE_WIDTH: 0.377015
G1 F10775.4
G1 X136.832 Y178.7 E.00196
; LINE_WIDTH: 0.332523
G1 F12430.809
G1 X136.788 Y178.643 E.0017
; LINE_WIDTH: 0.288032
G1 F14687.18
G1 X136.743 Y178.586 E.00144
; LINE_WIDTH: 0.243541
G1 F15000
G1 X136.699 Y178.53 E.00118
; WIPE_START
G1 X136.743 Y178.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.263 Y177.282 Z2.8 F42000
G1 X149.169 Y176.431 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.176826
G1 F15000
M204 S6000
G1 X149.008 Y176.667 E.00311
; LINE_WIDTH: 0.234433
G3 X148.597 Y177.085 I-1.804 J-1.361 E.00919
; LINE_WIDTH: 0.191284
G1 X148.336 Y177.271 E.00386
; WIPE_START
G1 X148.597 Y177.085 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.649 Y169.453 Z2.8 F42000
G1 X148.664 Y167.3 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.102099
G1 F15000
M204 S6000
G2 X148.547 Y167.215 I-.921 J1.141 E.0007
; OBJECT_ID: 8
; WIPE_START
G1 X148.664 Y167.3 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X141.154 Y168.661 Z2.8 F42000
G1 X92.447 Y177.488 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X91.11 Y180.47 I-11.521 J-3.375 E.10071
G1 X91.11 Y177.36 E.09557
G3 X90.411 Y176.246 I.648 J-1.183 E.0422
G1 X90.41 Y168.458 E.23931
G2 X71.49 Y172.096 I-9.108 J3.65 E.83191
G1 X71.49 Y180.468 E.25725
G3 X69.71 Y174.296 I10.01 J-6.23 E.19991
G3 X69.719 Y171.637 I66.806 J-1.098 E.08171
G1 X69.733 Y171.41 E.00701
G3 X81.543 Y160.511 I11.588 J.709 E.5454
G3 X91.667 Y166.908 I-.255 J11.612 E.38659
G1 X102.749 Y166.91 E.34052
G3 X103.989 Y168.15 I-.055 J1.295 E.05919
G1 X103.989 Y176.249 E.24887
G3 X102.749 Y177.487 I-1.306 J-.068 E.059
G1 X92.507 Y177.488 E.31471
; WIPE_START
M204 S6000
G1 X92.262 Y178.062 E-.23713
G1 X91.94 Y178.894 E-.33883
G1 X91.731 Y179.331 E-.18404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.453 Y179.172 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109979
G1 F15000
M204 S6000
G1 X91.326 Y179.665 E.00278
; WIPE_START
G1 X91.453 Y179.172 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.808 Y173.734 Z2.8 F42000
G1 X98.589 Y171.925 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.221163
G1 F15000
M204 S6000
G1 X98.543 Y172.027 E.00162
G1 X98.712 Y172.314 E.00483
; WIPE_START
G1 X98.543 Y172.027 E-.56902
G1 X98.589 Y171.925 E-.19098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.483 Y177.28 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X103.781 Y175.981 E.05644
G1 X103.781 Y175.448
G1 X101.949 Y177.28 E.07961
G1 X101.416 Y177.28
G1 X103.781 Y174.915 E.10279
G1 X103.781 Y174.381
G1 X100.883 Y177.28 E.12596
G1 X100.349 Y177.28
G1 X103.781 Y173.848 E.14914
G1 X103.781 Y173.315
G1 X99.816 Y177.28 E.17231
G1 X99.283 Y177.28
G1 X103.781 Y172.782 E.19549
G1 X103.781 Y172.248
G1 X98.749 Y177.28 E.21866
G1 X98.216 Y177.28
G1 X103.781 Y171.715 E.24184
G1 X103.781 Y171.182
G1 X97.683 Y177.28 E.26501
G1 X97.15 Y177.281
G1 X103.781 Y170.649 E.28819
G1 X103.781 Y170.115
G1 X96.616 Y177.281 E.31136
G1 X96.083 Y177.281
G1 X103.781 Y169.582 E.33454
G1 X103.781 Y169.049
G1 X95.55 Y177.281 E.35771
G1 X95.016 Y177.281
G1 X103.781 Y168.516 E.38089
G1 X103.762 Y168.001
G1 X94.483 Y177.281 E.40324
G1 X93.95 Y177.281
G1 X103.611 Y167.619 E.41985
G1 X103.357 Y167.34
G1 X98.676 Y172.021 E.2034
G1 X98.505 Y172.193
G1 X93.416 Y177.281 E.22111
G1 X92.883 Y177.281
G1 X103.004 Y167.16 E.43979
G1 X102.514 Y167.117
G1 X92.35 Y177.281 E.44168
G1 X92.006 Y178.158
G1 X91.317 Y178.847 E.02993
G1 X91.317 Y178.313
G1 X92.27 Y177.361 E.04138
G1 X91.317 Y177.78
G1 X101.981 Y167.117 E.46337
G1 X101.447 Y167.117
G1 X91.314 Y177.251 E.44036
G1 X91.005 Y177.026
G1 X100.914 Y167.117 E.43061
G1 X100.381 Y167.117
G1 X90.762 Y176.736 E.41798
G1 X90.628 Y176.336
G1 X99.848 Y167.117 E.40063
G1 X99.315 Y167.117
G1 X90.618 Y175.813 E.37789
G1 X90.618 Y175.28
G1 X98.781 Y167.117 E.35472
G1 X98.248 Y167.116
G1 X90.618 Y174.746 E.33156
G1 X90.618 Y174.213
G1 X97.715 Y167.116 E.30839
G1 X97.182 Y167.116
G1 X90.618 Y173.68 E.28522
G1 X90.618 Y173.147
G1 X96.649 Y167.116 E.26206
G1 X96.115 Y167.116
G1 X90.618 Y172.614 E.23889
G1 X90.618 Y172.08
G1 X95.582 Y167.116 E.21572
G1 X95.049 Y167.116
G1 X90.618 Y171.547 E.19256
G1 X90.618 Y171.014
G1 X94.516 Y167.116 E.16939
G1 X93.983 Y167.116
G1 X90.618 Y170.481 E.14622
G1 X90.618 Y169.948
G1 X93.449 Y167.116 E.12305
G1 X92.916 Y167.116
G1 X90.618 Y169.415 E.09989
G1 X90.617 Y168.881
G1 X92.383 Y167.116 E.07672
G1 X91.85 Y167.116
G1 X90.597 Y168.368 E.05443
G1 X90.436 Y167.996
G1 X91.464 Y166.969 E.04463
G1 X91.276 Y166.623
G1 X90.265 Y167.634 E.04395
G1 X90.082 Y167.284
G1 X91.082 Y166.283 E.04347
G1 X90.879 Y165.954
G1 X89.888 Y166.945 E.04307
G1 X89.682 Y166.617
G1 X90.666 Y165.633 E.04277
G1 X90.444 Y165.322
G1 X89.466 Y166.3 E.04251
G1 X89.24 Y165.993
G1 X90.213 Y165.02 E.0423
G1 X89.972 Y164.728
G1 X89.003 Y165.697 E.0421
G1 X88.756 Y165.411
G1 X89.722 Y164.444 E.04198
G1 X89.463 Y164.17
G1 X88.499 Y165.134 E.04192
G1 X88.232 Y164.868
G1 X89.197 Y163.903 E.04194
G1 X88.921 Y163.645
G1 X87.955 Y164.612 E.04201
G1 X87.667 Y164.366
G1 X88.637 Y163.397 E.04211
G1 X88.342 Y163.158
G1 X87.37 Y164.13 E.04223
G1 X87.062 Y163.904
G1 X88.039 Y162.928 E.04244
G1 X87.727 Y162.707
G1 X86.744 Y163.69 E.04272
G1 X86.414 Y163.486
G1 X87.406 Y162.494 E.04309
G1 X87.076 Y162.291
G1 X86.074 Y163.293 E.04351
G1 X85.723 Y163.111
G1 X86.736 Y162.098 E.04402
G1 X86.385 Y161.916
G1 X85.359 Y162.941 E.04456
G1 X84.984 Y162.783
G1 X86.023 Y161.744 E.04517
G1 X85.651 Y161.583
G1 X84.595 Y162.639 E.04589
M73 P88 R2
G1 X84.193 Y162.508
G1 X85.269 Y161.432 E.04676
G1 X84.874 Y161.294
G1 X83.775 Y162.392 E.04774
G1 X83.341 Y162.293
G1 X84.467 Y161.168 E.04889
G1 X84.046 Y161.054
G1 X82.891 Y162.21 E.05019
G1 X82.422 Y162.146
G1 X83.612 Y160.955 E.05173
G1 X83.163 Y160.871
G1 X81.932 Y162.102 E.05349
G1 X81.419 Y162.083
G1 X82.697 Y160.804 E.05555
G1 X82.213 Y160.755
G1 X80.876 Y162.092 E.0581
G1 X80.303 Y162.131
G1 X81.709 Y160.725 E.06109
G1 X81.183 Y160.718
G1 X79.688 Y162.214 E.06499
G1 X79.024 Y162.344
G1 X80.633 Y160.736 E.06991
G1 X80.048 Y160.787
G1 X78.29 Y162.545 E.07639
G1 X77.449 Y162.853
G1 X79.429 Y160.873 E.08605
G1 X78.765 Y161.003
G1 X76.412 Y163.356 E.10225
; WIPE_START
M204 S6000
G1 X77.826 Y161.942 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X74.33 Y164.905 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X78.041 Y161.194 E.16127
; WIPE_START
M204 S6000
G1 X76.627 Y162.608 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X74.21 Y169.848 Z2.8 F42000
G1 X71.283 Y178.618 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X70.924 Y178.976 E.01556
G1 X70.764 Y178.603
G1 X71.283 Y178.084 E.02253
G1 X71.283 Y177.551
G1 X70.615 Y178.219 E.02901
G1 X70.478 Y177.823
G1 X71.283 Y177.018 E.03497
G1 X71.283 Y176.485
G1 X70.353 Y177.414 E.04038
G1 X70.242 Y176.992
G1 X71.283 Y175.951 E.04524
G1 X71.283 Y175.418
G1 X70.146 Y176.555 E.04941
G1 X70.063 Y176.104
G1 X71.283 Y174.885 E.05298
G1 X71.283 Y174.352
G1 X69.997 Y175.637 E.05585
G1 X69.95 Y175.151
G1 X71.283 Y173.818 E.05793
G1 X71.283 Y173.285
G1 X69.924 Y174.644 E.05904
G1 X69.917 Y174.117
G1 X71.283 Y172.752 E.05933
G1 X71.283 Y172.219
M73 P89 R2
G1 X69.917 Y173.584 E.05933
G1 X69.917 Y173.05
G1 X71.292 Y171.676 E.05973
G1 X71.334 Y171.1
G1 X69.917 Y172.517 E.06157
G1 X69.92 Y171.982
G1 X71.413 Y170.488 E.0649
G1 X71.546 Y169.822
G1 X69.939 Y171.429 E.06981
G1 X69.988 Y170.847
G1 X71.748 Y169.087 E.07646
G1 X72.052 Y168.25
G1 X70.073 Y170.228 E.08598
G1 X70.206 Y169.563
G1 X72.556 Y167.212 E.10215
; WIPE_START
M204 S6000
G1 X71.142 Y168.626 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X74.149 Y165.086 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X70.396 Y168.839 E.16307
G1 X70.67 Y168.032
G1 X77.232 Y161.47 E.28515
G1 X76.291 Y161.877
G1 X71.083 Y167.085 E.2263
; WIPE_START
M204 S6000
G1 X72.498 Y165.671 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X71.794 Y165.842 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X75.046 Y162.589 E.14133
; WIPE_START
M204 S6000
G1 X73.632 Y164.003 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.698 Y166.89 Z2.8 F42000
G1 X103.794 Y176.324 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.297528
G1 F14139.382
M204 S6000
G3 X103.477 Y176.757 I-4.358 J-2.861 E.01113
; LINE_WIDTH: 0.33392
G1 F12371.143
G3 X103.177 Y177.041 I-2.064 J-1.879 E.0098
; LINE_WIDTH: 0.28881
G1 F14640.694
G1 X102.826 Y177.29 E.00863
; WIPE_START
G1 X103.177 Y177.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.616 Y170.29 Z2.8 F42000
G1 X97.956 Y167.142 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.131592
G1 F15000
M204 S6000
G1 X97.74 Y167.142 E.00156
; WIPE_START
G1 X97.956 Y167.142 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.364 Y173.877 Z2.8 F42000
G1 X91.826 Y178.635 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.175805
G1 F15000
M204 S6000
G1 X91.728 Y178.777 E.00187
; LINE_WIDTH: 0.213987
G1 X91.63 Y178.919 E.00241
; LINE_WIDTH: 0.25237
G1 X91.53 Y179.063 E.003
G1 X91.393 Y179.055 E.00234
; LINE_WIDTH: 0.226541
G1 X91.299 Y178.846 E.00343
; WIPE_START
G1 X91.393 Y179.055 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.412 Y173.271 Z2.8 F42000
G1 X77.386 Y162.791 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.197944
G1 F15000
M204 S6000
G1 X77.295 Y162.853 E.0014
; LINE_WIDTH: 0.171654
G1 X77.201 Y162.916 E.00119
; LINE_WIDTH: 0.14065
G1 X77.109 Y162.98 E.00089
; LINE_WIDTH: 0.105771
G1 X77.017 Y163.045 E.00057
M204 S10000
G1 X76.351 Y163.295 F42000
; LINE_WIDTH: 0.198924
G1 F15000
M204 S6000
G1 X76.134 Y163.461 E.00347
; LINE_WIDTH: 0.153016
G1 X75.976 Y163.587 E.00182
; LINE_WIDTH: 0.109789
G1 X75.817 Y163.713 E.0011
; WIPE_START
G1 X75.976 Y163.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.658 Y162.216 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.111916
G1 F15000
M204 S6000
G1 X75.499 Y162.337 E.00112
; LINE_WIDTH: 0.159031
G1 X75.303 Y162.493 E.00238
; LINE_WIDTH: 0.205793
G1 X75.106 Y162.649 E.00333
; WIPE_START
G1 X75.303 Y162.493 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X73.759 Y163.578 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.10115
G1 F15000
M204 S6000
G2 X72.783 Y164.555 I24.631 J25.616 E.00655
; WIPE_START
G1 X73.759 Y163.578 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X71.854 Y165.902 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.210803
G1 F15000
M204 S6000
G1 X71.687 Y166.109 E.00365
; LINE_WIDTH: 0.175331
G1 X71.595 Y166.226 E.0016
; LINE_WIDTH: 0.140464
G1 X71.504 Y166.343 E.00118
; LINE_WIDTH: 0.105596
G1 X71.413 Y166.461 E.00076
; WIPE_START
G1 X71.504 Y166.343 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.92 Y166.61 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.111467
G1 F15000
M204 S6000
G1 X72.766 Y166.801 E.00137
; LINE_WIDTH: 0.156753
G1 X72.63 Y166.976 E.00205
; LINE_WIDTH: 0.200582
G1 X72.494 Y167.15 E.00284
M204 S10000
G1 X72.244 Y167.818 F42000
; LINE_WIDTH: 0.0928291
G1 F15000
M204 S6000
G1 X72.214 Y167.86 E.00021
; LINE_WIDTH: 0.116684
G1 X72.139 Y167.969 E.0008
; LINE_WIDTH: 0.154722
G1 X72.064 Y168.078 E.00121
; LINE_WIDTH: 0.192759
G1 X71.989 Y168.187 E.00162
; WIPE_START
G1 X72.064 Y168.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X71.145 Y167.147 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.201296
G1 F15000
M204 S6000
G1 X71.038 Y167.296 E.00236
; LINE_WIDTH: 0.161381
G1 X70.956 Y167.415 E.0014
; LINE_WIDTH: 0.112573
G1 X70.874 Y167.534 E.00082
; WIPE_START
G1 X70.956 Y167.415 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X70.46 Y168.903 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.197278
G1 F15000
M204 S6000
G1 X70.294 Y169.177 E.00404
; WIPE_START
G1 X70.46 Y168.903 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X71.368 Y170.82 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.133894
G1 F15000
M204 S6000
G1 X71.266 Y171.032 E.00174
; WIPE_START
G1 X71.368 Y170.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X71.307 Y178.453 Z2.8 F42000
G1 X71.301 Y179.112 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.124149
G1 F15000
M204 S6000
G1 X71.029 Y179.146 E.00182
G1 X70.944 Y179.021 E.001
; OBJECT_ID: 7
; WIPE_START
G1 X71.029 Y179.146 E-.26941
G1 X71.301 Y179.112 E-.49059
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X63.687 Y178.589 Z2.8 F42000
G1 X47.695 Y177.49 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X46.31 Y180.612 I-11.18 J-3.091 E.10534
G1 X46.31 Y177.361 E.09989
G3 X45.611 Y176.248 I.647 J-1.182 E.0422
G1 X45.61 Y168.298 E.24426
G2 X27.09 Y171.898 I-8.909 J3.604 E.81409
G1 X27.09 Y180.613 E.26779
G3 X25.31 Y174.498 I9.822 J-6.176 E.19824
G3 X25.319 Y171.448 I76.941 J-1.298 E.09371
G1 X25.332 Y171.222 E.00696
G3 X37.326 Y160.528 I11.371 J.679 E.54807
G3 X46.942 Y166.91 I-.666 J11.44 E.37165
G1 X57.949 Y166.911 E.33819
G3 X59.189 Y168.149 I-.055 J1.295 E.05913
G1 X59.189 Y176.25 E.24893
G3 X57.951 Y177.489 I-1.296 J-.057 E.05907
G1 X47.755 Y177.49 E.31329
; WIPE_START
M204 S6000
G1 X47.374 Y178.475 E-.40149
G1 X47.035 Y179.286 E-.33384
G1 X47.006 Y179.344 E-.02467
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.507 Y177.93 Z2.8 F42000
G1 X57.949 Y177.281 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X58.981 Y176.249 E.04485
G1 X58.981 Y175.715
G1 X57.415 Y177.281 E.06807
G1 X56.882 Y177.281
G1 X58.981 Y175.182 E.09124
G1 X58.981 Y174.648
G1 X56.348 Y177.281 E.11442
G1 X55.815 Y177.281
G1 X58.981 Y174.115 E.13759
G1 X58.981 Y173.582
G1 X55.282 Y177.282 E.16077
G1 X54.749 Y177.282
G1 X58.981 Y173.049 E.18394
G1 X58.981 Y172.515
G1 X54.215 Y177.282 E.20712
G1 X53.682 Y177.282
G1 X58.981 Y171.982 E.23029
G1 X58.981 Y171.449
G1 X53.149 Y177.282 E.25347
G1 X52.615 Y177.282
G1 X58.981 Y170.916 E.27664
G1 X58.981 Y170.382
G1 X52.082 Y177.282 E.29982
G1 X51.549 Y177.282
G1 X58.981 Y169.849 E.32299
G1 X58.981 Y169.316
G1 X51.015 Y177.282 E.34617
G1 X50.482 Y177.282
G1 X58.981 Y168.783 E.36934
G1 X58.981 Y168.249
G1 X49.949 Y177.282 E.39252
G1 X49.415 Y177.282
G1 X58.902 Y167.796 E.41224
G1 X58.695 Y167.469
G1 X48.882 Y177.282 E.42644
G1 X48.349 Y177.282
G1 X53.606 Y172.025 E.22843
G1 X53.719 Y171.912
G1 X58.394 Y167.237 E.20315
G1 X57.976 Y167.122
G1 X47.815 Y177.282 E.44152
; WIPE_START
M204 S6000
G1 X49.23 Y175.868 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X47.147 Y178.484 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X46.517 Y179.114 E.02737
G1 X46.517 Y178.58
G1 X47.42 Y177.678 E.03922
G1 X46.517 Y178.047
G1 X57.446 Y167.118 E.47491
G1 X56.913 Y167.118
G1 X46.517 Y177.514 E.45174
G1 X46.358 Y177.14
G1 X56.38 Y167.118 E.43551
G1 X55.847 Y167.118
G1 X46.072 Y176.893 E.42477
G1 X45.878 Y176.554
G1 X55.313 Y167.118 E.41003
G1 X54.78 Y167.118
G1 X45.818 Y176.08 E.38943
G1 X45.818 Y175.547
G1 X54.247 Y167.118 E.36626
G1 X53.714 Y167.118
G1 X45.818 Y175.013 E.3431
G1 X45.818 Y174.48
G1 X53.181 Y167.118 E.31993
G1 X52.647 Y167.118
G1 X45.818 Y173.947 E.29676
G1 X45.818 Y173.414
G1 X52.114 Y167.118 E.2736
G1 X51.581 Y167.118
G1 X45.818 Y172.881 E.25043
G1 X45.818 Y172.347
G1 X51.048 Y167.118 E.22726
G1 X50.515 Y167.118
G1 X45.818 Y171.814 E.2041
G1 X45.818 Y171.281
G1 X49.981 Y167.117 E.18093
G1 X49.448 Y167.117
G1 X45.818 Y170.748 E.15776
G1 X45.818 Y170.215
G1 X48.915 Y167.117 E.1346
G1 X48.382 Y167.117
G1 X45.818 Y169.682 E.11143
G1 X45.818 Y169.148
G1 X47.849 Y167.117 E.08826
G1 X47.315 Y167.117
G1 X45.817 Y168.615 E.0651
G1 X45.766 Y168.134
G1 X46.805 Y167.094 E.04517
G1 X46.621 Y166.745
G1 X45.602 Y167.764 E.04429
G1 X45.427 Y167.406
G1 X46.434 Y166.399 E.04377
G1 X46.237 Y166.063
G1 X45.24 Y167.06 E.04333
G1 X45.041 Y166.725
G1 X46.03 Y165.736 E.04298
G1 X45.813 Y165.42
G1 X44.831 Y166.402 E.04265
G1 X44.611 Y166.089
G1 X45.586 Y165.114 E.04236
G1 X45.35 Y164.816
G1 X44.38 Y165.787 E.04216
G1 X44.138 Y165.495
G1 X45.105 Y164.528 E.04203
G1 X44.852 Y164.248
G1 X43.886 Y165.214 E.04197
G1 X43.624 Y164.943
G1 X44.59 Y163.977 E.04197
G1 X44.319 Y163.715
G1 X43.352 Y164.681 E.042
G1 X43.069 Y164.431
G1 X44.037 Y163.463 E.04208
G1 X43.747 Y163.22
G1 X42.776 Y164.191 E.0422
G1 X42.473 Y163.961
G1 X43.448 Y162.986 E.04239
G1 X43.14 Y162.761
G1 X42.158 Y163.742 E.04265
G1 X41.833 Y163.534
G1 X42.823 Y162.545 E.04298
G1 X42.496 Y162.338
G1 X41.497 Y163.337 E.04339
G1 X41.15 Y163.151
G1 X42.16 Y162.141 E.04388
G1 X41.812 Y161.955
G1 X40.79 Y162.977 E.0444
G1 X40.418 Y162.816
G1 X41.454 Y161.78 E.04501
G1 X41.086 Y161.615
G1 X40.033 Y162.668 E.04572
G1 X39.635 Y162.533
G1 X40.706 Y161.462 E.04654
G1 X40.314 Y161.32
G1 X39.222 Y162.413 E.04749
G1 X38.793 Y162.308
G1 X39.91 Y161.191 E.04857
G1 X39.493 Y161.075
G1 X38.346 Y162.222 E.04986
G1 X37.879 Y162.155
G1 X39.062 Y160.972 E.0514
G1 X38.616 Y160.885
G1 X37.393 Y162.109 E.05316
G1 X36.883 Y162.085
G1 X38.155 Y160.814 E.05524
G1 X37.673 Y160.762
G1 X36.345 Y162.09 E.05774
G1 X35.774 Y162.128
G1 X37.172 Y160.73 E.06075
G1 X36.648 Y160.72
G1 X35.163 Y162.205 E.06453
G1 X34.503 Y162.332
G1 X36.1 Y160.735 E.06936
G1 X35.521 Y160.78
G1 X33.773 Y162.529 E.07598
G1 X32.934 Y162.835
G1 X34.904 Y160.865 E.0856
G1 X34.245 Y160.991
G1 X31.895 Y163.34 E.1021
; WIPE_START
M204 S6000
G1 X33.309 Y161.926 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X30.548 Y169.041 Z2.8 F42000
G1 X26.883 Y178.485 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X26.436 Y178.931 E.01942
G1 X26.281 Y178.553
G1 X26.883 Y177.951 E.02616
G1 X26.883 Y177.418
G1 X26.137 Y178.164 E.03239
G1 X26.006 Y177.761
G1 X26.883 Y176.885 E.03809
G1 X26.883 Y176.352
G1 X25.888 Y177.346 E.04322
G1 X25.783 Y176.918
G1 X26.883 Y175.818 E.04777
G1 X26.883 Y175.285
G1 X25.695 Y176.473 E.0516
G1 X25.622 Y176.012
G1 X26.883 Y174.752 E.05476
G1 X26.883 Y174.219
G1 X25.567 Y175.534 E.05715
G1 X25.532 Y175.036
G1 X26.883 Y173.685 E.0587
G1 X26.883 Y173.152
G1 X25.518 Y174.517 E.05931
G1 X25.517 Y173.984
G1 X26.883 Y172.619 E.05933
G1 X26.883 Y172.086
G1 X25.517 Y173.451 E.05933
G1 X25.517 Y172.917
G1 X26.89 Y171.545 E.05963
G1 X26.928 Y170.973
G1 X25.517 Y172.384 E.06131
G1 X25.518 Y171.85
G1 X27.004 Y170.365 E.06454
G1 X27.133 Y169.702
G1 X25.536 Y171.3 E.06943
G1 X25.582 Y170.72
G1 X27.332 Y168.97 E.07604
G1 X27.634 Y168.135
G1 X25.663 Y170.106 E.08564
G1 X25.793 Y169.442
G1 X28.138 Y167.097 E.10191
; WIPE_START
M204 S6000
G1 X26.724 Y168.511 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X25.98 Y168.722 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X33.521 Y161.181 E.32768
G1 X32.715 Y161.454
G1 X26.252 Y167.916 E.28082
G1 X26.665 Y166.971
G1 X31.773 Y161.862 E.22199
; WIPE_START
M204 S6000
G1 X30.359 Y163.276 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X30.522 Y162.58 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X27.38 Y165.722 E.13651
; WIPE_START
M204 S6000
G1 X28.795 Y164.308 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X34.664 Y169.187 Z2.8 F42000
G1 X46.822 Y179.295 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.133969
G1 F15000
M204 S6000
G1 X46.499 Y179.265 E.00241
M204 S10000
G1 X46.944 Y178.98 F42000
; LINE_WIDTH: 0.108504
G1 F15000
M204 S6000
G1 X46.875 Y179.081 E.00065
; LINE_WIDTH: 0.149169
G1 X46.806 Y179.181 E.00105
; LINE_WIDTH: 0.186795
M73 P90 R2
G1 X46.697 Y179.336 E.00222
; WIPE_START
G1 X46.806 Y179.181 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.275 Y177.606 Z2.8 F42000
G1 X58.89 Y176.633 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107214
G1 F15000
M204 S6000
G3 X58.803 Y176.753 I-1.259 J-.817 E.00078
; LINE_WIDTH: 0.146585
G3 X58.486 Y177.076 I-2.333 J-1.972 E.00383
; LINE_WIDTH: 0.111676
G3 X58.333 Y177.19 I-1.035 J-1.237 E.00107
; WIPE_START
G1 X58.486 Y177.076 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X50.892 Y177.841 Z2.8 F42000
G1 X46.553 Y178.278 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.109728
G1 F15000
M204 S6000
G1 X46.517 Y178.094 E.00102
; WIPE_START
G1 X46.553 Y178.278 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X43.293 Y171.377 Z2.8 F42000
G1 X38.342 Y160.893 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0897733
G1 F15000
M204 S6000
G1 X38.175 Y160.812 E.00071
; WIPE_START
G1 X38.342 Y160.893 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.863 Y161.082 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0997871
G1 F15000
M204 S6000
G1 X33.581 Y161.241 E.0015
; WIPE_START
G1 X33.863 Y161.082 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X36.902 Y162.104 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0901157
G1 F15000
M204 S6000
G1 X36.689 Y162.012 E.00089
; WIPE_START
G1 X36.902 Y162.104 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X32.871 Y162.773 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.196381
G1 F15000
M204 S6000
G1 X32.771 Y162.84 E.00151
; LINE_WIDTH: 0.166419
G1 X32.669 Y162.909 E.00124
; LINE_WIDTH: 0.135347
G1 X32.585 Y162.969 E.00078
; LINE_WIDTH: 0.10389
G1 X32.501 Y163.028 E.00051
M204 S10000
G1 X31.834 Y163.279 F42000
; LINE_WIDTH: 0.20044
G1 F15000
M204 S6000
G1 X31.624 Y163.44 E.00339
; LINE_WIDTH: 0.155388
G1 X31.46 Y163.571 E.00193
; LINE_WIDTH: 0.111108
G1 X31.295 Y163.703 E.00117
; WIPE_START
G1 X31.46 Y163.571 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X31.14 Y162.201 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.101001
G1 F15000
M204 S6000
G1 X31.054 Y162.267 E.00051
; LINE_WIDTH: 0.12668
G1 X30.968 Y162.333 E.00074
; LINE_WIDTH: 0.162026
G1 X30.775 Y162.486 E.00239
; LINE_WIDTH: 0.207046
G1 X30.582 Y162.64 E.0033
; WIPE_START
G1 X30.775 Y162.486 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X32.222 Y161.654 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.102736
G1 F15000
M204 S6000
G1 X32.14 Y161.71 E.00048
; LINE_WIDTH: 0.14175
G1 X31.987 Y161.817 E.0015
; LINE_WIDTH: 0.190628
G1 X31.835 Y161.924 E.00224
; WIPE_START
G1 X31.987 Y161.817 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X29.101 Y163.703 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0930909
G1 F15000
M204 S6000
G2 X28.489 Y164.316 I17.128 J17.731 E.00354
; WIPE_START
G1 X29.101 Y163.703 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X27.441 Y165.782 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.204637
G1 F15000
M204 S6000
G1 X27.24 Y166.032 E.00422
; LINE_WIDTH: 0.157579
G1 X27.119 Y166.187 E.00184
; LINE_WIDTH: 0.111307
G1 X26.998 Y166.342 E.0011
; WIPE_START
G1 X27.119 Y166.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X28.508 Y166.489 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.101903
G1 F15000
M204 S6000
G1 X28.419 Y166.6 E.00068
; LINE_WIDTH: 0.129559
G1 X28.328 Y166.712 E.00102
; LINE_WIDTH: 0.163483
G1 X28.203 Y166.874 E.00201
; LINE_WIDTH: 0.203315
G1 X28.077 Y167.036 E.00268
M204 S10000
G1 X27.826 Y167.703 F42000
; LINE_WIDTH: 0.0938693
G1 F15000
M204 S6000
G1 X27.792 Y167.75 E.00024
; LINE_WIDTH: 0.118383
G1 X27.718 Y167.858 E.0008
; LINE_WIDTH: 0.155696
G1 X27.645 Y167.965 E.0012
; LINE_WIDTH: 0.193008
G1 X27.571 Y168.073 E.00159
; WIPE_START
G1 X27.645 Y167.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.903 Y171.799 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.121854
G1 F15000
M204 S6000
G1 X26.812 Y172.015 E.00151
; OBJECT_ID: 3
; WIPE_START
G1 X26.903 Y171.799 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X28.735 Y164.39 Z2.8 F42000
G1 X32.796 Y147.969 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X32.004 Y147.759 E.02519
G3 X27.09 Y141.002 I2.209 J-6.772 E.27432
G1 X27.09 Y106.998 E1.04485
G3 X34.198 Y99.89 I7.119 J.011 E.34293
G1 X87.702 Y99.89 E1.64403
G3 X94.81 Y106.998 I-.005 J7.113 E.343
G1 X94.81 Y141.002 E1.04485
G3 X87.702 Y148.11 I-7.123 J-.015 E.34287
G1 X34.198 Y148.11 E1.64403
G3 X32.855 Y147.979 I.015 J-7.123 E.04151
; WIPE_START
M204 S6000
G1 X32.004 Y147.759 E-.33424
G1 X31.479 Y147.569 E-.21214
G1 X30.973 Y147.323 E-.21362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.696 Y141.328 Z2.8 F42000
G1 X69.738 Y98.11 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X87.698 Y98.11 E.55187
G3 X96.59 Y107.002 I-.015 J8.907 E.42899
G1 X96.59 Y140.998 E1.0446
G3 X87.698 Y149.89 I-8.894 J-.002 E.42916
G1 X34.202 Y149.89 E1.64378
G3 X25.31 Y140.998 I.015 J-8.907 E.42899
G1 X25.31 Y107.002 E1.0446
G3 X34.202 Y98.11 I8.894 J.002 E.42916
G1 X52.162 Y98.11 E.55187
G1 X52.16 Y93.804 E.13231
G3 X53.456 Y92.51 I1.293 J-.001 E.06254
G1 X68.446 Y92.51 E.4606
G3 X69.74 Y93.804 I.001 J1.293 E.06247
G1 X69.738 Y98.05 E.13046
; WIPE_START
M204 S6000
G1 X71.738 Y98.057 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X74.599 Y105.133 Z2.8 F42000
G1 X92.121 Y148.471 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X95.171 Y145.42 E.13257
G1 X95.711 Y144.348
G1 X91.048 Y149.011 E.20263
G1 X90.217 Y149.308
G1 X96.008 Y143.517 E.25163
G1 X96.193 Y142.799
G1 X93.377 Y145.615 E.12234
; WIPE_START
M204 S6000
G1 X94.791 Y144.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.298 Y144.16 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X96.304 Y142.155 E.08714
G1 X96.363 Y141.563
G1 X94.657 Y143.269 E.07413
G1 X94.852 Y142.54
G1 X96.382 Y141.01 E.06649
G1 X96.383 Y140.476
G1 X94.962 Y141.897 E.06175
G1 X95.01 Y141.315
G1 X96.383 Y139.943 E.05964
G1 X96.383 Y139.41
G1 X95.017 Y140.775 E.05933
G1 X95.017 Y140.242
G1 X96.383 Y138.876 E.05933
G1 X96.383 Y138.343
G1 X95.017 Y139.708 E.05933
G1 X95.017 Y139.175
G1 X96.383 Y137.81 E.05933
G1 X96.383 Y137.277
G1 X95.017 Y138.642 E.05933
G1 X95.017 Y138.109
G1 X96.383 Y136.743 E.05933
G1 X96.383 Y136.21
G1 X95.017 Y137.575 E.05933
G1 X95.017 Y137.042
G1 X96.383 Y135.677 E.05933
G1 X96.383 Y135.144
G1 X95.017 Y136.509 E.05933
G1 X95.017 Y135.976
G1 X96.383 Y134.61 E.05933
G1 X96.383 Y134.077
G1 X95.017 Y135.442 E.05933
G1 X95.017 Y134.909
G1 X96.383 Y133.544 E.05933
G1 X96.383 Y133.011
G1 X95.017 Y134.376 E.05933
G1 X95.017 Y133.843
G1 X96.383 Y132.477 E.05933
G1 X96.383 Y131.944
G1 X95.017 Y133.309 E.05933
G1 X95.017 Y132.776
G1 X96.383 Y131.411 E.05933
G1 X96.383 Y130.878
G1 X95.017 Y132.243 E.05933
G1 X95.017 Y131.71
G1 X96.383 Y130.344 E.05933
G1 X96.383 Y129.811
G1 X95.017 Y131.176 E.05933
G1 X95.017 Y130.643
G1 X96.383 Y129.278 E.05933
G1 X96.383 Y128.745
G1 X95.017 Y130.11 E.05933
G1 X95.017 Y129.577
G1 X96.383 Y128.211 E.05933
G1 X96.383 Y127.678
G1 X95.017 Y129.043 E.05933
G1 X95.017 Y128.51
G1 X96.383 Y127.145 E.05933
G1 X96.383 Y126.612
G1 X95.017 Y127.977 E.05933
G1 X95.017 Y127.443
G1 X96.383 Y126.078 E.05933
G1 X96.383 Y125.545
G1 X95.017 Y126.91 E.05933
G1 X95.017 Y126.377
G1 X96.383 Y125.012 E.05933
G1 X96.383 Y124.478
G1 X95.017 Y125.844 E.05933
G1 X95.017 Y125.31
G1 X96.383 Y123.945 E.05933
G1 X96.383 Y123.412
G1 X95.017 Y124.777 E.05933
G1 X95.017 Y124.244
G1 X96.383 Y122.879 E.05933
G1 X96.383 Y122.345
G1 X95.017 Y123.711 E.05933
G1 X95.017 Y123.177
G1 X96.383 Y121.812 E.05933
G1 X96.383 Y121.279
G1 X95.017 Y122.644 E.05933
G1 X95.017 Y122.111
G1 X96.383 Y120.746 E.05933
G1 X96.383 Y120.212
G1 X95.017 Y121.578 E.05933
G1 X95.017 Y121.044
G1 X96.383 Y119.679 E.05933
G1 X96.383 Y119.146
G1 X95.017 Y120.511 E.05933
G1 X95.017 Y119.978
G1 X96.383 Y118.613 E.05933
G1 X96.383 Y118.079
G1 X95.017 Y119.445 E.05933
G1 X95.017 Y118.911
G1 X96.383 Y117.546 E.05933
G1 X96.383 Y117.013
G1 X95.017 Y118.378 E.05933
G1 X95.017 Y117.845
G1 X96.383 Y116.48 E.05933
G1 X96.383 Y115.946
G1 X95.017 Y117.312 E.05933
G1 X95.017 Y116.778
G1 X96.383 Y115.413 E.05933
G1 X96.383 Y114.88
G1 X95.017 Y116.245 E.05933
G1 X95.017 Y115.712
G1 X96.383 Y114.347 E.05933
G1 X96.383 Y113.813
G1 X95.017 Y115.179 E.05933
G1 X95.017 Y114.645
G1 X96.383 Y113.28 E.05933
G1 X96.383 Y112.747
G1 X95.017 Y114.112 E.05933
G1 X95.017 Y113.579
G1 X96.383 Y112.214 E.05933
G1 X96.383 Y111.68
G1 X95.017 Y113.046 E.05933
G1 X95.017 Y112.512
G1 X96.383 Y111.147 E.05933
G1 X96.383 Y110.614
G1 X95.017 Y111.979 E.05933
G1 X95.017 Y111.446
G1 X96.383 Y110.081 E.05933
G1 X96.383 Y109.547
G1 X95.017 Y110.913 E.05933
G1 X95.017 Y110.379
G1 X96.383 Y109.014 E.05933
G1 X96.383 Y108.481
G1 X95.017 Y109.846 E.05933
G1 X95.017 Y109.313
G1 X96.383 Y107.948 E.05933
G1 X96.383 Y107.414
G1 X95.017 Y108.779 E.05933
G1 X95.017 Y108.246
G1 X96.38 Y106.883 E.05922
G1 X96.359 Y106.371
G1 X95.017 Y107.713 E.05829
G1 X95.017 Y107.18
G1 X96.31 Y105.887 E.05615
G1 X96.237 Y105.427
G1 X95.008 Y106.655 E.0534
G1 X94.969 Y106.162
G1 X96.145 Y104.985 E.05112
G1 X96.033 Y104.565
G1 X94.899 Y105.698 E.04925
G1 X94.806 Y105.258
G1 X95.903 Y104.161 E.04767
G1 X95.759 Y103.772
G1 X94.69 Y104.841 E.04643
G1 X94.555 Y104.442
G1 X95.599 Y103.398 E.04537
G1 X95.426 Y103.039
G1 X94.401 Y104.063 E.04453
G1 X94.231 Y103.7
G1 X95.238 Y102.693 E.04376
G1 X95.037 Y102.361
G1 X94.043 Y103.354 E.04319
G1 X93.841 Y103.023
G1 X94.824 Y102.04 E.04273
G1 X94.6 Y101.732
G1 X93.625 Y102.706 E.04235
G1 X93.393 Y102.405
G1 X94.363 Y101.435 E.04214
G1 X94.115 Y101.15
G1 X93.148 Y102.117 E.04201
G1 X92.89 Y101.842
G1 X93.855 Y100.877 E.04194
G1 X93.583 Y100.615
G1 X92.617 Y101.582 E.04201
G1 X92.33 Y101.335
G1 X93.3 Y100.365 E.04214
G1 X93.004 Y100.128
G1 X92.03 Y101.102 E.04234
G1 X91.715 Y100.883
G1 X92.697 Y99.901 E.04267
G1 X92.378 Y99.687
G1 X91.385 Y100.68 E.04313
G1 X91.041 Y100.49
G1 X92.046 Y99.485 E.04367
G1 X91.702 Y99.296
G1 X90.68 Y100.318 E.04441
G1 X90.303 Y100.162
G1 X91.345 Y99.12 E.04529
G1 X90.973 Y98.959
G1 X89.908 Y100.024 E.0463
G1 X89.492 Y99.907
G1 X90.586 Y98.813 E.04753
G1 X90.184 Y98.682
G1 X89.055 Y99.81 E.04903
G1 X88.594 Y99.738
G1 X89.765 Y98.567 E.05087
G1 X89.327 Y98.472
G1 X88.104 Y99.695 E.05313
G1 X87.583 Y99.683
G1 X88.868 Y98.398 E.05582
G1 X88.388 Y98.345
G1 X87.05 Y99.683 E.05813
G1 X86.517 Y99.683
G1 X87.878 Y98.321 E.05917
G1 X87.349 Y98.317
G1 X85.984 Y99.683 E.05933
G1 X85.45 Y99.683
G1 X86.815 Y98.317 E.05933
G1 X86.282 Y98.317
G1 X84.917 Y99.683 E.05933
G1 X84.384 Y99.683
G1 X85.749 Y98.317 E.05933
G1 X85.216 Y98.317
G1 X83.85 Y99.683 E.05933
G1 X83.317 Y99.683
G1 X84.682 Y98.317 E.05933
G1 X84.149 Y98.317
G1 X82.784 Y99.683 E.05933
G1 X82.251 Y99.683
G1 X83.616 Y98.317 E.05933
G1 X83.083 Y98.317
G1 X81.717 Y99.683 E.05933
G1 X81.184 Y99.683
G1 X82.549 Y98.317 E.05933
G1 X82.016 Y98.317
G1 X80.651 Y99.683 E.05933
G1 X80.118 Y99.683
G1 X81.483 Y98.317 E.05933
G1 X80.95 Y98.317
G1 X79.584 Y99.683 E.05933
G1 X79.051 Y99.683
G1 X80.416 Y98.317 E.05933
G1 X79.883 Y98.317
G1 X78.518 Y99.683 E.05933
G1 X77.985 Y99.683
G1 X79.35 Y98.317 E.05933
G1 X78.817 Y98.317
G1 X77.451 Y99.683 E.05933
G1 X76.918 Y99.683
G1 X78.283 Y98.317 E.05933
G1 X77.75 Y98.317
G1 X76.385 Y99.683 E.05933
G1 X75.852 Y99.683
G1 X77.217 Y98.317 E.05933
G1 X76.684 Y98.317
G1 X75.318 Y99.683 E.05933
G1 X74.785 Y99.683
G1 X76.15 Y98.317 E.05933
G1 X75.617 Y98.317
G1 X74.252 Y99.683 E.05933
G1 X73.719 Y99.683
G1 X75.084 Y98.317 E.05933
G1 X74.551 Y98.317
G1 X73.185 Y99.683 E.05933
G1 X72.652 Y99.683
G1 X74.017 Y98.317 E.05933
G1 X73.484 Y98.317
G1 X72.119 Y99.683 E.05933
G1 X71.586 Y99.683
G1 X72.951 Y98.317 E.05933
G1 X72.418 Y98.317
G1 X71.052 Y99.683 E.05933
G1 X70.519 Y99.683
G1 X71.884 Y98.317 E.05933
G1 X71.351 Y98.317
M73 P91 R2
G1 X69.986 Y99.683 E.05933
G1 X69.453 Y99.683
G1 X70.818 Y98.317 E.05933
G1 X70.284 Y98.317
G1 X68.919 Y99.683 E.05933
G1 X68.386 Y99.683
G1 X69.751 Y98.317 E.05933
G1 X69.53 Y98.005
G1 X67.853 Y99.683 E.0729
G1 X67.319 Y99.683
G1 X69.531 Y97.471 E.09608
G1 X69.531 Y96.938
G1 X66.786 Y99.683 E.11927
G1 X66.253 Y99.683
G1 X69.531 Y96.404 E.14245
G1 X69.531 Y95.871
G1 X65.72 Y99.683 E.16564
G1 X65.186 Y99.683
G1 X69.532 Y95.337 E.18883
G1 X69.532 Y94.804
G1 X64.653 Y99.683 E.21201
G1 X64.12 Y99.683
G1 X69.532 Y94.27 E.2352
G1 X69.53 Y93.739
G1 X63.587 Y99.683 E.25826
G1 X63.053 Y99.683
G1 X69.418 Y93.318 E.27658
G1 X69.191 Y93.012
G1 X62.52 Y99.683 E.28988
G1 X61.987 Y99.683
G1 X68.867 Y92.802 E.29898
G1 X68.419 Y92.717
G1 X61.454 Y99.683 E.30267
G1 X60.92 Y99.683
G1 X67.886 Y92.717 E.30267
G1 X67.352 Y92.717
G1 X60.387 Y99.683 E.30267
G1 X59.854 Y99.683
G1 X66.819 Y92.717 E.30267
G1 X66.286 Y92.717
G1 X59.321 Y99.683 E.30267
G1 X58.787 Y99.683
G1 X65.753 Y92.717 E.30267
G1 X65.219 Y92.717
G1 X58.254 Y99.683 E.30267
G1 X57.721 Y99.683
G1 X64.686 Y92.717 E.30267
G1 X64.153 Y92.717
G1 X57.188 Y99.683 E.30267
G1 X56.654 Y99.683
G1 X63.62 Y92.717 E.30267
G1 X63.086 Y92.717
G1 X56.121 Y99.683 E.30267
G1 X55.588 Y99.683
G1 X62.553 Y92.717 E.30267
G1 X62.02 Y92.717
G1 X55.055 Y99.683 E.30267
G1 X54.521 Y99.683
G1 X61.487 Y92.717 E.30267
G1 X60.953 Y92.717
G1 X53.988 Y99.683 E.30267
G1 X53.455 Y99.683
G1 X60.42 Y92.717 E.30267
G1 X59.887 Y92.717
G1 X52.922 Y99.683 E.30267
G1 X52.388 Y99.683
G1 X59.353 Y92.717 E.30267
G1 X58.82 Y92.717
G1 X51.855 Y99.683 E.30267
G1 X51.322 Y99.683
G1 X58.287 Y92.717 E.30267
G1 X57.754 Y92.717
G1 X52.37 Y98.101 E.23396
G1 X52.369 Y97.568
G1 X57.22 Y92.717 E.2108
G1 X56.687 Y92.717
G1 X52.369 Y97.035 E.18764
G1 X52.369 Y96.502
G1 X56.154 Y92.717 E.16448
G1 X55.621 Y92.717
G1 X52.369 Y95.97 E.14132
G1 X52.368 Y95.437
G1 X55.087 Y92.717 E.11816
G1 X54.554 Y92.717
G1 X52.368 Y94.904 E.095
G1 X52.368 Y94.371
G1 X54.021 Y92.717 E.07184
G1 X53.488 Y92.717
G1 X52.367 Y93.838 E.04868
; WIPE_START
M204 S6000
G1 X53.488 Y92.717 E-.60204
G1 X53.903 Y92.717 E-.15796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X52.154 Y98.317 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X50.789 Y99.683 E.05933
G1 X50.255 Y99.683
G1 X51.62 Y98.317 E.05933
G1 X51.087 Y98.317
G1 X49.722 Y99.683 E.05932
G1 X49.189 Y99.683
G1 X50.554 Y98.317 E.05933
G1 X50.021 Y98.317
G1 X48.655 Y99.683 E.05933
G1 X48.122 Y99.683
G1 X49.487 Y98.317 E.05933
G1 X48.954 Y98.317
G1 X47.589 Y99.683 E.05932
G1 X47.056 Y99.683
G1 X48.421 Y98.317 E.05933
G1 X47.888 Y98.317
G1 X46.522 Y99.683 E.05933
G1 X45.989 Y99.683
G1 X47.354 Y98.317 E.05933
G1 X46.821 Y98.317
G1 X45.456 Y99.683 E.05933
G1 X44.923 Y99.683
G1 X46.288 Y98.317 E.05933
G1 X45.755 Y98.317
G1 X44.389 Y99.683 E.05933
G1 X43.856 Y99.683
G1 X45.221 Y98.317 E.05933
G1 X44.688 Y98.317
G1 X43.323 Y99.683 E.05933
G1 X42.79 Y99.683
G1 X44.155 Y98.317 E.05933
G1 X43.622 Y98.317
G1 X42.256 Y99.683 E.05933
G1 X41.723 Y99.683
G1 X43.088 Y98.317 E.05933
G1 X42.555 Y98.317
G1 X41.19 Y99.683 E.05933
G1 X40.657 Y99.683
G1 X42.022 Y98.317 E.05933
G1 X41.489 Y98.317
G1 X40.123 Y99.683 E.05933
G1 X39.59 Y99.683
G1 X40.955 Y98.317 E.05933
G1 X40.422 Y98.317
G1 X39.057 Y99.683 E.05933
G1 X38.524 Y99.683
G1 X39.889 Y98.317 E.05933
G1 X39.356 Y98.317
G1 X37.99 Y99.683 E.05933
G1 X37.457 Y99.683
G1 X38.822 Y98.317 E.05933
G1 X38.289 Y98.317
G1 X36.924 Y99.683 E.05933
G1 X36.391 Y99.683
G1 X37.756 Y98.317 E.05933
G1 X37.223 Y98.317
G1 X35.857 Y99.683 E.05933
G1 X35.324 Y99.683
G1 X36.689 Y98.317 E.05933
G1 X36.156 Y98.317
G1 X34.791 Y99.683 E.05933
G1 X34.258 Y99.683
G1 X35.623 Y98.317 E.05933
G1 X35.089 Y98.317
G1 X33.707 Y99.7 E.0601
G1 X33.108 Y99.765
G1 X34.556 Y98.317 E.06292
G1 X34.019 Y98.321
G1 X32.443 Y99.897 E.06851
G1 X31.675 Y100.132
G1 X33.457 Y98.35 E.07743
G1 X32.851 Y98.423
G1 X30.697 Y100.577 E.09359
; WIPE_START
M204 S6000
G1 X32.111 Y99.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.103 Y103.891 Z2.8 F42000
G1 X92.315 Y146.677 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X89.499 Y149.493 E.12234
G1 X88.855 Y149.604
G1 X90.86 Y147.598 E.08714
G1 X89.969 Y147.957
G1 X88.263 Y149.663 E.07413
G1 X87.71 Y149.682
G1 X89.24 Y148.152 E.06649
G1 X88.597 Y148.262
G1 X87.176 Y149.683 E.06175
G1 X86.643 Y149.683
G1 X88.015 Y148.31 E.05964
G1 X87.475 Y148.317
G1 X86.11 Y149.683 E.05933
G1 X85.576 Y149.683
G1 X86.942 Y148.317 E.05933
G1 X86.408 Y148.317
G1 X85.043 Y149.683 E.05933
G1 X84.51 Y149.683
G1 X85.875 Y148.317 E.05933
G1 X85.342 Y148.317
G1 X83.977 Y149.683 E.05933
G1 X83.443 Y149.683
G1 X84.809 Y148.317 E.05933
G1 X84.275 Y148.317
G1 X82.91 Y149.683 E.05933
G1 X82.377 Y149.683
G1 X83.742 Y148.317 E.05933
G1 X83.209 Y148.317
G1 X81.844 Y149.683 E.05933
G1 X81.31 Y149.683
G1 X82.676 Y148.317 E.05933
G1 X82.142 Y148.317
G1 X80.777 Y149.683 E.05933
G1 X80.244 Y149.683
G1 X81.609 Y148.317 E.05933
G1 X81.076 Y148.317
G1 X79.711 Y149.683 E.05933
G1 X79.177 Y149.683
G1 X80.543 Y148.317 E.05933
G1 X80.009 Y148.317
G1 X78.644 Y149.683 E.05933
G1 X78.111 Y149.683
G1 X79.476 Y148.317 E.05933
G1 X78.943 Y148.317
G1 X77.578 Y149.683 E.05933
G1 X77.044 Y149.683
G1 X78.41 Y148.317 E.05933
G1 X77.876 Y148.317
G1 X76.511 Y149.683 E.05933
G1 X75.978 Y149.683
G1 X77.343 Y148.317 E.05933
G1 X76.81 Y148.317
G1 X75.445 Y149.683 E.05933
G1 X74.911 Y149.683
G1 X76.277 Y148.317 E.05933
G1 X75.743 Y148.317
G1 X74.378 Y149.683 E.05933
G1 X73.845 Y149.683
G1 X75.21 Y148.317 E.05933
G1 X74.677 Y148.317
G1 X73.312 Y149.683 E.05933
G1 X72.778 Y149.683
G1 X74.143 Y148.317 E.05933
G1 X73.61 Y148.317
G1 X72.245 Y149.683 E.05933
G1 X71.712 Y149.683
G1 X73.077 Y148.317 E.05933
G1 X72.544 Y148.317
G1 X71.178 Y149.683 E.05933
G1 X70.645 Y149.683
G1 X72.01 Y148.317 E.05933
G1 X71.477 Y148.317
G1 X70.112 Y149.683 E.05933
G1 X69.579 Y149.683
G1 X70.944 Y148.317 E.05933
G1 X70.411 Y148.317
G1 X69.045 Y149.683 E.05933
G1 X68.512 Y149.683
G1 X69.877 Y148.317 E.05933
G1 X69.344 Y148.317
G1 X67.979 Y149.683 E.05933
G1 X67.446 Y149.683
G1 X68.811 Y148.317 E.05933
G1 X68.278 Y148.317
G1 X66.912 Y149.683 E.05933
G1 X66.379 Y149.683
G1 X67.744 Y148.317 E.05933
G1 X67.211 Y148.317
G1 X65.846 Y149.683 E.05933
G1 X65.313 Y149.683
G1 X66.678 Y148.317 E.05933
G1 X66.145 Y148.317
G1 X64.779 Y149.683 E.05933
G1 X64.246 Y149.683
G1 X65.611 Y148.317 E.05933
G1 X65.078 Y148.317
G1 X63.713 Y149.683 E.05933
G1 X63.18 Y149.683
G1 X64.545 Y148.317 E.05933
G1 X64.012 Y148.317
G1 X62.646 Y149.683 E.05933
G1 X62.113 Y149.683
G1 X63.478 Y148.317 E.05933
G1 X62.945 Y148.317
G1 X61.58 Y149.683 E.05933
G1 X61.047 Y149.683
G1 X62.412 Y148.317 E.05933
G1 X61.879 Y148.317
G1 X60.513 Y149.683 E.05933
G1 X59.98 Y149.683
G1 X61.345 Y148.317 E.05933
G1 X60.812 Y148.317
G1 X59.447 Y149.683 E.05933
G1 X58.914 Y149.683
G1 X60.279 Y148.317 E.05933
G1 X59.746 Y148.317
G1 X58.38 Y149.683 E.05933
G1 X57.847 Y149.683
G1 X59.212 Y148.317 E.05933
G1 X58.679 Y148.317
G1 X57.314 Y149.683 E.05933
G1 X56.781 Y149.683
G1 X58.146 Y148.317 E.05933
G1 X57.613 Y148.317
G1 X56.247 Y149.683 E.05933
G1 X55.714 Y149.683
G1 X57.079 Y148.317 E.05933
G1 X56.546 Y148.317
G1 X55.181 Y149.683 E.05933
G1 X54.648 Y149.683
G1 X56.013 Y148.317 E.05933
G1 X55.479 Y148.317
G1 X54.114 Y149.683 E.05933
G1 X53.581 Y149.683
G1 X54.946 Y148.317 E.05933
G1 X54.413 Y148.317
G1 X53.048 Y149.683 E.05933
G1 X52.514 Y149.683
G1 X53.88 Y148.317 E.05933
G1 X53.346 Y148.317
G1 X51.981 Y149.683 E.05933
G1 X51.448 Y149.683
G1 X52.813 Y148.317 E.05933
G1 X52.28 Y148.317
G1 X50.915 Y149.683 E.05933
G1 X50.381 Y149.683
G1 X51.747 Y148.317 E.05933
G1 X51.213 Y148.317
G1 X49.848 Y149.683 E.05933
G1 X49.315 Y149.683
G1 X50.68 Y148.317 E.05933
G1 X50.147 Y148.317
G1 X48.782 Y149.683 E.05933
G1 X48.248 Y149.683
G1 X49.614 Y148.317 E.05933
G1 X49.08 Y148.317
G1 X47.715 Y149.683 E.05933
G1 X47.182 Y149.683
G1 X48.547 Y148.317 E.05933
G1 X48.014 Y148.317
G1 X46.649 Y149.683 E.05933
G1 X46.115 Y149.683
G1 X47.481 Y148.317 E.05933
G1 X46.947 Y148.317
G1 X45.582 Y149.683 E.05933
G1 X45.049 Y149.683
G1 X46.414 Y148.317 E.05933
G1 X45.881 Y148.317
G1 X44.516 Y149.683 E.05933
G1 X43.982 Y149.683
M73 P92 R2
G1 X45.348 Y148.317 E.05933
G1 X44.814 Y148.317
G1 X43.449 Y149.683 E.05933
G1 X42.916 Y149.683
G1 X44.281 Y148.317 E.05933
G1 X43.748 Y148.317
G1 X42.383 Y149.683 E.05933
G1 X41.849 Y149.683
G1 X43.215 Y148.317 E.05933
G1 X42.681 Y148.317
G1 X41.316 Y149.683 E.05933
G1 X40.783 Y149.683
G1 X42.148 Y148.317 E.05933
G1 X41.615 Y148.317
G1 X40.25 Y149.683 E.05933
G1 X39.716 Y149.683
G1 X41.082 Y148.317 E.05933
G1 X40.548 Y148.317
G1 X39.183 Y149.683 E.05933
G1 X38.65 Y149.683
G1 X40.015 Y148.317 E.05933
G1 X39.482 Y148.317
G1 X38.117 Y149.683 E.05933
G1 X37.583 Y149.683
G1 X38.948 Y148.317 E.05933
G1 X38.415 Y148.317
G1 X37.05 Y149.683 E.05933
G1 X36.517 Y149.683
G1 X37.882 Y148.317 E.05933
G1 X37.349 Y148.317
G1 X35.983 Y149.683 E.05933
G1 X35.45 Y149.683
G1 X36.815 Y148.317 E.05933
G1 X36.282 Y148.317
G1 X34.917 Y149.683 E.05933
G1 X34.384 Y149.683
G1 X35.749 Y148.317 E.05933
G1 X35.216 Y148.317
G1 X33.857 Y149.676 E.05903
G1 X33.36 Y149.64
G1 X34.682 Y148.317 E.05748
G1 X34.15 Y148.316
G1 X32.885 Y149.582 E.05498
G1 X32.434 Y149.5
G1 X33.638 Y148.296 E.05233
G1 X33.158 Y148.242
G1 X32.002 Y149.398 E.05025
G1 X31.588 Y149.279
G1 X32.705 Y148.162 E.04854
G1 X32.275 Y148.059
G1 X31.19 Y149.144 E.04716
G1 X30.809 Y148.992
G1 X31.866 Y147.934 E.04595
G1 X31.477 Y147.791
G1 X30.442 Y148.825 E.04496
G1 X30.088 Y148.645
G1 X31.104 Y147.63 E.04414
G1 X30.749 Y147.451
G1 X29.748 Y148.453 E.04352
G1 X29.42 Y148.247
G1 X30.409 Y147.258 E.04298
G1 X30.085 Y147.049
G1 X29.104 Y148.03 E.0426
G1 X28.801 Y147.799
G1 X29.775 Y146.826 E.0423
G1 X29.478 Y146.589
G1 X28.51 Y147.557 E.04206
G1 X28.231 Y147.303
G1 X29.196 Y146.338 E.04194
G1 X28.928 Y146.073
G1 X27.963 Y147.038 E.04194
G1 X27.706 Y146.761
G1 X28.673 Y145.794 E.04201
G1 X28.432 Y145.502
G1 X27.462 Y146.473 E.04218
G1 X27.228 Y146.173
G1 X28.206 Y145.195 E.04249
G1 X27.993 Y144.874
G1 X27.007 Y145.861 E.04288
G1 X26.797 Y145.537
G1 X27.796 Y144.539 E.04339
G1 X27.615 Y144.187
G1 X26.602 Y145.2 E.04401
G1 X26.419 Y144.849
G1 X27.448 Y143.82 E.04473
G1 X27.301 Y143.434
G1 X26.25 Y144.485 E.04568
G1 X26.094 Y144.107
G1 X27.171 Y143.031 E.04679
G1 X27.062 Y142.606
G1 X25.953 Y143.715 E.04818
G1 X25.83 Y143.305
G1 X26.975 Y142.16 E.04977
G1 X26.916 Y141.686
G1 X25.725 Y142.877 E.05178
G1 X25.637 Y142.431
G1 X26.886 Y141.182 E.05426
G1 X26.883 Y140.653
G1 X25.572 Y141.963 E.05695
G1 X25.532 Y141.47
G1 X26.883 Y140.119 E.0587
G1 X26.883 Y139.586
G1 X25.517 Y140.951 E.05933
G1 X25.517 Y140.418
G1 X26.883 Y139.053 E.05933
G1 X26.883 Y138.52
G1 X25.517 Y139.885 E.05933
G1 X25.517 Y139.352
G1 X26.883 Y137.986 E.05933
G1 X26.883 Y137.453
G1 X25.517 Y138.818 E.05933
G1 X25.517 Y138.285
G1 X26.883 Y136.92 E.05933
G1 X26.883 Y136.387
G1 X25.517 Y137.752 E.05933
G1 X25.517 Y137.219
G1 X26.883 Y135.853 E.05933
G1 X26.883 Y135.32
G1 X25.517 Y136.685 E.05933
G1 X25.517 Y136.152
G1 X26.883 Y134.787 E.05933
G1 X26.883 Y134.254
G1 X25.517 Y135.619 E.05933
G1 X25.517 Y135.086
G1 X26.883 Y133.72 E.05933
G1 X26.883 Y133.187
G1 X25.517 Y134.552 E.05933
G1 X25.517 Y134.019
G1 X26.883 Y132.654 E.05933
G1 X26.883 Y132.121
G1 X25.517 Y133.486 E.05933
G1 X25.517 Y132.953
G1 X26.883 Y131.587 E.05933
G1 X26.883 Y131.054
G1 X25.517 Y132.419 E.05933
G1 X25.517 Y131.886
G1 X26.883 Y130.521 E.05933
G1 X26.883 Y129.988
G1 X25.517 Y131.353 E.05933
G1 X25.517 Y130.82
G1 X26.883 Y129.454 E.05933
G1 X26.883 Y128.921
G1 X25.517 Y130.286 E.05933
G1 X25.517 Y129.753
G1 X26.883 Y128.388 E.05933
G1 X26.883 Y127.855
G1 X25.517 Y129.22 E.05933
G1 X25.517 Y128.687
G1 X26.883 Y127.321 E.05933
G1 X26.883 Y126.788
G1 X25.517 Y128.153 E.05933
G1 X25.517 Y127.62
G1 X26.883 Y126.255 E.05933
G1 X26.883 Y125.722
G1 X25.517 Y127.087 E.05933
G1 X25.517 Y126.553
G1 X26.883 Y125.188 E.05933
G1 X26.883 Y124.655
G1 X25.517 Y126.02 E.05933
G1 X25.517 Y125.487
G1 X26.883 Y124.122 E.05933
G1 X26.883 Y123.588
G1 X25.517 Y124.954 E.05933
G1 X25.517 Y124.42
G1 X26.883 Y123.055 E.05933
G1 X26.883 Y122.522
G1 X25.517 Y123.887 E.05933
G1 X25.517 Y123.354
G1 X26.883 Y121.989 E.05933
G1 X26.883 Y121.455
G1 X25.517 Y122.821 E.05933
G1 X25.517 Y122.287
G1 X26.883 Y120.922 E.05933
G1 X26.883 Y120.389
G1 X25.517 Y121.754 E.05933
G1 X25.517 Y121.221
G1 X26.883 Y119.856 E.05933
G1 X26.883 Y119.322
G1 X25.517 Y120.688 E.05933
G1 X25.517 Y120.154
G1 X26.883 Y118.789 E.05933
G1 X26.883 Y118.256
G1 X25.517 Y119.621 E.05933
G1 X25.517 Y119.088
G1 X26.883 Y117.723 E.05933
G1 X26.883 Y117.189
G1 X25.517 Y118.555 E.05933
G1 X25.517 Y118.021
G1 X26.883 Y116.656 E.05933
G1 X26.883 Y116.123
G1 X25.517 Y117.488 E.05933
G1 X25.517 Y116.955
G1 X26.883 Y115.59 E.05933
G1 X26.883 Y115.056
G1 X25.517 Y116.422 E.05933
G1 X25.517 Y115.888
G1 X26.883 Y114.523 E.05933
G1 X26.883 Y113.99
G1 X25.517 Y115.355 E.05933
G1 X25.517 Y114.822
G1 X26.883 Y113.457 E.05933
G1 X26.883 Y112.923
G1 X25.517 Y114.289 E.05933
G1 X25.517 Y113.755
G1 X26.883 Y112.39 E.05933
G1 X26.883 Y111.857
G1 X25.517 Y113.222 E.05933
G1 X25.517 Y112.689
G1 X26.883 Y111.324 E.05933
G1 X26.883 Y110.79
G1 X25.517 Y112.156 E.05933
G1 X25.517 Y111.622
G1 X26.883 Y110.257 E.05933
G1 X26.883 Y109.724
G1 X25.517 Y111.089 E.05933
G1 X25.517 Y110.556
G1 X26.883 Y109.191 E.05933
G1 X26.883 Y108.657
G1 X25.517 Y110.023 E.05933
G1 X25.517 Y109.489
G1 X26.883 Y108.124 E.05933
G1 X26.883 Y107.591
G1 X25.517 Y108.956 E.05933
G1 X25.517 Y108.423
G1 X26.883 Y107.058 E.05933
G1 X26.9 Y106.507
G1 X25.517 Y107.889 E.0601
G1 X25.517 Y107.356
G1 X26.965 Y105.908 E.06292
G1 X27.097 Y105.243
G1 X25.521 Y106.819 E.0685
G1 X25.55 Y106.257
G1 X27.332 Y104.475 E.07743
G1 X27.777 Y103.497
G1 X25.623 Y105.651 E.09359
G1 X25.755 Y104.986
G1 X32.186 Y98.555 E.27948
G1 X31.437 Y98.77
G1 X25.97 Y104.237 E.23758
G1 X26.321 Y103.353
G1 X30.554 Y99.121 E.18394
M204 S10000
G1 X30.975 Y98.937 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.145691
G1 F15000
M204 S6000
M73 P92 R1
G1 X30.795 Y99.06 E.00182
; LINE_WIDTH: 0.190324
G1 X30.615 Y99.182 E.00262
M204 S10000
G1 X29.949 Y99.431 F42000
; LINE_WIDTH: 0.107849
G1 F15000
M204 S6000
G1 X29.817 Y99.532 E.00088
; LINE_WIDTH: 0.147225
G1 X29.686 Y99.634 E.00141
; LINE_WIDTH: 0.185245
G1 X29.553 Y99.74 E.00197
; LINE_WIDTH: 0.221926
G1 X29.421 Y99.847 E.00248
; LINE_WIDTH: 0.255219
G1 X29.291 Y99.956 E.00293
; LINE_WIDTH: 0.285111
G1 F14864.351
G1 X29.161 Y100.065 E.00334
; LINE_WIDTH: 0.323179
G1 F12845.265
G1 X28.907 Y100.286 E.00769
; LINE_WIDTH: 0.362785
G1 F11254.757
G1 X28.658 Y100.511 E.00875
; LINE_WIDTH: 0.395707
G1 F10204.482
G2 X27.711 Y101.458 I15.592 J16.539 E.0385
; LINE_WIDTH: 0.362784
G1 F11254.803
G1 X27.486 Y101.707 E.00876
; LINE_WIDTH: 0.323149
G1 F12846.661
G1 X27.264 Y101.961 E.0077
; LINE_WIDTH: 0.285053
G1 F14867.869
G1 X27.156 Y102.091 E.00334
; LINE_WIDTH: 0.255196
G1 F15000
G1 X27.047 Y102.221 E.00293
; LINE_WIDTH: 0.221937
G1 X26.94 Y102.353 E.00248
; LINE_WIDTH: 0.185236
G1 X26.834 Y102.486 E.00197
; LINE_WIDTH: 0.14722
G1 X26.732 Y102.617 E.00141
; LINE_WIDTH: 0.107851
G1 X26.631 Y102.748 E.00088
; WIPE_START
G1 X26.732 Y102.617 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X30.71 Y100.589 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.180603
G1 F15000
M204 S6000
G1 X30.564 Y100.57 E.00165
; LINE_WIDTH: 0.204702
G1 X30.461 Y100.649 E.00171
; LINE_WIDTH: 0.171321
G1 X30.356 Y100.73 E.00138
; LINE_WIDTH: 0.138998
G1 X30.244 Y100.82 E.00113
; LINE_WIDTH: 0.103609
G1 X30.096 Y100.94 E.00094
; WIPE_START
G1 X30.244 Y100.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X31.61 Y100.068 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.125521
G1 F15000
M204 S6000
G2 X31.27 Y100.297 I11.931 J18.079 E.00276
; WIPE_START
G1 X31.61 Y100.068 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X28.14 Y102.896 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0902302
G1 F15000
M204 S6000
G1 X28.111 Y102.932 E.00018
; LINE_WIDTH: 0.107931
G1 X28.02 Y103.044 E.00076
; LINE_WIDTH: 0.139251
G1 X27.928 Y103.158 E.00115
; LINE_WIDTH: 0.171616
G1 X27.849 Y103.261 E.00136
; LINE_WIDTH: 0.192059
G1 X27.77 Y103.364 E.00158
G1 X27.79 Y103.51 E.00179
; WIPE_START
G1 X27.77 Y103.364 E-.40404
G1 X27.849 Y103.261 E-.35596
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X27.191 Y104.906 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.133861
G1 F15000
M204 S6000
G1 X27.032 Y105.177 E.00233
; WIPE_START
G1 X27.191 Y104.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.836 Y106.304 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.131165
G1 F15000
M204 S6000
G1 X26.916 Y106.523 E.00167
; WIPE_START
G1 X26.836 Y106.304 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.733 Y113.936 Z2.8 F42000
G1 X26.317 Y144.682 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107163
G1 F15000
M204 S6000
G1 X26.329 Y144.619 E.00034
G1 X26.269 Y144.531 E.00056
; WIPE_START
G1 X26.329 Y144.619 E-.47245
G1 X26.317 Y144.682 E-.28755
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X32.885 Y148.248 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0992211
G1 F15000
M204 S6000
G1 X32.731 Y148.165 E.0008
M204 S10000
G1 X32.038 Y148.029 F42000
; LINE_WIDTH: 0.0951981
G1 F15000
M204 S6000
G1 X31.902 Y147.945 E.00068
; WIPE_START
G1 X32.038 Y148.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X39.671 Y148.035 Z2.8 F42000
G1 X89.563 Y148.074 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.163343
G1 F15000
M204 S6000
G1 X89.306 Y148.218 E.00289
; WIPE_START
G1 X89.563 Y148.074 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.363 Y147.334 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0983298
G1 F15000
M204 S6000
G1 X91.282 Y147.397 E.00046
; LINE_WIDTH: 0.129841
G1 X91.165 Y147.483 E.00102
; LINE_WIDTH: 0.172739
G1 X91.047 Y147.571 E.00156
; LINE_WIDTH: 0.20533
G1 X90.922 Y147.66 E.00203
; WIPE_START
G1 X91.047 Y147.571 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.06 Y148.41 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.212225
G1 F15000
M204 S6000
G1 X91.913 Y148.523 E.00255
; LINE_WIDTH: 0.183528
G1 X91.821 Y148.591 E.00131
; LINE_WIDTH: 0.149997
G1 X91.73 Y148.659 E.001
; LINE_WIDTH: 0.108938
G3 X91.591 Y148.761 I-2.653 J-3.482 E.00092
; WIPE_START
G1 X91.73 Y148.659 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.522 Y146.367 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.10422
G1 F15000
M204 S6000
G1 X94.287 Y146.626 E.00175
; LINE_WIDTH: 0.136989
G3 X93.326 Y147.587 I-16.759 J-15.797 E.01042
; LINE_WIDTH: 0.10424
G1 X93.067 Y147.822 E.00175
; WIPE_START
G1 X93.326 Y147.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.437 Y145.675 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.222788
G1 F15000
M204 S6000
G1 X92.919 Y146.221 E.01104
G1 X92.375 Y146.737 E.01099
; WIPE_START
G1 X92.919 Y146.221 E-.37917
G1 X93.437 Y145.675 E-.38083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.36 Y144.222 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.205128
G1 F15000
M204 S6000
G1 X94.269 Y144.349 E.00206
; LINE_WIDTH: 0.172314
G1 X94.183 Y144.465 E.00153
; LINE_WIDTH: 0.129628
G1 X94.096 Y144.583 E.00103
; LINE_WIDTH: 0.0981882
G1 X94.034 Y144.663 E.00046
; WIPE_START
G1 X94.096 Y144.583 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.722 Y143.334 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.130554
G1 F15000
M204 S6000
G1 X94.521 Y143.647 E.00266
; WIPE_START
G1 X94.722 Y143.334 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.866 Y143.951 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0964542
G1 F15000
M204 S6000
G1 X95.653 Y144.29 E.00175
; WIPE_START
G1 X95.866 Y143.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.03 Y141.965 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.100158
G1 F15000
M204 S6000
G1 X94.917 Y142.186 E.00116
; WIPE_START
G1 X95.03 Y141.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.041 Y134.333 Z2.8 F42000
G1 X95.082 Y106.848 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.102872
G1 F15000
M204 S6000
G1 X94.99 Y106.637 E.00112
; WIPE_START
G1 X95.082 Y106.848 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.282 Y100.914 Z2.8 F42000
G1 X89.463 Y99.901 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.10419
G1 F15000
M204 S6000
G1 X89.315 Y99.818 E.00085
; WIPE_START
G1 X89.463 Y99.901 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.831 Y99.885 Z2.8 F42000
G1 X33.125 Y99.781 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.110649
G1 F15000
M204 S6000
G1 X32.9 Y99.707 E.00131
; WIPE_START
G1 X33.125 Y99.781 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X40.732 Y99.163 Z2.8 F42000
G1 X52.477 Y98.209 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.115904
G1 F15000
M204 S6000
G1 X52.261 Y98.425 E.00182
; WIPE_START
G1 X52.477 Y98.209 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X53.153 Y92.755 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.136153
G1 F15000
M204 S6000
G1 X53.012 Y92.849 E.00129
; LINE_WIDTH: 0.1759
G2 X52.881 Y92.949 I1.193 J1.713 E.00178
; LINE_WIDTH: 0.204764
G2 X52.545 Y93.299 I1.329 J1.609 E.00641
; LINE_WIDTH: 0.163989
G1 X52.499 Y93.362 E.00077
; LINE_WIDTH: 0.135357
G1 X52.403 Y93.506 E.0013
; WIPE_START
G1 X52.499 Y93.362 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.129 Y93.152 Z2.8 F42000
G1 X69.028 Y92.908 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.101459
G1 F15000
M204 S6000
G2 X68.916 Y92.824 I-1.125 J1.371 E.00067
; OBJECT_ID: 1
; WIPE_START
G1 X69.028 Y92.908 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X71.669 Y85.748 Z2.8 F42000
G1 X90.867 Y33.701 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X90.872 Y33.705 E.00018
G3 X93.81 Y39.198 I-3.675 J5.498 E.19931
G1 X93.81 Y73.202 E1.04485
G3 X87.202 Y79.81 I-6.613 J-.005 E.31887
G1 X33.698 Y79.81 E1.64403
G3 X27.09 Y73.202 I.014 J-6.622 E.31875
G1 X27.09 Y39.198 E1.04485
G3 X33.698 Y32.59 I6.622 J.014 E.31875
G1 X87.202 Y32.59 E1.64403
G3 X90.2 Y33.311 I-.005 J6.613 E.09564
G1 X90.816 Y33.671 E.02189
; WIPE_START
M204 S6000
G1 X90.872 Y33.705 E-.02494
G1 X91.394 Y34.093 E-.24719
G1 X91.874 Y34.526 E-.24574
G1 X92.226 Y34.907 E-.1972
G1 X92.298 Y35.001 E-.04494
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.788 Y33.636 Z2.8 F42000
G1 X69.238 Y30.81 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X87.198 Y30.81 E.55187
G3 X95.59 Y39.202 I-.002 J8.394 E.40503
G1 X95.59 Y73.198 E1.0446
G3 X87.198 Y81.59 I-8.394 J-.002 E.40503
G1 X33.702 Y81.59 E1.64378
G3 X25.31 Y73.198 I.014 J-8.406 E.40487
G1 X25.31 Y39.202 E1.0446
G3 X33.702 Y30.81 I8.406 J.014 E.40487
G1 X51.662 Y30.81 E.55187
G1 X51.66 Y26.504 E.13231
G3 X52.956 Y25.21 I1.293 J-.001 E.06255
G1 X67.946 Y25.21 E.4606
G3 X69.24 Y26.504 I.001 J1.293 E.06247
G1 X69.238 Y30.75 E.13046
; WIPE_START
M204 S6000
G1 X71.238 Y30.757 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X74.712 Y37.553 Z2.8 F42000
G1 X94.655 Y76.57 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X90.57 Y80.655 E.17754
G1 X89.702 Y80.99
G1 X94.99 Y75.702 E.22982
G1 X95.187 Y74.972
G1 X88.972 Y81.187 E.27007
; WIPE_START
M204 S6000
G1 X90.386 Y79.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.415 Y79.21 Z2.8 F42000
M73 P93 R1
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X88.322 Y81.304 E.09097
G1 X87.728 Y81.364
G1 X89.462 Y79.63 E.07536
G1 X88.712 Y79.846
G1 X87.176 Y81.383 E.06675
G1 X86.643 Y81.383
G1 X88.064 Y79.962 E.06175
G1 X87.481 Y80.011
G1 X86.11 Y81.383 E.05959
G1 X85.576 Y81.383
G1 X86.942 Y80.017 E.05933
G1 X86.408 Y80.017
G1 X85.043 Y81.383 E.05933
G1 X84.51 Y81.383
G1 X85.875 Y80.017 E.05933
G1 X85.342 Y80.017
G1 X83.977 Y81.383 E.05933
G1 X83.443 Y81.383
G1 X84.809 Y80.017 E.05933
G1 X84.275 Y80.017
G1 X82.91 Y81.383 E.05933
G1 X82.377 Y81.383
G1 X83.742 Y80.017 E.05933
G1 X83.209 Y80.017
G1 X81.844 Y81.383 E.05933
G1 X81.31 Y81.383
G1 X82.676 Y80.017 E.05933
G1 X82.142 Y80.017
G1 X80.777 Y81.383 E.05933
G1 X80.244 Y81.383
G1 X81.609 Y80.017 E.05933
G1 X81.076 Y80.017
G1 X79.711 Y81.383 E.05933
G1 X79.177 Y81.383
G1 X80.543 Y80.017 E.05933
G1 X80.009 Y80.017
G1 X78.644 Y81.383 E.05933
G1 X78.111 Y81.383
G1 X79.476 Y80.017 E.05933
G1 X78.943 Y80.017
G1 X77.578 Y81.383 E.05933
G1 X77.044 Y81.383
G1 X78.41 Y80.017 E.05933
G1 X77.876 Y80.017
G1 X76.511 Y81.383 E.05933
G1 X75.978 Y81.383
G1 X77.343 Y80.017 E.05933
G1 X76.81 Y80.017
G1 X75.445 Y81.383 E.05933
G1 X74.911 Y81.383
G1 X76.277 Y80.017 E.05933
G1 X75.743 Y80.017
G1 X74.378 Y81.383 E.05933
G1 X73.845 Y81.383
G1 X75.21 Y80.017 E.05933
G1 X74.677 Y80.017
G1 X73.312 Y81.383 E.05933
G1 X72.778 Y81.383
G1 X74.143 Y80.017 E.05933
G1 X73.61 Y80.017
G1 X72.245 Y81.383 E.05933
G1 X71.712 Y81.383
G1 X73.077 Y80.017 E.05933
G1 X72.544 Y80.017
G1 X71.178 Y81.383 E.05933
G1 X70.645 Y81.383
G1 X72.01 Y80.017 E.05933
G1 X71.477 Y80.017
G1 X70.112 Y81.383 E.05933
G1 X69.579 Y81.383
G1 X70.944 Y80.017 E.05933
G1 X70.411 Y80.017
G1 X69.045 Y81.383 E.05933
G1 X68.512 Y81.383
G1 X69.877 Y80.017 E.05933
G1 X69.344 Y80.017
G1 X67.979 Y81.383 E.05933
G1 X67.446 Y81.383
G1 X68.811 Y80.017 E.05933
G1 X68.278 Y80.017
G1 X66.912 Y81.383 E.05933
G1 X66.379 Y81.383
G1 X67.744 Y80.017 E.05933
G1 X67.211 Y80.017
G1 X65.846 Y81.383 E.05933
G1 X65.313 Y81.383
G1 X66.678 Y80.017 E.05933
G1 X66.145 Y80.017
G1 X64.779 Y81.383 E.05933
G1 X64.246 Y81.383
G1 X65.611 Y80.017 E.05933
G1 X65.078 Y80.017
G1 X63.713 Y81.383 E.05933
G1 X63.18 Y81.383
G1 X64.545 Y80.017 E.05933
G1 X64.012 Y80.017
G1 X62.646 Y81.383 E.05933
G1 X62.113 Y81.383
G1 X63.478 Y80.017 E.05933
G1 X62.945 Y80.017
G1 X61.58 Y81.383 E.05933
G1 X61.047 Y81.383
G1 X62.412 Y80.017 E.05933
G1 X61.879 Y80.017
G1 X60.513 Y81.383 E.05933
G1 X59.98 Y81.383
G1 X61.345 Y80.017 E.05933
G1 X60.812 Y80.017
G1 X59.447 Y81.383 E.05933
G1 X58.914 Y81.383
G1 X60.279 Y80.017 E.05933
G1 X59.746 Y80.017
G1 X58.38 Y81.383 E.05933
G1 X57.847 Y81.383
G1 X59.212 Y80.017 E.05933
G1 X58.679 Y80.017
G1 X57.314 Y81.383 E.05933
G1 X56.781 Y81.383
G1 X58.146 Y80.017 E.05933
G1 X57.613 Y80.017
G1 X56.247 Y81.383 E.05933
G1 X55.714 Y81.383
G1 X57.079 Y80.017 E.05933
G1 X56.546 Y80.017
G1 X55.181 Y81.383 E.05933
G1 X54.648 Y81.383
G1 X56.013 Y80.017 E.05933
G1 X55.479 Y80.017
G1 X54.114 Y81.383 E.05933
G1 X53.581 Y81.383
G1 X54.946 Y80.017 E.05933
G1 X54.413 Y80.017
G1 X53.048 Y81.383 E.05933
G1 X52.514 Y81.383
G1 X53.88 Y80.017 E.05933
G1 X53.346 Y80.017
G1 X51.981 Y81.383 E.05933
G1 X51.448 Y81.383
G1 X52.813 Y80.017 E.05933
G1 X52.28 Y80.017
G1 X50.915 Y81.383 E.05933
G1 X50.381 Y81.383
G1 X51.747 Y80.017 E.05933
G1 X51.213 Y80.017
G1 X49.848 Y81.383 E.05933
G1 X49.315 Y81.383
G1 X50.68 Y80.017 E.05933
G1 X50.147 Y80.017
G1 X48.782 Y81.383 E.05933
G1 X48.248 Y81.383
G1 X49.614 Y80.017 E.05933
G1 X49.08 Y80.017
G1 X47.715 Y81.383 E.05933
G1 X47.182 Y81.383
G1 X48.547 Y80.017 E.05933
G1 X48.014 Y80.017
G1 X46.649 Y81.383 E.05933
G1 X46.115 Y81.383
G1 X47.481 Y80.017 E.05933
G1 X46.947 Y80.017
G1 X45.582 Y81.383 E.05933
G1 X45.049 Y81.383
G1 X46.414 Y80.017 E.05933
G1 X45.881 Y80.017
G1 X44.516 Y81.383 E.05933
G1 X43.982 Y81.383
G1 X45.348 Y80.017 E.05933
G1 X44.814 Y80.017
G1 X43.449 Y81.383 E.05933
G1 X42.916 Y81.383
G1 X44.281 Y80.017 E.05933
G1 X43.748 Y80.017
G1 X42.383 Y81.383 E.05933
G1 X41.849 Y81.383
G1 X43.215 Y80.017 E.05933
G1 X42.681 Y80.017
G1 X41.316 Y81.383 E.05933
G1 X40.783 Y81.383
G1 X42.148 Y80.017 E.05933
G1 X41.615 Y80.017
G1 X40.25 Y81.383 E.05933
G1 X39.716 Y81.383
G1 X41.082 Y80.017 E.05933
G1 X40.548 Y80.017
G1 X39.183 Y81.383 E.05933
G1 X38.65 Y81.383
G1 X40.015 Y80.017 E.05933
G1 X39.482 Y80.017
G1 X38.117 Y81.383 E.05933
G1 X37.583 Y81.383
G1 X38.948 Y80.017 E.05933
G1 X38.415 Y80.017
G1 X37.05 Y81.383 E.05933
G1 X36.517 Y81.383
G1 X37.882 Y80.017 E.05933
G1 X37.349 Y80.017
G1 X35.983 Y81.383 E.05933
G1 X35.45 Y81.383
G1 X36.815 Y80.017 E.05933
G1 X36.282 Y80.017
G1 X34.917 Y81.383 E.05933
G1 X34.384 Y81.383
G1 X35.749 Y80.017 E.05933
G1 X35.216 Y80.017
G1 X33.85 Y81.383 E.05933
G1 X33.327 Y81.373
G1 X34.682 Y80.017 E.05891
G1 X34.149 Y80.017
G1 X32.832 Y81.335 E.05726
G1 X32.362 Y81.271
G1 X33.617 Y80.016 E.05456
G1 X33.109 Y79.991
G1 X31.916 Y81.184 E.05185
G1 X31.489 Y81.078
G1 X32.633 Y79.933 E.04973
G1 X32.187 Y79.846
G1 X31.082 Y80.951 E.04801
G1 X30.692 Y80.808
G1 X31.765 Y79.736 E.0466
G1 X31.363 Y79.604
G1 X30.317 Y80.65 E.04544
G1 X29.958 Y80.476
G1 X30.983 Y79.451 E.04454
G1 X30.619 Y79.281
G1 X29.613 Y80.287 E.04371
G1 X29.282 Y80.085
G1 X30.274 Y79.093 E.04313
G1 X29.945 Y78.889
G1 X28.963 Y79.871 E.04265
G1 X28.657 Y79.643
G1 X29.632 Y78.669 E.04234
G1 X29.333 Y78.434
G1 X28.364 Y79.403 E.04211
G1 X28.084 Y79.15
G1 X29.05 Y78.185 E.04194
G1 X28.782 Y77.919
G1 X27.816 Y78.884 E.04194
G1 X27.561 Y78.607
G1 X28.527 Y77.64 E.04201
G1 X28.289 Y77.345
G1 X27.317 Y78.318 E.04225
G1 X27.085 Y78.016
G1 X28.065 Y77.036 E.04259
G1 X27.857 Y76.711
G1 X26.867 Y77.701 E.04301
G1 X26.663 Y77.372
G1 X27.665 Y76.369 E.04357
G1 X27.49 Y76.011
G1 X26.471 Y77.03 E.04428
G1 X26.293 Y76.675
G1 X27.333 Y75.635 E.04521
G1 X27.196 Y75.239
G1 X26.13 Y76.305 E.04631
G1 X25.984 Y75.918
G1 X27.079 Y74.823 E.0476
G1 X26.987 Y74.381
G1 X25.853 Y75.515 E.04927
G1 X25.74 Y75.095
G1 X26.921 Y73.914 E.05132
G1 X26.887 Y73.415
G1 X25.649 Y74.653 E.05378
G1 X25.578 Y74.19
G1 X26.883 Y72.886 E.05669
G1 X26.883 Y72.353
G1 X25.534 Y73.701 E.05859
G1 X25.517 Y73.185
G1 X26.883 Y71.819 E.05933
G1 X26.883 Y71.286
G1 X25.517 Y72.651 E.05933
G1 X25.517 Y72.118
G1 X26.883 Y70.753 E.05933
G1 X26.883 Y70.22
G1 X25.517 Y71.585 E.05933
G1 X25.517 Y71.052
G1 X26.883 Y69.686 E.05933
G1 X26.883 Y69.153
G1 X25.517 Y70.518 E.05933
G1 X25.517 Y69.985
G1 X26.883 Y68.62 E.05933
G1 X26.883 Y68.087
G1 X25.517 Y69.452 E.05933
G1 X25.517 Y68.919
G1 X26.883 Y67.553 E.05933
G1 X26.883 Y67.02
G1 X25.517 Y68.385 E.05933
G1 X25.517 Y67.852
G1 X26.883 Y66.487 E.05933
G1 X26.883 Y65.954
G1 X25.517 Y67.319 E.05933
G1 X25.517 Y66.786
G1 X26.883 Y65.42 E.05933
G1 X26.883 Y64.887
G1 X25.517 Y66.252 E.05933
G1 X25.517 Y65.719
G1 X26.883 Y64.354 E.05933
G1 X26.883 Y63.821
G1 X25.517 Y65.186 E.05933
G1 X25.517 Y64.653
G1 X26.883 Y63.287 E.05933
G1 X26.883 Y62.754
G1 X25.517 Y64.119 E.05933
G1 X25.517 Y63.586
G1 X26.883 Y62.221 E.05933
G1 X26.883 Y61.688
G1 X25.517 Y63.053 E.05933
G1 X25.517 Y62.52
G1 X26.883 Y61.154 E.05933
G1 X26.883 Y60.621
G1 X25.517 Y61.986 E.05933
G1 X25.517 Y61.453
G1 X26.883 Y60.088 E.05933
G1 X26.883 Y59.555
G1 X25.517 Y60.92 E.05933
G1 X25.517 Y60.387
G1 X26.883 Y59.021 E.05933
G1 X26.883 Y58.488
G1 X25.517 Y59.853 E.05933
G1 X25.517 Y59.32
G1 X26.883 Y57.955 E.05933
G1 X26.883 Y57.422
G1 X25.517 Y58.787 E.05933
G1 X25.517 Y58.254
G1 X26.883 Y56.888 E.05933
G1 X26.883 Y56.355
G1 X25.517 Y57.72 E.05933
G1 X25.517 Y57.187
G1 X26.883 Y55.822 E.05933
G1 X26.883 Y55.289
G1 X25.517 Y56.654 E.05933
G1 X25.517 Y56.12
G1 X26.883 Y54.755 E.05933
G1 X26.883 Y54.222
G1 X25.517 Y55.587 E.05933
G1 X25.517 Y55.054
G1 X26.883 Y53.689 E.05933
G1 X26.883 Y53.155
G1 X25.517 Y54.521 E.05933
G1 X25.517 Y53.987
G1 X26.883 Y52.622 E.05933
G1 X26.883 Y52.089
G1 X25.517 Y53.454 E.05933
G1 X25.517 Y52.921
G1 X26.883 Y51.556 E.05933
G1 X26.883 Y51.022
G1 X25.517 Y52.388 E.05933
G1 X25.517 Y51.854
G1 X26.883 Y50.489 E.05933
G1 X26.883 Y49.956
G1 X25.517 Y51.321 E.05933
G1 X25.517 Y50.788
G1 X26.883 Y49.423 E.05933
G1 X26.883 Y48.889
G1 X25.517 Y50.255 E.05933
G1 X25.517 Y49.721
G1 X26.883 Y48.356 E.05933
G1 X26.883 Y47.823
G1 X25.517 Y49.188 E.05933
G1 X25.517 Y48.655
G1 X26.883 Y47.29 E.05933
G1 X26.883 Y46.756
G1 X25.517 Y48.122 E.05933
G1 X25.517 Y47.588
G1 X26.883 Y46.223 E.05933
G1 X26.883 Y45.69
G1 X25.517 Y47.055 E.05933
G1 X25.517 Y46.522
G1 X26.883 Y45.157 E.05933
G1 X26.883 Y44.623
G1 X25.517 Y45.989 E.05933
G1 X25.517 Y45.455
G1 X26.883 Y44.09 E.05933
G1 X26.883 Y43.557
G1 X25.517 Y44.922 E.05933
G1 X25.517 Y44.389
G1 X26.883 Y43.024 E.05933
M73 P94 R1
G1 X26.883 Y42.49
G1 X25.517 Y43.856 E.05933
G1 X25.517 Y43.322
G1 X26.883 Y41.957 E.05933
G1 X26.883 Y41.424
G1 X25.517 Y42.789 E.05933
G1 X25.517 Y42.256
G1 X26.883 Y40.891 E.05933
G1 X26.883 Y40.357
G1 X25.517 Y41.723 E.05933
G1 X25.517 Y41.189
G1 X26.883 Y39.824 E.05933
G1 X26.883 Y39.291
G1 X25.517 Y40.656 E.05933
G1 X25.517 Y40.123
G1 X26.899 Y38.741 E.06004
G1 X26.965 Y38.142
G1 X25.517 Y39.589 E.06292
G1 X25.52 Y39.053
G1 X27.108 Y37.465 E.069
G1 X27.371 Y36.67
G1 X25.549 Y38.491 E.07915
G1 X25.625 Y37.882
G1 X27.919 Y35.588 E.09969
; WIPE_START
M204 S6000
G1 X26.505 Y37.002 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.076 Y40.885 Z2.8 F42000
G1 X93.21 Y76.415 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X95.304 Y74.322 E.09097
G1 X95.364 Y73.728
G1 X93.63 Y75.462 E.07536
G1 X93.846 Y74.712
G1 X95.383 Y73.176 E.06675
G1 X95.383 Y72.643
G1 X93.962 Y74.064 E.06175
G1 X94.011 Y73.481
G1 X95.383 Y72.11 E.05959
G1 X95.383 Y71.576
G1 X94.017 Y72.942 E.05933
G1 X94.017 Y72.408
G1 X95.383 Y71.043 E.05933
G1 X95.383 Y70.51
G1 X94.017 Y71.875 E.05933
G1 X94.017 Y71.342
G1 X95.383 Y69.977 E.05933
G1 X95.383 Y69.443
G1 X94.017 Y70.809 E.05933
G1 X94.017 Y70.275
G1 X95.383 Y68.91 E.05933
G1 X95.383 Y68.377
G1 X94.017 Y69.742 E.05933
G1 X94.017 Y69.209
G1 X95.383 Y67.844 E.05933
G1 X95.383 Y67.31
G1 X94.017 Y68.676 E.05933
G1 X94.017 Y68.142
G1 X95.383 Y66.777 E.05933
G1 X95.383 Y66.244
G1 X94.017 Y67.609 E.05933
G1 X94.017 Y67.076
G1 X95.383 Y65.711 E.05933
G1 X95.383 Y65.177
G1 X94.017 Y66.543 E.05933
G1 X94.017 Y66.009
G1 X95.383 Y64.644 E.05933
G1 X95.383 Y64.111
G1 X94.017 Y65.476 E.05933
G1 X94.017 Y64.943
G1 X95.383 Y63.578 E.05933
G1 X95.383 Y63.044
G1 X94.017 Y64.41 E.05933
G1 X94.017 Y63.876
G1 X95.383 Y62.511 E.05933
G1 X95.383 Y61.978
G1 X94.017 Y63.343 E.05933
G1 X94.017 Y62.81
G1 X95.383 Y61.445 E.05933
G1 X95.383 Y60.911
G1 X94.017 Y62.277 E.05933
G1 X94.017 Y61.743
G1 X95.383 Y60.378 E.05933
G1 X95.383 Y59.845
G1 X94.017 Y61.21 E.05933
G1 X94.017 Y60.677
G1 X95.383 Y59.312 E.05933
G1 X95.383 Y58.778
G1 X94.017 Y60.143 E.05933
G1 X94.017 Y59.61
G1 X95.383 Y58.245 E.05933
G1 X95.383 Y57.712
G1 X94.017 Y59.077 E.05933
G1 X94.017 Y58.544
G1 X95.383 Y57.178 E.05933
G1 X95.383 Y56.645
G1 X94.017 Y58.01 E.05933
G1 X94.017 Y57.477
G1 X95.383 Y56.112 E.05933
G1 X95.383 Y55.579
G1 X94.017 Y56.944 E.05933
G1 X94.017 Y56.411
G1 X95.383 Y55.045 E.05933
G1 X95.383 Y54.512
G1 X94.017 Y55.877 E.05933
G1 X94.017 Y55.344
G1 X95.383 Y53.979 E.05933
G1 X95.383 Y53.446
G1 X94.017 Y54.811 E.05933
G1 X94.017 Y54.278
G1 X95.383 Y52.912 E.05933
G1 X95.383 Y52.379
G1 X94.017 Y53.744 E.05933
G1 X94.017 Y53.211
G1 X95.383 Y51.846 E.05933
G1 X95.383 Y51.313
G1 X94.017 Y52.678 E.05933
G1 X94.017 Y52.145
G1 X95.383 Y50.779 E.05933
G1 X95.383 Y50.246
G1 X94.017 Y51.611 E.05933
G1 X94.017 Y51.078
G1 X95.383 Y49.713 E.05933
G1 X95.383 Y49.18
G1 X94.017 Y50.545 E.05933
G1 X94.017 Y50.012
G1 X95.383 Y48.646 E.05933
G1 X95.383 Y48.113
G1 X94.017 Y49.478 E.05933
G1 X94.017 Y48.945
G1 X95.383 Y47.58 E.05933
G1 X95.383 Y47.047
G1 X94.017 Y48.412 E.05933
G1 X94.017 Y47.879
G1 X95.383 Y46.513 E.05933
G1 X95.383 Y45.98
G1 X94.017 Y47.345 E.05933
G1 X94.017 Y46.812
G1 X95.383 Y45.447 E.05933
G1 X95.383 Y44.914
G1 X94.017 Y46.279 E.05933
G1 X94.017 Y45.746
G1 X95.383 Y44.38 E.05933
G1 X95.383 Y43.847
G1 X94.017 Y45.212 E.05933
G1 X94.017 Y44.679
G1 X95.383 Y43.314 E.05933
G1 X95.383 Y42.781
G1 X94.017 Y44.146 E.05933
G1 X94.017 Y43.613
G1 X95.383 Y42.247 E.05933
G1 X95.383 Y41.714
G1 X94.017 Y43.079 E.05933
G1 X94.017 Y42.546
G1 X95.383 Y41.181 E.05933
G1 X95.383 Y40.648
G1 X94.017 Y42.013 E.05933
G1 X94.017 Y41.479
G1 X95.383 Y40.114 E.05933
G1 X95.383 Y39.581
G1 X94.017 Y40.946 E.05933
G1 X94.017 Y40.413
G1 X95.38 Y39.051 E.05919
G1 X95.356 Y38.541
G1 X94.017 Y39.88 E.05816
G1 X94.017 Y39.346
G1 X95.302 Y38.062 E.0558
G1 X95.226 Y37.605
G1 X94.006 Y38.825 E.053
G1 X93.962 Y38.336
G1 X95.126 Y37.172 E.05059
G1 X95.008 Y36.756
G1 X93.888 Y37.876 E.04868
G1 X93.786 Y37.445
G1 X94.873 Y36.358 E.04722
G1 X94.72 Y35.978
G1 X93.663 Y37.034 E.04591
G1 X93.52 Y36.645
G1 X94.552 Y35.612 E.04487
G1 X94.371 Y35.26
G1 X93.357 Y36.274 E.04406
G1 X93.176 Y35.921
G1 X94.175 Y34.922 E.04341
G1 X93.965 Y34.599
G1 X92.979 Y35.585 E.04285
G1 X92.766 Y35.265
G1 X93.743 Y34.289 E.04244
G1 X93.508 Y33.99
G1 X92.538 Y34.96 E.04214
G1 X92.294 Y34.671
G1 X93.261 Y33.704 E.04201
G1 X93.001 Y33.43
G1 X92.036 Y34.395 E.04194
G1 X91.762 Y34.136
G1 X92.729 Y33.169 E.04201
G1 X92.444 Y32.921
G1 X91.475 Y33.89 E.04214
G1 X91.172 Y33.66
G1 X92.147 Y32.684 E.04239
G1 X91.838 Y32.461
G1 X90.853 Y33.445 E.0428
G1 X90.52 Y33.246
G1 X91.516 Y32.249 E.0433
G1 X91.181 Y32.051
G1 X90.168 Y33.064 E.044
G1 X89.801 Y32.898
G1 X90.83 Y31.868 E.04475
G1 X90.466 Y31.699
G1 X89.413 Y32.753 E.04578
G1 X89.005 Y32.627
G1 X90.087 Y31.545 E.04701
G1 X89.692 Y31.407
G1 X88.575 Y32.523 E.04852
G1 X88.12 Y32.446
G1 X89.278 Y31.287 E.05035
G1 X88.847 Y31.186
G1 X87.635 Y32.398 E.05266
G1 X87.117 Y32.383
G1 X88.393 Y31.106 E.05547
G1 X87.916 Y31.05
G1 X86.583 Y32.383 E.05791
G1 X86.05 Y32.383
G1 X87.411 Y31.022 E.05914
G1 X86.882 Y31.017
G1 X85.517 Y32.383 E.05933
G1 X84.984 Y32.383
G1 X86.349 Y31.017 E.05933
G1 X85.815 Y31.017
G1 X84.45 Y32.383 E.05933
G1 X83.917 Y32.383
G1 X85.282 Y31.017 E.05933
G1 X84.749 Y31.017
G1 X83.384 Y32.383 E.05933
G1 X82.85 Y32.383
G1 X84.216 Y31.017 E.05933
G1 X83.682 Y31.017
G1 X82.317 Y32.383 E.05933
G1 X81.784 Y32.383
G1 X83.149 Y31.017 E.05933
G1 X82.616 Y31.017
G1 X81.251 Y32.383 E.05933
G1 X80.717 Y32.383
G1 X82.083 Y31.017 E.05933
G1 X81.549 Y31.017
G1 X80.184 Y32.383 E.05933
G1 X79.651 Y32.383
G1 X81.016 Y31.017 E.05933
G1 X80.483 Y31.017
G1 X79.118 Y32.383 E.05933
G1 X78.584 Y32.383
G1 X79.95 Y31.017 E.05933
G1 X79.416 Y31.017
G1 X78.051 Y32.383 E.05933
G1 X77.518 Y32.383
G1 X78.883 Y31.017 E.05933
G1 X78.35 Y31.017
G1 X76.985 Y32.383 E.05933
G1 X76.451 Y32.383
G1 X77.817 Y31.017 E.05933
G1 X77.283 Y31.017
G1 X75.918 Y32.383 E.05933
G1 X75.385 Y32.383
G1 X76.75 Y31.017 E.05933
G1 X76.217 Y31.017
G1 X74.852 Y32.383 E.05933
G1 X74.318 Y32.383
G1 X75.684 Y31.017 E.05933
G1 X75.15 Y31.017
G1 X73.785 Y32.383 E.05933
G1 X73.252 Y32.383
G1 X74.617 Y31.017 E.05933
G1 X74.084 Y31.017
G1 X72.719 Y32.383 E.05933
G1 X72.185 Y32.383
G1 X73.551 Y31.017 E.05933
G1 X73.017 Y31.017
G1 X71.652 Y32.383 E.05933
G1 X71.119 Y32.383
G1 X72.484 Y31.017 E.05933
G1 X71.951 Y31.017
G1 X70.586 Y32.383 E.05933
G1 X70.052 Y32.383
G1 X71.418 Y31.017 E.05933
G1 X70.884 Y31.017
G1 X69.519 Y32.383 E.05933
G1 X68.986 Y32.383
G1 X70.351 Y31.017 E.05933
G1 X69.818 Y31.017
G1 X68.453 Y32.383 E.05933
G1 X67.919 Y32.383
G1 X69.285 Y31.017 E.05933
G1 X69.03 Y30.738
G1 X67.386 Y32.383 E.07145
G1 X66.853 Y32.383
G1 X69.031 Y30.205 E.09464
G1 X69.031 Y29.671
G1 X66.319 Y32.383 E.11782
G1 X65.786 Y32.383
G1 X69.031 Y29.138 E.14101
G1 X69.031 Y28.604
G1 X65.253 Y32.383 E.16419
G1 X64.72 Y32.383
G1 X69.032 Y28.071 E.18738
G1 X69.032 Y27.537
G1 X64.186 Y32.383 E.21056
G1 X63.653 Y32.383
G1 X69.032 Y27.003 E.23375
G1 X69.031 Y26.471
G1 X63.12 Y32.383 E.25687
G1 X62.587 Y32.383
G1 X68.929 Y26.04 E.27562
G1 X68.708 Y25.728
G1 X62.053 Y32.383 E.28916
G1 X61.52 Y32.383
G1 X68.391 Y25.512 E.29856
G1 X67.951 Y25.418
G1 X60.987 Y32.383 E.30264
G1 X60.454 Y32.383
G1 X67.419 Y25.417 E.30267
G1 X66.886 Y25.417
G1 X59.92 Y32.383 E.30267
G1 X59.387 Y32.383
G1 X66.352 Y25.417 E.30267
G1 X65.819 Y25.417
G1 X58.854 Y32.383 E.30267
G1 X58.321 Y32.383
G1 X65.286 Y25.417 E.30267
G1 X64.753 Y25.417
G1 X57.787 Y32.383 E.30267
G1 X57.254 Y32.383
G1 X64.219 Y25.417 E.30267
G1 X63.686 Y25.417
G1 X56.721 Y32.383 E.30267
G1 X56.188 Y32.383
G1 X63.153 Y25.417 E.30267
G1 X62.62 Y25.417
G1 X55.654 Y32.383 E.30267
G1 X55.121 Y32.383
G1 X62.086 Y25.417 E.30267
G1 X61.553 Y25.417
G1 X54.588 Y32.383 E.30267
G1 X54.055 Y32.383
G1 X61.02 Y25.417 E.30267
G1 X60.487 Y25.417
G1 X53.521 Y32.383 E.30267
G1 X52.988 Y32.383
G1 X59.953 Y25.417 E.30267
G1 X59.42 Y25.417
G1 X52.455 Y32.383 E.30267
G1 X51.922 Y32.383
G1 X58.887 Y25.417 E.30267
G1 X58.353 Y25.417
G1 X51.388 Y32.383 E.30267
G1 X50.855 Y32.383
G1 X57.82 Y25.417 E.30267
G1 X57.287 Y25.417
G1 X51.87 Y30.835 E.23541
G1 X51.869 Y30.302
G1 X56.754 Y25.417 E.21225
G1 X56.22 Y25.417
G1 X51.869 Y29.769 E.18909
G1 X51.869 Y29.236
G1 X55.687 Y25.417 E.16593
G1 X55.154 Y25.417
G1 X51.869 Y28.703 E.14277
G1 X51.868 Y28.17
G1 X54.621 Y25.417 E.11961
G1 X54.087 Y25.417
G1 X51.868 Y27.637 E.09645
G1 X51.868 Y27.104
G1 X53.554 Y25.417 E.07329
G1 X53.021 Y25.417
G1 X51.867 Y26.571 E.05013
; WIPE_START
M204 S6000
G1 X53.021 Y25.417 E-.6199
G1 X53.39 Y25.417 E-.14011
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X51.687 Y31.017 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
M73 P95 R1
G1 F9547.055
M204 S2000
G1 X50.322 Y32.383 E.05933
G1 X49.789 Y32.383
G1 X51.154 Y31.017 E.05933
G1 X50.62 Y31.017
G1 X49.255 Y32.383 E.05933
G1 X48.722 Y32.383
G1 X50.087 Y31.017 E.05933
G1 X49.554 Y31.017
G1 X48.189 Y32.383 E.05933
G1 X47.655 Y32.383
G1 X49.021 Y31.017 E.05933
G1 X48.487 Y31.017
G1 X47.122 Y32.383 E.05933
G1 X46.589 Y32.383
G1 X47.954 Y31.017 E.05933
G1 X47.421 Y31.017
G1 X46.056 Y32.383 E.05933
G1 X45.522 Y32.383
G1 X46.888 Y31.017 E.05933
G1 X46.354 Y31.017
G1 X44.989 Y32.383 E.05933
G1 X44.456 Y32.383
G1 X45.821 Y31.017 E.05933
G1 X45.288 Y31.017
G1 X43.923 Y32.383 E.05933
G1 X43.389 Y32.383
G1 X44.755 Y31.017 E.05933
G1 X44.221 Y31.017
G1 X42.856 Y32.383 E.05933
G1 X42.323 Y32.383
G1 X43.688 Y31.017 E.05933
G1 X43.155 Y31.017
G1 X41.79 Y32.383 E.05933
G1 X41.256 Y32.383
G1 X42.622 Y31.017 E.05933
G1 X42.088 Y31.017
G1 X40.723 Y32.383 E.05933
G1 X40.19 Y32.383
G1 X41.555 Y31.017 E.05933
G1 X41.022 Y31.017
G1 X39.657 Y32.383 E.05933
G1 X39.123 Y32.383
G1 X40.489 Y31.017 E.05933
G1 X39.955 Y31.017
G1 X38.59 Y32.383 E.05933
G1 X38.057 Y32.383
G1 X39.422 Y31.017 E.05933
G1 X38.889 Y31.017
G1 X37.524 Y32.383 E.05933
G1 X36.99 Y32.383
G1 X38.356 Y31.017 E.05933
G1 X37.822 Y31.017
G1 X36.457 Y32.383 E.05933
G1 X35.924 Y32.383
G1 X37.289 Y31.017 E.05933
G1 X36.756 Y31.017
G1 X35.391 Y32.383 E.05933
G1 X34.857 Y32.383
G1 X36.223 Y31.017 E.05933
G1 X35.689 Y31.017
G1 X34.324 Y32.383 E.05933
G1 X33.791 Y32.383
G1 X35.156 Y31.017 E.05933
G1 X34.623 Y31.017
G1 X33.241 Y32.399 E.06004
G1 X32.642 Y32.465
G1 X34.089 Y31.017 E.06292
G1 X33.553 Y31.02
G1 X31.965 Y32.608 E.069
G1 X31.17 Y32.871
G1 X32.991 Y31.049 E.07915
G1 X32.382 Y31.125
G1 X30.088 Y33.419 E.09969
; WIPE_START
M204 S6000
G1 X31.502 Y32.005 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X31.709 Y31.265 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X25.765 Y37.209 E.25833
G1 X25.997 Y36.444
G1 X30.944 Y31.497 E.21496
G1 X30.01 Y31.897
G1 X26.397 Y35.51 E.15699
; WIPE_START
M204 S6000
G1 X27.811 Y34.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.898 Y38.702 Z2.8 F42000
G1 X88.355 Y79.915 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131757
G1 F15000
M204 S6000
G1 X88.132 Y80.03 E.00182
; WIPE_START
G1 X88.355 Y79.915 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.723 Y79.939 Z2.8 F42000
G1 X33.813 Y80.087 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.122094
G1 F15000
M204 S6000
G1 X33.6 Y79.998 E.00149
; WIPE_START
G1 X33.813 Y80.087 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X31.94 Y79.827 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0915789
G1 F15000
M204 S6000
G1 X31.797 Y79.744 E.00066
; WIPE_START
G1 X31.94 Y79.827 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X39.572 Y79.781 Z2.8 F42000
G1 X89.854 Y79.478 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0979118
G1 F15000
M204 S6000
G3 X89.528 Y79.696 I-10.446 J-15.272 E.00176
; WIPE_START
G1 X89.854 Y79.478 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.003 Y78.86 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.102391
G1 F15000
M204 S6000
G1 X90.891 Y78.95 E.00069
; LINE_WIDTH: 0.131053
G1 X90.778 Y79.041 E.00104
; LINE_WIDTH: 0.162696
G1 X90.672 Y79.123 E.00131
; LINE_WIDTH: 0.206243
G1 X90.476 Y79.272 E.00326
; WIPE_START
G1 X90.672 Y79.123 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.696 Y75.528 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0979554
G1 F15000
M204 S6000
G3 X93.478 Y75.854 I-15.472 J-10.109 E.00176
M204 S10000
G1 X93.272 Y76.476 F42000
; LINE_WIDTH: 0.217521
G1 F15000
M204 S6000
G1 X93.206 Y76.565 E.00157
; LINE_WIDTH: 0.196983
G1 X93.123 Y76.672 E.00169
; LINE_WIDTH: 0.162438
G1 X93.04 Y76.78 E.00133
; LINE_WIDTH: 0.130839
G1 X92.95 Y76.891 E.00103
; LINE_WIDTH: 0.102392
G1 X92.86 Y77.003 E.00069
; WIPE_START
G1 X92.95 Y76.891 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.359 Y77.16 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0911823
G1 F15000
M204 S6000
G1 X94.333 Y77.195 E.00017
; LINE_WIDTH: 0.114755
G1 X94.235 Y77.323 E.00094
; LINE_WIDTH: 0.155847
G1 X94.136 Y77.45 E.00149
; LINE_WIDTH: 0.193649
G1 X94.036 Y77.575 E.00197
; LINE_WIDTH: 0.228164
G1 X93.935 Y77.7 E.00242
; LINE_WIDTH: 0.259512
G1 X93.833 Y77.822 E.00282
; LINE_WIDTH: 0.287708
G1 F14706.621
G1 X93.73 Y77.945 E.00319
; LINE_WIDTH: 0.323563
G1 F12827.695
G1 X93.522 Y78.184 E.00724
; LINE_WIDTH: 0.373223
G1 F10899.109
G3 X93.093 Y78.648 I-12.056 J-10.714 E.017
; LINE_WIDTH: 0.393897
G1 F10257.106
G3 X92.418 Y79.309 I-12.987 J-12.57 E.02704
; LINE_WIDTH: 0.360815
G1 F11324.495
G1 X92.183 Y79.522 E.00821
; LINE_WIDTH: 0.323544
G1 F12828.576
G1 X91.945 Y79.73 E.00724
; LINE_WIDTH: 0.287719
G1 F14705.944
G1 X91.822 Y79.833 E.00318
; LINE_WIDTH: 0.259549
G1 F15000
G1 X91.7 Y79.935 E.00282
; LINE_WIDTH: 0.228182
G1 X91.575 Y80.036 E.00242
; LINE_WIDTH: 0.19361
G1 X91.45 Y80.136 E.00197
; LINE_WIDTH: 0.15582
G1 X91.323 Y80.235 E.00148
; LINE_WIDTH: 0.109789
G3 X91.16 Y80.359 I-3.188 J-3.995 E.00111
; WIPE_START
G1 X91.323 Y80.235 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.833 Y76.156 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.171777
G1 F15000
M204 S6000
G1 X94.713 Y76.332 E.00223
; LINE_WIDTH: 0.198727
G1 X94.593 Y76.508 E.0027
; WIPE_START
G1 X94.713 Y76.332 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.03 Y74.132 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.131723
G1 F15000
M204 S6000
G1 X93.915 Y74.355 E.00181
; WIPE_START
G1 X94.03 Y74.132 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.481 Y67.375 Z2.8 F42000
G1 X68.55 Y25.62 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0977075
G1 F15000
M204 S6000
G2 X68.444 Y25.538 I-1.079 J1.292 E.0006
; WIPE_START
G1 X68.55 Y25.62 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.917 Y25.65 Z2.8 F42000
G1 X52.213 Y25.685 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.095763
G1 F15000
M204 S6000
G1 X51.895 Y26.254 E.00281
; WIPE_START
G1 X52.213 Y25.685 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X52.699 Y25.439 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.160668
G1 F15000
M204 S6000
G1 X52.517 Y25.56 E.0021
; LINE_WIDTH: 0.199898
G2 X52.387 Y25.658 I1.187 J1.703 E.00208
; LINE_WIDTH: 0.228437
G2 X52.056 Y26.004 I1.314 J1.591 E.00726
; LINE_WIDTH: 0.188131
G1 X51.88 Y26.246 E.00353
; WIPE_START
G1 X52.056 Y26.004 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X51.94 Y30.905 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.152866
G1 F15000
M204 S6000
G3 X51.757 Y31.088 I-.23 J-.047 E.00245
; WIPE_START
G1 X51.851 Y31.049 E-.28157
G1 X51.901 Y30.999 E-.19732
G1 X51.94 Y30.905 E-.28111
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X44.342 Y31.629 Z2.8 F42000
G1 X31.183 Y32.884 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.170854
G1 F15000
M204 S6000
G1 X31.036 Y32.855 E.00155
; LINE_WIDTH: 0.187097
G1 X30.937 Y32.923 E.00141
; LINE_WIDTH: 0.14234
G1 X30.837 Y32.991 E.00098
; LINE_WIDTH: 0.104015
G1 X30.741 Y33.06 E.00059
M204 S10000
G1 X30.027 Y33.358 F42000
; LINE_WIDTH: 0.217425
G1 F15000
M204 S6000
G1 X29.876 Y33.48 E.00276
; LINE_WIDTH: 0.182582
G1 X29.669 Y33.654 E.00308
; LINE_WIDTH: 0.140285
G1 X29.466 Y33.83 E.00214
; LINE_WIDTH: 0.102697
G1 X29.16 Y34.112 E.00203
; WIPE_START
G1 X29.466 Y33.83 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X29.321 Y32.291 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107002
G1 F15000
M204 S6000
G1 X29.167 Y32.415 E.00103
; LINE_WIDTH: 0.140026
G1 X29.043 Y32.518 E.00127
; LINE_WIDTH: 0.168407
G1 X28.92 Y32.622 E.00164
; LINE_WIDTH: 0.204519
G1 X28.679 Y32.831 E.0042
; LINE_WIDTH: 0.25455
G2 X28.212 Y33.263 I10.782 J12.133 E.01097
; LINE_WIDTH: 0.275373
G2 X27.545 Y33.943 I12.654 J13.074 E.01805
; LINE_WIDTH: 0.242066
G1 X27.331 Y34.18 E.00517
; LINE_WIDTH: 0.204507
G1 X27.122 Y34.42 E.0042
; LINE_WIDTH: 0.168402
G1 X27.018 Y34.543 E.00164
; LINE_WIDTH: 0.140029
G1 X26.915 Y34.667 E.00127
; LINE_WIDTH: 0.107002
G1 X26.791 Y34.821 E.00103
; WIPE_START
G1 X26.915 Y34.667 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X28.612 Y34.66 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.102774
G1 F15000
M204 S6000
G1 X28.329 Y34.967 E.00204
; LINE_WIDTH: 0.140547
G1 X28.152 Y35.171 E.00215
; LINE_WIDTH: 0.18307
G1 X27.978 Y35.379 E.0031
; LINE_WIDTH: 0.217599
G1 X27.858 Y35.527 E.00272
M204 S10000
G1 X27.56 Y36.241 F42000
; LINE_WIDTH: 0.104229
G1 F15000
M204 S6000
G1 X27.49 Y36.338 E.0006
; LINE_WIDTH: 0.142632
G1 X27.423 Y36.437 E.00097
; LINE_WIDTH: 0.178097
G1 X27.355 Y36.536 E.00132
G1 X27.384 Y36.683 E.00164
; WIPE_START
G1 X27.355 Y36.536 E-.42123
G1 X27.423 Y36.437 E-.33877
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.459 Y35.572 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.201225
G1 F15000
M204 S6000
G1 X26.381 Y35.681 E.00173
; LINE_WIDTH: 0.171267
G1 X26.303 Y35.79 E.0014
; LINE_WIDTH: 0.139253
G1 X26.245 Y35.875 E.00081
; LINE_WIDTH: 0.105192
G1 X26.187 Y35.961 E.00052
; WIPE_START
G1 X26.245 Y35.875 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.428 Y43.506 Z2.8 F42000
G1 X27.188 Y75.207 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0907141
G1 F15000
M204 S6000
G1 X27.103 Y75.065 E.00064
; WIPE_START
G1 X27.188 Y75.207 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.815 Y73.343 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.101125
G1 F15000
M204 S6000
G1 X26.901 Y73.134 E.00107
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X26.815 Y73.343 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 13/15
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S201.45
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I.467 J1.124 P1  F42000
G1 X137.133 Y27.459 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F7513
M204 S5000
G2 X138.021 Y28.446 I3.605 J-2.348 E.03644
G3 X138.461 Y29.212 I-.866 J1.007 E.02465
G3 X137.818 Y29.937 I-.648 J.073 E.02987
G3 X137.013 Y29.631 I-.145 J-.832 E.0247
G3 X136.924 Y29.409 I.875 J-.478 E.00655
G1 X137.117 Y29.39 E.00529
G2 X138.244 Y29.077 I.571 J-.129 E.05185
G2 X137.923 Y28.575 I-1.129 J.367 E.01646
G3 X136.994 Y27.591 I4.53 J-5.21 E.03707
G3 X136.867 Y27.302 I1.138 J-.671 E.00866
G1 X138.465 Y27.302 E.04369
G1 X138.465 Y27.459 E.00429
G1 X137.193 Y27.459 E.03477
; WIPE_START
G1 F10727.314
M204 S6000
G1 X137.487 Y27.934 E-.21246
G1 X138.021 Y28.446 E-.28081
G1 X138.202 Y28.641 E-.10139
G1 X138.375 Y28.909 E-.12114
G1 X138.418 Y29.017 E-.0442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.22 Y27.98 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X139.55 Y28.131 I-.817 J.273 E.06309
G2 X139.599 Y29.27 I2.405 J.468 E.03149
G2 X141.197 Y29.371 I.821 J-.3 E.05535
G1 X141.424 Y29.431 E.00642
G3 X140.471 Y29.981 I-.87 J-.407 E.03204
G3 X139.275 Y28.891 I-.036 J-1.162 E.04893
G3 X139.504 Y27.701 I1.621 J-.305 E.03395
G3 X140.467 Y27.252 I.915 J.705 E.03018
G3 X141.441 Y27.91 I.058 J.965 E.03455
G1 X141.278 Y27.961 E.0047
; WIPE_START
G1 F10727.314
M204 S6000
G1 X141.108 Y27.752 E-.10253
G1 X141.028 Y27.649 E-.04952
G1 X140.835 Y27.495 E-.0938
G1 X140.652 Y27.419 E-.07525
G1 X140.508 Y27.394 E-.05567
G1 X140.288 Y27.401 E-.08334
G1 X140.043 Y27.472 E-.0971
G1 X139.819 Y27.627 E-.10364
G1 X139.661 Y27.83 E-.09762
G1 X139.66 Y27.834 E-.00152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.337 Y29.74 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X142.584 Y29.494 I-.288 J-.393 E.0253
G3 X142.539 Y27.855 I4.123 J-.934 E.04512
G3 X142.952 Y27.359 I.58 J.064 E.01868
G3 X143.518 Y27.699 I.084 J.502 E.01965
G3 X143.605 Y28.978 I-3.766 J.898 E.03522
G3 X143.505 Y29.518 I-1.842 J-.059 E.01507
G3 X143.383 Y29.702 I-.456 J-.17 E.0061
; WIPE_START
G1 F10727.314
M204 S6000
G1 X143.208 Y29.818 E-.07983
G1 X143.05 Y29.844 E-.06083
G1 X142.886 Y29.815 E-.0633
G1 X142.743 Y29.733 E-.06266
G1 X142.64 Y29.611 E-.06082
G1 X142.584 Y29.494 E-.04913
G1 X142.541 Y29.342 E-.0599
G1 X142.497 Y28.931 E-.1573
G1 X142.497 Y28.493 E-.16623
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.415 Y27.642 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X143.075 Y27.252 I.633 J.319 E.02212
G3 X143.739 Y27.796 I-.002 J.679 E.0254
G3 X143.711 Y29.472 I-3.076 J.788 E.04639
G3 X142.364 Y29.397 I-.664 J-.223 E.04988
G3 X142.397 Y27.699 I2.923 J-.792 E.04708
; WIPE_START
G1 F10727.314
M204 S6000
G1 X142.491 Y27.518 E-.0776
G1 X142.65 Y27.368 E-.08287
G1 X142.809 Y27.288 E-.06787
G1 X142.942 Y27.258 E-.05154
G1 X143.075 Y27.252 E-.05069
G1 X143.306 Y27.289 E-.08904
G1 X143.41 Y27.335 E-.0431
G1 X143.521 Y27.419 E-.05274
G1 X143.66 Y27.604 E-.08816
G1 X143.739 Y27.796 E-.07881
G1 X143.779 Y27.996 E-.07758
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.886 Y28.721 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G1 X145.064 Y29.728 E.02797
G1 X146.121 Y29.728 E.02889
G1 X146.121 Y29.889 E.0044
G1 X144.943 Y29.889 E.0322
G1 X144.713 Y28.672 E.03385
G1 X144.892 Y28.646 E.00494
G2 X146.04 Y28.11 I.486 J-.455 E.04575
G2 X145.615 Y27.366 I-.746 J-.067 E.02494
G2 X144.853 Y27.74 I-.19 J.576 E.02571
G1 X144.656 Y27.72 E.00543
G3 X145.45 Y27.254 I.696 J.277 E.0271
G3 X146.248 Y28.238 I-.028 J.838 E.03927
G3 X145.298 Y28.894 I-.73 J-.042 E.03637
G1 X144.942 Y28.744 E.01058
; OBJECT_ID: 4
; WIPE_START
G1 F10727.314
M204 S6000
G1 X145.064 Y29.728 E-.37678
G1 X146.073 Y29.728 E-.38322
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X144.594 Y37.216 Z3 F42000
G1 X131.127 Y105.437 Z3
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X131.227 Y104.877 I-.453 J-.371 E.01625
G2 X130.905 Y104.373 I-1.061 J.324 E.01656
G3 X129.978 Y103.391 I4.521 J-5.198 E.037
G3 X129.851 Y103.102 I1.14 J-.672 E.00866
G1 X131.449 Y103.102 E.04369
G1 X131.449 Y103.258 E.00429
G1 X130.114 Y103.258 E.03649
G2 X131.004 Y104.245 I3.676 J-2.421 E.03648
G3 X131.445 Y105.012 I-.865 J1.007 E.02466
G3 X130.802 Y105.737 I-.648 J.072 E.02986
G3 X129.997 Y105.431 I-.145 J-.832 E.0247
G3 X129.908 Y105.209 I.874 J-.477 E.00655
G1 X130.101 Y105.19 E.00529
G2 X131.086 Y105.482 I.572 J-.123 E.03429
; WIPE_START
G1 F10727.314
M204 S6000
G1 X131.194 Y105.336 E-.06864
G1 X131.246 Y105.123 E-.08339
G1 X131.227 Y104.877 E-.09391
G1 X131.186 Y104.756 E-.04851
G1 X131.084 Y104.574 E-.07944
G1 X130.905 Y104.373 E-.10205
G1 X130.372 Y103.85 E-.28407
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.589 Y103.23 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G1 X132.589 Y105.705 E.06769
G1 X132.361 Y105.705 E.00625
G1 X132.361 Y103.102 E.07119
G1 X134.098 Y103.102 E.04753
G1 X134.098 Y103.23 E.0035
G1 X132.649 Y103.23 E.03964
; WIPE_START
G1 F10727.314
M204 S6000
G1 X132.601 Y105.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.262 Y105.528 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X135.101 Y105.294 I.304 J-.383 E.0079
G3 X135.055 Y103.654 I4.125 J-.934 E.04514
G3 X135.468 Y103.159 I.58 J.064 E.01867
G3 X136.034 Y103.499 I.084 J.502 E.01965
G3 X136.13 Y104.395 I-3.503 J.828 E.02472
G3 X136.038 Y105.276 I-3.189 J.111 E.0243
G3 X135.312 Y105.562 I-.471 J-.132 E.02471
M204 S250
G1 X134.989 Y105.446 F42000
G1 F7513
M204 S5000
G3 X134.88 Y105.198 I.576 J-.399 E.00746
G3 X134.932 Y103.442 I2.919 J-.794 E.04876
G3 X135.591 Y103.052 I.631 J.316 E.02214
G3 X136.255 Y103.596 I-.002 J.679 E.0254
G3 X136.227 Y105.272 I-3.075 J.788 E.04641
G3 X135.025 Y105.494 I-.663 J-.225 E.04064
; WIPE_START
G1 F10727.314
M204 S6000
G1 X134.88 Y105.198 E-.12529
G1 X134.795 Y104.743 E-.17593
G1 X134.783 Y104.233 E-.19387
G1 X134.836 Y103.745 E-.1866
G1 X134.898 Y103.548 E-.07831
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.289 Y104.795 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X138.148 Y104.66 I-.437 J.314 E.00537
G2 X137.879 Y104.559 I-.498 J.914 E.00788
G1 X137.871 Y104.499 E.00166
G1 X137.917 Y104.501 E.00127
G1 X138.354 Y104.762 E.01391
G3 X138.273 Y105.647 I-.291 J.42 E.0295
G3 X137.275 Y105.475 I-.388 J-.725 E.02983
G3 X137.189 Y105.297 I1.109 J-.653 E.0054
G1 X137.34 Y105.272 E.0042
G2 X138.321 Y104.846 I.513 J-.162 E.04921
M204 S250
G1 X138.305 Y104.343 F42000
G1 F7513
M204 S5000
G2 X138.129 Y103.197 I-.52 J-.507 E.03673
G2 X137.321 Y103.57 I-.224 J.577 E.02715
G1 X137.138 Y103.547 E.00504
G3 X138.006 Y103.056 I.728 J.273 E.02963
G3 X138.629 Y104.126 I-.04 J.74 E.0401
G3 X138.363 Y104.325 I-.467 J-.348 E.00923
; OBJECT_ID: 5
; WIPE_START
G1 F10727.314
M204 S6000
G1 X138.41 Y104.217 E-.04499
G1 X138.481 Y104.044 E-.07102
G1 X138.505 Y103.84 E-.0781
G1 X138.497 Y103.715 E-.04752
G1 X138.444 Y103.517 E-.07773
G1 X138.393 Y103.424 E-.04056
G1 X138.258 Y103.275 E-.07624
G1 X138.129 Y103.197 E-.05742
G1 X137.956 Y103.152 E-.06787
G1 X137.835 Y103.151 E-.04572
G1 X137.628 Y103.209 E-.08156
G1 X137.527 Y103.272 E-.04528
G1 X137.478 Y103.319 E-.02601
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X145.099 Y103.739 Z3 F42000
G1 X175.927 Y105.436 Z3
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X176.027 Y104.875 I-.453 J-.371 E.01626
G2 X175.705 Y104.372 I-1.06 J.323 E.01655
G3 X174.778 Y103.39 I4.52 J-5.198 E.037
G3 X174.651 Y103.1 I1.14 J-.671 E.00866
G1 X176.249 Y103.1 E.04369
G1 X176.249 Y103.257 E.00429
G1 X174.917 Y103.257 E.03641
G2 X175.804 Y104.244 I3.605 J-2.349 E.03644
G3 X176.245 Y105.011 I-.866 J1.007 E.02465
G3 X175.602 Y105.735 I-.648 J.073 E.02986
G3 X174.797 Y105.43 I-.145 J-.832 E.02471
G3 X174.708 Y105.208 I.873 J-.477 E.00655
G1 X174.901 Y105.188 E.00529
G2 X175.886 Y105.48 I.572 J-.123 E.03429
; WIPE_START
G1 F10727.314
M204 S6000
G1 X175.994 Y105.335 E-.06856
G1 X176.046 Y105.122 E-.08335
G1 X176.027 Y104.875 E-.09413
G1 X175.986 Y104.754 E-.04875
G1 X175.884 Y104.573 E-.07918
G1 X175.705 Y104.372 E-.10198
G1 X175.172 Y103.848 E-.28405
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.389 Y103.228 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G1 X177.389 Y105.704 E.06769
G1 X177.161 Y105.704 E.00625
G1 X177.161 Y103.1 E.07119
G1 X178.898 Y103.1 E.04752
G1 X178.898 Y103.228 E.0035
G1 X177.449 Y103.228 E.03964
; WIPE_START
G1 F10727.314
M204 S6000
G1 X177.401 Y105.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X180.209 Y105.608 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X179.901 Y105.292 I.158 J-.462 E.01252
G3 X179.855 Y103.653 I4.123 J-.934 E.04513
G3 X180.281 Y103.155 I.577 J.062 E.01902
G3 X180.834 Y103.497 I.071 J.505 E.01929
G3 X180.93 Y104.394 I-3.501 J.828 E.02473
G3 X180.838 Y105.275 I-3.187 J.112 E.02431
G3 X180.267 Y105.624 I-.471 J-.129 E.02016
M204 S250
G1 X180.826 Y105.574 F42000
G1 F7513
M204 S5000
G3 X179.68 Y105.196 I-.462 J-.526 E.03981
G3 X179.732 Y103.44 I2.923 J-.792 E.04873
G3 X180.391 Y103.051 I.631 J.316 E.02213
G3 X181.055 Y103.595 I.003 J.673 E.02545
G3 X181.028 Y105.271 I-3.076 J.788 E.04639
G3 X180.87 Y105.532 I-.664 J-.223 E.00842
; WIPE_START
G1 F10727.314
M204 S6000
G1 X180.719 Y105.658 E-.07475
G1 X180.632 Y105.698 E-.03638
G1 X180.474 Y105.734 E-.06163
G1 X180.261 Y105.734 E-.08073
G1 X180.056 Y105.68 E-.08076
G1 X179.898 Y105.573 E-.07255
G1 X179.759 Y105.387 E-.08811
G1 X179.68 Y105.196 E-.07871
G1 X179.595 Y104.742 E-.17548
G1 X179.594 Y104.713 E-.0109
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X182.203 Y104.52 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G1 X182.38 Y105.526 E.02796
G1 X183.437 Y105.526 E.02889
G1 X183.437 Y105.687 E.0044
G1 X182.259 Y105.687 E.0322
G1 X182.03 Y104.471 E.03385
G1 X182.208 Y104.445 E.00494
G2 X183.248 Y104.365 I.487 J-.464 E.03263
G2 X183.186 Y103.345 I-.926 J-.456 E.02923
G2 X182.17 Y103.539 I-.452 J.391 E.03422
G1 X181.972 Y103.518 E.00543
G3 X182.766 Y103.052 I.696 J.277 E.0271
G3 X183.564 Y104.036 I-.028 J.838 E.03927
G3 X182.618 Y104.693 I-.731 J-.042 E.03627
G1 X182.258 Y104.543 E.01067
; OBJECT_ID: 6
; WIPE_START
G1 F10727.314
M204 S6000
G1 X182.38 Y105.526 E-.37667
G1 X183.389 Y105.526 E-.38334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X191.022 Y105.507 Z3 F42000
G1 X221.322 Y105.432 Z3
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X221.427 Y104.876 I-.45 J-.374 E.01617
G2 X221.105 Y104.372 I-1.061 J.324 E.01655
G3 X220.178 Y103.39 I4.523 J-5.2 E.037
G3 X220.051 Y103.101 I1.139 J-.671 E.00866
G1 X221.649 Y103.101 E.04369
G1 X221.649 Y103.257 E.00429
G1 X220.315 Y103.257 E.03648
G2 X221.204 Y104.244 I3.667 J-2.411 E.03647
G3 X221.645 Y105.011 I-.866 J1.008 E.02466
G3 X221.002 Y105.736 I-.648 J.073 E.02987
G3 X220.197 Y105.43 I-.145 J-.832 E.0247
G3 X220.108 Y105.208 I.871 J-.476 E.00655
G1 X220.301 Y105.189 E.00529
G2 X221.281 Y105.476 I.571 J-.13 E.03397
; WIPE_START
G1 F10727.314
M204 S6000
G1 X221.394 Y105.336 E-.0684
G1 X221.446 Y105.123 E-.08336
G1 X221.427 Y104.876 E-.09405
G1 X221.386 Y104.755 E-.04839
G1 X221.284 Y104.573 E-.0795
G1 X221.105 Y104.372 E-.10203
G1 X220.571 Y103.848 E-.28427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X222.789 Y103.229 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G1 X222.789 Y105.704 E.06769
G1 X222.561 Y105.704 E.00625
G1 X222.561 Y103.101 E.07119
G1 X224.298 Y103.101 E.04753
G1 X224.298 Y103.229 E.0035
G1 X222.849 Y103.229 E.03964
; WIPE_START
G1 F10727.314
M204 S6000
G1 X222.801 Y105.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X225.365 Y105.427 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X225.3 Y105.289 I.402 J-.274 E.00418
G3 X225.255 Y103.653 I4.128 J-.93 E.04504
G3 X225.668 Y103.158 I.579 J.063 E.01868
G3 X226.234 Y103.497 I.085 J.5 E.01964
G3 X226.33 Y104.394 I-3.497 J.828 E.02474
G3 X226.236 Y105.28 I-3.154 J.113 E.02443
G3 X225.401 Y105.475 I-.47 J-.126 E.02869
; WIPE_START
G1 F10727.314
M204 S6000
G1 X225.3 Y105.289 E-.08033
G1 X225.257 Y105.141 E-.05862
G1 X225.213 Y104.729 E-.1573
G1 X225.214 Y104.013 E-.2724
G1 X225.255 Y103.653 E-.13744
G1 X225.296 Y103.517 E-.0539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X225.132 Y103.44 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X225.791 Y103.051 I.631 J.316 E.02213
G3 X226.455 Y103.595 I-.002 J.679 E.0254
G3 X226.428 Y105.271 I-3.076 J.788 E.0464
G3 X225.08 Y105.196 I-.664 J-.223 E.04987
G3 X225.113 Y103.497 I2.923 J-.792 E.04709
; WIPE_START
G1 F10727.314
M204 S6000
G1 X225.207 Y103.316 E-.07751
G1 X225.366 Y103.166 E-.08284
G1 X225.518 Y103.089 E-.06508
G1 X225.658 Y103.056 E-.05436
G1 X225.791 Y103.051 E-.05072
G1 X226.022 Y103.088 E-.08905
G1 X226.126 Y103.134 E-.0431
G1 X226.237 Y103.217 E-.05273
G1 X226.376 Y103.403 E-.08808
G1 X226.455 Y103.595 E-.0789
G1 X226.495 Y103.795 E-.07763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X228.22 Y104.465 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X227.537 Y104.058 I-.107 J-.597 E.02371
G3 X227.986 Y103.144 I.649 J-.248 E.03124
G3 X228.717 Y103.821 I.11 J.615 E.03153
G3 X228.279 Y104.451 I-.604 J.048 E.02276
M204 S250
G1 X228.175 Y104.509 F42000
G1 F7513
M204 S5000
G1 X228.352 Y104.612 E.0056
G2 X227.963 Y104.574 I-.256 J.608 E.01086
G1 X228.063 Y104.523 E.00307
G1 X227.601 Y104.31 E.01392
G3 X227.94 Y103.062 I.392 J-.564 E.04614
G3 X228.24 Y103.053 I.197 J1.631 E.00824
G3 X228.749 Y104.209 I-.043 J.709 E.04258
G3 X228.607 Y104.314 I-.432 J-.434 E.00483
G1 X228.23 Y104.484 E.01132
M204 S250
G1 X227.726 Y104.694 F42000
G1 F7513
M204 S5000
G2 X228.616 Y105.322 I.376 J.412 E.05452
M73 P96 R1
G2 X228.389 Y104.633 I-.541 J-.204 E.02144
G1 X228.611 Y104.762 E.00703
G3 X228.29 Y105.727 I-.344 J.421 E.03589
G3 X227.63 Y105.626 I-.184 J-1.008 E.01857
G3 X227.671 Y104.718 I.277 J-.443 E.03016
; OBJECT_ID: 9
; WIPE_START
G1 F10727.314
M204 S6000
G1 X227.607 Y104.849 E-.05544
G1 X227.572 Y104.946 E-.03913
G1 X227.555 Y105.169 E-.08482
G1 X227.606 Y105.367 E-.07782
G1 X227.667 Y105.465 E-.04382
G1 X227.747 Y105.546 E-.04353
G1 X227.933 Y105.64 E-.0792
G1 X228.048 Y105.66 E-.04434
G1 X228.264 Y105.643 E-.0823
G1 X228.362 Y105.607 E-.03968
G1 X228.5 Y105.507 E-.06466
G1 X228.616 Y105.322 E-.08297
G1 X228.625 Y105.264 E-.02229
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X222.552 Y109.887 Z3 F42000
G1 X139.19 Y173.334 Z3
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X139.294 Y172.776 I-.452 J-.372 E.01621
G2 X138.972 Y172.272 I-1.061 J.324 E.01655
G3 X138.044 Y171.29 I4.519 J-5.197 E.037
G3 X137.917 Y171.001 I1.14 J-.672 E.00866
G1 X139.515 Y171.001 E.04369
G1 X139.515 Y171.157 E.00429
G1 X138.183 Y171.157 E.03644
G2 X139.07 Y172.144 I3.628 J-2.372 E.03644
G3 X139.511 Y172.911 I-.865 J1.007 E.02466
G3 X138.868 Y173.636 I-.648 J.072 E.02986
G3 X138.063 Y173.33 I-.144 J-.832 E.0247
G3 X137.974 Y173.108 I.873 J-.477 E.00656
G1 X138.167 Y173.089 E.00529
G2 X139.15 Y173.378 I.572 J-.127 E.03414
; WIPE_START
G1 F10727.314
M204 S6000
G1 X139.26 Y173.236 E-.0684
G1 X139.313 Y173.023 E-.08337
G1 X139.294 Y172.776 E-.09413
G1 X139.252 Y172.655 E-.04833
G1 X139.15 Y172.473 E-.07954
G1 X138.972 Y172.272 E-.10205
G1 X138.438 Y171.748 E-.28419
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.082 Y172.53 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X141.773 Y173.487 I-.388 J.403 E.0342
G3 X140.641 Y173.499 I-.701 J-13.037 E.03096
G1 X140.641 Y172.357 E.03123
G3 X141.764 Y172.378 I.35 J11.466 E.03072
G3 X142.037 Y172.491 I-.07 J.555 E.00817
M204 S250
G1 X141.405 Y172.227 F42000
G1 F7513
M204 S5000
G1 X142.035 Y172.363 E.01761
G3 X142.391 Y173.347 I-.178 J.621 E.03335
G3 X141.812 Y173.617 I-.543 J-.41 E.01817
G3 X140.412 Y173.629 I-.857 J-18.747 E.03829
G1 X140.412 Y171.001 E.07186
G1 X140.641 Y171.001 E.00625
G1 X140.641 Y172.259 E.0344
G2 X141.389 Y172.183 I.185 J-1.905 E.0207
G2 X141.772 Y171.785 I-.526 J-.891 E.0153
G1 X142.301 Y171.001 E.02586
G1 X142.584 Y171.001 E.00775
G3 X142.012 Y171.818 I-3.45 J-1.807 E.02738
G1 X141.455 Y172.193 E.01835
; WIPE_START
G1 F10727.314
M204 S6000
G1 X142.035 Y172.363 E-.22956
G1 X142.206 Y172.435 E-.07054
G1 X142.3 Y172.501 E-.04374
G1 X142.39 Y172.605 E-.05243
G1 X142.454 Y172.731 E-.05356
G1 X142.483 Y172.849 E-.04602
G1 X142.487 Y173.069 E-.08389
G1 X142.453 Y173.22 E-.05883
G1 X142.391 Y173.347 E-.05362
G1 X142.283 Y173.473 E-.06318
G1 X142.272 Y173.48 E-.00464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.466 Y171.221 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X144.568 Y171.397 I-.381 J.339 E.0056
G3 X144.664 Y172.294 I-3.499 J.827 E.02473
G3 X144.57 Y173.18 I-3.153 J.113 E.02444
G3 X143.634 Y173.193 I-.47 J-.133 E.03418
G3 X143.589 Y171.554 I4.12 J-.934 E.04512
G3 X144.016 Y171.055 I.577 J.062 E.01908
G3 X144.423 Y171.179 I.069 J.505 E.01201
M204 S250
G1 X143.465 Y171.341 F42000
G1 F7513
M204 S5000
G3 X144.125 Y170.951 I.631 J.315 E.02215
G3 X144.789 Y171.495 I-.002 J.679 E.02541
G3 X144.761 Y173.171 I-3.076 J.788 E.04639
G3 X143.414 Y173.096 I-.663 J-.225 E.04977
G3 X143.447 Y171.398 I2.923 J-.792 E.04708
; WIPE_START
G1 F10727.314
M204 S6000
G1 X143.541 Y171.216 E-.07776
G1 X143.699 Y171.066 E-.08276
G1 X143.852 Y170.989 E-.06495
G1 X143.992 Y170.956 E-.05458
G1 X144.125 Y170.951 E-.05069
G1 X144.356 Y170.988 E-.08913
G1 X144.46 Y171.034 E-.04302
G1 X144.571 Y171.117 E-.05274
G1 X144.71 Y171.303 E-.0881
G1 X144.789 Y171.495 E-.07893
G1 X144.829 Y171.695 E-.07733
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.214 Y172.339 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X145.762 Y172.057 I.291 J-.973 E.01475
G3 X146.357 Y170.952 I.59 J-.395 E.04212
G3 X146.574 Y170.953 I.098 J1.644 E.00594
G3 X147.082 Y172.109 I-.039 J.707 E.04267
G3 X146.681 Y172.331 I-.697 J-.789 E.01263
G2 X147.043 Y171.586 I-.3 J-.606 E.02437
G2 X145.843 Y171.58 I-.6 J.052 E.04875
G2 X146.161 Y172.311 I.659 J.148 E.02329
M204 S250
G1 X146.217 Y172.34 F42000
G1 F7513
M204 S5000
G2 X146.678 Y172.332 I.219 J-.653 E.01285
G1 X146.509 Y172.408 E.00508
G1 X146.688 Y172.513 E.00567
G2 X146.308 Y172.472 I-.258 J.609 E.01059
G1 X146.403 Y172.425 E.00288
G1 X146.272 Y172.365 E.00393
M204 S250
G1 X146.061 Y172.593 F42000
G1 F7513
M204 S5000
G2 X146.95 Y173.222 I.375 J.413 E.05455
G2 X146.716 Y172.529 I-.541 J-.204 E.02166
G1 X146.945 Y172.662 E.00725
G3 X146.623 Y173.627 I-.344 J.421 E.03589
G3 X145.837 Y173.409 I-.2 J-.806 E.02333
G3 X146.005 Y172.616 I.392 J-.331 E.02555
; OBJECT_ID: 8
; WIPE_START
G1 F10727.314
M204 S6000
G1 X145.941 Y172.749 E-.056
G1 X145.908 Y172.841 E-.03734
G1 X145.888 Y173.068 E-.08665
G1 X145.94 Y173.267 E-.07789
G1 X146 Y173.365 E-.04384
G1 X146.081 Y173.446 E-.04352
G1 X146.272 Y173.542 E-.08096
G1 X146.379 Y173.56 E-.04136
G1 X146.598 Y173.543 E-.08351
G1 X146.696 Y173.507 E-.03965
G1 X146.833 Y173.407 E-.06467
G1 X146.95 Y173.222 E-.08299
G1 X146.959 Y173.166 E-.02163
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X139.326 Y173.19 Z3 F42000
G1 X93.788 Y173.332 Z3
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X93.894 Y172.776 I-.451 J-.374 E.01616
G2 X93.573 Y172.273 I-1.128 J.366 E.01648
G3 X92.644 Y171.29 I4.527 J-5.206 E.03705
G3 X92.517 Y171 I1.141 J-.672 E.00866
G1 X94.115 Y171 E.04369
G1 X94.115 Y171.157 E.00429
G1 X92.783 Y171.157 E.03641
G2 X93.671 Y172.144 I3.604 J-2.347 E.03644
G3 X94.115 Y172.992 I-.779 J.948 E.02689
G3 X93.468 Y173.635 I-.646 J-.002 E.02771
G3 X92.663 Y173.33 I-.145 J-.832 E.0247
G3 X92.574 Y173.108 I.874 J-.477 E.00655
G1 X92.767 Y173.088 E.00529
G2 X93.748 Y173.376 I.571 J-.13 E.03398
; WIPE_START
G1 F10727.314
M204 S6000
G1 X93.86 Y173.235 E-.0683
G1 X93.913 Y173.022 E-.08341
G1 X93.894 Y172.776 E-.09394
G1 X93.852 Y172.655 E-.0486
G1 X93.749 Y172.471 E-.08012
G1 X93.573 Y172.273 E-.10064
G1 X93.038 Y171.748 E-.28499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.682 Y172.53 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X96.373 Y173.487 I-.388 J.403 E.0342
G3 X95.241 Y173.499 I-.701 J-13.065 E.03096
G1 X95.241 Y172.357 E.03123
G3 X96.364 Y172.377 I.35 J11.483 E.03072
G3 X96.637 Y172.49 I-.07 J.555 E.00817
M204 S250
G1 X96.005 Y172.226 F42000
G1 F7513
M204 S5000
G1 X96.634 Y172.363 E.01761
G3 X96.991 Y173.347 I-.178 J.621 E.03336
G3 X96.412 Y173.617 I-.543 J-.41 E.01817
G3 X95.012 Y173.628 I-.857 J-18.734 E.03829
G1 X95.012 Y171 E.07187
G1 X95.241 Y171 E.00625
G1 X95.241 Y172.258 E.0344
G2 X95.921 Y172.211 I.189 J-2.222 E.01873
G2 X96.372 Y171.785 I-.414 J-.889 E.01728
G1 X96.901 Y171 E.02586
G1 X97.184 Y171 E.00775
G3 X96.612 Y171.818 I-3.451 J-1.807 E.02738
G1 X96.055 Y172.193 E.01835
; WIPE_START
G1 F10727.314
M204 S6000
G1 X96.634 Y172.363 E-.22947
G1 X96.806 Y172.434 E-.07049
G1 X96.9 Y172.501 E-.04384
G1 X96.992 Y172.608 E-.05378
G1 X97.055 Y172.734 E-.05355
G1 X97.083 Y172.848 E-.04471
G1 X97.087 Y173.069 E-.08385
G1 X97.053 Y173.22 E-.05886
G1 X96.991 Y173.347 E-.05364
G1 X96.883 Y173.473 E-.06301
G1 X96.872 Y173.48 E-.0048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.064 Y171.219 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X99.168 Y171.397 I-.379 J.34 E.00566
G3 X99.264 Y172.294 I-3.5 J.828 E.02473
G3 X99.171 Y173.175 I-3.188 J.112 E.02431
G3 X98.234 Y173.193 I-.471 J-.129 E.03431
G3 X98.189 Y171.553 I4.123 J-.934 E.04513
G3 X98.615 Y171.055 I.577 J.063 E.01903
G3 X99.022 Y171.177 I.071 J.504 E.01199
M204 S250
G1 X98.065 Y171.34 F42000
G1 F7513
M204 S5000
G3 X98.725 Y170.951 I.631 J.316 E.02213
G3 X99.389 Y171.495 I-.002 J.679 E.02542
G3 X99.361 Y173.171 I-3.077 J.788 E.04638
G3 X98.014 Y173.096 I-.664 J-.223 E.04987
G3 X98.047 Y171.397 I2.923 J-.792 E.04709
; WIPE_START
G1 F10727.314
M204 S6000
G1 X98.141 Y171.216 E-.07758
G1 X98.299 Y171.066 E-.08276
G1 X98.452 Y170.988 E-.06515
G1 X98.592 Y170.956 E-.05439
G1 X98.725 Y170.951 E-.05069
G1 X98.957 Y170.988 E-.08919
G1 X99.06 Y171.034 E-.04295
G1 X99.171 Y171.117 E-.05277
G1 X99.31 Y171.303 E-.0881
G1 X99.389 Y171.495 E-.07898
G1 X99.429 Y171.695 E-.07745
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.536 Y172.419 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G1 X100.714 Y173.426 E.02798
G1 X101.771 Y173.426 E.02889
G1 X101.771 Y173.587 E.0044
G1 X100.593 Y173.587 E.0322
G1 X100.363 Y172.371 E.03385
G1 X100.542 Y172.345 E.00494
G2 X101.69 Y171.809 I.487 J-.455 E.04575
G2 X101.199 Y171.046 I-.715 J-.08 E.02687
G2 X100.503 Y171.439 I-.125 J.591 E.02387
G1 X100.306 Y171.418 E.00543
G3 X101.1 Y170.952 I.696 J.277 E.0271
G3 X101.898 Y171.936 I-.028 J.838 E.03927
G3 X100.952 Y172.593 I-.731 J-.042 E.03627
G1 X100.591 Y172.442 E.01069
; OBJECT_ID: 7
; WIPE_START
G1 F10727.314
M204 S6000
G1 X100.714 Y173.426 E-.37701
G1 X101.722 Y173.426 E-.38299
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X94.096 Y173.105 Z3 F42000
G1 X47.982 Y171.158 Z3
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X48.871 Y172.145 I3.65 J-2.393 E.03646
G3 X49.311 Y172.912 I-.865 J1.007 E.02466
G3 X48.668 Y173.637 I-.648 J.073 E.02986
G3 X47.863 Y173.331 I-.145 J-.832 E.02471
G3 X47.774 Y173.109 I.872 J-.477 E.00655
G1 X47.967 Y173.09 E.00529
G2 X49.094 Y172.777 I.571 J-.13 E.05177
G2 X48.773 Y172.275 I-1.128 J.366 E.01647
G3 X47.844 Y171.291 I4.529 J-5.209 E.03707
G3 X47.717 Y171.002 I1.137 J-.67 E.00866
G1 X49.315 Y171.002 E.04369
G1 X49.315 Y171.158 E.00429
G1 X48.042 Y171.158 E.03482
; WIPE_START
G1 F10727.314
M204 S6000
G1 X48.337 Y171.634 E-.2128
G1 X48.871 Y172.145 E-.28077
G1 X49.052 Y172.341 E-.10142
G1 X49.225 Y172.609 E-.12122
G1 X49.268 Y172.716 E-.04378
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X51.905 Y172.555 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X51.573 Y173.488 I-.412 J.379 E.03325
G3 X50.441 Y173.5 I-.701 J-13.062 E.03096
G1 X50.441 Y172.358 E.03123
G3 X51.564 Y172.379 I.35 J11.475 E.03072
G3 X51.862 Y172.513 I-.07 J.555 E.00909
M204 S250
G1 X51.205 Y172.228 F42000
G1 F7513
M204 S5000
G1 X51.835 Y172.364 E.01762
G3 X52.191 Y173.348 I-.178 J.621 E.03335
G3 X51.612 Y173.618 I-.543 J-.41 E.01816
G3 X50.212 Y173.63 I-.858 J-18.724 E.03829
G1 X50.212 Y171.002 E.07187
G1 X50.441 Y171.002 E.00625
G1 X50.441 Y172.26 E.0344
G2 X51.122 Y172.213 I.189 J-2.222 E.01873
G2 X51.572 Y171.786 I-.414 J-.889 E.01728
G1 X52.101 Y171.002 E.02586
G1 X52.384 Y171.002 E.00775
G3 X51.812 Y171.819 I-3.452 J-1.809 E.02737
G1 X51.255 Y172.194 E.01835
; WIPE_START
M73 P96 R0
G1 F10727.314
M204 S6000
G1 X51.835 Y172.364 E-.22959
G1 X52.006 Y172.436 E-.0704
G1 X52.1 Y172.502 E-.04385
G1 X52.193 Y172.61 E-.05398
G1 X52.255 Y172.735 E-.05331
G1 X52.283 Y172.85 E-.04471
G1 X52.287 Y173.07 E-.08394
G1 X52.253 Y173.221 E-.05883
G1 X52.191 Y173.348 E-.0536
G1 X52.083 Y173.474 E-.06308
G1 X52.072 Y173.481 E-.00472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X53.968 Y171.058 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X54.368 Y171.399 I-.082 J.502 E.0151
G3 X54.464 Y172.295 I-3.502 J.827 E.02472
G3 X54.37 Y173.181 I-3.152 J.114 E.02443
G3 X53.434 Y173.191 I-.47 J-.125 E.03452
G3 X53.389 Y171.555 I4.126 J-.931 E.04506
G3 X53.814 Y171.057 I.577 J.063 E.01902
G3 X53.908 Y171.052 I.071 J.504 E.00256
M204 S250
G1 X53.341 Y171.217 F42000
G1 F7513
M204 S5000
G3 X53.925 Y170.952 I.544 J.423 E.01824
G3 X54.589 Y171.496 I.003 J.673 E.02545
G3 X54.561 Y173.172 I-3.076 J.788 E.04639
G3 X53.214 Y173.097 I-.663 J-.226 E.04978
G3 X53.231 Y171.424 I3.215 J-.803 E.04625
G3 X53.306 Y171.266 I.655 J.216 E.0048
; WIPE_START
G1 F10727.314
M204 S6000
G1 X53.499 Y171.067 E-.10526
G1 X53.652 Y170.99 E-.06511
G1 X53.792 Y170.957 E-.05437
G1 X53.925 Y170.952 E-.05069
G1 X54.107 Y170.975 E-.06995
G1 X54.197 Y171.005 E-.03592
G1 X54.371 Y171.118 E-.0789
G1 X54.51 Y171.304 E-.08805
G1 X54.589 Y171.496 E-.07894
G1 X54.658 Y171.839 E-.13281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X56.623 Y172.695 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X56.482 Y172.56 I-.436 J.314 E.00536
G2 X56.213 Y172.459 I-.494 J.903 E.00789
G1 X56.205 Y172.399 E.00166
G1 X56.251 Y172.401 E.00127
G1 X56.688 Y172.662 E.01392
G3 X56.694 Y173.487 I-.264 J.415 E.02678
G3 X55.609 Y173.375 I-.481 J-.653 E.03273
G3 X55.522 Y173.197 I1.111 J-.654 E.0054
G1 X55.675 Y173.172 E.00422
G2 X56.655 Y172.746 I.512 J-.163 E.04917
; WIPE_START
G1 F10727.314
M204 S6000
G1 X56.482 Y172.56 E-.09641
G1 X56.338 Y172.489 E-.06117
G1 X56.213 Y172.459 E-.04882
G1 X56.205 Y172.399 E-.02311
G1 X56.251 Y172.401 E-.01764
G1 X56.688 Y172.662 E-.19337
G1 X56.779 Y172.739 E-.04539
G1 X56.864 Y172.85 E-.05303
G1 X56.898 Y172.932 E-.03374
G1 X56.915 Y173.06 E-.04895
G1 X56.903 Y173.167 E-.0411
G1 X56.861 Y173.286 E-.04783
G1 X56.795 Y173.385 E-.04523
G1 X56.788 Y173.393 E-.00422
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X55.967 Y171.118 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X55.656 Y171.47 I.272 J.555 E.01318
G1 X55.471 Y171.447 E.00507
G3 X56.34 Y170.956 I.727 J.273 E.02963
G3 X56.963 Y172.026 I-.039 J.739 E.04012
G3 X56.639 Y172.243 I-.467 J-.348 E.01087
G2 X56.462 Y171.096 I-.52 J-.507 E.03676
G2 X56.023 Y171.094 I-.222 J.577 E.01227
; OBJECT_ID: 3
; WIPE_START
G1 F10727.314
M204 S6000
G1 X55.856 Y171.176 E-.0705
G1 X55.774 Y171.256 E-.04356
G1 X55.656 Y171.47 E-.09278
G1 X55.471 Y171.447 E-.07052
G1 X55.54 Y171.3 E-.06176
G1 X55.62 Y171.196 E-.04972
G1 X55.815 Y171.044 E-.09409
G1 X56.049 Y170.966 E-.09359
G1 X56.34 Y170.956 E-.11071
G1 X56.526 Y171 E-.07276
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X56.527 Y163.367 Z3 F42000
G1 X56.533 Y94.759 Z3
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X57.421 Y95.746 I3.603 J-2.346 E.03643
G3 X57.861 Y96.512 I-.866 J1.008 E.02465
G3 X57.218 Y97.237 I-.648 J.073 E.02986
G3 X56.413 Y96.931 I-.145 J-.832 E.02471
G3 X56.324 Y96.709 I.874 J-.477 E.00655
G1 X56.517 Y96.69 E.00529
G2 X57.644 Y96.377 I.572 J-.123 E.05218
G2 X57.321 Y95.873 I-1.061 J.323 E.01657
G3 X56.394 Y94.891 I4.52 J-5.197 E.037
G3 X56.267 Y94.602 I1.139 J-.671 E.00866
G1 X57.865 Y94.602 E.04369
G1 X57.865 Y94.759 E.00429
G1 X56.593 Y94.759 E.03477
; WIPE_START
G1 F10727.314
M204 S6000
G1 X56.887 Y95.235 E-.21249
G1 X57.421 Y95.746 E-.2807
G1 X57.602 Y95.941 E-.10144
G1 X57.775 Y96.209 E-.12108
G1 X57.818 Y96.317 E-.04429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.597 Y96.671 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G1 X60.824 Y96.731 E.00642
G3 X59.869 Y97.281 I-.87 J-.407 E.03208
G3 X58.675 Y96.191 I-.035 J-1.161 E.04889
G3 X58.904 Y95.001 I1.621 J-.305 E.03395
G3 X59.867 Y94.552 I.915 J.705 E.03018
G3 X60.841 Y95.21 I.058 J.965 E.03455
G1 X60.62 Y95.28 E.00634
G2 X58.95 Y95.43 I-.817 J.273 E.06309
G2 X58.999 Y96.57 I2.405 J.468 E.03149
G2 X60.568 Y96.723 I.821 J-.3 E.05371
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.824 Y96.731 E-.09741
G1 X60.678 Y96.964 E-.10451
G1 X60.491 Y97.121 E-.09279
G1 X60.311 Y97.209 E-.07611
G1 X60.182 Y97.248 E-.05111
G1 X59.869 Y97.281 E-.11949
G1 X59.722 Y97.274 E-.05608
G1 X59.477 Y97.228 E-.09471
G1 X59.312 Y97.159 E-.0678
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.814 Y94.821 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X62.918 Y94.999 I-.379 J.34 E.00566
G3 X63.014 Y95.895 I-3.499 J.827 E.02473
G3 X62.922 Y96.776 I-3.188 J.112 E.0243
G3 X61.984 Y96.794 I-.471 J-.13 E.0343
G3 X61.939 Y95.155 I4.124 J-.934 E.04513
G3 X62.352 Y94.659 I.58 J.064 E.01867
G3 X62.772 Y94.779 I.084 J.502 E.01234
M204 S250
G1 X62.92 Y94.72 F42000
G1 F7513
M204 S5000
G3 X63.139 Y95.096 I-.447 J.512 E.01212
G3 X63.111 Y96.773 I-3.076 J.788 E.0464
G3 X61.764 Y96.697 I-.663 J-.226 E.04977
G3 X61.816 Y94.942 I2.922 J-.792 E.04873
G3 X62.475 Y94.552 I.633 J.319 E.02212
G3 X62.873 Y94.682 I-.002 J.679 E.01164
; WIPE_START
G1 F10727.314
M204 S6000
G1 X63.06 Y94.904 E-.11022
G1 X63.139 Y95.096 E-.07892
G1 X63.217 Y95.486 E-.151
G1 X63.238 Y95.911 E-.1616
G1 X63.218 Y96.301 E-.14858
G1 X63.172 Y96.576 E-.10591
G1 X63.169 Y96.586 E-.00378
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.286 Y96.262 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X64.41 Y96.195 I.306 J.423 E.00386
G2 X65.297 Y96.832 I.377 J.412 E.05426
G2 X65.066 Y96.13 I-.54 J-.211 E.0219
G1 X65.295 Y96.264 E.00723
G3 X64.974 Y97.228 I-.346 J.42 E.03584
G3 X64.314 Y97.127 I-.184 J-1.008 E.01858
G3 X64.239 Y96.299 I.277 J-.443 E.0263
M204 S250
G1 X64.365 Y95.806 F42000
G1 F7513
M204 S5000
G2 X64.51 Y95.915 I.406 J-.387 E.00499
G3 X64.006 Y95.404 I.174 J-.677 E.02062
G3 X64.707 Y94.553 I.695 J-.143 E.03456
G3 X64.924 Y94.554 I.098 J1.641 E.00594
G3 X65.433 Y95.711 I-.039 J.707 E.04267
G3 X65.291 Y95.816 I-.432 J-.433 E.00484
G1 X64.86 Y96.01 E.01294
G1 X65.038 Y96.114 E.00565
G2 X64.647 Y96.075 I-.258 J.607 E.01091
G1 X64.748 Y96.024 E.00308
G1 X64.548 Y95.933 E.00601
G2 X65.401 Y95.322 I.239 J-.568 E.03432
G2 X64.563 Y94.679 I-.612 J-.071 E.03474
G2 X64.266 Y95.662 I.325 J.634 E.03136
G2 X64.326 Y95.76 I.506 J-.243 E.00315
; OBJECT_ID: 1
; WIPE_START
G1 F10727.314
M204 S6000
G1 X64.51 Y95.915 E-.09146
G1 X64.285 Y95.812 E-.09429
G1 X64.142 Y95.696 E-.06988
G1 X64.051 Y95.551 E-.06508
G1 X64.006 Y95.404 E-.05824
G1 X63.994 Y95.272 E-.05055
G1 X64.01 Y95.104 E-.0642
G1 X64.057 Y94.956 E-.05888
G1 X64.113 Y94.86 E-.04207
G1 X64.245 Y94.723 E-.07251
G1 X64.376 Y94.64 E-.05884
G1 X64.46 Y94.611 E-.03402
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X63.51 Y87.038 Z3 F42000
G1 X56.031 Y27.459 Z3
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G2 X56.92 Y28.445 I3.666 J-2.41 E.03647
G3 X57.361 Y29.212 I-.866 J1.008 E.02466
G3 X56.718 Y29.937 I-.648 J.073 E.02986
G3 X55.913 Y29.631 I-.145 J-.832 E.02471
G3 X55.824 Y29.409 I.874 J-.477 E.00655
G1 X56.017 Y29.39 E.00529
G2 X56.865 Y29.785 I.574 J-.125 E.02959
G2 X57.102 Y28.956 I-.316 J-.538 E.02601
G2 X56.821 Y28.573 I-1.811 J1.033 E.01302
G3 X55.894 Y27.591 I4.519 J-5.196 E.037
G3 X55.767 Y27.302 I1.14 J-.671 E.00866
G1 X57.365 Y27.302 E.04369
G1 X57.365 Y27.459 E.00429
G1 X56.091 Y27.459 E.03484
; WIPE_START
G1 F10727.314
M204 S6000
G1 X56.387 Y27.934 E-.21297
G1 X56.92 Y28.445 E-.28066
G1 X57.102 Y28.641 E-.10154
G1 X57.275 Y28.909 E-.12111
G1 X57.318 Y29.016 E-.04373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.097 Y29.371 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G1 X60.324 Y29.431 E.00642
G3 X59.369 Y29.981 I-.87 J-.407 E.03208
G3 X58.175 Y28.891 I-.035 J-1.161 E.04889
G3 X58.404 Y27.701 I1.621 J-.305 E.03395
G3 X59.367 Y27.252 I.915 J.705 E.03018
G3 X60.341 Y27.91 I.058 J.965 E.03455
G1 X60.12 Y27.98 E.00634
G2 X58.45 Y28.131 I-.817 J.273 E.06309
G2 X58.499 Y29.27 I2.405 J.468 E.03149
G2 X60.068 Y29.423 I.821 J-.3 E.05371
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.324 Y29.431 E-.09741
G1 X60.179 Y29.664 E-.10434
G1 X59.991 Y29.821 E-.09303
G1 X59.811 Y29.909 E-.07606
G1 X59.682 Y29.948 E-.05111
G1 X59.369 Y29.981 E-.11949
G1 X59.222 Y29.974 E-.05607
G1 X58.977 Y29.928 E-.09472
G1 X58.812 Y29.859 E-.06779
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.314 Y27.521 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X62.418 Y27.699 I-.379 J.34 E.00566
G3 X62.514 Y28.595 I-3.499 J.827 E.02473
G3 X62.422 Y29.476 I-3.189 J.112 E.0243
G3 X61.484 Y29.494 I-.471 J-.13 E.03429
G3 X61.439 Y27.855 I4.124 J-.934 E.04513
G3 X61.852 Y27.359 I.58 J.064 E.01867
G3 X62.272 Y27.479 I.084 J.502 E.01234
; WIPE_START
G1 F10727.314
M204 S6000
G1 X62.418 Y27.699 E-.1003
G1 X62.461 Y27.85 E-.05989
G1 X62.494 Y28.076 E-.08688
G1 X62.514 Y28.595 E-.19732
G1 X62.496 Y29.103 E-.19313
G1 X62.463 Y29.336 E-.08929
G1 X62.438 Y29.42 E-.0332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.214 Y29.895 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G3 X61.264 Y29.397 I-.266 J-.648 E.03341
G3 X61.315 Y27.642 I2.923 J-.792 E.04871
G3 X61.975 Y27.252 I.631 J.315 E.02215
G3 X62.639 Y27.796 I-.002 J.679 E.02541
G3 X62.611 Y29.473 I-3.076 J.788 E.0464
G3 X62.268 Y29.87 I-.663 J-.226 E.01473
; WIPE_START
G1 F10727.314
M204 S6000
G1 X62.057 Y29.936 E-.08373
G1 X61.845 Y29.936 E-.08077
G1 X61.647 Y29.885 E-.07779
G1 X61.481 Y29.774 E-.07555
G1 X61.343 Y29.588 E-.0881
G1 X61.264 Y29.397 E-.07867
G1 X61.179 Y28.943 E-.17548
G1 X61.173 Y28.68 E-.09989
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.301 Y28.701 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F7513
M204 S5000
G1 X64.738 Y28.962 E.01392
G3 X64.675 Y29.838 I-.287 J.419 E.02898
G3 X63.659 Y29.675 I-.406 J-.714 E.03039
G3 X63.572 Y29.498 I1.104 J-.65 E.0054
G1 X63.725 Y29.472 E.00422
G2 X64.532 Y28.86 I.512 J-.162 E.05621
G2 X64.263 Y28.759 I-.499 J.917 E.00788
G1 X64.257 Y28.712 E.00129
M204 S250
G1 X64.689 Y28.543 F42000
G1 F7513
M204 S5000
G2 X64.502 Y27.393 I-.518 J-.506 E.03702
G2 X63.704 Y27.77 I-.213 J.583 E.02683
G1 X63.521 Y27.748 E.00504
G3 X64.39 Y27.256 I.727 J.273 E.02963
G3 X65.013 Y28.327 I-.04 J.74 E.04009
G3 X64.746 Y28.525 I-.467 J-.348 E.00923
; WIPE_START
G1 F10727.314
M204 S6000
G1 X64.794 Y28.417 E-.04502
G1 X64.865 Y28.244 E-.07104
G1 X64.889 Y28.04 E-.07808
G1 X64.881 Y27.915 E-.04749
G1 X64.83 Y27.724 E-.07505
G1 X64.78 Y27.629 E-.04079
G1 X64.641 Y27.475 E-.07874
G1 X64.502 Y27.393 E-.06144
G1 X64.335 Y27.352 E-.06521
G1 X64.219 Y27.352 E-.0443
G1 X64.012 Y27.409 E-.08135
G1 X63.906 Y27.476 E-.048
G1 X63.861 Y27.519 E-.0235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 1
M625
; object ids of layer 13 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer13 end: 1,2,3,4,5,6,7,8,9
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 14/15
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X137.157 Y27.459 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X137.618 Y28.067 I2.127 J-1.133 E.02098
G3 X138.202 Y28.641 I-3.337 J3.978 E.02241
G3 X138.416 Y29.548 I-.668 J.637 E.0267
G3 X137.703 Y29.942 I-.635 J-.308 E.02376
G3 X136.981 Y29.572 I-.07 J-.753 E.02342
G3 X136.925 Y29.409 I.628 J-.306 E.00471
G1 X137.117 Y29.39 E.00528
G2 X137.915 Y29.806 I.572 J-.123 E.02809
G2 X138.25 Y29.106 I-.239 J-.544 E.02313
G2 X137.93 Y28.582 I-1.204 J.376 E.01694
G3 X136.994 Y27.591 I4.801 J-5.473 E.03733
G3 X136.867 Y27.302 I1.157 J-.683 E.00867
G1 X138.465 Y27.302 E.04371
G1 X138.465 Y27.459 E.00429
G1 X137.217 Y27.459 E.03413
; WIPE_START
G1 F10727.314
M204 S6000
G1 X137.409 Y27.839 E-.16201
G1 X137.618 Y28.067 E-.11763
G1 X138.202 Y28.641 E-.31107
G1 X138.37 Y28.9 E-.11722
G1 X138.415 Y29.03 E-.05207
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.22 Y27.98 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X139.558 Y28.099 I-.816 J.274 E.06208
G2 X139.606 Y29.289 I2.282 J.503 E.03293
G2 X141.196 Y29.371 I.813 J-.314 E.05487
G1 X141.425 Y29.425 E.00643
G3 X140.469 Y29.981 I-.878 J-.41 E.03216
G3 X139.306 Y29.07 I-.053 J-1.131 E.04402
G3 X139.434 Y27.808 I1.844 J-.45 E.03538
G3 X140.541 Y27.255 I.976 J.569 E.0358
G3 X141.442 Y27.909 I-.022 J.978 E.0324
G1 X141.278 Y27.961 E.00471
; WIPE_START
G1 F10727.314
M204 S6000
G1 X141.107 Y27.75 E-.10334
G1 X140.971 Y27.593 E-.07911
G1 X140.851 Y27.504 E-.05642
G1 X140.719 Y27.441 E-.05566
G1 X140.573 Y27.402 E-.05737
G1 X140.33 Y27.395 E-.09246
G1 X140.052 Y27.468 E-.10894
G1 X139.817 Y27.629 E-.1083
G1 X139.662 Y27.829 E-.09623
G1 X139.66 Y27.834 E-.00215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.285 Y29.773 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X143.134 Y29.837 I-.298 J-.498 E.00449
G3 X142.539 Y29.332 I-.054 J-.539 E.0238
G3 X142.538 Y27.858 I4.617 J-.739 E.04049
G3 X142.973 Y27.355 I.574 J.056 E.01937
G1 X143.089 Y27.35 E.00318
G3 X143.563 Y27.86 I-.079 J.549 E.02057
G3 X143.564 Y29.333 I-5.412 J.739 E.04041
G3 X143.335 Y29.74 I-.577 J-.057 E.01314
M204 S250
G1 X143.311 Y29.9 F42000
G1 F7205
M204 S5000
G3 X142.393 Y29.477 I-.26 J-.644 E.03099
G3 X142.421 Y27.631 I2.781 J-.881 E.05137
G3 X143.135 Y27.256 I.615 J.304 E.02357
G3 X143.71 Y27.716 I-.044 J.645 E.02145
G3 X143.711 Y29.473 I-2.97 J.88 E.04871
G3 X143.366 Y29.875 I-.66 J-.217 E.01487
; WIPE_START
G1 F10727.314
M204 S6000
G1 X143.051 Y29.942 E-.12227
G1 X142.792 Y29.902 E-.09975
G1 X142.635 Y29.82 E-.06719
G1 X142.493 Y29.671 E-.07831
G1 X142.393 Y29.477 E-.08299
G1 X142.333 Y29.287 E-.07541
G1 X142.284 Y28.997 E-.1119
G1 X142.274 Y28.676 E-.12218
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.885 Y28.714 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G1 X145.064 Y29.728 E.02816
G1 X146.121 Y29.728 E.02889
G1 X146.121 Y29.889 E.0044
G1 X144.943 Y29.889 E.0322
G1 X144.713 Y28.672 E.03385
G1 X144.892 Y28.647 E.00493
G2 X145.948 Y28.539 I.488 J-.446 E.03369
G2 X145.868 Y27.544 I-.943 J-.425 E.02848
G2 X144.853 Y27.74 I-.448 J.403 E.03394
G1 X144.656 Y27.72 E.00543
G3 X145.55 Y27.261 I.719 J.302 E.02985
G3 X146.248 Y28.237 I-.143 J.84 E.03639
G3 X145.295 Y28.892 I-.717 J-.022 E.03678
G1 X144.94 Y28.738 E.0106
; OBJECT_ID: 4
; WIPE_START
G1 F10727.314
M204 S6000
G1 X145.064 Y29.728 E-.37923
G1 X146.066 Y29.728 E-.38077
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X144.451 Y37.187 Z3.2 F42000
G1 X130.142 Y103.258 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X130.602 Y103.867 I2.096 J-1.105 E.02095
G3 X131.186 Y104.441 I-3.338 J3.978 E.02242
G3 X131.4 Y105.348 I-.653 J.633 E.02674
G3 X130.687 Y105.742 I-.635 J-.308 E.02376
G3 X129.988 Y105.417 I-.08 J-.742 E.02213
G3 X129.909 Y105.209 I.881 J-.455 E.0061
G1 X130.101 Y105.19 E.00528
G2 X130.898 Y105.606 I.572 J-.123 E.02806
G2 X131.234 Y104.905 I-.237 J-.544 E.02317
G2 X130.914 Y104.382 I-1.204 J.377 E.01694
G3 X129.978 Y103.391 I4.8 J-5.472 E.03733
G3 X129.85 Y103.102 I1.155 J-.682 E.00867
G1 X131.449 Y103.102 E.04371
G1 X131.449 Y103.258 E.00429
G1 X130.202 Y103.258 E.03408
; WIPE_START
G1 F10727.314
M204 S6000
G1 X130.393 Y103.639 E-.16157
G1 X130.602 Y103.867 E-.11773
G1 X131.186 Y104.441 E-.31116
G1 X131.354 Y104.7 E-.11717
G1 X131.399 Y104.83 E-.05237
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.589 Y103.23 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G1 X132.589 Y105.705 E.06769
G1 X132.361 Y105.705 E.00625
G1 X132.361 Y103.102 E.07119
G1 X134.098 Y103.102 E.04753
G1 X134.098 Y103.23 E.0035
G1 X132.649 Y103.23 E.03964
; WIPE_START
G1 F10727.314
M204 S6000
G1 X132.601 Y105.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.937 Y105.46 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X135.65 Y105.636 I-.435 J-.386 E.00934
G3 X135.055 Y105.132 I-.051 J-.542 E.02376
G3 X135.054 Y103.662 I4.612 J-.739 E.04036
G3 X135.445 Y103.164 I.6 J.068 E.01823
G3 X136.079 Y103.66 I.096 J.531 E.02486
G3 X136.08 Y105.132 I-5.412 J.739 E.04039
G3 X135.974 Y105.413 I-.579 J-.058 E.00831
M204 S250
G1 X135.039 Y105.505 F42000
G1 F7205
M204 S5000
G3 X134.919 Y105.304 I.529 J-.449 E.00642
G3 X134.913 Y103.485 I2.955 J-.92 E.05049
G3 X135.651 Y103.055 I.639 J.249 E.02521
G3 X136.226 Y103.516 I-.044 J.645 E.02145
G3 X136.227 Y105.273 I-2.969 J.88 E.04871
G3 X135.079 Y105.549 I-.659 J-.217 E.0386
; WIPE_START
G1 F10727.314
M204 S6000
G1 X134.919 Y105.304 E-.11118
G1 X134.849 Y105.086 E-.08705
G1 X134.8 Y104.797 E-.11166
G1 X134.783 Y104.545 E-.09603
G1 X134.801 Y103.972 E-.21784
G1 X134.843 Y103.709 E-.10092
G1 X134.871 Y103.621 E-.03532
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.3 Y104.348 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X138.078 Y103.177 I-.505 J-.511 E.03847
G2 X137.321 Y103.57 I-.181 J.576 E.02588
G1 X137.138 Y103.547 E.00505
G3 X137.99 Y103.055 I.72 J.264 E.02922
G3 X138.63 Y104.126 I-.021 J.739 E.04058
G3 X138.358 Y104.332 I-.447 J-.307 E.00951
M204 S250
G1 X138.342 Y104.887 F42000
G1 F7205
M204 S5000
G2 X138.19 Y104.692 I-.488 J.225 E.00681
G2 X137.879 Y104.559 I-.537 J.82 E.00929
G1 X137.871 Y104.499 E.00166
G1 X137.918 Y104.501 E.0013
G1 X138.353 Y104.761 E.01385
G3 X138.305 Y105.629 I-.28 J.42 E.02864
G3 X137.275 Y105.474 I-.424 J-.68 E.03099
G3 X137.189 Y105.297 I.751 J-.473 E.00538
G1 X137.341 Y105.272 E.0042
G2 X138.364 Y104.943 I.513 J-.16 E.04641
; OBJECT_ID: 5
; WIPE_START
G1 F10727.314
M204 S6000
G1 X138.281 Y104.792 E-.06528
G1 X138.19 Y104.692 E-.05141
G1 X138.09 Y104.624 E-.04586
G1 X137.879 Y104.559 E-.08391
G1 X137.871 Y104.499 E-.02303
G1 X137.918 Y104.501 E-.01801
G1 X138.353 Y104.761 E-.19239
G1 X138.476 Y104.872 E-.06311
G1 X138.53 Y104.951 E-.03641
G1 X138.574 Y105.076 E-.05024
G1 X138.579 Y105.211 E-.05118
G1 X138.543 Y105.351 E-.05509
G1 X138.513 Y105.407 E-.02406
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X146.132 Y104.957 Z3.2 F42000
G1 X174.942 Y103.257 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X175.402 Y103.866 I2.102 J-1.11 E.02096
G3 X175.986 Y104.44 I-3.337 J3.978 E.02241
G3 X176.2 Y105.346 I-.654 J.633 E.02675
G3 X175.487 Y105.74 I-.635 J-.308 E.02376
G3 X174.788 Y105.416 I-.08 J-.742 E.02213
G3 X174.709 Y105.208 I.882 J-.456 E.0061
G1 X174.901 Y105.188 E.00528
G2 X175.698 Y105.605 I.572 J-.123 E.02806
G2 X176.034 Y104.904 I-.237 J-.544 E.02315
G2 X175.714 Y104.381 I-1.204 J.375 E.01695
G3 X174.778 Y103.39 I4.802 J-5.474 E.03733
G3 X174.65 Y103.1 I1.158 J-.683 E.00867
G1 X176.249 Y103.1 E.04371
G1 X176.249 Y103.257 E.00429
G1 X175.002 Y103.257 E.03409
; WIPE_START
G1 F10727.314
M204 S6000
G1 X175.193 Y103.637 E-.16168
G1 X175.402 Y103.866 E-.11774
G1 X175.986 Y104.44 E-.31108
G1 X176.154 Y104.698 E-.11717
G1 X176.199 Y104.829 E-.05233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.389 Y103.228 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G1 X177.389 Y105.704 E.06769
G1 X177.161 Y105.704 E.00625
G1 X177.161 Y103.1 E.07119
G1 X178.898 Y103.1 E.04752
G1 X178.898 Y103.228 E.0035
G1 X177.449 Y103.228 E.03964
; WIPE_START
G1 F10727.314
M204 S6000
G1 X177.401 Y105.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X180.287 Y105.626 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X179.855 Y105.131 I.11 J-.531 E.0193
G3 X179.819 Y103.933 I6.065 J-.786 E.03283
G3 X179.898 Y103.512 I1.356 J.037 E.01177
G3 X180.289 Y103.153 I.517 J.172 E.01515
G3 X180.879 Y103.658 I.048 J.541 E.02368
G3 X180.88 Y105.131 I-5.41 J.739 E.0404
G3 X180.45 Y105.635 I-.577 J-.057 E.01929
G3 X180.346 Y105.635 I-.054 J-.54 E.00285
M204 S250
G1 X180.108 Y105.699 F42000
G1 F7205
M204 S5000
G3 X179.709 Y105.275 I.259 J-.645 E.01645
G3 X179.737 Y103.429 I2.782 J-.881 E.05136
G3 X180.451 Y103.054 I.615 J.304 E.02358
G3 X181.026 Y103.515 I-.044 J.644 E.02144
G3 X181.027 Y105.272 I-2.969 J.881 E.04871
G3 X180.165 Y105.719 I-.66 J-.217 E.02943
; WIPE_START
G1 F10727.314
M204 S6000
G1 X179.952 Y105.618 E-.08948
G1 X179.809 Y105.469 E-.07845
G1 X179.709 Y105.275 E-.08302
G1 X179.649 Y105.086 E-.0753
G1 X179.6 Y104.795 E-.11194
G1 X179.583 Y104.252 E-.20665
G1 X179.601 Y103.97 E-.10722
G1 X179.605 Y103.95 E-.00795
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X182.201 Y104.512 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G1 X182.38 Y105.526 E.02816
G1 X183.437 Y105.526 E.02889
G1 X183.437 Y105.687 E.0044
M73 P97 R0
G1 X182.259 Y105.687 E.0322
G1 X182.03 Y104.471 E.03385
G1 X182.208 Y104.445 E.00493
G2 X183.264 Y104.337 I.488 J-.446 E.03369
G2 X183.184 Y103.342 I-.911 J-.428 E.02856
G2 X182.17 Y103.539 I-.448 J.403 E.03394
G1 X181.972 Y103.518 E.00543
G3 X182.866 Y103.06 I.726 J.314 E.02977
G3 X183.564 Y104.035 I-.14 J.838 E.03642
G3 X182.612 Y104.691 I-.717 J-.022 E.03678
G1 X182.256 Y104.536 E.0106
; OBJECT_ID: 6
; WIPE_START
G1 F10727.314
M204 S6000
G1 X182.38 Y105.526 E-.37916
G1 X183.383 Y105.526 E-.38084
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X191.015 Y105.517 Z3.2 F42000
G1 X221.281 Y105.481 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X221.434 Y104.904 I-.42 J-.42 E.01708
G2 X221.114 Y104.381 I-1.204 J.376 E.01694
G3 X220.178 Y103.39 I4.803 J-5.475 E.03733
G3 X220.05 Y103.101 I1.158 J-.683 E.00867
G1 X221.649 Y103.101 E.04371
G1 X221.649 Y103.257 E.00429
G1 X220.343 Y103.257 E.0357
G2 X220.802 Y103.866 I2.08 J-1.091 E.02094
G3 X221.386 Y104.44 I-3.34 J3.98 E.02242
G3 X221.6 Y105.347 I-.654 J.633 E.02674
G3 X220.887 Y105.741 I-.635 J-.308 E.02376
G3 X220.164 Y105.37 I-.07 J-.754 E.02342
G3 X220.109 Y105.208 I.63 J-.306 E.00471
G1 X220.301 Y105.189 E.00528
G2 X221.098 Y105.605 I.571 J-.123 E.02806
G2 X221.236 Y105.521 I-.237 J-.544 E.00444
; WIPE_START
G1 F10727.314
M204 S6000
G1 X221.391 Y105.341 E-.09017
G1 X221.446 Y105.124 E-.08486
G1 X221.434 Y104.904 E-.08371
G1 X221.364 Y104.706 E-.07994
G1 X221.283 Y104.572 E-.05933
G1 X221.114 Y104.381 E-.09706
G1 X220.618 Y103.891 E-.26493
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X222.789 Y103.229 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G1 X222.789 Y105.704 E.06769
G1 X222.561 Y105.704 E.00625
G1 X222.561 Y103.101 E.07119
G1 X224.298 Y103.101 E.04753
G1 X224.298 Y103.229 E.0035
G1 X222.849 Y103.229 E.03964
; WIPE_START
G1 F10727.314
M204 S6000
G1 X222.801 Y105.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X225.362 Y105.42 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X225.255 Y105.131 I.435 J-.325 E.00854
G3 X225.254 Y103.661 I4.613 J-.739 E.04036
G3 X225.646 Y103.163 I.601 J.069 E.01826
G3 X225.815 Y103.15 I.122 J.501 E.00466
G3 X226.279 Y103.659 I-.09 J.548 E.0203
G3 X226.28 Y105.132 I-5.411 J.739 E.04041
G3 X225.85 Y105.635 I-.579 J-.059 E.01926
G3 X225.401 Y105.466 I-.053 J-.54 E.01361
M204 S250
G1 X225.236 Y105.501 F42000
G1 F7205
M204 S5000
G3 X225.12 Y105.304 I.532 J-.446 E.0063
G3 X225.139 Y103.425 I2.739 J-.911 E.05233
G3 X225.851 Y103.054 I.613 J.308 E.02344
G3 X226.426 Y103.515 I-.044 J.645 E.02145
G3 X226.427 Y105.272 I-2.969 J.88 E.04871
G3 X225.276 Y105.545 I-.66 J-.217 E.03871
; WIPE_START
G1 F10727.314
M204 S6000
G1 X225.12 Y105.304 E-.10952
G1 X225.049 Y105.085 E-.08715
G1 X225 Y104.796 E-.11165
G1 X224.983 Y104.252 E-.20677
G1 X225.001 Y103.971 E-.10709
G1 X225.043 Y103.708 E-.10096
G1 X225.074 Y103.616 E-.03686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X228.291 Y104.451 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X227.508 Y103.939 I-.179 J-.581 E.02917
G3 X227.992 Y103.144 I.668 J-.139 E.02804
G1 X228.068 Y103.134 E.00208
G3 X228.717 Y103.82 I.034 J.618 E.02938
G3 X228.347 Y104.43 I-.606 J.05 E.02086
M204 S250
G1 X228.262 Y104.579 F42000
G1 F7205
M204 S5000
G2 X227.955 Y104.576 I-.161 J.712 E.00846
G1 X228.041 Y104.532 E.00264
G1 X227.599 Y104.309 E.01352
G3 X227.908 Y103.067 I.392 J-.562 E.04518
G3 X228.215 Y103.052 I.216 J1.227 E.00841
G3 X228.74 Y104.218 I-.015 J.708 E.04364
G3 X228.604 Y104.316 I-.565 J-.636 E.00459
G1 X228.145 Y104.519 E.01373
G1 X228.209 Y104.552 E.00195
M204 S250
G1 X228.462 Y104.682 F42000
G1 F7205
M204 S5000
G1 X228.582 Y104.744 E.00368
G3 X228.323 Y105.72 I-.311 J.44 E.03583
G3 X227.519 Y105.529 I-.227 J-.83 E.02357
G3 X227.728 Y104.692 I.381 J-.35 E.02793
G2 X228.641 Y105.225 I.37 J.414 E.05724
G2 X228.503 Y104.726 I-.608 J-.1 E.01461
; OBJECT_ID: 9
; WIPE_START
G1 F10727.314
M204 S6000
G1 X228.582 Y104.744 E-.03063
G1 X228.692 Y104.834 E-.05413
G1 X228.792 Y105.011 E-.07716
G1 X228.812 Y105.157 E-.05611
G1 X228.787 Y105.336 E-.06855
G1 X228.714 Y105.484 E-.06275
G1 X228.637 Y105.571 E-.04414
G1 X228.473 Y105.675 E-.07383
G1 X228.323 Y105.72 E-.05962
G1 X228.099 Y105.741 E-.08539
G1 X227.878 Y105.721 E-.08449
G1 X227.721 Y105.667 E-.06318
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X221.561 Y110.174 Z3.2 F42000
G1 X138.209 Y171.157 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X138.669 Y171.766 I2.08 J-1.091 E.02094
G3 X139.252 Y172.34 I-3.338 J3.978 E.02241
G3 X139.466 Y173.247 I-.653 J.633 E.02675
G3 X138.753 Y173.641 I-.635 J-.308 E.02375
G3 X138.054 Y173.316 I-.08 J-.742 E.02213
G3 X137.975 Y173.108 I.882 J-.456 E.0061
G1 X138.167 Y173.089 E.00528
G2 X138.964 Y173.505 I.571 J-.123 E.02806
G2 X139.3 Y172.804 I-.237 J-.544 E.02316
G2 X138.98 Y172.281 I-1.204 J.376 E.01694
G3 X138.044 Y171.29 I4.801 J-5.473 E.03734
G3 X137.917 Y171.001 I1.156 J-.682 E.00866
G1 X139.515 Y171.001 E.04371
G1 X139.515 Y171.157 E.00429
G1 X138.269 Y171.157 E.03406
; WIPE_START
G1 F10727.314
M204 S6000
G1 X138.459 Y171.538 E-.16143
G1 X138.669 Y171.766 E-.11781
G1 X139.252 Y172.34 E-.31108
G1 X139.42 Y172.599 E-.11717
G1 X139.465 Y172.729 E-.05251
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.032 Y172.487 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X141.774 Y173.487 I-.35 J.443 E.03565
G3 X140.641 Y173.499 I-.69 J-11.63 E.031
G1 X140.641 Y172.357 E.03123
G3 X141.648 Y172.367 I.32 J19.399 E.02754
G3 X141.983 Y172.453 I.034 J.564 E.00961
M204 S250
G1 X141.414 Y172.229 F42000
G1 F7205
M204 S5000
G1 X142.04 Y172.365 E.01752
G3 X142.391 Y173.347 I-.183 J.619 E.0332
G3 X141.895 Y173.609 I-.511 J-.366 E.01589
G3 X140.412 Y173.628 I-.922 J-13.884 E.04056
G1 X140.412 Y171.001 E.07186
G1 X140.641 Y171.001 E.00625
G1 X140.641 Y172.256 E.03432
G2 X141.321 Y172.212 I.163 J-2.784 E.01867
G2 X141.717 Y171.864 I-.303 J-.744 E.0147
G2 X142.301 Y171.001 I-34.796 J-24.183 E.02851
G1 X142.584 Y171.001 E.00775
G1 X142.4 Y171.296 E.00953
G3 X141.954 Y171.866 I-2.173 J-1.238 E.01985
G1 X141.464 Y172.195 E.01616
; WIPE_START
G1 F10727.314
M204 S6000
G1 X142.04 Y172.365 E-.22819
G1 X142.206 Y172.435 E-.06862
G1 X142.301 Y172.502 E-.04409
G1 X142.377 Y172.586 E-.04316
G1 X142.454 Y172.73 E-.06195
G1 X142.482 Y172.84 E-.04308
G1 X142.486 Y173.08 E-.09128
G1 X142.466 Y173.176 E-.03727
G1 X142.391 Y173.347 E-.07114
G1 X142.337 Y173.419 E-.03422
G1 X142.262 Y173.481 E-.037
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.506 Y171.269 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X144.613 Y171.559 I-.435 J.326 E.00858
G3 X144.614 Y173.031 I-5.411 J.739 E.04039
G3 X144.184 Y173.535 I-.577 J-.057 E.01929
G3 X143.589 Y173.031 I-.052 J-.542 E.02377
G3 X143.552 Y171.833 I6.065 J-.786 E.03283
G3 X143.631 Y171.412 I1.356 J.036 E.01177
G3 X144.023 Y171.054 I.522 J.177 E.01514
G3 X144.467 Y171.223 I.048 J.541 E.01345
M204 S250
G1 X144.36 Y170.991 F42000
G1 F7205
M204 S5000
G3 X144.76 Y171.415 I-.22 J.608 E.01653
G3 X144.761 Y173.172 I-2.969 J.881 E.04872
G3 X143.443 Y173.175 I-.66 J-.217 E.0475
G3 X143.471 Y171.329 I2.781 J-.881 E.05138
G3 X144.185 Y170.954 I.615 J.304 E.02357
G3 X144.303 Y170.973 I-.044 J.644 E.00327
; WIPE_START
G1 F10727.314
M204 S6000
G1 X144.517 Y171.072 E-.08953
G1 X144.669 Y171.235 E-.08479
G1 X144.76 Y171.415 E-.0767
G1 X144.819 Y171.605 E-.07563
G1 X144.868 Y171.897 E-.11252
G1 X144.888 Y172.294 E-.15096
G1 X144.866 Y172.711 E-.15873
G1 X144.861 Y172.74 E-.01114
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.376 Y172.374 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X145.842 Y171.839 I.069 J-.604 E.02233
G3 X146.326 Y171.044 I.666 J-.14 E.02806
G1 X146.402 Y171.034 E.00208
G3 X147.051 Y171.722 I.034 J.619 E.02943
G3 X146.436 Y172.378 I-.606 J.049 E.0277
M204 S250
G1 X146.595 Y172.479 F42000
G1 F7205
M204 S5000
G2 X146.303 Y172.474 I-.159 J.697 E.00807
G1 X146.381 Y172.435 E.00238
G1 X145.933 Y172.209 E.01371
G3 X146.242 Y170.967 I.392 J-.562 E.04517
G3 X146.548 Y170.952 I.216 J1.227 E.00842
G3 X147.074 Y172.118 I-.015 J.708 E.04364
G3 X146.945 Y172.212 I-.424 J-.442 E.00437
G1 X146.495 Y172.427 E.01364
G1 X146.542 Y172.451 E.00145
M204 S250
G1 X146.004 Y172.652 F42000
G1 F7205
M204 S5000
G2 X146.975 Y173.125 I.428 J.354 E.05494
G2 X146.796 Y172.582 I-.607 J-.101 E.01626
G1 X146.916 Y172.644 E.00369
G3 X146.656 Y173.621 I-.311 J.44 E.03585
G3 X145.853 Y173.429 I-.226 J-.832 E.02356
G3 X146.06 Y172.594 I.378 J-.349 E.02786
G2 X146.045 Y172.608 I.372 J.412 E.00058
; OBJECT_ID: 8
; WIPE_START
G1 F10727.314
M204 S6000
G1 X145.921 Y172.8 E-.08659
G1 X145.886 Y173.014 E-.08251
G1 X145.923 Y173.228 E-.08239
G1 X145.972 Y173.324 E-.04115
G1 X146.125 Y173.478 E-.08248
G1 X146.325 Y173.553 E-.08114
G1 X146.547 Y173.554 E-.08453
G1 X146.651 Y173.526 E-.0408
G1 X146.747 Y173.478 E-.04088
G1 X146.899 Y173.326 E-.08176
G1 X146.951 Y173.188 E-.05578
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X139.319 Y173.209 Z3.2 F42000
G1 X93.789 Y173.334 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X93.9 Y172.804 I-.462 J-.373 E.01536
G2 X93.58 Y172.281 I-1.204 J.376 E.01694
G3 X92.644 Y171.29 I4.803 J-5.475 E.03733
G3 X92.517 Y171 I1.156 J-.682 E.00867
G1 X94.115 Y171 E.04371
G1 X94.115 Y171.157 E.00429
G1 X92.808 Y171.157 E.03573
G2 X93.268 Y171.766 I2.1 J-1.109 E.02095
G3 X93.852 Y172.34 I-3.335 J3.975 E.02242
G3 X94.066 Y173.246 I-.653 J.633 E.02674
G3 X93.353 Y173.64 I-.635 J-.308 E.02376
G3 X92.631 Y173.27 I-.07 J-.754 E.02342
G3 X92.575 Y173.108 I.629 J-.306 E.00471
G1 X92.767 Y173.088 E.00528
G2 X93.564 Y173.505 I.572 J-.123 E.02806
G2 X93.749 Y173.378 I-.237 J-.544 E.00616
; WIPE_START
G1 F10727.314
M204 S6000
G1 X93.857 Y173.24 E-.06656
G1 X93.913 Y173.024 E-.08483
G1 X93.9 Y172.804 E-.08378
G1 X93.83 Y172.606 E-.07988
G1 X93.75 Y172.472 E-.05932
G1 X93.58 Y172.281 E-.09706
G1 X93.04 Y171.747 E-.28857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.776 Y172.647 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X96.374 Y173.487 I-.489 J.282 E.02994
G3 X95.241 Y173.499 I-.69 J-11.608 E.031
G1 X95.241 Y172.357 E.03123
G3 X96.248 Y172.366 I.32 J19.38 E.02754
G3 X96.744 Y172.597 I.04 J.563 E.01561
M204 S250
G1 X96.014 Y172.228 F42000
G1 F7205
M204 S5000
G1 X96.64 Y172.365 E.01751
G3 X96.877 Y173.477 I-.186 J.621 E.03795
G3 X96.495 Y173.609 I-.425 J-.615 E.01119
G3 X95.012 Y173.628 I-.922 J-13.891 E.04056
G1 X95.012 Y171 E.07186
G1 X95.241 Y171 E.00625
G1 X95.241 Y172.255 E.03432
G2 X95.921 Y172.212 I.16 J-2.82 E.01868
G2 X96.317 Y171.864 I-.303 J-.744 E.01468
G2 X96.901 Y171 I-34.718 J-24.131 E.02851
G1 X97.184 Y171 E.00775
G3 X96.618 Y171.813 I-5.563 J-3.276 E.02711
G1 X96.063 Y172.194 E.01841
; WIPE_START
G1 F10727.314
M204 S6000
G1 X96.64 Y172.365 E-.22836
G1 X96.806 Y172.434 E-.06863
G1 X96.901 Y172.502 E-.04407
G1 X97.007 Y172.631 E-.06362
G1 X97.071 Y172.789 E-.06485
G1 X97.092 Y172.975 E-.07131
G1 X97.066 Y173.176 E-.07676
G1 X96.99 Y173.347 E-.07119
G1 X96.877 Y173.477 E-.06575
G1 X96.864 Y173.484 E-.00545
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.471 Y171.115 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X98.623 Y171.053 I.291 J.498 E.00449
G3 X99.213 Y171.558 I.048 J.541 E.02367
G3 X99.214 Y173.031 I-5.411 J.739 E.04038
G3 X98.784 Y173.535 I-.579 J-.058 E.01929
G3 X98.189 Y173.031 I-.053 J-.54 E.02379
G3 X98.188 Y171.557 I4.617 J-.739 E.04049
G3 X98.421 Y171.148 I.574 J.056 E.01324
M204 S250
G1 X98.213 Y171.135 F42000
G1 F7205
M204 S5000
G3 X98.785 Y170.954 I.473 J.498 E.01696
G3 X99.36 Y171.415 I-.044 J.644 E.02144
G3 X99.361 Y173.172 I-2.969 J.881 E.04872
G3 X98.053 Y173.203 I-.659 J-.217 E.04665
G3 X98.073 Y171.325 I2.739 J-.911 E.05234
G3 X98.172 Y171.179 I.613 J.309 E.00484
; WIPE_START
G1 F10727.314
M204 S6000
G1 X98.386 Y171.015 E-.10239
G1 X98.592 Y170.956 E-.08135
G1 X98.785 Y170.954 E-.07322
G1 X98.961 Y170.989 E-.0682
G1 X99.117 Y171.071 E-.06706
G1 X99.259 Y171.22 E-.07829
G1 X99.36 Y171.415 E-.08313
G1 X99.419 Y171.605 E-.07571
G1 X99.468 Y171.897 E-.11249
G1 X99.471 Y171.944 E-.01816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.536 Y172.418 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G1 X100.714 Y173.426 E.02801
G1 X101.771 Y173.426 E.02889
G1 X101.771 Y173.587 E.0044
G1 X100.593 Y173.587 E.0322
G1 X100.363 Y172.371 E.03385
G1 X100.542 Y172.345 E.00493
G2 X101.598 Y172.237 I.488 J-.446 E.03369
G2 X101.518 Y171.242 I-.911 J-.428 E.02856
G2 X100.503 Y171.439 I-.448 J.403 E.03394
G1 X100.306 Y171.418 E.00543
G3 X101.2 Y170.96 I.726 J.315 E.02976
G3 X101.898 Y171.935 I-.14 J.838 E.03642
G3 X100.955 Y172.594 I-.717 J-.022 E.03651
G1 X100.591 Y172.441 E.01079
; OBJECT_ID: 7
; WIPE_START
G1 F10727.314
M204 S6000
G1 X100.714 Y173.426 E-.37734
G1 X101.721 Y173.426 E-.38266
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X94.096 Y173.104 Z3.2 F42000
G1 X48.008 Y171.158 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X48.468 Y171.767 I2.102 J-1.11 E.02096
G3 X49.052 Y172.341 I-3.334 J3.974 E.02241
G3 X49.266 Y173.248 I-.654 J.633 E.02674
G3 X48.553 Y173.642 I-.635 J-.308 E.02376
G3 X47.831 Y173.271 I-.07 J-.754 E.02343
G3 X47.775 Y173.109 I.628 J-.306 E.0047
G1 X47.967 Y173.09 E.00528
G2 X48.76 Y173.507 I.571 J-.122 E.02792
G2 X49.1 Y172.805 I-.231 J-.545 E.02329
G2 X48.78 Y172.282 I-1.204 J.376 E.01694
G3 X47.844 Y171.291 I4.802 J-5.474 E.03733
G3 X47.717 Y171.002 I1.158 J-.683 E.00867
G1 X49.315 Y171.002 E.04371
G1 X49.315 Y171.158 E.00429
G1 X48.068 Y171.158 E.03409
; WIPE_START
G1 F10727.314
M204 S6000
G1 X48.259 Y171.539 E-.16169
G1 X48.468 Y171.767 E-.11772
G1 X49.052 Y172.341 E-.31109
G1 X49.22 Y172.6 E-.11712
G1 X49.265 Y172.73 E-.05237
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X51.976 Y172.648 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X51.574 Y173.488 I-.489 J.282 E.02994
G3 X50.441 Y173.5 I-.69 J-11.602 E.031
G1 X50.441 Y172.358 E.03123
G3 X51.448 Y172.368 I.32 J19.38 E.02754
G3 X51.944 Y172.598 I.04 J.563 E.01561
M204 S250
G1 X51.214 Y172.23 F42000
G1 F7205
M204 S5000
G1 X51.84 Y172.366 E.01751
G3 X52.077 Y173.479 I-.186 J.621 E.03795
G3 X51.695 Y173.61 I-.425 J-.615 E.01119
G3 X50.212 Y173.63 I-.922 J-13.886 E.04056
G1 X50.212 Y171.002 E.07186
G1 X50.441 Y171.002 E.00625
G1 X50.441 Y172.257 E.03432
G2 X51.121 Y172.213 I.16 J-2.819 E.01869
G2 X51.517 Y171.865 I-.304 J-.744 E.01468
G2 X52.101 Y171.002 I-34.784 J-24.175 E.02851
G1 X52.384 Y171.002 E.00775
G3 X51.818 Y171.814 I-5.567 J-3.279 E.02711
G1 X51.263 Y172.196 E.01841
; WIPE_START
G1 F10727.314
M204 S6000
G1 X51.84 Y172.366 E-.22835
G1 X52.006 Y172.436 E-.06866
G1 X52.101 Y172.503 E-.04405
G1 X52.207 Y172.632 E-.0636
G1 X52.271 Y172.79 E-.06489
G1 X52.292 Y172.977 E-.0713
G1 X52.266 Y173.177 E-.07676
G1 X52.19 Y173.348 E-.07119
G1 X52.077 Y173.479 E-.06571
G1 X52.065 Y173.486 E-.00549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X53.823 Y171.055 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G1 X53.945 Y171.051 E.00332
G3 X54.413 Y171.56 I-.086 J.549 E.02042
G3 X54.464 Y172.297 I-5.867 J.772 E.02023
G3 X54.366 Y173.192 I-2.708 J.156 E.02472
G3 X53.984 Y173.536 I-.479 J-.146 E.01477
G3 X53.389 Y173.032 I-.054 J-.54 E.02379
G3 X53.352 Y171.834 I6.065 J-.786 E.03283
G3 X53.431 Y171.413 I1.356 J.037 E.01177
G3 X53.766 Y171.072 I.518 J.174 E.01352
M204 S250
G1 X53.415 Y171.138 F42000
G1 F7205
M204 S5000
G3 X53.985 Y170.955 I.476 J.506 E.01692
G3 X54.56 Y171.416 I-.044 J.645 E.02145
G3 X54.561 Y173.173 I-2.968 J.88 E.04872
G3 X53.253 Y173.205 I-.659 J-.217 E.04665
G3 X53.275 Y171.323 I2.736 J-.91 E.05243
G3 X53.373 Y171.181 I.616 J.321 E.00473
; WIPE_START
G1 F10727.314
M204 S6000
G1 X53.586 Y171.017 E-.10235
G1 X53.792 Y170.957 E-.08132
G1 X53.985 Y170.955 E-.07324
G1 X54.161 Y170.99 E-.06825
G1 X54.317 Y171.073 E-.06709
G1 X54.469 Y171.236 E-.08468
G1 X54.56 Y171.416 E-.07677
G1 X54.619 Y171.606 E-.07558
G1 X54.668 Y171.898 E-.11252
G1 X54.671 Y171.946 E-.0182
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X56.645 Y172.239 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X56.406 Y171.076 I-.518 J-.5 E.03819
G2 X55.656 Y171.47 I-.177 J.574 E.02571
G1 X55.472 Y171.447 E.00508
G3 X56.324 Y170.955 I.72 J.264 E.02922
G3 X56.964 Y172.026 I-.021 J.739 E.04057
G3 X56.702 Y172.223 I-.43 J-.297 E.00911
M204 S250
G1 X56.676 Y172.787 F42000
G1 F7205
M204 S5000
G2 X56.524 Y172.592 I-.488 J.225 E.00681
G2 X56.213 Y172.459 I-.513 J.765 E.0093
G1 X56.205 Y172.399 E.00166
G1 X56.252 Y172.401 E.0013
G1 X56.687 Y172.661 E.01384
G3 X56.638 Y173.528 I-.281 J.42 E.02862
G3 X55.609 Y173.374 I-.421 J-.7 E.03087
G3 X55.523 Y173.197 I.749 J-.472 E.00538
G1 X55.674 Y173.172 E.00419
G2 X56.698 Y172.843 I.513 J-.16 E.04641
; OBJECT_ID: 3
; WIPE_START
G1 F10727.314
M204 S6000
G1 X56.615 Y172.692 E-.06526
G1 X56.524 Y172.592 E-.05142
G1 X56.424 Y172.524 E-.0459
G1 X56.213 Y172.459 E-.08386
G1 X56.205 Y172.399 E-.0231
G1 X56.252 Y172.401 E-.018
G1 X56.687 Y172.661 E-.19237
G1 X56.81 Y172.772 E-.06317
G1 X56.864 Y172.851 E-.03637
G1 X56.908 Y172.976 E-.05031
G1 X56.913 Y173.11 E-.05111
G1 X56.857 Y173.292 E-.07213
G1 X56.846 Y173.307 E-.007
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X56.818 Y165.674 Z3.2 F42000
G1 X56.557 Y94.759 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X57.019 Y95.367 I2.128 J-1.134 E.02098
G3 X57.602 Y95.941 I-3.332 J3.972 E.02241
G3 X57.816 Y96.848 I-.668 J.636 E.0267
G3 X57.103 Y97.242 I-.635 J-.308 E.02376
G3 X56.381 Y96.872 I-.07 J-.753 E.02343
G3 X56.325 Y96.709 I.629 J-.306 E.0047
G1 X56.517 Y96.69 E.00528
G2 X57.315 Y97.106 I.572 J-.123 E.02806
G2 X57.65 Y96.406 I-.238 J-.544 E.02315
G2 X57.33 Y95.882 I-1.204 J.376 E.01695
G3 X56.394 Y94.891 I4.802 J-5.474 E.03733
G3 X56.267 Y94.602 I1.158 J-.683 E.00867
G1 X57.865 Y94.602 E.04371
G1 X57.865 Y94.759 E.00429
G1 X56.617 Y94.759 E.03413
; WIPE_START
G1 F10727.314
M204 S6000
G1 X56.809 Y95.139 E-.16202
G1 X57.019 Y95.367 E-.11763
G1 X57.602 Y95.941 E-.31111
G1 X57.77 Y96.2 E-.11715
G1 X57.815 Y96.33 E-.05209
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.596 Y96.671 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G1 X60.825 Y96.725 E.00643
G3 X59.869 Y97.281 I-.878 J-.41 E.03216
G3 X58.706 Y96.37 I-.053 J-1.131 E.04402
G3 X58.834 Y95.108 I1.844 J-.45 E.03538
G3 X59.941 Y94.555 I.976 J.569 E.0358
G3 X60.842 Y95.209 I-.022 J.978 E.0324
G1 X60.62 Y95.28 E.00635
G2 X58.958 Y95.399 I-.816 J.274 E.06208
G2 X59.006 Y96.589 I2.281 J.503 E.03293
G2 X60.567 Y96.723 I.813 J-.314 E.05324
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.825 Y96.725 E-.09787
G1 X60.677 Y96.965 E-.10705
G1 X60.505 Y97.112 E-.08602
G1 X60.307 Y97.211 E-.08406
G1 X60.182 Y97.247 E-.04928
G1 X59.869 Y97.281 E-.11959
G1 X59.725 Y97.274 E-.05488
G1 X59.479 Y97.228 E-.09529
G1 X59.318 Y97.163 E-.06595
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.856 Y94.87 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X62.963 Y95.16 I-.43 J.325 E.00858
G3 X62.964 Y96.633 I-5.412 J.739 E.0404
G3 X62.534 Y97.137 I-.577 J-.057 E.01929
G3 X61.939 Y96.633 I-.051 J-.542 E.02376
G3 X61.938 Y95.163 I4.614 J-.739 E.04036
G3 X62.33 Y94.664 I.6 J.068 E.01826
G3 X62.817 Y94.824 I.096 J.531 E.01461
M204 S250
G1 X63.023 Y94.834 F42000
G1 F7205
M204 S5000
G3 X63.11 Y95.016 I-.532 J.366 E.00556
G3 X63.111 Y96.773 I-2.969 J.88 E.04872
G3 X61.803 Y96.805 I-.659 J-.217 E.04665
G3 X61.821 Y94.931 I2.744 J-.912 E.05219
G3 X62.535 Y94.556 I.616 J.304 E.02358
G3 X62.986 Y94.786 I-.044 J.645 E.01425
; WIPE_START
G1 F10727.314
M204 S6000
G1 X63.11 Y95.016 E-.09931
G1 X63.169 Y95.206 E-.07563
G1 X63.218 Y95.498 E-.11252
G1 X63.238 Y95.895 E-.15096
G1 X63.216 Y96.312 E-.15873
G1 X63.169 Y96.587 E-.10606
G1 X63.125 Y96.73 E-.05679
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.412 Y96.193 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X65.324 Y96.73 I.37 J.415 E.05722
G2 X65.146 Y96.183 I-.607 J-.104 E.01636
G1 X65.266 Y96.245 E.00369
G3 X65.007 Y97.222 I-.311 J.44 E.03584
G3 X64.203 Y97.03 I-.227 J-.83 E.02357
G3 X64.357 Y96.216 I.381 J-.35 E.02629
M204 S250
G1 X64.177 Y95.328 F42000
G1 F7205
M204 S5000
G3 X64.676 Y94.645 I.672 J-.033 E.02504
G3 X65.401 Y95.323 I.106 J.613 E.03142
G3 X64.192 Y95.44 I-.606 J.049 E.05166
G3 X64.182 Y95.388 I.656 J-.146 E.00146
M204 S250
G1 X64.054 Y95.538 F42000
G1 F7205
M204 S5000
G3 X64.487 Y94.596 I.618 J-.287 E.03224
G3 X64.898 Y94.553 I.331 J1.193 E.01137
G3 X65.424 Y95.719 I-.015 J.708 E.04364
G3 X65.295 Y95.814 I-.423 J-.442 E.00437
G1 X64.845 Y96.028 E.01365
G1 X64.947 Y96.081 E.00314
G2 X64.639 Y96.077 I-.162 J.713 E.00848
G1 X64.725 Y96.033 E.00264
G1 X64.283 Y95.811 E.01352
G3 X64.082 Y95.592 I.39 J-.559 E.0082
; OBJECT_ID: 1
; WIPE_START
G1 F10727.314
M204 S6000
G1 X64.003 Y95.383 E-.08498
G1 X64.001 Y95.161 E-.08428
G1 X64.057 Y94.956 E-.08087
G1 X64.172 Y94.788 E-.07707
G1 X64.309 Y94.677 E-.06701
G1 X64.487 Y94.596 E-.07431
G1 X64.712 Y94.552 E-.08712
G1 X64.898 Y94.553 E-.07087
G1 X65.038 Y94.572 E-.0534
G1 X65.232 Y94.644 E-.07873
G1 X65.235 Y94.646 E-.00137
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X64.202 Y87.083 Z3.2 F42000
G1 X56.06 Y27.459 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G2 X56.519 Y28.067 I2.073 J-1.085 E.02094
G3 X57.102 Y28.641 I-3.332 J3.973 E.02241
G3 X57.316 Y29.548 I-.668 J.637 E.0267
G3 X56.603 Y29.942 I-.635 J-.308 E.02376
G3 X55.881 Y29.572 I-.07 J-.753 E.02343
G3 X55.825 Y29.409 I.63 J-.306 E.00471
G1 X56.017 Y29.39 E.00528
G2 X56.815 Y29.806 I.572 J-.123 E.02806
G2 X57.15 Y29.106 I-.238 J-.544 E.02315
G2 X56.83 Y28.582 I-1.204 J.376 E.01695
G3 X55.894 Y27.591 I4.802 J-5.474 E.03733
G3 X55.767 Y27.302 I1.158 J-.683 E.00867
G1 X57.365 Y27.302 E.04371
G1 X57.365 Y27.459 E.00429
G1 X56.12 Y27.459 E.03405
; WIPE_START
G1 F10727.314
M204 S6000
G1 X56.309 Y27.839 E-.16129
G1 X56.519 Y28.067 E-.11789
G1 X57.102 Y28.641 E-.31109
G1 X57.27 Y28.9 E-.11715
G1 X57.315 Y29.031 E-.05259
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.096 Y29.371 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G1 X60.325 Y29.425 E.00643
G3 X59.369 Y29.981 I-.878 J-.41 E.03216
G3 X58.206 Y29.07 I-.053 J-1.131 E.04402
G3 X58.334 Y27.808 I1.844 J-.45 E.03538
G3 X59.441 Y27.255 I.976 J.569 E.0358
G3 X60.342 Y27.909 I-.022 J.978 E.0324
G1 X60.12 Y27.98 E.00635
G2 X58.458 Y28.099 I-.816 J.274 E.06208
G2 X58.506 Y29.289 I2.281 J.503 E.03293
G2 X60.067 Y29.423 I.813 J-.314 E.05324
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.325 Y29.425 E-.09788
G1 X60.177 Y29.666 E-.10707
G1 X60.005 Y29.812 E-.08601
G1 X59.807 Y29.911 E-.08406
G1 X59.682 Y29.947 E-.04928
G1 X59.369 Y29.981 E-.11959
G1 X59.225 Y29.974 E-.05488
G1 X58.979 Y29.928 E-.09533
G1 X58.818 Y29.863 E-.06591
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.321 Y29.66 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G3 X62.034 Y29.837 I-.434 J-.385 E.00934
G3 X61.439 Y29.333 I-.053 J-.54 E.02379
G3 X61.438 Y27.863 I4.613 J-.739 E.04036
G3 X61.83 Y27.364 I.6 J.068 E.01825
G3 X62.463 Y27.86 I.096 J.531 E.02484
G3 X62.464 Y29.333 I-5.412 J.739 E.0404
G3 X62.358 Y29.614 I-.577 J-.057 E.00832
M204 S250
G1 X62.519 Y29.656 F42000
G1 F7205
M204 S5000
G3 X61.303 Y29.505 I-.568 J-.4 E.04104
G3 X61.321 Y27.631 I2.744 J-.912 E.05219
G3 X62.035 Y27.256 I.616 J.304 E.02358
G3 X62.61 Y27.716 I-.044 J.645 E.02145
G3 X62.611 Y29.473 I-2.969 J.88 E.04871
G3 X62.551 Y29.606 I-.659 J-.217 E.00397
; WIPE_START
G1 F10727.314
M204 S6000
G1 X62.37 Y29.816 E-.10561
G1 X62.212 Y29.901 E-.06831
G1 X61.951 Y29.942 E-.10025
G1 X61.692 Y29.902 E-.09976
G1 X61.535 Y29.82 E-.06714
G1 X61.417 Y29.704 E-.06274
G1 X61.303 Y29.505 E-.08725
G1 X61.233 Y29.287 E-.08714
G1 X61.197 Y29.074 E-.0818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.255 Y28.699 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F7205
M204 S5000
G1 X64.302 Y28.701 E.0013
G1 X64.737 Y28.961 E.01384
G3 X64.688 Y29.829 I-.28 J.42 E.02864
G3 X63.659 Y29.674 I-.424 J-.68 E.03099
G3 X63.573 Y29.498 I.749 J-.472 E.00538
G1 X63.724 Y29.472 E.0042
G2 X64.532 Y28.86 I.513 J-.162 E.05626
G2 X64.263 Y28.759 I-.568 J1.098 E.00788
G1 X64.263 Y28.758 E.00002
M204 S250
G1 X64.695 Y28.539 F42000
G1 F7205
M204 S5000
G2 X64.461 Y27.377 I-.519 J-.5 E.03806
G2 X63.705 Y27.77 I-.181 J.575 E.02587
G1 X63.522 Y27.746 E.00507
G3 X64.365 Y27.255 I.733 J.289 E.02877
G3 X65.036 Y28.288 I-.025 J.751 E.0395
G3 X64.752 Y28.524 I-.441 J-.242 E.01034
; WIPE_START
G1 F10727.314
M204 S6000
G1 X64.765 Y28.46 E-.02501
G1 X64.851 Y28.292 E-.0715
G1 X64.889 Y28.04 E-.09675
G1 X64.879 Y27.902 E-.05258
G1 X64.849 Y27.773 E-.05056
G1 X64.759 Y27.599 E-.07442
G1 X64.63 Y27.466 E-.07039
G1 X64.461 Y27.377 E-.0724
G1 X64.34 Y27.352 E-.04699
G1 X64.219 Y27.352 E-.04595
G1 X64.001 Y27.415 E-.08647
G1 X63.863 Y27.525 E-.067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 1
M625
; object ids of layer 14 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.2 F4000
            G39.3 S1
            G0 Z3.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer14 end: 1,2,3,4,5,6,7,8,9
M625
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 15/15
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 2
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
G1 X137.126 Y27.459 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X137.998 Y28.424 I3.683 J-2.449 E.03568
G3 X138.465 Y29.295 I-.762 J.969 E.02781
G3 X137.7 Y29.942 I-.68 J-.029 E.03078
G3 X136.977 Y29.564 I-.072 J-.743 E.02362
G3 X136.925 Y29.409 I.794 J-.356 E.00446
G1 X137.117 Y29.39 E.00529
G2 X137.964 Y29.786 I.574 J-.125 E.02954
G2 X138.197 Y28.943 I-.317 J-.542 E.02646
G2 X137.868 Y28.52 I-1.472 J.805 E.01473
G3 X136.994 Y27.591 I4.503 J-5.113 E.03494
G3 X136.867 Y27.302 I1.14 J-.671 E.00864
G1 X138.465 Y27.302 E.04369
G1 X138.465 Y27.459 E.00429
G1 X137.186 Y27.459 E.03496
; WIPE_START
G1 F10727.314
M204 S6000
G1 X137.487 Y27.934 E-.21386
G1 X137.998 Y28.424 E-.26875
G1 X138.202 Y28.641 E-.11355
G1 X138.372 Y28.904 E-.11881
G1 X138.412 Y29.015 E-.04504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.221 Y27.98 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X139.551 Y28.128 I-.817 J.276 E.06293
G2 X139.599 Y29.27 I2.424 J.47 E.03155
G2 X141.197 Y29.371 I.821 J-.297 E.05543
G1 X141.426 Y29.426 E.00644
G3 X140.47 Y29.981 I-.871 J-.398 E.03225
G3 X139.266 Y28.838 I-.03 J-1.173 E.05041
G3 X139.495 Y27.714 I1.694 J-.241 E.03199
G3 X140.493 Y27.253 I.922 J.687 E.03135
G3 X141.443 Y27.909 I.016 J.992 E.03368
G1 X141.278 Y27.961 E.00473
; WIPE_START
G1 F10727.314
M204 S6000
G1 X141.107 Y27.751 E-.10303
G1 X141.034 Y27.656 E-.0454
G1 X140.909 Y27.543 E-.06397
G1 X140.803 Y27.478 E-.04741
G1 X140.602 Y27.408 E-.08093
G1 X140.329 Y27.395 E-.10388
G1 X140.041 Y27.474 E-.11357
G1 X139.819 Y27.627 E-.10233
G1 X139.66 Y27.834 E-.09947
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.209 Y29.808 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X142.584 Y29.491 I-.159 J-.461 E.02139
G3 X142.538 Y27.859 I4.112 J-.931 E.04493
G3 X142.964 Y27.357 I.578 J.059 E.01913
G3 X143.4 Y27.498 I.068 J.534 E.01296
G3 X143.605 Y28.241 I-1.055 J.691 E.0214
G3 X143.516 Y29.49 I-3.581 J.374 E.03444
G3 X143.264 Y29.785 I-.466 J-.144 E.0109
M204 S250
G1 X142.59 Y29.778 F42000
G1 F7482
M204 S5000
G3 X142.368 Y29.41 I.458 J-.527 E.01195
G3 X142.395 Y27.69 I2.99 J-.814 E.04768
G3 X143.095 Y27.253 I.65 J.263 E.02414
G3 X143.735 Y27.783 I-.014 J.668 E.0245
G3 X143.699 Y29.505 I-3.072 J.798 E.0477
G3 X142.637 Y29.816 I-.651 J-.254 E.03493
; WIPE_START
G1 F10727.314
M204 S6000
G1 X142.451 Y29.603 E-.10743
G1 X142.368 Y29.41 E-.07966
G1 X142.282 Y28.982 E-.1659
G1 X142.266 Y28.475 E-.19277
G1 X142.284 Y28.181 E-.11173
G1 X142.323 Y27.928 E-.09764
G1 X142.327 Y27.915 E-.00486
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.885 Y28.716 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G1 X145.064 Y29.728 E.02809
G1 X146.121 Y29.728 E.02889
G1 X146.121 Y29.889 E.0044
G1 X144.943 Y29.889 E.0322
G1 X144.713 Y28.672 E.03385
G1 X144.892 Y28.646 E.00494
G2 X146.04 Y28.108 I.485 J-.459 E.04568
G2 X145.549 Y27.347 I-.712 J-.08 E.02683
G2 X144.853 Y27.74 I-.124 J.592 E.02386
G1 X144.656 Y27.72 E.00544
G3 X145.487 Y27.257 I.701 J.28 E.02816
G3 X146.247 Y28.25 I-.071 J.841 E.03852
G3 X145.295 Y28.892 I-.719 J-.039 E.03633
G1 X144.941 Y28.74 E.01056
; OBJECT_ID: 4
; WIPE_START
G1 F10727.314
M204 S6000
G1 X145.064 Y29.728 E-.37836
G1 X146.068 Y29.728 E-.38164
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X144.45 Y37.187 Z3.4 F42000
G1 X130.11 Y103.258 Z3.4
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X130.981 Y104.223 I3.691 J-2.458 E.03567
G3 X131.449 Y105.094 I-.769 J.974 E.02781
G3 X130.684 Y105.742 I-.681 J-.028 E.03079
G3 X129.961 Y105.364 I-.072 J-.743 E.02361
G3 X129.908 Y105.209 I.798 J-.357 E.00447
G1 X130.101 Y105.19 E.00529
G2 X131.227 Y104.876 I.572 J-.126 E.05209
G2 X130.852 Y104.319 I-1.118 J.349 E.01862
G3 X129.978 Y103.39 I4.502 J-5.111 E.03493
G3 X129.851 Y103.102 I1.14 J-.671 E.00864
G1 X131.449 Y103.102 E.04369
G1 X131.449 Y103.258 E.00429
G1 X130.17 Y103.258 E.03497
; WIPE_START
G1 F10727.314
M204 S6000
G1 X130.471 Y103.734 E-.21391
G1 X130.981 Y104.223 E-.26848
G1 X131.186 Y104.441 E-.11385
G1 X131.356 Y104.704 E-.11886
G1 X131.395 Y104.815 E-.04491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.589 Y103.23 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G1 X132.589 Y105.705 E.06769
G1 X132.361 Y105.705 E.00625
G1 X132.361 Y103.102 E.07119
G1 X134.098 Y103.102 E.04753
G1 X134.098 Y103.23 E.0035
G1 X132.649 Y103.23 E.03964
; WIPE_START
G1 F10727.314
M204 S6000
G1 X132.601 Y105.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.406 Y105.608 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X135.1 Y105.291 I.16 J-.462 E.0125
G3 X135.055 Y103.658 I4.113 J-.931 E.04495
G3 X135.481 Y103.157 I.578 J.059 E.01916
G3 X135.932 Y103.317 I.065 J.531 E.01356
G3 X136.121 Y104.041 I-1.079 J.668 E.02079
G3 X136.038 Y105.276 I-3.664 J.373 E.03399
G3 X135.464 Y105.624 I-.471 J-.13 E.02022
M204 S250
G1 X135.686 Y105.737 F42000
G1 F7482
M204 S5000
G3 X134.884 Y105.21 I-.122 J-.688 E.02894
G3 X134.911 Y103.489 I2.989 J-.814 E.0477
G3 X135.612 Y103.053 I.64 J.249 E.0242
G3 X136.251 Y103.583 I-.014 J.666 E.0245
G3 X136.181 Y105.377 I-2.716 J.793 E.04997
G3 X135.745 Y105.724 I-.617 J-.329 E.01569
; WIPE_START
G1 F10727.314
M204 S6000
G1 X135.461 Y105.736 E-.10805
G1 X135.253 Y105.68 E-.08158
G1 X135.098 Y105.574 E-.07151
G1 X134.967 Y105.403 E-.08198
G1 X134.884 Y105.21 E-.07973
G1 X134.799 Y104.782 E-.16587
G1 X134.784 Y104.331 E-.17129
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.299 Y104.348 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X138.128 Y103.196 I-.514 J-.512 E.03697
G2 X137.32 Y103.57 I-.221 J.581 E.0271
G1 X137.137 Y103.547 E.00504
G3 X137.943 Y103.053 I.724 J.276 E.0278
G3 X138.629 Y104.126 I.021 J.742 E.04187
G3 X138.357 Y104.33 I-.483 J-.361 E.00944
M204 S250
G1 X138.334 Y104.896 F42000
M73 P98 R0
G1 F7482
M204 S5000
G2 X137.879 Y104.559 I-.523 J.229 E.01622
G1 X137.871 Y104.498 E.00167
G1 X137.917 Y104.501 E.00126
G1 X138.353 Y104.761 E.01389
G3 X138.351 Y105.595 I-.265 J.416 E.02716
G3 X137.275 Y105.475 I-.471 J-.655 E.03244
G3 X137.189 Y105.297 I.624 J-.415 E.00541
G1 X137.341 Y105.272 E.00421
G2 X138.38 Y105.176 I.51 J-.151 E.04001
G2 X138.356 Y104.953 I-.569 J-.05 E.00619
; OBJECT_ID: 5
; WIPE_START
G1 F10727.314
M204 S6000
G1 X138.241 Y104.743 E-.09077
G1 X138.092 Y104.626 E-.07209
G1 X137.879 Y104.559 E-.0848
G1 X137.871 Y104.498 E-.02318
G1 X137.917 Y104.501 E-.01747
G1 X138.353 Y104.761 E-.19302
G1 X138.448 Y104.842 E-.04739
G1 X138.53 Y104.951 E-.05188
G1 X138.564 Y105.032 E-.03351
G1 X138.581 Y105.16 E-.04887
G1 X138.569 Y105.269 E-.04186
G1 X138.525 Y105.389 E-.04857
G1 X138.516 Y105.404 E-.00661
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X146.135 Y104.954 Z3.4 F42000
G1 X174.91 Y103.257 Z3.4
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X175.782 Y104.222 I3.682 J-2.448 E.03568
G3 X176.249 Y105.093 I-.769 J.973 E.02779
G3 X175.484 Y105.74 I-.681 J-.028 E.03079
G3 X174.736 Y105.302 I-.074 J-.731 E.02536
G3 X174.708 Y105.208 I.632 J-.237 E.00269
G1 X174.901 Y105.188 E.00529
G2 X176.027 Y104.875 I.572 J-.126 E.05209
G2 X175.652 Y104.318 I-1.117 J.349 E.01862
G3 X174.778 Y103.389 I4.51 J-5.12 E.03493
G3 X174.651 Y103.1 I1.142 J-.672 E.00864
G1 X176.249 Y103.1 E.04369
G1 X176.249 Y103.257 E.00429
G1 X174.97 Y103.257 E.03496
; WIPE_START
G1 F10727.314
M204 S6000
G1 X175.271 Y103.733 E-.21387
G1 X175.782 Y104.222 E-.26871
G1 X175.986 Y104.44 E-.11359
G1 X176.156 Y104.702 E-.11877
G1 X176.195 Y104.814 E-.04505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.389 Y103.228 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G1 X177.389 Y105.704 E.06769
G1 X177.161 Y105.704 E.00625
G1 X177.161 Y103.1 E.07119
G1 X178.898 Y103.1 E.04752
G1 X178.898 Y103.228 E.0035
G1 X177.449 Y103.228 E.03964
; WIPE_START
G1 F10727.314
M204 S6000
G1 X177.401 Y105.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X180.205 Y105.606 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X179.9 Y105.29 I.162 J-.461 E.01248
G3 X179.854 Y103.658 I4.11 J-.931 E.04493
G3 X180.28 Y103.156 I.578 J.059 E.01913
G3 X180.732 Y103.316 I.069 J.525 E.01363
G3 X180.921 Y104.04 I-1.08 J.668 E.02078
G3 X180.838 Y105.274 I-3.667 J.373 E.03399
G3 X180.263 Y105.623 I-.471 J-.129 E.02028
M204 S250
G1 X180.708 Y105.656 F42000
G1 F7482
M204 S5000
G3 X179.684 Y105.208 I-.344 J-.609 E.03542
G3 X179.711 Y103.487 I2.989 J-.814 E.0477
G3 X180.412 Y103.052 I.64 J.249 E.0242
G3 X181.051 Y103.582 I-.017 J.671 E.02447
G3 X180.981 Y105.376 I-2.716 J.793 E.04997
G3 X180.759 Y105.624 I-.617 J-.329 E.0092
; WIPE_START
G1 F10727.314
M204 S6000
G1 X180.476 Y105.734 E-.11531
G1 X180.261 Y105.734 E-.08192
G1 X180.053 Y105.679 E-.08159
G1 X179.898 Y105.573 E-.07151
G1 X179.767 Y105.401 E-.08197
G1 X179.684 Y105.208 E-.07973
G1 X179.599 Y104.78 E-.16587
G1 X179.592 Y104.564 E-.08211
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X182.202 Y104.515 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G1 X182.38 Y105.526 E.0281
G1 X183.437 Y105.526 E.02889
G1 X183.437 Y105.687 E.0044
G1 X182.259 Y105.687 E.0322
G1 X182.03 Y104.471 E.03385
G1 X182.208 Y104.445 E.00494
G2 X183.184 Y104.452 I.492 J-.483 E.02964
G2 X183.323 Y103.618 I-.79 J-.56 E.02393
G2 X182.17 Y103.539 I-.588 J.12 E.04267
G1 X181.972 Y103.518 E.00544
G3 X182.803 Y103.055 I.702 J.282 E.02815
G3 X183.563 Y104.049 I-.071 J.841 E.03852
G3 X182.611 Y104.691 I-.719 J-.039 E.03633
G1 X182.257 Y104.538 E.01056
; OBJECT_ID: 6
; WIPE_START
G1 F10727.314
M204 S6000
G1 X182.38 Y105.526 E-.37843
G1 X183.385 Y105.526 E-.38157
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X191.003 Y105.058 Z3.4 F42000
G1 X220.31 Y103.257 Z3.4
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X221.181 Y104.222 I3.686 J-2.453 E.03567
G3 X221.649 Y105.093 I-.769 J.974 E.02781
G3 X220.884 Y105.741 I-.681 J-.028 E.03079
G3 X220.161 Y105.362 I-.071 J-.745 E.02361
G3 X220.108 Y105.208 I.8 J-.358 E.00447
G1 X220.301 Y105.189 E.00529
G2 X221.427 Y104.875 I.572 J-.126 E.05208
G2 X221.052 Y104.318 I-1.117 J.349 E.01862
G3 X220.178 Y103.389 I4.506 J-5.116 E.03493
G3 X220.051 Y103.101 I1.139 J-.671 E.00864
G1 X221.649 Y103.101 E.04369
G1 X221.649 Y103.257 E.00429
G1 X220.37 Y103.257 E.03497
; WIPE_START
G1 F10727.314
M204 S6000
G1 X220.671 Y103.733 E-.21388
G1 X221.181 Y104.222 E-.26856
G1 X221.386 Y104.44 E-.11376
G1 X221.556 Y104.703 E-.11886
G1 X221.595 Y104.815 E-.04495
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X222.789 Y103.229 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G1 X222.789 Y105.704 E.06769
G1 X222.561 Y105.704 E.00625
G1 X222.561 Y103.101 E.07119
G1 X224.298 Y103.101 E.04753
G1 X224.298 Y103.229 E.0035
G1 X222.849 Y103.229 E.03964
; WIPE_START
G1 F10727.314
M204 S6000
G1 X222.801 Y105.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X225.464 Y105.534 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X225.299 Y105.287 I.302 J-.38 E.00828
G3 X225.213 Y104.045 I3.948 J-.898 E.03417
G3 X225.31 Y103.479 I1.926 J.04 E.01575
G3 X225.68 Y103.156 I.488 J.184 E.01399
G3 X226.202 Y103.424 I.074 J.5 E.01712
G3 X226.33 Y104.394 I-2.256 J.791 E.02696
G3 X226.232 Y105.289 I-3.229 J.101 E.02471
G3 X225.513 Y105.569 I-.466 J-.135 E.02439
M204 S250
G1 X225.455 Y105.676 F42000
G1 F7482
M204 S5000
G3 X225.084 Y105.209 I.31 J-.626 E.01685
G3 X225.111 Y103.488 I2.989 J-.813 E.0477
G3 X225.812 Y103.052 I.64 J.248 E.0242
G3 X226.451 Y103.582 I-.016 J.669 E.02449
G3 X226.415 Y105.304 I-3.072 J.798 E.04769
G3 X225.509 Y105.7 I-.651 J-.254 E.03004
; WIPE_START
G1 F10727.314
M204 S6000
G1 X225.298 Y105.573 E-.09372
G1 X225.169 Y105.405 E-.08059
G1 X225.084 Y105.209 E-.08127
G1 X224.999 Y104.781 E-.16583
G1 X224.982 Y104.274 E-.19276
G1 X225 Y103.98 E-.11174
G1 X225.014 Y103.892 E-.03408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X228.351 Y104.429 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X227.509 Y103.945 I-.239 J-.559 E.03079
G3 X228.009 Y103.141 I.662 J-.145 E.02866
G3 X228.717 Y103.821 I.095 J.61 E.03105
G3 X228.405 Y104.403 I-.606 J.049 E.01908
M204 S250
G1 X228.355 Y104.614 F42000
G1 F7482
M204 S5000
G2 X228.014 Y104.566 I-.283 J.776 E.00949
G1 X228.08 Y104.535 E.00199
G1 X227.596 Y104.308 E.01463
G3 X227.914 Y103.066 I.399 J-.56 E.04518
G3 X228.174 Y103.05 I.205 J1.195 E.00716
G3 X228.745 Y104.213 I.022 J.711 E.04457
G3 X228.639 Y104.296 I-.424 J-.432 E.00368
G1 X228.242 Y104.519 E.01246
G1 X228.236 Y104.522 E.00018
G1 X228.217 Y104.533 E.00061
G1 X228.304 Y104.584 E.00275
; WIPE_START
G1 F10727.314
M204 S6000
G1 X228.166 Y104.562 E-.05289
G1 X228.014 Y104.566 E-.05766
G1 X228.08 Y104.535 E-.02766
G1 X227.596 Y104.308 E-.20328
G1 X227.459 Y104.196 E-.0671
G1 X227.354 Y104.017 E-.07906
G1 X227.311 Y103.768 E-.09592
G1 X227.337 Y103.555 E-.08179
G1 X227.426 Y103.363 E-.08037
G1 X227.452 Y103.336 E-.01427
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X228.341 Y105.607 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X228.64 Y105.231 I-.242 J-.5 E.01361
G2 X228.4 Y104.64 I-.543 J-.124 E.01857
G1 X228.614 Y104.765 E.00677
G3 X228.294 Y105.726 I-.351 J.417 E.03555
G3 X227.515 Y105.524 I-.203 J-.821 E.02295
G3 X227.715 Y104.705 I.372 J-.343 E.02726
G2 X228.285 Y105.63 I.383 J.402 E.04137
; OBJECT_ID: 9
; WIPE_START
G1 F10727.314
M204 S6000
G1 X228.496 Y105.512 E-.09189
G1 X228.558 Y105.435 E-.03749
G1 X228.64 Y105.231 E-.08373
G1 X228.642 Y105.008 E-.08462
G1 X228.615 Y104.899 E-.04259
G1 X228.53 Y104.749 E-.06553
G1 X228.4 Y104.64 E-.06451
G1 X228.614 Y104.765 E-.09411
G1 X228.735 Y104.888 E-.06584
G1 X228.791 Y105.007 E-.04992
G1 X228.812 Y105.156 E-.05716
G1 X228.804 Y105.215 E-.02262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X222.632 Y109.706 Z3.4 F42000
G1 X138.176 Y171.157 Z3.4
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X139.048 Y172.122 I3.699 J-2.466 E.03569
G3 X139.515 Y172.993 I-.769 J.973 E.02779
G3 X138.75 Y173.641 I-.681 J-.028 E.03079
G3 X138.027 Y173.263 I-.072 J-.743 E.02361
G3 X137.975 Y173.108 I.796 J-.357 E.00447
G1 X138.167 Y173.089 E.00529
G2 X139.293 Y172.775 I.572 J-.126 E.05207
G2 X138.918 Y172.218 I-1.116 J.348 E.01864
G3 X138.044 Y171.289 I4.503 J-5.113 E.03493
G3 X137.917 Y171.001 I1.135 J-.669 E.00864
G1 X139.515 Y171.001 E.04369
G1 X139.515 Y171.157 E.00429
G1 X138.236 Y171.157 E.03498
; WIPE_START
G1 F10727.314
M204 S6000
G1 X138.537 Y171.633 E-.21397
G1 X139.048 Y172.122 E-.26871
G1 X139.252 Y172.34 E-.11362
G1 X139.422 Y172.603 E-.11884
G1 X139.461 Y172.714 E-.04487
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.032 Y172.488 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X141.775 Y173.487 I-.34 J.445 E.03583
G3 X140.641 Y173.499 I-.696 J-12.128 E.03103
G1 X140.641 Y172.357 E.03123
G3 X141.765 Y172.378 I.351 J11.363 E.03077
G3 X141.983 Y172.454 I-.073 J.555 E.00635
M204 S250
G1 X141.412 Y172.232 F42000
G1 F7482
M204 S5000
G1 X142.023 Y172.36 E.01708
G3 X142.434 Y173.267 I-.164 J.621 E.03116
G3 X141.992 Y173.595 I-.5 J-.212 E.01578
G3 X141.512 Y173.628 I-.442 J-2.894 E.01317
G1 X140.412 Y173.629 E.03007
G1 X140.412 Y171.001 E.07186
G1 X140.641 Y171.001 E.00625
G1 X140.641 Y172.256 E.03432
G2 X141.32 Y172.212 I.162 J-2.788 E.01866
G2 X141.729 Y171.846 I-.317 J-.765 E.01529
G2 X142.301 Y171.001 I-38.029 J-26.327 E.02792
G1 X142.584 Y171.001 E.00775
G1 X142.399 Y171.296 E.00954
G3 X141.941 Y171.877 I-1.729 J-.895 E.02035
G1 X141.462 Y172.198 E.01578
; WIPE_START
G1 F10727.314
M204 S6000
G1 X142.023 Y172.36 E-.22203
G1 X142.154 Y172.408 E-.05301
G1 X142.293 Y172.496 E-.06252
G1 X142.377 Y172.585 E-.04654
G1 X142.434 Y172.68 E-.04206
G1 X142.47 Y172.784 E-.04189
G1 X142.492 Y172.974 E-.07266
G1 X142.482 Y173.107 E-.0508
G1 X142.434 Y173.267 E-.06333
G1 X142.34 Y173.416 E-.06681
G1 X142.281 Y173.475 E-.03166
G1 X142.266 Y173.484 E-.0067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.197 Y171.066 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X144.567 Y171.397 I-.122 J.509 E.01415
G3 X144.656 Y172.643 I-3.727 J.891 E.03431
G3 X144.559 Y173.208 I-1.928 J-.04 E.01575
G3 X143.634 Y173.19 I-.459 J-.161 E.03338
G3 X143.588 Y171.558 I4.108 J-.931 E.04493
G3 X144.014 Y171.056 I.578 J.058 E.01913
G3 X144.138 Y171.056 I.062 J.52 E.00341
M204 S250
G1 X144.326 Y170.981 F42000
G1 F7482
M204 S5000
G3 X144.785 Y171.482 I-.194 J.638 E.01949
G3 X144.715 Y173.276 I-2.716 J.794 E.04998
G3 X143.418 Y173.109 I-.617 J-.329 E.04626
G3 X143.445 Y171.387 I2.989 J-.813 E.04771
G3 X144.146 Y170.952 I.64 J.249 E.0242
G3 X144.268 Y170.966 I-.014 J.666 E.00336
; WIPE_START
G1 F10727.314
M204 S6000
G1 X144.532 Y171.084 E-.10988
G1 X144.67 Y171.235 E-.07798
G1 X144.785 Y171.482 E-.10322
G1 X144.87 Y171.912 E-.16668
G1 X144.887 Y172.396 E-.18402
G1 X144.867 Y172.706 E-.11821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.786 Y172.273 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X145.843 Y171.845 I-.341 J-.503 E.03396
G3 X146.343 Y171.041 I.664 J-.144 E.02864
G3 X147.051 Y171.721 I.095 J.61 E.03103
G3 X146.834 Y172.237 I-.606 J.05 E.01593
M204 S250
G1 X146.685 Y172.512 F42000
G1 F7482
M204 S5000
G2 X146.283 Y172.477 I-.255 J.612 E.01121
G1 X146.386 Y172.423 E.00318
G1 X145.93 Y172.208 E.0138
G3 X146.248 Y170.966 I.398 J-.56 E.04519
G3 X146.508 Y170.95 I.205 J1.194 E.00716
G3 X147.079 Y172.113 I.022 J.711 E.04455
G3 X146.942 Y172.214 I-.435 J-.446 E.00469
G1 X146.518 Y172.415 E.0128
G1 X146.633 Y172.481 E.00363
M204 S250
G1 X146.728 Y172.537 F42000
G1 F7482
M204 S5000
G1 X146.948 Y172.664 E.00695
G3 X146.628 Y173.626 I-.351 J.417 E.03556
G3 X145.971 Y173.53 I-.189 J-1.012 E.01849
G3 X146.062 Y172.592 I.271 J-.447 E.03212
G2 X146.95 Y173.221 I.374 J.414 E.05459
G2 X146.776 Y172.572 I-.542 J-.202 E.01958
; OBJECT_ID: 8
; WIPE_START
G1 F10727.314
M204 S6000
G1 X146.948 Y172.664 E-.0739
G1 X147.069 Y172.788 E-.0659
G1 X147.125 Y172.907 E-.04993
G1 X147.146 Y173.056 E-.05718
G1 X147.121 Y173.235 E-.06856
G1 X147.055 Y173.373 E-.05816
G1 X146.917 Y173.514 E-.0748
G1 X146.814 Y173.572 E-.04503
G1 X146.628 Y173.626 E-.07361
G1 X146.433 Y173.641 E-.07436
G1 X146.221 Y173.623 E-.08063
G1 X146.124 Y173.6 E-.03794
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X138.492 Y173.578 Z3.4 F42000
G1 X93.014 Y173.45 Z3.4
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X93.893 Y172.775 I.325 J-.487 E.03981
G2 X93.518 Y172.218 I-1.117 J.349 E.01862
G3 X92.644 Y171.289 I4.506 J-5.115 E.03494
G3 X92.517 Y171 I1.139 J-.671 E.00864
G1 X94.115 Y171 E.04369
G1 X94.115 Y171.157 E.00429
G1 X92.776 Y171.157 E.03661
G2 X93.648 Y172.122 I3.683 J-2.45 E.03569
G3 X94.115 Y172.993 I-.769 J.973 E.02779
G3 X93.35 Y173.64 I-.681 J-.028 E.03079
G3 X92.627 Y173.262 I-.071 J-.745 E.02361
G3 X92.574 Y173.108 I.795 J-.356 E.00447
G1 X92.767 Y173.088 E.00529
G2 X92.966 Y173.414 I.572 J-.126 E.01063
; WIPE_START
G1 F10727.314
M204 S6000
G1 X93.214 Y173.532 E-.10425
G1 X93.335 Y173.542 E-.04622
G1 X93.51 Y173.521 E-.06693
G1 X93.613 Y173.484 E-.04177
G1 X93.714 Y173.422 E-.04497
G1 X93.835 Y173.282 E-.07019
G1 X93.896 Y173.128 E-.06278
G1 X93.911 Y173.04 E-.03414
G1 X93.893 Y172.775 E-.10105
G1 X93.849 Y172.648 E-.05109
G1 X93.75 Y172.473 E-.07645
G1 X93.643 Y172.356 E-.06015
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.72 Y172.572 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X96.375 Y173.487 I-.428 J.361 E.0325
G3 X95.241 Y173.499 I-.696 J-12.123 E.03103
G1 X95.241 Y172.357 E.03123
G3 X96.369 Y172.378 I.351 J11.337 E.03087
G3 X96.679 Y172.528 I-.077 J.555 E.00958
M204 S250
G1 X96.012 Y172.231 F42000
G1 F7482
M204 S5000
G1 X96.623 Y172.36 E.01708
G3 X97.034 Y173.267 I-.165 J.621 E.03115
G3 X96.592 Y173.595 I-.5 J-.211 E.01578
G3 X96.097 Y173.628 I-.447 J-2.937 E.01359
G1 X95.012 Y173.628 E.02965
G1 X95.012 Y171 E.07187
G1 X95.241 Y171 E.00625
G1 X95.241 Y172.255 E.03432
G2 X95.921 Y172.212 I.16 J-2.816 E.01868
G2 X96.329 Y171.846 I-.317 J-.765 E.01528
G2 X96.901 Y171 I-38.161 J-26.415 E.02792
G1 X97.184 Y171 E.00775
G3 X96.612 Y171.818 I-3.625 J-1.929 E.02737
G1 X96.061 Y172.197 E.01828
; WIPE_START
G1 F10727.314
M204 S6000
G1 X96.623 Y172.36 E-.22227
G1 X96.754 Y172.407 E-.0529
G1 X96.893 Y172.495 E-.06253
G1 X96.977 Y172.585 E-.04654
G1 X97.034 Y172.68 E-.04219
G1 X97.07 Y172.783 E-.04125
G1 X97.092 Y172.972 E-.07261
G1 X97.082 Y173.107 E-.05137
G1 X97.034 Y173.267 E-.06335
G1 X96.94 Y173.415 E-.06672
G1 X96.881 Y173.474 E-.03176
G1 X96.866 Y173.483 E-.00651
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.615 Y171.055 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X99.166 Y171.394 I.079 J.489 E.01927
G3 X99.264 Y172.294 I-2.563 J.732 E.02487
G3 X99.166 Y173.189 I-3.23 J.101 E.0247
G3 X98.234 Y173.19 I-.466 J-.143 E.03396
G3 X98.188 Y171.558 I4.111 J-.931 E.04493
G3 X98.558 Y171.074 I.578 J.058 E.01753
M204 S250
G1 X98.324 Y171.052 F42000
G1 F7482
M204 S5000
G3 X98.746 Y170.952 I.361 J.584 E.01207
G3 X99.385 Y171.482 I-.017 J.671 E.02447
G3 X99.315 Y173.277 I-2.715 J.793 E.04998
G3 X98.018 Y173.109 I-.617 J-.329 E.04625
G3 X98.045 Y171.387 I2.989 J-.814 E.04771
G3 X98.274 Y171.086 I.64 J.249 E.0105
; WIPE_START
G1 F10727.314
M204 S6000
G1 X98.482 Y170.979 E-.08868
G1 X98.746 Y170.952 E-.10076
G1 X99.01 Y171.009 E-.10276
G1 X99.171 Y171.117 E-.07359
G1 X99.302 Y171.288 E-.08203
G1 X99.385 Y171.482 E-.0799
G1 X99.47 Y171.912 E-.16657
G1 X99.476 Y172.084 E-.06573
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.532 Y172.395 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G1 X100.714 Y173.426 E.02865
G1 X101.771 Y173.426 E.02889
G1 X101.771 Y173.587 E.0044
G1 X100.593 Y173.587 E.0322
G1 X100.363 Y172.371 E.03385
G1 X100.542 Y172.345 E.00494
G2 X101.518 Y172.352 I.492 J-.483 E.02964
G2 X101.654 Y171.508 I-.791 J-.561 E.02421
G2 X100.503 Y171.439 I-.585 J.129 E.04238
G1 X100.306 Y171.418 E.00544
G3 X101.137 Y170.955 I.702 J.282 E.02815
G3 X101.897 Y171.949 I-.071 J.841 E.03851
G3 X100.949 Y172.592 I-.718 J-.039 E.03624
G1 X100.586 Y172.42 E.01097
; OBJECT_ID: 7
; WIPE_START
G1 F10727.314
M204 S6000
G1 X100.714 Y173.426 E-.38541
G1 X101.7 Y173.426 E-.37459
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G1 X94.068 Y173.379 Z3.4 F42000
G1 X47.967 Y173.09 Z3.4
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X49.093 Y172.776 I.572 J-.126 E.05209
G2 X48.718 Y172.219 I-1.117 J.349 E.01862
G3 X47.844 Y171.29 I4.502 J-5.112 E.03493
G3 X47.717 Y171.002 I1.139 J-.67 E.00864
G1 X49.315 Y171.002 E.04369
G1 X49.315 Y171.158 E.00429
G1 X47.977 Y171.158 E.0366
G2 X48.848 Y172.124 I3.681 J-2.447 E.03569
G3 X49.315 Y172.994 I-.769 J.973 E.02778
G3 X48.55 Y173.642 I-.681 J-.028 E.0308
G3 X47.827 Y173.263 I-.071 J-.745 E.02362
G3 X47.775 Y173.109 I.796 J-.356 E.00445
G1 X47.907 Y173.096 E.00365
; WIPE_START
G1 F10727.314
M204 S6000
G1 X48.07 Y173.327 E-.10737
G1 X48.211 Y173.456 E-.07266
G1 X48.414 Y173.533 E-.08246
G1 X48.535 Y173.543 E-.04623
G1 X48.71 Y173.522 E-.06707
G1 X48.814 Y173.486 E-.04164
G1 X48.914 Y173.423 E-.04495
G1 X49.035 Y173.283 E-.07023
G1 X49.096 Y173.13 E-.06275
G1 X49.111 Y173.041 E-.03413
G1 X49.093 Y172.776 E-.10116
G1 X49.068 Y172.703 E-.02934
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X51.756 Y173.428 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X51.575 Y173.488 I-.264 J-.494 E.00524
G3 X50.441 Y173.5 I-.696 J-12.123 E.03103
G1 X50.441 Y172.358 E.03123
G3 X51.569 Y172.379 I.351 J11.336 E.03087
G3 X51.808 Y173.397 I-.077 J.555 E.03683
; WIPE_START
G1 F10727.314
M204 S6000
G1 X51.575 Y173.488 E-.09491
G1 X50.441 Y173.5 E-.43105
G1 X50.441 Y172.884 E-.23403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X51.212 Y172.233 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G1 X51.823 Y172.361 E.01707
G3 X52.234 Y173.268 I-.164 J.621 E.03117
G3 X51.792 Y173.596 I-.5 J-.212 E.01578
G3 X51.297 Y173.63 I-.447 J-2.935 E.01359
G1 X50.212 Y173.63 E.02965
G1 X50.212 Y171.002 E.07187
G1 X50.441 Y171.002 E.00625
G1 X50.441 Y172.257 E.03432
G2 X51.121 Y172.213 I.16 J-2.812 E.01868
G2 X51.529 Y171.847 I-.317 J-.765 E.01527
G2 X52.101 Y171.002 I-38.267 J-26.485 E.02792
G1 X52.384 Y171.002 E.00775
G3 X51.812 Y171.819 I-3.625 J-1.929 E.02737
G1 X51.261 Y172.199 E.01827
; WIPE_START
G1 F10727.314
M204 S6000
G1 X51.823 Y172.361 E-.22216
G1 X51.954 Y172.409 E-.05313
G1 X52.093 Y172.497 E-.06246
G1 X52.177 Y172.586 E-.04655
G1 X52.234 Y172.681 E-.04211
G1 X52.27 Y172.784 E-.0413
G1 X52.292 Y172.974 E-.07259
G1 X52.282 Y173.109 E-.05142
G1 X52.234 Y173.268 E-.06339
G1 X52.14 Y173.417 E-.06672
G1 X52.081 Y173.476 E-.03168
G1 X52.066 Y173.484 E-.0065
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X53.678 Y171.113 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X53.815 Y171.057 I.288 J.504 E.00406
G3 X54.335 Y171.323 I.072 J.5 E.01701
G3 X54.464 Y172.295 I-2.244 J.793 E.02701
G3 X54.366 Y173.19 I-3.23 J.101 E.02471
G3 X53.433 Y173.19 I-.466 J-.143 E.03398
G3 X53.388 Y171.559 I4.111 J-.93 E.04491
G3 X53.628 Y171.145 I.578 J.058 E.01347
M204 S250
G1 X53.526 Y171.056 F42000
G1 F7482
M204 S5000
G3 X53.946 Y170.953 I.369 J.596 E.01202
G3 X54.585 Y171.483 I-.011 J.664 E.02452
G3 X54.515 Y173.278 I-2.715 J.793 E.04998
G3 X53.218 Y173.11 I-.617 J-.327 E.04632
G3 X53.245 Y171.389 I2.99 J-.814 E.04768
G3 X53.476 Y171.09 I.65 J.263 E.01048
; WIPE_START
G1 F10727.314
M204 S6000
G1 X53.682 Y170.98 E-.08853
G1 X53.946 Y170.953 E-.10078
G1 X54.126 Y170.98 E-.06941
G1 X54.333 Y171.085 E-.088
G1 X54.47 Y171.237 E-.07773
G1 X54.585 Y171.483 E-.10333
G1 X54.67 Y171.913 E-.16651
G1 X54.676 Y172.086 E-.06572
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X55.471 Y171.447 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X56.278 Y170.953 I.724 J.276 E.02782
G3 X56.963 Y172.026 I.021 J.742 E.04185
G3 X56.639 Y172.243 I-.467 J-.348 E.01087
G2 X56.462 Y171.096 I-.519 J-.507 E.03676
G2 X55.656 Y171.47 I-.221 J.579 E.02707
G1 X55.531 Y171.454 E.00345
; WIPE_START
G1 F10727.314
M204 S6000
G1 X55.569 Y171.258 E-.07595
G1 X55.745 Y171.087 E-.09332
G1 X55.863 Y171.021 E-.05124
G1 X56.031 Y170.969 E-.06705
G1 X56.278 Y170.953 E-.09389
G1 X56.441 Y170.972 E-.06264
G1 X56.635 Y171.042 E-.07808
G1 X56.819 Y171.177 E-.08688
G1 X56.937 Y171.318 E-.06978
G1 X57.02 Y171.497 E-.07511
G1 X57.022 Y171.513 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X56.205 Y172.398 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G1 X56.251 Y172.401 E.00126
G1 X56.687 Y172.661 E.01389
G3 X56.685 Y173.495 I-.265 J.416 E.02717
G3 X55.609 Y173.375 I-.47 J-.665 E.03237
G3 X55.523 Y173.197 I.623 J-.415 E.00541
G1 X55.674 Y173.172 E.00421
G2 X56.505 Y172.578 I.513 J-.16 E.05549
G2 X56.213 Y172.459 I-.487 J.779 E.00867
G1 X56.213 Y172.458 E.00004
; OBJECT_ID: 3
; WIPE_START
G1 F10727.314
M204 S6000
G1 X56.251 Y172.401 E-.02603
G1 X56.687 Y172.661 E-.19299
G1 X56.782 Y172.741 E-.0474
G1 X56.864 Y172.851 E-.05179
G1 X56.898 Y172.932 E-.03365
G1 X56.915 Y173.06 E-.04881
G1 X56.903 Y173.17 E-.04221
G1 X56.859 Y173.289 E-.04823
G1 X56.795 Y173.385 E-.04385
G1 X56.685 Y173.495 E-.05907
G1 X56.6 Y173.551 E-.03871
G1 X56.427 Y173.618 E-.07054
G1 X56.279 Y173.634 E-.05673
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X56.303 Y166.002 Z3.4 F42000
G1 X56.527 Y94.759 Z3.4
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X57.398 Y95.724 I3.681 J-2.447 E.03568
G3 X57.861 Y96.67 I-.734 J.946 E.02984
G3 X57.1 Y97.242 I-.678 J-.11 E.02876
G3 X56.352 Y96.804 I-.074 J-.731 E.02535
G3 X56.325 Y96.709 I.634 J-.237 E.00269
G1 X56.517 Y96.69 E.00529
G2 X57.643 Y96.377 I.571 J-.128 E.05194
G2 X57.268 Y95.82 I-1.116 J.348 E.01863
G3 X56.394 Y94.891 I4.507 J-5.117 E.03493
G3 X56.267 Y94.602 I1.139 J-.671 E.00864
G1 X57.865 Y94.602 E.04369
G1 X57.865 Y94.759 E.00429
G1 X56.587 Y94.759 E.03496
; WIPE_START
G1 F10727.314
M204 S6000
G1 X56.887 Y95.235 E-.21388
G1 X57.398 Y95.724 E-.26871
G1 X57.602 Y95.941 E-.11359
G1 X57.772 Y96.204 E-.11874
G1 X57.812 Y96.315 E-.04508
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.597 Y96.671 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G1 X60.826 Y96.726 E.00644
G3 X59.87 Y97.281 I-.87 J-.398 E.03225
G3 X58.666 Y96.138 I-.03 J-1.173 E.05041
G3 X58.895 Y95.014 I1.695 J-.241 E.03199
G3 X59.893 Y94.553 I.919 J.681 E.03136
G3 X60.843 Y95.209 I.016 J.992 E.03368
G1 X60.621 Y95.28 E.00637
G2 X58.951 Y95.428 I-.817 J.276 E.06293
G2 X58.999 Y96.57 I2.426 J.469 E.03155
G2 X60.568 Y96.723 I.821 J-.297 E.05379
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.826 Y96.726 E-.09812
G1 X60.68 Y96.962 E-.10573
G1 X60.574 Y97.062 E-.05513
G1 X60.427 Y97.157 E-.06672
G1 X60.173 Y97.249 E-.10253
G1 X59.87 Y97.281 E-.11608
G1 X59.729 Y97.275 E-.05362
G1 X59.485 Y97.23 E-.09419
G1 X59.319 Y97.163 E-.06789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.797 Y94.795 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X63.005 Y95.541 I-1.048 J.694 E.02152
G3 X62.922 Y96.776 I-3.668 J.374 E.03401
G3 X61.984 Y96.791 I-.471 J-.13 E.03436
G3 X61.938 Y95.159 I4.113 J-.931 E.04495
G3 X62.364 Y94.657 I.578 J.059 E.01911
G3 X62.751 Y94.757 I.066 J.544 E.01119
M204 S250
G1 X62.881 Y94.686 F42000
G1 F7482
M204 S5000
G3 X63.135 Y95.083 I-.399 J.534 E.01318
G3 X63.099 Y96.805 I-3.072 J.798 E.0477
G3 X61.768 Y96.71 I-.651 J-.256 E.04846
G3 X61.795 Y94.99 I2.99 J-.814 E.04768
G3 X62.496 Y94.553 I.65 J.263 E.02414
G3 X62.831 Y94.652 I-.013 J.666 E.00968
; WIPE_START
G1 F10727.314
M204 S6000
G1 X63.02 Y94.837 E-.10033
G1 X63.135 Y95.083 E-.10324
G1 X63.22 Y95.513 E-.16662
G1 X63.237 Y95.997 E-.18404
G1 X63.217 Y96.312 E-.11975
G1 X63.179 Y96.535 E-.08602
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.218 Y96.32 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X64.399 Y96.206 I.353 J.363 E.00589
G2 X65.324 Y96.732 I.383 J.402 E.05662
G2 X65.068 Y96.132 I-.542 J-.124 E.01908
G1 X65.298 Y96.266 E.00727
G3 X64.978 Y97.227 I-.351 J.417 E.03555
G3 X64.199 Y97.025 I-.203 J-.821 E.02295
G3 X64.177 Y96.364 I.372 J-.343 E.01973
M204 S250
G1 X64.28 Y95.692 F42000
G1 F7482
M204 S5000
G3 X64.192 Y95.446 I.516 J-.321 E.00719
G3 X64.693 Y94.642 I.654 J-.151 E.02874
G3 X65.401 Y95.321 I.095 J.61 E.03101
G3 X64.314 Y95.741 I-.606 J.049 E.04264
M204 S250
G1 X64.045 Y95.515 F42000
G1 F7482
M204 S5000
G3 X64.598 Y94.567 I.634 J-.265 E.03475
G3 X64.858 Y94.551 I.205 J1.195 E.00715
G3 X65.429 Y95.715 I.022 J.711 E.04457
G3 X65.292 Y95.816 I-.434 J-.445 E.00467
G1 X64.869 Y96.015 E.01278
G1 X65.038 Y96.114 E.00535
G2 X64.698 Y96.067 I-.286 J.816 E.00944
G1 X64.763 Y96.037 E.00196
G1 X64.28 Y95.809 E.01461
G3 X64.07 Y95.569 I.398 J-.56 E.00879
; OBJECT_ID: 1
; WIPE_START
G1 F10727.314
M204 S6000
G1 X63.994 Y95.274 E-.11602
G1 X64.021 Y95.056 E-.08341
G1 X64.105 Y94.871 E-.07731
G1 X64.245 Y94.723 E-.07743
G1 X64.388 Y94.634 E-.06373
G1 X64.598 Y94.567 E-.08368
G1 X64.858 Y94.551 E-.09918
G1 X65.042 Y94.573 E-.07047
G1 X65.234 Y94.644 E-.07757
G1 X65.257 Y94.662 E-.0112
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X64.219 Y87.1 Z3.4 F42000
G1 X56.027 Y27.459 Z3.4
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X56.898 Y28.423 I3.674 J-2.441 E.03567
G3 X57.361 Y29.37 I-.734 J.946 E.02985
G3 X56.6 Y29.942 I-.678 J-.11 E.02876
G3 X55.852 Y29.504 I-.074 J-.731 E.02536
G3 X55.825 Y29.409 I.629 J-.236 E.00269
G1 X56.017 Y29.39 E.00529
G2 X57.143 Y29.076 I.571 J-.128 E.05195
G2 X56.768 Y28.52 I-1.116 J.348 E.01863
G3 X55.894 Y27.591 I4.506 J-5.115 E.03493
G3 X55.767 Y27.302 I1.139 J-.671 E.00864
G1 X57.365 Y27.302 E.04369
G1 X57.365 Y27.459 E.00429
G1 X56.087 Y27.459 E.03496
; WIPE_START
G1 F10727.314
M204 S6000
G1 X56.387 Y27.934 E-.2138
G1 X56.898 Y28.423 E-.26863
G1 X57.102 Y28.641 E-.11369
G1 X57.272 Y28.904 E-.11875
G1 X57.312 Y29.016 E-.04513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.097 Y29.371 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G1 X60.326 Y29.426 E.00644
G3 X59.37 Y29.981 I-.871 J-.398 E.03225
G3 X58.166 Y28.838 I-.03 J-1.173 E.05041
G3 X58.395 Y27.714 I1.695 J-.241 E.03199
G3 X59.393 Y27.253 I.919 J.681 E.03136
G3 X60.343 Y27.909 I.016 J.992 E.03368
G1 X60.121 Y27.98 E.00637
G2 X58.451 Y28.128 I-.817 J.276 E.06293
G2 X58.499 Y29.27 I2.426 J.469 E.03155
G2 X60.068 Y29.423 I.821 J-.297 E.05379
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.326 Y29.426 E-.09812
G1 X60.18 Y29.662 E-.10575
G1 X60.074 Y29.762 E-.05515
G1 X59.927 Y29.858 E-.06673
G1 X59.673 Y29.949 E-.10249
G1 X59.37 Y29.981 E-.11607
G1 X59.229 Y29.975 E-.05351
G1 X58.985 Y29.93 E-.09435
G1 X58.819 Y29.863 E-.06784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.109 Y29.808 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G3 X61.484 Y29.491 I-.159 J-.463 E.02138
G3 X61.438 Y27.859 I4.113 J-.931 E.04495
G3 X61.863 Y27.357 I.578 J.059 E.01911
G3 X62.297 Y27.495 I.066 J.544 E.01284
G3 X62.505 Y28.241 I-1.048 J.694 E.02152
G3 X62.422 Y29.475 I-3.67 J.374 E.034
G3 X62.165 Y29.785 I-.471 J-.13 E.01135
M204 S250
G1 X62.292 Y29.858 F42000
G1 F7482
M204 S5000
G3 X61.268 Y29.41 I-.343 J-.609 E.03541
G3 X61.295 Y27.69 I2.99 J-.814 E.04768
G3 X61.996 Y27.253 I.65 J.263 E.02414
G3 X62.635 Y27.783 I-.013 J.666 E.0245
G3 X62.599 Y29.505 I-3.071 J.798 E.04769
G3 X62.343 Y29.826 I-.651 J-.256 E.01141
; WIPE_START
G1 F10727.314
M204 S6000
G1 X62.06 Y29.936 E-.11519
G1 X61.844 Y29.936 E-.0819
G1 X61.637 Y29.88 E-.08158
G1 X61.488 Y29.781 E-.06824
G1 X61.352 Y29.606 E-.08381
G1 X61.268 Y29.41 E-.08122
G1 X61.182 Y28.982 E-.1659
G1 X61.175 Y28.766 E-.08217
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.675 Y28.998 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F7482
M204 S5000
G2 X64.532 Y28.86 I-.438 J.312 E.00544
G2 X64.263 Y28.759 I-.504 J.931 E.00789
G1 X64.255 Y28.699 E.00167
G1 X64.301 Y28.701 E.00126
G1 X64.737 Y28.961 E.01389
G3 X64.735 Y29.795 I-.265 J.416 E.02716
G3 X63.659 Y29.675 I-.471 J-.655 E.03244
G3 X63.573 Y29.498 I.622 J-.414 E.00541
G1 X63.724 Y29.472 E.00421
G2 X64.707 Y29.048 I.512 J-.162 E.04911
M204 S250
G1 X64.689 Y28.543 F42000
G1 F7482
M204 S5000
G2 X64.521 Y27.401 I-.52 J-.507 E.03649
G2 X63.706 Y27.77 I-.232 J.574 E.02736
G1 X63.521 Y27.748 E.00508
G3 X64.327 Y27.253 I.724 J.276 E.0278
G3 X65.013 Y28.327 I.021 J.742 E.04187
G3 X64.746 Y28.527 I-.443 J-.312 E.00928
; WIPE_START
G1 F10727.314
M204 S6000
G1 X64.795 Y28.415 E-.04632
G1 X64.868 Y28.232 E-.07492
G1 X64.889 Y28.037 E-.07452
G1 X64.88 Y27.906 E-.04984
G1 X64.828 Y27.718 E-.07417
G1 X64.777 Y27.624 E-.04078
G1 X64.641 Y27.476 E-.07624
G1 X64.521 Y27.401 E-.05371
G1 X64.344 Y27.353 E-.06978
G1 X64.22 Y27.352 E-.04709
G1 X63.998 Y27.416 E-.08789
G1 X63.865 Y27.523 E-.06475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 1
M625
; object ids of layer 15 start: 1,2,3,4,5,6,7,8,9
M624 /wEAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


; object ids of this layer15 end: 1,2,3,4,5,6,7,8,9
M625
; close powerlost recovery
M1003 S0
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20260513 =====================
G392 S0 ;turn off nozzle clog detect

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G90
G1 Z3.4 F900 ; lower z a little
G1 X0 Y103.148 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X267 F15000
T255
G1 X-28.5 F18000
G1 X-48.2 F3000
G1 X-28.5 F18000
G1 X-48.2 F3000
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z103 F600
    G1 Z101

M400 P100
M17 R ; restore z current

G90
G1 X-48 Y180 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N80
M1006 A44 B20 L100 C49 D20 M80 E41 F20 N80
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N80
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W
;=====printer finish  sound=========

;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M400
M18 X Y Z

M73 P100 R0
; EXECUTABLE_BLOCK_END

