; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 19m 11s; total estimated time: 25m 28s
; total layer number: 15
; total filament length [mm] : 2870.80
; total filament volume [cm^3] : 6905.09
; total filament weight [g] : 8.56
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
M73 P0 R25
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
M73 P2 R24
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P3 R24
G1 X-48.2 F3000
M73 P4 R24
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
M73 P5 R24
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
    
M73 P6 R23
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
M73 P23 R19
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
M73 P24 R19
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
    G29 A1 X25 Y25 I203.9 J137.255
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
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.839 Y96.705 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X218.839 Y89.612 E.26419
G1 X220.33 Y89.049 E.05935
G3 X220.436 Y89.038 I.1 J.452 E.00398
G1 X227.41 Y89.039 E.25976
G3 X227.66 Y89.284 I-.015 J.265 E.01423
G1 X227.661 Y97.262 E.29715
G3 X227.363 Y97.56 I-.268 J.03 E.01798
G1 X220.423 Y97.56 E.25849
G3 X220.319 Y97.545 I.005 J-.416 E.00392
G1 X218.839 Y97.009 E.05865
G1 X218.839 Y96.765 E.00909
M204 S6000
G1 X219.018 Y97.56 F42000
G1 F3000
M204 S500
G3 X219.013 Y100.342 I-72.252 J1.265 E.10364
G3 X218.611 Y102.335 I-6.796 J-.332 E.07602
G1 X218.382 Y102.298 E.00867
G1 X218.382 Y88.491 E.51424
G2 X207.018 Y88.491 I-5.682 J.011 E.66406
G1 X207.018 Y102.298 E.51424
G1 X206.789 Y102.335 E.00867
G3 X206.382 Y100.091 I6.066 J-2.258 E.08541
G1 X206.382 Y88.507 E.43145
G3 X212.827 Y82.182 I6.33 J.004 E.37447
G3 X218.973 Y87.75 I-.13 J6.32 E.33688
G1 X219.1 Y89.025 E.04773
G1 X220.188 Y88.614 E.04334
G3 X220.423 Y88.581 I.245 J.9 E.00883
G1 X227.428 Y88.582 E.26092
G3 X228.117 Y89.271 I-.038 J.727 E.03975
G1 X228.118 Y97.276 E.29815
G3 X227.377 Y98.017 I-.721 J.02 E.04369
G1 X220.415 Y98.017 E.25931
G3 X220.186 Y97.983 I.017 J-.906 E.00862
G1 X219.074 Y97.58 E.04405
M204 S6000
G1 X219.475 Y98.212 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X219.47 Y100.36 I-55.833 J.942 E.08002
G3 X218.522 Y103.598 I-7.059 J-.308 E.1269
G3 X217.85 Y104.614 I-3.211 J-1.395 E.04559
G3 X217.904 Y103.283 I12.113 J-.176 E.04964
G2 X217.925 Y102.284 I-17.29 J-.862 E.03721
G1 X217.925 Y88.496 E.51356
G2 X207.475 Y88.496 I-5.225 J.004 E.61109
G1 X207.475 Y102.284 E.51356
G2 X207.538 Y103.774 I14.432 J.142 E.05557
G3 X207.55 Y104.614 I-16.282 J.661 E.03129
G3 X207.119 Y104.07 I5.505 J-4.806 E.02585
G3 X206.327 Y102.399 I12.978 J-7.171 E.06891
G3 X205.925 Y100.095 I6.459 J-2.315 E.08753
G1 X205.925 Y88.503 E.43178
G3 X212.836 Y81.725 I6.778 J-.001 E.40155
G3 X219.427 Y87.696 I-.14 J6.778 E.36126
G1 X219.496 Y88.387 E.02587
G3 X220.128 Y88.156 I1.566 J3.313 E.02511
G3 X220.409 Y88.124 I.28 J1.197 E.01056
G1 X227.446 Y88.125 E.26208
G3 X228.574 Y89.253 I-.061 J1.189 E.0651
G1 X228.575 Y97.289 E.29932
G3 X227.39 Y98.474 I-1.178 J.007 E.06942
G1 X220.406 Y98.474 E.26013
G3 X220.053 Y98.421 I.029 J-1.398 E.01333
G1 X219.531 Y98.232 E.02067
; WIPE_START
G1 X219.474 Y100.231 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.68 Y100.793 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219127
G1 F3000
M204 S500
G1 X218.691 Y100.561 E.00334
G2 X218.7 Y97.202 I-88.232 J-1.916 E.04823
; WIPE_START
G1 X218.695 Y99.202 E-.76
; WIPE_END
M73 P25 R19
G1 E-.04 F1800
M204 S6000
G1 X218.68 Y100.793 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.166005
G1 F3000
M204 S500
G1 X218.664 Y101.024 E.00232
; LINE_WIDTH: 0.126225
G1 X218.637 Y101.32 E.00202
; WIPE_START
G1 X218.664 Y101.024 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X218.473 Y102.544 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.308757
G1 F3000
M204 S500
G1 X218.264 Y103.308 E.01714
; LINE_WIDTH: 0.283178
G1 X218.229 Y103.428 E.00245
; LINE_WIDTH: 0.234761
G1 X218.195 Y103.548 E.00195
; LINE_WIDTH: 0.186343
G1 X218.16 Y103.668 E.00146
; LINE_WIDTH: 0.137926
G1 X218.126 Y103.788 E.00097
; LINE_WIDTH: 0.108611
G1 X218.113 Y103.84 E.00028
; WIPE_START
G1 X218.126 Y103.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X210.493 Y103.825 Z.6 F42000
G1 X207.283 Y103.841 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.310771
G1 F3000
M204 S500
G1 X206.923 Y102.545 E.02936
; WIPE_START
G1 X207.283 Y103.841 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X206.763 Y101.32 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.126183
G1 F3000
M204 S500
G1 X206.736 Y101.024 E.00202
; LINE_WIDTH: 0.166005
G1 X206.72 Y100.792 E.00233
; LINE_WIDTH: 0.192796
G1 X206.709 Y100.561 E.00283
; LINE_WIDTH: 0.221545
G3 X206.7 Y100.088 I12.278 J-.47 E.00688
G1 X206.7 Y88.51 E.16852
G1 X206.743 Y87.785 E.01058
G1 X206.818 Y87.314 E.00694
G1 X206.931 Y86.85 E.00695
G1 X207.08 Y86.397 E.00694
G1 X207.266 Y85.955 E.00697
G1 X207.605 Y85.33 E.01036
G1 X207.873 Y84.935 E.00695
G1 X208.173 Y84.561 E.00698
G1 X208.5 Y84.214 E.00694
G1 X208.855 Y83.893 E.00696
G1 X209.23 Y83.604 E.0069
G1 X209.84 Y83.224 E.01046
G1 X210.268 Y83.014 E.00694
G1 X210.711 Y82.838 E.00694
G1 X211.168 Y82.698 E.00695
G1 X211.63 Y82.595 E.0069
G1 X212.344 Y82.51 E.01046
G1 X212.82 Y82.5 E.00693
G1 X213.297 Y82.529 E.00695
G1 X213.771 Y82.595 E.00697
G1 X214.232 Y82.698 E.00687
G1 X214.915 Y82.923 E.01046
G1 X215.353 Y83.117 E.00698
G1 X215.77 Y83.344 E.00691
G1 X216.17 Y83.604 E.00695
G1 X216.545 Y83.893 E.00688
G1 X217.069 Y84.386 E.01047
G1 X217.382 Y84.746 E.00694
G1 X217.665 Y85.13 E.00694
G1 X217.916 Y85.534 E.00692
G1 X218.134 Y85.956 E.00692
G1 X218.4 Y86.625 E.01048
G1 X218.531 Y87.083 E.00694
G1 X218.624 Y87.55 E.00694
G1 X218.713 Y88.486 E.01369
; LINE_WIDTH: 0.267512
G1 X218.736 Y88.943 E.00837
; LINE_WIDTH: 0.30538
G1 X218.759 Y89.398 E.00974
; WIPE_START
G1 X218.736 Y88.943 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X226.364 Y89.216 Z.6 F42000
G1 X226.551 Y89.222 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50105
G1 F6300
M204 S500
G1 X227.271 Y89.943 E.03803
G1 X227.271 Y90.591 E.02419
G1 X226.109 Y89.428 E.06137
G1 X225.461 Y89.428 E.02418
G1 X227.271 Y91.239 E.09557
G1 X227.272 Y91.887 E.02419
G1 X224.814 Y89.429 E.12977
G1 X224.166 Y89.429 E.02418
G1 X227.272 Y92.535 E.16396
G1 X227.272 Y93.183 E.02419
G1 X223.518 Y89.429 E.19816
G1 X222.871 Y89.429 E.02418
G1 X227.272 Y93.831 E.23236
G1 X227.272 Y94.479 E.02419
G1 X222.223 Y89.43 E.26656
G1 X221.575 Y89.43 E.02418
G1 X227.272 Y95.127 E.30076
G1 X227.272 Y95.774 E.02419
G1 X220.928 Y89.43 E.33495
G1 X220.44 Y89.43 E.0182
G1 X220.324 Y89.474 E.00465
G1 X227.272 Y96.422 E.36686
G1 X227.272 Y97.07 E.02419
G1 X219.851 Y89.65 E.39179
G1 X219.379 Y89.825 E.01881
G1 X226.725 Y97.171 E.38782
G1 X226.077 Y97.171 E.02419
G1 X219.228 Y90.322 E.36162
G1 X219.228 Y90.969 E.02419
G1 X225.429 Y97.171 E.32741
G1 X224.781 Y97.171 E.02419
G1 X219.228 Y91.617 E.2932
G1 X219.228 Y92.265 E.02419
G1 X224.133 Y97.171 E.25899
G1 X223.485 Y97.171 E.02419
G1 X219.228 Y92.913 E.22478
G1 X219.228 Y93.561 E.02419
G1 X222.837 Y97.17 E.19057
G1 X222.189 Y97.17 E.02419
G1 X219.228 Y94.209 E.15635
G1 X219.228 Y94.857 E.02419
M73 P25 R18
G1 X221.541 Y97.17 E.12214
G1 X220.893 Y97.17 E.02419
G1 X219.228 Y95.505 E.08793
G1 X219.228 Y96.152 E.02419
G1 X220.451 Y97.376 E.06458
; OBJECT_ID: 6
; WIPE_START
G1 X219.228 Y96.152 E-.65739
G1 X219.228 Y95.882 E-.10261
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S6000
G1 X211.597 Y96.068 Z.6 F42000
G1 X185.439 Y96.704 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X185.439 Y89.612 E.26416
G1 X186.93 Y89.049 E.05935
G3 X187.036 Y89.038 I.1 J.451 E.00398
G1 X194.01 Y89.039 E.25977
G3 X194.26 Y89.289 I-.028 J.278 E.01424
G1 X194.261 Y97.263 E.29699
G3 X193.964 Y97.56 I-.268 J.03 E.01797
G1 X187.023 Y97.56 E.25849
G3 X186.919 Y97.545 I.005 J-.415 E.00392
G1 X185.439 Y97.009 E.05865
G1 X185.439 Y96.764 E.00909
M204 S6000
G1 X185.618 Y97.56 F42000
G1 F3000
M204 S500
G3 X185.613 Y100.342 I-71.98 J1.266 E.10365
G3 X185.211 Y102.336 I-6.795 J-.332 E.07602
G1 X184.982 Y102.298 E.00867
G1 X184.982 Y88.491 E.51425
G2 X173.618 Y88.491 I-5.682 J.009 E.66423
G1 X173.618 Y102.298 E.51424
G1 X173.389 Y102.335 E.00867
G3 X172.982 Y100.091 I6.066 J-2.258 E.08541
G1 X172.982 Y88.507 E.43145
G3 X179.427 Y82.182 I6.33 J.004 E.37448
G3 X185.573 Y87.75 I-.13 J6.32 E.33689
G1 X185.7 Y89.025 E.04773
G1 X186.788 Y88.614 E.04335
G3 X187.023 Y88.581 I.245 J.902 E.00883
G1 X194.028 Y88.582 E.26092
G3 X194.717 Y89.271 I-.033 J.722 E.03981
G1 X194.718 Y97.276 E.29816
G3 X193.977 Y98.017 I-.721 J.02 E.04368
G1 X187.015 Y98.017 E.25931
G3 X186.786 Y97.983 I.017 J-.905 E.00862
G1 X185.674 Y97.58 E.04405
M204 S6000
G1 X186.075 Y98.212 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X186.07 Y100.36 I-55.614 J.942 E.08002
G3 X185.122 Y103.599 I-7.065 J-.31 E.12692
G3 X184.45 Y104.614 I-3.211 J-1.395 E.04557
G3 X184.504 Y103.283 I12.113 J-.176 E.04964
G2 X184.525 Y102.284 I-17.29 J-.862 E.03721
G1 X184.525 Y88.496 E.51356
G2 X174.075 Y88.496 I-5.225 J.004 E.61109
G1 X174.075 Y102.284 E.51356
G2 X174.138 Y103.774 I14.432 J.142 E.05557
G3 X174.15 Y104.614 I-16.282 J.661 E.03129
G3 X173.719 Y104.07 I5.505 J-4.806 E.02585
G3 X172.928 Y102.399 I12.974 J-7.169 E.0689
G3 X172.525 Y100.095 I6.458 J-2.316 E.08755
G1 X172.525 Y88.503 E.43178
G3 X179.436 Y81.725 I6.788 J.009 E.40139
G3 X186.027 Y87.696 I-.14 J6.778 E.36126
G1 X186.096 Y88.387 E.02587
G3 X186.728 Y88.156 I1.564 J3.307 E.02512
G3 X187.009 Y88.124 I.28 J1.198 E.01057
G1 X194.046 Y88.125 E.26208
G3 X195.174 Y89.253 I-.055 J1.183 E.06518
G1 X195.175 Y97.289 E.29933
G3 X193.99 Y98.474 I-1.178 J.007 E.06941
G1 X187.006 Y98.474 E.26014
G3 X186.653 Y98.421 I.029 J-1.397 E.01333
G1 X186.131 Y98.232 E.02067
; WIPE_START
G1 X186.074 Y100.231 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X185.3 Y97.201 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219136
G1 F3000
M204 S500
M73 P26 R18
G3 X185.291 Y100.561 I-88.213 J1.443 E.04824
G1 X185.28 Y100.793 E.00334
; LINE_WIDTH: 0.166034
G1 X185.264 Y101.024 E.00232
; LINE_WIDTH: 0.126225
G1 X185.237 Y101.32 E.00202
; WIPE_START
G1 X185.264 Y101.024 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X185.073 Y102.544 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.308745
G1 F3000
M204 S500
G1 X184.864 Y103.308 E.01714
; LINE_WIDTH: 0.283172
G1 X184.829 Y103.428 E.00245
; LINE_WIDTH: 0.234751
G1 X184.795 Y103.548 E.00195
; LINE_WIDTH: 0.186329
G1 X184.76 Y103.668 E.00146
; LINE_WIDTH: 0.137908
G1 X184.726 Y103.788 E.00097
; LINE_WIDTH: 0.108606
G1 X184.713 Y103.84 E.00028
; WIPE_START
G1 X184.726 Y103.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X177.093 Y103.825 Z.6 F42000
G1 X173.884 Y103.841 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.310794
G1 F3000
M204 S500
G1 X173.522 Y102.545 E.02936
; WIPE_START
G1 X173.884 Y103.841 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X173.363 Y101.32 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.126165
G1 F3000
M204 S500
G1 X173.336 Y101.024 E.00201
; LINE_WIDTH: 0.165976
G1 X173.32 Y100.792 E.00233
; LINE_WIDTH: 0.192796
G1 X173.309 Y100.561 E.00283
; LINE_WIDTH: 0.221546
G3 X173.3 Y100.088 I12.263 J-.47 E.00688
G1 X173.3 Y88.51 E.16852
G1 X173.343 Y87.785 E.01058
G1 X173.418 Y87.314 E.00695
G1 X173.531 Y86.85 E.00695
G1 X173.68 Y86.397 E.00694
G1 X173.866 Y85.956 E.00696
G1 X174.205 Y85.33 E.01036
G1 X174.473 Y84.935 E.00695
G1 X174.773 Y84.561 E.00698
G1 X175.1 Y84.214 E.00694
G1 X175.454 Y83.893 E.00696
G1 X175.83 Y83.604 E.0069
G1 X176.44 Y83.224 E.01047
G1 X176.868 Y83.014 E.00693
G1 X177.311 Y82.838 E.00694
G1 X177.768 Y82.698 E.00695
G1 X178.23 Y82.595 E.0069
G1 X178.944 Y82.51 E.01046
G1 X179.42 Y82.5 E.00693
G1 X179.897 Y82.529 E.00695
G1 X180.37 Y82.595 E.00694
G1 X180.832 Y82.698 E.0069
G1 X181.515 Y82.923 E.01046
G1 X181.953 Y83.117 E.00698
G1 X182.37 Y83.344 E.00691
G1 X182.77 Y83.604 E.00694
G1 X183.145 Y83.893 E.00689
G1 X183.669 Y84.386 E.01047
G1 X183.982 Y84.746 E.00694
G1 X184.265 Y85.131 E.00696
G1 X184.516 Y85.533 E.0069
G1 X184.734 Y85.956 E.00692
G1 X185 Y86.625 E.01048
G1 X185.13 Y87.083 E.00693
G1 X185.224 Y87.55 E.00694
G1 X185.313 Y88.486 E.01369
; LINE_WIDTH: 0.267306
G1 X185.336 Y88.943 E.00837
; LINE_WIDTH: 0.305098
G1 X185.358 Y89.398 E.00973
; WIPE_START
G1 X185.336 Y88.943 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X192.963 Y89.216 Z.6 F42000
G1 X193.151 Y89.222 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50104
G1 F6300
M204 S500
G1 X193.871 Y89.943 E.03803
G1 X193.871 Y90.591 E.02419
G1 X192.709 Y89.428 E.06137
G1 X192.061 Y89.428 E.02418
G1 X193.871 Y91.239 E.09556
G1 X193.872 Y91.887 E.02419
G1 X191.414 Y89.429 E.12976
G1 X190.766 Y89.429 E.02418
G1 X193.872 Y92.534 E.16396
G1 X193.872 Y93.182 E.02419
G1 X190.118 Y89.429 E.19815
G1 X189.471 Y89.429 E.02418
G1 X193.872 Y93.83 E.23235
G1 X193.872 Y94.478 E.02419
G1 X188.823 Y89.43 E.26655
G1 X188.176 Y89.43 E.02418
G1 X193.872 Y95.126 E.30074
G1 X193.872 Y95.774 E.02419
G1 X187.528 Y89.43 E.33494
G1 X187.04 Y89.43 E.0182
G1 X186.924 Y89.474 E.00465
G1 X193.872 Y96.422 E.36684
G1 X193.872 Y97.07 E.02419
G1 X186.452 Y89.65 E.39177
G1 X185.98 Y89.825 E.0188
G1 X193.325 Y97.171 E.38781
G1 X192.677 Y97.171 E.02419
G1 X185.828 Y90.321 E.36162
G1 X185.828 Y90.969 E.02419
G1 X192.029 Y97.171 E.32741
G1 X191.381 Y97.171 E.02419
G1 X185.828 Y91.617 E.2932
G1 X185.828 Y92.265 E.02419
G1 X190.733 Y97.171 E.259
G1 X190.085 Y97.171 E.02419
G1 X185.828 Y92.913 E.22479
G1 X185.828 Y93.561 E.02419
G1 X189.437 Y97.171 E.19058
G1 X188.789 Y97.17 E.02419
G1 X185.828 Y94.209 E.15637
G1 X185.828 Y94.856 E.02419
G1 X188.141 Y97.17 E.12216
G1 X187.493 Y97.17 E.02419
G1 X185.828 Y95.504 E.08795
G1 X185.828 Y96.152 E.02419
G1 X187.051 Y97.376 E.0646
; OBJECT_ID: 5
; WIPE_START
G1 X185.828 Y96.152 E-.65757
G1 X185.828 Y95.883 E-.10243
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S6000
G1 X178.197 Y96.068 Z.6 F42000
G1 X152.039 Y96.704 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X152.039 Y89.594 E.2648
G1 X153.52 Y89.053 E.05871
G3 X153.635 Y89.038 I.096 J.296 E.00436
G1 X160.598 Y89.039 E.25934
G3 X160.86 Y89.284 I.002 J.261 E.01472
G1 X160.861 Y97.275 E.29762
G3 X160.564 Y97.56 I-.267 J.019 E.0175
G1 X153.623 Y97.56 E.2585
G3 X153.52 Y97.545 I.005 J-.415 E.00391
G1 X152.039 Y97.008 E.05866
G1 X152.039 Y96.764 E.00912
M204 S6000
G1 X152.218 Y97.559 F42000
G1 F3000
M204 S500
G1 X152.218 Y100.39 E.10544
G3 X151.81 Y102.583 I-6.172 J-.013 E.08353
G1 X151.582 Y102.545 E.00863
G1 X151.582 Y88.191 E.53461
G2 X140.818 Y88.186 I-5.382 J.009 E.62892
G1 X140.818 Y102.545 E.53481
G1 X140.59 Y102.583 E.00863
G3 X140.182 Y100.391 I5.766 J-2.206 E.08351
G1 X140.182 Y88.207 E.45379
G3 X146.32 Y82.182 I6.029 J.003 E.35668
G3 X152.199 Y87.724 I-.123 J6.02 E.32983
G1 X152.279 Y89.02 E.04836
G1 X153.386 Y88.615 E.04388
G3 X153.622 Y88.581 I.225 J.73 E.00894
G1 X160.62 Y88.582 E.26066
G3 X161.317 Y89.271 I-.025 J.722 E.04008
G1 X161.318 Y97.284 E.29845
G3 X160.577 Y98.017 I-.721 J.012 E.04339
G1 X153.615 Y98.017 E.25931
G3 X153.386 Y97.983 I.017 J-.906 E.00862
G1 X152.274 Y97.58 E.04406
M204 S6000
G1 X152.675 Y98.211 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X152.67 Y100.654 I-62.1 J1.092 E.09098
G3 X152.463 Y102.04 I-6.534 J-.269 E.05228
G3 X151.594 Y104.049 I-7.855 J-2.204 E.08178
G3 X151.172 Y104.663 I-2.231 J-1.081 E.02784
G1 X151.05 Y104.8 E.00683
G3 X151.122 Y102.953 I82.541 J2.296 E.06882
G1 X151.125 Y88.196 E.54966
G2 X141.275 Y88.194 I-4.925 J.004 E.5759
G1 X141.275 Y102.458 E.53128
G2 X141.35 Y104.429 I53.247 J-1.034 E.07348
G1 X141.35 Y104.799 E.0138
G3 X140.919 Y104.273 I5.181 J-4.681 E.02537
G3 X140.128 Y102.646 I12.211 J-6.946 E.06741
G3 X139.725 Y100.395 I6.155 J-2.262 E.08561
G1 X139.725 Y88.203 E.45411
G3 X146.329 Y81.725 I6.487 J.008 E.38359
G3 X152.655 Y87.687 I-.133 J6.477 E.35485
G1 X152.697 Y88.38 E.02587
G1 X153.251 Y88.177 E.02197
G3 X153.609 Y88.124 I.361 J1.195 E.01352
G1 X160.643 Y88.125 E.26198
G3 X161.774 Y89.253 I-.052 J1.183 E.06529
G1 X161.775 Y97.293 E.29945
G3 X160.59 Y98.474 I-1.178 J.004 E.06929
G1 X153.606 Y98.474 E.26014
G3 X153.253 Y98.421 I.029 J-1.398 E.01333
G1 X152.731 Y98.232 E.02067
; WIPE_START
G1 X152.681 Y100.231 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.9 Y97.201 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219403
G1 F3000
M204 S500
G3 X151.898 Y100.624 I-173.464 J1.593 E.04922
G3 X151.88 Y101.073 I-11.449 J-.226 E.00647
; LINE_WIDTH: 0.166317
G1 X151.864 Y101.298 E.00226
; LINE_WIDTH: 0.126389
G1 X151.837 Y101.589 E.00199
; WIPE_START
G1 X151.864 Y101.298 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.666 Y102.791 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.331317
G1 F3000
M204 S500
G1 X151.325 Y104.035 E.03033
; WIPE_START
G1 X151.666 Y102.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X144.086 Y103.681 Z.6 F42000
G1 X141.077 Y104.035 Z.6
M73 P27 R18
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.334164
G1 F3000
M204 S500
G1 X140.728 Y102.792 E.03064
; WIPE_START
G1 X141.077 Y104.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.563 Y101.589 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.126341
G1 F3000
M204 S500
G1 X140.536 Y101.299 E.00199
; LINE_WIDTH: 0.166263
G1 X140.52 Y101.073 E.00227
; LINE_WIDTH: 0.201759
G3 X140.502 Y100.624 I11.393 J-.674 E.00582
; LINE_WIDTH: 0.222252
G1 X140.5 Y88.21 E.1814
G3 X151.535 Y86.193 I5.7 J-.009 E.23184
G1 X151.681 Y86.634 E.00679
G1 X151.828 Y87.298 E.00994
G1 X151.882 Y87.749 E.00664
G1 X151.923 Y88.787 E.01518
; LINE_WIDTH: 0.28028
G1 X151.942 Y89.386 E.01159
; WIPE_START
G1 X151.923 Y88.787 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X159.544 Y89.212 Z.6 F42000
G1 X159.723 Y89.222 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50019
G1 F6300
M204 S500
G1 X160.471 Y89.97 E.03941
G1 X160.471 Y90.617 E.0241
G1 X159.283 Y89.428 E.06265
G1 X158.636 Y89.429 E.02409
G1 X160.471 Y91.264 E.09671
G1 X160.472 Y91.911 E.0241
G1 X157.99 Y89.429 E.13078
G1 X157.343 Y89.429 E.02409
G1 X160.472 Y92.557 E.16485
G1 X160.472 Y93.204 E.0241
G1 X156.697 Y89.429 E.19892
G1 X156.051 Y89.43 E.02409
G1 X160.472 Y93.851 E.23298
G1 X160.472 Y94.498 E.0241
G1 X155.404 Y89.43 E.26705
G1 X154.758 Y89.43 E.02409
G1 X160.472 Y95.145 E.30112
G1 X160.472 Y95.791 E.0241
G1 X154.111 Y89.431 E.33519
G1 X153.629 Y89.431 E.01796
G1 X153.509 Y89.475 E.00479
G1 X160.472 Y96.438 E.36695
G1 X160.472 Y97.085 E.0241
G1 X153.034 Y89.647 E.39197
G1 X152.559 Y89.819 E.01881
G1 X159.912 Y97.171 E.38745
G1 X159.265 Y97.171 E.0241
G1 X152.428 Y90.334 E.36032
G1 X152.428 Y90.98 E.0241
G1 X158.618 Y97.171 E.32623
G1 X157.972 Y97.171 E.0241
G1 X152.428 Y91.627 E.29215
G1 X152.428 Y92.274 E.0241
G1 X157.325 Y97.171 E.25807
G1 X156.678 Y97.171 E.0241
G1 X152.428 Y92.92 E.22398
G1 X152.428 Y93.567 E.0241
G1 X156.031 Y97.171 E.1899
G1 X155.385 Y97.171 E.0241
G1 X152.428 Y94.214 E.15582
G1 X152.428 Y94.86 E.0241
G1 X154.738 Y97.17 E.12174
G1 X154.091 Y97.17 E.0241
G1 X152.428 Y95.507 E.08765
G1 X152.428 Y96.154 E.0241
G1 X153.65 Y97.376 E.06441
; OBJECT_ID: 4
; WIPE_START
G1 X152.428 Y96.154 E-.65689
G1 X152.428 Y95.882 E-.10311
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S6000
G1 X144.797 Y96.071 Z.6 F42000
G1 X119.239 Y96.704 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X119.239 Y89.589 E.265
G1 X120.72 Y89.053 E.05865
G3 X120.835 Y89.039 I.096 J.298 E.00435
G1 X127.798 Y89.04 E.25935
G3 X128.06 Y89.289 I-.008 J.27 E.01476
G1 X128.061 Y97.275 E.29744
G3 X127.764 Y97.56 I-.267 J.019 E.01751
G1 X120.835 Y97.56 E.25808
G3 X120.72 Y97.546 I-.019 J-.312 E.00435
G1 X119.239 Y97.009 E.05866
G1 X119.239 Y96.764 E.00912
M204 S6000
G1 X119.418 Y97.56 F42000
G1 F3000
M204 S500
G1 X119.418 Y100.591 E.11289
G3 X119.005 Y102.748 I-6.045 J-.038 E.08223
G1 X118.782 Y102.706 E.00847
G1 X118.782 Y87.992 E.54804
G2 X108.418 Y87.992 I-5.182 J.012 E.60548
G1 X108.418 Y102.706 E.54805
G1 X108.194 Y102.748 E.00848
G3 X107.782 Y100.591 I5.633 J-2.195 E.08224
G1 X107.782 Y88.008 E.46868
G3 X113.799 Y82.186 I5.819 J-.006 E.34804
G3 X119.41 Y87.708 I-.205 J5.821 E.322
G1 X119.454 Y89.025 E.04908
G1 X120.586 Y88.615 E.04485
G3 X120.822 Y88.582 I.225 J.731 E.0089
G1 X127.82 Y88.583 E.26067
G3 X128.517 Y89.271 I-.031 J.727 E.04001
G1 X128.518 Y97.284 E.29844
G3 X127.777 Y98.018 I-.721 J.012 E.04339
G1 X120.822 Y98.018 E.25905
G3 X120.586 Y97.984 I-.011 J-.766 E.0089
G1 X119.474 Y97.581 E.04406
M204 S6000
G1 X119.875 Y98.212 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X119.87 Y100.845 I-67.546 J1.192 E.09806
G3 X118.838 Y104.105 I-6.821 J-.366 E.12873
G3 X118.365 Y104.797 I-2.399 J-1.133 E.03135
G1 X118.25 Y104.922 E.00634
G3 X118.322 Y103.09 I83.408 J2.366 E.06829
G1 X118.325 Y87.996 E.56218
G2 X108.875 Y87.996 I-4.725 J.007 E.55237
G1 X108.875 Y102.6 E.54392
G2 X108.95 Y104.551 I48.699 J-.89 E.07275
G1 X108.95 Y104.922 E.01381
G3 X108.532 Y104.424 I4.962 J-4.593 E.02424
G3 X107.629 Y102.528 I9.638 J-5.752 E.07833
G3 X107.325 Y100.596 I6.386 J-1.994 E.07312
G1 X107.325 Y88.003 E.46902
G3 X113.816 Y81.729 I6.277 J-.001 E.37525
G3 X119.867 Y87.685 I-.222 J6.278 E.34723
G1 X119.89 Y88.381 E.02596
G1 X120.453 Y88.177 E.02231
G3 X120.809 Y88.125 I.359 J1.195 E.01345
G1 X127.843 Y88.126 E.26199
G3 X128.974 Y89.254 I-.059 J1.19 E.0652
G1 X128.975 Y97.293 E.29945
G3 X127.79 Y98.475 I-1.178 J.004 E.0693
G1 X120.809 Y98.475 E.26003
G3 X120.453 Y98.422 I.004 J-1.249 E.01345
G1 X119.931 Y98.233 E.02067
; WIPE_START
G1 X119.885 Y100.232 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.1 Y97.202 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219686
G1 F3000
M204 S500
G3 X119.098 Y100.814 I-184.878 J1.693 E.05204
G3 X119.081 Y101.246 I-11.058 J-.217 E.00623
; LINE_WIDTH: 0.169008
G1 X119.066 Y101.46 E.0022
; LINE_WIDTH: 0.135179
G1 X119.047 Y101.677 E.00164
; LINE_WIDTH: 0.109469
G1 X119.037 Y101.768 E.00049
; WIPE_START
G1 X119.047 Y101.677 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.866 Y102.954 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.339368
G1 F3000
M204 S500
G1 X118.526 Y104.168 E.03046
; WIPE_START
G1 X118.866 Y102.954 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.287 Y103.861 Z.6 F42000
G1 X108.675 Y104.173 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.342012
G1 F3000
M204 S500
G1 X108.333 Y102.954 E.03085
; WIPE_START
G1 X108.675 Y104.173 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X108.163 Y101.768 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.109484
G1 F3000
M204 S500
G1 X108.153 Y101.677 E.00049
; LINE_WIDTH: 0.135115
G1 X108.134 Y101.461 E.00163
; LINE_WIDTH: 0.169011
G1 X108.119 Y101.245 E.00223
; LINE_WIDTH: 0.202776
G3 X108.105 Y100.918 I8.614 J-.529 E.00426
G1 X108.102 Y100.815 E.00134
; LINE_WIDTH: 0.222759
G1 X108.1 Y88.011 E.18764
G3 X119.095 Y87.779 I5.5 J-.01 E.25011
G1 X119.124 Y89.388 E.02357
; WIPE_START
G1 X119.095 Y87.779 E-.6113
G1 X119.062 Y87.39 E-.1487
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X126.327 Y89.728 Z.6 F42000
G1 X127.877 Y90.227 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51898
G1 F6300
M204 S500
G1 X127.079 Y89.429 E.04378
G1 X126.406 Y89.429 E.02611
G1 X127.671 Y90.694 E.06942
G1 X127.672 Y91.368 E.02612
G1 X125.733 Y89.429 E.10635
G1 X125.06 Y89.43 E.02611
G1 X127.672 Y92.041 E.14327
G1 X127.672 Y92.714 E.02612
G1 X124.387 Y89.43 E.1802
G1 X123.714 Y89.43 E.02611
G1 X127.672 Y93.388 E.21712
G1 X127.672 Y94.061 E.02612
G1 X123.041 Y89.43 E.25405
G1 X122.368 Y89.431 E.02611
G1 X127.672 Y94.734 E.29097
G1 X127.672 Y95.408 E.02612
M73 P28 R18
G1 X121.695 Y89.431 E.3279
G1 X121.022 Y89.431 E.02611
G1 X127.672 Y96.081 E.36482
G1 X127.672 Y96.755 E.02612
G1 X120.476 Y89.558 E.3948
G1 X119.981 Y89.736 E.02042
G1 X127.416 Y97.172 E.40794
G1 X126.743 Y97.172 E.02612
G1 X119.628 Y90.056 E.39037
G1 X119.628 Y90.73 E.02612
G1 X126.07 Y97.172 E.35344
G1 X125.397 Y97.172 E.02612
G1 X119.628 Y91.403 E.3165
G1 X119.628 Y92.076 E.02612
G1 X124.723 Y97.172 E.27957
G1 X124.05 Y97.172 E.02612
G1 X119.628 Y92.749 E.24263
G1 X119.628 Y93.423 E.02612
G1 X123.377 Y97.172 E.2057
G1 X122.704 Y97.172 E.02612
G1 X119.628 Y94.096 E.16876
G1 X119.628 Y94.769 E.02612
G1 X122.03 Y97.172 E.13183
G1 X121.357 Y97.172 E.02612
G1 X119.628 Y95.442 E.09489
G1 X119.628 Y96.116 E.02612
G1 X120.89 Y97.378 E.06924
; OBJECT_ID: 2
; WIPE_START
G1 X119.628 Y96.116 E-.67825
G1 X119.628 Y95.9 E-.08175
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S6000
G1 X122.825 Y88.97 Z.6 F42000
G1 X149.308 Y31.561 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X133.792 Y31.561 E.57791
G1 X133.789 Y26.524 E.18761
G3 X134.086 Y26.239 I.268 J-.018 E.01746
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
G1 X141.519 Y36.483 Z.6 F42000
G1 X108.004 Y65.277 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X107.981 Y65.225 E.00212
G3 X107.418 Y62.408 I6.822 J-2.828 E.10767
G1 X107.418 Y39.392 E.85725
G3 X114.792 Y32.018 I7.396 J.021 E.43109
G1 X168.308 Y32.018 E1.99326
G3 X175.682 Y39.392 I-.021 J7.396 E.43109
G1 X175.682 Y62.408 E.85725
G3 X168.308 Y69.782 I-7.385 J-.011 E.43126
G1 X114.792 Y69.782 E1.99326
G3 X108.224 Y65.751 I.011 J-7.385 E.30199
G1 X108.029 Y65.331 E.01724
M204 S6000
G1 X108.418 Y65.085 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X108.403 Y65.05 E.00145
G3 X107.875 Y62.403 I6.4 J-2.653 E.10116
G1 X107.875 Y39.397 E.8569
G3 X114.797 Y32.475 I6.938 J.016 E.40471
G1 X168.303 Y32.475 E1.99291
G3 X175.225 Y39.397 I-.016 J6.938 E.40471
G1 X175.225 Y62.403 E.8569
G3 X168.303 Y69.325 I-6.928 J-.006 E.40487
G1 X114.797 Y69.325 E1.99291
G3 X108.631 Y65.543 I.006 J-6.928 E.28345
G1 X108.444 Y65.14 E.01657
; WIPE_START
G1 X108.403 Y65.05 E-.03757
G1 X108.174 Y64.408 E-.25897
G1 X108.008 Y63.751 E-.25742
G1 X107.923 Y63.216 E-.20605
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X113.998 Y58.594 Z.6 F42000
G1 X149.765 Y31.382 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X168.291 Y31.382 E.69003
G3 X176.318 Y39.409 I-.007 J8.033 E.46949
G1 X176.318 Y62.391 E.85603
G3 X168.291 Y70.418 I-8.022 J.004 E.46967
G1 X114.809 Y70.418 E1.99204
G3 X106.782 Y62.391 I.007 J-8.033 E.46949
G1 X106.782 Y39.408 E.85603
G3 X114.809 Y31.382 I8.033 J.007 E.46949
G1 X133.335 Y31.382 E.69003
G1 X133.332 Y26.515 E.18128
G3 X134.073 Y25.782 I.725 J-.008 E.04332
G1 X135.021 Y25.782 E.03532
G1 X149.076 Y25.783 E.52348
G3 X149.768 Y26.523 I-.037 J.728 E.04171
M73 P29 R18
G1 X149.765 Y31.322 E.17876
M204 S6000
G1 X150.223 Y30.925 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X168.296 Y30.925 E.67317
G3 X176.775 Y39.404 I-.012 J8.491 E.49587
G1 X176.775 Y62.396 E.85638
G3 X168.296 Y70.875 I-8.479 J0 E.49606
G1 X114.804 Y70.875 E1.99239
G3 X106.325 Y62.396 I.012 J-8.491 E.49587
G1 X106.325 Y39.404 E.85638
G3 X114.804 Y30.925 I8.491 J.012 E.49587
G1 X132.877 Y30.925 E.67317
G1 X132.875 Y26.506 E.16458
G3 X134.06 Y25.325 I1.184 J.003 E.06919
G1 X135.021 Y25.325 E.03582
G1 X149.094 Y25.326 E.52414
G3 X150.225 Y26.509 I-.059 J1.189 E.06724
G1 X150.223 Y30.865 E.16223
; WIPE_START
G1 X152.223 Y30.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X149.537 Y31.7 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.22161
G1 F3000
M204 S500
G1 X168.288 Y31.7 E.27304
G1 X168.905 Y31.724 E.00898
G1 X169.505 Y31.795 E.0088
G1 X170.39 Y31.989 E.01319
G1 X171.245 Y32.286 E.01318
G1 X171.797 Y32.54 E.00885
G1 X172.578 Y32.998 E.01318
M73 P29 R17
G1 X173.301 Y33.545 E.0132
G1 X173.953 Y34.172 E.01318
G1 X174.348 Y34.635 E.00886
G1 X174.866 Y35.377 E.01318
G1 X175.293 Y36.176 E.0132
G1 X175.624 Y37.022 E.01322
G1 X175.787 Y37.602 E.00878
G1 X175.905 Y38.193 E.00877
G1 X175.994 Y39.098 E.01323
G1 X176 Y62.388 E.33914
G1 X175.976 Y63.004 E.00897
G1 X175.852 Y63.902 E.0132
G1 X175.623 Y64.78 E.0132
G1 X175.293 Y65.624 E.0132
G1 X174.865 Y66.423 E.0132
G1 X174.347 Y67.167 E.0132
G1 X173.745 Y67.845 E.0132
G1 X173.067 Y68.447 E.0132
G1 X172.323 Y68.966 E.01321
G1 X171.522 Y69.393 E.01322
G1 X170.965 Y69.624 E.00878
G1 X170.392 Y69.81 E.00878
G1 X169.505 Y70.005 E.01322
G1 X168.6 Y70.094 E.01324
G1 X114.788 Y70.1 E.78356
G1 X113.896 Y70.047 E.01302
G1 X113.298 Y69.952 E.00881
G1 X112.708 Y69.81 E.00883
G1 X111.853 Y69.514 E.01318
G1 X111.303 Y69.26 E.00883
G1 X110.523 Y68.803 E.01316
G1 X110.033 Y68.447 E.00882
G1 X109.572 Y68.053 E.00883
G1 X108.946 Y67.402 E.01315
G1 X108.57 Y66.926 E.00883
G1 X108.083 Y66.164 E.01317
G1 X107.807 Y65.624 E.00883
G1 X107.477 Y64.781 E.01317
G1 X107.313 Y64.197 E.00883
G1 X107.154 Y63.307 E.01318
G1 X107.106 Y62.702 E.00883
G1 X107.106 Y39.098 E.34371
G1 X107.153 Y38.495 E.0088
G1 X107.248 Y37.899 E.00879
G1 X107.477 Y37.02 E.01323
G1 X107.686 Y36.453 E.0088
G1 X107.938 Y35.906 E.00877
G1 X108.398 Y35.122 E.01323
G1 X108.945 Y34.399 E.0132
G1 X109.572 Y33.747 E.01317
G1 X110.035 Y33.352 E.00886
G1 X110.777 Y32.835 E.01317
G1 X111.575 Y32.408 E.01318
G1 X112.136 Y32.175 E.00885
G1 X113.003 Y31.913 E.01318
G1 X113.893 Y31.754 E.01318
G1 X114.496 Y31.706 E.0088
G1 X114.812 Y31.7 E.0046
G1 X133.563 Y31.7 E.27304
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
G1 X148.92 Y31.068 E.23555
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
G1 X136.015 Y26.628 E.24111
G1 X135.364 Y26.628 E.02443
G1 X139.909 Y31.172 E.24112
G1 X139.258 Y31.172 E.02443
M73 P30 R17
G1 X134.715 Y26.629 E.24104
G1 X134.185 Y26.632 E.01989
G1 X134.184 Y26.75 E.00444
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
; OBJECT_ID: 8
; WIPE_START
G1 X134.181 Y30.653 E-.3895
G1 X134.182 Y30.003 E-.24721
G1 X134.411 Y30.232 E-.1233
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S6000
G1 X129.734 Y36.264 Z.6 F42000
G1 X38.739 Y153.605 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X38.739 Y146.53 E.26352
G1 X40.228 Y145.95 E.05952
G3 X40.337 Y145.938 I.102 J.451 E.00408
G1 X47.315 Y145.94 E.25991
G3 X47.56 Y146.184 I-.026 J.271 E.01397
G1 X47.561 Y154.163 E.29717
G3 X47.263 Y154.46 I-.269 J.028 E.01795
G1 X40.335 Y154.46 E.25807
G3 X40.22 Y154.446 I-.019 J-.312 E.00434
G1 X38.739 Y153.909 E.05866
G1 X38.739 Y153.665 E.00908
M204 S6000
G1 X38.918 Y154.46 F42000
G1 F3000
M204 S500
G3 X38.913 Y157.053 I-66.532 J1.165 E.09657
G3 X38.511 Y159.068 I-6.602 J-.269 E.07685
G1 X38.282 Y159.03 E.00865
G1 X38.282 Y145.591 E.50053
G2 X26.518 Y145.591 I-5.882 J.009 E.68761
G1 X26.518 Y159.03 E.50053
G1 X26.289 Y159.068 E.00865
G3 X25.882 Y156.791 I6.22 J-2.287 E.0866
G1 X25.882 Y145.608 E.41654
G3 X32.776 Y139.093 I6.521 J-.005 E.39562
G3 X38.851 Y144.671 I-.392 J6.524 E.3324
G1 X39.009 Y145.934 E.04744
G1 X40.082 Y145.516 E.04291
G3 X40.323 Y145.481 I.251 J.89 E.0091
G1 X47.328 Y145.482 E.26091
G3 X48.017 Y146.172 I-.045 J.734 E.03967
G1 X48.018 Y154.176 E.29814
G3 X47.277 Y154.917 I-.725 J.016 E.04362
G1 X40.322 Y154.917 E.25905
G3 X40.086 Y154.884 I-.011 J-.765 E.0089
G1 X38.974 Y154.48 E.04406
M204 S6000
G1 X39.375 Y155.112 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X39.37 Y157.07 I-50.294 J.842 E.07295
G3 X38.314 Y160.558 I-7.725 J-.435 E.13701
G3 X37.886 Y161.227 I-2.323 J-1.014 E.02972
G1 X37.75 Y161.389 E.00785
G3 X37.804 Y160.047 I12.226 J-.183 E.05006
G2 X37.825 Y159.037 I-17.505 J-.871 E.03761
G1 X37.825 Y145.596 E.50063
G2 X26.975 Y145.596 I-5.425 J.004 E.63447
G1 X26.975 Y159.037 E.50063
G2 X27.039 Y160.543 I14.484 J.144 E.05615
G3 X27.05 Y161.389 I-18.165 J.667 E.03152
G3 X26.597 Y160.801 I5.77 J-4.92 E.02764
G3 X25.718 Y158.798 I11.419 J-6.202 E.08158
G3 X25.425 Y156.796 I6.78 J-2.016 E.07563
G1 X25.425 Y145.603 E.41687
G3 X32.803 Y138.636 I6.978 J-.001 E.42318
G3 X39.304 Y144.605 I-.42 J6.981 E.35571
G1 X39.39 Y145.295 E.02591
G1 X39.936 Y145.082 E.02186
G3 X40.31 Y145.024 I.4 J1.339 E.01411
G1 X47.346 Y145.025 E.26208
G3 X48.474 Y146.153 I-.069 J1.197 E.06499
G1 X48.475 Y154.19 E.29932
G3 X47.29 Y155.374 I-1.184 J0 E.06931
G1 X40.309 Y155.374 E.26003
G3 X39.953 Y155.321 I.004 J-1.25 E.01345
G1 X39.431 Y155.132 E.02067
; WIPE_START
G1 X39.37 Y157.07 E-.73681
G1 X39.365 Y157.131 E-.02319
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X38.6 Y154.102 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.218714
G1 F3000
M204 S500
G3 X38.59 Y157.281 I-82.716 J1.343 E.04554
G1 X38.579 Y157.522 E.00347
; LINE_WIDTH: 0.162975
G1 X38.562 Y157.766 E.00239
; LINE_WIDTH: 0.124132
G1 X38.537 Y158.042 E.00184
; WIPE_START
G1 X38.562 Y157.766 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X38.376 Y159.277 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.30536
G1 F3000
M204 S500
G1 X38.162 Y160.071 E.01759
; LINE_WIDTH: 0.282714
G1 X38.086 Y160.34 E.00546
; LINE_WIDTH: 0.240075
G1 X38.01 Y160.609 E.00449
; WIPE_START
G1 X38.086 Y160.34 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X30.456 Y160.528 Z.6 F42000
G1 X26.788 Y160.618 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.109974
G1 F3000
M204 S500
G1 X26.773 Y160.557 E.00034
; LINE_WIDTH: 0.141351
G1 X26.738 Y160.429 E.00107
; LINE_WIDTH: 0.190233
G1 X26.702 Y160.299 E.00161
; LINE_WIDTH: 0.237225
G1 X26.67 Y160.185 E.00188
; LINE_WIDTH: 0.302874
G3 X26.425 Y159.277 I32.898 J-9.362 E.01993
; WIPE_START
G1 X26.67 Y160.185 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X26.263 Y158.042 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.124232
G1 F3000
M204 S500
G1 X26.238 Y157.764 E.00185
; LINE_WIDTH: 0.163043
G1 X26.221 Y157.523 E.00237
; LINE_WIDTH: 0.200634
G3 X26.206 Y157.155 I9.683 J-.592 E.00473
G1 X26.203 Y157.041 E.00147
; LINE_WIDTH: 0.221744
G1 X26.2 Y145.611 E.16655
G3 X38.555 Y144.86 I6.2 J-.01 E.27315
G1 X38.622 Y145.587 E.01064
; LINE_WIDTH: 0.284361
G1 X38.645 Y145.951 E.00718
; LINE_WIDTH: 0.319833
G1 X38.667 Y146.313 E.00818
; WIPE_START
G1 X38.645 Y145.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X46.276 Y146.119 Z.6 F42000
G1 X46.451 Y146.123 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50107
G1 F6300
M204 S500
G1 X47.171 Y146.843 E.03803
G1 X47.171 Y147.491 E.02419
G1 X46.009 Y146.329 E.06137
G1 X45.361 Y146.329 E.02418
G1 X47.171 Y148.139 E.09557
G1 X47.172 Y148.787 E.02419
G1 X44.714 Y146.329 E.12977
G1 X44.066 Y146.329 E.02418
G1 X47.172 Y149.435 E.16397
G1 X47.172 Y150.083 E.02419
G1 X43.418 Y146.33 E.19817
G1 X42.771 Y146.33 E.02418
G1 X47.172 Y150.731 E.23237
G1 X47.172 Y151.379 E.02419
G1 X42.123 Y146.33 E.26657
G1 X41.475 Y146.33 E.02418
G1 X47.172 Y152.027 E.30077
G1 X47.172 Y152.675 E.02419
G1 X40.828 Y146.331 E.33497
G1 X40.342 Y146.331 E.01815
G1 X40.225 Y146.376 E.00467
G1 X47.172 Y153.323 E.36681
G1 X47.172 Y153.971 E.02419
G1 X39.757 Y146.555 E.39153
G1 X39.288 Y146.735 E.01872
G1 X46.625 Y154.072 E.38734
G1 X45.977 Y154.072 E.02419
G1 X39.128 Y147.222 E.36162
G1 X39.128 Y147.87 E.02419
G1 X45.329 Y154.072 E.32742
G1 X44.681 Y154.072 E.02419
G1 X39.128 Y148.518 E.29321
G1 X39.128 Y149.166 E.02419
G1 X44.033 Y154.072 E.259
G1 X43.385 Y154.072 E.02419
G1 X39.128 Y149.814 E.22479
G1 X39.128 Y150.462 E.02419
G1 X42.737 Y154.072 E.19058
G1 X42.089 Y154.072 E.02419
G1 X39.128 Y151.11 E.15638
G1 X39.128 Y151.758 E.02419
G1 X41.441 Y154.072 E.12217
G1 X40.794 Y154.072 E.02419
G1 X39.128 Y152.406 E.08796
G1 X39.128 Y153.054 E.02419
G1 X40.351 Y154.277 E.06461
; OBJECT_ID: 9
; WIPE_START
G1 X39.128 Y153.054 E-.65764
M73 P31 R17
G1 X39.128 Y152.784 E-.10236
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S6000
G1 X46.758 Y152.968 Z.6 F42000
G1 X73.139 Y153.603 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X73.139 Y146.575 E.26177
G1 X74.61 Y145.957 E.05943
G3 X74.686 Y145.94 I.111 J.319 E.00289
G1 X81.715 Y145.94 E.2618
G3 X81.96 Y146.19 I-.029 J.274 E.01413
G1 X81.961 Y154.163 E.29697
G3 X81.664 Y154.461 I-.269 J.028 E.01794
G1 X74.735 Y154.461 E.25808
G3 X74.62 Y154.446 I-.019 J-.312 E.00435
G1 X73.139 Y153.909 E.05866
G1 X73.139 Y153.663 E.00919
M204 S6000
G1 X73.318 Y154.461 F42000
G1 F3000
M204 S500
G3 X73.313 Y156.766 I-59.113 J1.015 E.08587
G3 X72.911 Y158.819 I-7.248 J-.353 E.07818
G1 X72.682 Y158.78 E.00865
G1 X72.682 Y145.892 E.48004
G2 X60.318 Y145.892 I-6.182 J.009 E.72271
G1 X60.318 Y158.78 E.48005
G1 X60.089 Y158.819 E.00865
G3 X59.682 Y156.491 I6.761 J-2.382 E.0884
G1 X59.682 Y145.908 E.39419
G3 X66.71 Y139.086 I6.82 J-.005 E.40695
G3 X73.212 Y144.704 I-.212 J6.817 E.34622
G1 X73.412 Y145.964 E.04755
G1 X74.457 Y145.526 E.04221
G3 X74.675 Y145.483 I.278 J.84 E.0083
G1 X81.728 Y145.483 E.26271
G3 X82.417 Y146.172 I-.038 J.727 E.03976
G1 X82.418 Y154.177 E.29815
G3 X81.677 Y154.918 I-.725 J.016 E.04361
G1 X74.722 Y154.918 E.25905
G3 X74.486 Y154.884 I-.011 J-.765 E.0089
G1 X73.374 Y154.481 E.04406
M204 S6000
G1 X73.775 Y155.112 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X73.753 Y157.066 I-22.444 J.723 E.07281
G3 X72.73 Y160.312 I-8.096 J-.767 E.12767
G3 X72.465 Y160.794 I-1.893 J-.727 E.02055
G3 X72.151 Y161.198 I-5.358 J-3.84 E.0191
G3 X72.201 Y159.871 I7.366 J-.385 E.04955
G2 X72.225 Y158.858 I-15.698 J-.874 E.03773
G1 X72.225 Y145.896 E.48278
G2 X60.775 Y145.896 I-5.725 J.008 E.66932
G1 X60.775 Y158.858 E.48278
G2 X60.846 Y160.365 I13.058 J.144 E.05621
G1 X60.849 Y161.198 E.03104
G3 X60.383 Y160.574 I6.101 J-5.042 E.02903
G2 X59.884 Y159.526 I-22.639 J10.151 E.04324
G3 X59.225 Y156.496 I6.88 J-3.082 E.11633
G1 X59.225 Y145.904 E.39453
G3 X66.723 Y138.629 I7.277 J-.001 E.43402
G3 X73.662 Y144.623 I-.225 J7.274 E.36946
G1 X73.772 Y145.317 E.02618
G1 X74.303 Y145.094 E.02144
G3 X74.657 Y145.026 I.438 J1.312 E.01349
G1 X81.746 Y145.026 E.26402
G3 X82.874 Y146.154 I-.061 J1.189 E.0651
G1 X82.875 Y154.19 E.29932
G3 X81.69 Y155.375 I-1.184 J0 E.06931
G1 X74.709 Y155.375 E.26003
G3 X74.353 Y155.322 I.003 J-1.249 E.01345
G1 X73.831 Y155.133 E.02067
; WIPE_START
G1 X73.775 Y156.496 E-.51847
G1 X73.753 Y157.066 E-.21693
G1 X73.744 Y157.131 E-.0246
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X73 Y154.102 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.218074
G1 F3000
M204 S500
G3 X72.99 Y157.006 I-65.952 J1.225 E.04146
G1 X72.977 Y157.261 E.00364
; LINE_WIDTH: 0.159741
G1 X72.96 Y157.515 E.00243
; LINE_WIDTH: 0.122645
G1 X72.938 Y157.77 E.00166
; WIPE_START
G1 X72.96 Y157.515 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X72.774 Y159.028 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.287196
G1 F3000
M204 S500
G1 X72.55 Y159.898 E.01789
; LINE_WIDTH: 0.266432
G1 X72.522 Y159.992 E.00179
; LINE_WIDTH: 0.229425
G1 X72.495 Y160.086 E.00149
; LINE_WIDTH: 0.192036
G1 X72.467 Y160.182 E.00122
; LINE_WIDTH: 0.158041
G1 X72.443 Y160.267 E.00082
; LINE_WIDTH: 0.118651
G1 X72.407 Y160.413 E.00093
; WIPE_START
G1 X72.443 Y160.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X64.812 Y160.368 Z.6 F42000
G1 X60.593 Y160.424 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10628
G1 F3000
M204 S500
G1 X60.584 Y160.378 E.00024
; LINE_WIDTH: 0.124499
G1 X60.56 Y160.285 E.00063
; LINE_WIDTH: 0.154872
G1 X60.535 Y160.189 E.00091
; LINE_WIDTH: 0.189623
G1 X60.507 Y160.092 E.00121
; LINE_WIDTH: 0.227781
G1 X60.479 Y159.995 E.00152
; LINE_WIDTH: 0.285216
G1 X60.45 Y159.898 E.002
G3 X60.231 Y159.027 I16.118 J-4.52 E.01773
; WIPE_START
G1 X60.45 Y159.898 E-.68304
G1 X60.479 Y159.995 E-.07696
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X60.062 Y157.77 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.122629
G1 F3000
M204 S500
G1 X60.04 Y157.516 E.00166
; LINE_WIDTH: 0.159734
G1 X60.022 Y157.261 E.00243
; LINE_WIDTH: 0.199417
G3 X60.003 Y156.754 I12.942 J-.759 E.00647
; LINE_WIDTH: 0.221806
G1 X60 Y145.911 E.15805
G3 X72.917 Y144.869 I6.5 J-.01 E.28268
G1 X73.016 Y145.639 E.01132
; LINE_WIDTH: 0.281769
G1 X73.039 Y145.887 E.00485
; LINE_WIDTH: 0.323101
G1 X73.075 Y146.354 E.01069
; WIPE_START
G1 X73.039 Y145.887 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X80.668 Y146.117 Z.6 F42000
G1 X80.851 Y146.123 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50107
G1 F6300
M204 S500
G1 X81.571 Y146.844 E.03805
G1 X81.571 Y147.492 E.02419
G1 X80.408 Y146.329 E.0614
G1 X79.76 Y146.329 E.02419
G1 X81.571 Y148.14 E.09562
G1 X81.572 Y148.788 E.02419
G1 X79.113 Y146.329 E.12983
G1 X78.465 Y146.328 E.02419
G1 X81.572 Y149.436 E.16405
G1 X81.572 Y150.084 E.02419
G1 X77.817 Y146.328 E.19826
G1 X77.169 Y146.328 E.02419
G1 X81.572 Y150.732 E.23247
G1 X81.572 Y151.38 E.02419
G1 X76.521 Y146.328 E.26669
G1 X75.873 Y146.328 E.02419
G1 X81.572 Y152.028 E.3009
G1 X81.572 Y152.676 E.02419
G1 X75.225 Y146.328 E.33512
G1 X74.729 Y146.328 E.01853
G1 X74.622 Y146.373 E.00432
G1 X81.572 Y153.324 E.36696
G1 X81.572 Y153.972 E.02419
G1 X74.166 Y146.565 E.39106
G1 X73.709 Y146.757 E.01848
G1 X81.025 Y154.072 E.38624
G1 X80.377 Y154.072 E.02419
G1 X73.528 Y147.223 E.36162
G1 X73.528 Y147.871 E.02419
G1 X79.729 Y154.072 E.32742
G1 X79.081 Y154.072 E.02419
G1 X73.528 Y148.519 E.29321
G1 X73.528 Y149.167 E.02419
G1 X78.433 Y154.072 E.259
G1 X77.785 Y154.072 E.02419
G1 X73.528 Y149.814 E.22479
G1 X73.528 Y150.462 E.02419
G1 X77.137 Y154.072 E.19058
G1 X76.489 Y154.072 E.02419
G1 X73.528 Y151.11 E.15638
G1 X73.528 Y151.758 E.02419
G1 X75.841 Y154.072 E.12217
G1 X75.194 Y154.072 E.02419
G1 X73.528 Y152.406 E.08796
G1 X73.528 Y153.054 E.02419
G1 X74.751 Y154.278 E.06461
; OBJECT_ID: 3
; WIPE_START
G1 X73.528 Y153.054 E-.65765
G1 X73.528 Y152.785 E-.10235
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S6000
G1 X72.962 Y145.173 Z.6 F42000
G1 X68.708 Y87.861 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X53.192 Y87.861 E.57791
G1 X53.189 Y82.824 E.18761
G3 X53.486 Y82.539 I.268 J-.017 E.01745
G1 X54.421 Y82.539 E.03482
G1 X68.458 Y82.54 E.52283
M73 P32 R17
G1 X68.559 Y82.564 E.00385
G1 X68.654 Y82.639 E.00449
G3 X68.711 Y82.836 I-.38 J.217 E.00772
G1 X68.708 Y87.801 E.18494
; WIPE_START
G1 X66.708 Y87.809 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X60.849 Y92.7 Z.6 F42000
G1 X26.822 Y121.1 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X26.668 Y120.498 E.02313
G3 X26.518 Y119.008 I7.546 J-1.512 E.05588
G1 X26.518 Y95.992 E.85725
G3 X26.639 Y94.652 I7.841 J.03 E.05019
G3 X34.192 Y88.318 I7.576 J1.364 E.39846
G1 X87.708 Y88.318 E1.99326
G3 X95.382 Y95.992 I-.022 J7.696 E.44864
G1 X95.382 Y119.008 E.85725
G3 X87.708 Y126.682 I-7.685 J-.011 E.44881
G1 X34.192 Y126.682 E1.99326
G3 X26.897 Y121.373 I.022 J-7.696 E.35906
G1 X26.838 Y121.158 E.00831
M204 S6000
G1 X27.264 Y120.985 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X27.116 Y120.409 E.02213
G3 X26.975 Y119.003 I7.097 J-1.422 E.05271
G1 X26.975 Y95.997 E.8569
G3 X34.197 Y88.775 I7.228 J.006 E.42242
G1 X87.703 Y88.775 E1.99291
G3 X94.925 Y95.997 I-.017 J7.238 E.42226
G1 X94.925 Y119.003 E.8569
G3 X87.703 Y126.225 I-7.228 J-.006 E.42242
G1 X34.197 Y126.225 E1.99291
G3 X27.332 Y121.232 I.017 J-7.238 E.33786
G1 X27.28 Y121.043 E.0073
; WIPE_START
G1 X27.116 Y120.409 E-.24858
G1 X27.025 Y119.849 E-.21564
G1 X26.979 Y119.072 E-.29579
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X33.102 Y114.516 Z.6 F42000
G1 X69.165 Y87.682 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X87.691 Y87.682 E.69003
G3 X96.018 Y96.009 I.004 J8.322 E.48722
G1 X96.018 Y118.991 E.85603
G3 X87.691 Y127.318 I-8.322 J.004 E.48722
G1 X34.209 Y127.318 E1.99204
G3 X25.882 Y118.991 I.007 J-8.334 E.48703
G1 X25.882 Y96.009 E.85603
G3 X34.209 Y87.682 I8.322 J-.004 E.48722
G1 X52.735 Y87.682 E.69003
G1 X52.732 Y82.815 E.18128
G3 X53.473 Y82.082 I.725 J-.008 E.04331
G1 X54.421 Y82.082 E.03532
G1 X68.476 Y82.083 E.52349
G3 X69.168 Y82.823 I-.032 J.724 E.04177
G1 X69.165 Y87.622 E.17876
M204 S6000
G1 X69.623 Y87.225 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X87.696 Y87.225 E.67317
G3 X96.475 Y96.004 I0 J8.779 E.51361
G1 X96.475 Y118.996 E.85638
G3 X87.696 Y127.775 I-8.792 J-.013 E.51341
G1 X34.204 Y127.775 E1.99239
G3 X25.425 Y118.996 I.013 J-8.792 E.51341
G1 X25.425 Y96.004 E.85638
G3 X34.204 Y87.225 I8.779 J0 E.51361
G1 X52.277 Y87.225 E.67317
G1 X52.275 Y82.806 E.16458
G3 X53.459 Y81.625 I1.184 J.003 E.06918
G1 X54.421 Y81.625 E.03582
G1 X68.494 Y81.626 E.52415
G3 X69.625 Y82.809 I-.053 J1.183 E.06731
G1 X69.623 Y87.165 E.16224
; WIPE_START
G1 X71.623 Y87.172 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X68.937 Y88 Z.6 F42000
M73 P33 R17
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.221606
G1 F3000
M204 S500
G1 X87.688 Y88 E.27304
G1 X88.328 Y88.025 E.00932
G1 X88.95 Y88.098 E.00912
G1 X89.569 Y88.221 E.00919
G1 X90.171 Y88.391 E.0091
G1 X90.469 Y88.494 E.0046
G1 X90.763 Y88.61 E.0046
G1 X91.33 Y88.871 E.00909
G1 X91.881 Y89.18 E.00919
G1 X92.401 Y89.527 E.0091
G1 X92.653 Y89.718 E.0046
G1 X92.897 Y89.918 E.0046
G1 X93.356 Y90.342 E.0091
G1 X93.784 Y90.806 E.00919
G1 X94.171 Y91.296 E.00909
G1 X94.352 Y91.555 E.0046
G1 X94.68 Y92.091 E.00915
M73 P33 R16
G1 X94.964 Y92.649 E.00912
G1 X95.092 Y92.94 E.00463
G1 X95.308 Y93.528 E.00912
G1 X95.479 Y94.131 E.00913
G1 X95.547 Y94.441 E.00462
G1 X95.645 Y95.06 E.00912
G1 X95.694 Y95.686 E.00915
G1 X95.694 Y119.314 E.34404
G1 X95.644 Y119.942 E.00917
G1 X95.601 Y120.253 E.00458
G1 X95.479 Y120.866 E.00909
G1 X95.308 Y121.473 E.00918
G1 X95.09 Y122.063 E.00917
G1 X94.829 Y122.63 E.00909
G1 X94.681 Y122.908 E.00458
G1 X94.352 Y123.445 E.00917
G1 X93.982 Y123.954 E.00917
G1 X93.575 Y124.43 E.00911
G1 X93.357 Y124.657 E.00459
G1 X92.894 Y125.084 E.00918
G1 X92.404 Y125.471 E.0091
G1 X92.145 Y125.652 E.00459
G1 X91.878 Y125.822 E.00461
G1 X91.333 Y126.127 E.00909
G1 X90.761 Y126.391 E.00917
G1 X90.467 Y126.506 E.0046
G1 X89.873 Y126.699 E.00909
G1 X89.26 Y126.846 E.00917
G1 X88.638 Y126.945 E.00917
G1 X88.326 Y126.975 E.00457
G1 X87.712 Y127 E.00895
G1 X33.888 Y126.994 E.78371
G1 X33.57 Y126.975 E.00463
G1 X32.948 Y126.901 E.00912
G1 X32.334 Y126.779 E.00911
G1 X32.027 Y126.699 E.00462
G1 X31.431 Y126.506 E.00912
G1 X30.852 Y126.266 E.00912
G1 X30.567 Y126.127 E.00463
G1 X30.02 Y125.821 E.00912
G1 X29.499 Y125.473 E.00912
G1 X29.247 Y125.282 E.0046
G1 X28.771 Y124.876 E.00912
G1 X28.543 Y124.657 E.0046
G1 X28.325 Y124.429 E.00459
G1 X27.918 Y123.953 E.00913
G1 X27.727 Y123.701 E.0046
G1 X27.379 Y123.18 E.00912
G1 X27.073 Y122.633 E.00912
G1 X26.935 Y122.349 E.0046
G1 X26.695 Y121.77 E.00912
G1 X26.592 Y121.472 E.0046
G1 X26.421 Y120.869 E.00912
G1 X26.354 Y120.56 E.0046
G1 X26.256 Y119.942 E.00912
G1 X26.225 Y119.628 E.0046
G1 X26.2 Y118.988 E.00931
G1 X26.206 Y95.686 E.3393
G1 X26.255 Y95.062 E.00912
G1 X26.299 Y94.747 E.00463
G1 X26.421 Y94.132 E.00912
G1 X26.591 Y93.529 E.00912
G1 X26.695 Y93.23 E.00462
G1 X26.935 Y92.651 E.00912
G1 X27.073 Y92.367 E.0046
G1 X27.379 Y91.82 E.00912
G1 X27.549 Y91.554 E.0046
G1 X27.916 Y91.049 E.00909
G1 X28.327 Y90.568 E.0092
G1 X28.768 Y90.127 E.00909
G1 X29.004 Y89.917 E.0046
G1 X29.249 Y89.716 E.0046
G1 X29.755 Y89.348 E.00912
G1 X30.022 Y89.178 E.00461
G1 X30.567 Y88.873 E.00909
G1 X31.14 Y88.608 E.00919
G1 X31.726 Y88.392 E.0091
G1 X32.028 Y88.3 E.0046
G1 X32.638 Y88.154 E.00912
G1 X32.948 Y88.099 E.0046
G1 X33.572 Y88.025 E.00915
G1 X34.212 Y88 E.00932
G1 X52.963 Y88 E.27304
; WIPE_START
G1 X50.963 Y88 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X58.238 Y85.69 Z.6 F42000
G1 X67.581 Y82.723 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5033
G1 F6300
M204 S500
G1 X68.322 Y83.464 E.03932
G1 X68.322 Y84.115 E.02441
G1 X67.135 Y82.929 E.06293
G1 X66.484 Y82.929 E.02443
G1 X68.321 Y84.766 E.09746
G1 X68.321 Y85.416 E.02441
G1 X65.833 Y82.929 E.13198
G1 X65.182 Y82.929 E.02443
G1 X68.321 Y86.067 E.16651
G1 X68.32 Y86.718 E.02441
G1 X64.531 Y82.928 E.20104
G1 X63.88 Y82.928 E.02443
G1 X68.32 Y87.368 E.23556
G1 X68.32 Y87.472 E.0039
G1 X67.773 Y87.472 E.02053
G1 X63.229 Y82.928 E.24108
G1 X62.578 Y82.928 E.02443
G1 X67.122 Y87.472 E.24108
G1 X66.471 Y87.472 E.02443
G1 X61.926 Y82.928 E.24108
G1 X61.275 Y82.928 E.02443
G1 X65.819 Y87.472 E.24109
G1 X65.168 Y87.472 E.02443
G1 X60.624 Y82.928 E.24109
G1 X59.973 Y82.928 E.02443
G1 X64.517 Y87.472 E.24109
G1 X63.866 Y87.472 E.02443
G1 X59.322 Y82.928 E.24109
G1 X58.671 Y82.928 E.02443
G1 X63.215 Y87.472 E.2411
G1 X62.564 Y87.472 E.02442
G1 X58.02 Y82.928 E.2411
G1 X57.369 Y82.928 E.02443
G1 X61.913 Y87.472 E.2411
G1 X61.262 Y87.472 E.02442
G1 X56.718 Y82.928 E.2411
G1 X56.066 Y82.928 E.02443
G1 X60.611 Y87.472 E.24111
G1 X59.96 Y87.472 E.02442
G1 X55.415 Y82.928 E.24111
G1 X54.764 Y82.928 E.02443
G1 X59.309 Y87.472 E.24111
G1 X58.658 Y87.472 E.02443
G1 X54.114 Y82.929 E.24104
G1 X53.587 Y82.932 E.0198
G1 X53.587 Y83.052 E.00453
G1 X58.007 Y87.472 E.2345
G1 X57.355 Y87.472 E.02443
G1 X53.586 Y83.703 E.2
G1 X53.585 Y84.353 E.02439
G1 X56.704 Y87.472 E.16551
G1 X56.053 Y87.472 E.02443
G1 X53.584 Y85.003 E.13101
G1 X53.583 Y85.653 E.02439
G1 X55.402 Y87.472 E.09651
G1 X54.751 Y87.472 E.02443
G1 X53.582 Y86.304 E.06201
G1 X53.582 Y86.954 E.02439
G1 X54.306 Y87.678 E.03843
; OBJECT_ID: 1
; WIPE_START
G1 X53.582 Y86.954 E-.38922
G1 X53.582 Y86.304 E-.2471
G1 X53.813 Y86.534 E-.12369
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S6000
G1 X55.746 Y79.15 Z.6 F42000
G1 X68.208 Y31.561 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X52.692 Y31.561 E.57791
G1 X52.689 Y26.524 E.18761
G3 X52.986 Y26.239 I.268 J-.017 E.01745
G1 X53.436 Y26.239 E.01673
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
G1 X73.778 Y32.485 Z.6 F42000
M73 P34 R16
G1 X92.983 Y34.96 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X93.167 Y35.213 E.01166
G3 X94.382 Y39.192 I-5.981 J4 E.15721
G1 X94.382 Y62.208 E.85725
G3 X89.283 Y69.072 I-7.201 J-.023 E.34101
G3 X87.208 Y69.382 I-2.157 J-7.339 E.07838
G1 X33.692 Y69.382 E1.99326
G3 X26.518 Y62.208 I.011 J-7.185 E.41956
G1 X26.518 Y39.192 E.85725
G3 X33.692 Y32.018 I7.195 J.021 E.4194
G1 X87.208 Y32.018 E1.99326
G3 X92.657 Y34.539 I-.021 J7.195 E.2307
G1 X92.946 Y34.913 E.01758
M204 S6000
G1 X92.619 Y35.236 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X92.788 Y35.466 E.01065
G3 X93.925 Y39.197 I-5.6 J3.746 E.14736
G1 X93.925 Y62.203 E.8569
G3 X87.203 Y68.925 I-6.737 J-.016 E.39302
G1 X33.697 Y68.925 E1.99291
G3 X26.975 Y62.203 I.006 J-6.728 E.39317
G1 X26.975 Y39.197 E.8569
G3 X33.697 Y32.475 I6.737 J.016 E.39302
G1 X87.203 Y32.475 E1.99291
G3 X92.31 Y34.836 I-.016 J6.737 E.21617
G1 X92.582 Y35.188 E.01658
; WIPE_START
G1 X92.788 Y35.466 E-.13147
G1 X93.192 Y36.147 E-.30072
G1 X93.413 Y36.626 E-.20072
G1 X93.523 Y36.942 E-.12709
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.074 Y35.276 Z.6 F42000
G1 X68.665 Y31.382 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X87.192 Y31.382 E.69003
G3 X95.018 Y39.209 I-.006 J7.833 E.4578
G1 X95.018 Y62.191 E.85602
G3 X87.191 Y70.018 I-7.833 J-.006 E.4578
G1 X33.709 Y70.018 E1.99204
G3 X25.882 Y62.191 I.006 J-7.833 E.45779
G1 X25.882 Y39.209 E.85603
G3 X33.709 Y31.382 I7.833 J.006 E.45779
G1 X52.235 Y31.382 E.69003
G1 X52.232 Y26.515 E.18128
G3 X52.973 Y25.782 I.725 J-.008 E.04331
G1 X53.436 Y25.782 E.01724
G1 X67.976 Y25.783 E.54157
G3 X68.668 Y26.523 I-.032 J.724 E.04177
G1 X68.665 Y31.322 E.17876
M204 S6000
G1 X69.123 Y30.925 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X87.196 Y30.925 E.67317
G3 X95.475 Y39.204 I-.012 J8.291 E.48417
G1 X95.475 Y62.196 E.85638
G3 X87.196 Y70.475 I-8.291 J-.012 E.48417
G1 X33.704 Y70.475 E1.99239
G3 X25.425 Y62.196 I.012 J-8.291 E.48417
G1 X25.425 Y39.204 E.85638
G3 X33.704 Y30.925 I8.291 J.012 E.48417
G1 X51.777 Y30.925 E.67317
G1 X51.775 Y26.506 E.16458
G3 X52.96 Y25.325 I1.184 J.003 E.06919
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
; LINE_WIDTH: 0.221612
G1 F3000
M204 S500
G1 X87.188 Y31.7 E.27305
G1 X87.496 Y31.706 E.00448
G1 X88.083 Y31.752 E.00857
G1 X88.951 Y31.907 E.01284
G1 X89.794 Y32.163 E.01283
G1 X90.341 Y32.39 E.00863
M73 P35 R16
G1 X91.118 Y32.805 E.01283
G1 X91.842 Y33.309 E.01284
G1 X92.292 Y33.694 E.00863
G1 X92.903 Y34.329 E.01284
G1 X93.436 Y35.033 E.01284
G1 X93.883 Y35.797 E.01289
G1 X94.129 Y36.329 E.00854
G1 X94.333 Y36.882 E.00858
G1 X94.556 Y37.738 E.01288
G1 X94.648 Y38.319 E.00856
G1 X94.694 Y38.905 E.00857
G1 X94.694 Y62.494 E.34348
G1 X94.648 Y63.083 E.0086
G1 X94.493 Y63.951 E.01284
G1 X94.237 Y64.794 E.01283
G1 X94.011 Y65.34 E.0086
G1 X93.743 Y65.866 E.00861
G1 X93.268 Y66.608 E.01283
G1 X92.902 Y67.072 E.0086
G1 X92.292 Y67.706 E.01281
G1 X91.843 Y68.09 E.0086
G1 X91.365 Y68.437 E.00861
G1 X90.606 Y68.882 E.01281
G1 X90.069 Y69.13 E.00862
G1 X89.237 Y69.418 E.01281
G1 X88.663 Y69.556 E.0086
G1 X88.08 Y69.648 E.0086
G1 X87.212 Y69.7 E.01265
G1 X33.688 Y69.7 E.77937
G1 X33.112 Y69.677 E.0084
G1 X32.528 Y69.608 E.00855
G1 X31.664 Y69.418 E.01288
G1 X30.828 Y69.128 E.01289
G1 X30.295 Y68.883 E.00854
G1 X29.782 Y68.595 E.00857
G1 X29.057 Y68.09 E.01287
G1 X28.397 Y67.503 E.01285
G1 X27.81 Y66.843 E.01286
G1 X27.305 Y66.119 E.01286
G1 X26.889 Y65.34 E.01286
G1 X26.567 Y64.518 E.01285
G1 X26.344 Y63.663 E.01286
G1 X26.223 Y62.789 E.01285
G1 X26.2 Y62.188 E.00875
G1 X26.206 Y38.905 E.33903
G1 X26.293 Y38.025 E.01288
G1 X26.407 Y37.449 E.00855
G1 X26.567 Y36.884 E.00855
G1 X26.889 Y36.06 E.01288
G1 X27.305 Y35.281 E.01286
G1 X27.81 Y34.557 E.01286
G1 X28.396 Y33.898 E.01283
G1 X28.83 Y33.496 E.00862
G1 X29.533 Y32.964 E.01283
G1 X30.295 Y32.517 E.01286
G1 X31.103 Y32.164 E.01284
G1 X31.948 Y31.908 E.01286
G1 X32.528 Y31.792 E.00862
G1 X33.111 Y31.723 E.00855
G1 X33.712 Y31.7 E.00875
G1 X52.463 Y31.7 E.27305
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
G1 X65.319 Y31.172 E.24109
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
G1 X58.158 Y31.172 E.02443
G1 X53.613 Y26.628 E.24111
G2 X53.087 Y26.634 I-.088 J13.683 E.01975
G1 X53.087 Y26.752 E.00442
G1 X57.507 Y31.172 E.2345
G1 X56.856 Y31.172 E.02443
G1 X53.086 Y27.403 E.2
G1 X53.085 Y28.053 E.02439
G1 X56.204 Y31.172 E.16551
G1 X55.553 Y31.172 E.02442
G1 X53.084 Y28.703 E.13101
G1 X53.083 Y29.353 E.02439
G1 X54.902 Y31.172 E.09651
G1 X54.251 Y31.172 E.02442
G1 X53.082 Y30.004 E.06201
G1 X53.082 Y30.654 E.02439
G1 X53.806 Y31.378 E.03843
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X53.082 Y30.654 E-.38923
G1 X53.082 Y30.004 E-.24709
G1 X53.313 Y30.234 E-.12368
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 2/15
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S168.3
; open powerlost recovery
M1003 S1
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-.457 J1.128 P1  F42000
G1 X218.891 Y97.393 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X218.886 Y100.336 I-76.922 J1.348 E.09761
G3 X218.728 Y101.51 I-6.446 J-.271 E.03937
G1 X218.509 Y101.487 E.00729
G1 X218.509 Y88.489 E.43116
G2 X206.891 Y88.489 I-5.809 J.011 E.60468
G1 X206.891 Y101.486 E.43113
G1 X206.672 Y101.509 E.0073
G3 X206.509 Y100.089 I6.803 J-1.5 E.0475
G1 X206.509 Y88.509 E.38412
G3 X213.054 Y82.318 I6.194 J-.007 E.33463
G3 X218.843 Y87.734 I-.358 J6.184 E.28535
G1 X219 Y89.234 E.05001
G1 X220.271 Y88.826 E.04427
G3 X220.421 Y88.808 I.167 J.75 E.00503
G1 X227.409 Y88.809 E.2318
G3 X227.89 Y89.28 I-.021 J.502 E.02444
G1 X227.891 Y97.279 E.26535
G3 X227.37 Y97.79 I-.495 J.016 E.0272
G1 X220.419 Y97.79 E.23058
G3 X220.294 Y97.777 I-.003 J-.605 E.00417
G1 X218.949 Y97.409 E.04627
M204 S10000
G1 X219.298 Y97.927 F42000
G1 F8843.478
M204 S6000
G3 X219.293 Y100.351 I-63.459 J1.083 E.08043
G3 X218.279 Y103.618 I-6.71 J-.291 E.11474
G1 X218.102 Y103.568 E.00611
G1 X218.102 Y88.493 E.50005
G2 X207.298 Y88.493 I-5.402 J.007 E.56252
G1 X207.298 Y103.568 E.50006
M73 P36 R16
G1 X207.121 Y103.619 E.00612
G3 X206.102 Y100.093 I5.598 J-3.527 E.12336
G1 X206.102 Y88.505 E.38438
G3 X213.078 Y81.912 I6.601 J-.003 E.35647
G3 X219.247 Y87.684 I-.381 J6.591 E.30411
G1 X219.353 Y88.693 E.03365
G1 X220.162 Y88.434 E.02819
G3 X220.413 Y88.401 I.277 J1.149 E.0084
G1 X227.429 Y88.402 E.23275
G3 X228.297 Y89.264 I-.047 J.915 E.04441
G1 X228.298 Y97.287 E.26615
G3 X227.382 Y98.197 I-.901 J.009 E.04774
G1 X220.411 Y98.197 E.23123
G3 X220.202 Y98.174 I.006 J-1.041 E.00698
G1 X219.356 Y97.942 E.02912
M204 S250
G1 X219.69 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X219.69 Y98.455 E.00046
G1 F9300
G1 X219.69 Y99.497 E.03199
G3 X219.185 Y102.706 I-7.732 J.429 E.10059
G3 X218.843 Y103.431 I-6.713 J-2.727 E.02463
G1 X218.564 Y103.902 E.01683
G1 F8400
G1 X218.422 Y104.113 E.0078
G1 F9300
G1 X218.095 Y104.535 E.0164
G1 F7609.06
G3 X217.744 Y104.938 I-7.202 J-5.922 E.01643
G1 F2520
G1 X217.71 Y104.972 E.00149
G1 F6070.344
G1 X217.71 Y104.572 E.01229
G1 F9300
G1 X217.71 Y104.172 E.01229
G1 X217.71 Y89.097 E.46322
G2 X217.707 Y88.3 I-7.227 J-.369 E.02451
G1 X217.648 Y87.715 E.01806
G1 F8400
G1 X217.611 Y87.509 E.00642
G1 F9300
G1 X217.458 Y86.932 E.01835
G2 X217.319 Y86.559 I-4.959 J1.629 E.01224
G1 F8400
G1 X217.234 Y86.368 E.00642
G1 F9300
G2 X216.953 Y85.851 I-5.048 J2.409 E.01807
G1 F8400
G1 X216.839 Y85.677 E.00642
G1 F9300
G1 X216.608 Y85.365 E.01194
G2 X214.912 Y84.004 I-3.92 J3.149 E.06733
G1 X214.557 Y83.846 E.01194
G1 F8400
G1 X214.361 Y83.772 E.00642
G1 F9300
G1 X214.172 Y83.71 E.00613
G1 F8400
G1 X213.971 Y83.653 E.00641
G1 F9300
G1 X213.592 Y83.57 E.01194
G2 X213.008 Y83.499 I-.919 J5.103 E.01806
G1 F8400
G1 X212.8 Y83.49 E.00641
G1 F9300
G1 X212.6 Y83.49 E.00614
G1 F8400
G1 X212.392 Y83.499 E.00641
G1 F9300
G2 X211.808 Y83.569 I.377 J5.581 E.01807
G1 F8400
G1 X211.603 Y83.611 E.00641
G1 F9300
G1 X211.228 Y83.712 E.01194
G2 X209.489 Y84.655 I1.52 J4.876 E.06118
G1 X209.2 Y84.915 E.01194
G1 F8400
G1 X209.053 Y85.063 E.00641
G1 F9300
G1 X208.672 Y85.524 E.01836
G2 X207.885 Y87.123 I4.121 J3.024 E.05505
G1 X207.789 Y87.509 E.01224
G1 F8400
G1 X207.752 Y87.715 E.00642
G1 F9300
G1 X207.693 Y88.3 E.01806
G2 X207.69 Y89.097 I7.224 J.428 E.02451
G1 X207.69 Y104.172 E.46322
G1 X207.69 Y104.572 E.01229
G1 F6070.344
G1 X207.69 Y104.972 E.01229
G1 F2520
G1 X207.656 Y104.938 E.00149
G1 F6070.344
G1 X207.396 Y104.634 E.01229
G1 F9300
G1 X207.137 Y104.327 E.01233
G3 X205.71 Y100.097 I5.63 J-4.255 E.13958
G1 X205.71 Y89.101 E.33786
G3 X206.152 Y86.054 I7.759 J-.431 E.09525
G3 X213.1 Y81.52 I6.564 J2.469 E.27277
G3 X219.549 Y87.102 I-.404 J6.983 E.28183
G1 X219.636 Y87.635 E.01661
G1 F8400
G1 X219.69 Y88.147 E.0158
G1 F8730.839
G1 X219.692 Y88.172 E.00079
G1 F9547.055
G1 X220.153 Y88.039 E.01472
G3 X220.404 Y88.009 I.385 J2.181 E.0078
G1 X227.448 Y88.01 E.21644
G3 X228.689 Y89.248 I-.072 J1.313 E.05895
G1 X228.69 Y97.295 E.24724
G3 X227.394 Y98.589 I-1.293 J.001 E.06255
G1 X220.404 Y98.589 E.21477
G3 X219.746 Y98.461 I.121 J-2.373 E.02066
; WIPE_START
M204 S6000
G1 X219.69 Y98.455 E-.0215
G1 X219.69 Y99.497 E-.39562
G1 X219.685 Y100.366 E-.33045
G1 X219.682 Y100.399 E-.01243
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.879 Y101.742 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545435
G1 F7163.967
M204 S6000
G1 X218.557 Y101.95 E.01568
; LINE_WIDTH: 0.526747
G1 F7440.68
G1 X218.538 Y102.067 E.00468
; LINE_WIDTH: 0.488329
G1 F8082.461
G1 X218.519 Y102.184 E.00431
; LINE_WIDTH: 0.447393
G1 F8900.484
G1 X218.436 Y102.634 E.01508
; LINE_WIDTH: 0.403971
G1 F9970.896
G1 X218.353 Y103.084 E.01346
; WIPE_START
G1 X218.436 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X225.078 Y98.875 Z.8 F42000
G1 X227.285 Y97.626 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42751
G1 F9360.617
M204 S6000
G2 X227.545 Y97.35 I-.742 J-.96 E.01195
G2 X227.558 Y97.262 I-.187 J-.071 E.00279
G1 X227.558 Y96.809 E.01419
G1 X226.911 Y97.457 E.02868
G1 X226.367 Y97.457 E.01705
G1 X227.557 Y96.266 E.05278
G1 X227.557 Y95.722 E.01704
G1 X225.823 Y97.457 E.07688
G1 X225.279 Y97.457 E.01705
G1 X227.557 Y95.178 E.10098
G1 X227.557 Y94.634 E.01704
G1 X224.735 Y97.457 E.12508
G1 X224.191 Y97.457 E.01705
G1 X227.557 Y94.09 E.14919
G1 X227.557 Y93.547 E.01704
G1 X223.647 Y97.457 E.17329
G1 X223.103 Y97.457 E.01705
G1 X227.557 Y93.003 E.19739
G1 X227.557 Y92.459 E.01704
G1 X222.559 Y97.457 E.22149
G1 X222.015 Y97.457 E.01705
G1 X227.557 Y91.915 E.24559
G1 X227.557 Y91.371 E.01704
G1 X221.472 Y97.457 E.2697
G1 X220.928 Y97.457 E.01705
G1 X227.557 Y90.828 E.2938
G1 X227.557 Y90.284 E.01704
G1 X220.388 Y97.452 E.31769
G1 X219.957 Y97.34 E.01398
G1 X227.557 Y89.74 E.33682
G1 X227.556 Y89.321 E.01312
G2 X227.529 Y89.223 I-.138 J-.015 E.00327
G1 X219.53 Y97.223 E.35454
G1 X219.103 Y97.106 E.01387
G1 X227.066 Y89.142 E.35293
G1 X226.522 Y89.142 E.01704
G1 X218.841 Y96.824 E.34045
G1 X218.841 Y96.28 E.01704
G1 X225.979 Y89.142 E.31636
G1 X225.435 Y89.142 E.01704
G1 X218.84 Y95.736 E.29226
G1 X218.84 Y95.193 E.01704
G1 X224.891 Y89.142 E.26817
G1 X224.347 Y89.142 E.01704
G1 X218.84 Y94.649 E.24408
G1 X218.84 Y94.105 E.01704
G1 X223.803 Y89.142 E.21998
G1 X223.26 Y89.142 E.01704
G1 X218.84 Y93.562 E.19589
G1 X218.84 Y93.018 E.01704
G1 X222.716 Y89.142 E.1718
G1 X222.172 Y89.142 E.01704
G1 X218.839 Y92.474 E.1477
G1 X218.839 Y91.931 E.01704
G1 X221.628 Y89.141 E.12361
G1 X221.084 Y89.141 E.01704
G1 X218.839 Y91.387 E.09952
G1 X218.839 Y90.843 E.01704
G1 X220.541 Y89.141 E.07542
G2 X220.342 Y89.153 I-.05 J.827 E.00624
G1 X219.816 Y89.322 E.01731
G1 X218.669 Y90.469 E.05084
M204 S10000
G1 X218.769 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136218
G1 F15000
M204 S6000
G1 X218.753 Y89.228 E.00223
; LINE_WIDTH: 0.110013
G1 X218.738 Y88.936 E.0016
; WIPE_START
G1 X218.753 Y89.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X213.475 Y94.742 Z.8 F42000
G1 X206.815 Y101.699 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.540003
G1 F7242.25
M204 S6000
G2 X206.862 Y102.067 I3.563 J-.269 E.01503
; LINE_WIDTH: 0.48842
G1 F8080.813
G1 X206.881 Y102.184 E.00432
; LINE_WIDTH: 0.447409
G1 F8900.132
G1 X206.964 Y102.634 E.01508
; LINE_WIDTH: 0.403905
G1 F9972.711
G1 X207.047 Y103.084 E.01346
; OBJECT_ID: 6
; WIPE_START
G1 X206.964 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X199.549 Y100.824 Z.8 F42000
G1 X185.491 Y97.393 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X185.486 Y100.336 I-76.636 J1.348 E.09763
G3 X185.328 Y101.509 I-6.438 J-.27 E.03934
G1 X185.109 Y101.486 E.0073
G1 X185.109 Y88.489 E.43113
G2 X173.491 Y88.489 I-5.809 J.011 E.60468
G1 X173.491 Y101.487 E.43116
G1 X173.272 Y101.51 E.00729
G3 X173.109 Y100.089 I6.804 J-1.501 E.04754
G1 X173.109 Y88.509 E.38411
G3 X179.654 Y82.318 I6.194 J-.007 E.33463
G3 X185.443 Y87.734 I-.358 J6.184 E.28534
G1 X185.6 Y89.234 E.05002
G1 X186.906 Y88.818 E.04548
G3 X187.029 Y88.808 I.112 J.628 E.00409
G1 X194.019 Y88.809 E.23186
G3 X194.49 Y89.28 I-.032 J.503 E.02413
G1 X194.491 Y97.27 E.26505
G3 X193.97 Y97.79 I-.495 J.025 E.0275
G1 X187.019 Y97.79 E.23058
G3 X186.894 Y97.777 I-.003 J-.605 E.00416
G1 X185.549 Y97.408 E.04628
M204 S10000
G1 X185.898 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X185.893 Y100.351 I-63.23 J1.083 E.08044
G3 X184.879 Y103.619 I-6.715 J-.292 E.11474
G1 X184.702 Y103.568 E.00612
G1 X184.702 Y88.493 E.50006
G2 X173.898 Y88.493 I-5.402 J.007 E.56252
G1 X173.898 Y103.568 E.50007
G1 X173.721 Y103.619 E.00612
G3 X172.702 Y100.093 I5.598 J-3.527 E.12336
G1 X172.702 Y88.505 E.38438
G3 X179.678 Y81.912 I6.601 J-.003 E.35648
G3 X185.847 Y87.684 I-.381 J6.591 E.30411
G1 X185.953 Y88.693 E.03366
G1 X186.762 Y88.434 E.0282
G3 X187.017 Y88.401 I.253 J.965 E.00856
G1 X194.035 Y88.402 E.23278
G3 X194.897 Y89.264 I-.054 J.915 E.04422
G1 X194.898 Y97.282 E.26597
G3 X193.982 Y98.197 I-.901 J.014 E.04791
G1 X187.011 Y98.197 E.23123
G3 X186.802 Y98.174 I.006 J-1.038 E.00698
G1 X185.956 Y97.942 E.02912
M204 S250
G1 X186.29 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X186.29 Y98.455 E.00046
G1 F9300
G1 X186.29 Y99.496 E.03199
G3 X185.785 Y102.706 I-7.733 J.429 E.10059
G3 X184.853 Y104.337 I-6.731 J-2.766 E.05787
G1 X184.604 Y104.634 E.01192
G1 F6070.344
G1 X184.344 Y104.938 E.01229
G1 F2520
G1 X184.31 Y104.972 E.00148
G1 F6070.344
G1 X184.31 Y104.572 E.01229
G1 F9300
G1 X184.31 Y104.172 E.01229
G1 X184.31 Y89.097 E.46322
G2 X183.992 Y86.744 I-6.149 J-.368 E.07342
G2 X183.837 Y86.377 I-4.878 J1.846 E.01223
G1 X183.553 Y85.851 E.01836
G1 F8400
G1 X183.439 Y85.677 E.00641
G1 F9300
G1 X183.077 Y85.214 E.01805
G2 X182.662 Y84.784 I-4.246 J3.692 E.01837
G1 F8400
G1 X182.504 Y84.648 E.00641
G1 F9300
G1 X182.195 Y84.413 E.01194
G2 X181.511 Y84.006 I-3.062 J4.367 E.02447
G1 X181.157 Y83.846 E.01194
G1 F8400
G1 X180.961 Y83.772 E.00642
G1 F9300
G1 X180.772 Y83.71 E.00613
G1 F8400
G1 X180.571 Y83.653 E.00641
G1 F9300
G1 X180.192 Y83.57 E.01194
G2 X179.608 Y83.499 I-.919 J5.103 E.01806
G1 F8400
G1 X179.4 Y83.49 E.00641
G1 F9300
G1 X179.2 Y83.49 E.00614
G1 F8400
G1 X178.992 Y83.499 E.00641
G1 F9300
G1 X178.408 Y83.57 E.01806
G2 X178.02 Y83.656 I.909 J5.016 E.01224
G1 X177.648 Y83.769 E.01194
G1 F8400
G1 X177.452 Y83.842 E.00641
G1 F9300
G1 X177.088 Y84.005 E.01225
G2 X176.577 Y84.294 I2.301 J4.666 E.01807
G1 F8400
G1 X176.404 Y84.411 E.00642
G1 F9300
G1 X175.939 Y84.786 E.01835
G2 X174.29 Y88.497 I3.393 J3.729 E.12842
G1 X174.29 Y104.172 E.48166
G1 X174.29 Y104.572 E.01229
G1 F6070.344
G1 X174.29 Y104.972 E.01229
G1 F2520
G1 X174.256 Y104.938 E.00149
G1 F6070.344
G1 X173.996 Y104.634 E.01229
G1 F9300
G1 X173.737 Y104.327 E.01233
G3 X172.31 Y100.096 I5.629 J-4.255 E.13959
G1 X172.31 Y89.101 E.33786
G3 X172.752 Y86.054 I7.76 J-.431 E.09525
G3 X179.7 Y81.52 I6.564 J2.469 E.27277
G3 X186.149 Y87.102 I-.404 J6.983 E.28182
G1 X186.236 Y87.635 E.01661
G1 F8400
G1 X186.29 Y88.147 E.0158
G1 F8731.239
G1 X186.293 Y88.172 E.00079
G1 F9547.055
G1 X186.754 Y88.037 E.01478
G3 X187.006 Y88.009 I.353 J2.051 E.0078
G1 X194.05 Y88.01 E.21645
G3 X195.289 Y89.248 I-.075 J1.313 E.05889
G1 X195.29 Y97.293 E.24718
G3 X193.994 Y98.589 I-1.293 J.003 E.0626
G1 X187.004 Y98.589 E.21477
G3 X186.346 Y98.461 I.12 J-2.369 E.02066
; WIPE_START
M204 S6000
G1 X186.29 Y98.455 E-.02149
G1 X186.29 Y99.496 E-.39562
G1 X186.285 Y100.366 E-.33047
G1 X186.282 Y100.399 E-.01242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.476 Y101.751 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.546002
G1 F7155.901
M204 S6000
G1 X185.157 Y101.949 E.01536
; LINE_WIDTH: 0.526929
G1 F7437.889
G1 X185.138 Y102.067 E.00471
; LINE_WIDTH: 0.488336
G1 F8082.33
G1 X185.119 Y102.184 E.00433
; LINE_WIDTH: 0.44734
G1 F8901.647
G1 X185.036 Y102.634 E.01508
; LINE_WIDTH: 0.40394
G1 F9971.752
G1 X184.953 Y103.084 E.01346
; WIPE_START
G1 X185.036 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X191.679 Y98.876 Z.8 F42000
G1 X193.887 Y97.626 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42754
G1 F9359.887
M204 S6000
G1 X194.129 Y97.384 E.01074
G2 X194.158 Y97.244 I-.2 J-.114 E.00455
G1 X194.158 Y96.811 E.01356
G1 X193.512 Y97.457 E.0286
G1 X192.968 Y97.457 E.01705
G1 X194.157 Y96.267 E.0527
G1 X194.157 Y95.724 E.01705
G1 X192.425 Y97.457 E.07681
G1 X191.881 Y97.457 E.01705
G1 X194.157 Y95.18 E.10091
G1 X194.157 Y94.636 E.01705
G1 X191.337 Y97.457 E.12502
G1 X190.793 Y97.457 E.01705
G1 X194.157 Y94.092 E.14913
G1 X194.157 Y93.548 E.01705
G1 X190.249 Y97.457 E.17323
G1 X189.705 Y97.457 E.01705
G1 X194.157 Y93.004 E.19734
G1 X194.157 Y92.46 E.01705
G1 X189.161 Y97.457 E.22144
G1 X188.617 Y97.457 E.01705
G1 X194.157 Y91.917 E.24555
G1 X194.157 Y91.373 E.01705
G1 X188.073 Y97.457 E.26965
G1 X187.529 Y97.457 E.01705
G1 X194.157 Y90.829 E.29376
G1 X194.157 Y90.285 E.01705
G1 X186.99 Y97.452 E.31766
G1 X186.558 Y97.34 E.01398
G1 X194.157 Y89.741 E.33679
G1 X194.156 Y89.316 E.01333
G2 X194.128 Y89.226 I-.127 J-.009 E.00303
G1 X186.131 Y97.223 E.35444
G1 X185.704 Y97.106 E.01387
G1 X193.667 Y89.142 E.35296
G1 X193.124 Y89.142 E.01704
G1 X185.441 Y96.825 E.34053
G1 X185.441 Y96.281 E.01704
G1 X192.58 Y89.142 E.31643
G1 X192.036 Y89.142 E.01704
G1 X185.44 Y95.738 E.29234
G1 X185.44 Y95.194 E.01704
G1 X191.492 Y89.142 E.26824
G1 X190.948 Y89.142 E.01705
G1 X185.44 Y94.65 E.24414
G1 X185.44 Y94.106 E.01704
G1 X190.404 Y89.142 E.22004
G1 X189.861 Y89.142 E.01704
G1 X185.44 Y93.563 E.19595
G1 X185.44 Y93.019 E.01704
G1 X189.317 Y89.142 E.17185
G1 X188.773 Y89.142 E.01705
G1 X185.439 Y92.475 E.14775
G1 X185.439 Y91.931 E.01704
G1 X188.229 Y89.141 E.12366
G1 X187.685 Y89.141 E.01704
G1 X185.439 Y91.388 E.09956
G1 X185.439 Y90.844 E.01704
G1 X187.141 Y89.141 E.07546
G2 X186.941 Y89.154 I-.047 J.878 E.00629
G1 X186.417 Y89.322 E.01726
G1 X185.269 Y90.47 E.05089
M204 S10000
G1 X185.369 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13634
G1 F15000
M204 S6000
G1 X185.354 Y89.228 E.00224
; LINE_WIDTH: 0.110058
G1 X185.338 Y88.935 E.00161
; WIPE_START
G1 X185.354 Y89.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X180.019 Y94.687 Z.8 F42000
G1 X173.122 Y101.744 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.532875
G1 F7347.62
M204 S6000
G1 X173.443 Y101.95 E.01523
G1 X173.462 Y102.067 E.00476
; LINE_WIDTH: 0.488082
G1 F8086.944
G1 X173.481 Y102.185 E.00432
; LINE_WIDTH: 0.447224
G1 F8904.194
G1 X173.564 Y102.635 E.01507
; LINE_WIDTH: 0.403832
G1 F9974.745
G1 X173.647 Y103.084 E.01345
; OBJECT_ID: 5
; WIPE_START
G1 X173.564 Y102.635 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X166.149 Y100.824 Z.8 F42000
G1 X152.091 Y97.392 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.091 Y100.389 E.09942
G3 X151.927 Y101.778 I-6.638 J-.078 E.04648
G1 X151.709 Y101.755 E.00727
G1 X151.709 Y88.189 E.44999
G2 X140.691 Y88.189 I-5.509 J.011 E.57342
G1 X140.691 Y101.754 E.44996
G1 X140.473 Y101.777 E.00728
G3 X140.309 Y100.389 I6.538 J-1.474 E.04644
G1 X140.309 Y88.209 E.40403
G3 X146.534 Y82.318 I5.894 J-.007 E.31834
G3 X152.069 Y87.7 I-.347 J5.895 E.27912
G1 X152.169 Y89.234 E.05099
G1 X153.509 Y88.817 E.04652
G3 X153.628 Y88.808 I.109 J.629 E.00399
G1 X160.619 Y88.809 E.23189
G3 X161.09 Y89.29 I-.027 J.497 E.0245
G1 X161.091 Y97.279 E.26503
G3 X160.57 Y97.79 I-.495 J.016 E.02719
G1 X153.619 Y97.79 E.23059
G3 X153.494 Y97.778 I-.004 J-.597 E.00415
G1 X152.149 Y97.408 E.04629
M204 S10000
G1 X152.498 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X152.493 Y100.645 I-69.415 J1.234 E.0902
G3 X151.478 Y103.833 I-6.406 J-.284 E.11229
G1 X151.302 Y103.782 E.00608
G1 X151.302 Y88.193 E.51711
G2 X141.098 Y88.193 I-5.102 J.007 E.53125
G1 X141.098 Y103.782 E.5171
G1 X140.922 Y103.833 E.00607
G3 X139.902 Y100.393 I5.292 J-3.441 E.12068
G1 X139.902 Y88.205 E.4043
G3 X146.557 Y81.911 I6.301 J-.003 E.34018
G3 X152.475 Y87.665 I-.372 J6.302 E.29841
G1 X152.542 Y88.691 E.03408
G1 X153.368 Y88.432 E.0287
G3 X153.617 Y88.401 I.247 J.966 E.00836
G1 X160.635 Y88.402 E.2328
G3 X161.497 Y89.27 I-.047 J.909 E.04448
G1 X161.498 Y97.287 E.26595
G3 X160.582 Y98.197 I-.901 J.009 E.04773
G1 X153.611 Y98.197 E.23124
G3 X153.403 Y98.174 I.006 J-1.033 E.00697
G1 X152.556 Y97.942 E.02913
M204 S250
G1 X152.89 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X152.89 Y98.455 E.00046
G1 F9300
G1 X152.89 Y99.797 E.04122
G3 X152.48 Y102.705 I-7.785 J.385 E.09079
G3 X151.77 Y104.102 I-6.322 J-2.334 E.04823
G1 X151.54 Y104.409 E.0118
G1 X151.3 Y104.729 E.01229
G1 F7422.634
M73 P37 R16
G1 X150.936 Y105.123 E.01648
G1 F2400
G1 X150.91 Y105.149 E.00113
G1 F5883.29
G1 X150.91 Y104.749 E.01229
G1 F9300
G1 X150.91 Y104.349 E.01229
G1 X150.91 Y88.797 E.47787
G2 X150.907 Y88.012 I-6.947 J-.366 E.02414
G1 X150.852 Y87.462 E.01697
G1 F8400
G1 X150.817 Y87.269 E.00603
G1 F9300
G1 X150.727 Y86.905 E.01151
G2 X149.627 Y84.97 I-4.593 J1.331 E.06903
G1 X149.361 Y84.707 E.01151
G1 F8400
G1 X149.212 Y84.578 E.00603
G1 F9300
G1 X148.922 Y84.356 E.01123
G2 X147.584 Y83.697 I-2.734 J3.866 E.04604
G1 X147.038 Y83.564 E.01726
G1 F8400
G1 X146.844 Y83.533 E.00603
G1 F9300
G1 X146.294 Y83.492 E.01697
G2 X143.792 Y84.153 I-.082 J4.752 E.08052
G1 X143.334 Y84.462 E.01697
G1 F8400
G1 X143.181 Y84.584 E.00603
G1 F9300
G1 X142.903 Y84.836 E.01152
G2 X142.412 Y85.401 I3.339 J3.397 E.02301
G1 X142.11 Y85.863 E.01697
G1 F8400
G1 X142.016 Y86.036 E.00603
G1 F9300
G1 X141.791 Y86.55 E.01725
G2 X141.49 Y88.197 I4.54 J1.681 E.05171
G1 X141.49 Y104.349 E.49631
G1 X141.49 Y104.749 E.01229
G1 F6070.344
G1 X141.49 Y105.149 E.01229
G1 F2520
G1 X141.454 Y105.114 E.00153
G1 F7473.475
G1 X141.1 Y104.729 E.01608
G1 F7474.542
G1 X140.777 Y104.317 E.01608
G1 F8400
G1 X140.636 Y104.113 E.00762
G1 F9300
G1 X140.434 Y103.768 E.01229
G1 X140.234 Y103.424 E.01222
G3 X139.51 Y100.397 I5.992 J-3.034 E.09651
G1 X139.51 Y88.801 E.35631
G3 X139.845 Y86.11 I7.568 J-.425 E.08377
G3 X146.58 Y81.52 I6.359 J2.094 E.26926
G3 X152.799 Y87.105 I-.395 J6.695 E.2773
G1 X152.866 Y87.632 E.01632
G1 F8400
G1 X152.899 Y88.14 E.01565
G1 F8750.381
G1 X152.901 Y88.167 E.00084
G1 F9547.055
G1 X153.36 Y88.035 E.01467
G3 X153.606 Y88.009 I.346 J2.068 E.00761
G1 X160.65 Y88.01 E.21646
G3 X161.889 Y89.251 I-.067 J1.306 E.05903
G1 X161.89 Y97.295 E.24718
G3 X160.594 Y98.589 I-1.293 J.001 E.06254
G1 X153.604 Y98.589 E.21478
G3 X152.946 Y98.461 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X152.89 Y98.455 E-.02148
G1 X152.89 Y99.797 E-.5098
G1 X152.886 Y100.399 E-.22871
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.075 Y102.012 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.527657
G1 F7426.716
M204 S6000
G1 X151.755 Y102.215 E.01499
; LINE_WIDTH: 0.524098
G1 F7481.642
G1 X151.737 Y102.321 E.00419
; LINE_WIDTH: 0.488753
G1 F8074.779
G1 X151.72 Y102.426 E.00388
; LINE_WIDTH: 0.449425
G1 F8855.982
G1 X151.637 Y102.867 E.01487
; LINE_WIDTH: 0.406142
G1 F9911.303
G1 X151.554 Y103.308 E.01329
; WIPE_START
G1 X151.637 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.204 Y98.977 Z.8 F42000
G1 X160.485 Y97.626 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42761
G1 F9358.184
M204 S6000
G2 X160.745 Y97.35 I-.742 J-.96 E.01195
G2 X160.758 Y97.263 I-.187 J-.071 E.00278
G1 X160.758 Y96.809 E.01421
G1 X160.11 Y97.457 E.02869
G1 X159.566 Y97.457 E.01705
G1 X160.757 Y96.265 E.05281
G1 X160.757 Y95.721 E.01705
G1 X159.022 Y97.457 E.07692
G1 X158.478 Y97.457 E.01705
G1 X160.757 Y95.178 E.10104
G1 X160.757 Y94.634 E.01705
G1 X157.934 Y97.457 E.12515
G1 X157.39 Y97.457 E.01705
G1 X160.757 Y94.09 E.14927
G1 X160.757 Y93.546 E.01705
G1 X156.846 Y97.457 E.17338
G1 X156.302 Y97.457 E.01705
G1 X160.757 Y93.002 E.19749
G1 X160.757 Y92.458 E.01705
G1 X155.758 Y97.457 E.22161
G1 X155.214 Y97.457 E.01705
G1 X160.757 Y91.914 E.24572
G1 X160.757 Y91.37 E.01705
G1 X154.67 Y97.457 E.26984
G1 X154.126 Y97.457 E.01705
G1 X160.757 Y90.826 E.29395
G1 X160.757 Y90.282 E.01705
G1 X153.587 Y97.452 E.31785
G1 X153.156 Y97.339 E.01397
G1 X160.757 Y89.738 E.33696
G1 X160.756 Y89.326 E.01292
G2 X160.728 Y89.222 I-.147 J-.015 E.00344
G1 X152.729 Y97.222 E.35462
G1 X152.302 Y97.104 E.01388
G1 X160.264 Y89.142 E.35297
G1 X159.72 Y89.142 E.01705
G1 X152.042 Y96.82 E.34036
G1 X152.042 Y96.276 E.01705
G1 X159.176 Y89.142 E.31625
G1 X158.632 Y89.142 E.01705
G1 X152.042 Y95.732 E.29213
G1 X152.042 Y95.188 E.01705
G1 X158.088 Y89.142 E.26802
G1 X157.544 Y89.142 E.01705
G1 X152.042 Y94.644 E.24391
G1 X152.042 Y94.1 E.01705
G1 X157 Y89.142 E.21979
G1 X156.456 Y89.142 E.01705
G1 X152.042 Y93.556 E.19568
G1 X152.042 Y93.012 E.01705
G1 X155.912 Y89.142 E.17156
G1 X155.368 Y89.142 E.01705
G1 X152.042 Y92.468 E.14745
G1 X152.042 Y91.924 E.01705
G1 X154.824 Y89.142 E.12334
G1 X154.281 Y89.141 E.01705
G1 X152.042 Y91.38 E.09922
G1 X152.042 Y90.836 E.01705
G1 X153.737 Y89.141 E.07511
G2 X153.543 Y89.153 I-.045 J.87 E.0061
G1 X153.016 Y89.318 E.0173
G1 X151.873 Y90.461 E.05069
M204 S10000
G1 X151.948 Y89.516 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104286
G1 F15000
M204 S6000
G1 X151.939 Y89.227 E.00145
; WIPE_START
G1 X151.948 Y89.516 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.749 Y95.104 Z.8 F42000
G1 X140.324 Y102.011 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.527636
G1 F7427.043
M204 S6000
M73 P37 R15
G1 X140.645 Y102.214 E.01502
G1 X140.663 Y102.32 E.00424
; LINE_WIDTH: 0.488845
G1 F8073.121
G1 X140.68 Y102.426 E.0039
; LINE_WIDTH: 0.449431
G1 F8855.85
G1 X140.763 Y102.867 E.01487
; LINE_WIDTH: 0.406093
G1 F9912.635
G1 X140.846 Y103.308 E.01329
; OBJECT_ID: 4
; WIPE_START
G1 X140.763 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X133.367 Y100.982 Z.8 F42000
G1 X119.291 Y97.393 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.291 Y100.589 E.10602
G3 X119.127 Y101.957 I-6.413 J-.076 E.04579
G1 X118.909 Y101.933 E.00726
G1 X118.909 Y87.99 E.46252
G2 X108.291 Y87.99 I-5.309 J.011 E.55258
G1 X108.291 Y101.933 E.46252
G1 X108.073 Y101.957 E.00726
G3 X107.909 Y100.589 I6.25 J-1.444 E.04578
G1 X107.909 Y88.01 E.41728
G3 X113.876 Y82.316 I5.693 J-.007 E.30599
G3 X119.282 Y87.678 I-.28 J5.687 E.27663
G1 X119.337 Y89.194 E.05032
G1 X120.727 Y88.815 E.04778
G3 X120.819 Y88.809 I.087 J.616 E.00305
G1 X127.809 Y88.81 E.23189
G3 X128.29 Y89.281 I-.012 J.493 E.02455
G1 X128.291 Y97.28 E.26535
G3 X127.77 Y97.79 I-.495 J.016 E.02719
G1 X120.819 Y97.79 E.23058
G3 X120.694 Y97.778 I-.003 J-.605 E.00418
G1 X119.349 Y97.409 E.04627
M204 S10000
G1 X119.698 Y97.927 F42000
G1 F8843.478
M204 S6000
G1 X119.698 Y100.593 E.08846
G3 X118.677 Y103.976 I-6.122 J-.003 E.11889
G1 X118.502 Y103.924 E.00605
G1 X118.502 Y87.994 E.52843
G2 X108.698 Y87.994 I-4.902 J.007 E.51042
G1 X108.698 Y103.924 E.52843
G1 X108.523 Y103.976 E.00605
G3 X107.502 Y100.593 I5.095 J-3.383 E.11889
G1 X107.502 Y88.006 E.41756
G3 X113.897 Y81.909 I6.1 J-.003 E.32774
G3 X119.688 Y87.655 I-.3 J6.094 E.2964
G1 X119.725 Y88.665 E.03354
G1 X120.602 Y88.424 E.03018
G3 X120.811 Y88.402 I.215 J1.014 E.00698
G1 X127.829 Y88.403 E.23281
G3 X128.697 Y89.265 I-.037 J.904 E.04453
G1 X128.698 Y97.288 E.26614
G3 X127.782 Y98.198 I-.901 J.009 E.04773
G1 X120.811 Y98.198 E.23124
G3 X120.602 Y98.175 I.006 J-1.038 E.00699
G1 X119.756 Y97.943 E.02912
M204 S250
G1 X120.09 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X120.09 Y98.456 E.00046
G1 F9300
G1 X120.09 Y99.997 E.04736
G3 X119.68 Y102.871 I-7.571 J.384 E.08974
G3 X119.362 Y103.575 I-6.801 J-2.644 E.02375
G1 X119.176 Y103.898 E.01146
G1 X118.971 Y104.242 E.01229
G1 F8400
G1 X118.823 Y104.452 E.00791
G1 F9300
G1 X118.496 Y104.851 E.01584
G1 F7378.457
G3 X118.147 Y105.23 I-6.535 J-5.675 E.01583
G1 F2520
G1 X118.11 Y105.265 E.00157
G1 F6070.344
G1 X118.11 Y104.865 E.01229
G1 F9300
G1 X118.11 Y104.465 E.01229
G1 X118.11 Y88.597 E.48757
G2 X117.824 Y86.42 I-5.677 J-.363 E.06792
G1 X117.758 Y86.253 E.00551
G1 F8400
G1 X117.682 Y86.081 E.00578
G1 F9300
G1 X117.428 Y85.617 E.01625
G2 X117.003 Y85.04 I-3.872 J2.413 E.02204
G1 X116.757 Y84.779 E.01102
G1 F8400
G1 X116.62 Y84.65 E.00578
G1 F9300
G1 X116.351 Y84.427 E.01075
G2 X116.058 Y84.219 I-2.801 J3.645 E.01103
G1 X115.591 Y83.953 E.01652
G1 F8400
G1 X115.421 Y83.874 E.00578
G1 F9300
G1 X114.925 Y83.691 E.01625
G2 X112.798 Y83.564 I-1.328 J4.364 E.06608
G1 X112.283 Y83.686 E.01625
G1 F8400
G1 X112.104 Y83.745 E.00578
G1 F9300
G1 X111.772 Y83.879 E.01102
G2 X110.995 Y84.322 I1.923 J4.28 E.02754
G1 X110.58 Y84.65 E.01625
G1 F8400
G1 X110.443 Y84.779 E.00578
G1 F9300
G1 X110.085 Y85.18 E.01652
G2 X109.776 Y85.609 I3.952 J3.17 E.01626
G1 F8400
G1 X109.679 Y85.77 E.00577
G1 F9300
G1 X109.445 Y86.254 E.01652
G2 X109.266 Y86.752 I4.669 J1.961 E.01626
G1 F8400
G1 X109.218 Y86.934 E.00578
G1 F9300
G2 X109.148 Y87.277 I4.273 J1.042 E.01076
G1 F8400
G1 X109.122 Y87.463 E.00577
G1 F9300
G1 X109.097 Y87.82 E.01102
G2 X109.09 Y88.597 I9.357 J.474 E.02389
G1 X109.09 Y104.465 E.48757
G1 X109.09 Y104.865 E.01229
G1 F6070.344
G1 X109.09 Y105.265 E.01229
G1 F2520
G1 X109.053 Y105.23 E.00157
G1 F6070.344
G1 X108.785 Y104.933 E.01229
G1 F8992.199
G1 X108.535 Y104.656 E.01146
G3 X108.229 Y104.242 I5.276 J-4.232 E.01583
G1 F8400
G1 X108.088 Y104.026 E.00792
G1 F9300
G1 X107.898 Y103.674 E.01229
G1 X107.723 Y103.345 E.01145
G3 X107.11 Y100.597 I6.008 J-2.783 E.08717
G1 X107.11 Y88.602 E.3686
G3 X107.517 Y85.738 I7.578 J-.384 E.08943
G3 X113.917 Y81.518 I6.097 J2.283 E.25186
G3 X119.989 Y86.869 I-.33 J6.496 E.26842
G1 X120.061 Y87.39 E.01617
G1 F8400
G3 X120.098 Y88.14 I-9.455 J.845 E.02309
G1 F8603.278
G1 X120.099 Y88.156 E.00049
G1 F9547.055
G1 X120.514 Y88.042 E.01323
G3 X120.804 Y88.01 I.407 J2.305 E.00897
G1 X127.849 Y88.011 E.21646
G3 X129.089 Y89.249 I-.06 J1.3 E.05908
G1 X129.09 Y97.295 E.24724
G3 X127.794 Y98.59 I-1.293 J.001 E.06255
G1 X120.804 Y98.59 E.21477
G3 X120.146 Y98.461 I.12 J-2.368 E.02066
; WIPE_START
M204 S6000
G1 X120.09 Y98.456 E-.02149
G1 X120.09 Y99.997 E-.58574
G1 X120.088 Y100.399 E-.15277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.276 Y102.189 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.515559
G1 F7616.811
M204 S6000
G1 X118.954 Y102.392 E.01467
; LINE_WIDTH: 0.522247
G1 F7510.536
G1 X118.937 Y102.49 E.00386
; LINE_WIDTH: 0.489016
G1 F8070.02
G1 X118.92 Y102.587 E.00359
; LINE_WIDTH: 0.450767
G1 F8826.845
G1 X118.837 Y103.022 E.01472
; LINE_WIDTH: 0.407496
G1 F9874.496
G1 X118.754 Y103.457 E.01316
; WIPE_START
G1 X118.837 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.241 Y98.869 Z.8 F42000
G1 X127.155 Y97.627 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42095
G1 F9523.053
M204 S6000
G1 X127.958 Y96.824 E.03497
G1 X127.957 Y96.29 E.01647
G1 X126.79 Y97.457 E.05087
G1 X126.255 Y97.457 E.01647
G1 X127.957 Y95.755 E.07415
G1 X127.957 Y95.22 E.01647
G1 X125.721 Y97.457 E.09744
G1 X125.186 Y97.457 E.01647
G1 X127.957 Y94.686 E.12073
G1 X127.957 Y94.151 E.01647
G1 X124.651 Y97.457 E.14402
G1 X124.117 Y97.457 E.01647
G1 X127.957 Y93.617 E.1673
G1 X127.957 Y93.082 E.01647
G1 X123.582 Y97.457 E.19059
G1 X123.048 Y97.457 E.01647
G1 X127.957 Y92.548 E.21388
G1 X127.957 Y92.013 E.01647
G1 X122.513 Y97.457 E.23716
G1 X121.978 Y97.457 E.01647
G1 X127.957 Y91.479 E.26045
G1 X127.957 Y90.944 E.01647
G1 X121.444 Y97.457 E.28374
G1 X120.909 Y97.457 E.01647
G1 X127.957 Y90.41 E.30702
G1 X127.957 Y89.875 E.01647
G1 X120.463 Y97.369 E.32647
G1 X120.043 Y97.254 E.0134
G1 X127.956 Y89.341 E.34474
G2 X127.77 Y89.143 I-.177 J-.02 E.00952
G1 X127.619 Y89.143 E.00464
G1 X119.624 Y97.139 E.34833
G1 X119.242 Y97.034 E.01218
G1 X119.242 Y96.985 E.0015
G1 X127.085 Y89.143 E.34165
G1 X126.55 Y89.143 E.01647
G1 X119.242 Y96.451 E.31836
G1 X119.242 Y95.916 E.01647
G1 X126.016 Y89.143 E.29508
G1 X125.481 Y89.143 E.01647
G1 X119.242 Y95.382 E.27179
G1 X119.242 Y94.847 E.01647
G1 X124.947 Y89.143 E.2485
G1 X124.412 Y89.143 E.01647
G1 X119.242 Y94.312 E.22522
G1 X119.242 Y93.778 E.01647
G1 X123.878 Y89.142 E.20193
G1 X123.343 Y89.142 E.01647
G1 X119.242 Y93.243 E.17864
G1 X119.242 Y92.708 E.01647
G1 X122.809 Y89.142 E.15536
G1 X122.274 Y89.142 E.01647
G1 X119.242 Y92.174 E.13207
G1 X119.242 Y91.639 E.01647
G1 X121.74 Y89.142 E.10879
G1 X121.205 Y89.142 E.01647
G1 X119.242 Y91.105 E.0855
G1 X119.242 Y90.57 E.01647
G1 X120.627 Y89.185 E.06033
G1 X119.89 Y89.388 E.02355
G1 X119.073 Y90.205 E.03561
; WIPE_START
G1 X119.89 Y89.388 E-.43928
G1 X120.627 Y89.185 E-.29052
G1 X120.571 Y89.241 E-.03021
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.238 Y94.702 Z.8 F42000
G1 X107.925 Y102.19 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.516765
G1 F7597.422
M204 S6000
G1 X108.246 Y102.392 E.01465
G1 X108.263 Y102.49 E.00381
; LINE_WIDTH: 0.489049
G1 F8069.42
G1 X108.28 Y102.587 E.00359
; LINE_WIDTH: 0.452009
G1 F8800.04
G1 X108.363 Y103.022 E.01477
; LINE_WIDTH: 0.411108
G1 F9777.635
G1 X108.446 Y103.457 E.01329
; OBJECT_ID: 2
; WIPE_START
G1 X108.363 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X108.268 Y95.39 Z.8 F42000
G1 X107.894 Y65.34 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X107.866 Y65.272 E.00244
G3 X107.291 Y62.41 I6.947 J-2.886 E.09747
G1 X107.291 Y39.39 E.76359
G3 X114.79 Y31.891 I7.523 J.023 E.39044
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.023 J7.523 E.39045
G1 X175.809 Y62.41 E.76359
G3 X168.31 Y69.909 I-7.523 J-.023 E.39045
G1 X114.79 Y69.909 E1.77533
G3 X108.252 Y66.067 I.023 J-7.523 E.26366
G1 X107.921 Y65.394 E.02488
M204 S10000
G1 X108.26 Y65.163 F42000
G1 F8843.478
M204 S6000
G1 X108.242 Y65.116 E.00164
G3 X107.698 Y62.406 I6.571 J-2.729 E.0923
G1 X107.698 Y39.394 E.76333
G3 X114.794 Y32.298 I7.115 J.019 E.36949
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.019 J7.115 E.3695
G1 X175.402 Y62.406 E.76333
G3 X168.306 Y69.502 I-7.115 J-.019 E.3695
G1 X114.794 Y69.502 E1.77508
G3 X108.607 Y65.868 I.019 J-7.115 E.24947
G1 X108.287 Y65.216 E.02408
M204 S250
G1 X108.622 Y64.99 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9300
M204 S5000
G1 X108.505 Y64.722 E.00896
G3 X108.09 Y61.802 I7.37 J-2.536 E.09119
G1 X108.09 Y39.398 E.68842
G3 X108.346 Y37.58 I6.981 J.056 E.05658
G1 X108.465 Y37.222 E.01158
G1 X108.596 Y36.844 E.01229
G1 F8400
G1 X108.706 Y36.591 E.00849
G1 F9300
G1 X108.895 Y36.238 E.01229
G1 X109.083 Y35.897 E.01198
G1 X109.304 Y35.575 E.01199
G1 X109.531 Y35.246 E.01229
G1 F8400
G1 X109.706 Y35.032 E.00848
G1 F9300
G1 X110.056 Y34.656 E.01579
G3 X110.443 Y34.299 I4.822 J4.831 E.01618
G1 X110.743 Y34.07 E.01159
G1 X111.061 Y33.828 E.01229
G1 F8400
G1 X111.294 Y33.679 E.00849
G1 F9300
G3 X111.754 Y33.421 I3.506 J5.721 E.0162
G1 F8400
G1 X112.003 Y33.301 E.00849
G1 F9300
G1 X112.375 Y33.156 E.01229
G1 X112.727 Y33.02 E.01158
G1 X113.234 Y32.875 E.01619
G1 F8400
G1 X113.504 Y32.817 E.00849
G1 F9300
G3 X113.999 Y32.738 I1.246 J6.264 E.0154
G1 F8400
G1 X114.273 Y32.711 E.00848
G1 F9300
G3 X114.798 Y32.69 I.526 J6.678 E.01614
G1 X168.302 Y32.69 E1.64403
G3 X170.12 Y32.946 I-.056 J6.98 E.05658
G1 X170.478 Y33.065 E.01158
G1 X170.856 Y33.196 E.01229
G1 F8400
G1 X171.109 Y33.306 E.00849
G1 F9300
G1 X171.577 Y33.549 E.01619
G3 X172.452 Y34.133 I-3.526 J6.224 E.03236
G1 X172.855 Y34.473 E.01619
G1 F8400
G1 X173.054 Y34.665 E.00849
G1 F9300
G1 X173.319 Y34.964 E.01229
G1 X173.566 Y35.248 E.01158
G3 X174.276 Y36.355 I-5.496 J4.306 E.04046
G1 X174.499 Y36.832 E.01619
G1 F8400
G1 X174.6 Y37.09 E.00849
G1 F9300
G1 X174.715 Y37.473 E.01229
G1 X174.814 Y37.836 E.01158
G3 X175.01 Y39.998 I-7.589 J1.777 E.06691
G1 X175.01 Y61.802 E.66998
G3 X174.814 Y63.964 I-7.784 J.384 E.06692
G1 X174.715 Y64.327 E.01157
G1 X174.6 Y64.71 E.01229
G1 F8400
G1 X174.499 Y64.968 E.00849
G1 F9300
G1 X174.278 Y65.446 E.0162
G1 X174.088 Y65.771 E.01158
G1 X173.886 Y66.117 E.01229
G1 F8400
G1 X173.729 Y66.344 E.00849
G1 F9300
G1 X173.475 Y66.653 E.01229
G1 X173.226 Y66.954 E.01199
G3 X172.854 Y67.327 I-5.019 J-4.644 E.01619
G1 X172.464 Y67.661 E.01579
G1 F8400
G1 X172.244 Y67.828 E.00849
G1 F9300
G1 X171.805 Y68.121 E.0162
G3 X170.867 Y68.598 I-3.538 J-5.79 E.03238
G1 X170.512 Y68.723 E.01159
G1 X170.134 Y68.854 E.01229
G1 F8400
G1 X169.867 Y68.925 E.00849
G1 F9300
G1 X169.349 Y69.024 E.01619
G3 X167.702 Y69.11 I-1.228 J-7.755 E.05077
G1 X115.398 Y69.11 E1.60716
G3 X114.537 Y69.105 I-.381 J-8.871 E.02647
G1 X114.148 Y69.067 E.012
G1 X113.75 Y69.027 E.01229
G1 F8400
G1 X113.478 Y68.978 E.00849
G1 F9300
G1 X112.98 Y68.853 E.01578
G3 X112.49 Y68.7 I2.43 J-8.616 E.01579
G1 F8400
G1 X112.232 Y68.599 E.00849
G1 F9300
G1 X111.754 Y68.378 E.01619
G3 X110.857 Y67.828 I3.092 J-6.05 E.03238
G1 X110.554 Y67.581 E.01199
G1 X110.245 Y67.327 E.01229
G1 F8400
G1 X110.046 Y67.135 E.00849
G1 F9300
G1 X109.781 Y66.836 E.01229
G1 X109.531 Y66.553 E.01159
G3 X108.822 Y65.446 I5.312 J-4.182 E.04048
G1 X108.646 Y65.045 E.01347
; WIPE_START
M204 S6000
G1 X108.505 Y64.722 E-.1336
G1 X108.342 Y64.221 E-.20024
G1 X108.173 Y63.45 E-.30019
G1 X108.14 Y63.12 E-.12598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.206 Y58.488 Z.8 F42000
G1 X149.541 Y31.509 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I-.005 J7.906 E.41161
G1 X176.191 Y62.39 E.76229
G3 X168.29 Y70.291 I-7.906 J-.005 E.41161
G1 X114.81 Y70.291 E1.77403
G3 X106.909 Y62.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E.76229
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.53 E.16517
G3 X134.08 Y26.009 I.495 J-.025 E.02753
G1 X149.063 Y26.01 E.49703
G3 X149.541 Y26.52 I-.015 J.493 E.02574
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.01 J8.314 E.43254
G1 X176.598 Y62.394 E.76256
G3 X168.294 Y70.698 I-8.314 J-.01 E.43254
G1 X114.806 Y70.698 E1.7743
G3 X106.502 Y62.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E.76256
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.518 E.15207
G3 X134.068 Y25.602 I.911 J-.005 E.04779
G1 X149.079 Y25.603 E.49794
G3 X149.948 Y26.512 I-.036 J.905 E.04611
M73 P38 R15
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
G1 X176.99 Y61.798 E.68816
G3 X175.882 Y66.646 I-9.191 J.45 E.15473
G3 X168.298 Y71.09 I-7.588 J-4.257 E.28315
G1 X115.402 Y71.09 E1.62534
G3 X110.554 Y69.982 I-.45 J-9.19 E.15474
G3 X106.11 Y62.398 I4.257 J-7.588 E.28314
G1 X106.11 Y40.002 E.68816
G3 X107.218 Y35.154 I9.191 J-.45 E.15473
G3 X114.802 Y30.71 I7.588 J4.257 E.28315
G1 X132.721 Y30.71 E.55061
G1 F9547.055
G1 X132.76 Y30.71 E.00119
G1 X132.76 Y26.506 E.12917
G3 X134.056 Y25.21 I1.306 J.01 E.06244
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
G1 X149.149 Y31.499 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X149.147 Y26.566 E.15156
G1 X149.104 Y26.44 E.00409
G1 X148.975 Y26.402 E.00412
G1 X134.039 Y26.411 E.45892
G1 X133.956 Y26.511 E.00398
G1 X133.951 Y31.499 E.15327
G1 X149.089 Y31.499 E.46512
M204 S10000
G1 X136.498 Y29.19 F42000
; LINE_WIDTH: 0.515035
G1 F7625.267
M204 S6000
G1 X146.837 Y29.188 E.39775
G1 X146.837 Y28.714 E.01823
G1 X136.263 Y28.719 E.40678
G1 X136.263 Y29.19 E.0181
G1 X136.438 Y29.19 E.00675
M204 S10000
G1 X135.838 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.263 Y29.613 E.35102
G1 X147.262 Y28.289 E.04071
G1 X135.84 Y28.296 E.35096
G1 X135.839 Y29.553 E.03865
M204 S10000
G1 X135.461 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X147.64 Y29.991 E.37421
G1 X147.639 Y27.911 E.06388
G1 X135.463 Y27.919 E.37412
G1 X135.461 Y29.931 E.06181
M204 S10000
G1 X135.084 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X148.017 Y30.368 E.3974
G1 X148.016 Y27.534 E.08706
G1 X135.086 Y27.542 E.39727
G1 X135.084 Y30.308 E.08498
M204 S10000
G1 X134.706 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X148.394 Y30.745 E.42059
G1 X148.393 Y27.157 E.11024
G1 X134.71 Y27.165 E.42043
G1 X134.706 Y30.685 E.10814
M204 S10000
G1 X134.329 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X148.772 Y31.122 E.44378
G1 X148.77 Y26.779 E.13342
G1 X134.333 Y26.788 E.44358
G1 X134.329 Y31.062 E.13131
; OBJECT_ID: 8
; WIPE_START
G1 X134.331 Y29.062 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X129.701 Y35.13 Z.8 F42000
G1 X38.791 Y154.294 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X38.786 Y157.052 I-69.853 J1.248 E.09149
G3 X38.627 Y158.232 I-6.554 J-.28 E.03958
G1 X38.409 Y158.209 E.00727
G1 X38.409 Y145.59 E.4186
G2 X26.391 Y145.59 I-6.009 J.011 E.62551
G1 X26.391 Y158.209 E.4186
G1 X26.173 Y158.232 E.00727
G3 X26.009 Y156.789 I7.018 J-1.528 E.04826
G1 X26.009 Y145.61 E.37084
G3 X32.551 Y139.211 I6.402 J.002 E.33817
G3 X38.721 Y144.657 I-.154 J6.392 E.29656
G1 X38.912 Y146.142 E.04967
G1 X40.204 Y145.719 E.04511
G3 X40.33 Y145.708 I.115 J.63 E.00419
G1 X47.31 Y145.71 E.23154
G3 X47.79 Y146.182 I-.023 J.503 E.02446
G1 X47.791 Y154.18 E.2653
G3 X47.27 Y154.69 I-.495 J.016 E.02719
G1 X40.319 Y154.69 E.23059
G3 X40.194 Y154.678 I-.003 J-.604 E.00417
G1 X38.849 Y154.31 E.04627
M204 S10000
G1 X39.198 Y154.827 F42000
G1 F8843.478
M204 S6000
G3 X39.193 Y157.067 I-56.77 J.983 E.07432
G3 X38.182 Y160.374 I-6.834 J-.281 E.11596
G1 X38.002 Y160.325 E.00619
G1 X38.002 Y145.593 E.48868
G2 X26.798 Y145.593 I-5.602 J.007 E.58334
G1 X26.798 Y160.325 E.48868
G1 X26.618 Y160.374 E.00619
G3 X25.602 Y156.793 I5.922 J-3.615 E.12501
G1 X25.602 Y145.605 E.37112
G3 X32.561 Y138.804 I6.81 J.007 E.35956
G3 X39.123 Y144.597 I-.164 J6.8 E.31545
G1 X39.253 Y145.601 E.03358
G1 X40.057 Y145.335 E.02808
G3 X40.318 Y145.301 I.258 J.961 E.00877
G1 X47.33 Y145.302 E.23259
G3 X48.197 Y146.165 I-.048 J.916 E.04441
G1 X48.198 Y154.188 E.26612
G3 X47.282 Y155.097 I-.901 J.009 E.04773
G1 X40.311 Y155.097 E.23124
G3 X40.102 Y155.075 I.006 J-1.038 E.00698
G1 X39.256 Y154.843 E.02911
M204 S250
G1 X39.59 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.59 Y155.356 E.00046
G1 F9300
G1 X39.59 Y156.197 E.02585
G3 X39.037 Y159.564 I-7.889 J.433 E.10568
G3 X38.365 Y160.811 I-6.705 J-2.809 E.04359
G1 X38.031 Y161.27 E.01745
G1 F8189.419
G1 X37.651 Y161.71 E.01787
G1 F2520
G1 X37.61 Y161.753 E.0018
G1 F6070.344
G1 X37.61 Y161.353 E.01229
G1 F9300
G1 X37.61 Y160.953 E.01229
G1 X37.61 Y146.197 E.4534
G2 X37.452 Y144.37 I-6.339 J-.37 E.05654
G1 X37.397 Y144.156 E.0068
G1 X37.28 Y143.774 E.01229
G1 F8400
G1 X37.199 Y143.572 E.00666
G1 F9300
G1 X37.026 Y143.207 E.01242
G2 X35.411 Y141.35 I-4.687 J2.445 E.07635
G1 X35.073 Y141.128 E.01242
G1 F8400
G1 X34.885 Y141.02 E.00667
G1 F9300
G1 X34.511 Y140.841 E.01273
G2 X34.137 Y140.688 I-2.813 J6.339 E.01241
G1 F8400
G1 X33.931 Y140.619 E.00667
G1 F9300
G1 X33.53 Y140.514 E.01273
G2 X33.123 Y140.441 I-1.147 J5.192 E.01273
G1 X32.902 Y140.422 E.0068
G1 X32.503 Y140.39 E.01229
G1 F8400
G1 X32.286 Y140.391 E.00667
G1 F9300
G1 X31.888 Y140.423 E.01229
G1 X31.678 Y140.443 E.00647
G2 X30.673 Y140.686 I.768 J5.365 E.03181
G1 X30.287 Y140.837 E.01273
G1 F8400
G1 X30.091 Y140.929 E.00667
G1 F9300
G1 X29.743 Y141.127 E.01229
G1 X29.561 Y141.235 E.00648
G2 X28.906 Y141.739 I2.968 J4.532 E.02545
G1 X28.756 Y141.887 E.00648
G1 X28.475 Y142.173 E.01229
G1 F8400
G1 X28.336 Y142.339 E.00667
G1 F9300
G1 X28.093 Y142.675 E.01274
G2 X27.876 Y143.016 I5.75 J3.904 E.01241
G1 F8400
G1 X27.772 Y143.206 E.00667
G1 F9300
G1 X27.61 Y143.572 E.01229
G1 X27.523 Y143.775 E.00679
G2 X27.19 Y145.597 I5.022 J1.859 E.0572
G1 X27.19 Y160.953 E.47183
G1 X27.19 Y161.353 E.01229
G1 F6255.82
G1 X27.19 Y161.753 E.01229
G1 F2640
G1 X27.139 Y161.7 E.00225
G1 F6255.82
G1 X26.884 Y161.392 E.01229
G1 F9300
G1 X26.597 Y161.044 E.01385
G3 X25.21 Y156.797 I5.822 J-4.252 E.13957
G1 X25.21 Y146.201 E.32558
G3 X25.775 Y142.805 I7.878 J-.434 E.10666
G3 X32.571 Y138.412 I6.642 J2.821 E.26396
G3 X35.364 Y139.049 I-.182 J7.234 E.08861
G1 X35.636 Y139.179 E.00926
G1 F8400
G1 X35.877 Y139.306 E.00838
G1 F9300
G1 X36.215 Y139.52 E.01229
G1 X36.604 Y139.767 E.01414
G3 X39.333 Y143.697 I-4.215 J5.84 E.14988
G1 X39.429 Y144.147 E.01415
G1 X39.511 Y144.539 E.01229
G1 F8400
G1 X39.578 Y145.055 E.01598
G1 F8721.076
G1 X39.581 Y145.08 E.00077
G1 F9547.055
G1 X40.049 Y144.938 E.01501
G3 X40.306 Y144.909 I.359 J2.031 E.00798
G1 X47.349 Y144.91 E.21639
G3 X48.589 Y146.149 I-.074 J1.314 E.05894
G1 X48.59 Y154.195 E.24723
G3 X47.294 Y155.489 I-1.293 J.001 E.06254
G1 X40.304 Y155.489 E.21478
G3 X39.646 Y155.361 I.121 J-2.375 E.02066
; WIPE_START
M204 S6000
G1 X39.59 Y155.356 E-.0215
G1 X39.59 Y156.197 E-.31973
G1 X39.584 Y157.083 E-.3366
G1 X39.563 Y157.298 E-.08216
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.495 Y158.423 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532242
G1 F7357.119
M204 S6000
G1 X38.443 Y158.774 E.01414
; LINE_WIDTH: 0.495839
G1 F7948.445
G1 X38.421 Y158.899 E.00471
; LINE_WIDTH: 0.453187
G1 F8774.789
G1 X38.4 Y159.025 E.00427
; LINE_WIDTH: 0.407818
G1 F9865.775
G1 X38.322 Y159.436 E.01244
; LINE_WIDTH: 0.359713
G1 F11363.903
G1 X38.244 Y159.847 E.0108
; WIPE_START
G1 X38.322 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X44.999 Y155.738 Z.8 F42000
G1 X47.185 Y154.527 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4272
G1 F9368.169
M204 S6000
G2 X47.445 Y154.25 I-.741 J-.959 E.01194
G2 X47.458 Y154.163 I-.188 J-.071 E.00279
G1 X47.458 Y153.71 E.01417
G1 X46.811 Y154.357 E.02863
G1 X46.268 Y154.357 E.01702
G1 X47.457 Y153.167 E.05269
G1 X47.457 Y152.624 E.01702
G1 X45.724 Y154.357 E.07675
G1 X45.181 Y154.357 E.01702
G1 X47.457 Y152.08 E.10082
G1 X47.457 Y151.537 E.01702
G1 X44.637 Y154.357 E.12488
G1 X44.094 Y154.357 E.01702
G1 X47.457 Y150.994 E.14894
G1 X47.457 Y150.45 E.01702
G1 X43.55 Y154.357 E.173
G1 X43.007 Y154.357 E.01702
G1 X47.457 Y149.907 E.19707
G1 X47.457 Y149.363 E.01702
G1 X42.464 Y154.357 E.22113
G1 X41.92 Y154.357 E.01702
G1 X47.457 Y148.82 E.24519
G1 X47.457 Y148.277 E.01702
G1 X41.377 Y154.357 E.26926
G1 X40.833 Y154.357 E.01702
G1 X47.457 Y147.733 E.29332
G1 X47.457 Y147.19 E.01702
G1 X40.294 Y154.353 E.3172
G1 X39.862 Y154.241 E.01397
G1 X47.457 Y146.647 E.33633
G1 X47.456 Y146.223 E.01327
G1 X47.432 Y146.127 E.00308
G1 X39.435 Y154.125 E.35415
G1 X39.008 Y154.008 E.01385
G1 X46.973 Y146.043 E.35273
G1 X46.43 Y146.043 E.01701
G1 X38.741 Y153.732 E.34052
G1 X38.741 Y153.189 E.01701
G1 X45.887 Y146.043 E.31646
G1 X45.343 Y146.042 E.01701
G1 X38.74 Y152.645 E.29241
G1 X38.74 Y152.102 E.01701
G1 X44.8 Y146.042 E.26836
G1 X44.257 Y146.042 E.01702
G1 X38.74 Y151.559 E.2443
G1 X38.74 Y151.016 E.01701
G1 X43.713 Y146.042 E.22025
G1 X43.17 Y146.042 E.01701
G1 X38.74 Y150.472 E.19619
G1 X38.739 Y149.929 E.01701
G1 X42.627 Y146.042 E.17214
G1 X42.083 Y146.042 E.01701
G1 X38.739 Y149.386 E.14809
G1 X38.739 Y148.843 E.01701
G1 X41.54 Y146.042 E.12403
G1 X40.996 Y146.042 E.01702
G1 X38.739 Y148.299 E.09998
G1 X38.739 Y147.756 E.01701
G1 X40.453 Y146.042 E.07592
G2 X40.24 Y146.054 I-.052 J.913 E.00669
G1 X39.728 Y146.224 E.01691
G1 X38.569 Y147.382 E.05132
M204 S10000
G1 X38.678 Y146.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.148623
G1 F15000
M204 S6000
G1 X38.658 Y146.119 E.00271
; LINE_WIDTH: 0.114147
G1 X38.638 Y145.805 E.00183
; WIPE_START
G1 X38.658 Y146.119 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.25 Y151.505 Z.8 F42000
G1 X26.305 Y158.423 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.532271
G1 F7356.689
M204 S6000
G1 X26.357 Y158.773 E.01413
; LINE_WIDTH: 0.495924
G1 F7946.954
G1 X26.379 Y158.899 E.00472
; LINE_WIDTH: 0.453252
G1 F8773.4
G1 X26.4 Y159.025 E.00427
; LINE_WIDTH: 0.40784
G1 F9865.179
G1 X26.478 Y159.436 E.01244
; LINE_WIDTH: 0.35972
G1 F11363.643
G1 X26.556 Y159.847 E.0108
; OBJECT_ID: 9
; WIPE_START
G1 X26.478 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X34.064 Y158.601 Z.8 F42000
G1 X73.191 Y154.293 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X73.186 Y156.758 I-63.841 J1.099 E.08179
G3 X73.027 Y157.964 I-6.86 J-.287 E.04039
G1 X72.809 Y157.941 E.00728
G1 X72.809 Y145.89 E.39974
G2 X60.191 Y145.89 I-6.309 J.011 E.65678
G1 X60.191 Y157.939 E.39968
G1 X59.972 Y157.962 E.00729
G3 X59.809 Y156.49 I7.419 J-1.568 E.04922
G1 X59.809 Y145.91 E.35096
G3 X66.805 Y139.216 I6.694 J-.007 E.35904
G3 X73.082 Y144.697 I-.32 J6.701 E.29821
G1 X73.322 Y146.177 E.04975
G1 X74.544 Y145.735 E.04311
G3 X74.729 Y145.709 I.168 J.516 E.00622
G1 X81.719 Y145.71 E.23187
G3 X82.19 Y146.191 I-.026 J.496 E.02451
G1 X82.191 Y154.17 E.26469
G3 X81.67 Y154.691 I-.498 J.023 E.02748
G1 X74.719 Y154.691 E.23059
G3 X74.594 Y154.678 I-.003 J-.604 E.00416
G1 X73.249 Y154.309 E.04629
M204 S10000
G1 X73.598 Y154.827 F42000
G1 F8843.478
M204 S6000
G3 X73.593 Y156.774 I-50.422 J.834 E.0646
G3 X72.583 Y160.157 I-7.133 J-.286 E.11833
G1 X72.402 Y160.108 E.00622
G1 X72.402 Y145.894 E.47152
G2 X60.598 Y145.894 I-5.902 J.007 E.61462
G1 X60.598 Y160.108 E.47151
G1 X60.417 Y160.157 E.00622
G3 X59.402 Y156.494 I6.228 J-3.697 E.12758
G1 X59.402 Y145.906 E.35122
G3 X66.824 Y138.81 I7.101 J-.003 E.38075
G3 X73.482 Y144.623 I-.341 J7.109 E.31634
G1 X73.645 Y145.627 E.03375
G1 X74.425 Y145.346 E.02749
G3 X74.717 Y145.302 I.287 J.917 E.00985
G1 X81.735 Y145.303 E.23279
G3 X82.597 Y146.171 I-.047 J.909 E.04448
G1 X82.598 Y154.182 E.26575
G3 X81.682 Y155.098 I-.901 J.015 E.04793
G1 X74.711 Y155.098 E.23124
G3 X74.502 Y155.075 I.006 J-1.039 E.00698
G1 X73.656 Y154.843 E.02912
M204 S250
G1 X73.99 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X73.99 Y155.356 E.00047
G1 F9300
G3 X73.901 Y157.653 I-14.897 J.571 E.0707
G3 X72.602 Y160.841 I-7.431 J-1.168 E.10673
G1 X72.31 Y161.207 E.01438
G1 F6070.344
G1 X72.059 Y161.519 E.01229
G1 F2520
G1 X72.01 Y161.572 E.00222
G1 F6070.344
G1 X72.01 Y161.172 E.01229
G1 F9300
G1 X72.01 Y160.772 E.01229
G1 X72.01 Y146.498 E.4386
G2 X71.843 Y144.6 I-6.624 J-.373 E.05874
G1 X71.778 Y144.352 E.00788
G1 X71.661 Y143.969 E.01229
G1 F8400
G1 X71.576 Y143.756 E.00706
G1 F9300
G1 X71.393 Y143.37 E.01313
G2 X66.828 Y140.401 I-4.907 J2.551 E.17496
G1 X66.39 Y140.391 E.01347
G1 F8400
G1 X66.161 Y140.4 E.00705
G1 F9300
G1 X65.764 Y140.448 E.01229
G1 X65.519 Y140.478 E.00758
G1 F8400
G1 X65.294 Y140.524 E.00705
G1 F9300
G2 X64.891 Y140.63 I1.14 J5.127 E.01281
G1 F8400
G1 X64.673 Y140.701 E.00706
G1 F9300
G2 X64.265 Y140.863 I1.832 J5.21 E.01347
G1 F8400
G1 X64.058 Y140.961 E.00706
G1 F9300
G1 X63.683 Y141.166 E.01313
G2 X60.99 Y145.898 I2.841 J4.749 E.17489
G1 X60.99 Y160.772 E.45704
G1 X60.99 Y161.172 E.01229
G1 F6070.344
G1 X60.99 Y161.572 E.01229
G1 F2520
G1 X60.94 Y161.519 E.00223
G1 F8155.379
G1 X60.569 Y161.074 E.01779
G1 F9300
G1 X60.344 Y160.744 E.01229
G1 X60.081 Y160.357 E.01438
G3 X59.01 Y156.497 I6.439 J-3.865 E.12458
G1 X59.01 Y146.502 E.30713
G3 X59.835 Y142.483 I8.066 J-.439 E.12746
G3 X66.843 Y138.418 I6.669 J3.424 E.26299
G3 X73.737 Y143.976 I-.36 J7.502 E.29104
G1 X73.868 Y144.553 E.01816
G1 F8400
G1 X73.952 Y145.072 E.01618
G1 F8733.007
G1 X73.956 Y145.098 E.0008
G1 F9547.055
G1 X74.458 Y144.939 E.01617
G3 X74.706 Y144.91 I.368 J2.035 E.00768
G1 X81.75 Y144.911 E.21645
G3 X82.989 Y146.151 I-.067 J1.306 E.05902
G1 X82.99 Y154.193 E.24712
G3 X81.694 Y155.49 I-1.293 J.004 E.06261
G1 X74.704 Y155.49 E.21478
G3 X74.046 Y155.361 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X73.99 Y155.356 E-.02148
G1 X73.984 Y156.789 E-.54456
G1 X73.935 Y157.297 E-.19396
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.896 Y158.155 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533295
G1 F7341.322
M204 S6000
G1 X72.842 Y158.525 E.01497
; LINE_WIDTH: 0.494442
G1 F7973.035
G1 X72.821 Y158.655 E.00483
; LINE_WIDTH: 0.451548
G1 F8809.984
G1 X72.799 Y158.784 E.00437
; LINE_WIDTH: 0.406015
G1 F9914.784
G1 X72.722 Y159.202 E.01258
; LINE_WIDTH: 0.357845
G1 F11431.303
G1 X72.644 Y159.62 E.01091
M204 S10000
G1 X72.457 Y160.326 F42000
; LINE_WIDTH: 0.108657
G1 F15000
M204 S6000
G1 X72.224 Y160.99 E.00377
; WIPE_START
M73 P39 R15
G1 X72.457 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.782 Y156.054 Z.8 F42000
G1 X81.044 Y154.527 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42612
G1 F9394.572
M204 S6000
G1 X81.858 Y153.713 E.03594
G1 X81.857 Y153.171 E.01692
G1 X80.672 Y154.357 E.05237
G1 X80.13 Y154.357 E.01692
G1 X81.857 Y152.63 E.0763
G1 X81.857 Y152.088 E.01692
G1 X79.588 Y154.357 E.10023
G1 X79.046 Y154.357 E.01692
G1 X81.857 Y151.546 E.12416
G1 X81.857 Y151.004 E.01692
G1 X78.504 Y154.357 E.14808
G1 X77.962 Y154.357 E.01692
G1 X81.857 Y150.462 E.17201
G1 X81.857 Y149.92 E.01692
G1 X77.42 Y154.357 E.19594
G1 X76.878 Y154.357 E.01692
G1 X81.857 Y149.378 E.21987
G1 X81.857 Y148.837 E.01692
G1 X76.336 Y154.357 E.2438
G1 X75.794 Y154.357 E.01692
G1 X81.857 Y148.295 E.26772
G1 X81.857 Y147.753 E.01692
G1 X75.252 Y154.357 E.29165
G1 X74.713 Y154.355 E.01685
G1 X81.857 Y147.211 E.31548
G1 X81.857 Y146.669 E.01692
G1 X74.28 Y154.246 E.3346
G1 X73.854 Y154.129 E.01377
G1 X81.837 Y146.147 E.35249
G2 X81.684 Y146.043 I-.184 J.106 E.00596
G1 X81.399 Y146.043 E.00891
G1 X73.429 Y154.013 E.35193
G1 X73.141 Y153.933 E.00934
G1 X73.141 Y153.759 E.00544
G1 X80.857 Y146.043 E.34074
G1 X80.315 Y146.043 E.01692
G1 X73.141 Y153.218 E.31682
G1 X73.14 Y152.676 E.01692
G1 X79.773 Y146.043 E.29291
G1 X79.231 Y146.043 E.01692
G1 X73.14 Y152.134 E.26899
G1 X73.14 Y151.592 E.01692
G1 X78.689 Y146.043 E.24507
G1 X78.148 Y146.043 E.01692
G1 X73.14 Y151.051 E.22115
G1 X73.139 Y150.509 E.01692
G1 X77.606 Y146.043 E.19723
G1 X77.064 Y146.043 E.01692
G1 X73.139 Y149.967 E.17332
G1 X73.139 Y149.425 E.01692
G1 X76.522 Y146.042 E.1494
G1 X75.98 Y146.042 E.01692
G1 X73.139 Y148.884 E.12548
G1 X73.139 Y148.342 E.01692
G1 X75.438 Y146.042 E.10156
G1 X74.897 Y146.042 E.01692
G1 X73.138 Y147.8 E.07764
G1 X73.138 Y147.259 E.01692
G1 X74.455 Y145.941 E.05817
; WIPE_START
G1 X73.138 Y147.259 E-.70785
G1 X73.138 Y147.396 E-.05216
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X73.037 Y145.848 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.118708
G1 F15000
M204 S6000
G1 X73.063 Y146.163 E.00195
; LINE_WIDTH: 0.161268
G1 X73.088 Y146.478 E.00305
; WIPE_START
G1 X73.063 Y146.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X67.46 Y151.346 Z.8 F42000
G1 X60.104 Y158.153 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.533467
G1 F7338.753
M204 S6000
G1 X60.158 Y158.526 E.01505
; LINE_WIDTH: 0.494387
G1 F7974.011
G1 X60.179 Y158.655 E.00482
; LINE_WIDTH: 0.45152
G1 F8810.575
G1 X60.201 Y158.784 E.00436
; LINE_WIDTH: 0.406035
G1 F9914.233
G1 X60.278 Y159.202 E.01258
; LINE_WIDTH: 0.357903
G1 F11429.194
G1 X60.356 Y159.62 E.01091
M204 S10000
G1 X60.543 Y160.326 F42000
; LINE_WIDTH: 0.10862
G1 F15000
M204 S6000
G1 X60.776 Y160.99 E.00377
; OBJECT_ID: 3
; WIPE_START
G1 X60.543 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X55.552 Y154.551 Z.8 F42000
G1 X26.703 Y121.165 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X26.609 Y120.822 E.01179
G3 X26.391 Y119.01 I7.605 J-1.837 E.06071
G1 X26.391 Y95.99 E.76359
G3 X34.19 Y88.191 I7.824 J.025 E.40606
G1 X87.71 Y88.191 E1.77533
G3 X95.509 Y95.99 I-.024 J7.823 E.40607
G1 X95.509 Y119.01 E.76359
G3 X87.71 Y126.809 I-7.823 J-.024 E.40607
G1 X34.19 Y126.809 E1.77533
G3 X26.776 Y121.412 I.024 J-7.823 E.32503
G1 X26.72 Y121.223 E.00654
M204 S10000
G1 X27.097 Y121.047 F42000
G1 F8843.478
M204 S6000
G1 X26.943 Y120.444 E.02066
G3 X26.798 Y119.006 I7.271 J-1.457 E.04802
G1 X26.798 Y95.994 E.76333
G3 X34.194 Y88.598 I7.417 J.02 E.38511
G1 X87.706 Y88.598 E1.77507
G3 X95.102 Y95.994 I-.019 J7.416 E.38512
G1 X95.102 Y119.006 E.76333
G3 X87.706 Y126.402 I-7.416 J-.019 E.38512
G1 X34.194 Y126.402 E1.77507
G3 X27.164 Y121.286 I.019 J-7.416 E.3082
G1 X27.113 Y121.105 E.00623
M204 S250
G1 X27.468 Y120.948 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9300
M204 S5000
G1 X27.458 Y120.902 E.00146
G1 X27.367 Y120.5 E.01265
G1 X27.279 Y120.11 E.01229
G1 F8400
G1 X27.239 Y119.824 E.00887
G1 F9300
G1 X27.201 Y119.275 E.01691
G3 X27.19 Y118.402 I12.586 J-.591 E.02683
G1 X27.19 Y96.598 E.66998
G3 X27.195 Y95.725 I9.146 J-.383 E.02684
G1 X27.235 Y95.315 E.01265
G1 X27.274 Y94.917 E.01229
G1 F8400
G1 X27.325 Y94.633 E.00887
G1 F9300
G1 X27.454 Y94.097 E.01692
G3 X27.835 Y93.066 I6.822 J1.933 E.03383
G1 X28.028 Y92.702 E.01266
G1 X28.216 Y92.349 E.01229
G1 F8400
G1 X28.371 Y92.106 E.00887
G1 F9300
G1 X28.699 Y91.664 E.01691
G3 X29.043 Y91.252 I7.344 J5.789 E.0165
G1 F8400
G1 X29.243 Y91.043 E.00887
G1 F9300
G1 X29.648 Y90.67 E.01692
G3 X30.08 Y90.33 I4.641 J5.447 E.01691
G1 X30.438 Y90.099 E.01308
G1 X30.775 Y89.884 E.01229
G1 F8400
G1 X31.03 Y89.748 E.00886
G1 F9300
G1 X31.396 Y89.588 E.01229
G1 X31.775 Y89.427 E.01265
G3 X34.198 Y88.99 I2.471 J6.765 E.07602
G1 X87.102 Y88.99 E1.6256
G3 X88.25 Y89.017 I.358 J9.183 E.0353
G1 X88.658 Y89.068 E.01264
G1 X89.054 Y89.122 E.01229
G1 F8400
G1 X89.336 Y89.184 E.00887
G1 F9300
G1 X89.865 Y89.338 E.01692
G3 X90.383 Y89.524 I-2.889 J8.891 E.01691
G1 F8400
G1 X90.647 Y89.64 E.00887
G1 F9300
G1 X91.123 Y89.888 E.01649
G3 X91.583 Y90.164 I-4.569 J8.158 E.01649
G1 F8400
G1 X91.82 Y90.329 E.00887
G1 F9300
G1 X92.25 Y90.672 E.01691
G3 X93.202 Y91.663 I-4.763 J5.524 E.04227
G1 X93.441 Y91.998 E.01264
G1 X93.67 Y92.326 E.01229
G1 F8400
G1 X93.816 Y92.575 E.00887
G1 F9300
G1 X93.991 Y92.935 E.01229
G1 X94.176 Y93.317 E.01307
G3 X94.71 Y96.598 I-7.179 J2.851 E.10293
G1 X94.71 Y119.002 E.68842
G3 X91.362 Y124.976 I-7.041 J-.021 E.21974
G1 X90.894 Y125.24 E.0165
G1 F8400
G1 X90.635 Y125.366 E.00887
G1 F9300
G1 X90.383 Y125.476 E.00846
G3 X87.102 Y126.01 I-2.851 J-7.179 E.10293
G1 X34.798 Y126.01 E1.60716
G3 X33.65 Y125.983 I-.358 J-9.183 E.0353
G1 X33.242 Y125.932 E.01264
G1 X32.846 Y125.878 E.01229
G1 F8400
G1 X32.564 Y125.816 E.00887
G1 F9300
G1 X32.034 Y125.666 E.01692
G3 X28.695 Y123.339 I2.178 J-6.683 E.12686
G1 X28.371 Y122.894 E.01691
G1 F8400
G1 X28.216 Y122.651 E.00887
G1 F9300
G1 X28.028 Y122.298 E.01229
G1 X27.838 Y121.933 E.01265
G3 X27.628 Y121.425 I6.63 J-3.032 E.0169
G1 X27.487 Y121.005 E.01361
; WIPE_START
M204 S6000
G1 X27.458 Y120.902 E-.04077
G1 X27.367 Y120.5 E-.15639
G1 X27.279 Y120.11 E-.152
G1 X27.239 Y119.824 E-.10968
G1 X27.201 Y119.275 E-.20913
G1 X27.198 Y119.033 E-.09204
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.31 Y114.461 Z.8 F42000
G1 X68.941 Y87.809 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y87.809 E.62195
G3 X95.891 Y96.01 I-.006 J8.207 E.42723
G1 X95.891 Y118.99 E.76229
G3 X87.69 Y127.191 I-8.207 J-.006 E.42723
G1 X34.21 Y127.191 E1.77403
G3 X26.009 Y118.99 I.006 J-8.207 E.42724
G1 X26.009 Y96.01 E.76229
G3 X34.21 Y87.809 I8.207 J.006 E.42723
G1 X52.959 Y87.809 E.62195
G1 X52.959 Y82.83 E.16517
G3 X53.48 Y82.309 I.495 J-.025 E.02753
G1 X68.464 Y82.31 E.49704
G3 X68.941 Y82.82 I-.015 J.493 E.02573
G1 X68.941 Y87.749 E.16352
M204 S10000
G1 X69.348 Y87.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y87.402 E.60858
G3 X96.298 Y96.006 I-.01 J8.614 E.44816
G1 X96.298 Y118.994 E.76256
G3 X87.694 Y127.598 I-8.614 J-.01 E.44816
G1 X34.206 Y127.598 E1.7743
G3 X25.602 Y118.994 I.01 J-8.614 E.44817
G1 X25.602 Y96.006 E.76256
G3 X34.206 Y87.402 I8.614 J.01 E.44816
G1 X52.552 Y87.402 E.60858
G1 X52.552 Y82.818 E.15207
G3 X53.468 Y81.902 I.906 J-.01 E.04786
G1 X68.479 Y81.903 E.49795
G3 X69.348 Y82.812 I-.036 J.905 E.0461
G1 X69.348 Y87.342 E.15028
M204 S250
G1 X69.74 Y87.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X69.779 Y87.01 E.00119
G1 F9300
G1 X87.098 Y87.01 E.53217
G3 X92.093 Y88.156 I.474 J9.39 E.15949
G3 X96.69 Y96.002 I-4.404 J7.85 E.29291
G1 X96.69 Y118.398 E.68816
G3 X95.544 Y123.393 I-9.39 J.474 E.15949
G3 X87.698 Y127.99 I-7.85 J-4.404 E.29291
G1 X34.802 Y127.99 E1.62534
G3 X29.807 Y126.844 I-.471 J-9.403 E.15948
G3 X25.21 Y118.998 I4.404 J-7.85 E.29291
G1 X25.21 Y96.602 E.68816
G3 X26.356 Y91.607 I9.482 J-.453 E.15944
G3 X34.202 Y87.01 I7.85 J4.404 E.29291
G1 X52.121 Y87.01 E.55061
G1 F9547.055
G1 X52.16 Y87.01 E.00119
G1 X52.16 Y82.806 E.12917
G3 X53.456 Y81.51 I1.3 J.004 E.06251
G1 X68.494 Y81.511 E.46206
G3 X69.74 Y82.804 I-.054 J1.299 E.06092
G1 X69.74 Y86.95 E.12739
; WIPE_START
M204 S6000
G1 X69.779 Y87.01 E-.02713
G1 X71.707 Y87.01 E-.73287
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X68.549 Y87.799 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X68.546 Y82.858 E.15181
G1 X68.505 Y82.741 E.00381
G1 X68.375 Y82.702 E.00416
G1 X53.446 Y82.71 E.45872
G1 X53.356 Y82.811 E.00415
G1 X53.351 Y87.799 E.15327
G1 X68.489 Y87.799 E.46512
M204 S10000
G1 X55.899 Y85.489 F42000
; LINE_WIDTH: 0.515424
G1 F7618.986
M204 S6000
G1 X66.237 Y85.488 E.39804
G1 X66.237 Y85.014 E.01825
G1 X55.664 Y85.018 E.40709
G1 X55.663 Y85.489 E.01814
G1 X55.839 Y85.489 E.00677
M204 S10000
G1 X55.238 Y85.913 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.662 Y85.913 E.35102
G1 X66.662 Y84.588 E.04071
G1 X55.24 Y84.594 E.35095
G1 X55.239 Y85.853 E.03869
M204 S10000
G1 X54.861 Y86.291 F42000
G1 F9547.299
M204 S6000
G1 X67.04 Y86.291 E.37421
G1 X67.039 Y84.211 E.06389
G1 X54.863 Y84.217 E.37411
G1 X54.861 Y86.231 E.06186
M204 S10000
G1 X54.484 Y86.668 F42000
G1 F9547.299
M204 S6000
G1 X67.417 Y86.668 E.3974
G1 X67.415 Y83.834 E.08707
G1 X54.486 Y83.841 E.39726
G1 X54.484 Y86.608 E.08502
M204 S10000
G1 X54.106 Y87.045 F42000
G1 F9547.299
M204 S6000
G1 X67.794 Y87.045 E.42059
G1 X67.792 Y83.457 E.11025
G1 X54.11 Y83.464 E.42042
G1 X54.106 Y86.985 E.10819
M204 S10000
G1 X53.729 Y87.422 F42000
G1 F9547.299
M204 S6000
G1 X68.172 Y87.422 E.44378
G1 X68.169 Y83.079 E.13342
G1 X53.733 Y83.087 E.44357
G1 X53.729 Y87.362 E.13136
; OBJECT_ID: 1
; WIPE_START
G1 X53.731 Y85.362 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X58.423 Y79.342 Z.8 F42000
G1 X93.086 Y34.876 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X93.273 Y35.142 E.0108
G3 X94.509 Y39.19 I-6.086 J4.071 E.14244
G1 X94.509 Y62.21 E.76359
G3 X87.21 Y69.509 I-7.322 J-.023 E.38003
G1 X33.69 Y69.509 E1.77533
G3 X26.391 Y62.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E.76359
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X92.936 Y34.678 I-.022 J7.322 E.21856
G1 X93.05 Y34.828 E.00625
M204 S10000
G1 X92.748 Y35.113 F42000
G1 F8843.478
M204 S6000
G1 X92.935 Y35.368 E.01049
G3 X94.102 Y39.194 I-5.747 J3.844 E.13462
G1 X94.102 Y62.206 E.76333
G3 X87.206 Y69.102 I-6.915 J-.018 E.35908
G1 X33.694 Y69.102 E1.77508
G3 X26.798 Y62.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E.76333
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X92.444 Y34.72 I-.018 J6.914 E.19749
G1 X92.711 Y35.066 E.01448
M204 S250
G1 X92.444 Y35.344 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9300
M204 S5000
G1 X92.466 Y35.374 E.00113
G3 X93.308 Y36.947 I-5.336 J3.867 E.05498
G3 X93.71 Y39.798 I-7.19 J2.469 E.08901
M73 P40 R15
G1 X93.71 Y62.202 E.68842
G3 X93.304 Y64.452 I-6.688 J-.045 E.0706
G1 X93.166 Y64.778 E.01087
G1 X93.006 Y65.144 E.01229
G1 F8400
G1 X92.88 Y65.381 E.00824
G1 F9300
G1 X92.611 Y65.816 E.01571
G3 X90.38 Y67.878 I-5.482 J-3.692 E.09421
G1 X89.925 Y68.112 E.01571
G1 F8400
G1 X89.68 Y68.219 E.00823
G1 F9300
G1 X89.453 Y68.308 E.00747
G3 X86.602 Y68.71 I-2.469 J-7.19 E.08901
G1 X34.298 Y68.71 E1.60716
G3 X32.431 Y68.579 I-.399 J-7.703 E.05764
G1 X31.945 Y68.469 E.01532
G1 F8400
G1 X31.688 Y68.391 E.00824
G1 F9300
G1 X31.316 Y68.246 E.01229
G1 X30.975 Y68.112 E.01126
G3 X27.9 Y65.155 I2.734 J-5.921 E.13352
G1 X27.753 Y64.82 E.01126
G1 X27.592 Y64.453 E.01229
G1 F8400
G1 X27.505 Y64.2 E.00824
G1 F9300
G1 X27.375 Y63.719 E.01531
G3 X27.272 Y63.231 I8.443 J-2.027 E.01532
G1 F8400
G1 X27.235 Y62.965 E.00824
G1 F9300
G1 X27.2 Y62.455 E.01571
G3 X27.19 Y61.602 I11.932 J-.566 E.02622
G1 X27.19 Y39.798 E.66998
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
G1 X28.291 Y35.586 E.01571
G3 X28.588 Y35.17 I7.217 J4.822 E.01571
G1 F8400
G1 X28.758 Y34.963 E.00824
G1 F9300
G1 X29.1 Y34.599 E.01532
G3 X29.876 Y33.936 I4.877 J4.924 E.0314
G1 X30.288 Y33.656 E.01531
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
G1 X86.602 Y32.69 E1.6256
G3 X88.469 Y32.82 I.421 J7.399 E.05766
G1 X88.813 Y32.904 E.01087
G1 X89.2 Y33.005 E.01229
G1 F8400
G1 X89.453 Y33.092 E.00824
G1 F9300
G1 X89.82 Y33.253 E.01229
G1 X90.155 Y33.401 E.01127
G3 X90.601 Y33.65 I-3.02 J5.92 E.0157
G1 X91.027 Y33.933 E.01571
G1 F8400
G1 X91.24 Y34.096 E.00823
G1 F9300
G1 X91.616 Y34.423 E.01532
G3 X91.972 Y34.772 I-5.893 J6.375 E.01531
G1 F8400
G1 X92.15 Y34.972 E.00823
G1 F9300
G1 X92.407 Y35.297 E.01273
; WIPE_START
M204 S6000
G1 X92.466 Y35.374 E-.03682
G1 X92.751 Y35.799 E-.19429
G1 X93.112 Y36.474 E-.29122
G1 X93.308 Y36.947 E-.19424
G1 X93.341 Y37.056 E-.04343
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.891 Y35.396 Z.8 F42000
G1 X68.441 Y31.509 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I-.004 J7.705 E.4012
G1 X94.891 Y62.19 E.76229
G3 X87.19 Y69.891 I-7.706 J-.005 E.40119
G1 X33.71 Y69.891 E1.77404
G3 X26.009 Y62.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E.76229
G3 X33.711 Y31.509 I7.705 J.004 E.40124
G1 X52.459 Y31.509 E.6219
G1 X52.459 Y26.53 E.16517
G3 X52.98 Y26.009 I.495 J-.025 E.02752
G1 X67.964 Y26.01 E.49704
G3 X68.441 Y26.53 I-.016 J.493 E.02607
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I-.009 J8.113 E.42213
G1 X95.298 Y62.194 E.76256
G3 X87.194 Y70.298 I-8.113 J-.009 E.42212
G1 X33.706 Y70.298 E1.77431
G3 X25.602 Y62.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E.76256
G3 X33.707 Y31.102 I8.113 J.009 E.42216
G1 X52.052 Y31.102 E.60855
G1 X52.052 Y26.518 E.15207
G3 X52.968 Y25.602 I.906 J-.01 E.04786
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
G1 X95.69 Y61.598 E.68816
G3 X94.607 Y66.348 I-8.996 J.448 E.1516
G3 X87.198 Y70.69 I-7.414 J-4.159 E.27663
G1 X34.302 Y70.69 E1.62534
G3 X29.552 Y69.607 I-.448 J-8.996 E.1516
G3 X25.21 Y62.198 I4.159 J-7.414 E.27663
G1 X25.21 Y39.802 E.68816
G3 X26.293 Y35.052 I8.996 J-.448 E.1516
G3 X33.703 Y30.71 I7.414 J4.159 E.27664
G1 X51.621 Y30.71 E.55059
G1 F9547.055
G1 X51.66 Y30.71 E.00119
G1 X51.66 Y26.506 E.12917
G3 X52.956 Y25.21 I1.3 J.004 E.06251
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
G1 X63.61 Y29.979 Z.8 F42000
G1 X55.398 Y29.19 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51505
G1 F7625.025
M204 S6000
G1 X65.735 Y29.188 E.3977
G1 X65.735 Y28.714 E.01823
G1 X55.163 Y28.719 E.40672
G1 X55.163 Y29.19 E.0181
G1 X55.338 Y29.19 E.00675
M204 S10000
G1 X66.161 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.289 E.04071
G1 X54.74 Y28.296 E.3509
G1 X54.738 Y29.613 E.04049
G1 X66.101 Y29.613 E.34914
M204 S10000
G1 X66.539 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.911 E.06389
G1 X54.363 Y27.919 E.37404
G1 X54.361 Y29.991 E.06366
G1 X66.479 Y29.991 E.37234
M204 S10000
G1 X66.916 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.534 E.08706
G1 X53.986 Y27.542 E.39719
G1 X53.984 Y30.368 E.08682
G1 X66.856 Y30.368 E.39553
M204 S10000
G1 X67.294 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.157 E.11024
G1 X53.61 Y27.165 E.42034
G1 X53.606 Y30.745 E.10999
G1 X67.234 Y30.745 E.41873
M204 S10000
G1 X67.671 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.779 E.13342
G1 X53.233 Y26.788 E.44349
G1 X53.229 Y31.122 E.13315
G1 X67.611 Y31.122 E.44193
M204 S10000
G1 X68.049 Y31.499 F42000
G1 F9547.299
M204 S6000
G1 X68.043 Y26.54 E.15236
G1 X68.009 Y26.443 E.00317
G1 X67.875 Y26.402 E.0043
G1 X52.94 Y26.411 E.4589
G1 X52.856 Y26.511 E.004
G1 X52.851 Y31.499 E.15327
G1 X67.989 Y31.499 E.46512
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.989 Y31.499 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 3/15
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I-.482 J1.118 P1  F42000
G1 X218.891 Y97.392 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X218.886 Y100.336 I-76.939 J1.348 E.09764
G3 X218.728 Y101.51 I-6.446 J-.271 E.03937
G1 X218.509 Y101.487 E.00729
G1 X218.509 Y88.489 E.43116
G2 X206.891 Y88.489 I-5.809 J.011 E.60468
G1 X206.891 Y101.487 E.43116
G1 X206.672 Y101.51 E.00729
G3 X206.509 Y100.089 I6.807 J-1.501 E.04754
G1 X206.509 Y88.509 E.38412
G3 X212.849 Y82.311 I6.204 J.004 E.32763
G3 X218.843 Y87.734 I-.164 J6.206 E.29201
G1 X219 Y89.235 E.05005
G1 X220.271 Y88.826 E.0443
G3 X220.422 Y88.808 I.164 J.729 E.00505
G1 X227.458 Y88.812 E.23338
G3 X227.89 Y89.29 I-.059 J.487 E.0233
G1 X227.891 Y97.279 E.26502
G3 X227.37 Y97.79 I-.495 J.016 E.02719
G1 X220.419 Y97.79 E.23059
G3 X220.294 Y97.777 I-.003 J-.6 E.00417
G1 X218.949 Y97.408 E.04628
M204 S10000
G1 X219.298 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X219.293 Y100.351 I-63.478 J1.083 E.08045
G3 X218.279 Y103.618 I-6.701 J-.29 E.11472
G1 X218.102 Y103.567 E.0061
G1 X218.102 Y88.493 E.50002
G2 X207.298 Y88.493 I-5.402 J.007 E.56252
G1 X207.298 Y103.568 E.50006
G1 X207.121 Y103.619 E.00612
G3 X206.102 Y100.093 I5.598 J-3.527 E.12336
G1 X206.102 Y88.505 E.38438
G3 X212.857 Y81.904 I6.612 J.009 E.34896
G3 X219.247 Y87.684 I-.173 J6.614 E.31128
G1 X219.353 Y88.694 E.03368
G1 X220.162 Y88.433 E.02821
G3 X220.413 Y88.401 I.274 J1.129 E.00841
G1 X227.435 Y88.402 E.23293
G3 X228.297 Y89.27 I-.047 J.908 E.04448
G1 X228.298 Y97.287 E.26595
G3 X227.382 Y98.197 I-.901 J.009 E.04773
G1 X220.411 Y98.197 E.23124
G3 X220.202 Y98.174 I.006 J-1.036 E.00699
G1 X219.356 Y97.942 E.02912
M204 S250
G1 X219.69 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X219.67 Y100.633 I-28.776 J.828 E.06738
G3 X217.71 Y104.972 I-6.983 J-.541 E.14928
G1 X217.71 Y88.497 E.50624
G2 X207.69 Y88.497 I-5.01 J.003 E.48344
G1 X207.684 Y104.967 E.50607
G3 X205.71 Y100.096 I5.077 J-4.893 E.16547
G1 X205.71 Y88.501 E.3563
G3 X212.864 Y81.512 I7.005 J.013 E.34228
G3 X219.692 Y88.173 I-.174 J7.009 E.32235
G3 X220.405 Y88.009 I.84 J2.023 E.02256
G1 X227.45 Y88.01 E.2165
G3 X228.689 Y89.25 I-.066 J1.305 E.05903
G1 X228.69 Y97.295 E.24718
G3 X227.394 Y98.589 I-1.293 J.001 E.06255
G1 X220.404 Y98.589 E.21478
G3 X219.746 Y98.461 I.121 J-2.369 E.02066
; WIPE_START
M204 S6000
G1 X219.69 Y100.096 E-.622
G1 X219.676 Y100.459 E-.138
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.878 Y101.744 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545366
G1 F7164.958
M204 S6000
G1 X218.557 Y101.95 E.01559
; LINE_WIDTH: 0.526762
G1 F7440.446
G1 X218.538 Y102.067 E.00467
; LINE_WIDTH: 0.488401
G1 F8081.159
G1 X218.519 Y102.184 E.0043
; LINE_WIDTH: 0.447409
G1 F8900.133
G1 X218.436 Y102.634 E.01509
; LINE_WIDTH: 0.403803
G1 F9975.539
G1 X218.353 Y103.084 E.01346
; WIPE_START
G1 X218.436 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X219.731 Y97.453 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42099
G1 F9522.046
M204 S6000
G1 X218.841 Y96.563 E.0388
G1 X218.841 Y96.028 E.01648
G1 X220.226 Y97.413 E.06034
M73 P41 R15
G2 X220.804 Y97.457 I.394 J-1.372 E.01799
G1 X218.84 Y95.493 E.08554
G1 X218.84 Y94.958 E.01648
G1 X221.338 Y97.457 E.10885
G1 X221.873 Y97.457 E.01647
G1 X218.84 Y94.423 E.13215
G1 X218.84 Y93.889 E.01648
M73 P41 R14
G1 X222.408 Y97.457 E.15545
G1 X222.942 Y97.457 E.01647
G1 X218.84 Y93.354 E.17875
G1 X218.839 Y92.819 E.01648
G1 X223.477 Y97.457 E.20206
G1 X224.012 Y97.457 E.01647
G1 X218.839 Y92.284 E.22536
G1 X218.839 Y91.749 E.01648
G1 X224.546 Y97.457 E.24866
G1 X225.081 Y97.457 E.01647
G1 X218.839 Y91.214 E.27197
G1 X218.839 Y90.679 E.01648
G1 X225.616 Y97.457 E.29527
G1 X226.15 Y97.457 E.01647
G1 X218.839 Y90.145 E.31857
G1 X218.838 Y89.853 E.00899
G1 X219.069 Y89.841 E.00712
G1 X226.685 Y97.457 E.33181
G1 X227.22 Y97.457 E.01647
G1 X219.263 Y89.5 E.34665
G1 X219.668 Y89.37 E.01309
G1 X227.558 Y97.26 E.34374
G1 X227.558 Y96.725 E.01647
G1 X220.073 Y89.24 E.32611
G3 X220.509 Y89.141 I.427 J.875 E.0139
G1 X227.557 Y96.19 E.30711
G1 X227.557 Y95.655 E.01647
G1 X221.043 Y89.141 E.28381
G1 X221.578 Y89.141 E.01647
G1 X227.557 Y95.121 E.26051
G1 X227.557 Y94.586 E.01647
G1 X222.113 Y89.142 E.2372
G1 X222.648 Y89.142 E.01647
G1 X227.557 Y94.051 E.2139
G1 X227.557 Y93.516 E.01647
G1 X223.182 Y89.142 E.1906
G1 X223.717 Y89.142 E.01647
G1 X227.557 Y92.982 E.1673
G1 X227.557 Y92.447 E.01647
G1 X224.252 Y89.142 E.14399
G1 X224.787 Y89.142 E.01647
G1 X227.557 Y91.912 E.12069
G1 X227.557 Y91.377 E.01647
G1 X225.321 Y89.142 E.09739
G1 X225.856 Y89.142 E.01647
G1 X227.557 Y90.843 E.07409
G1 X227.557 Y90.308 E.01647
G1 X226.391 Y89.142 E.05078
G1 X226.926 Y89.142 E.01647
G1 X227.726 Y89.943 E.03488
M204 S10000
G1 X218.769 Y89.523 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136338
G1 F15000
M204 S6000
G1 X218.754 Y89.229 E.00224
; LINE_WIDTH: 0.110055
G1 X218.738 Y88.936 E.00161
; WIPE_START
G1 X218.754 Y89.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X213.418 Y94.687 Z1 F42000
G1 X206.521 Y101.741 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.541093
G1 F7226.406
M204 S6000
G1 X206.843 Y101.95 E.01556
G1 X206.862 Y102.067 E.00481
; LINE_WIDTH: 0.488474
G1 F8079.837
G1 X206.881 Y102.184 E.0043
; LINE_WIDTH: 0.447518
G1 F8897.736
G1 X206.964 Y102.634 E.0151
; LINE_WIDTH: 0.403912
G1 F9972.523
G1 X207.047 Y103.084 E.01347
; OBJECT_ID: 6
; WIPE_START
G1 X206.964 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X199.549 Y100.824 Z1 F42000
G1 X185.491 Y97.392 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X185.486 Y100.336 I-76.666 J1.348 E.09766
G3 X185.328 Y101.51 I-6.446 J-.271 E.03937
G1 X185.109 Y101.487 E.00729
G1 X185.109 Y88.489 E.43116
G2 X173.491 Y88.489 I-5.809 J.011 E.60468
G1 X173.491 Y101.487 E.43116
G1 X173.272 Y101.51 E.00729
G3 X173.109 Y100.089 I6.803 J-1.501 E.04754
G1 X173.109 Y88.509 E.38412
G3 X179.449 Y82.311 I6.201 J.001 E.32767
G3 X185.443 Y87.734 I-.164 J6.206 E.29201
G1 X185.6 Y89.235 E.05005
G1 X186.871 Y88.826 E.04431
G3 X187.022 Y88.808 I.164 J.734 E.00504
G1 X194.058 Y88.812 E.23339
G3 X194.49 Y89.28 I-.059 J.488 E.02297
G1 X194.491 Y97.269 E.26503
G3 X193.97 Y97.79 I-.495 J.025 E.02752
G1 X187.019 Y97.79 E.23059
G3 X186.894 Y97.777 I-.003 J-.605 E.00416
G1 X185.549 Y97.408 E.04629
M204 S10000
G1 X185.898 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X185.893 Y100.351 I-63.248 J1.083 E.08046
G3 X184.879 Y103.618 I-6.7 J-.29 E.11472
G1 X184.702 Y103.567 E.0061
G1 X184.702 Y88.493 E.50002
G2 X173.898 Y88.493 I-5.402 J.007 E.56252
G1 X173.898 Y103.568 E.50007
G1 X173.721 Y103.619 E.00612
G3 X172.702 Y100.093 I5.597 J-3.527 E.12336
G1 X172.702 Y88.505 E.38438
G3 X179.457 Y81.904 I6.609 J.006 E.349
G3 X185.847 Y87.684 I-.173 J6.614 E.31128
G1 X185.953 Y88.694 E.03368
G1 X186.762 Y88.433 E.02822
G3 X187.013 Y88.401 I.274 J1.132 E.0084
G1 X194.035 Y88.402 E.23293
G3 X194.897 Y89.264 I-.042 J.904 E.04435
G1 X194.898 Y97.281 E.26595
G3 X193.982 Y98.197 I-.901 J.015 E.04793
G1 X187.011 Y98.197 E.23124
G3 X186.802 Y98.174 I.006 J-1.039 E.00698
G1 X185.956 Y97.942 E.02912
M204 S250
G1 X186.29 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X186.27 Y100.633 I-28.75 J.828 E.06739
G3 X184.31 Y104.972 I-6.983 J-.541 E.14928
G1 X184.31 Y88.497 E.50624
G2 X174.29 Y88.497 I-5.01 J.003 E.48344
G1 X174.29 Y104.972 E.50624
G3 X172.31 Y100.097 I5.021 J-4.879 E.16577
G1 X172.31 Y88.501 E.3563
G3 X179.464 Y81.512 I7.002 J.011 E.34231
G3 X186.292 Y88.173 I-.174 J7.009 E.32235
G3 X187.005 Y88.009 I.84 J2.024 E.02256
G1 X194.05 Y88.01 E.2165
G3 X195.289 Y89.248 I-.061 J1.299 E.05904
G1 X195.29 Y97.293 E.24718
G3 X193.994 Y98.589 I-1.293 J.003 E.06261
G1 X187.004 Y98.589 E.21478
G3 X186.346 Y98.46 I.12 J-2.363 E.02066
; WIPE_START
M204 S6000
G1 X186.29 Y100.096 E-.62205
G1 X186.276 Y100.459 E-.13795
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X186.332 Y97.453 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42097
G1 F9522.549
M204 S6000
G1 X185.441 Y96.562 E.03882
G1 X185.441 Y96.027 E.01648
G1 X186.826 Y97.413 E.06037
G2 X187.404 Y97.457 I.394 J-1.372 E.01798
G1 X185.44 Y95.493 E.08556
G1 X185.44 Y94.958 E.01648
G1 X187.939 Y97.457 E.10886
G1 X188.474 Y97.457 E.01647
G1 X185.44 Y94.423 E.13216
G1 X185.44 Y93.888 E.01648
G1 X189.008 Y97.457 E.15546
G1 X189.543 Y97.457 E.01647
G1 X185.44 Y93.353 E.17876
G1 X185.439 Y92.818 E.01648
G1 X190.078 Y97.457 E.20207
G1 X190.612 Y97.457 E.01647
G1 X185.439 Y92.284 E.22537
G1 X185.439 Y91.749 E.01648
G1 X191.147 Y97.457 E.24867
G1 X191.681 Y97.457 E.01647
G1 X185.439 Y91.214 E.27197
G1 X185.439 Y90.679 E.01648
G1 X192.216 Y97.457 E.29527
G1 X192.751 Y97.457 E.01647
G1 X185.439 Y90.144 E.31857
G1 X185.438 Y89.853 E.00898
G1 X185.67 Y89.841 E.00713
G1 X193.285 Y97.457 E.33179
G1 X193.82 Y97.457 E.01647
G1 X185.864 Y89.5 E.34664
G1 X186.268 Y89.37 E.01309
G1 X194.155 Y97.257 E.34362
G1 X194.158 Y96.725 E.01641
G1 X186.673 Y89.24 E.32609
G3 X187.109 Y89.141 I.427 J.874 E.0139
G1 X194.157 Y96.19 E.30709
G1 X194.157 Y95.655 E.01647
G1 X187.644 Y89.141 E.28379
G1 X188.178 Y89.141 E.01647
G1 X194.157 Y95.121 E.26049
G1 X194.157 Y94.586 E.01647
G1 X188.713 Y89.142 E.23719
G1 X189.248 Y89.142 E.01647
G1 X194.157 Y94.051 E.21389
G1 X194.157 Y93.516 E.01647
G1 X189.782 Y89.142 E.19059
G1 X190.317 Y89.142 E.01647
G1 X194.157 Y92.982 E.16729
G1 X194.157 Y92.447 E.01647
G1 X190.852 Y89.142 E.14399
G1 X191.387 Y89.142 E.01647
G1 X194.157 Y91.912 E.12069
G1 X194.157 Y91.377 E.01647
G1 X191.921 Y89.142 E.09739
G1 X192.456 Y89.142 E.01647
G1 X194.157 Y90.843 E.07409
G1 X194.157 Y90.308 E.01647
G1 X192.991 Y89.142 E.05079
G1 X193.526 Y89.142 E.01647
G1 X194.326 Y89.943 E.03488
M204 S10000
G1 X185.369 Y89.523 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136339
G1 F15000
M204 S6000
G1 X185.354 Y89.229 E.00224
; LINE_WIDTH: 0.110056
G1 X185.338 Y88.936 E.00161
; WIPE_START
G1 X185.354 Y89.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.429 Y96.861 Z1 F42000
G1 X185.477 Y101.746 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.545535
G1 F7162.546
M204 S6000
G1 X185.157 Y101.95 E.01556
; LINE_WIDTH: 0.526787
G1 F7440.064
G1 X185.138 Y102.067 E.00468
; LINE_WIDTH: 0.488423
G1 F8080.767
G1 X185.119 Y102.184 E.0043
; LINE_WIDTH: 0.447447
G1 F8899.287
G1 X185.036 Y102.634 E.01509
; LINE_WIDTH: 0.403869
G1 F9973.711
G1 X184.953 Y103.084 E.01346
; WIPE_START
G1 X185.036 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.41 Y102.936 Z1 F42000
G1 X173.647 Y103.084 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.40362
G1 F9980.605
M204 S6000
G1 X173.564 Y102.635 E.01342
; LINE_WIDTH: 0.446767
G1 F8914.277
G1 X173.482 Y102.186 E.01502
; LINE_WIDTH: 0.487468
G1 F8098.113
G1 X173.463 Y102.068 E.00435
; LINE_WIDTH: 0.516095
G1 F7608.177
G1 X173.443 Y101.949 E.00463
G1 X173.122 Y101.742 E.01477
; OBJECT_ID: 5
; WIPE_START
G1 X173.443 Y101.949 E-.57862
G1 X173.463 Y102.068 E-.18138
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X166.006 Y100.437 Z1 F42000
G1 X152.091 Y97.393 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.091 Y100.389 E.09938
G3 X151.927 Y101.778 I-6.638 J-.078 E.04649
G1 X151.709 Y101.755 E.00727
G1 X151.709 Y88.189 E.44999
G2 X140.691 Y88.189 I-5.509 J.011 E.57342
G1 X140.691 Y101.755 E.44999
G1 X140.473 Y101.778 E.00727
G3 X140.309 Y100.389 I6.476 J-1.468 E.04648
G1 X140.309 Y88.209 E.40403
G3 X146.339 Y82.311 I5.903 J.003 E.3117
G3 X152.069 Y87.699 I-.141 J5.891 E.28568
G1 X152.169 Y89.234 E.05103
G1 X153.509 Y88.817 E.04652
G3 X153.628 Y88.808 I.109 J.628 E.00399
G1 X160.658 Y88.812 E.23318
G3 X161.09 Y89.28 I-.063 J.491 E.02293
G1 X161.091 Y97.279 E.26536
G3 X160.57 Y97.79 I-.495 J.016 E.02718
G1 X153.619 Y97.79 E.23059
G3 X153.494 Y97.777 I-.003 J-.6 E.00417
G1 X152.149 Y97.409 E.04627
M204 S10000
G1 X152.498 Y97.927 F42000
G1 F8843.478
M204 S6000
G3 X152.493 Y100.645 I-69.401 J1.233 E.09018
G3 X151.478 Y103.833 I-6.399 J-.281 E.1123
G1 X151.302 Y103.782 E.00608
G1 X151.302 Y88.193 E.51711
G2 X141.098 Y88.193 I-5.102 J.007 E.53126
G1 X141.098 Y103.782 E.51711
G1 X140.922 Y103.833 E.00608
G3 X139.902 Y100.393 I5.296 J-3.441 E.12069
G1 X139.902 Y88.205 E.4043
G3 X146.347 Y81.904 I6.311 J.008 E.33302
G3 X152.475 Y87.665 I-.149 J6.298 E.30549
G1 X152.542 Y88.691 E.03411
G1 X153.368 Y88.432 E.0287
G3 X153.617 Y88.401 I.247 J.963 E.00835
G1 X160.635 Y88.402 E.2328
G3 X161.497 Y89.264 I-.052 J.914 E.04424
G1 X161.498 Y97.287 E.26615
G3 X160.582 Y98.197 I-.901 J.009 E.04772
G1 X153.611 Y98.197 E.23124
G3 X153.402 Y98.174 I.006 J-1.034 E.00699
G1 X152.556 Y97.943 E.02911
M204 S250
G1 X152.89 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.885 Y100.66 I-56.668 J.978 E.06821
G3 X150.91 Y105.149 I-6.762 J-.297 E.15418
G1 X150.91 Y88.197 E.52089
G2 X141.49 Y88.197 I-4.71 J.003 E.45448
G1 X141.49 Y105.149 E.52089
G3 X139.51 Y100.397 I4.72 J-4.755 E.16235
G1 X139.51 Y88.201 E.37474
G3 X146.355 Y81.512 I6.704 J.013 E.32751
G3 X152.901 Y88.168 I-.175 J6.719 E.3171
G3 X153.606 Y88.009 I.805 J1.932 E.02232
G1 X160.65 Y88.01 E.21646
G3 X161.889 Y89.249 I-.073 J1.311 E.05891
G1 X161.89 Y97.295 E.24724
G3 X160.594 Y98.589 I-1.293 J.001 E.06254
G1 X153.604 Y98.589 E.21478
G3 X152.946 Y98.461 I.121 J-2.373 E.02066
; WIPE_START
M204 S6000
G1 X152.89 Y100.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.932 Y97.454 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42097
G1 F9522.549
M204 S6000
G1 X152.042 Y96.565 E.03874
G1 X152.042 Y96.03 E.01647
G1 X153.426 Y97.413 E.06026
G2 X154.004 Y97.457 I.394 J-1.374 E.01798
G1 X152.042 Y95.495 E.08545
G1 X152.042 Y94.961 E.01647
G1 X154.538 Y97.457 E.10874
G1 X155.073 Y97.457 E.01647
G1 X152.042 Y94.426 E.13203
G1 X152.042 Y93.891 E.01647
G1 X155.608 Y97.457 E.15533
G1 X156.142 Y97.457 E.01647
G1 X152.042 Y93.357 E.17862
G1 X152.042 Y92.822 E.01647
G1 X156.677 Y97.457 E.20191
G1 X157.212 Y97.457 E.01647
G1 X152.042 Y92.287 E.2252
G1 X152.042 Y91.753 E.01647
G1 X157.746 Y97.457 E.2485
G1 X158.281 Y97.457 E.01647
G1 X152.042 Y91.218 E.27179
G1 X152.042 Y90.684 E.01647
G1 X158.815 Y97.457 E.29508
G1 X159.35 Y97.457 E.01647
G1 X152.042 Y90.149 E.31837
G1 X152.042 Y89.847 E.00929
G1 X152.268 Y89.84 E.00696
G1 X159.885 Y97.457 E.33183
G1 X160.419 Y97.457 E.01647
G1 X152.456 Y89.494 E.34692
G1 X152.863 Y89.366 E.01314
G1 X160.758 Y97.26 E.34392
G1 X160.758 Y96.725 E.01647
G1 X153.271 Y89.238 E.32618
G3 X153.708 Y89.141 I.433 J.916 E.01392
G1 X160.757 Y96.191 E.30712
G1 X160.757 Y95.656 E.01647
G1 X154.243 Y89.141 E.28382
G1 X154.778 Y89.142 E.01647
G1 X160.757 Y95.121 E.26052
G1 X160.757 Y94.587 E.01647
G1 X155.312 Y89.142 E.23722
G1 X155.847 Y89.142 E.01647
G1 X160.757 Y94.052 E.21392
G1 X160.757 Y93.517 E.01647
M73 P42 R14
G1 X156.382 Y89.142 E.19062
G1 X156.917 Y89.142 E.01647
G1 X160.757 Y92.982 E.16732
G1 X160.757 Y92.448 E.01647
G1 X157.451 Y89.142 E.14402
G1 X157.986 Y89.142 E.01647
G1 X160.757 Y91.913 E.12072
G1 X160.757 Y91.378 E.01647
G1 X158.521 Y89.142 E.09742
G1 X159.055 Y89.142 E.01647
G1 X160.757 Y90.843 E.07412
G1 X160.757 Y90.309 E.01647
G1 X159.59 Y89.142 E.05082
G1 X160.125 Y89.142 E.01647
G1 X160.926 Y89.944 E.03491
M204 S10000
G1 X151.948 Y89.517 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104348
G1 F15000
M204 S6000
G1 X151.939 Y89.226 E.00146
; WIPE_START
G1 X151.948 Y89.517 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.025 Y97.149 Z1 F42000
G1 X152.075 Y102.013 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.527927
G1 F7422.577
M204 S6000
G1 X151.755 Y102.215 E.01496
; LINE_WIDTH: 0.524116
G1 F7481.372
G1 X151.737 Y102.321 E.00418
; LINE_WIDTH: 0.488825
G1 F8073.467
G1 X151.72 Y102.426 E.00388
; LINE_WIDTH: 0.44947
G1 F8855.008
G1 X151.637 Y102.867 E.01487
; LINE_WIDTH: 0.406024
G1 F9914.537
G1 X151.554 Y103.308 E.01329
; WIPE_START
G1 X151.637 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.011 Y103.179 Z1 F42000
G1 X140.846 Y103.308 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.405643
G1 F9924.941
M204 S6000
G1 X140.763 Y102.869 E.01323
; LINE_WIDTH: 0.448601
G1 F8873.97
G1 X140.681 Y102.429 E.0148
; LINE_WIDTH: 0.487733
G1 F8093.303
G1 X140.643 Y102.199 E.00845
; LINE_WIDTH: 0.523058
G1 F7497.854
G1 X140.605 Y101.969 E.00912
; OBJECT_ID: 4
; WIPE_START
G1 X140.643 Y102.199 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X133.197 Y100.523 Z1 F42000
G1 X119.291 Y97.393 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.291 Y100.589 E.10601
G3 X119.127 Y101.957 I-6.429 J-.078 E.04578
G1 X118.909 Y101.933 E.00726
G1 X118.909 Y87.99 E.46252
G2 X108.291 Y87.99 I-5.309 J.011 E.55258
G1 X108.291 Y101.933 E.46252
G1 X108.073 Y101.957 E.00726
G3 X107.909 Y100.589 I6.252 J-1.444 E.04578
G1 X107.909 Y88.01 E.41728
G3 X113.852 Y82.315 I5.693 J-.008 E.30516
G3 X119.282 Y87.678 I-.254 J5.687 E.27745
G1 X119.337 Y89.194 E.05032
G1 X120.727 Y88.815 E.04777
G3 X120.819 Y88.809 I.088 J.617 E.00306
G1 X127.809 Y88.81 E.23189
G3 X128.29 Y89.281 I-.012 J.492 E.02456
G1 X128.291 Y97.28 E.26535
G3 X127.77 Y97.79 I-.495 J.016 E.02719
G1 X120.819 Y97.79 E.23058
G3 X120.694 Y97.778 I-.003 J-.604 E.00418
G1 X119.349 Y97.409 E.04627
M204 S10000
G1 X119.698 Y97.927 F42000
G1 F8843.478
M204 S6000
G1 X119.698 Y100.593 E.08845
G3 X118.677 Y103.976 I-6.134 J-.006 E.11888
G1 X118.502 Y103.924 E.00605
G1 X118.502 Y87.994 E.52843
G2 X108.698 Y87.994 I-4.902 J.007 E.51042
G1 X108.698 Y103.924 E.52843
G1 X108.523 Y103.976 E.00605
G3 X107.502 Y100.593 I5.095 J-3.383 E.11889
G1 X107.502 Y88.006 E.41756
G3 X113.871 Y81.908 I6.1 J-.003 E.32689
G3 X119.688 Y87.655 I-.273 J6.094 E.29725
G1 X119.725 Y88.665 E.03353
G1 X120.602 Y88.424 E.03017
G3 X120.811 Y88.402 I.215 J1.017 E.00698
G1 X127.829 Y88.403 E.2328
G3 X128.697 Y89.265 I-.036 J.903 E.04454
G1 X128.698 Y97.288 E.26614
G3 X127.782 Y98.198 I-.901 J.009 E.04773
G1 X120.811 Y98.198 E.23123
G3 X120.602 Y98.175 I.006 J-1.038 E.00699
G1 X119.756 Y97.943 E.02911
M204 S250
G1 X120.09 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X120.085 Y100.857 I-60.738 J1.078 E.07425
G3 X118.11 Y105.265 I-6.545 J-.286 E.152
G1 X118.11 Y87.997 E.53059
G2 X109.09 Y87.997 I-4.51 J.003 E.43518
G1 X109.09 Y105.265 E.53059
G3 X107.11 Y100.597 I4.52 J-4.671 E.16005
G1 X107.11 Y88.002 E.38703
G3 X113.89 Y81.517 I6.492 J.001 E.32219
G3 X120.099 Y88.156 I-.31 J6.513 E.30905
G3 X120.804 Y88.01 I.823 J2.193 E.02222
G1 X127.849 Y88.011 E.21646
G3 X129.089 Y89.249 I-.059 J1.299 E.05909
G1 X129.09 Y97.295 E.24724
G3 X127.794 Y98.59 I-1.293 J.001 E.06255
G1 X120.804 Y98.59 E.21477
G3 X120.146 Y98.461 I.121 J-2.372 E.02066
; WIPE_START
M204 S6000
G1 X120.095 Y100.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.132 Y97.454 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42098
G1 F9522.297
M204 S6000
G1 X119.242 Y96.565 E.03874
G1 X119.242 Y96.03 E.01647
G1 X120.626 Y97.414 E.06027
G2 X121.204 Y97.457 I.394 J-1.376 E.01798
G1 X119.242 Y95.496 E.08546
G1 X119.242 Y94.961 E.01647
G1 X121.739 Y97.457 E.10875
G1 X122.273 Y97.457 E.01647
G1 X119.242 Y94.426 E.13205
G1 X119.242 Y93.892 E.01647
G1 X122.808 Y97.457 E.15534
G1 X123.343 Y97.457 E.01647
G1 X119.242 Y93.357 E.17863
G1 X119.242 Y92.822 E.01647
G1 X123.877 Y97.457 E.20193
G1 X124.412 Y97.457 E.01647
G1 X119.242 Y92.288 E.22522
G1 X119.242 Y91.753 E.01647
G1 X124.946 Y97.457 E.24851
G1 X125.481 Y97.457 E.01647
G1 X119.242 Y91.218 E.27181
G1 X119.242 Y90.684 E.01647
G1 X126.016 Y97.457 E.2951
G1 X126.55 Y97.457 E.01647
G1 X119.242 Y90.149 E.3184
G1 X119.242 Y89.614 E.01647
G1 X127.085 Y97.457 E.34169
G1 X127.62 Y97.457 E.01647
G1 X119.623 Y89.461 E.34838
G1 X120.043 Y89.346 E.0134
G1 X127.958 Y97.26 E.34483
G1 X127.958 Y96.726 E.01647
G1 X120.462 Y89.23 E.32655
G3 X120.909 Y89.142 I.427 J.985 E.01412
G1 X127.957 Y96.191 E.30711
G1 X127.957 Y95.656 E.01647
G1 X121.443 Y89.142 E.28381
G1 X121.978 Y89.142 E.01647
G1 X127.957 Y95.121 E.2605
G1 X127.957 Y94.587 E.01647
G1 X122.513 Y89.142 E.2372
G1 X123.048 Y89.142 E.01647
G1 X127.957 Y94.052 E.2139
G1 X127.957 Y93.517 E.01647
G1 X123.582 Y89.142 E.1906
G1 X124.117 Y89.143 E.01647
G1 X127.957 Y92.982 E.1673
G1 X127.957 Y92.448 E.01647
G1 X124.652 Y89.143 E.144
G1 X125.187 Y89.143 E.01647
G1 X127.957 Y91.913 E.1207
G1 X127.957 Y91.378 E.01647
G1 X125.721 Y89.143 E.0974
G1 X126.256 Y89.143 E.01647
G1 X127.957 Y90.844 E.0741
G1 X127.957 Y90.309 E.01647
G1 X126.791 Y89.143 E.05079
G1 X127.325 Y89.143 E.01647
G1 X128.126 Y89.944 E.03489
; WIPE_START
G1 X127.325 Y89.143 E-.43032
G1 X126.791 Y89.143 E-.2032
G1 X127.026 Y89.378 E-.12648
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.075 Y95.909 Z1 F42000
G1 X119.275 Y102.19 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.517046
G1 F7592.927
M204 S6000
G1 X118.954 Y102.392 E.01467
; LINE_WIDTH: 0.522294
G1 F7509.799
G1 X118.937 Y102.489 E.00385
; LINE_WIDTH: 0.489165
G1 F8067.325
G1 X118.92 Y102.587 E.00359
; LINE_WIDTH: 0.451139
G1 F8818.802
G1 X118.837 Y103.022 E.01474
; LINE_WIDTH: 0.408247
G1 F9854.206
G1 X118.754 Y103.457 E.01319
; WIPE_START
G1 X118.837 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.212 Y103.341 Z1 F42000
G1 X108.446 Y103.457 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.407455
G1 F9875.595
M204 S6000
G1 X108.363 Y103.022 E.01316
; LINE_WIDTH: 0.450805
G1 F8826.017
G1 X108.28 Y102.587 E.01473
; LINE_WIDTH: 0.489059
G1 F8069.234
G1 X108.263 Y102.49 E.00359
; LINE_WIDTH: 0.516576
G1 F7600.458
G1 X108.246 Y102.392 E.00381
G1 X107.925 Y102.19 E.01465
; OBJECT_ID: 2
; WIPE_START
G1 X108.246 Y102.392 E-.6031
G1 X108.263 Y102.49 E-.1569
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X108.187 Y94.857 Z1 F42000
G1 X107.893 Y65.337 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X107.866 Y65.272 E.00233
G3 X107.291 Y62.41 I6.947 J-2.885 E.09746
G1 X107.291 Y39.39 E.76359
G3 X114.79 Y31.891 I7.523 J.023 E.39045
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.023 J7.523 E.39045
G1 X175.809 Y62.41 E.76359
G3 X168.31 Y69.909 I-7.523 J-.023 E.39045
G1 X114.79 Y69.909 E1.77533
G3 X108.252 Y66.066 I.023 J-7.523 E.26366
G1 X107.919 Y65.391 E.02499
M204 S10000
G1 X108.259 Y65.159 F42000
G1 F8843.478
M204 S6000
G1 X108.242 Y65.116 E.00153
G3 X107.698 Y62.406 I6.571 J-2.729 E.09229
G1 X107.698 Y39.394 E.76333
G3 X114.794 Y32.298 I7.115 J.019 E.3695
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.019 J7.115 E.3695
G1 X175.402 Y62.406 E.76333
G3 X168.306 Y69.502 I-7.115 J-.019 E.3695
G1 X114.794 Y69.502 E1.77508
G3 X108.607 Y65.868 I.019 J-7.115 E.24947
G1 X108.285 Y65.213 E.0242
M204 S250
G1 X108.611 Y64.989 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X108.604 Y64.966 E.00072
G3 X108.09 Y62.402 I6.208 J-2.579 E.08087
G1 X108.09 Y39.398 E.70685
G3 X114.798 Y32.69 I6.722 J.015 E.32357
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.015 J6.722 E.32357
G1 X175.01 Y62.402 E.70685
G3 X168.302 Y69.11 I-6.722 J-.015 E.32357
G1 X114.798 Y69.11 E1.64403
G3 X108.949 Y65.676 I.015 J-6.722 E.21842
G1 X108.637 Y65.042 E.02171
; WIPE_START
M204 S6000
G1 X108.604 Y64.966 E-.03157
G1 X108.342 Y64.221 E-.30012
G1 X108.212 Y63.671 E-.21492
G1 X108.136 Y63.114 E-.21339
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.203 Y58.483 Z1 F42000
G1 X149.541 Y31.509 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I-.005 J7.906 E.41161
G1 X176.191 Y62.39 E.76229
G3 X168.29 Y70.291 I-7.906 J-.005 E.41161
G1 X114.81 Y70.291 E1.77403
G3 X106.909 Y62.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E.76229
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.53 E.16517
G3 X134.08 Y26.009 I.498 J-.023 E.02748
G1 X149.06 Y26.01 E.49691
G3 X149.541 Y26.52 I-.011 J.493 E.02587
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.01 J8.314 E.43254
G1 X176.598 Y62.394 E.76256
G3 X168.294 Y70.698 I-8.314 J-.01 E.43254
G1 X114.806 Y70.698 E1.7743
G3 X106.502 Y62.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E.76256
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.518 E.15207
G3 X134.068 Y25.602 I.906 J-.01 E.04786
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
G3 X176.99 Y39.402 I-.014 J8.706 E.41935
G1 X176.99 Y62.398 E.7066
G3 X168.298 Y71.09 I-8.706 J-.014 E.41935
G1 X114.802 Y71.09 E1.64378
G3 X106.11 Y62.398 I.014 J-8.706 E.41935
G1 X106.11 Y39.402 E.7066
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.506 E.12917
G3 X134.056 Y25.21 I1.3 J.004 E.06251
G1 X149.089 Y25.211 E.46191
G3 X150.34 Y26.504 I-.041 J1.292 E.06116
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.149 Y31.499 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
M73 P43 R14
G1 F9547.299
M204 S6000
G1 X149.147 Y26.567 E.15155
G1 X149.104 Y26.441 E.00408
G1 X148.972 Y26.402 E.00422
G1 X134.041 Y26.411 E.45878
G1 X133.956 Y26.51 E.00398
G1 X133.951 Y31.499 E.1533
G1 X149.089 Y31.499 E.46512
M204 S10000
G1 X136.498 Y29.19 F42000
; LINE_WIDTH: 0.51505
G1 F7625.023
M204 S6000
G1 X146.837 Y29.188 E.39776
G1 X146.837 Y28.714 E.01823
G1 X136.263 Y28.719 E.40679
G1 X136.263 Y29.19 E.0181
G1 X136.438 Y29.19 E.00675
M204 S10000
G1 X135.838 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.263 Y29.613 E.35102
G1 X147.262 Y28.289 E.04071
G1 X135.84 Y28.296 E.35096
G1 X135.839 Y29.553 E.03865
M204 S10000
G1 X135.461 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X147.64 Y29.991 E.37421
G1 X147.639 Y27.911 E.06389
G1 X135.463 Y27.919 E.37412
G1 X135.461 Y29.931 E.06181
M204 S10000
G1 X135.084 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X148.017 Y30.368 E.3974
G1 X148.016 Y27.534 E.08707
G1 X135.086 Y27.542 E.39727
G1 X135.084 Y30.308 E.08498
M204 S10000
G1 X134.706 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X148.394 Y30.745 E.42059
G1 X148.393 Y27.157 E.11025
G1 X134.71 Y27.165 E.42043
G1 X134.706 Y30.685 E.10814
M204 S10000
G1 X134.329 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X148.772 Y31.122 E.44378
G1 X148.77 Y26.779 E.13343
G1 X134.333 Y26.788 E.44358
G1 X134.329 Y31.062 E.13131
; OBJECT_ID: 8
; WIPE_START
G1 X134.331 Y29.062 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X129.701 Y35.13 Z1 F42000
G1 X38.791 Y154.292 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X38.786 Y157.052 I-69.888 J1.248 E.09153
G3 X38.627 Y158.232 I-6.555 J-.28 E.03958
G1 X38.409 Y158.209 E.00727
G1 X38.409 Y145.59 E.4186
G2 X26.391 Y145.59 I-6.009 J.011 E.62552
G1 X26.391 Y158.209 E.4186
G1 X26.173 Y158.232 E.00727
G3 X26.009 Y156.789 I7.017 J-1.528 E.04827
G1 X26.009 Y145.609 E.37086
G3 X32.523 Y139.21 I6.402 J.002 E.33722
G3 X38.721 Y144.657 I-.125 J6.392 E.29749
G1 X38.912 Y146.141 E.04965
G1 X40.204 Y145.719 E.04509
G3 X40.33 Y145.708 I.115 J.632 E.00419
G1 X47.358 Y145.713 E.23312
G3 X47.79 Y146.19 I-.063 J.491 E.02326
G1 X47.791 Y154.18 E.26502
G3 X47.27 Y154.69 I-.495 J.016 E.02719
G1 X40.319 Y154.69 E.23059
G3 X40.194 Y154.678 I-.003 J-.601 E.00415
G1 X38.849 Y154.308 E.04629
M204 S10000
G1 X39.198 Y154.826 F42000
G1 F8843.478
M204 S6000
G3 X39.193 Y157.067 I-56.792 J.984 E.07435
G3 X38.182 Y160.374 I-6.834 J-.281 E.11596
G1 X38.002 Y160.325 E.00619
G1 X38.002 Y145.593 E.48868
G2 X26.798 Y145.593 I-5.602 J.007 E.58335
G1 X26.798 Y160.325 E.48868
G1 X26.618 Y160.374 E.00619
G3 X25.602 Y156.793 I5.922 J-3.615 E.12501
G1 X25.602 Y145.605 E.37112
G3 X32.532 Y138.803 I6.809 J.006 E.35861
G3 X39.123 Y144.597 I-.135 J6.799 E.31639
G1 X39.253 Y145.6 E.03357
G1 X40.057 Y145.335 E.02808
G3 X40.318 Y145.301 I.258 J.962 E.00876
G1 X47.335 Y145.302 E.23277
G3 X48.197 Y146.17 I-.054 J.916 E.0444
G1 X48.198 Y154.188 E.26595
G3 X47.282 Y155.097 I-.901 J.009 E.04773
G1 X40.311 Y155.097 E.23124
G3 X40.103 Y155.075 I.006 J-1.034 E.00697
G1 X39.256 Y154.842 E.02913
M204 S250
G1 X39.59 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X39.568 Y157.366 I-25.707 J.728 E.06227
G3 X37.61 Y161.753 I-7.248 J-.605 E.15041
G1 X37.61 Y145.597 E.49641
G2 X27.19 Y145.597 I-5.21 J.003 E.50274
G1 X27.19 Y161.753 E.49641
G3 X25.21 Y156.797 I5.293 J-4.988 E.16789
G1 X25.21 Y145.601 E.34401
G3 X32.542 Y138.411 I7.202 J.011 E.35126
G3 X39.581 Y145.079 I-.163 J7.222 E.32661
G3 X40.306 Y144.909 I.827 J1.892 E.02302
G1 X47.35 Y144.91 E.21645
G3 X48.589 Y146.151 I-.076 J1.314 E.05894
G1 X48.59 Y154.195 E.24718
G3 X47.294 Y155.489 I-1.293 J.001 E.06255
G1 X40.304 Y155.489 E.21478
G3 X39.646 Y155.361 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X39.59 Y156.797 E-.54619
G1 X39.568 Y157.359 E-.21381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X39.631 Y154.354 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42095
G1 F9523.053
M204 S6000
G1 X38.741 Y153.463 E.03881
G1 X38.741 Y152.928 E.01647
G1 X40.126 Y154.313 E.06036
G2 X40.704 Y154.357 I.394 J-1.37 E.01798
G1 X38.74 Y152.393 E.08555
G1 X38.74 Y151.858 E.01647
G1 X41.239 Y154.357 E.10885
G1 X41.773 Y154.357 E.01647
G1 X38.74 Y151.324 E.13215
G1 X38.74 Y150.789 E.01647
G1 X42.308 Y154.357 E.15544
G1 X42.842 Y154.357 E.01647
G1 X38.74 Y150.254 E.17874
G1 X38.739 Y149.719 E.01647
G1 X43.377 Y154.357 E.20204
G1 X43.912 Y154.357 E.01647
G1 X38.739 Y149.184 E.22534
G1 X38.739 Y148.65 E.01647
G1 X44.446 Y154.357 E.24864
G1 X44.981 Y154.357 E.01647
G1 X38.739 Y148.115 E.27194
G1 X38.739 Y147.58 E.01647
G1 X45.516 Y154.357 E.29524
G1 X46.05 Y154.357 E.01647
G1 X38.738 Y147.045 E.31853
G1 X38.738 Y146.763 E.0087
G1 X38.975 Y146.747 E.00732
G1 X46.585 Y154.357 E.3315
G1 X47.119 Y154.357 E.01647
G1 X39.17 Y146.407 E.34632
G1 X39.572 Y146.275 E.01304
G1 X47.458 Y154.16 E.34354
G1 X47.458 Y153.626 E.01647
G1 X39.974 Y146.142 E.32602
G3 X40.408 Y146.042 I.432 J.879 E.01385
G1 X47.457 Y153.091 E.3071
G1 X47.457 Y152.556 E.01647
G1 X40.943 Y146.042 E.28381
G1 X41.477 Y146.042 E.01647
G1 X47.457 Y152.022 E.26051
G1 X47.457 Y151.487 E.01647
G1 X42.012 Y146.042 E.23721
G1 X42.547 Y146.042 E.01647
G1 X47.457 Y150.952 E.21391
G1 X47.457 Y150.418 E.01647
G1 X43.082 Y146.042 E.19062
G1 X43.616 Y146.042 E.01647
G1 X47.457 Y149.883 E.16732
G1 X47.457 Y149.348 E.01647
G1 X44.151 Y146.042 E.14402
G1 X44.686 Y146.042 E.01647
G1 X47.457 Y148.814 E.12072
G1 X47.457 Y148.279 E.01647
G1 X45.22 Y146.042 E.09743
G1 X45.755 Y146.043 E.01647
G1 X47.457 Y147.744 E.07413
G1 X47.457 Y147.209 E.01647
G1 X46.29 Y146.043 E.05083
G1 X46.824 Y146.043 E.01647
G1 X47.626 Y146.844 E.03493
M204 S10000
G1 X38.678 Y146.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.148669
G1 F15000
M204 S6000
G1 X38.658 Y146.119 E.00271
; LINE_WIDTH: 0.114167
G1 X38.638 Y145.805 E.00183
; WIPE_START
G1 X38.658 Y146.119 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.557 Y153.75 Z1 F42000
G1 X38.495 Y158.423 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.532245
G1 F7357.079
M204 S6000
G1 X38.443 Y158.773 E.01414
; LINE_WIDTH: 0.495839
G1 F7948.453
G1 X38.421 Y158.9 E.00472
; LINE_WIDTH: 0.453146
G1 F8775.648
G1 X38.4 Y159.026 E.00427
; LINE_WIDTH: 0.407767
G1 F9867.17
G1 X38.322 Y159.436 E.01243
; LINE_WIDTH: 0.359722
G1 F11363.562
G1 X38.244 Y159.847 E.01079
; WIPE_START
G1 X38.322 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X30.694 Y159.703 Z1 F42000
G1 X26.554 Y159.848 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.353103
G1 F11606.055
M204 S6000
G1 X26.501 Y159.56 E.0074
; LINE_WIDTH: 0.390246
G1 F10364.909
G1 X26.447 Y159.272 E.00829
; LINE_WIDTH: 0.427389
G1 F9363.574
G1 X26.393 Y158.984 E.00918
; LINE_WIDTH: 0.463745
G1 F8554.634
G1 X26.375 Y158.879 E.00366
; LINE_WIDTH: 0.499342
G1 F7887.445
G1 X26.357 Y158.774 E.00397
; LINE_WIDTH: 0.53223
G1 F7357.308
G1 X26.305 Y158.423 E.01414
; OBJECT_ID: 9
; WIPE_START
G1 X26.357 Y158.774 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X33.955 Y158.046 Z1 F42000
G1 X73.191 Y154.292 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X73.186 Y156.758 I-63.856 J1.099 E.08182
G3 X73.027 Y157.964 I-6.86 J-.287 E.0404
G1 X72.809 Y157.941 E.00728
G1 X72.809 Y145.89 E.39974
G2 X60.191 Y145.89 I-6.309 J.011 E.65678
G1 X60.191 Y157.941 E.39974
G1 X59.973 Y157.964 E.00728
G3 X59.809 Y156.49 I7.604 J-1.589 E.04927
G1 X59.809 Y145.91 E.35095
G3 X66.776 Y139.215 I6.693 J-.007 E.35808
G3 X73.082 Y144.697 I-.29 J6.701 E.29917
G1 X73.322 Y146.176 E.04973
G1 X74.544 Y145.735 E.0431
G3 X74.729 Y145.709 I.169 J.518 E.00622
G1 X81.719 Y145.71 E.23188
G3 X82.19 Y146.19 I-.031 J.501 E.02444
G1 X82.191 Y154.17 E.26469
G3 X81.67 Y154.691 I-.498 J.023 E.02748
G1 X74.719 Y154.691 E.23059
G3 X74.594 Y154.678 I-.003 J-.605 E.00416
G1 X73.249 Y154.308 E.0463
M204 S10000
G1 X73.598 Y154.826 F42000
G1 F8843.478
M204 S6000
G3 X73.593 Y156.774 I-50.431 J.834 E.06461
G3 X72.583 Y160.157 I-7.132 J-.286 E.11833
G1 X72.402 Y160.108 E.00622
G1 X72.402 Y145.894 E.47151
G2 X60.598 Y145.894 I-5.902 J.007 E.61462
G1 X60.598 Y160.108 E.47151
G1 X60.417 Y160.157 E.00622
G3 X59.402 Y156.494 I6.215 J-3.694 E.12758
G1 X59.402 Y145.906 E.35122
G3 X66.795 Y138.809 I7.1 J-.003 E.37976
G3 X73.482 Y144.624 I-.31 J7.109 E.31733
G1 X73.645 Y145.627 E.03373
G1 X74.425 Y145.346 E.02749
G3 X74.717 Y145.302 I.287 J.918 E.00985
G1 X81.735 Y145.303 E.23279
G3 X82.597 Y146.17 I-.053 J.914 E.04441
G1 X82.598 Y154.182 E.26575
G3 X81.682 Y155.098 I-.906 J.01 E.04786
G1 X74.711 Y155.098 E.23124
G3 X74.502 Y155.075 I.006 J-1.039 E.00698
G1 X73.656 Y154.842 E.02913
M204 S250
G1 X73.99 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X73.901 Y157.653 I-14.995 J.578 E.07118
G3 X72.01 Y161.572 I-7.534 J-1.22 E.13557
G1 X72.01 Y145.898 E.48162
G2 X60.99 Y145.898 I-5.51 J.003 E.5317
G1 X60.99 Y161.572 E.48162
G3 X59.01 Y156.497 I5.579 J-5.1 E.17122
G1 X59.01 Y145.902 E.32557
G3 X66.812 Y138.417 I7.492 J.001 E.37113
G3 X73.956 Y145.098 I-.323 J7.505 E.32728
G3 X74.706 Y144.91 I.87 J1.879 E.02389
G1 X81.75 Y144.911 E.21646
G3 X82.989 Y146.151 I-.074 J1.312 E.05895
G1 X82.99 Y154.193 E.24712
G3 X81.694 Y155.49 I-1.3 J-.004 E.06251
G1 X74.704 Y155.49 E.21478
G3 X74.046 Y155.361 I.119 J-2.357 E.02066
; WIPE_START
M204 S6000
G1 X73.984 Y156.789 E-.54318
G1 X73.929 Y157.357 E-.21682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X74.032 Y154.354 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42093
G1 F9523.557
M204 S6000
G1 X73.141 Y153.462 E.03885
G1 X73.14 Y152.927 E.01647
G1 X74.527 Y154.314 E.06041
G1 X74.656 Y154.349 E.0041
G2 X75.105 Y154.357 I.265 J-2.263 E.01387
G1 X73.14 Y152.393 E.08559
G1 X73.14 Y151.858 E.01647
G1 X75.64 Y154.357 E.10889
G1 X76.174 Y154.357 E.01647
G1 X73.14 Y151.323 E.13219
G1 X73.14 Y150.788 E.01647
G1 X76.709 Y154.357 E.15548
G1 X77.243 Y154.357 E.01647
G1 X73.139 Y150.253 E.17878
G1 X73.139 Y149.719 E.01647
G1 X77.778 Y154.357 E.20208
G1 X78.313 Y154.357 E.01647
G1 X73.139 Y149.184 E.22537
G1 X73.139 Y148.649 E.01647
G1 X78.847 Y154.357 E.24867
G1 X79.382 Y154.357 E.01647
G1 X73.139 Y148.114 E.27197
G1 X73.138 Y147.579 E.01647
G1 X79.916 Y154.357 E.29526
G1 X80.451 Y154.357 E.01647
G1 X73.138 Y147.045 E.31856
G1 X73.138 Y146.807 E.0073
G1 X73.413 Y146.785 E.0085
G1 X80.986 Y154.357 E.32987
G1 X81.52 Y154.357 E.01647
G1 X73.595 Y146.432 E.34523
G1 X73.988 Y146.29 E.01286
G1 X81.855 Y154.158 E.34271
G1 X81.858 Y153.626 E.01639
G1 X74.381 Y146.149 E.32571
G3 X74.809 Y146.042 I.442 J.862 E.01371
G1 X81.857 Y153.091 E.30706
G1 X81.857 Y152.556 E.01647
G1 X75.343 Y146.042 E.28377
G1 X75.878 Y146.042 E.01647
G1 X81.857 Y152.022 E.26047
G1 X81.857 Y151.487 E.01647
G1 X76.413 Y146.042 E.23718
G1 X76.947 Y146.042 E.01647
G1 X81.857 Y150.952 E.21388
G1 X81.857 Y150.418 E.01647
G1 X77.482 Y146.043 E.19059
G1 X78.017 Y146.043 E.01647
G1 X81.857 Y149.883 E.16729
G1 X81.857 Y149.348 E.01647
G1 X78.551 Y146.043 E.144
G1 X79.086 Y146.043 E.01647
G1 X81.857 Y148.814 E.1207
G1 X81.857 Y148.279 E.01647
G1 X79.621 Y146.043 E.09741
G1 X80.155 Y146.043 E.01647
G1 X81.857 Y147.744 E.07411
G1 X81.857 Y147.21 E.01647
G1 X80.69 Y146.043 E.05082
G1 X81.225 Y146.043 E.01647
G1 X82.026 Y146.845 E.03491
M204 S10000
G1 X73.088 Y146.477 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.161246
G1 F15000
M204 S6000
G1 X73.063 Y146.162 E.00305
; LINE_WIDTH: 0.118705
G1 X73.037 Y145.847 E.00195
; WIPE_START
G1 X73.063 Y146.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.957 Y153.794 Z1 F42000
G1 X72.896 Y158.155 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.533251
M73 P44 R14
G1 F7341.981
M204 S6000
G1 X72.842 Y158.526 E.01498
; LINE_WIDTH: 0.494416
G1 F7973.496
G1 X72.821 Y158.655 E.00481
; LINE_WIDTH: 0.451646
G1 F8807.872
G1 X72.799 Y158.784 E.00436
; LINE_WIDTH: 0.406142
G1 F9911.294
G1 X72.722 Y159.202 E.01258
; LINE_WIDTH: 0.357901
G1 F11429.273
G1 X72.644 Y159.62 E.01091
M204 S10000
G1 X72.457 Y160.326 F42000
; LINE_WIDTH: 0.108642
G1 F15000
M204 S6000
G1 X72.224 Y160.99 E.00377
; WIPE_START
G1 X72.457 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.837 Y160.759 Z1 F42000
G1 X60.776 Y160.99 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.108639
G1 F15000
M204 S6000
G1 X60.542 Y160.326 E.00377
M204 S10000
G1 X60.356 Y159.62 F42000
; LINE_WIDTH: 0.357669
G1 F11437.684
M204 S6000
G1 X60.279 Y159.203 E.01087
; LINE_WIDTH: 0.405437
G1 F9930.587
G1 X60.201 Y158.786 E.01252
; LINE_WIDTH: 0.454017
G1 F8757.067
G1 X60.176 Y158.635 E.00514
; LINE_WIDTH: 0.503433
G1 F7817.383
G1 X60.152 Y158.483 E.00576
; LINE_WIDTH: 0.539426
G1 F7250.667
G1 X60.104 Y158.155 E.01344
; OBJECT_ID: 3
; WIPE_START
G1 X60.152 Y158.483 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X55.056 Y152.801 Z1 F42000
G1 X26.709 Y121.186 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X26.609 Y120.822 E.01251
G3 X26.391 Y119.01 I7.605 J-1.837 E.06071
G1 X26.391 Y95.99 E.76359
G3 X34.19 Y88.191 I7.826 J.027 E.40603
G1 X87.71 Y88.191 E1.77533
G3 X95.509 Y95.99 I-.024 J7.823 E.40607
G1 X95.509 Y119.01 E.76359
G3 X87.71 Y126.809 I-7.823 J-.024 E.40607
G1 X34.19 Y126.809 E1.77533
G3 X26.777 Y121.412 I.024 J-7.823 E.32503
G1 X26.726 Y121.244 E.00583
M204 S10000
G1 X27.103 Y121.068 F42000
G1 F8843.478
M204 S6000
G1 X26.943 Y120.444 E.02137
G3 X26.798 Y119.006 I7.271 J-1.457 E.04802
G1 X26.798 Y95.994 E.76333
G3 X34.194 Y88.598 I7.419 J.022 E.38508
G1 X87.706 Y88.598 E1.77508
G3 X95.102 Y95.994 I-.019 J7.416 E.38512
G1 X95.102 Y119.006 E.76333
G3 X87.706 Y126.402 I-7.416 J-.019 E.38512
G1 X34.194 Y126.402 E1.77508
G3 X27.164 Y121.286 I.019 J-7.416 E.30819
G1 X27.119 Y121.126 E.00553
M204 S250
G1 X27.475 Y120.967 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X27.456 Y120.902 E.00209
G3 X27.19 Y119.002 I6.757 J-1.915 E.05913
G1 X27.19 Y95.998 E.70685
G3 X34.198 Y88.99 I7.026 J.018 E.33801
G1 X87.702 Y88.99 E1.64403
G3 X94.71 Y95.998 I-.015 J7.023 E.33805
G1 X94.71 Y119.002 E.70685
G3 X87.702 Y126.01 I-7.023 J-.015 E.33805
G1 X34.198 Y126.01 E1.64403
G3 X27.727 Y121.681 I.015 J-7.023 E.25355
G1 X27.495 Y121.024 E.02142
; WIPE_START
M204 S6000
G1 X27.456 Y120.902 E-.04867
G1 X27.325 Y120.368 E-.20906
G1 X27.239 Y119.824 E-.20926
G1 X27.193 Y119.054 E-.29301
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.304 Y114.481 Z1 F42000
G1 X68.941 Y87.809 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y87.809 E.62195
G3 X95.891 Y96.01 I-.006 J8.207 E.42723
G1 X95.891 Y118.99 E.76229
G3 X87.69 Y127.191 I-8.207 J-.006 E.42723
G1 X34.21 Y127.191 E1.77403
G3 X26.009 Y118.987 I.006 J-8.207 E.42732
G1 X26.009 Y96.01 E.7622
G3 X34.21 Y87.809 I8.207 J.006 E.42723
G1 X52.959 Y87.809 E.62194
G1 X52.959 Y82.83 E.16517
G3 X53.47 Y82.309 I.501 J-.02 E.0271
G1 X68.46 Y82.31 E.49724
G3 X68.941 Y82.83 I-.012 J.493 E.02621
G1 X68.941 Y87.749 E.16318
M204 S10000
G1 X69.348 Y87.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y87.402 E.60858
G3 X96.298 Y96.006 I-.01 J8.614 E.44816
G1 X96.298 Y118.994 E.76256
G3 X87.694 Y127.598 I-8.614 J-.01 E.44816
G1 X34.206 Y127.598 E1.7743
G3 X25.602 Y118.992 I.01 J-8.614 E.44822
G1 X25.602 Y96.006 E.76251
G3 X34.206 Y87.402 I8.614 J.01 E.44816
G1 X52.552 Y87.402 E.60858
G1 X52.552 Y82.818 E.15207
G3 X53.462 Y81.902 I.911 J-.005 E.04759
G1 X68.474 Y81.903 E.498
G3 X69.348 Y82.818 I-.026 J.9 E.04652
G1 X69.348 Y87.342 E.15008
M204 S250
G1 X69.74 Y87.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y87.01 E.5518
G3 X96.69 Y96.002 I-.015 J9.007 E.43382
G1 X96.69 Y118.998 E.7066
G3 X87.698 Y127.99 I-9.007 J-.015 E.43382
G1 X34.202 Y127.99 E1.64378
G3 X25.21 Y118.997 I.015 J-9.007 E.43384
G1 X25.21 Y96.002 E.70658
G3 X34.202 Y87.01 I9.007 J.015 E.43382
G1 X52.16 Y87.01 E.5518
G1 X52.16 Y82.806 E.12917
G3 X53.454 Y81.51 I1.306 J.01 E.06238
G1 X68.489 Y81.511 E.46197
G3 X69.74 Y82.806 I-.041 J1.292 E.06122
G1 X69.74 Y86.95 E.12733
; WIPE_START
M204 S6000
G1 X71.74 Y86.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.998 Y85.488 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.517605
G1 F7583.976
M204 S6000
G1 X66.235 Y85.488 E.00919
G1 X66.235 Y85.013 E.01835
G1 X55.665 Y85.013 E.40882
G1 X55.665 Y85.487 E.01837
G1 X65.938 Y85.488 E.39735
M204 S10000
G1 X66.661 Y85.913 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.66 Y84.587 E.04075
G1 X55.24 Y84.587 E.3509
G1 X55.238 Y85.913 E.04077
G1 X66.601 Y85.913 E.34914
M204 S10000
G1 X67.039 Y86.291 F42000
G1 F9547.299
M204 S6000
G1 X67.036 Y84.21 E.06392
G1 X54.863 Y84.21 E.37404
G1 X54.861 Y86.291 E.06394
G1 X66.979 Y86.291 E.37234
M204 S10000
G1 X67.416 Y86.668 F42000
G1 F9547.299
M204 S6000
G1 X67.413 Y83.833 E.08709
G1 X54.486 Y83.832 E.39719
G1 X54.484 Y86.668 E.08711
G1 X67.356 Y86.668 E.39553
M204 S10000
G1 X67.794 Y87.045 F42000
G1 F9547.299
M204 S6000
G1 X67.79 Y83.456 E.11026
G1 X54.11 Y83.455 E.42034
G1 X54.106 Y87.045 E.11029
G1 X67.734 Y87.045 E.41873
M204 S10000
G1 X68.171 Y87.422 F42000
G1 F9547.299
M204 S6000
G1 X68.166 Y83.079 E.13343
G1 X53.733 Y83.078 E.44348
G1 X53.729 Y87.422 E.13346
G1 X68.111 Y87.422 E.44193
M204 S10000
G1 X68.549 Y87.799 F42000
G1 F9547.299
M204 S6000
G1 X68.543 Y82.84 E.15237
G1 X68.509 Y82.744 E.00314
G1 X68.372 Y82.702 E.0044
G1 X53.489 Y82.701 E.45729
G1 X53.39 Y82.739 E.00328
G1 X53.356 Y82.841 E.0033
G1 X53.351 Y87.799 E.15233
G1 X68.489 Y87.799 E.46512
; OBJECT_ID: 1
; WIPE_START
G1 X66.489 Y87.799 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X69.914 Y80.978 Z1 F42000
G1 X93.073 Y34.858 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X93.275 Y35.144 E.01161
G3 X94.509 Y39.19 I-6.088 J4.069 E.14235
G1 X94.509 Y62.21 E.76359
G3 X87.21 Y69.509 I-7.322 J-.023 E.38003
G1 X33.69 Y69.509 E1.77533
G3 X26.391 Y62.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E.76359
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X92.936 Y34.679 I-.023 J7.322 E.21857
G1 X93.037 Y34.81 E.0055
M204 S10000
G1 X92.744 Y35.097 F42000
G1 F8843.478
M204 S6000
G1 X92.936 Y35.369 E.01104
G3 X94.102 Y39.194 I-5.748 J3.843 E.13457
G1 X94.102 Y62.206 E.76333
G3 X87.206 Y69.102 I-6.915 J-.018 E.35908
G1 X33.694 Y69.102 E1.77508
G3 X26.798 Y62.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E.76333
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X92.617 Y34.93 I-.018 J6.915 E.20651
G1 X92.708 Y35.049 E.00497
M204 S250
G1 X92.427 Y35.327 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X92.609 Y35.586 E.00973
G3 X93.71 Y39.198 I-5.421 J3.626 E.1177
G1 X93.71 Y62.202 E.70685
G3 X87.202 Y68.71 I-6.522 J-.014 E.31393
G1 X33.698 Y68.71 E1.64403
G3 X27.19 Y62.202 I.014 J-6.522 E.31393
G1 X27.19 Y39.198 E.70685
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.202 Y32.69 E1.64403
G3 X92.309 Y35.173 I-.014 J6.522 E.18052
G1 X92.391 Y35.28 E.00414
; WIPE_START
M204 S6000
G1 X92.609 Y35.586 E-.14307
G1 X93 Y36.244 E-.29094
G1 X93.214 Y36.709 E-.19425
G1 X93.328 Y37.036 E-.13174
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.877 Y35.381 Z1 F42000
G1 X68.441 Y31.509 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
M73 P45 R14
G3 X94.891 Y39.21 I-.004 J7.704 E.40121
G1 X94.891 Y62.19 E.76229
G3 X87.19 Y69.891 I-7.706 J-.005 E.40119
G1 X33.71 Y69.891 E1.77403
G3 X26.009 Y62.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E.76229
G3 X33.713 Y31.509 I7.706 J.005 E.40128
G1 X52.459 Y31.509 E.62185
G1 X52.459 Y26.53 E.16517
G3 X52.97 Y26.009 I.495 J-.026 E.02719
G1 X67.96 Y26.01 E.49725
G3 X68.441 Y26.53 I-.012 J.493 E.0262
G1 X68.441 Y31.449 E.16318
M204 S10000
M73 P45 R13
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I-.008 J8.112 E.42214
G1 X95.298 Y62.194 E.76256
G3 X87.194 Y70.298 I-8.113 J-.009 E.42212
G1 X33.706 Y70.298 E1.77431
G3 X25.602 Y62.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E.76256
G3 X33.708 Y31.102 I8.113 J.009 E.42218
G1 X52.052 Y31.102 E.60852
G1 X52.052 Y26.518 E.15207
G3 X52.962 Y25.602 I.901 J-.015 E.04773
G1 X67.975 Y25.603 E.498
G3 X68.848 Y26.518 I-.027 J.9 E.04652
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X95.69 Y39.202 I-.013 J8.505 E.40971
G1 X95.69 Y62.198 E.7066
G3 X87.198 Y70.69 I-8.506 J-.014 E.4097
G1 X33.702 Y70.69 E1.64378
G3 X25.21 Y62.198 I.014 J-8.506 E.4097
G1 X25.21 Y39.202 E.7066
G3 X33.703 Y30.71 I8.506 J.014 E.40972
G1 X51.66 Y30.71 E.55178
G1 X51.66 Y26.506 E.12917
G3 X52.954 Y25.21 I1.293 J-.003 E.06255
G1 X67.989 Y25.211 E.46198
G3 X69.24 Y26.506 I-.041 J1.292 E.06122
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.616 Y31.006 Z1 F42000
G1 X52.851 Y31.499 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X68.049 Y31.499 E.46697
G1 X68.043 Y26.54 E.15237
G1 X68.009 Y26.443 E.00314
G1 X67.872 Y26.402 E.0044
G1 X52.989 Y26.401 E.4573
G1 X52.89 Y26.439 E.00326
G1 X52.856 Y26.541 E.00331
G1 X52.851 Y31.439 E.15049
M204 S10000
G1 X65.498 Y29.188 F42000
; LINE_WIDTH: 0.5176
G1 F7584.057
M204 S6000
G1 X65.735 Y29.188 E.00919
G1 X65.735 Y28.713 E.01835
G1 X55.165 Y28.713 E.40882
G1 X55.165 Y29.188 E.01837
G1 X65.438 Y29.188 E.39735
M204 S10000
G1 X66.161 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.287 E.04075
G1 X54.74 Y28.287 E.3509
G1 X54.738 Y29.613 E.04077
G1 X66.101 Y29.613 E.34914
M204 S10000
G1 X66.539 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.91 E.06392
G1 X54.363 Y27.91 E.37404
G1 X54.361 Y29.991 E.06394
G1 X66.479 Y29.991 E.37234
M204 S10000
G1 X66.916 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.533 E.08709
G1 X53.986 Y27.532 E.39719
G1 X53.984 Y30.368 E.08711
G1 X66.856 Y30.368 E.39553
M204 S10000
G1 X67.294 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.156 E.11026
G1 X53.61 Y27.155 E.42034
G1 X53.606 Y30.745 E.11029
G1 X67.234 Y30.745 E.41873
M204 S10000
G1 X67.671 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.779 E.13343
G1 X53.233 Y26.778 E.44348
G1 X53.229 Y31.122 E.13346
G1 X67.611 Y31.122 E.44193
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.611 Y31.122 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 4/15
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z1 I-.483 J1.117 P1  F42000
G1 X218.891 Y97.393 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X218.886 Y100.336 I-76.938 J1.348 E.09763
G3 X218.729 Y101.505 I-6.415 J-.269 E.0392
G1 X218.509 Y101.483 E.00732
G1 X218.509 Y88.489 E.43102
G2 X206.891 Y88.489 I-5.809 J.011 E.60468
G1 X206.891 Y101.487 E.43116
G1 X206.672 Y101.51 E.00729
G3 X206.509 Y100.089 I6.81 J-1.502 E.04754
G1 X206.509 Y88.509 E.38412
G3 X213.054 Y82.318 I6.194 J-.007 E.33463
G3 X218.843 Y87.734 I-.358 J6.184 E.28534
G1 X219 Y89.234 E.05001
G1 X220.271 Y88.826 E.04429
G3 X220.42 Y88.808 I.171 J.785 E.00497
G1 X227.458 Y88.812 E.23347
G3 X227.89 Y89.283 I-.059 J.487 E.0231
G1 X227.891 Y97.279 E.26523
G3 X227.37 Y97.79 I-.495 J.016 E.02719
G1 X220.419 Y97.79 E.23059
G3 X220.294 Y97.777 I-.003 J-.601 E.00416
G1 X218.949 Y97.408 E.04628
M204 S10000
G1 X219.298 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X219.293 Y100.351 I-63.47 J1.083 E.08044
G3 X218.279 Y103.619 I-6.716 J-.292 E.11474
G1 X218.102 Y103.568 E.00612
G1 X218.102 Y88.493 E.50007
G2 X207.298 Y88.493 I-5.402 J.007 E.56252
G1 X207.298 Y103.568 E.50006
G1 X207.121 Y103.619 E.00612
G3 X206.102 Y100.093 I5.598 J-3.527 E.12336
G1 X206.102 Y88.505 E.38438
G3 X213.078 Y81.912 I6.601 J-.003 E.35648
G3 X219.247 Y87.684 I-.382 J6.591 E.30411
G1 X219.352 Y88.693 E.03366
G1 X220.162 Y88.433 E.02821
G3 X220.412 Y88.401 I.28 J1.174 E.00836
G1 X227.435 Y88.402 E.23298
G3 X228.297 Y89.266 I-.046 J.908 E.04437
G1 X228.298 Y97.287 E.26607
G3 X227.382 Y98.197 I-.901 J.009 E.04774
G1 X220.411 Y98.197 E.23124
G3 X220.202 Y98.174 I.006 J-1.036 E.00698
G1 X219.356 Y97.942 E.02912
M204 S250
G1 X219.69 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X219.67 Y100.633 I-28.775 J.828 E.06738
G3 X217.71 Y104.972 I-6.983 J-.541 E.14928
G1 X217.71 Y88.497 E.50624
G2 X207.69 Y88.497 I-5.01 J.003 E.48344
G1 X207.69 Y104.972 E.50624
G3 X205.71 Y100.097 I5.021 J-4.879 E.16577
G1 X205.71 Y88.501 E.3563
G3 X213.1 Y81.52 I6.993 J.001 E.3497
G3 X219.692 Y88.172 I-.424 J7.012 E.31498
G3 X220.404 Y88.009 I.849 J2.064 E.02254
G1 X227.45 Y88.01 E.21651
G3 X228.689 Y89.249 I-.066 J1.304 E.059
G1 X228.69 Y97.295 E.24722
G3 X227.394 Y98.589 I-1.293 J.001 E.06255
G1 X220.404 Y98.589 E.21478
G3 X219.746 Y98.461 I.12 J-2.368 E.02066
; WIPE_START
M204 S6000
G1 X219.69 Y100.097 E-.62199
G1 X219.676 Y100.459 E-.13801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.593 Y101.696 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.546629
G1 F7146.985
M204 S6000
G1 X218.557 Y101.949 E.01051
; LINE_WIDTH: 0.526884
G1 F7438.578
G1 X218.538 Y102.067 E.00469
; LINE_WIDTH: 0.488428
G1 F8080.665
G1 X218.519 Y102.184 E.00432
; LINE_WIDTH: 0.447404
G1 F8900.235
G1 X218.436 Y102.634 E.01508
; LINE_WIDTH: 0.403842
G1 F9974.476
G1 X218.353 Y103.084 E.01346
; WIPE_START
G1 X218.436 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X225.078 Y98.875 Z1.2 F42000
G1 X227.285 Y97.626 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4275
G1 F9360.861
M204 S6000
G2 X227.545 Y97.35 I-.743 J-.962 E.01195
G2 X227.558 Y97.262 I-.188 J-.071 E.00279
G1 X227.558 Y96.809 E.0142
G1 X226.91 Y97.457 E.02868
G1 X226.367 Y97.457 E.01704
G1 X227.557 Y96.266 E.05278
G1 X227.557 Y95.722 E.01704
G1 X225.823 Y97.457 E.07688
G1 X225.279 Y97.457 E.01704
G1 X227.557 Y95.178 E.10098
G1 X227.557 Y94.634 E.01704
G1 X224.735 Y97.457 E.12508
G1 X224.191 Y97.457 E.01704
G1 X227.557 Y94.09 E.14918
G1 X227.557 Y93.547 E.01704
G1 X223.647 Y97.457 E.17328
G1 X223.103 Y97.457 E.01704
G1 X227.557 Y93.003 E.19738
G1 X227.557 Y92.459 E.01704
G1 X222.559 Y97.457 E.22148
G1 X222.016 Y97.457 E.01704
G1 X227.557 Y91.915 E.24558
G1 X227.557 Y91.371 E.01704
G1 X221.472 Y97.457 E.26968
G1 X220.928 Y97.457 E.01704
G1 X227.557 Y90.828 E.29379
G1 X227.557 Y90.284 E.01704
G1 X220.389 Y97.452 E.31768
G1 X219.957 Y97.339 E.01397
G1 X227.557 Y89.74 E.3368
G1 X227.556 Y89.323 E.01307
G2 X227.529 Y89.223 I-.145 J-.014 E.0033
G1 X219.53 Y97.222 E.3545
G1 X219.104 Y97.105 E.01387
G1 X227.066 Y89.142 E.35291
G1 X226.523 Y89.142 E.01704
G1 X218.841 Y96.824 E.34045
G1 X218.841 Y96.28 E.01704
G1 X225.979 Y89.142 E.31636
G1 X225.435 Y89.142 E.01704
G1 X218.84 Y95.737 E.29227
G1 X218.84 Y95.193 E.01704
G1 X224.891 Y89.142 E.26818
G1 X224.348 Y89.142 E.01704
M73 P46 R13
G1 X218.84 Y94.649 E.24408
G1 X218.84 Y94.106 E.01704
G1 X223.804 Y89.142 E.21999
G1 X223.26 Y89.142 E.01704
G1 X218.84 Y93.562 E.1959
G1 X218.84 Y93.018 E.01704
G1 X222.716 Y89.142 E.17181
G1 X222.172 Y89.142 E.01704
G1 X218.839 Y92.475 E.14772
G1 X218.839 Y91.931 E.01704
G1 X221.629 Y89.141 E.12362
G1 X221.085 Y89.141 E.01704
G1 X218.839 Y91.387 E.09953
G1 X218.839 Y90.843 E.01704
G1 X220.541 Y89.141 E.07544
G2 X220.343 Y89.153 I-.051 J.818 E.00624
G1 X219.817 Y89.322 E.01731
G1 X218.669 Y90.469 E.05087
M204 S10000
G1 X218.769 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136102
G1 F15000
M204 S6000
G1 X218.753 Y89.229 E.00222
; LINE_WIDTH: 0.109987
G1 X218.738 Y88.937 E.0016
; WIPE_START
G1 X218.753 Y89.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X213.422 Y94.691 Z1.2 F42000
G1 X206.526 Y101.755 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.541246
G1 F7224.189
M204 S6000
G1 X206.843 Y101.95 E.01512
G1 X206.862 Y102.067 E.00482
; LINE_WIDTH: 0.488356
G1 F8081.98
G1 X206.881 Y102.184 E.00431
; LINE_WIDTH: 0.447415
G1 F8899.986
G1 X206.964 Y102.634 E.01509
; LINE_WIDTH: 0.403925
G1 F9972.159
G1 X207.047 Y103.084 E.01346
; OBJECT_ID: 6
; WIPE_START
G1 X206.964 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X199.549 Y100.824 Z1.2 F42000
G1 X185.491 Y97.393 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X185.486 Y100.336 I-76.646 J1.348 E.09763
G3 X185.328 Y101.51 I-6.445 J-.271 E.03937
G1 X185.109 Y101.487 E.00729
G1 X185.109 Y88.489 E.43116
G2 X173.491 Y88.489 I-5.809 J.011 E.60468
G1 X173.491 Y101.487 E.43116
G1 X173.272 Y101.51 E.00729
G3 X173.109 Y100.089 I6.803 J-1.501 E.04754
G1 X173.109 Y88.509 E.38412
G3 X179.65 Y82.318 I6.194 J-.007 E.33449
G3 X185.443 Y87.735 I-.354 J6.185 E.2855
G1 X185.6 Y89.234 E.05
G1 X186.906 Y88.818 E.04549
G3 X187.029 Y88.808 I.112 J.63 E.00409
G1 X194.015 Y88.809 E.23174
G3 X194.49 Y89.28 I-.021 J.496 E.02432
G1 X194.491 Y97.271 E.2651
G3 X193.97 Y97.79 I-.495 J.023 E.02745
G1 X187.019 Y97.79 E.23059
G3 X186.894 Y97.777 I-.003 J-.605 E.00417
G1 X185.549 Y97.408 E.04628
M204 S10000
G1 X185.898 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X185.893 Y100.351 I-63.235 J1.083 E.08044
G3 X184.879 Y103.619 I-6.715 J-.292 E.11474
G1 X184.702 Y103.568 E.00612
G1 X184.702 Y88.493 E.50006
G2 X173.898 Y88.493 I-5.402 J.007 E.56252
G1 X173.898 Y103.568 E.50007
G1 X173.721 Y103.619 E.00612
G3 X172.702 Y100.093 I5.596 J-3.527 E.12336
G1 X172.702 Y88.505 E.38438
G3 X179.675 Y81.912 I6.601 J-.003 E.35639
G3 X185.847 Y87.684 I-.379 J6.591 E.3042
G1 X185.953 Y88.693 E.03365
G1 X186.762 Y88.434 E.0282
G3 X187.017 Y88.401 I.253 J.966 E.00856
G1 X194.033 Y88.402 E.23271
G3 X194.897 Y89.264 I-.043 J.908 E.04438
G1 X194.898 Y97.283 E.266
G3 X193.982 Y98.197 I-.901 J.013 E.04788
G1 X187.011 Y98.197 E.23124
G3 X186.802 Y98.174 I.006 J-1.038 E.00698
G1 X185.956 Y97.942 E.02912
M204 S250
G1 X186.29 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X186.27 Y100.633 I-28.748 J.828 E.06738
G3 X184.31 Y104.972 I-6.983 J-.541 E.14928
G1 X184.31 Y88.497 E.50624
G2 X174.29 Y88.497 I-5.01 J.003 E.48344
G1 X174.29 Y104.972 E.50624
G3 X172.31 Y100.097 I5.021 J-4.879 E.16577
G1 X172.31 Y88.501 E.3563
G3 X179.699 Y81.52 I6.993 J.001 E.34967
G3 X186.292 Y88.172 I-.428 J7.018 E.31495
G3 X187.006 Y88.009 I.814 J1.915 E.02262
G1 X194.05 Y88.01 E.21643
G3 X195.289 Y89.248 I-.065 J1.304 E.05901
G1 X195.29 Y97.293 E.24719
G3 X193.994 Y98.589 I-1.293 J.003 E.06259
G1 X187.004 Y98.589 E.21478
G3 X186.346 Y98.461 I.121 J-2.369 E.02066
; WIPE_START
M204 S6000
G1 X186.29 Y100.096 E-.62197
G1 X186.276 Y100.459 E-.13803
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.478 Y101.744 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545161
G1 F7167.884
M204 S6000
G1 X185.157 Y101.95 E.01559
; LINE_WIDTH: 0.526732
G1 F7440.917
G1 X185.138 Y102.067 E.00468
; LINE_WIDTH: 0.488297
G1 F8083.038
G1 X185.119 Y102.184 E.00431
; LINE_WIDTH: 0.447344
G1 F8901.563
G1 X185.036 Y102.634 E.01508
; LINE_WIDTH: 0.403902
G1 F9972.82
G1 X184.953 Y103.084 E.01346
; WIPE_START
G1 X185.036 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X191.679 Y98.876 Z1.2 F42000
G1 X193.887 Y97.626 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42754
G1 F9359.887
M204 S6000
G1 X194.129 Y97.384 E.01073
G2 X194.158 Y97.245 I-.198 J-.113 E.00451
G1 X194.158 Y96.811 E.0136
G1 X193.512 Y97.457 E.0286
G1 X192.968 Y97.457 E.01705
G1 X194.157 Y96.267 E.0527
G1 X194.157 Y95.724 E.01705
G1 X192.425 Y97.457 E.07681
G1 X191.881 Y97.457 E.01705
G1 X194.157 Y95.18 E.10091
G1 X194.157 Y94.636 E.01705
G1 X191.337 Y97.457 E.12502
G1 X190.793 Y97.457 E.01705
G1 X194.157 Y94.092 E.14912
G1 X194.157 Y93.548 E.01705
G1 X190.249 Y97.457 E.17323
G1 X189.705 Y97.457 E.01705
G1 X194.157 Y93.004 E.19734
G1 X194.157 Y92.46 E.01705
G1 X189.161 Y97.457 E.22144
G1 X188.617 Y97.457 E.01705
G1 X194.157 Y91.917 E.24555
G1 X194.157 Y91.373 E.01705
G1 X188.073 Y97.457 E.26965
G1 X187.529 Y97.457 E.01705
G1 X194.157 Y90.829 E.29376
G1 X194.157 Y90.285 E.01705
G1 X186.99 Y97.452 E.31766
G1 X186.558 Y97.34 E.01398
G1 X194.157 Y89.741 E.33679
G1 X194.156 Y89.316 E.01333
G2 X194.129 Y89.225 I-.132 J-.009 E.00304
G1 X186.131 Y97.223 E.35448
G1 X185.704 Y97.106 E.01387
G1 X193.667 Y89.142 E.35296
G1 X193.124 Y89.142 E.01705
G1 X185.441 Y96.825 E.34053
G1 X185.441 Y96.281 E.01704
G1 X192.58 Y89.142 E.31643
G1 X192.036 Y89.142 E.01704
G1 X185.44 Y95.738 E.29234
G1 X185.44 Y95.194 E.01704
G1 X191.492 Y89.142 E.26824
G1 X190.948 Y89.142 E.01704
G1 X185.44 Y94.65 E.24414
G1 X185.44 Y94.106 E.01704
G1 X190.404 Y89.142 E.22005
G1 X189.861 Y89.142 E.01704
G1 X185.44 Y93.563 E.19595
G1 X185.44 Y93.019 E.01704
G1 X189.317 Y89.142 E.17185
G1 X188.773 Y89.142 E.01705
G1 X185.439 Y92.475 E.14775
G1 X185.439 Y91.931 E.01704
G1 X188.229 Y89.141 E.12366
G1 X187.685 Y89.141 E.01704
G1 X185.439 Y91.388 E.09956
G1 X185.439 Y90.844 E.01704
G1 X187.141 Y89.141 E.07546
G2 X186.942 Y89.153 I-.047 J.879 E.00629
G1 X186.417 Y89.322 E.01726
G1 X185.269 Y90.47 E.05089
M204 S10000
G1 X185.369 Y89.522 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136218
G1 F15000
M204 S6000
G1 X185.354 Y89.229 E.00223
; LINE_WIDTH: 0.110013
G1 X185.338 Y88.936 E.0016
; WIPE_START
G1 X185.354 Y89.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X180.073 Y94.74 Z1.2 F42000
G1 X173.404 Y101.701 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.525107
G1 F7465.986
M204 S6000
G1 X173.443 Y101.945 E.00969
; LINE_WIDTH: 0.486841
G1 F8109.562
G1 X173.482 Y102.188 E.00892
; LINE_WIDTH: 0.446325
G1 F8924.04
G1 X173.564 Y102.634 E.0149
; LINE_WIDTH: 0.403574
G1 F9981.865
G1 X173.646 Y103.08 E.01332
; OBJECT_ID: 5
; WIPE_START
G1 X173.564 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X166.149 Y100.824 Z1.2 F42000
G1 X152.091 Y97.392 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.091 Y100.389 E.09942
G3 X151.927 Y101.778 I-6.976 J-.118 E.04648
G1 X151.709 Y101.755 E.00727
G1 X151.709 Y88.189 E.44999
G2 X140.691 Y88.189 I-5.509 J.011 E.57342
G1 X140.691 Y101.755 E.44999
G1 X140.473 Y101.778 E.00727
G3 X140.309 Y100.389 I6.473 J-1.467 E.04648
G1 X140.309 Y88.209 E.40403
G3 X146.365 Y82.312 I5.9 J0 E.31258
G3 X152.069 Y87.699 I-.166 J5.89 E.28483
G1 X152.169 Y89.234 E.051
G1 X153.474 Y88.825 E.04535
G3 X153.619 Y88.808 I.167 J.786 E.00485
G1 X160.658 Y88.812 E.23348
G3 X161.09 Y89.28 I-.062 J.491 E.02294
G1 X161.091 Y97.279 E.26536
G3 X160.57 Y97.79 I-.495 J.016 E.02718
G1 X153.619 Y97.79 E.23059
G3 X153.494 Y97.778 I-.003 J-.602 E.00415
G1 X152.149 Y97.408 E.0463
M204 S10000
G1 X152.498 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X152.493 Y100.645 I-69.434 J1.234 E.0902
G3 X151.478 Y103.833 I-6.39 J-.279 E.1123
G1 X151.302 Y103.782 E.00608
G1 X151.302 Y88.193 E.51711
G2 X141.098 Y88.193 I-5.102 J.007 E.53125
G1 X141.098 Y103.78 E.51705
G1 X140.923 Y103.832 E.00605
G3 X139.902 Y100.393 I5.276 J-3.437 E.12066
G1 X139.902 Y88.205 E.4043
G3 X146.374 Y81.905 I6.308 J.005 E.33393
G3 X152.475 Y87.665 I-.175 J6.297 E.30461
G1 X152.542 Y88.69 E.03409
G1 X153.368 Y88.432 E.0287
G3 X153.611 Y88.401 I.274 J1.175 E.00817
G1 X160.635 Y88.402 E.23299
G3 X161.497 Y89.264 I-.053 J.914 E.04423
G1 X161.498 Y97.287 E.26615
G3 X160.582 Y98.197 I-.901 J.009 E.04773
G1 X153.611 Y98.197 E.23124
G3 X153.403 Y98.174 I.006 J-1.036 E.00697
G1 X152.556 Y97.942 E.02913
M204 S250
G1 X152.89 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.885 Y100.66 I-56.682 J.978 E.06822
G3 X150.91 Y105.149 I-6.747 J-.29 E.1542
G1 X150.91 Y88.197 E.52089
G2 X141.49 Y88.197 I-4.71 J.003 E.45448
G1 X141.49 Y105.149 E.52089
G3 X139.51 Y100.397 I4.72 J-4.755 E.16235
G1 X139.51 Y88.201 E.37475
G3 X146.382 Y81.513 I6.701 J.01 E.32838
G3 X152.901 Y88.167 I-.201 J6.718 E.31626
G3 X153.604 Y88.009 I.839 J2.084 E.02225
G1 X160.65 Y88.01 E.21652
G3 X161.889 Y89.249 I-.073 J1.312 E.0589
G1 X161.89 Y97.295 E.24724
G3 X160.594 Y98.589 I-1.293 J.001 E.06254
G1 X153.604 Y98.589 E.21478
G3 X152.946 Y98.461 I.12 J-2.362 E.02066
; WIPE_START
M204 S6000
G1 X152.89 Y100.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.074 Y102.013 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.527821
G1 F7424.198
M204 S6000
G1 X151.755 Y102.215 E.01493
; LINE_WIDTH: 0.524086
G1 F7481.83
G1 X151.737 Y102.321 E.00419
; LINE_WIDTH: 0.488762
G1 F8074.611
G1 X151.72 Y102.426 E.00388
; LINE_WIDTH: 0.449379
G1 F8857
G1 X151.637 Y102.867 E.01487
; LINE_WIDTH: 0.405913
G1 F9917.554
G1 X151.554 Y103.308 E.01328
; WIPE_START
G1 X151.637 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.204 Y98.977 Z1.2 F42000
G1 X160.485 Y97.626 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42761
G1 F9358.184
M204 S6000
G2 X160.745 Y97.35 I-.741 J-.96 E.01195
G2 X160.758 Y97.263 I-.187 J-.071 E.00278
G1 X160.758 Y96.809 E.01422
G1 X160.11 Y97.457 E.02869
G1 X159.566 Y97.457 E.01705
G1 X160.757 Y96.265 E.05281
G1 X160.757 Y95.721 E.01705
G1 X159.022 Y97.457 E.07692
G1 X158.478 Y97.457 E.01705
G1 X160.757 Y95.178 E.10104
G1 X160.757 Y94.634 E.01705
G1 X157.934 Y97.457 E.12515
G1 X157.39 Y97.457 E.01705
G1 X160.757 Y94.09 E.14927
G1 X160.757 Y93.546 E.01705
G1 X156.846 Y97.457 E.17338
G1 X156.302 Y97.457 E.01705
G1 X160.757 Y93.002 E.19749
G1 X160.757 Y92.458 E.01705
G1 X155.758 Y97.457 E.22161
G1 X155.214 Y97.457 E.01705
G1 X160.757 Y91.914 E.24572
G1 X160.757 Y91.37 E.01705
G1 X154.67 Y97.457 E.26984
G1 X154.126 Y97.457 E.01705
G1 X160.757 Y90.826 E.29395
G1 X160.757 Y90.282 E.01705
G1 X153.587 Y97.452 E.31785
G1 X153.156 Y97.339 E.01397
G1 X160.757 Y89.738 E.33696
G1 X160.756 Y89.317 E.01321
G2 X160.727 Y89.224 I-.135 J-.008 E.00313
G1 X152.729 Y97.222 E.35456
G1 X152.302 Y97.104 E.01387
G1 X160.264 Y89.142 E.35297
G1 X159.72 Y89.142 E.01705
G1 X152.042 Y96.82 E.34036
G1 X152.042 Y96.276 E.01705
G1 X159.176 Y89.142 E.31625
G1 X158.632 Y89.142 E.01705
G1 X152.042 Y95.732 E.29213
G1 X152.042 Y95.188 E.01705
G1 X158.088 Y89.142 E.26802
G1 X157.544 Y89.142 E.01705
G1 X152.042 Y94.644 E.24391
G1 X152.042 Y94.1 E.01705
G1 X157 Y89.142 E.21979
G1 X156.456 Y89.142 E.01705
G1 X152.042 Y93.556 E.19568
G1 X152.042 Y93.012 E.01705
G1 X155.912 Y89.142 E.17156
G1 X155.368 Y89.142 E.01705
G1 X152.042 Y92.468 E.14745
G1 X152.042 Y91.924 E.01705
G1 X154.824 Y89.142 E.12334
G1 X154.281 Y89.141 E.01705
G1 X152.042 Y91.38 E.09922
G1 X152.042 Y90.836 E.01705
G1 X153.737 Y89.141 E.07511
G2 X153.544 Y89.153 I-.049 J.815 E.00606
G1 X153.016 Y89.318 E.01734
G1 X151.873 Y90.461 E.05069
M204 S10000
G1 X151.948 Y89.516 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104307
G1 F15000
M204 S6000
G1 X151.939 Y89.226 E.00145
; WIPE_START
G1 X151.948 Y89.516 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.75 Y95.104 Z1.2 F42000
G1 X140.324 Y102.012 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.526631
G1 F7442.461
M204 S6000
G1 X140.645 Y102.215 E.01499
G1 X140.663 Y102.321 E.0042
; LINE_WIDTH: 0.488807
G1 F8073.799
G1 X140.68 Y102.426 E.00388
; LINE_WIDTH: 0.449416
G1 F8856.187
G1 X140.763 Y102.867 E.01487
; LINE_WIDTH: 0.405927
G1 F9917.181
G1 X140.846 Y103.308 E.01328
; OBJECT_ID: 4
; WIPE_START
G1 X140.763 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X133.367 Y100.982 Z1.2 F42000
G1 X119.291 Y97.393 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.291 Y100.589 E.10601
G3 X119.127 Y101.957 I-6.436 J-.079 E.04578
G1 X118.909 Y101.933 E.00726
G1 X118.909 Y87.99 E.46252
G2 X108.291 Y87.99 I-5.309 J.011 E.55258
G1 X108.291 Y101.933 E.46252
G1 X108.073 Y101.957 E.00726
G3 X107.909 Y100.589 I6.249 J-1.444 E.04578
G1 X107.909 Y88.01 E.41729
G3 X113.827 Y82.314 I5.692 J-.008 E.30434
G3 X119.282 Y87.678 I-.228 J5.688 E.27827
G1 X119.338 Y89.194 E.05033
G1 X120.727 Y88.815 E.04776
G3 X120.819 Y88.809 I.088 J.611 E.00306
G1 X127.809 Y88.81 E.23189
G3 X128.29 Y89.281 I-.016 J.497 E.02451
G1 X128.291 Y97.28 E.26535
G3 X127.77 Y97.79 I-.495 J.016 E.02719
G1 X120.819 Y97.79 E.23058
G3 X120.694 Y97.778 I-.003 J-.603 E.00418
G1 X119.349 Y97.409 E.04627
M204 S10000
G1 X119.698 Y97.927 F42000
G1 F8843.478
M204 S6000
G1 X119.698 Y100.593 E.08845
G3 X118.677 Y103.976 I-6.116 J-.001 E.11889
G1 X118.502 Y103.924 E.00605
G1 X118.502 Y87.994 E.52843
G2 X108.698 Y87.994 I-4.902 J.007 E.51042
G1 X108.698 Y103.922 E.52836
G1 X108.522 Y103.973 E.00607
G3 X107.502 Y100.593 I5.089 J-3.38 E.1188
G1 X107.502 Y88.006 E.41757
G3 X113.846 Y81.908 I6.099 J-.004 E.32605
G3 X119.688 Y87.655 I-.247 J6.094 E.29809
G1 X119.726 Y88.665 E.03354
G1 X120.602 Y88.424 E.03016
G3 X120.811 Y88.402 I.215 J1.016 E.00698
G1 X127.829 Y88.403 E.23281
G3 X128.697 Y89.265 I-.041 J.909 E.04448
G1 X128.698 Y97.288 E.26614
G3 X127.782 Y98.198 I-.901 J.009 E.04773
G1 X120.811 Y98.198 E.23124
G3 X120.602 Y98.175 I.006 J-1.037 E.00699
G1 X119.756 Y97.943 E.02912
M204 S250
G1 X120.09 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X120.085 Y100.857 I-60.741 J1.078 E.07425
G3 X118.11 Y105.265 I-6.545 J-.286 E.152
G1 X118.11 Y87.997 E.53059
G2 X109.09 Y87.997 I-4.51 J.003 E.43518
G1 X109.09 Y105.265 E.53059
G3 X107.11 Y100.597 I4.52 J-4.671 E.16005
G1 X107.11 Y88.002 E.38703
G3 X113.864 Y81.516 I6.491 J0 E.32139
G3 X120.099 Y88.156 I-.284 J6.514 E.30984
G3 X120.804 Y88.01 I.823 J2.191 E.02221
G1 X127.849 Y88.011 E.21646
G3 X129.089 Y89.249 I-.066 J1.306 E.05902
M73 P47 R13
G1 X129.09 Y97.295 E.24724
G3 X127.794 Y98.59 I-1.293 J.001 E.06255
G1 X120.804 Y98.59 E.21478
G3 X120.146 Y98.461 I.121 J-2.372 E.02066
; WIPE_START
M204 S6000
G1 X120.095 Y100.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.275 Y102.19 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.515389
G1 F7619.554
M204 S6000
G1 X118.954 Y102.392 E.01461
; LINE_WIDTH: 0.52223
G1 F7510.803
G1 X118.937 Y102.49 E.00386
; LINE_WIDTH: 0.488997
G1 F8070.364
G1 X118.92 Y102.587 E.00359
; LINE_WIDTH: 0.450763
G1 F8826.925
G1 X118.837 Y103.022 E.01472
; LINE_WIDTH: 0.407521
G1 F9873.807
G1 X118.754 Y103.457 E.01316
; WIPE_START
G1 X118.837 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.241 Y98.869 Z1.2 F42000
G1 X127.155 Y97.627 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42094
G1 F9523.306
M204 S6000
G1 X127.958 Y96.824 E.03497
G1 X127.957 Y96.29 E.01647
G1 X126.79 Y97.457 E.05087
G1 X126.255 Y97.457 E.01647
G1 X127.957 Y95.755 E.07415
G1 X127.957 Y95.22 E.01647
G1 X125.721 Y97.457 E.09744
G1 X125.186 Y97.457 E.01647
G1 X127.957 Y94.686 E.12072
G1 X127.957 Y94.151 E.01647
G1 X124.651 Y97.457 E.14401
G1 X124.117 Y97.457 E.01647
G1 X127.957 Y93.617 E.1673
G1 X127.957 Y93.082 E.01647
G1 X123.582 Y97.457 E.19058
G1 X123.048 Y97.457 E.01647
G1 X127.957 Y92.548 E.21387
G1 X127.957 Y92.013 E.01647
G1 X122.513 Y97.457 E.23715
G1 X121.978 Y97.457 E.01647
G1 X127.957 Y91.479 E.26044
G1 X127.957 Y90.944 E.01647
G1 X121.444 Y97.457 E.28372
G1 X120.909 Y97.457 E.01647
G1 X127.957 Y90.41 E.30701
G1 X127.957 Y89.875 E.01647
G1 X120.463 Y97.369 E.32646
G1 X120.043 Y97.254 E.0134
G1 X127.956 Y89.341 E.34473
G2 X127.772 Y89.143 I-.179 J-.018 E.00944
G1 X127.619 Y89.143 E.00468
G1 X119.623 Y97.139 E.34833
G1 X119.242 Y97.035 E.01217
G1 X119.242 Y96.986 E.00151
G1 X127.085 Y89.143 E.34165
G1 X126.55 Y89.143 E.01646
G1 X119.242 Y96.451 E.31836
G1 X119.242 Y95.916 E.01647
G1 X126.016 Y89.143 E.29508
G1 X125.481 Y89.143 E.01647
G1 X119.242 Y95.382 E.27179
G1 X119.242 Y94.847 E.01647
G1 X124.947 Y89.143 E.24851
G1 X124.412 Y89.143 E.01646
G1 X119.242 Y94.313 E.22522
G1 X119.242 Y93.778 E.01647
G1 X123.878 Y89.142 E.20194
G1 X123.343 Y89.142 E.01646
G1 X119.242 Y93.243 E.17865
G1 X119.242 Y92.709 E.01647
G1 X122.809 Y89.142 E.15537
G1 X122.274 Y89.142 E.01646
G1 X119.242 Y92.174 E.13208
G1 X119.242 Y91.64 E.01647
G1 X121.74 Y89.142 E.1088
G1 X121.205 Y89.142 E.01647
G1 X119.242 Y91.105 E.08551
G1 X119.242 Y90.57 E.01647
G1 X120.628 Y89.185 E.06035
G1 X119.891 Y89.388 E.02355
G1 X119.073 Y90.205 E.03563
; WIPE_START
G1 X119.891 Y89.388 E-.43952
G1 X120.628 Y89.185 E-.29054
G1 X120.572 Y89.241 E-.02994
; WIPE_END
G1 E-.03999 F1800
M204 S10000
G1 X115.239 Y94.701 Z1.2 F42000
G1 X107.925 Y102.19 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.516548
G1 F7600.907
M204 S6000
G1 X108.246 Y102.392 E.01464
G1 X108.263 Y102.49 E.00381
; LINE_WIDTH: 0.489026
G1 F8069.83
G1 X108.28 Y102.587 E.00359
; LINE_WIDTH: 0.450765
G1 F8826.893
G1 X108.363 Y103.022 E.01472
; LINE_WIDTH: 0.407454
G1 F9875.631
G1 X108.446 Y103.457 E.01316
; OBJECT_ID: 2
; WIPE_START
G1 X108.363 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X108.267 Y95.39 Z1.2 F42000
G1 X107.891 Y65.334 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X107.866 Y65.272 E.00219
G3 X107.291 Y62.41 I6.947 J-2.886 E.09748
G1 X107.291 Y39.39 E.76359
G3 X114.79 Y31.891 I7.523 J.023 E.39045
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.023 J7.523 E.39045
G1 X175.809 Y62.41 E.76359
G3 X168.31 Y69.909 I-7.523 J-.023 E.39045
G1 X114.79 Y69.909 E1.77533
G3 X108.253 Y66.067 I.023 J-7.523 E.26364
G1 X107.918 Y65.387 E.02513
M204 S10000
G1 X108.257 Y65.156 F42000
G1 F8843.478
M204 S6000
G1 X108.242 Y65.117 E.0014
G3 X107.698 Y62.406 I6.571 J-2.73 E.0923
G1 X107.698 Y39.394 E.76333
G3 X114.794 Y32.298 I7.115 J.019 E.3695
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.019 J7.115 E.3695
G1 X175.402 Y62.406 E.76333
G3 X168.306 Y69.502 I-7.115 J-.019 E.3695
G1 X114.794 Y69.502 E1.77508
G3 X108.608 Y65.868 I.019 J-7.115 E.24946
G1 X108.283 Y65.21 E.02433
M204 S250
G1 X108.609 Y64.985 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X108.604 Y64.966 E.0006
G3 X108.09 Y62.402 I6.208 J-2.579 E.08088
G1 X108.09 Y39.398 E.70685
G3 X114.798 Y32.69 I6.722 J.015 E.32357
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.015 J6.722 E.32357
G1 X175.01 Y62.402 E.70685
G3 X168.302 Y69.11 I-6.722 J-.015 E.32357
G1 X114.798 Y69.11 E1.64403
G3 X108.95 Y65.677 I.015 J-6.722 E.21842
G1 X108.636 Y65.039 E.02183
; WIPE_START
M204 S6000
G1 X108.604 Y64.966 E-.0301
G1 X108.418 Y64.474 E-.20017
G1 X108.219 Y63.709 E-.30019
G1 X108.136 Y63.189 E-.20031
G1 X108.132 Y63.112 E-.02923
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.199 Y58.481 Z1.2 F42000
G1 X149.541 Y31.509 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I.006 J7.895 E.41177
G1 X176.191 Y62.39 E.76229
G3 X168.29 Y70.291 I-7.895 J.006 E.41177
G1 X114.81 Y70.291 E1.77403
G3 X106.909 Y62.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E.76229
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.53 E.16517
G3 X134.08 Y26.009 I.495 J-.026 E.02753
G1 X149.056 Y26.01 E.49678
G3 X149.541 Y26.52 I-.008 J.493 E.02599
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I.002 J8.302 E.4327
G1 X176.598 Y62.394 E.76256
G3 X168.294 Y70.698 I-8.302 J.002 E.4327
G1 X114.806 Y70.698 E1.7743
G3 X106.502 Y62.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E.76256
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.518 E.15207
G3 X134.068 Y25.602 I.901 J-.015 E.04794
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
G3 X176.99 Y39.402 I-.002 J8.694 E.41951
G1 X176.99 Y62.398 E.7066
G3 X176.004 Y66.419 I-8.725 J-.009 E.12843
G3 X168.298 Y71.09 I-7.708 J-4.024 E.29106
G1 X114.802 Y71.09 E1.64378
G3 X106.11 Y62.398 I.014 J-8.706 E.41935
G1 X106.11 Y39.402 E.7066
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.506 E.12917
G3 X134.056 Y25.21 I1.292 J-.004 E.06262
G1 X149.084 Y25.211 E.46177
G3 X150.34 Y26.504 I-.037 J1.292 E.0613
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.149 Y31.499 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X149.147 Y26.566 E.15156
G1 X149.104 Y26.441 E.00405
G1 X148.969 Y26.402 E.00432
G1 X134.038 Y26.411 E.45877
G1 X133.956 Y26.51 E.00394
G1 X133.951 Y31.499 E.15329
G1 X149.089 Y31.499 E.46512
M204 S10000
G1 X136.498 Y29.19 F42000
; LINE_WIDTH: 0.51509
G1 F7624.377
M204 S6000
G1 X146.837 Y29.188 E.39779
G1 X146.837 Y28.714 E.01823
G1 X136.263 Y28.719 E.40683
G1 X136.263 Y29.19 E.0181
G1 X136.438 Y29.19 E.00675
M204 S10000
G1 X135.838 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.263 Y29.613 E.35102
G1 X147.262 Y28.288 E.04071
G1 X135.84 Y28.296 E.35096
G1 X135.839 Y29.553 E.03865
M204 S10000
G1 X135.461 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X147.64 Y29.991 E.37421
G1 X147.639 Y27.911 E.06389
G1 X135.463 Y27.919 E.37412
G1 X135.461 Y29.931 E.06181
M204 S10000
G1 X135.084 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X148.017 Y30.368 E.3974
G1 X148.016 Y27.534 E.08707
G1 X135.086 Y27.542 E.39727
G1 X135.084 Y30.308 E.08498
M204 S10000
G1 X134.706 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X148.394 Y30.745 E.42059
G1 X148.393 Y27.157 E.11025
G1 X134.71 Y27.165 E.42043
G1 X134.706 Y30.685 E.10814
M204 S10000
G1 X134.329 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X148.772 Y31.122 E.44378
G1 X148.77 Y26.779 E.13343
G1 X134.333 Y26.788 E.44358
G1 X134.329 Y31.062 E.13131
; OBJECT_ID: 8
; WIPE_START
G1 X134.331 Y29.062 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X129.701 Y35.13 Z1.2 F42000
G1 X38.791 Y154.293 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X38.786 Y157.051 I-69.872 J1.248 E.09152
G3 X38.627 Y158.232 I-6.895 J-.326 E.03957
G1 X38.409 Y158.209 E.00727
G1 X38.409 Y145.59 E.4186
G2 X26.391 Y145.59 I-6.009 J.011 E.62552
G1 X26.391 Y158.209 E.4186
G1 X26.173 Y158.232 E.00727
G3 X26.009 Y156.789 I7.017 J-1.528 E.04826
G1 X26.009 Y145.61 E.37084
G3 X32.495 Y139.21 I6.401 J.001 E.33631
G3 X38.721 Y144.657 I-.096 J6.392 E.29841
G1 X38.912 Y146.142 E.04967
G1 X40.204 Y145.719 E.0451
G3 X40.33 Y145.708 I.114 J.628 E.00419
M73 P48 R13
G1 X47.309 Y145.71 E.23152
G3 X47.79 Y146.184 I-.021 J.502 E.02456
G1 X47.791 Y154.172 E.26497
G3 X47.27 Y154.69 I-.495 J.023 E.02745
G1 X40.319 Y154.69 E.23059
G3 X40.194 Y154.678 I-.003 J-.604 E.00416
G1 X38.849 Y154.309 E.04628
M204 S10000
G1 X39.198 Y154.827 F42000
G1 F8843.478
M204 S6000
G3 X39.193 Y157.067 I-56.781 J.983 E.07434
G3 X38.182 Y160.374 I-6.834 J-.28 E.11596
G1 X38.002 Y160.325 E.00619
G1 X38.002 Y145.593 E.48868
G2 X26.798 Y145.593 I-5.602 J.007 E.58336
G1 X26.798 Y160.325 E.48868
G1 X26.618 Y160.374 E.00619
G3 X25.602 Y156.793 I5.921 J-3.615 E.12501
G1 X25.602 Y145.605 E.37112
G3 X32.504 Y138.803 I6.809 J.006 E.35766
G3 X39.123 Y144.597 I-.106 J6.799 E.31733
G1 X39.253 Y145.601 E.03358
G1 X40.057 Y145.335 E.02808
G3 X40.318 Y145.301 I.259 J.963 E.00876
G1 X47.329 Y145.302 E.23258
G3 X48.197 Y146.166 I-.048 J.916 E.04448
G1 X48.198 Y154.183 E.26592
G3 X47.282 Y155.097 I-.901 J.013 E.04788
G1 X40.311 Y155.097 E.23124
G3 X40.102 Y155.075 I.006 J-1.039 E.00698
G1 X39.256 Y154.842 E.02912
M204 S250
G1 X39.59 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X39.568 Y157.366 I-25.704 J.728 E.06226
G3 X37.61 Y161.753 I-7.248 J-.605 E.15041
G1 X37.61 Y145.597 E.49641
G2 X27.19 Y145.597 I-5.21 J.003 E.50274
G1 X27.19 Y161.753 E.49641
G3 X25.21 Y156.797 I5.265 J-4.977 E.16793
G1 X25.21 Y145.601 E.34401
G3 X32.512 Y138.411 I7.202 J.011 E.35035
G3 X39.581 Y145.079 I-.133 J7.221 E.32752
G3 X40.306 Y144.909 I.827 J1.892 E.02302
G1 X47.348 Y144.91 E.21639
G3 X48.589 Y146.15 I-.073 J1.314 E.05896
G1 X48.59 Y154.194 E.24717
G3 X47.294 Y155.489 I-1.293 J.003 E.06259
G1 X40.304 Y155.489 E.21478
G3 X39.646 Y155.361 I.12 J-2.366 E.02066
; WIPE_START
M204 S6000
G1 X39.59 Y156.797 E-.54615
G1 X39.568 Y157.359 E-.21385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.495 Y158.423 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532243
G1 F7357.11
M204 S6000
G1 X38.443 Y158.774 E.01414
; LINE_WIDTH: 0.495799
G1 F7949.151
G1 X38.421 Y158.9 E.00472
; LINE_WIDTH: 0.45308
G1 F8777.072
G1 X38.4 Y159.026 E.00428
; LINE_WIDTH: 0.407744
G1 F9867.77
G1 X38.322 Y159.437 E.01243
; LINE_WIDTH: 0.359782
G1 F11361.435
G1 X38.244 Y159.847 E.01079
; WIPE_START
G1 X38.322 Y159.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X44.999 Y155.738 Z1.2 F42000
G1 X47.187 Y154.527 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42725
G1 F9366.95
M204 S6000
G1 X47.429 Y154.285 E.01071
G2 X47.458 Y154.146 I-.199 J-.114 E.00453
G1 X47.458 Y153.712 E.01357
G1 X46.813 Y154.357 E.02855
G1 X46.269 Y154.357 E.01702
G1 X47.457 Y153.169 E.05262
G1 X47.457 Y152.625 E.01702
G1 X45.726 Y154.357 E.07669
G1 X45.182 Y154.357 E.01702
G1 X47.457 Y152.082 E.10075
G1 X47.457 Y151.539 E.01702
G1 X44.639 Y154.357 E.12482
G1 X44.095 Y154.357 E.01702
G1 X47.457 Y150.995 E.14889
G1 X47.457 Y150.452 E.01702
G1 X43.552 Y154.357 E.17296
G1 X43.008 Y154.357 E.01702
G1 X47.457 Y149.908 E.19703
G1 X47.457 Y149.365 E.01702
G1 X42.465 Y154.357 E.2211
G1 X41.921 Y154.357 E.01702
G1 X47.457 Y148.821 E.24517
G1 X47.457 Y148.278 E.01702
G1 X41.378 Y154.357 E.26924
G1 X40.834 Y154.357 E.01702
G1 X47.457 Y147.734 E.29331
G1 X47.457 Y147.191 E.01702
G1 X40.295 Y154.353 E.3172
G1 X39.863 Y154.241 E.01397
G1 X47.457 Y146.648 E.33633
G1 X47.456 Y146.22 E.01339
G2 X47.43 Y146.13 I-.127 J-.012 E.003
G1 X39.436 Y154.124 E.35406
G1 X39.01 Y154.007 E.01385
G1 X46.974 Y146.043 E.35275
G1 X46.431 Y146.043 E.01702
G1 X38.741 Y153.733 E.34059
G1 X38.741 Y153.189 E.01702
G1 X45.887 Y146.043 E.31653
G1 X45.344 Y146.042 E.01702
G1 X38.74 Y152.646 E.29247
G1 X38.74 Y152.103 E.01702
G1 X44.801 Y146.042 E.26841
G1 X44.257 Y146.042 E.01702
G1 X38.74 Y151.559 E.24435
G1 X38.74 Y151.016 E.01702
G1 X43.714 Y146.042 E.22029
G1 X43.17 Y146.042 E.01702
G1 X38.74 Y150.473 E.19623
G1 X38.739 Y149.929 E.01702
G1 X42.627 Y146.042 E.17217
G1 X42.083 Y146.042 E.01702
G1 X38.739 Y149.386 E.14811
G1 X38.739 Y148.843 E.01702
G1 X41.54 Y146.042 E.12405
G1 X40.996 Y146.042 E.01702
G1 X38.739 Y148.299 E.09999
G1 X38.739 Y147.756 E.01702
G1 X40.453 Y146.042 E.07593
G2 X40.24 Y146.054 I-.052 J.915 E.00668
G1 X39.728 Y146.223 E.01691
G1 X38.569 Y147.382 E.05133
M204 S10000
G1 X38.678 Y146.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.148608
G1 F15000
M204 S6000
G1 X38.658 Y146.119 E.00271
; LINE_WIDTH: 0.114142
G1 X38.638 Y145.805 E.00183
; WIPE_START
G1 X38.658 Y146.119 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.25 Y151.505 Z1.2 F42000
G1 X26.305 Y158.423 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.532899
G1 F7347.263
M204 S6000
G1 X26.357 Y158.769 E.01398
; LINE_WIDTH: 0.499667
G1 F7881.826
G1 X26.375 Y158.878 E.0041
; LINE_WIDTH: 0.462041
G1 F8589.41
G1 X26.394 Y158.986 E.00376
; LINE_WIDTH: 0.424415
G1 F9436.569
G1 X26.413 Y159.095 E.00342
; LINE_WIDTH: 0.388146
G1 F10427.958
G1 X26.484 Y159.471 E.01077
; LINE_WIDTH: 0.353198
G1 F11602.524
G1 X26.556 Y159.847 E.00968
; OBJECT_ID: 9
; WIPE_START
G1 X26.484 Y159.471 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X34.07 Y158.63 Z1.2 F42000
G1 X73.191 Y154.293 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X73.186 Y156.758 I-63.824 J1.098 E.08178
G3 X73.027 Y157.964 I-7.215 J-.334 E.04039
G1 X72.809 Y157.941 E.00728
G1 X72.809 Y145.89 E.39974
G2 X60.191 Y145.89 I-6.309 J.012 E.65672
G1 X60.191 Y157.937 E.39961
G1 X59.973 Y157.961 E.00725
G3 X59.809 Y156.49 I7.598 J-1.594 E.04917
G1 X59.809 Y145.91 E.35095
G3 X66.747 Y139.215 I6.692 J-.007 E.35711
G3 X73.082 Y144.697 I-.261 J6.702 E.30013
G1 X73.322 Y146.177 E.04974
G1 X74.544 Y145.735 E.0431
G3 X74.723 Y145.709 I.181 J.602 E.00602
G1 X81.719 Y145.71 E.23207
G3 X82.19 Y146.19 I-.027 J.497 E.02449
G1 X82.191 Y154.17 E.26469
G3 X81.67 Y154.691 I-.498 J.023 E.02748
G1 X74.719 Y154.691 E.23059
G3 X74.594 Y154.678 I-.003 J-.606 E.00417
G1 X73.249 Y154.309 E.04628
M204 S10000
G1 X73.598 Y154.827 F42000
G1 F8843.478
M204 S6000
G3 X73.593 Y156.774 I-50.41 J.833 E.06459
G3 X72.583 Y160.157 I-7.131 J-.285 E.11833
G1 X72.402 Y160.108 E.00622
G1 X72.402 Y145.894 E.47152
G2 X60.598 Y145.894 I-5.902 J.008 E.61455
G1 X60.598 Y160.108 E.47151
G1 X60.417 Y160.157 E.00622
G3 X59.402 Y156.494 I6.206 J-3.691 E.12758
G1 X59.402 Y145.906 E.35122
G3 X66.765 Y138.808 I7.099 J-.003 E.37878
G3 X73.482 Y144.623 I-.279 J7.109 E.3183
G1 X73.645 Y145.627 E.03374
G1 X74.425 Y145.346 E.02749
G3 X74.714 Y145.302 I.303 J1.018 E.00973
G1 X81.735 Y145.303 E.23291
G3 X82.597 Y146.17 I-.048 J.909 E.04447
G1 X82.598 Y154.182 E.26576
G3 X81.682 Y155.098 I-.906 J.01 E.04786
G1 X74.711 Y155.098 E.23124
G3 X74.502 Y155.075 I.006 J-1.038 E.00698
G1 X73.656 Y154.843 E.02912
M204 S250
G1 X73.99 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X73.94 Y157.366 I-16.947 J.592 E.06226
G3 X72.01 Y161.572 I-7.455 J-.875 E.14455
G1 X72.01 Y145.898 E.48162
G2 X60.99 Y145.898 I-5.51 J.004 E.53164
G1 X60.99 Y161.572 E.48162
G3 X59.01 Y156.497 I5.579 J-5.1 E.17122
G1 X59.01 Y145.902 E.32557
G3 X66.782 Y138.416 I7.492 J.001 E.3702
G3 X73.956 Y145.098 I-.292 J7.506 E.3282
G3 X74.705 Y144.91 I.9 J1.995 E.02384
G1 X81.751 Y144.911 E.2165
G3 X82.989 Y146.151 I-.068 J1.306 E.05901
G1 X82.99 Y154.194 E.24712
G3 X81.694 Y155.49 I-1.3 J-.004 E.06251
G1 X74.704 Y155.49 E.21478
G3 X74.046 Y155.361 I.12 J-2.367 E.02066
; WIPE_START
M204 S6000
G1 X73.984 Y156.789 E-.54307
G1 X73.94 Y157.358 E-.21693
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.896 Y158.155 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533293
G1 F7341.355
M204 S6000
G1 X72.842 Y158.525 E.01497
; LINE_WIDTH: 0.494453
G1 F7972.842
G1 X72.821 Y158.655 E.00482
; LINE_WIDTH: 0.451631
G1 F8808.181
G1 X72.799 Y158.784 E.00436
; LINE_WIDTH: 0.40612
G1 F9911.916
G1 X72.722 Y159.202 E.01258
; LINE_WIDTH: 0.357907
G1 F11429.065
G1 X72.644 Y159.619 E.01091
M204 S10000
G1 X72.457 Y160.326 F42000
; LINE_WIDTH: 0.108593
G1 F15000
M204 S6000
G1 X72.224 Y160.99 E.00376
; WIPE_START
G1 X72.457 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.783 Y156.054 Z1.2 F42000
G1 X81.044 Y154.527 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42613
G1 F9394.326
M204 S6000
G1 X81.858 Y153.714 E.03592
G1 X81.857 Y153.172 E.01692
G1 X80.672 Y154.357 E.05236
G1 X80.13 Y154.357 E.01692
G1 X81.857 Y152.63 E.07629
G1 X81.857 Y152.088 E.01692
G1 X79.588 Y154.357 E.10022
G1 X79.046 Y154.357 E.01692
G1 X81.857 Y151.546 E.12415
G1 X81.857 Y151.004 E.01692
G1 X78.504 Y154.357 E.14807
G1 X77.962 Y154.357 E.01692
G1 X81.857 Y150.462 E.172
G1 X81.857 Y149.921 E.01692
G1 X77.42 Y154.357 E.19593
G1 X76.878 Y154.357 E.01692
G1 X81.857 Y149.379 E.21986
G1 X81.857 Y148.837 E.01692
G1 X76.336 Y154.357 E.24379
G1 X75.794 Y154.357 E.01692
G1 X81.857 Y148.295 E.26772
G1 X81.857 Y147.753 E.01692
G1 X75.252 Y154.357 E.29165
G1 X74.713 Y154.355 E.01685
G1 X81.857 Y147.211 E.31548
G1 X81.857 Y146.669 E.01692
G1 X74.28 Y154.246 E.33461
G1 X73.854 Y154.13 E.01377
G1 X81.838 Y146.146 E.35256
G2 X81.683 Y146.043 I-.192 J.121 E.00598
G1 X81.399 Y146.043 E.00887
G1 X73.429 Y154.013 E.35195
G1 X73.141 Y153.934 E.00934
G1 X73.141 Y153.759 E.00544
G1 X80.857 Y146.043 E.34076
G1 X80.315 Y146.043 E.01692
G1 X73.141 Y153.218 E.31684
G1 X73.14 Y152.676 E.01692
G1 X79.773 Y146.043 E.29292
G1 X79.231 Y146.043 E.01692
G1 X73.14 Y152.134 E.269
G1 X73.14 Y151.592 E.01692
G1 X78.69 Y146.043 E.24508
G1 X78.148 Y146.043 E.01692
G1 X73.14 Y151.051 E.22116
G1 X73.139 Y150.509 E.01692
G1 X77.606 Y146.043 E.19724
G1 X77.064 Y146.043 E.01692
G1 X73.139 Y149.967 E.17332
G1 X73.139 Y149.426 E.01692
G1 X76.522 Y146.042 E.1494
G1 X75.98 Y146.042 E.01692
G1 X73.139 Y148.884 E.12548
G1 X73.139 Y148.342 E.01692
G1 X75.438 Y146.042 E.10156
G1 X74.897 Y146.042 E.01692
G1 X73.138 Y147.8 E.07764
G1 X73.138 Y147.259 E.01692
G1 X74.455 Y145.941 E.05817
; WIPE_START
G1 X73.138 Y147.259 E-.70785
G1 X73.138 Y147.396 E-.05215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X73.037 Y145.847 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.118731
G1 F15000
M204 S6000
G1 X73.063 Y146.162 E.00195
; LINE_WIDTH: 0.161322
G1 X73.088 Y146.478 E.00305
; WIPE_START
G1 X73.063 Y146.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X67.46 Y151.346 Z1.2 F42000
G1 X60.103 Y158.151 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.533668
G1 F7335.746
M204 S6000
G1 X60.158 Y158.526 E.01513
; LINE_WIDTH: 0.494392
G1 F7973.927
G1 X60.179 Y158.655 E.00481
; LINE_WIDTH: 0.451614
G1 F8808.545
G1 X60.201 Y158.784 E.00436
; LINE_WIDTH: 0.406111
G1 F9912.153
G1 X60.278 Y159.202 E.01258
; LINE_WIDTH: 0.357852
G1 F11431.059
G1 X60.356 Y159.619 E.0109
M204 S10000
G1 X60.542 Y160.326 F42000
; LINE_WIDTH: 0.108642
G1 F15000
M204 S6000
G1 X60.776 Y160.99 E.00377
; OBJECT_ID: 3
; WIPE_START
G1 X60.542 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X55.55 Y154.553 Z1.2 F42000
G1 X26.715 Y121.209 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X26.609 Y120.822 E.01329
G3 X26.391 Y119.01 I7.605 J-1.837 E.06071
G1 X26.391 Y95.99 E.76359
G3 X34.19 Y88.191 I7.828 J.029 E.406
G1 X87.71 Y88.191 E1.77533
G3 X95.509 Y95.99 I-.024 J7.823 E.40607
G1 X95.509 Y119.01 E.76359
G3 X87.71 Y126.809 I-7.823 J-.024 E.40607
G1 X34.19 Y126.809 E1.77533
G3 X26.777 Y121.412 I.024 J-7.823 E.32503
G1 X26.733 Y121.266 E.00505
M204 S10000
G1 X27.109 Y121.091 F42000
G1 F8843.478
M204 S6000
G1 X26.943 Y120.444 E.02216
G3 X26.798 Y119.006 I7.271 J-1.457 E.04802
G1 X26.798 Y95.994 E.76333
G3 X34.194 Y88.598 I7.42 J.024 E.38505
G1 X87.706 Y88.598 E1.77508
G3 X95.102 Y95.994 I-.019 J7.416 E.38512
G1 X95.102 Y119.006 E.76333
G3 X87.706 Y126.402 I-7.416 J-.019 E.38512
G1 X34.194 Y126.402 E1.77508
G3 X27.164 Y121.286 I.019 J-7.416 E.30819
G1 X27.125 Y121.148 E.00474
M204 S250
G1 X27.488 Y120.992 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X27.327 Y120.367 E.01982
G3 X27.19 Y119.002 I6.886 J-1.38 E.04223
G1 X27.19 Y95.998 E.70685
G3 X34.198 Y88.99 I7.028 J.02 E.33799
G1 X87.702 Y88.99 E1.64403
G3 X94.71 Y95.998 I-.015 J7.023 E.33805
G1 X94.71 Y119.002 E.70685
G3 X87.702 Y126.01 I-7.023 J-.015 E.33805
G1 X34.198 Y126.01 E1.64403
G3 X27.536 Y121.165 I.015 J-7.023 E.27046
G1 X27.504 Y121.05 E.00369
; WIPE_START
M204 S6000
G1 X27.327 Y120.367 E-.26786
G1 X27.239 Y119.825 E-.20891
G1 X27.195 Y119.081 E-.28324
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.303 Y114.505 Z1.2 F42000
G1 X68.941 Y87.809 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y87.809 E.62194
G3 X95.891 Y96.01 I-.006 J8.207 E.42723
G1 X95.891 Y118.99 E.76229
G3 X87.69 Y127.191 I-8.195 J.006 E.4274
G1 X34.21 Y127.191 E1.77403
M73 P49 R13
G3 X26.009 Y118.99 I.006 J-8.207 E.42723
M73 P49 R12
G1 X26.009 Y96.01 E.76229
G3 X34.21 Y87.809 I8.207 J.006 E.42723
G1 X52.959 Y87.809 E.62194
G1 X52.959 Y82.83 E.16517
G3 X53.47 Y82.309 I.495 J-.026 E.02719
G1 X68.456 Y82.31 E.49711
G3 X68.941 Y82.82 I-.01 J.495 E.02597
G1 X68.941 Y87.749 E.16351
M204 S10000
G1 X69.348 Y87.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y87.402 E.60858
G3 X96.298 Y96.006 I.002 J8.602 E.44833
G1 X96.298 Y118.994 E.76256
G3 X87.694 Y127.598 I-8.602 J.002 E.44833
G1 X34.206 Y127.598 E1.7743
G3 X25.602 Y118.994 I.01 J-8.614 E.44816
G1 X25.602 Y96.006 E.76256
G3 X34.206 Y87.402 I8.614 J.01 E.44816
G1 X52.552 Y87.402 E.60858
G1 X52.552 Y82.818 E.15207
G3 X53.462 Y81.902 I.901 J-.015 E.04773
G1 X68.47 Y81.903 E.49786
G3 X69.348 Y82.812 I-.027 J.905 E.0464
G1 X69.348 Y87.342 E.15027
M204 S250
G1 X69.74 Y87.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y87.01 E.5518
G3 X90.73 Y87.537 I-.015 J9.063 E.09503
G3 X96.69 Y96.002 I-3.058 J8.483 E.33881
G1 X96.69 Y118.998 E.7066
G3 X87.698 Y127.99 I-8.994 J-.002 E.43398
G1 X34.202 Y127.99 E1.64378
G3 X25.21 Y118.998 I.015 J-9.007 E.43382
G1 X25.21 Y96.002 E.7066
G3 X34.202 Y87.01 I8.994 J.002 E.43398
G1 X52.16 Y87.01 E.5518
G1 X52.16 Y82.806 E.12917
G3 X53.454 Y81.51 I1.293 J-.003 E.06255
G1 X68.484 Y81.511 E.46183
G3 X69.74 Y82.804 I-.044 J1.299 E.06121
G1 X69.74 Y86.95 E.12739
; WIPE_START
M204 S6000
G1 X71.74 Y86.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X68.549 Y87.799 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X68.546 Y82.862 E.1517
G1 X68.505 Y82.742 E.00389
G1 X68.369 Y82.702 E.00435
G1 X53.435 Y82.712 E.45888
G1 X53.356 Y82.815 E.00397
G1 X53.351 Y87.799 E.15314
G1 X68.489 Y87.799 E.46512
M204 S10000
G1 X55.898 Y85.49 F42000
; LINE_WIDTH: 0.514861
G1 F7628.084
M204 S6000
G1 X66.237 Y85.488 E.39761
G1 X66.237 Y85.014 E.01822
G1 X55.663 Y85.02 E.40663
G1 X55.663 Y85.49 E.01808
G1 X55.838 Y85.49 E.00674
M204 S10000
G1 X55.238 Y85.913 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.663 Y85.913 E.35102
G1 X66.662 Y84.589 E.04071
G1 X55.24 Y84.596 E.35096
G1 X55.239 Y85.853 E.03862
M204 S10000
G1 X54.861 Y86.291 F42000
G1 F9547.299
M204 S6000
G1 X67.04 Y86.291 E.37421
G1 X67.039 Y84.211 E.06389
G1 X54.863 Y84.22 E.37411
G1 X54.861 Y86.231 E.06179
M204 S10000
G1 X54.484 Y86.668 F42000
G1 F9547.299
M204 S6000
G1 X67.417 Y86.668 E.3974
G1 X67.416 Y83.834 E.08707
G1 X54.486 Y83.843 E.39727
G1 X54.484 Y86.608 E.08495
M204 S10000
G1 X54.106 Y87.045 F42000
G1 F9547.299
M204 S6000
G1 X67.794 Y87.045 E.42059
G1 X67.792 Y83.457 E.11025
G1 X54.11 Y83.466 E.42042
G1 X54.106 Y86.985 E.10812
M204 S10000
G1 X53.729 Y87.422 F42000
G1 F9547.299
M204 S6000
G1 X68.172 Y87.422 E.44378
G1 X68.169 Y83.079 E.13343
G1 X53.733 Y83.089 E.44358
G1 X53.729 Y87.362 E.13128
; OBJECT_ID: 1
; WIPE_START
G1 X53.731 Y85.362 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X58.419 Y79.339 Z1.2 F42000
G1 X93.059 Y34.839 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X93.273 Y35.142 E.01231
G3 X94.509 Y39.19 I-6.086 J4.071 E.14244
G1 X94.509 Y62.21 E.76359
G3 X87.21 Y69.509 I-7.322 J-.023 E.38003
G1 X33.69 Y69.509 E1.77533
G3 X26.391 Y62.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E.76359
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X92.936 Y34.678 I-.023 J7.322 E.21856
G1 X93.023 Y34.791 E.00473
M204 S10000
G1 X92.72 Y35.077 F42000
G1 F8843.478
M204 S6000
G1 X92.935 Y35.368 E.012
G3 X94.102 Y39.194 I-5.748 J3.844 E.13461
G1 X94.102 Y62.206 E.76333
G3 X87.206 Y69.102 I-6.915 J-.018 E.35908
G1 X33.694 Y69.102 E1.77508
G3 X26.798 Y62.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E.76333
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X92.444 Y34.721 I-.018 J6.915 E.19751
G1 X92.684 Y35.029 E.01295
M204 S250
G1 X92.408 Y35.313 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X92.609 Y35.586 E.01041
G3 X93.71 Y39.198 I-5.421 J3.626 E.11772
G1 X93.71 Y62.202 E.70685
G3 X87.202 Y68.71 I-6.522 J-.014 E.31393
G1 X33.698 Y68.71 E1.64403
G3 X27.19 Y62.202 I.014 J-6.522 E.31393
G1 X27.19 Y39.198 E.70685
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.202 Y32.69 E1.64403
G3 X92.146 Y34.975 I-.014 J6.522 E.17266
G1 X92.372 Y35.266 E.01129
; WIPE_START
M204 S6000
G1 X92.609 Y35.586 E-.15148
G1 X92.88 Y36.018 E-.19391
G1 X93.214 Y36.709 E-.29152
G1 X93.327 Y37.013 E-.12308
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.874 Y35.364 Z1.2 F42000
G1 X68.441 Y31.509 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I.006 J7.695 E.40135
G1 X94.891 Y62.19 E.76229
G3 X87.19 Y69.891 I-7.706 J-.005 E.40119
G1 X33.71 Y69.891 E1.77403
G3 X26.009 Y62.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E.76229
G3 X33.71 Y31.509 I7.704 J.003 E.40122
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.53 E.16517
G3 X52.97 Y26.009 I.495 J-.026 E.02719
G1 X67.956 Y26.01 E.49711
G3 X68.441 Y26.53 I-.008 J.494 E.02633
G1 X68.441 Y31.449 E.16318
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I.002 J8.102 E.42228
G1 X95.298 Y62.194 E.76256
G3 X87.194 Y70.298 I-8.113 J-.01 E.42212
G1 X33.706 Y70.298 E1.77431
G3 X25.602 Y62.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E.76256
G3 X33.706 Y31.102 I8.111 J.008 E.42215
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.518 E.15207
G3 X52.962 Y25.602 I.901 J-.015 E.04773
G1 X67.97 Y25.603 E.49786
G3 X68.848 Y26.518 I-.022 J.9 E.04666
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X95.69 Y39.202 I-.002 J8.494 E.40985
G1 X95.69 Y62.198 E.7066
G3 X95.571 Y63.608 I-8.775 J-.029 E.04353
G3 X87.198 Y70.69 I-8.375 J-1.411 E.36631
G1 X33.702 Y70.69 E1.64378
G3 X25.21 Y62.198 I.014 J-8.506 E.4097
G1 X25.21 Y39.202 E.7066
G3 X33.702 Y30.71 I8.504 J.012 E.40973
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.506 E.12917
G3 X52.954 Y25.21 I1.293 J-.003 E.06255
G1 X67.984 Y25.211 E.46183
G3 X69.24 Y26.506 I-.036 J1.292 E.06137
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
M73 P50 R12
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.497 Y29.188 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51762
G1 F7583.738
M204 S6000
G1 X65.735 Y29.188 E.00919
G1 X65.735 Y28.713 E.01836
G1 X55.165 Y28.713 E.40884
G1 X55.165 Y29.187 E.01837
G1 X65.437 Y29.188 E.39737
M204 S10000
G1 X66.161 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.287 E.04075
G1 X54.74 Y28.287 E.3509
G1 X54.738 Y29.613 E.04077
G1 X66.101 Y29.613 E.34914
M204 S10000
G1 X66.539 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.91 E.06392
G1 X54.363 Y27.91 E.37404
G1 X54.361 Y29.991 E.06394
G1 X66.479 Y29.991 E.37234
M204 S10000
G1 X66.916 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.533 E.08709
G1 X53.986 Y27.532 E.39719
G1 X53.984 Y30.368 E.08711
G1 X66.856 Y30.368 E.39553
M204 S10000
G1 X67.294 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.156 E.11026
G1 X53.61 Y27.155 E.42034
G1 X53.606 Y30.745 E.11029
G1 X67.234 Y30.745 E.41873
M204 S10000
G1 X67.671 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.779 E.13343
G1 X53.233 Y26.778 E.44348
G1 X53.229 Y31.122 E.13346
G1 X67.611 Y31.122 E.44193
M204 S10000
G1 X68.049 Y31.499 F42000
G1 F9547.299
M204 S6000
G1 X68.043 Y26.54 E.15238
G1 X68.009 Y26.444 E.00311
G1 X67.869 Y26.402 E.00451
G1 X52.989 Y26.401 E.4572
G1 X52.897 Y26.432 E.00299
G1 X52.856 Y26.552 E.00388
G1 X52.851 Y31.499 E.15201
G1 X67.989 Y31.499 E.46512
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.989 Y31.499 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 5/15
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S175.95
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-.482 J1.118 P1  F42000
G1 X218.891 Y97.392 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X218.886 Y100.336 I-76.944 J1.348 E.09765
G3 X218.728 Y101.51 I-7.122 J-.363 E.03936
G1 X218.509 Y101.487 E.00729
G1 X218.509 Y88.489 E.43117
G2 X206.891 Y88.489 I-5.809 J.011 E.60468
G1 X206.891 Y101.487 E.43116
G1 X206.672 Y101.51 E.00729
G3 X206.609 Y101.199 I4.039 J-.985 E.01053
G3 X206.509 Y100.089 I6.26 J-1.122 E.03703
G1 X206.509 Y88.509 E.38412
G3 X212.888 Y82.312 I6.192 J-.008 E.32911
G3 X218.843 Y87.734 I-.19 J6.189 E.29085
G1 X219 Y89.234 E.05002
G1 X220.271 Y88.826 E.04428
G3 X220.42 Y88.808 I.171 J.785 E.00497
G1 X227.414 Y88.809 E.23203
G3 X227.89 Y89.28 I-.021 J.496 E.02435
G1 X227.891 Y97.279 E.26535
G3 X227.37 Y97.79 I-.495 J.016 E.02719
G1 X220.419 Y97.79 E.23059
G3 X220.294 Y97.777 I-.003 J-.603 E.00417
G1 X218.949 Y97.408 E.04627
M204 S10000
G1 X219.298 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X219.293 Y100.351 I-63.48 J1.083 E.08045
G3 X218.279 Y103.619 I-6.609 J-.259 E.11479
G1 X218.102 Y103.568 E.00612
G1 X218.102 Y88.493 E.50007
G2 X207.298 Y88.493 I-5.402 J.007 E.56252
G1 X207.298 Y103.568 E.50006
G1 X207.121 Y103.619 E.00612
G3 X206.102 Y100.093 I5.689 J-3.553 E.12332
G1 X206.102 Y88.505 E.38438
G3 X212.903 Y81.905 I6.599 J-.004 E.35068
G3 X219.247 Y87.684 I-.205 J6.596 E.30988
G1 X219.353 Y88.693 E.03366
G1 X220.162 Y88.434 E.0282
G3 X220.412 Y88.401 I.28 J1.174 E.00837
G1 X227.432 Y88.402 E.23288
G3 X228.297 Y89.264 I-.043 J.908 E.0444
G1 X228.298 Y97.287 E.26615
G3 X227.382 Y98.197 I-.901 J.009 E.04774
G1 X220.411 Y98.197 E.23124
G3 X220.202 Y98.174 I.006 J-1.036 E.00699
G1 X219.356 Y97.942 E.02912
M204 S250
G1 X219.69 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X219.67 Y100.633 I-28.777 J.828 E.06739
G3 X217.71 Y104.972 I-6.983 J-.541 E.14928
G1 X217.71 Y88.497 E.50624
G2 X207.69 Y88.497 I-5.01 J.003 E.48344
G1 X207.69 Y104.972 E.50624
G3 X205.71 Y100.096 I5.07 J-4.899 E.16571
G1 X205.71 Y88.501 E.3563
G3 X212.918 Y81.514 I6.991 J0 E.34409
G3 X219.692 Y88.172 I-.238 J7.018 E.32056
G3 X220.404 Y88.009 I.849 J2.063 E.02254
G1 X227.449 Y88.01 E.21648
G3 X228.689 Y89.248 I-.064 J1.304 E.05901
G1 X228.69 Y97.295 E.24724
G3 X227.394 Y98.589 I-1.293 J.001 E.06255
G1 X220.404 Y98.589 E.21478
G3 X219.746 Y98.461 I.12 J-2.368 E.02066
; WIPE_START
M204 S6000
G1 X219.69 Y100.096 E-.62201
G1 X219.676 Y100.459 E-.13799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.877 Y101.746 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545173
G1 F7167.714
M204 S6000
G1 X218.557 Y101.95 E.01554
; LINE_WIDTH: 0.526727
G1 F7440.992
G1 X218.538 Y102.067 E.00468
; LINE_WIDTH: 0.488309
G1 F8082.825
G1 X218.519 Y102.184 E.00431
; LINE_WIDTH: 0.447388
G1 F8900.597
G1 X218.436 Y102.634 E.01508
; LINE_WIDTH: 0.403956
G1 F9971.311
G1 X218.353 Y103.084 E.01346
; WIPE_START
G1 X218.436 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X224.961 Y98.675 Z1.4 F42000
G1 X227.543 Y97.108 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X227.343 Y97.441 I-.199 J.107 E.01551
G1 X226.176 Y97.441 E.03871
G2 X224.407 Y96.587 I-1.699 J1.26 E.06779
G2 X223.314 Y97.441 I.811 J2.165 E.04674
G1 X220.935 Y97.441 E.0789
G2 X219.165 Y96.587 I-1.699 J1.26 E.06779
G1 X218.856 Y96.699 E.01092
G1 X218.855 Y94.664 E.0675
G3 X220.803 Y94.084 I1.348 J.967 E.07257
G3 X221.786 Y95.05 I-3.691 J4.74 E.0458
G2 X223.424 Y95.302 I1.056 J-1.418 E.05721
G2 X224.407 Y94.336 I-3.69 J-4.739 E.0458
G3 X226.045 Y94.084 I1.056 J1.418 E.05721
G3 X227.027 Y95.05 I-3.691 J4.74 E.0458
G1 X227.542 Y95.308 E.0191
G1 X227.542 Y92.766 E.08431
G3 X226.372 Y92.407 I-.297 J-1.118 E.04277
G1 X225.717 Y91.716 E.03159
G2 X224.079 Y91.464 I-1.056 J1.418 E.05721
G2 X223.096 Y92.429 I3.691 J4.74 E.0458
G3 X221.459 Y92.681 I-1.056 J-1.418 E.05721
G3 X220.476 Y91.716 I3.691 J-4.74 E.0458
G2 X218.854 Y91.458 I-1.057 J1.419 E.05665
G1 X218.854 Y89.866 E.0528
G1 X219.211 Y89.848 E.01186
G1 X219.188 Y89.539 E.01025
G1 X220.346 Y89.168 E.04035
G3 X221.168 Y89.156 I.458 J3.363 E.02734
G1 X221.786 Y89.809 E.02981
G2 X223.424 Y90.061 I1.056 J-1.418 E.05721
G2 X224.348 Y89.157 I-3.453 J-4.455 E.04297
G1 X226.41 Y89.157 E.0684
G1 X227.027 Y89.809 E.02977
G1 X227.542 Y90.066 E.01907
G1 X227.542 Y91.694 E.05401
M204 S10000
G1 X218.769 Y89.522 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136294
G1 F15000
M204 S6000
G1 X218.754 Y89.229 E.00223
; LINE_WIDTH: 0.110041
G1 X218.738 Y88.936 E.00161
; WIPE_START
G1 X218.754 Y89.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X213.419 Y94.687 Z1.4 F42000
G1 X206.522 Y101.743 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.541168
G1 F7225.329
M204 S6000
G1 X206.843 Y101.95 E.0155
G1 X206.862 Y102.067 E.00481
; LINE_WIDTH: 0.488432
G1 F8080.601
G1 X206.881 Y102.184 E.0043
; LINE_WIDTH: 0.447473
G1 F8898.727
G1 X206.964 Y102.634 E.01509
; LINE_WIDTH: 0.403897
G1 F9972.944
G1 X207.047 Y103.084 E.01346
; OBJECT_ID: 6
; WIPE_START
G1 X206.964 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X199.549 Y100.824 Z1.4 F42000
G1 X185.491 Y97.392 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X185.486 Y100.336 I-76.662 J1.348 E.09765
G3 X185.328 Y101.51 I-6.445 J-.271 E.03937
G1 X185.109 Y101.487 E.00729
G1 X185.109 Y88.489 E.43116
G2 X173.491 Y88.489 I-5.809 J.011 E.60468
G1 X173.491 Y101.487 E.43116
G1 X173.272 Y101.51 E.00729
G3 X173.109 Y100.089 I6.802 J-1.501 E.04754
G1 X173.109 Y88.509 E.38412
G3 X179.488 Y82.312 I6.2 J.001 E.32898
G3 X185.443 Y87.734 I-.2 J6.201 E.29073
G1 X185.6 Y89.234 E.05002
G1 X186.871 Y88.826 E.04429
G3 X187.02 Y88.808 I.171 J.786 E.00496
G1 X194.014 Y88.809 E.23203
G3 X194.49 Y89.28 I-.02 J.495 E.02436
G1 X194.491 Y97.272 E.26512
G3 X193.97 Y97.79 I-.495 J.023 E.02742
G1 X187.019 Y97.79 E.23059
G3 X186.894 Y97.777 I-.003 J-.605 E.00417
G1 X185.549 Y97.408 E.04628
M204 S10000
G1 X185.898 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X185.893 Y100.351 I-63.246 J1.083 E.08045
G3 X184.879 Y103.619 I-6.715 J-.292 E.11474
G1 X184.702 Y103.568 E.00612
G1 X184.702 Y88.493 E.50006
G2 X173.898 Y88.493 I-5.402 J.007 E.56252
G1 X173.898 Y103.568 E.50007
G1 X173.721 Y103.619 E.00612
G3 X172.702 Y100.093 I5.598 J-3.527 E.12336
G1 X172.702 Y88.505 E.38438
G3 X179.503 Y81.905 I6.608 J.006 E.35055
G3 X185.847 Y87.684 I-.216 J6.608 E.30976
G1 X185.953 Y88.693 E.03366
G1 X186.762 Y88.433 E.0282
G3 X187.012 Y88.401 I.28 J1.174 E.00836
G1 X194.032 Y88.402 E.23288
G3 X194.897 Y89.264 I-.042 J.907 E.04441
G1 X194.898 Y97.283 E.266
G3 X193.982 Y98.197 I-.901 J.013 E.04787
G1 X187.011 Y98.197 E.23124
G3 X186.802 Y98.174 I.006 J-1.04 E.00698
G1 X185.956 Y97.942 E.02912
M204 S250
G1 X186.29 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X186.27 Y100.633 I-28.75 J.828 E.06739
G3 X184.31 Y104.972 I-7.042 J-.568 E.14923
G1 X184.31 Y88.497 E.50624
G2 X174.29 Y88.497 I-5.01 J.003 E.48344
G1 X174.29 Y104.972 E.50624
G3 X172.31 Y100.097 I5.021 J-4.879 E.16577
G1 X172.31 Y88.501 E.3563
G3 X179.518 Y81.514 I7.001 J.01 E.34396
G3 X186.293 Y88.172 I-.228 J7.007 E.32068
G3 X187.004 Y88.009 I.849 J2.064 E.02254
G1 X194.049 Y88.01 E.21648
G3 X195.289 Y89.248 I-.064 J1.304 E.05902
G1 X195.29 Y97.293 E.24719
G3 X193.994 Y98.589 I-1.293 J.003 E.06259
G1 X187.004 Y98.589 E.21478
G3 X186.346 Y98.461 I.12 J-2.366 E.02066
; WIPE_START
M204 S6000
G1 X186.29 Y100.096 E-.62202
G1 X186.276 Y100.459 E-.13798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.478 Y101.744 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545481
G1 F7163.309
M204 S6000
G1 X185.157 Y101.95 E.0156
; LINE_WIDTH: 0.526776
G1 F7440.231
G1 X185.138 Y102.067 E.00468
; LINE_WIDTH: 0.488379
G1 F8081.558
G1 X185.119 Y102.184 E.00431
; LINE_WIDTH: 0.447474
G1 F8898.694
G1 X185.036 Y102.634 E.01509
; LINE_WIDTH: 0.404025
G1 F9969.411
G1 X184.953 Y103.084 E.01346
; WIPE_START
G1 X185.036 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X191.561 Y98.675 Z1.4 F42000
G1 X194.143 Y97.109 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X193.943 Y97.441 I-.186 J.115 E.01584
G1 X192.776 Y97.441 E.03871
G2 X191.007 Y96.587 I-1.699 J1.26 E.06779
G2 X189.914 Y97.441 I.811 J2.165 E.04674
G1 X187.535 Y97.441 E.0789
G2 X185.765 Y96.587 I-1.699 J1.26 E.06779
G1 X185.456 Y96.699 E.01092
G1 X185.455 Y94.664 E.0675
G3 X187.403 Y94.084 I1.348 J.967 E.07257
M73 P51 R12
G3 X188.386 Y95.05 I-3.691 J4.74 E.0458
G2 X190.024 Y95.302 I1.056 J-1.418 E.05721
G2 X191.007 Y94.336 I-3.69 J-4.739 E.0458
G3 X192.645 Y94.084 I1.056 J1.418 E.05721
G3 X193.627 Y95.05 I-3.691 J4.74 E.0458
G1 X194.142 Y95.308 E.0191
G1 X194.142 Y92.766 E.08431
G3 X192.972 Y92.407 I-.297 J-1.118 E.04277
G1 X192.317 Y91.716 E.03159
G2 X190.679 Y91.464 I-1.056 J1.418 E.05721
G2 X189.696 Y92.429 I3.691 J4.74 E.0458
G3 X188.059 Y92.681 I-1.056 J-1.418 E.05721
G3 X187.076 Y91.716 I3.691 J-4.74 E.0458
G2 X185.454 Y91.458 I-1.057 J1.419 E.05665
G1 X185.454 Y89.866 E.05282
G1 X185.803 Y89.847 E.01161
G1 X185.787 Y89.539 E.01023
G1 X186.946 Y89.168 E.04038
G3 X187.768 Y89.156 I.458 J3.37 E.02733
G1 X188.386 Y89.809 E.02981
G2 X190.024 Y90.061 I1.056 J-1.418 E.05721
G2 X190.948 Y89.157 I-3.453 J-4.455 E.04297
G1 X193.01 Y89.157 E.0684
G1 X193.627 Y89.809 E.02977
G1 X194.142 Y90.066 E.01907
G1 X194.142 Y91.694 E.05401
M204 S10000
G1 X185.369 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13634
G1 F15000
M204 S6000
G1 X185.354 Y89.228 E.00224
; LINE_WIDTH: 0.110059
G1 X185.338 Y88.935 E.00161
; WIPE_START
G1 X185.354 Y89.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X180.018 Y94.686 Z1.4 F42000
G1 X173.122 Y101.742 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.541042
G1 F7227.147
M204 S6000
G1 X173.443 Y101.95 E.01553
G1 X173.462 Y102.067 E.00481
; LINE_WIDTH: 0.488446
G1 F8080.349
G1 X173.481 Y102.184 E.0043
; LINE_WIDTH: 0.447468
G1 F8898.829
G1 X173.564 Y102.634 E.01509
; LINE_WIDTH: 0.403883
G1 F9973.327
G1 X173.647 Y103.084 E.01346
; OBJECT_ID: 5
; WIPE_START
G1 X173.564 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X166.149 Y100.824 Z1.4 F42000
G1 X152.091 Y97.392 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.091 Y100.389 E.09942
G3 X151.927 Y101.778 I-6.093 J-.014 E.0465
G1 X151.709 Y101.755 E.00727
G1 X151.709 Y88.189 E.44999
G2 X140.691 Y88.189 I-5.509 J.011 E.57342
G1 X140.691 Y101.755 E.44999
G1 X140.473 Y101.778 E.00727
G3 X140.309 Y100.389 I6.475 J-1.467 E.04648
G1 X140.309 Y88.209 E.40403
G3 X146.377 Y82.312 I5.9 J0 E.31297
G3 X152.069 Y87.7 I-.187 J5.899 E.28434
G1 X152.17 Y89.234 E.05102
G1 X153.474 Y88.825 E.04535
G3 X153.619 Y88.808 I.166 J.782 E.00485
G1 X160.609 Y88.809 E.23187
G3 X161.09 Y89.28 I-.012 J.492 E.02456
G1 X161.091 Y97.279 E.26536
G3 X160.57 Y97.79 I-.495 J.016 E.02719
G1 X153.619 Y97.79 E.23059
G3 X153.494 Y97.778 I-.003 J-.601 E.00416
G1 X152.149 Y97.408 E.04629
M204 S10000
G1 X152.498 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X152.493 Y100.645 I-69.431 J1.234 E.0902
G1 X152.483 Y100.809 E.00544
G3 X151.478 Y103.833 I-6.286 J-.41 E.1069
G1 X151.302 Y103.782 E.00608
G1 X151.302 Y88.193 E.51711
G2 X141.098 Y88.193 I-5.102 J.007 E.53126
G1 X141.098 Y103.782 E.51711
G1 X140.922 Y103.833 E.00608
G3 X139.902 Y100.393 I5.296 J-3.442 E.12068
G1 X139.902 Y88.205 E.4043
G3 X146.392 Y81.905 I6.308 J.005 E.33453
G3 X152.475 Y87.665 I-.203 J6.307 E.3039
G1 X152.542 Y88.691 E.0341
G1 X153.368 Y88.432 E.0287
G3 X153.611 Y88.401 I.273 J1.171 E.00817
G1 X160.629 Y88.402 E.23279
G3 X161.497 Y89.264 I-.035 J.903 E.04455
G1 X161.498 Y97.287 E.26615
G3 X160.582 Y98.197 I-.901 J.009 E.04773
G1 X153.611 Y98.197 E.23124
G3 X153.402 Y98.174 I.006 J-1.033 E.00698
G1 X152.556 Y97.942 E.02912
M204 S250
G1 X152.89 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.885 Y100.66 I-56.679 J.978 E.06822
G1 X152.875 Y100.832 E.00527
G3 X150.91 Y105.149 I-6.734 J-.459 E.14893
G1 X150.91 Y88.197 E.52089
G2 X141.49 Y88.197 I-4.71 J.003 E.45448
G1 X141.49 Y105.149 E.52089
G3 X139.51 Y100.397 I4.721 J-4.756 E.16235
G1 X139.51 Y88.201 E.37474
G3 X146.406 Y81.513 I6.7 J.01 E.32912
G3 X152.768 Y86.934 I-.218 J6.7 E.27729
G3 X152.901 Y88.168 I-9.661 J1.664 E.03815
G3 X153.604 Y88.009 I.838 J2.078 E.02225
G1 X160.648 Y88.01 E.21645
G3 X161.889 Y89.249 I-.059 J1.299 E.0591
G1 X161.89 Y97.295 E.24724
G3 X160.594 Y98.589 I-1.293 J.001 E.06254
G1 X153.604 Y98.589 E.21478
G3 X152.946 Y98.461 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X152.89 Y100.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.076 Y102.012 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.527459
G1 F7429.747
M204 S6000
G1 X151.755 Y102.215 E.01501
; LINE_WIDTH: 0.524085
G1 F7481.842
G1 X151.737 Y102.321 E.00419
; LINE_WIDTH: 0.488762
G1 F8074.616
G1 X151.72 Y102.426 E.00388
; LINE_WIDTH: 0.449423
G1 F8856.024
G1 X151.637 Y102.867 E.01487
; LINE_WIDTH: 0.406061
G1 F9913.505
G1 X151.554 Y103.308 E.01328
; WIPE_START
G1 X151.637 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.011 Y103.179 Z1.4 F42000
G1 X140.846 Y103.308 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.40593
G1 F9917.095
M204 S6000
G1 X140.763 Y102.867 E.01328
; LINE_WIDTH: 0.44935
G1 F8857.617
G1 X140.68 Y102.426 E.01487
; LINE_WIDTH: 0.488746
G1 F8074.911
G1 X140.663 Y102.321 E.00388
; LINE_WIDTH: 0.526736
G1 F7440.852
G1 X140.645 Y102.215 E.00421
G1 X140.324 Y102.012 E.01498
; WIPE_START
G1 X140.645 Y102.215 E-.59328
G1 X140.663 Y102.321 E-.16672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.643 Y96.537 Z1.4 F42000
G1 X151.939 Y89.225 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.104368
G1 F15000
M204 S6000
G1 X151.948 Y89.517 E.00146
M204 S10000
G1 X160.742 Y91.626 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X160.742 Y89.998 E.05401
G1 X160.527 Y89.891 E.00794
G2 X159.822 Y89.157 I-3.53 J2.691 E.03383
G1 X157.947 Y89.157 E.0622
G3 X156.924 Y90.143 I-20.31 J-20.055 E.04712
G3 X155.286 Y89.891 I-.582 J-1.669 E.05721
G1 X154.631 Y89.2 E.03159
G2 X153.547 Y89.167 I-.699 J5.286 E.03602
G1 X152.35 Y89.543 E.04163
G1 X152.36 Y89.852 E.01026
G1 X152.057 Y89.862 E.01004
G1 X152.057 Y91.781 E.06365
G1 X152.338 Y91.546 E.01214
G3 X153.976 Y91.798 I.582 J1.67 E.05721
G2 X154.959 Y92.763 I4.674 J-3.774 E.0458
G2 X156.596 Y92.511 I.582 J-1.67 E.05721
G3 X157.579 Y91.546 I4.674 J3.775 E.0458
G3 X159.217 Y91.798 I.582 J1.67 E.05721
G1 X159.872 Y92.489 E.03159
G2 X160.742 Y92.867 I.801 J-.652 E.03269
G1 X160.742 Y95.24 E.07869
G1 X160.527 Y95.132 E.00797
G2 X159.545 Y94.167 I-4.674 J3.774 E.0458
G2 X157.907 Y94.418 I-.582 J1.669 E.05721
G3 X156.924 Y95.384 I-4.673 J-3.774 E.0458
G3 X155.286 Y95.132 I-.582 J-1.67 E.05721
G2 X154.303 Y94.167 I-4.674 J3.775 E.0458
G2 X152.665 Y94.418 I-.582 J1.669 E.05721
G1 X152.057 Y95.06 E.02932
G1 X152.057 Y97.022 E.06507
G1 X152.338 Y96.787 E.01213
G3 X154.357 Y97.442 I.588 J1.63 E.07579
G1 X156.891 Y97.442 E.08406
G3 X157.579 Y96.787 I3.179 J2.653 E.03156
G3 X159.599 Y97.442 I.588 J1.63 E.07579
G2 X160.647 Y97.425 I.472 J-3.373 E.03492
G2 X160.743 Y96.886 I-.414 J-.352 E.01906
; OBJECT_ID: 4
; WIPE_START
G1 X160.736 Y97.331 E-.16924
G1 X160.647 Y97.425 E-.04918
G1 X159.599 Y97.442 E-.39845
G1 X159.34 Y97.168 E-.14313
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X151.707 Y97.211 Z1.4 F42000
G1 X119.291 Y97.393 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X119.291 Y100.589 E.10602
G3 X119.127 Y101.957 I-6.413 J-.076 E.04578
G1 X118.909 Y101.933 E.00726
G1 X118.909 Y87.99 E.46252
G2 X108.291 Y87.99 I-5.309 J.011 E.55258
G1 X108.291 Y101.933 E.46252
G1 X108.073 Y101.957 E.00726
G3 X107.909 Y100.589 I6.25 J-1.444 E.04578
G1 X107.909 Y88.01 E.41728
G3 X113.816 Y82.314 I5.698 J-.002 E.3039
G3 X119.282 Y87.678 I-.216 J5.686 E.27864
G1 X119.337 Y89.194 E.05031
G1 X120.727 Y88.815 E.04777
G3 X120.819 Y88.809 I.088 J.614 E.00306
G1 X127.809 Y88.81 E.23189
G3 X128.29 Y89.28 I-.012 J.492 E.02455
G1 X128.291 Y97.28 E.26536
G3 X127.77 Y97.79 I-.495 J.016 E.02719
G1 X120.819 Y97.79 E.23058
G3 X120.694 Y97.778 I-.003 J-.603 E.00417
G1 X119.349 Y97.409 E.04628
M204 S10000
G1 X119.698 Y97.927 F42000
G1 F8843.478
M204 S6000
G1 X119.698 Y100.593 E.08846
G3 X118.677 Y103.976 I-6.116 J-.001 E.11889
G1 X118.502 Y103.924 E.00605
G1 X118.502 Y87.994 E.52843
G2 X108.698 Y87.994 I-4.902 J.007 E.51042
G1 X108.698 Y103.924 E.52843
G1 X108.523 Y103.976 E.00605
G3 X107.502 Y100.593 I5.095 J-3.383 E.11889
G1 X107.502 Y88.006 E.41756
G3 X113.829 Y81.907 I6.105 J.003 E.32539
G3 X119.688 Y87.655 I-.229 J6.093 E.29867
G1 X119.725 Y88.665 E.03353
G1 X120.602 Y88.424 E.03018
G3 X120.811 Y88.402 I.215 J1.016 E.00698
G1 X127.829 Y88.403 E.2328
G3 X128.697 Y89.264 I-.036 J.903 E.04454
G1 X128.698 Y97.288 E.26615
G3 X127.782 Y98.198 I-.901 J.009 E.04773
G1 X120.811 Y98.198 E.23124
G3 X120.602 Y98.175 I.006 J-1.037 E.00699
G1 X119.756 Y97.943 E.02912
M204 S250
G1 X120.09 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X120.085 Y100.857 I-60.744 J1.078 E.07425
G3 X118.11 Y105.265 I-6.516 J-.273 E.15204
G1 X118.11 Y87.997 E.53059
G2 X109.09 Y87.997 I-4.51 J.003 E.43518
G1 X109.09 Y105.265 E.53059
G3 X107.11 Y100.597 I4.565 J-4.69 E.15999
G1 X107.11 Y88.002 E.38703
G3 X113.841 Y81.515 I6.491 J0 E.32068
G3 X115.604 Y81.828 I-.318 J6.917 E.05518
G3 X119.674 Y85.718 I-2.002 J6.169 E.17894
G3 X120.099 Y88.156 I-6.369 J2.365 E.07647
G3 X120.804 Y88.01 I.823 J2.193 E.02222
G1 X127.849 Y88.011 E.21646
G3 X129.089 Y89.249 I-.059 J1.299 E.05909
G1 X129.09 Y97.295 E.24724
G3 X127.794 Y98.59 I-1.293 J.001 E.06255
G1 X120.804 Y98.59 E.21477
G3 X120.146 Y98.461 I.12 J-2.368 E.02066
; WIPE_START
M204 S6000
G1 X120.095 Y100.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.275 Y102.19 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.515434
G1 F7618.828
M204 S6000
G1 X118.954 Y102.392 E.01461
; LINE_WIDTH: 0.522244
G1 F7510.577
G1 X118.937 Y102.49 E.00386
; LINE_WIDTH: 0.489042
G1 F8069.552
G1 X118.92 Y102.587 E.00359
; LINE_WIDTH: 0.450787
G1 F8826.42
G1 X118.837 Y103.022 E.01472
; LINE_WIDTH: 0.407502
G1 F9874.319
G1 X118.754 Y103.457 E.01316
; WIPE_START
G1 X118.837 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.211 Y103.341 Z1.4 F42000
G1 X108.446 Y103.457 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.407435
G1 F9876.146
M204 S6000
G1 X108.363 Y103.022 E.01316
; LINE_WIDTH: 0.450745
G1 F8827.318
G1 X108.28 Y102.587 E.01472
; LINE_WIDTH: 0.488998
G1 F8070.342
G1 X108.263 Y102.49 E.00359
; LINE_WIDTH: 0.516497
G1 F7601.734
G1 X108.246 Y102.392 E.00381
G1 X107.925 Y102.19 E.01464
; WIPE_START
G1 X108.246 Y102.392 E-.60295
G1 X108.263 Y102.49 E-.15705
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.558 Y100.245 Z1.4 F42000
G1 X127.942 Y96.433 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X127.943 Y97.262 E.0275
G3 X127.892 Y97.399 I-.155 J.02 E.00502
G3 X127.252 Y97.442 I-.382 J-.894 E.02168
G1 X126.617 Y97.093 E.02402
G2 X125.307 Y96.723 I-1.092 J1.363 E.04639
G1 X124.979 Y96.841 E.01155
G3 X124.019 Y97.442 I-1.819 J-1.839 E.0379
G1 X122.01 Y97.442 E.06662
G1 X121.376 Y97.093 E.02402
G2 X120.065 Y96.723 I-1.092 J1.363 E.04639
G2 X119.456 Y97.077 I.177 J1.006 E.02387
G1 X119.257 Y97.023 E.00683
G1 X119.257 Y95.292 E.05742
G2 X120.065 Y94.472 I-3.144 J-3.91 E.03825
G3 X121.376 Y94.103 I1.092 J1.363 E.04639
G1 X121.703 Y94.22 E.01155
G3 X122.686 Y95.186 I-3.691 J4.74 E.0458
G2 X123.996 Y95.556 I1.092 J-1.363 E.04639
G1 X124.324 Y95.438 E.01155
G2 X125.307 Y94.472 I-3.69 J-4.739 E.0458
G3 X126.617 Y94.103 I1.092 J1.363 E.04639
G1 X126.945 Y94.22 E.01155
G3 X127.927 Y95.186 I-3.691 J4.74 E.0458
G1 X127.942 Y92.934 E.0747
G3 X127.6 Y92.817 I-.036 J-.453 E.01233
G3 X126.617 Y91.852 I3.691 J-4.74 E.0458
G2 X125.307 Y91.482 I-1.092 J1.363 E.04639
G1 X124.979 Y91.6 E.01155
G2 X123.996 Y92.565 I3.691 J4.74 E.0458
G3 X122.686 Y92.935 I-1.092 J-1.363 E.04639
G1 X122.359 Y92.817 E.01155
G3 X121.376 Y91.852 I3.691 J-4.74 E.0458
G2 X120.065 Y91.482 I-1.092 J1.363 E.04639
G2 X119.257 Y92.036 I.568 J1.696 E.03291
G1 X119.257 Y90.05 E.06585
G2 X119.907 Y89.399 I-2.5 J-3.14 E.03059
G3 X121.916 Y89.157 I1.463 J3.692 E.06787
G3 X122.686 Y89.945 I-3.027 J3.731 E.03662
G2 X123.996 Y90.314 I1.092 J-1.363 E.04639
G1 X124.324 Y90.197 E.01155
G2 X125.307 Y89.231 I-3.691 J-4.74 E.0458
G1 X125.453 Y89.158 E.00544
G1 X127.158 Y89.158 E.05655
G3 X127.927 Y89.945 I-3.024 J3.726 E.03658
G1 X127.942 Y91.58 E.05425
; OBJECT_ID: 2
; WIPE_START
G1 X127.927 Y89.945 E-.62147
G1 X127.673 Y89.684 E-.13853
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X122.86 Y83.76 Z1.4 F42000
G1 X107.89 Y65.33 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X107.863 Y65.273 E.00207
G3 X107.291 Y62.41 I6.94 J-2.876 E.0975
G1 X107.291 Y39.39 E.76359
G3 X114.79 Y31.891 I7.523 J.023 E.39045
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.023 J7.523 E.39045
G1 X175.809 Y62.41 E.76359
G3 X168.31 Y69.909 I-7.523 J-.023 E.39045
G1 X114.79 Y69.909 E1.77533
G3 X108.249 Y66.069 I.013 J-7.512 E.26375
G1 X107.916 Y65.384 E.02527
M204 S10000
G1 X108.255 Y65.153 F42000
G1 F8843.478
M204 S6000
G1 X108.241 Y65.117 E.00127
G3 X107.698 Y62.406 I6.569 J-2.727 E.0923
G1 X107.698 Y39.394 E.76333
G3 X114.794 Y32.298 I7.115 J.019 E.3695
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.019 J7.115 E.3695
G1 X175.402 Y62.406 E.76333
G3 X168.306 Y69.502 I-7.115 J-.019 E.3695
G1 X114.794 Y69.502 E1.77508
G3 X108.607 Y65.869 I.016 J-7.112 E.24949
G1 X108.282 Y65.206 E.02447
M204 S250
G1 X108.607 Y64.982 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X108.602 Y64.967 E.00047
G3 X108.09 Y62.402 I6.201 J-2.571 E.0809
G1 X108.09 Y39.398 E.70685
G3 X114.798 Y32.69 I6.722 J.015 E.32357
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.015 J6.722 E.32357
G1 X175.01 Y62.402 E.70685
G3 X168.302 Y69.11 I-6.722 J-.015 E.32357
G1 X114.798 Y69.11 E1.64403
G3 X108.947 Y65.678 I.005 J-6.713 E.21851
G1 X108.634 Y65.036 E.02196
; WIPE_START
M204 S6000
G1 X108.602 Y64.967 E-.02862
G1 X108.418 Y64.473 E-.2003
G1 X108.219 Y63.709 E-.3001
G1 X108.136 Y63.189 E-.20032
G1 X108.132 Y63.108 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.199 Y58.478 Z1.4 F42000
G1 X149.541 Y31.509 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I-.002 J7.903 E.41165
G1 X176.191 Y62.39 E.76229
G3 X168.29 Y70.291 I-7.895 J.006 E.41177
G1 X114.81 Y70.291 E1.77403
G3 X106.909 Y62.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E.76229
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.53 E.16517
G3 X134.075 Y26.009 I.494 J-.026 E.02736
G1 X149.052 Y26.01 E.49682
G3 X149.541 Y26.52 I-.004 J.493 E.02613
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.007 J8.311 E.43258
G1 X176.598 Y62.394 E.76256
G3 X168.294 Y70.698 I-8.302 J.002 E.4327
G1 X114.806 Y70.698 E1.7743
G3 X106.502 Y62.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E.76256
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.518 E.15207
G3 X134.065 Y25.602 I.9 J-.015 E.04784
G1 X149.066 Y25.603 E.49762
G3 X149.948 Y26.512 I-.018 J.9 E.04661
G1 X149.948 Y31.042 E.15028
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.526 Y36.603 I-.002 J8.693 E.33192
G3 X176.99 Y39.402 I-8.292 J2.813 E.08757
G1 X176.99 Y62.398 E.7066
G3 X169.776 Y70.962 I-8.692 J-.002 E.37386
M73 P52 R12
G3 X168.298 Y71.09 I-1.563 J-9.469 E.04562
G1 X114.802 Y71.09 E1.64378
G3 X113.324 Y70.962 I.027 J-8.919 E.04563
G3 X106.11 Y62.398 I1.478 J-8.566 E.37386
G1 X106.11 Y39.402 E.7066
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.506 E.12917
G3 X134.055 Y25.21 I1.292 J-.004 E.06259
G1 X149.079 Y25.211 E.46165
G3 X150.34 Y26.504 I-.032 J1.292 E.06145
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.819 Y26.358 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X147.191 Y26.359 E.05401
G3 X146.136 Y26.601 I-.813 J-1.125 E.03687
G3 X145.662 Y26.361 I.09 J-.765 E.01801
G1 X141.942 Y26.363 E.1234
G3 X140.895 Y26.601 I-.804 J-1.118 E.03658
G3 X140.425 Y26.364 I.087 J-.757 E.01781
G1 X136.693 Y26.367 E.12381
G1 X136.309 Y26.559 E.01425
G1 X135.654 Y26.601 E.02178
G3 X135.189 Y26.368 I.084 J-.749 E.01762
G1 X134.014 Y26.369 E.03895
G2 X133.913 Y26.485 I.077 J.171 E.00526
G1 X133.911 Y27.797 E.04352
G3 X134.671 Y27.887 I.276 J.922 E.0261
G3 X135.654 Y28.852 I-3.691 J4.74 E.0458
G2 X136.964 Y29.222 I1.092 J-1.363 E.04639
G1 X137.292 Y29.104 E.01155
G2 X138.274 Y28.139 I-3.69 J-4.739 E.0458
G3 X139.585 Y27.769 I1.092 J1.363 E.04639
G1 X139.912 Y27.887 E.01155
G3 X140.895 Y28.852 I-3.691 J4.74 E.0458
G2 X142.205 Y29.222 I1.092 J-1.363 E.04639
G1 X142.533 Y29.104 E.01155
G2 X143.516 Y28.139 I-3.691 J-4.74 E.0458
G3 X144.826 Y27.769 I1.092 J1.363 E.04639
G1 X145.154 Y27.887 E.01155
G3 X146.136 Y28.852 I-3.691 J4.74 E.0458
G2 X147.447 Y29.222 I1.092 J-1.363 E.04639
G1 X147.774 Y29.104 E.01155
G2 X148.757 Y28.139 I-3.691 J-4.74 E.0458
G1 X149.191 Y27.921 E.0161
G1 X149.192 Y30.417 E.0828
G2 X148.429 Y30.507 I-.277 J.926 E.0262
G2 X147.447 Y31.473 I3.69 J4.739 E.0458
G1 X147.307 Y31.543 E.00517
G1 X145.591 Y31.543 E.05693
G3 X144.826 Y30.759 I3.011 J-3.706 E.0364
G2 X143.516 Y30.39 I-1.092 J1.363 E.04639
G1 X143.188 Y30.507 E.01155
G2 X142.205 Y31.473 I3.691 J4.74 E.0458
G1 X142.066 Y31.543 E.00517
G1 X140.35 Y31.543 E.05693
G3 X139.585 Y30.759 I3.011 J-3.707 E.0364
G2 X138.274 Y30.39 I-1.092 J1.363 E.04639
G1 X137.947 Y30.507 E.01155
G2 X136.964 Y31.473 I3.691 J4.74 E.0458
G1 X136.825 Y31.543 E.00517
G1 X135.109 Y31.543 E.05693
G3 X134.343 Y30.759 I3.011 J-3.706 E.0364
G1 X133.908 Y30.542 E.01613
G1 X133.91 Y28.913 E.05401
; OBJECT_ID: 8
; WIPE_START
G1 X133.908 Y30.542 E-.61876
G1 X134.241 Y30.708 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X129.575 Y36.749 Z1.4 F42000
G1 X38.791 Y154.292 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G3 X38.786 Y157.051 I-69.886 J1.248 E.09154
G3 X38.627 Y158.232 I-6.933 J-.331 E.03957
G1 X38.409 Y158.209 E.00727
G1 X38.409 Y145.59 E.4186
G2 X26.391 Y145.59 I-6.009 J.011 E.62552
G1 X26.391 Y158.209 E.4186
G1 X26.173 Y158.232 E.00727
G3 X26.009 Y156.789 I7.016 J-1.528 E.04826
G1 X26.009 Y145.61 E.37084
G3 X32.482 Y139.21 I6.401 J.001 E.33586
G3 X38.721 Y144.657 I-.093 J6.404 E.29874
G1 X38.911 Y146.137 E.04951
G1 X40.204 Y145.719 E.04507
G3 X40.33 Y145.708 I.115 J.631 E.00419
G1 X47.309 Y145.71 E.23152
G3 X47.79 Y146.18 I-.022 J.503 E.02443
G1 X47.791 Y154.17 E.26503
G3 X47.27 Y154.69 I-.495 J.025 E.02752
G1 X40.319 Y154.69 E.23059
G3 X40.194 Y154.678 I-.003 J-.602 E.00416
G1 X38.849 Y154.308 E.04629
M204 S10000
G1 X39.198 Y154.826 F42000
G1 F8843.478
M204 S6000
G3 X39.193 Y157.067 I-56.79 J.984 E.07435
G3 X38.182 Y160.374 I-6.954 J-.317 E.11592
G1 X38.002 Y160.325 E.00619
G1 X38.002 Y145.593 E.48868
G2 X26.798 Y145.593 I-5.602 J.007 E.58335
G1 X26.798 Y160.325 E.48868
G1 X26.618 Y160.374 E.00619
G3 X25.602 Y156.793 I5.819 J-3.586 E.12506
G1 X25.602 Y145.605 E.37112
G3 X32.484 Y138.803 I6.809 J.006 E.357
G3 X39.123 Y144.597 I-.097 J6.812 E.31787
G1 X39.252 Y145.598 E.03347
G1 X40.056 Y145.336 E.02804
G3 X40.318 Y145.301 I.259 J.962 E.00879
G1 X47.329 Y145.302 E.23258
G3 X48.197 Y146.164 I-.048 J.916 E.0444
G1 X48.198 Y154.182 E.26595
G3 X47.282 Y155.097 I-.901 J.015 E.04793
G1 X40.311 Y155.097 E.23124
G3 X40.102 Y155.075 I.006 J-1.036 E.00698
G1 X39.256 Y154.842 E.02913
M204 S250
G1 X39.59 Y155.34 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X39.568 Y157.366 I-25.707 J.728 E.06227
G3 X37.61 Y161.753 I-7.181 J-.575 E.15047
G1 X37.61 Y145.597 E.49641
G2 X27.19 Y145.597 I-5.21 J.003 E.50274
G1 X27.19 Y161.753 E.49641
G3 X25.21 Y156.797 I5.276 J-4.981 E.16791
G1 X25.21 Y145.601 E.34401
G3 X32.486 Y138.411 I7.191 J0 E.34969
G3 X39.581 Y145.078 I-.094 J7.209 E.32841
G3 X40.306 Y144.909 I.83 J1.922 E.02301
G1 X47.348 Y144.91 E.21639
G3 X48.589 Y146.149 I-.073 J1.314 E.05894
G1 X48.59 Y154.193 E.24718
G3 X47.294 Y155.489 I-1.293 J.003 E.06261
G1 X40.304 Y155.489 E.21478
G3 X39.646 Y155.361 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X39.59 Y156.797 E-.54621
G1 X39.568 Y157.359 E-.21379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.495 Y158.423 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.5323
G1 F7356.251
M204 S6000
G1 X38.443 Y158.773 E.01413
; LINE_WIDTH: 0.49588
G1 F7947.732
G1 X38.421 Y158.9 E.00473
; LINE_WIDTH: 0.453107
G1 F8776.496
G1 X38.4 Y159.026 E.00428
; LINE_WIDTH: 0.407744
G1 F9867.77
G1 X38.322 Y159.437 E.01243
; LINE_WIDTH: 0.359782
G1 F11361.435
G1 X38.244 Y159.847 E.01079
; WIPE_START
G1 X38.322 Y159.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X44.927 Y155.612 Z1.4 F42000
G1 X47.441 Y154.156 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X47.243 Y154.342 I-.158 J.03 E.01069
G1 X45.929 Y154.342 E.04359
G2 X44.107 Y153.432 I-1.761 J1.247 E.07037
G2 X42.961 Y154.342 I.861 J2.262 E.04932
G1 X40.688 Y154.342 E.07539
G2 X38.756 Y153.471 I-1.625 J1.028 E.07446
G1 X38.755 Y151.298 E.07211
G1 X38.865 Y151.181 E.00533
G3 X40.503 Y150.929 I1.056 J1.418 E.05721
G3 X41.486 Y151.894 I-3.691 J4.74 E.0458
G2 X43.124 Y152.146 I1.056 J-1.418 E.05721
G2 X44.107 Y151.181 I-3.69 J-4.739 E.0458
G3 X45.745 Y150.929 I1.056 J1.418 E.05721
G3 X46.727 Y151.894 I-3.691 J4.74 E.0458
G1 X47.442 Y152.226 E.02614
G1 X47.442 Y150.598 E.05401
M204 S10000
G1 X42.549 Y146.057 F42000
G1 F8843.478
M204 S6000
G1 X40.921 Y146.057 E.05401
G2 X42.141 Y146.981 I1.884 J-1.22 E.05182
G1 X42.796 Y147.023 E.02178
G2 X43.995 Y146.057 I-.912 J-2.359 E.05188
G1 X46.163 Y146.058 E.07191
G2 X47.442 Y146.985 I2.16 J-1.634 E.05316
G1 X47.442 Y149.572 E.08582
G1 X46.727 Y149.643 E.02382
G3 X46.072 Y149.251 I.206 J-1.087 E.02586
G1 X45.417 Y148.56 E.03159
G2 X43.779 Y148.308 I-1.056 J1.418 E.05721
G2 X42.796 Y149.274 I3.691 J4.74 E.0458
G3 X41.159 Y149.526 I-1.056 J-1.418 E.05721
G3 X40.176 Y148.56 I3.691 J-4.74 E.0458
G2 X38.754 Y148.231 I-1.118 J1.591 E.04964
G1 X38.753 Y146.771 E.04841
G1 X38.922 Y146.761 E.00561
M204 S10000
G1 X38.678 Y146.427 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.148083
G1 F15000
M204 S6000
G1 X38.658 Y146.116 E.00267
; LINE_WIDTH: 0.113967
G1 X38.638 Y145.805 E.0018
; WIPE_START
G1 X38.658 Y146.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.251 Y151.503 Z1.4 F42000
G1 X26.305 Y158.423 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.532284
G1 F7356.499
M204 S6000
G1 X26.357 Y158.773 E.01413
; LINE_WIDTH: 0.495926
G1 F7946.923
G1 X26.379 Y158.899 E.00472
; LINE_WIDTH: 0.453257
G1 F8773.285
G1 X26.4 Y159.025 E.00427
; LINE_WIDTH: 0.407844
G1 F9865.073
G1 X26.478 Y159.436 E.01244
; LINE_WIDTH: 0.359692
G1 F11364.662
G1 X26.556 Y159.847 E.0108
; OBJECT_ID: 9
; WIPE_START
G1 X26.478 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X34.064 Y158.601 Z1.4 F42000
G1 X73.191 Y154.293 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X73.186 Y156.758 I-63.833 J1.099 E.08179
G3 X73.027 Y157.964 I-7.261 J-.34 E.04039
G1 X72.809 Y157.941 E.00728
G1 X72.809 Y145.89 E.39974
G2 X60.191 Y145.89 I-6.309 J.011 E.65678
G1 X60.191 Y157.941 E.39974
G1 X59.973 Y157.964 E.00728
G3 X59.809 Y156.49 I6.677 J-1.486 E.04929
G1 X59.809 Y145.91 E.35096
G3 X66.733 Y139.214 I6.701 J.002 E.3565
G3 X73.082 Y144.697 I-.234 J6.689 E.30072
G1 X73.322 Y146.177 E.04976
G1 X74.544 Y145.735 E.04311
G3 X74.729 Y145.709 I.168 J.516 E.00621
G1 X81.719 Y145.71 E.23188
G3 X82.19 Y146.191 I-.032 J.502 E.02443
G1 X82.191 Y154.17 E.26469
G3 X81.67 Y154.691 I-.495 J.025 E.02752
G1 X74.719 Y154.691 E.23059
G3 X74.594 Y154.678 I-.003 J-.602 E.00416
G1 X73.249 Y154.309 E.04629
M204 S10000
G1 X73.598 Y154.827 F42000
G1 F8843.478
M204 S6000
G3 X73.593 Y156.774 I-50.417 J.834 E.0646
G3 X72.583 Y160.157 I-7.134 J-.286 E.11833
G1 X72.402 Y160.108 E.00622
G1 X72.402 Y145.894 E.47152
G2 X60.598 Y145.894 I-5.902 J.007 E.61462
G1 X60.598 Y160.108 E.47151
G1 X60.417 Y160.157 E.00622
G1 X60.325 Y159.998 E.00607
G3 X59.402 Y156.494 I6.198 J-3.507 E.12155
G1 X59.402 Y145.906 E.35122
G3 X66.744 Y138.807 I7.109 J.006 E.37794
G3 X73.482 Y144.623 I-.246 J7.096 E.31911
G1 X73.645 Y145.628 E.03375
G1 X74.425 Y145.346 E.02749
G3 X74.717 Y145.302 I.287 J.917 E.00985
G1 X81.735 Y145.303 E.2328
G3 X82.597 Y146.17 I-.054 J.916 E.04439
G1 X82.598 Y154.182 E.26575
G3 X81.682 Y155.098 I-.901 J.015 E.04793
G1 X74.711 Y155.098 E.23124
G3 X74.502 Y155.075 I.006 J-1.039 E.00698
G1 X73.656 Y154.843 E.02912
M204 S250
G1 X73.99 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X73.901 Y157.653 I-14.994 J.578 E.07117
G1 X73.883 Y157.752 E.00307
G3 X72.01 Y161.572 I-7.482 J-1.3 E.1325
G1 X72.01 Y145.898 E.48162
G2 X60.99 Y145.898 I-5.51 J.003 E.5317
G1 X60.99 Y161.572 E.48162
G3 X59.01 Y156.497 I5.579 J-5.1 E.17122
G1 X59.01 Y145.902 E.32557
G3 X66.755 Y138.415 I7.501 J.011 E.36923
G3 X73.956 Y145.098 I-.274 J7.516 E.32894
G3 X74.706 Y144.91 I.87 J1.874 E.02389
G1 X81.751 Y144.911 E.21646
G3 X82.989 Y146.151 I-.076 J1.314 E.05893
G1 X82.99 Y154.194 E.24712
G3 X81.694 Y155.49 I-1.293 J.003 E.06261
G1 X74.704 Y155.49 E.21478
G3 X74.046 Y155.361 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X73.984 Y156.789 E-.5431
G1 X73.929 Y157.357 E-.2169
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.896 Y158.155 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533335
G1 F7340.729
M204 S6000
G1 X72.842 Y158.525 E.01496
; LINE_WIDTH: 0.494514
G1 F7971.768
G1 X72.821 Y158.654 E.00483
; LINE_WIDTH: 0.451612
G1 F8808.606
G1 X72.799 Y158.784 E.00437
; LINE_WIDTH: 0.406027
G1 F9914.439
G1 X72.722 Y159.202 E.01258
; LINE_WIDTH: 0.357756
G1 F11434.539
G1 X72.644 Y159.62 E.01091
M204 S10000
G1 X72.457 Y160.326 F42000
; LINE_WIDTH: 0.108621
G1 F15000
M204 S6000
G1 X72.224 Y160.99 E.00377
; WIPE_START
G1 X72.457 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.837 Y160.759 Z1.4 F42000
G1 X60.776 Y160.99 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.108639
G1 F15000
M204 S6000
G1 X60.543 Y160.326 E.00377
M204 S10000
G1 X60.356 Y159.62 F42000
; LINE_WIDTH: 0.357902
G1 F11429.244
M204 S6000
G1 X60.278 Y159.202 E.01091
; LINE_WIDTH: 0.406061
G1 F9913.519
G1 X60.201 Y158.784 E.01258
; LINE_WIDTH: 0.451544
G1 F8810.059
G1 X60.179 Y158.655 E.00436
; LINE_WIDTH: 0.494395
G1 F7973.87
G1 X60.158 Y158.526 E.00482
; LINE_WIDTH: 0.53325
G1 F7341.995
G1 X60.104 Y158.155 E.01498
; WIPE_START
G1 X60.158 Y158.526 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.597 Y153.171 Z1.4 F42000
G1 X73.037 Y145.847 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.118721
G1 F15000
M204 S6000
G1 X73.063 Y146.163 E.00196
; LINE_WIDTH: 0.161341
G1 X73.088 Y146.478 E.00305
M204 S10000
G1 X73.485 Y146.795 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X73.153 Y146.822 E.01104
G1 X73.154 Y148.118 E.04298
G1 X73.621 Y148.148 E.01553
G1 X74.276 Y148.476 E.0243
G2 X75.259 Y149.441 I4.674 J-3.774 E.0458
G2 X76.896 Y149.189 I.582 J-1.67 E.05721
G3 X77.879 Y148.224 I4.674 J3.775 E.0458
G3 X79.517 Y148.476 I.582 J1.67 E.05721
G1 X80.172 Y149.167 E.03159
G2 X80.827 Y149.559 I.861 J-.695 E.02586
G1 X81.483 Y149.517 E.02178
G1 X81.842 Y149.337 E.01333
G1 X81.842 Y146.919 E.08021
G3 X80.344 Y146.058 I.08 J-1.873 E.05957
G1 X78.015 Y146.058 E.07725
G3 X76.896 Y146.938 I-1.953 J-1.33 E.04796
G3 X75.101 Y146.057 I-.066 J-2.135 E.06903
G1 X76.73 Y146.057 E.05401
M204 S10000
G1 X81.842 Y150.532 F42000
G1 F8843.478
M204 S6000
G1 X81.842 Y152.161 E.05401
G1 X81.483 Y152.138 E.01196
G1 X80.827 Y151.81 E.0243
G2 X79.845 Y150.844 I-4.674 J3.774 E.0458
G2 X78.207 Y151.096 I-.582 J1.669 E.05721
G3 X77.224 Y152.062 I-4.673 J-3.774 E.0458
G3 X75.586 Y151.81 I-.582 J-1.67 E.05721
G1 X74.931 Y151.119 E.03159
G2 X73.155 Y151.002 I-.954 J.943 E.06456
G1 X73.156 Y153.359 E.07821
G1 X73.621 Y153.389 E.01546
G1 X74.276 Y153.717 E.0243
G1 X74.869 Y154.342 E.02858
G1 X76.98 Y154.342 E.07004
G3 X77.879 Y153.465 I4.25 J3.457 E.04176
G3 X79.517 Y153.717 I.582 J1.669 E.05721
G1 X80.11 Y154.342 E.02858
G1 X81.737 Y154.325 E.05397
; OBJECT_ID: 3
; WIPE_START
G1 X80.11 Y154.342 E-.61823
G1 X79.853 Y154.072 E-.14177
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X73.359 Y150.062 Z1.4 F42000
G1 X26.735 Y121.28 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X26.716 Y121.228 E.00184
G3 X26.391 Y119.01 I7.487 J-2.231 E.07464
G1 X26.391 Y95.99 E.76359
G3 X34.19 Y88.191 I7.823 J.024 E.40607
G1 X87.71 Y88.191 E1.77533
G3 X95.509 Y95.99 I-.013 J7.812 E.40622
G1 X95.509 Y119.01 E.76359
G3 X87.71 Y126.809 I-7.823 J-.024 E.40607
G1 X34.19 Y126.809 E1.77533
G3 X26.986 Y121.988 I.013 J-7.812 E.30482
G1 X26.755 Y121.337 E.02292
M204 S10000
G1 X27.119 Y121.145 F42000
G1 F8843.478
M204 S6000
G1 X27.108 Y121.109 E.00123
G3 X26.798 Y119.006 I7.105 J-2.123 E.07078
G1 X26.798 Y95.994 E.76333
G3 X34.194 Y88.598 I7.416 J.019 E.38512
G1 X87.706 Y88.598 E1.77508
G3 X89.53 Y88.829 I-.021 J7.487 E.06115
G3 X95.102 Y95.994 I-1.848 J7.186 E.32399
G1 X95.102 Y119.006 E.76333
G3 X89.81 Y126.094 I-7.422 J-.022 E.31435
G3 X87.706 Y126.402 I-2.189 J-7.601 E.07076
G1 X34.194 Y126.402 E1.77508
G3 X27.365 Y121.831 I.019 J-7.416 E.28891
G1 X27.139 Y121.201 E.0222
M204 S250
G1 X27.488 Y121.015 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X27.481 Y120.996 E.0006
G3 X27.19 Y119.002 I6.722 J-1.999 E.06214
G1 X27.19 Y95.998 E.70685
G3 X34.198 Y88.99 I7.023 J.015 E.33805
G1 X87.702 Y88.99 E1.64403
G3 X94.71 Y95.998 I-.005 J7.013 E.33818
M73 P52 R11
G1 X94.71 Y119.002 E.70685
G3 X87.702 Y126.01 I-7.023 J-.015 E.33805
G1 X34.198 Y126.01 E1.64403
G3 X27.725 Y121.682 I.005 J-7.013 E.25366
G1 X27.508 Y121.071 E.01992
; WIPE_START
M204 S6000
G1 X27.481 Y120.996 E-.03024
G1 X27.325 Y120.368 E-.24615
M73 P53 R11
G1 X27.239 Y119.824 E-.20926
G1 X27.196 Y119.103 E-.27435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.303 Y114.525 Z1.4 F42000
G1 X68.941 Y87.809 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y87.809 E.62195
G3 X95.891 Y96.01 I.006 J8.195 E.42739
G1 X95.891 Y118.99 E.76229
G3 X87.69 Y127.191 I-8.195 J.006 E.4274
G1 X34.21 Y127.191 E1.77403
G3 X26.009 Y118.99 I-.006 J-8.195 E.4274
G1 X26.009 Y96.01 E.76229
G3 X34.21 Y87.809 I8.207 J.006 E.42723
G1 X52.959 Y87.809 E.62194
G1 X52.959 Y82.83 E.16518
G3 X53.48 Y82.309 I.495 J-.025 E.02752
G1 X68.452 Y82.31 E.49665
G3 X68.941 Y82.82 I-.006 J.496 E.02609
G1 X68.941 Y87.749 E.16352
M204 S10000
G1 X69.348 Y87.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y87.402 E.60858
G3 X96.298 Y96.006 I.002 J8.602 E.44833
G1 X96.298 Y118.994 E.76256
G3 X87.694 Y127.598 I-8.602 J.002 E.44833
G1 X34.206 Y127.598 E1.7743
G3 X25.602 Y118.994 I-.002 J-8.602 E.44834
G1 X25.602 Y96.006 E.76256
G3 X34.206 Y87.402 I8.614 J.01 E.44816
G1 X52.552 Y87.402 E.60858
G1 X52.552 Y82.818 E.15207
G3 X53.468 Y81.902 I.901 J-.015 E.04793
G1 X68.466 Y81.903 E.49752
G3 X69.348 Y82.812 I-.023 J.905 E.04654
G1 X69.348 Y87.342 E.15028
M204 S250
G1 X69.74 Y87.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y87.01 E.5518
G3 X94.455 Y90.07 I-.004 J8.999 E.23492
G3 X96.69 Y96.002 I-6.768 J5.937 E.19905
G1 X96.69 Y118.998 E.7066
G3 X90.257 Y127.617 I-8.993 J-.002 E.35423
G3 X87.698 Y127.99 I-2.654 J-9.243 E.07971
G1 X34.202 Y127.99 E1.64378
G3 X25.21 Y118.998 I.002 J-8.994 E.43398
G1 X25.21 Y96.002 E.7066
G3 X31.643 Y87.383 I8.993 J.002 E.35423
G3 X34.202 Y87.01 I2.577 J8.714 E.07974
G1 X52.16 Y87.01 E.5518
G1 X52.16 Y82.806 E.12917
G3 X53.456 Y81.51 I1.293 J-.003 E.06261
G1 X68.479 Y81.511 E.46162
G3 X69.74 Y82.804 I-.039 J1.299 E.06135
G1 X69.74 Y86.95 E.12739
; WIPE_START
M204 S6000
G1 X71.74 Y86.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X68.583 Y82.776 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G2 X68.421 Y82.658 I-.185 J.083 E.00697
G1 X67.01 Y82.659 E.04678
G3 X65.536 Y83.201 I-1.388 J-1.5 E.05348
G3 X64.74 Y82.66 I.561 J-1.682 E.03235
G1 X61.766 Y82.662 E.09863
G3 X60.295 Y83.201 I-1.386 J-1.505 E.05335
G3 X59.501 Y82.663 I.559 J-1.679 E.03222
G1 X56.522 Y82.664 E.09881
G3 X55.054 Y83.201 I-1.384 J-1.51 E.05322
G3 X54.262 Y82.666 I.557 J-1.676 E.03209
G1 X53.421 Y82.666 E.02792
G2 X53.313 Y82.789 I.078 J.178 E.0056
G1 X53.311 Y84.397 E.05333
G3 X54.071 Y84.487 I.276 J.923 E.02611
G3 X55.054 Y85.452 I-3.691 J4.74 E.0458
G2 X56.364 Y85.822 I1.092 J-1.363 E.04639
G1 X56.692 Y85.704 E.01155
G2 X57.674 Y84.739 I-3.69 J-4.739 E.0458
G3 X58.985 Y84.369 I1.092 J1.363 E.04639
G1 X59.312 Y84.487 E.01155
G3 X60.295 Y85.452 I-3.691 J4.74 E.0458
G2 X61.605 Y85.822 I1.092 J-1.363 E.04639
G1 X61.933 Y85.704 E.01155
G2 X62.916 Y84.739 I-3.691 J-4.74 E.0458
G3 X64.226 Y84.369 I1.092 J1.363 E.04639
G1 X64.554 Y84.487 E.01155
G3 X65.536 Y85.452 I-3.691 J4.74 E.0458
G2 X66.847 Y85.822 I1.092 J-1.363 E.04639
G1 X67.174 Y85.704 E.01155
G2 X68.157 Y84.739 I-3.691 J-4.74 E.0458
G1 X68.591 Y84.521 E.0161
G1 X68.592 Y87.017 E.0828
G1 X68.157 Y86.99 E.01447
G2 X67.065 Y87.843 I.81 J2.163 E.04668
G1 X64.684 Y87.843 E.07897
G2 X62.916 Y86.99 I-1.698 J1.261 E.06773
G2 X61.824 Y87.843 I.81 J2.163 E.04668
G1 X59.443 Y87.843 E.07897
G2 X57.674 Y86.99 I-1.698 J1.261 E.06773
G2 X56.582 Y87.843 I.81 J2.163 E.04668
G1 X54.201 Y87.843 E.07897
G2 X53.308 Y87.141 I-1.413 J.881 E.03844
G1 X53.31 Y85.513 E.05401
; OBJECT_ID: 1
; WIPE_START
G1 X53.308 Y87.141 E-.61876
G1 X53.64 Y87.308 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X58.223 Y81.204 Z1.4 F42000
G1 X93.044 Y34.818 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X93.273 Y35.143 E.01316
G3 X94.509 Y39.19 I-6.087 J4.071 E.14243
G1 X94.509 Y62.21 E.76359
G3 X87.21 Y69.509 I-7.312 J-.012 E.38018
G1 X33.69 Y69.509 E1.77533
G3 X26.391 Y62.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E.76359
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X92.936 Y34.678 I-.023 J7.322 E.21856
G1 X93.008 Y34.771 E.00389
M204 S10000
G1 X92.715 Y35.058 F42000
G1 F8843.478
M204 S6000
G1 X92.935 Y35.368 E.01262
G3 X94.102 Y39.194 I-5.748 J3.844 E.13461
G1 X94.102 Y62.206 E.76333
G3 X87.206 Y69.102 I-6.912 J-.016 E.35912
G1 X33.694 Y69.102 E1.77508
G3 X26.798 Y62.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E.76333
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X92.616 Y34.93 I-.018 J6.915 E.20649
G1 X92.679 Y35.01 E.00336
M204 S250
G1 X92.398 Y35.288 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X92.609 Y35.586 E.01121
G3 X93.71 Y39.198 I-5.421 J3.626 E.11772
G1 X93.71 Y62.202 E.70685
G3 X87.202 Y68.71 I-6.52 J-.012 E.31396
G1 X33.698 Y68.71 E1.64403
G3 X27.19 Y62.202 I.014 J-6.522 E.31393
G1 X27.19 Y39.198 E.70685
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.202 Y32.69 E1.64403
G3 X92.309 Y35.173 I-.014 J6.522 E.18051
G1 X92.361 Y35.241 E.00264
; WIPE_START
M204 S6000
G1 X92.609 Y35.586 E-.16143
G1 X93 Y36.244 E-.29115
G1 X93.214 Y36.709 E-.19425
G1 X93.318 Y36.988 E-.11317
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.864 Y35.346 Z1.4 F42000
G1 X68.441 Y31.509 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I.006 J7.695 E.40135
G1 X94.891 Y62.19 E.76229
G3 X87.19 Y69.891 I-7.695 J.006 E.40134
G1 X33.71 Y69.891 E1.77403
G3 X26.009 Y62.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E.76229
G3 X33.71 Y31.509 I7.695 J-.006 E.40135
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.53 E.16518
G3 X52.98 Y26.009 I.498 J-.023 E.02748
G1 X67.952 Y26.01 E.49665
G3 X68.441 Y26.52 I-.006 J.496 E.02609
G1 X68.441 Y31.449 E.16352
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I.002 J8.102 E.42229
G1 X95.298 Y62.194 E.76256
G3 X87.194 Y70.298 I-8.113 J-.01 E.42212
G1 X33.706 Y70.298 E1.77431
G3 X25.602 Y62.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E.76256
G3 X33.706 Y31.102 I8.102 J-.002 E.42229
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.518 E.15207
G3 X52.968 Y25.602 I.906 J-.01 E.04785
G1 X67.966 Y25.603 E.49752
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
G1 X95.69 Y62.198 E.7066
G3 X95.565 Y63.642 I-8.716 J-.026 E.04458
G3 X87.198 Y70.69 I-8.369 J-1.444 E.36526
G1 X33.702 Y70.69 E1.64378
G3 X25.21 Y62.198 I.014 J-8.506 E.4097
G1 X25.21 Y39.202 E.7066
G3 X33.702 Y30.71 I8.494 J.002 E.40986
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.506 E.12917
G3 X52.956 Y25.21 I1.3 J.004 E.06251
G1 X67.979 Y25.211 E.46162
G3 X69.24 Y26.504 I-.039 J1.299 E.06135
G1 X69.24 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X67.319 Y26.359 Z1.4 F42000
G1 Z1
M73 P54 R11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G2 X65.036 Y26.401 I-.803 J18.114 E.07578
G1 X64.922 Y26.36 E.00404
G1 X52.919 Y26.368 E.39814
G2 X52.813 Y26.489 I.052 J.154 E.00561
G1 X52.811 Y27.597 E.03675
G3 X53.571 Y27.687 I.276 J.922 E.02609
G3 X54.554 Y28.652 I-3.691 J4.74 E.0458
G2 X55.864 Y29.022 I1.092 J-1.363 E.04639
G1 X56.192 Y28.904 E.01155
G2 X57.174 Y27.939 I-3.69 J-4.739 E.0458
G3 X58.485 Y27.569 I1.092 J1.363 E.04639
G1 X58.812 Y27.687 E.01155
G3 X59.795 Y28.652 I-3.691 J4.74 E.0458
G2 X61.105 Y29.022 I1.092 J-1.363 E.04639
G1 X61.433 Y28.904 E.01155
G2 X62.416 Y27.939 I-3.691 J-4.74 E.0458
G3 X63.726 Y27.569 I1.092 J1.363 E.04639
G1 X64.054 Y27.687 E.01155
G3 X65.036 Y28.652 I-3.691 J4.74 E.0458
G2 X66.347 Y29.022 I1.092 J-1.363 E.04639
G1 X66.674 Y28.904 E.01155
G2 X67.657 Y27.939 I-3.691 J-4.74 E.0458
G1 X68.091 Y27.722 E.01609
G1 X68.092 Y30.217 E.08279
G2 X67.329 Y30.307 I-.277 J.926 E.0262
G2 X66.347 Y31.273 I3.69 J4.739 E.0458
G1 X65.808 Y31.543 E.01999
G1 X64.758 Y31.543 E.03481
G3 X63.726 Y30.559 I2.478 J-3.635 E.0475
G2 X62.416 Y30.19 I-1.092 J1.363 E.04639
G1 X62.088 Y30.307 E.01155
G2 X61.105 Y31.273 I3.691 J4.74 E.0458
G1 X60.566 Y31.543 E.01999
G1 X59.517 Y31.543 E.03481
G3 X58.485 Y30.559 I2.478 J-3.635 E.0475
G2 X57.174 Y30.19 I-1.092 J1.363 E.04639
G1 X56.847 Y30.307 E.01155
G2 X55.864 Y31.273 I3.691 J4.74 E.0458
G1 X55.325 Y31.543 E.01999
G1 X54.276 Y31.543 E.03481
G3 X53.243 Y30.559 I2.478 J-3.635 E.0475
G1 X52.809 Y30.342 E.01613
G1 X52.81 Y28.713 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X52.809 Y30.342 E-.61876
G1 X53.141 Y30.508 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 6/15
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z1.4 I-.455 J1.129 P1  F42000
G1 X218.891 Y97.393 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G3 X218.886 Y100.336 I-76.938 J1.348 E.09763
G3 X218.728 Y101.51 I-6.445 J-.271 E.03937
G1 X218.509 Y101.487 E.00729
G1 X218.509 Y88.489 E.43116
G2 X206.891 Y88.489 I-5.809 J.011 E.60468
G1 X206.891 Y101.487 E.43116
G1 X206.672 Y101.51 E.00729
G3 X206.509 Y100.089 I6.81 J-1.502 E.04754
G1 X206.509 Y88.509 E.38412
G3 X212.917 Y82.313 I6.192 J-.008 E.33006
G3 X218.843 Y87.734 I-.228 J6.2 E.28979
G1 X219 Y89.234 E.05001
G1 X220.271 Y88.826 E.04428
G3 X220.419 Y88.808 I.171 J.782 E.00498
G1 X227.419 Y88.809 E.23219
G3 X227.89 Y89.29 I-.027 J.497 E.02449
G1 X227.891 Y97.279 E.26502
G3 X227.37 Y97.79 I-.495 J.016 E.0272
G1 X220.419 Y97.79 E.23059
G3 X220.294 Y97.777 I-.003 J-.602 E.00416
G1 X218.949 Y97.408 E.04628
M204 S10000
G1 X219.298 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X219.293 Y100.351 I-63.47 J1.083 E.08044
G3 X218.279 Y103.619 I-6.606 J-.258 E.11479
G1 X218.102 Y103.568 E.00612
G1 X218.102 Y88.493 E.50007
G2 X207.298 Y88.493 I-5.402 J.007 E.56252
G1 X207.298 Y103.568 E.50006
G1 X207.121 Y103.619 E.00612
G3 X206.102 Y100.093 I5.588 J-3.524 E.12337
G1 X206.102 Y88.505 E.38438
G3 X212.932 Y81.906 I6.599 J-.004 E.35163
G3 X219.247 Y87.684 I-.244 J6.607 E.30882
G1 X219.353 Y88.693 E.03366
G1 X220.162 Y88.434 E.02819
G3 X220.412 Y88.401 I.28 J1.173 E.00837
G1 X227.435 Y88.402 E.23298
G3 X228.297 Y89.27 I-.048 J.91 E.04446
G1 X228.298 Y97.287 E.26595
G3 X227.382 Y98.197 I-.901 J.009 E.04773
G1 X220.411 Y98.197 E.23124
G3 X220.202 Y98.174 I.006 J-1.037 E.00698
G1 X219.356 Y97.942 E.02912
M204 S250
G1 X219.69 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X219.67 Y100.633 I-28.775 J.828 E.06738
G3 X217.71 Y104.972 I-7.042 J-.568 E.14923
G1 X217.71 Y88.497 E.50624
G2 X207.69 Y88.497 I-5.01 J.003 E.48344
G1 X207.69 Y104.972 E.50624
G3 X205.71 Y100.096 I5.021 J-4.879 E.16577
G1 X205.71 Y88.501 E.3563
G3 X212.947 Y81.515 I6.991 J0 E.34497
G3 X219.692 Y88.172 I-.255 J7.005 E.31981
G3 X220.404 Y88.009 I.849 J2.064 E.02254
G1 X227.45 Y88.01 E.21651
G3 X228.689 Y89.25 I-.069 J1.307 E.05901
G1 X228.69 Y97.295 E.24718
G3 X227.394 Y98.589 I-1.293 J.001 E.06255
G1 X220.404 Y98.589 E.21478
G3 X219.746 Y98.461 I.12 J-2.368 E.02066
; WIPE_START
M204 S6000
G1 X219.69 Y100.097 E-.62199
G1 X219.676 Y100.459 E-.13801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 Z1.6
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.878 Y101.744 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545467
G1 F7163.517
M204 S6000
G1 X218.557 Y101.95 E.0156
; LINE_WIDTH: 0.526762
G1 F7440.453
G1 X218.538 Y102.067 E.00468
; LINE_WIDTH: 0.488361
G1 F8081.887
G1 X218.519 Y102.184 E.00431
; LINE_WIDTH: 0.44739
G1 F8900.537
G1 X218.436 Y102.634 E.01508
; LINE_WIDTH: 0.403837
G1 F9974.602
G1 X218.353 Y103.084 E.01346
; WIPE_START
G1 X218.436 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X224.891 Y98.562 Z1.6 F42000
G1 X227.543 Y96.889 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X227.447 Y97.425 I-.507 J.186 E.01894
G3 X226.372 Y97.425 I-.535 J-8.795 E.03567
G1 X225.717 Y96.861 E.02868
G2 X223.752 Y97.202 I-.756 J1.475 E.07101
G1 X223.474 Y97.441 E.01215
G1 X221.154 Y97.441 E.07696
G3 X220.476 Y96.861 I2.906 J-4.08 E.02965
G2 X219.165 Y96.733 I-.797 J1.391 E.045
G1 X218.856 Y96.955 E.01263
G1 X218.855 Y94.508 E.08118
G1 X219.165 Y94.24 E.01359
G3 X221.131 Y94.582 I.756 J1.475 E.07101
G1 X221.786 Y95.146 E.02868
G2 X223.752 Y94.804 I.756 J-1.475 E.07101
G1 X224.407 Y94.24 E.02868
G3 X226.372 Y94.582 I.756 J1.475 E.07101
G1 X227.027 Y95.146 E.02868
G1 X227.542 Y95.308 E.0179
G1 X227.542 Y92.715 E.08603
G1 X227.027 Y92.653 E.01719
G3 X225.717 Y91.62 I5.126 J-7.845 E.05544
G2 X223.752 Y91.961 I-.756 J1.475 E.07101
G1 X223.096 Y92.525 E.02868
G3 X221.131 Y92.184 I-.756 J-1.475 E.07101
G1 X220.476 Y91.62 E.02868
G2 X219.165 Y91.492 I-.797 J1.391 E.045
G1 X218.854 Y91.715 E.01271
G1 X218.853 Y89.866 E.06132
G1 X219.211 Y89.848 E.01186
G1 X219.188 Y89.539 E.01025
G1 X220.346 Y89.168 E.04034
G3 X220.874 Y89.156 I.311 J2.154 E.01758
G3 X221.786 Y89.905 I-3.731 J5.477 E.03919
G2 X223.752 Y89.563 I.756 J-1.475 E.07101
G1 X224.223 Y89.157 E.02065
G1 X226.117 Y89.157 E.0628
G3 X227.027 Y89.905 I-3.725 J5.468 E.03914
G1 X227.542 Y90.066 E.01788
G1 X227.542 Y91.695 E.05401
M204 S10000
G1 X218.769 Y89.522 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136263
G1 F15000
M204 S6000
G1 X218.754 Y89.229 E.00223
; LINE_WIDTH: 0.110029
G1 X218.738 Y88.936 E.0016
; WIPE_START
G1 X218.754 Y89.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X213.417 Y94.685 Z1.6 F42000
G1 X206.52 Y101.737 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.541132
G1 F7225.847
M204 S6000
G1 X206.843 Y101.95 E.0157
G1 X206.862 Y102.067 E.00481
; LINE_WIDTH: 0.488426
G1 F8080.697
G1 X206.881 Y102.184 E.0043
; LINE_WIDTH: 0.447458
G1 F8899.055
G1 X206.964 Y102.634 E.01509
; LINE_WIDTH: 0.403892
G1 F9973.072
G1 X207.047 Y103.084 E.01346
; OBJECT_ID: 6
; WIPE_START
G1 X206.964 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X199.549 Y100.824 Z1.6 F42000
G1 X185.491 Y97.392 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X185.486 Y100.336 I-76.662 J1.348 E.09765
G3 X185.328 Y101.51 I-7.011 J-.347 E.03936
G1 X185.109 Y101.487 E.00729
G1 X185.109 Y88.489 E.43116
G2 X173.491 Y88.489 I-5.809 J.011 E.60468
G1 X173.491 Y101.487 E.43117
G1 X173.272 Y101.51 E.00729
G3 X173.109 Y100.089 I6.804 J-1.501 E.04755
G1 X173.109 Y88.509 E.38412
G3 X179.517 Y82.313 I6.192 J-.008 E.33006
G3 X185.443 Y87.734 I-.218 J6.188 E.28989
G1 X185.6 Y89.234 E.05002
G1 X186.871 Y88.826 E.04428
G3 X187.02 Y88.808 I.171 J.787 E.00497
G1 X194.019 Y88.809 E.23219
G3 X194.49 Y89.285 I-.025 J.495 E.02438
G1 X194.491 Y97.273 E.26497
G3 X193.97 Y97.79 I-.495 J.022 E.02739
G1 X187.019 Y97.79 E.23059
G3 X186.894 Y97.777 I-.003 J-.603 E.00416
G1 X185.549 Y97.408 E.04629
M204 S10000
G1 X185.898 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X185.893 Y100.351 I-63.243 J1.083 E.08045
G3 X184.879 Y103.619 I-6.613 J-.26 E.11478
G1 X184.702 Y103.568 E.00612
G1 X184.702 Y88.493 E.50006
G2 X173.898 Y88.493 I-5.402 J.007 E.56252
G1 X173.898 Y103.568 E.50007
G1 X173.721 Y103.619 E.00612
G3 X172.702 Y100.093 I5.598 J-3.527 E.12336
G1 X172.702 Y88.505 E.38438
G3 X179.532 Y81.906 I6.599 J-.004 E.35163
G3 X185.847 Y87.684 I-.233 J6.595 E.30893
G1 X185.953 Y88.693 E.03366
G1 X186.762 Y88.434 E.0282
G3 X187.012 Y88.401 I.28 J1.175 E.00836
G1 X194.035 Y88.402 E.23298
G3 X194.897 Y89.267 I-.045 J.907 E.04442
G1 X194.898 Y97.283 E.26592
G3 X193.982 Y98.197 I-.901 J.012 E.04785
G1 X187.011 Y98.197 E.23124
G3 X186.802 Y98.174 I.006 J-1.036 E.00698
G1 X185.956 Y97.942 E.02912
M204 S250
G1 X186.29 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X186.27 Y100.633 I-28.752 J.828 E.06739
G3 X186.183 Y101.309 I-7.462 J-.61 E.02095
G3 X184.31 Y104.972 I-6.968 J-1.252 E.12828
G1 X184.31 Y88.497 E.50624
G2 X174.29 Y88.497 I-5.01 J.003 E.48344
G1 X174.29 Y104.972 E.50624
G3 X172.31 Y100.097 I5.021 J-4.879 E.16577
G1 X172.31 Y88.501 E.3563
G3 X179.547 Y81.515 I6.991 J0 E.34497
G3 X186.293 Y88.172 I-.267 J7.017 E.31968
G3 X187.004 Y88.009 I.849 J2.064 E.02254
G1 X194.05 Y88.01 E.21651
G3 X195.289 Y89.249 I-.065 J1.303 E.05902
G1 X195.29 Y97.293 E.24717
G3 X193.994 Y98.589 I-1.293 J.003 E.06258
G1 X187.004 Y98.589 E.21478
G3 X186.346 Y98.461 I.12 J-2.366 E.02066
; WIPE_START
M204 S6000
G1 X186.29 Y100.096 E-.62202
G1 X186.276 Y100.459 E-.13798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.478 Y101.744 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545328
G1 F7165.499
M204 S6000
G1 X185.157 Y101.95 E.01561
; LINE_WIDTH: 0.526757
G1 F7440.52
G1 X185.138 Y102.067 E.00468
; LINE_WIDTH: 0.488373
G1 F8081.672
G1 X185.119 Y102.184 E.00431
; LINE_WIDTH: 0.447439
G1 F8899.477
G1 X185.036 Y102.634 E.01509
; LINE_WIDTH: 0.403933
G1 F9971.947
G1 X184.953 Y103.084 E.01346
; WIPE_START
G1 X185.036 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X191.491 Y98.562 Z1.6 F42000
G1 X194.143 Y96.89 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X194.047 Y97.425 I-.552 J.178 E.01878
G3 X192.972 Y97.425 I-.536 J-8.789 E.03568
G1 X192.317 Y96.861 E.02868
G2 X190.352 Y97.202 I-.756 J1.475 E.07101
G1 X190.074 Y97.441 E.01215
G1 X187.754 Y97.441 E.07696
G3 X187.076 Y96.861 I2.906 J-4.08 E.02965
G2 X185.765 Y96.733 I-.797 J1.391 E.045
G1 X185.456 Y96.955 E.01263
G1 X185.455 Y94.508 E.08118
G1 X185.765 Y94.24 E.01359
G3 X187.731 Y94.582 I.756 J1.475 E.07101
G1 X188.386 Y95.146 E.02868
G2 X190.352 Y94.804 I.756 J-1.475 E.07101
G1 X191.007 Y94.24 E.02868
G3 X192.972 Y94.582 I.756 J1.475 E.07101
G1 X193.627 Y95.146 E.02868
G1 X194.142 Y95.308 E.0179
G1 X194.142 Y92.715 E.08603
G1 X193.627 Y92.653 E.01719
G3 X192.317 Y91.62 I5.126 J-7.845 E.05544
G2 X190.352 Y91.961 I-.756 J1.475 E.07101
G1 X189.696 Y92.525 E.02868
G3 X187.731 Y92.184 I-.756 J-1.475 E.07101
G1 X187.076 Y91.62 E.02868
G2 X185.765 Y91.492 I-.797 J1.391 E.045
G1 X185.454 Y91.715 E.01271
G1 X185.454 Y89.866 E.06133
G1 X185.803 Y89.848 E.01161
G1 X185.787 Y89.54 E.01023
G1 X186.946 Y89.168 E.04038
G3 X187.474 Y89.156 I.311 J2.163 E.01756
G3 X188.386 Y89.905 I-3.731 J5.477 E.03919
G2 X190.352 Y89.563 I.756 J-1.475 E.07101
G1 X190.823 Y89.157 E.02065
G1 X192.717 Y89.157 E.0628
G3 X193.627 Y89.905 I-3.725 J5.468 E.03914
G1 X194.142 Y90.066 E.01788
G1 X194.142 Y91.695 E.05401
M204 S10000
G1 X185.369 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136355
G1 F15000
M204 S6000
G1 X185.354 Y89.228 E.00224
; LINE_WIDTH: 0.110064
G1 X185.338 Y88.935 E.00161
; WIPE_START
G1 X185.354 Y89.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X180.019 Y94.686 Z1.6 F42000
G1 X173.122 Y101.742 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.541038
G1 F7227.203
M204 S6000
G1 X173.443 Y101.95 E.01552
G1 X173.462 Y102.067 E.00481
; LINE_WIDTH: 0.488426
G1 F8080.697
G1 X173.481 Y102.184 E.0043
; LINE_WIDTH: 0.447496
G1 F8898.219
G1 X173.564 Y102.634 E.01509
; LINE_WIDTH: 0.404006
G1 F9969.921
G1 X173.647 Y103.084 E.01347
; OBJECT_ID: 5
; WIPE_START
G1 X173.564 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X166.149 Y100.824 Z1.6 F42000
G1 X152.091 Y97.392 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.091 Y100.389 E.09942
G3 X151.927 Y101.778 I-6.642 J-.079 E.04649
G1 X151.709 Y101.755 E.00727
G1 X151.709 Y88.189 E.44999
G2 X140.691 Y88.189 I-5.509 J.011 E.57342
G1 X140.691 Y101.755 E.44999
G1 X140.473 Y101.778 E.00727
G3 X140.309 Y100.389 I5.927 J-1.403 E.0465
G1 X140.309 Y88.209 E.40403
G3 X146.404 Y82.313 I5.9 J0 E.31388
G3 X152.069 Y87.699 I-.214 J5.898 E.28343
G1 X152.17 Y89.234 E.05102
G1 X153.474 Y88.825 E.04536
G3 X153.625 Y88.808 I.15 J.649 E.00504
G1 X160.613 Y88.809 E.2318
M73 P55 R11
G3 X161.09 Y89.28 I-.016 J.493 E.02443
G1 X161.091 Y97.279 E.26536
G3 X160.57 Y97.79 I-.495 J.016 E.02719
G1 X153.619 Y97.79 E.23059
G3 X153.494 Y97.778 I-.003 J-.6 E.00416
G1 X152.149 Y97.408 E.04629
M204 S10000
G1 X152.498 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X152.493 Y100.645 I-69.426 J1.234 E.0902
G3 X151.478 Y103.833 I-6.307 J-.252 E.11234
G1 X151.302 Y103.782 E.00608
G1 X151.302 Y88.193 E.51711
G2 X141.098 Y88.193 I-5.102 J.007 E.53126
G1 X141.098 Y103.782 E.51711
G1 X140.922 Y103.833 E.00608
G3 X139.902 Y100.393 I5.296 J-3.442 E.12069
G1 X139.902 Y88.205 E.4043
G3 X146.419 Y81.906 I6.307 J.005 E.33544
G3 X152.475 Y87.665 I-.23 J6.306 E.30298
G1 X152.542 Y88.691 E.03411
G1 X153.368 Y88.432 E.0287
G3 X153.615 Y88.401 I.259 J1.059 E.00828
G1 X160.631 Y88.402 E.23275
G3 X161.497 Y89.264 I-.038 J.904 E.04447
G1 X161.498 Y97.287 E.26615
G3 X160.582 Y98.197 I-.901 J.009 E.04773
G1 X153.611 Y98.197 E.23124
G3 X153.402 Y98.174 I.006 J-1.034 E.00698
G1 X152.556 Y97.942 E.02912
M204 S250
G1 X152.89 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.885 Y100.66 I-56.676 J.978 E.06822
G3 X150.91 Y105.149 I-6.747 J-.29 E.1542
G1 X150.91 Y88.197 E.52089
G2 X141.49 Y88.197 I-4.71 J.003 E.45448
G1 X141.49 Y105.149 E.52089
G3 X139.524 Y100.805 I4.714 J-4.751 E.14981
G3 X139.51 Y100.397 I5.214 J-.378 E.01254
G1 X139.51 Y88.201 E.37474
G3 X146.433 Y81.514 I6.7 J.01 E.32996
G3 X152.901 Y88.168 I-.243 J6.706 E.3148
G3 X153.605 Y88.009 I.819 J1.996 E.02229
G1 X160.649 Y88.01 E.21645
G3 X161.889 Y89.249 I-.06 J1.299 E.05907
G1 X161.89 Y97.295 E.24724
G3 X160.594 Y98.589 I-1.293 J.001 E.06254
G1 X153.604 Y98.589 E.21478
G3 X152.946 Y98.461 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X152.89 Y100.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.076 Y102.012 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.527594
G1 F7427.683
M204 S6000
G1 X151.755 Y102.215 E.01501
; LINE_WIDTH: 0.524111
G1 F7481.448
G1 X151.737 Y102.321 E.00418
; LINE_WIDTH: 0.488824
G1 F8073.497
G1 X151.72 Y102.426 E.00387
; LINE_WIDTH: 0.4495
G1 F8854.352
G1 X151.637 Y102.867 E.01488
; LINE_WIDTH: 0.406114
G1 F9912.078
G1 X151.554 Y103.308 E.01329
; WIPE_START
G1 X151.637 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.011 Y103.179 Z1.6 F42000
G1 X140.846 Y103.309 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.405903
G1 F9917.831
M204 S6000
G1 X140.763 Y102.867 E.01328
; LINE_WIDTH: 0.449381
G1 F8856.941
G1 X140.68 Y102.426 E.01487
; LINE_WIDTH: 0.488779
G1 F8074.312
G1 X140.663 Y102.321 E.00388
; LINE_WIDTH: 0.526903
G1 F7438.282
G1 X140.645 Y102.215 E.00421
G1 X140.324 Y102.012 E.01499
; WIPE_START
G1 X140.645 Y102.215 E-.59341
G1 X140.663 Y102.321 E-.16659
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.643 Y96.537 Z1.6 F42000
G1 X151.939 Y89.225 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.104368
G1 F15000
M204 S6000
G1 X151.948 Y89.517 E.00146
M204 S10000
G1 X160.742 Y91.682 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X160.742 Y90.054 E.05401
G1 X160.527 Y89.987 E.00744
G2 X159.502 Y89.157 I-5.152 J5.319 E.0438
G1 X157.818 Y89.157 E.05585
G1 X157.252 Y89.645 E.02481
G3 X155.286 Y89.987 I-1.209 J-1.133 E.07101
G2 X154.26 Y89.156 I-5.158 J5.327 E.04386
G2 X153.547 Y89.168 I-.308 J3.129 E.0237
G1 X152.35 Y89.543 E.04161
G1 X152.36 Y89.852 E.01026
G1 X152.057 Y89.862 E.01004
G1 X152.057 Y92.01 E.07125
G3 X153.976 Y91.702 I1.145 J1.006 E.06988
G1 X154.631 Y92.266 E.02868
G2 X156.596 Y92.607 I1.209 J-1.133 E.07101
G1 X157.252 Y92.043 E.02868
G3 X159.217 Y91.702 I1.209 J1.133 E.07101
G2 X160.527 Y92.735 I6.437 J-6.811 E.05544
G1 X160.742 Y92.761 E.00717
G1 X160.742 Y95.296 E.08408
G1 X160.527 Y95.228 E.00747
G1 X159.872 Y94.664 E.02868
G2 X157.907 Y94.322 I-1.209 J1.133 E.07101
G1 X157.252 Y94.887 E.02868
G3 X155.286 Y95.228 I-1.209 J-1.133 E.07101
G1 X154.631 Y94.664 E.02868
G2 X152.665 Y94.322 I-1.209 J1.133 E.07101
G1 X152.057 Y94.846 E.02662
G1 X152.057 Y97.022 E.07217
G1 X152.289 Y97.085 E.00795
G1 X152.665 Y96.815 E.01538
G3 X153.976 Y96.943 I.513 J1.519 E.045
G1 X154.555 Y97.442 E.02535
G1 X157.069 Y97.442 E.08341
G1 X157.252 Y97.285 E.00798
G3 X159.217 Y96.943 I1.209 J1.133 E.07101
G1 X159.796 Y97.442 E.02535
G1 X160.543 Y97.442 E.02478
G2 X160.732 Y97.343 I.022 J-.186 E.0075
G2 X160.743 Y96.688 I-2.104 J-.362 E.02181
; OBJECT_ID: 4
; WIPE_START
G1 X160.732 Y97.343 E-.24888
G1 X160.543 Y97.442 E-.08077
G1 X159.796 Y97.442 E-.28391
G1 X159.504 Y97.19 E-.14644
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X151.872 Y97.229 Z1.6 F42000
G1 X119.291 Y97.393 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X119.291 Y100.589 E.10603
G3 X119.127 Y101.957 I-6.412 J-.076 E.04578
G1 X118.909 Y101.933 E.00726
G1 X118.909 Y87.99 E.46252
G2 X108.291 Y87.99 I-5.309 J.012 E.55247
G1 X108.291 Y101.933 E.46252
G1 X108.073 Y101.957 E.00726
G3 X107.909 Y100.589 I6.249 J-1.444 E.04578
G1 X107.909 Y88.01 E.41728
G3 X113.79 Y82.313 I5.699 J0 E.30299
G3 X119.282 Y87.678 I-.19 J5.688 E.27951
G1 X119.337 Y89.194 E.05032
G1 X120.727 Y88.815 E.04778
G3 X120.819 Y88.809 I.087 J.61 E.00306
G1 X127.809 Y88.81 E.23189
G3 X128.29 Y89.28 I-.016 J.497 E.0245
G1 X128.291 Y97.28 E.26536
G3 X127.77 Y97.79 I-.495 J.016 E.02718
G1 X120.819 Y97.79 E.23059
G3 X120.694 Y97.778 I-.003 J-.603 E.00416
G1 X119.349 Y97.409 E.04629
M204 S10000
G1 X119.698 Y97.927 F42000
G1 F8843.478
M204 S6000
G1 X119.698 Y100.593 E.08846
G3 X118.677 Y103.976 I-6.116 J-.001 E.11889
G1 X118.502 Y103.924 E.00605
G1 X118.502 Y87.994 E.52843
G2 X108.698 Y87.994 I-4.902 J.008 E.51031
G1 X108.698 Y103.924 E.52843
G1 X108.523 Y103.976 E.00605
G3 X107.502 Y100.593 I5.095 J-3.383 E.11889
G1 X107.502 Y88.006 E.41756
G3 X113.802 Y81.906 I6.107 J.005 E.32447
G3 X119.688 Y87.655 I-.202 J6.095 E.29954
G1 X119.725 Y88.665 E.03354
G1 X120.602 Y88.424 E.03018
G3 X120.811 Y88.402 I.215 J1.016 E.00698
G1 X127.829 Y88.403 E.2328
G3 X128.697 Y89.264 I-.041 J.909 E.04447
G1 X128.698 Y97.288 E.26615
G3 X127.782 Y98.198 I-.901 J.009 E.04773
G1 X120.811 Y98.198 E.23124
G3 X120.603 Y98.175 I.006 J-1.037 E.00698
G1 X119.756 Y97.942 E.02913
M204 S250
G1 X120.09 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X120.085 Y100.857 I-60.747 J1.078 E.07426
G3 X118.11 Y105.265 I-6.495 J-.264 E.15206
G1 X118.11 Y87.997 E.53059
G2 X109.09 Y87.997 I-4.51 J.005 E.43508
G1 X109.09 Y105.265 E.53059
G3 X107.11 Y100.597 I4.565 J-4.69 E.15999
G1 X107.11 Y88.002 E.38703
G3 X113.815 Y81.514 I6.5 J.009 E.31973
G3 X120.099 Y88.156 I-.228 J6.51 E.31143
G3 X120.804 Y88.01 I.823 J2.191 E.02222
G1 X127.849 Y88.011 E.21646
G3 X129.089 Y89.249 I-.066 J1.306 E.05901
G1 X129.09 Y97.295 E.24724
G3 X127.794 Y98.59 I-1.293 J.001 E.06255
G1 X120.804 Y98.59 E.21477
G3 X120.146 Y98.461 I.12 J-2.363 E.02066
; WIPE_START
M204 S6000
G1 X120.095 Y100.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.275 Y102.19 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.515168
G1 F7623.126
M204 S6000
G1 X118.954 Y102.392 E.0146
; LINE_WIDTH: 0.522202
G1 F7511.249
G1 X118.937 Y102.49 E.00387
; LINE_WIDTH: 0.488921
G1 F8071.742
G1 X118.92 Y102.587 E.0036
; LINE_WIDTH: 0.450693
G1 F8828.458
G1 X118.837 Y103.022 E.01471
; LINE_WIDTH: 0.407538
G1 F9873.363
G1 X118.754 Y103.457 E.01315
; WIPE_START
G1 X118.837 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.211 Y103.341 Z1.6 F42000
G1 X108.446 Y103.457 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.407444
G1 F9875.91
M204 S6000
G1 X108.363 Y103.022 E.01316
; LINE_WIDTH: 0.450735
G1 F8827.544
G1 X108.28 Y102.587 E.01472
; LINE_WIDTH: 0.488993
G1 F8070.428
G1 X108.263 Y102.49 E.00359
; LINE_WIDTH: 0.516495
G1 F7601.765
G1 X108.246 Y102.392 E.00381
G1 X107.925 Y102.19 E.01464
; WIPE_START
G1 X108.246 Y102.392 E-.60292
G1 X108.263 Y102.49 E-.15708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.557 Y100.243 Z1.6 F42000
G1 X127.942 Y96.429 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X127.943 Y97.262 E.02765
G3 X127.892 Y97.399 I-.155 J.02 E.00502
G3 X127.256 Y97.442 I-.38 J-.885 E.02154
G1 X126.617 Y96.997 E.02583
G2 X125.307 Y96.869 I-.797 J1.391 E.045
G1 X124.652 Y97.339 E.02674
G1 X124.061 Y97.442 E.01988
G1 X122.015 Y97.442 E.06789
G1 X121.376 Y96.997 E.02583
G2 X120.065 Y96.869 I-.797 J1.391 E.045
G1 X119.687 Y97.14 E.01545
G1 X119.257 Y97.022 E.01478
G1 X119.257 Y95.05 E.06542
G1 X119.41 Y94.941 E.00624
G3 X121.376 Y94.248 I1.521 J1.184 E.07303
G1 X122.031 Y94.718 E.02674
G2 X123.996 Y95.41 I1.521 J-1.184 E.07303
G1 X124.652 Y94.941 E.02674
G3 X126.617 Y94.248 I1.521 J1.184 E.07303
G3 X127.927 Y95.282 I-5.125 J7.844 E.05544
G1 X127.942 Y92.791 E.08263
G1 X127.272 Y92.32 E.02716
G2 X125.307 Y91.628 I-1.521 J1.184 E.07303
G1 X124.652 Y92.097 E.02674
G3 X122.686 Y92.789 I-1.521 J-1.184 E.07303
G1 X122.031 Y92.32 E.02674
G2 X120.065 Y91.628 I-1.521 J1.184 E.07303
G2 X119.257 Y92.229 I2.958 J4.82 E.03346
G1 X119.257 Y89.809 E.08028
G2 X119.69 Y89.458 I-1.744 J-2.595 E.01849
G1 X120.758 Y89.165 E.03675
G3 X121.585 Y89.157 I.452 J4.155 E.02748
G1 X122.031 Y89.477 E.01819
G2 X123.996 Y90.169 I1.521 J-1.184 E.07303
G2 X125.28 Y89.158 I-5.013 J-7.687 E.05428
G1 X126.828 Y89.158 E.05133
G3 X127.927 Y90.041 I-4.388 J6.593 E.04684
G1 X127.942 Y91.674 E.05416
; OBJECT_ID: 2
; WIPE_START
G1 X127.927 Y90.041 E-.62047
G1 X127.641 Y89.811 E-.13953
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X122.849 Y83.871 Z1.6 F42000
G1 X107.888 Y65.326 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X107.863 Y65.273 E.00195
G3 X107.291 Y62.41 I6.94 J-2.876 E.09748
G1 X107.291 Y39.39 E.76359
G3 X114.79 Y31.891 I7.523 J.023 E.39044
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.023 J7.523 E.39045
G1 X175.809 Y62.41 E.76359
G3 X168.31 Y69.909 I-7.512 J-.013 E.39059
G1 X114.79 Y69.909 E1.77533
G3 X108.25 Y66.069 I.013 J-7.512 E.26374
G1 X107.914 Y65.38 E.02542
M204 S10000
G1 X108.253 Y65.149 F42000
G1 F8843.478
M204 S6000
G1 X108.239 Y65.117 E.00115
G3 X107.698 Y62.406 I6.564 J-2.72 E.09231
G1 X107.698 Y39.394 E.76333
G3 X114.794 Y32.298 I7.115 J.019 E.3695
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.019 J7.115 E.3695
G1 X175.402 Y62.406 E.76333
G3 X168.306 Y69.502 I-7.105 J-.009 E.36964
G1 X114.794 Y69.502 E1.77508
G3 X108.605 Y65.87 I.009 J-7.105 E.24955
G1 X108.28 Y65.203 E.02462
M204 S250
G1 X108.606 Y64.978 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X108.602 Y64.967 E.00035
G3 X108.09 Y62.402 I6.201 J-2.571 E.0809
G1 X108.09 Y39.398 E.70685
G3 X114.798 Y32.69 I6.722 J.015 E.32357
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.015 J6.722 E.32357
G1 X175.01 Y62.402 E.70685
G3 X168.302 Y69.11 I-6.713 J-.005 E.3237
G1 X114.798 Y69.11 E1.64403
G3 X108.947 Y65.678 I.005 J-6.713 E.21851
G1 X108.632 Y65.032 E.02209
; WIPE_START
M204 S6000
G1 X108.602 Y64.967 E-.02706
G1 X108.418 Y64.473 E-.20026
G1 X108.219 Y63.709 E-.30013
G1 X108.136 Y63.188 E-.20032
G1 X108.131 Y63.104 E-.03223
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.199 Y58.474 Z1.6 F42000
G1 X149.541 Y31.509 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I.006 J7.895 E.41177
G1 X176.191 Y62.39 E.76229
G3 X168.29 Y70.291 I-7.895 J.006 E.41177
G1 X114.81 Y70.291 E1.77403
G3 X106.909 Y62.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E.76229
G3 X114.81 Y31.509 I7.895 J-.006 E.41176
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.53 E.16517
G3 X134.08 Y26.009 I.498 J-.023 E.02748
G1 X149.048 Y26.01 E.49652
G3 X149.541 Y26.52 I-.002 J.496 E.02623
G1 X149.541 Y31.449 E.16351
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I.002 J8.302 E.4327
G1 X176.598 Y62.394 E.76256
G3 X168.294 Y70.698 I-8.302 J.002 E.4327
G1 X114.806 Y70.698 E1.7743
G3 X106.502 Y62.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E.76256
G3 X114.806 Y31.102 I8.302 J-.002 E.4327
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.518 E.15207
G3 X134.068 Y25.602 I.906 J-.01 E.04786
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
G3 X176.99 Y39.402 I-.002 J8.694 E.41951
G1 X176.99 Y62.398 E.7066
G3 X168.298 Y71.09 I-8.694 J-.002 E.41951
G1 X114.802 Y71.09 E1.64378
G3 X106.11 Y62.398 I.014 J-8.706 E.41935
G1 X106.11 Y39.402 E.7066
G3 X114.802 Y30.71 I8.694 J.002 E.41951
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.506 E.12917
G3 X134.056 Y25.21 I1.3 J.004 E.06251
G1 X149.075 Y25.211 E.46148
G3 X150.34 Y26.504 I-.034 J1.299 E.0615
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.975 Y26.358 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X147.347 Y26.359 E.05401
M73 P56 R11
G3 X146.136 Y26.456 I-.712 J-1.296 E.0415
G1 X146.003 Y26.36 E.00545
G1 X142.095 Y26.362 E.12964
G3 X140.895 Y26.456 I-.703 J-1.286 E.04113
G1 X140.766 Y26.363 E.00526
G1 X136.843 Y26.366 E.13015
G3 X135.654 Y26.456 I-.694 J-1.276 E.04076
G1 X135.53 Y26.367 E.00507
G1 X134.021 Y26.368 E.05005
G2 X133.913 Y26.486 I.055 J.159 E.00554
G1 X133.911 Y27.863 E.04568
G1 X134.343 Y27.915 E.01444
G1 X134.998 Y28.384 E.02674
G2 X136.964 Y29.076 I1.521 J-1.184 E.07303
G1 X137.619 Y28.607 E.02674
G3 X139.585 Y27.915 I1.521 J1.184 E.07303
G1 X140.24 Y28.384 E.02674
G2 X142.205 Y29.076 I1.521 J-1.184 E.07303
G1 X142.86 Y28.607 E.02674
G3 X144.826 Y27.915 I1.521 J1.184 E.07303
G1 X145.481 Y28.384 E.02674
G2 X147.447 Y29.076 I1.521 J-1.184 E.07303
G2 X148.757 Y28.042 I-5.128 J-7.847 E.05544
G1 X149.191 Y27.906 E.01509
G1 X149.192 Y30.483 E.08549
G1 X148.757 Y30.535 E.01454
G2 X147.477 Y31.543 I4.993 J7.659 E.05409
G1 X145.921 Y31.543 E.05163
G1 X145.481 Y31.227 E.01795
G2 X143.516 Y30.535 I-1.521 J1.184 E.07303
G2 X142.236 Y31.543 I4.993 J7.66 E.05409
G1 X140.68 Y31.543 E.05163
G1 X140.24 Y31.227 E.01795
G2 X138.274 Y30.535 I-1.521 J1.184 E.07303
G2 X136.995 Y31.543 I4.994 J7.66 E.05409
G1 X135.438 Y31.543 E.05163
G3 X134.343 Y30.663 I4.371 J-6.564 E.04665
G1 X133.908 Y30.526 E.01512
G1 X133.91 Y28.898 E.05401
; OBJECT_ID: 8
; WIPE_START
G1 X133.908 Y30.526 E-.61876
G1 X134.263 Y30.638 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X129.599 Y36.679 Z1.6 F42000
G1 X38.791 Y154.292 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G3 X38.786 Y157.051 I-69.88 J1.248 E.09153
G3 X38.627 Y158.232 I-7.063 J-.349 E.03957
G1 X38.409 Y158.209 E.00727
G1 X38.409 Y145.59 E.4186
G2 X26.391 Y145.59 I-6.009 J.011 E.62552
G1 X26.391 Y158.209 E.4186
G1 X26.173 Y158.232 E.00727
G3 X26.009 Y156.789 I7.015 J-1.528 E.04826
G1 X26.009 Y145.61 E.37084
G3 X32.452 Y139.21 I6.392 J-.008 E.33501
G3 X38.721 Y144.657 I-.053 J6.392 E.29984
G1 X38.912 Y146.141 E.04965
G1 X40.204 Y145.719 E.04511
G3 X40.33 Y145.708 I.115 J.63 E.00419
G1 X47.358 Y145.713 E.23313
G3 X47.79 Y146.19 I-.059 J.487 E.02329
G1 X47.791 Y154.17 E.2647
G3 X47.27 Y154.69 I-.495 J.025 E.02752
G1 X40.319 Y154.69 E.23059
G3 X40.194 Y154.678 I-.003 J-.601 E.00415
G1 X38.849 Y154.308 E.04629
M204 S10000
G1 X39.198 Y154.826 F42000
G1 F8843.478
M204 S6000
G3 X39.193 Y157.067 I-56.786 J.983 E.07435
G3 X38.182 Y160.374 I-6.954 J-.317 E.11592
G1 X38.002 Y160.325 E.00619
G1 X38.002 Y145.593 E.48868
G2 X26.798 Y145.593 I-5.602 J.007 E.58336
G1 X26.798 Y160.325 E.48868
G1 X26.618 Y160.374 E.00619
G3 X25.602 Y156.793 I5.922 J-3.615 E.12501
G1 X25.602 Y145.605 E.37112
G3 X32.454 Y138.803 I6.799 J-.004 E.35616
G3 X39.123 Y144.597 I-.056 J6.799 E.31898
G1 X39.253 Y145.601 E.03357
G1 X40.057 Y145.335 E.02808
G3 X40.318 Y145.301 I.259 J.961 E.00877
G1 X47.335 Y145.302 E.23278
G3 X48.197 Y146.17 I-.047 J.909 E.04447
G1 X48.198 Y154.182 E.26576
G3 X47.282 Y155.097 I-.901 J.015 E.04793
G1 X40.311 Y155.097 E.23124
G3 X40.103 Y155.075 I.006 J-1.035 E.00698
G1 X39.256 Y154.842 E.02913
M204 S250
G1 X39.59 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X39.568 Y157.366 I-25.706 J.728 E.06227
G3 X37.61 Y161.753 I-7.181 J-.575 E.15047
G1 X37.61 Y145.597 E.49641
G2 X27.19 Y145.597 I-5.21 J.003 E.50274
G1 X27.19 Y161.753 E.49641
G3 X25.21 Y156.797 I5.22 J-4.959 E.16798
G1 X25.21 Y145.601 E.34401
G3 X26.535 Y141.442 I7.205 J.005 E.13627
G3 X32.457 Y138.411 I5.882 J4.191 E.21242
G3 X39.581 Y145.079 I-.076 J7.221 E.32922
G3 X40.306 Y144.909 I.827 J1.892 E.02302
G1 X47.351 Y144.91 E.21645
G3 X48.589 Y146.151 I-.068 J1.306 E.05901
G1 X48.59 Y154.193 E.24712
G3 X47.294 Y155.489 I-1.293 J.003 E.06261
G1 X40.304 Y155.489 E.21478
G3 X39.646 Y155.361 I.12 J-2.365 E.02066
; WIPE_START
M204 S6000
G1 X39.59 Y156.797 E-.54618
G1 X39.568 Y157.359 E-.21382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.495 Y158.423 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532185
G1 F7357.988
M204 S6000
G1 X38.443 Y158.774 E.01415
; LINE_WIDTH: 0.495803
G1 F7949.078
G1 X38.421 Y158.899 E.0047
; LINE_WIDTH: 0.453295
G1 F8772.481
G1 X38.4 Y159.025 E.00426
; LINE_WIDTH: 0.407942
G1 F9862.437
G1 X38.322 Y159.436 E.01245
; LINE_WIDTH: 0.359727
G1 F11363.381
G1 X38.244 Y159.847 E.0108
; WIPE_START
G1 X38.322 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X44.851 Y155.482 Z1.6 F42000
G1 X47.443 Y153.912 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X47.347 Y154.326 I-.444 J.115 E.01464
G3 X46.173 Y154.342 I-.639 J-3.762 E.0391
G3 X45.417 Y153.705 I3.183 J-4.547 E.03283
G2 X43.452 Y154.047 I-.756 J1.475 E.07101
G1 X43.109 Y154.342 E.01499
G1 X40.932 Y154.342 E.07223
G3 X40.176 Y153.705 I3.182 J-4.547 E.03283
G2 X38.756 Y153.656 I-.764 J1.52 E.04862
G1 X38.755 Y151.18 E.08214
G1 X38.865 Y151.085 E.00484
G3 X40.831 Y151.426 I.756 J1.475 E.07101
G1 X41.486 Y151.991 E.02868
G2 X43.452 Y151.649 I.756 J-1.475 E.07101
G1 X44.107 Y151.085 E.02868
G3 X46.072 Y151.426 I.756 J1.475 E.07101
G1 X46.727 Y151.991 E.02868
G1 X47.442 Y152.189 E.02461
G1 X47.442 Y150.561 E.05401
M204 S10000
G1 X42.28 Y146.057 F42000
G1 F8843.478
M204 S6000
G1 X40.652 Y146.057 E.05401
G3 X41.486 Y146.749 I-3.457 J5.013 E.03601
G2 X43.452 Y146.408 I.756 J-1.475 E.07101
G1 X43.858 Y146.057 E.01781
G1 X45.894 Y146.058 E.06754
G3 X46.727 Y146.749 I-3.451 J5.004 E.03596
G1 X47.442 Y146.948 E.02459
G1 X47.442 Y149.557 E.08655
G1 X46.727 Y149.498 E.02378
G3 X45.417 Y148.464 I5.126 J-7.845 E.05544
G2 X43.452 Y148.806 I-.756 J1.475 E.07101
G1 X42.796 Y149.37 E.02868
G3 X40.831 Y149.028 I-.756 J-1.475 E.07101
G1 X40.176 Y148.464 E.02868
G2 X38.754 Y148.416 I-.763 J1.515 E.0487
G1 X38.753 Y146.788 E.05401
M204 S10000
G1 X38.678 Y146.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.148608
G1 F15000
M204 S6000
G1 X38.658 Y146.119 E.00271
; LINE_WIDTH: 0.114144
G1 X38.638 Y145.805 E.00183
; WIPE_START
G1 X38.658 Y146.119 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.25 Y151.505 Z1.6 F42000
G1 X26.305 Y158.423 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.532284
G1 F7356.489
M204 S6000
G1 X26.357 Y158.773 E.01413
; LINE_WIDTH: 0.495924
G1 F7946.955
G1 X26.379 Y158.899 E.00472
; LINE_WIDTH: 0.453251
G1 F8773.403
G1 X26.4 Y159.025 E.00427
; LINE_WIDTH: 0.407845
G1 F9865.051
G1 X26.478 Y159.436 E.01244
; LINE_WIDTH: 0.359734
G1 F11363.138
G1 X26.556 Y159.847 E.0108
; OBJECT_ID: 9
; WIPE_START
G1 X26.478 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X34.064 Y158.601 Z1.6 F42000
G1 X73.191 Y154.293 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X73.186 Y156.758 I-63.83 J1.099 E.08179
G3 X73.027 Y157.964 I-7.395 J-.357 E.04039
G1 X72.809 Y157.941 E.00728
G1 X72.809 Y145.89 E.39974
G2 X66.009 Y139.611 I-6.318 J.02 E.34454
G2 X60.191 Y145.89 I.502 J6.301 E.31197
G1 X60.191 Y157.941 E.39974
G1 X59.973 Y157.964 E.00728
G3 X59.809 Y156.49 I6.679 J-1.487 E.04929
G1 X59.809 Y145.91 E.35095
G3 X66.703 Y139.213 I6.701 J.002 E.35549
G3 X73.082 Y144.697 I-.215 J6.703 E.30161
G1 X73.322 Y146.177 E.04976
G1 X74.544 Y145.735 E.04311
G3 X74.729 Y145.709 I.168 J.517 E.00621
G1 X81.709 Y145.71 E.23155
G3 X82.19 Y146.191 I-.021 J.502 E.02475
G1 X82.191 Y154.17 E.26469
G3 X81.67 Y154.691 I-.495 J.026 E.02754
G1 X74.719 Y154.691 E.23059
G3 X74.595 Y154.678 I-.003 J-.6 E.00415
G1 X73.249 Y154.309 E.0463
M204 S10000
G1 X73.598 Y154.827 F42000
G1 F8843.478
M204 S6000
G3 X73.593 Y156.774 I-50.414 J.834 E.06459
G3 X72.583 Y160.157 I-7.134 J-.286 E.11833
G1 X72.402 Y160.108 E.00622
G1 X72.402 Y145.894 E.47152
G2 X66.042 Y140.017 I-5.903 J.008 E.32251
G2 X60.598 Y145.894 I.469 J5.894 E.29196
G1 X60.598 Y160.108 E.47151
G1 X60.417 Y160.157 E.00622
G3 X59.402 Y156.494 I6.178 J-3.683 E.1276
G1 X59.402 Y145.906 E.35122
G3 X66.714 Y138.807 I7.109 J.006 E.37693
G3 X73.482 Y144.623 I-.227 J7.111 E.32
G1 X73.645 Y145.628 E.03375
G1 X74.425 Y145.346 E.0275
G3 X74.717 Y145.302 I.287 J.918 E.00985
G1 X81.729 Y145.303 E.23261
G3 X82.597 Y146.17 I-.048 J.915 E.04458
G1 X82.598 Y154.182 E.26575
G3 X81.682 Y155.098 I-.9 J.015 E.04794
G1 X74.711 Y155.098 E.23124
G3 X74.503 Y155.075 I.006 J-1.035 E.00697
G1 X73.656 Y154.843 E.02913
M204 S250
G1 X73.99 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X73.901 Y157.653 I-14.993 J.578 E.07117
G1 X73.878 Y157.781 E.00399
G3 X72.01 Y161.572 I-7.383 J-1.283 E.13164
G1 X72.01 Y145.898 E.48162
G2 X60.99 Y145.898 I-5.51 J.006 E.5315
G1 X60.99 Y161.572 E.48162
G3 X59.01 Y156.497 I5.522 J-5.078 E.17128
G1 X59.01 Y145.902 E.32557
G3 X66.725 Y138.415 I7.501 J.011 E.36829
G3 X73.956 Y145.098 I-.234 J7.507 E.32997
G3 X74.706 Y144.91 I.87 J1.874 E.02389
G1 X81.749 Y144.911 E.2164
G3 X82.989 Y146.151 I-.074 J1.314 E.05899
G1 X82.99 Y154.193 E.24712
G3 X81.694 Y155.49 I-1.292 J.004 E.06262
G1 X74.704 Y155.49 E.21478
G3 X74.046 Y155.361 I.12 J-2.362 E.02066
; WIPE_START
M204 S6000
G1 X73.984 Y156.789 E-.54309
G1 X73.929 Y157.357 E-.21691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.896 Y158.155 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533322
G1 F7340.915
M204 S6000
G1 X72.842 Y158.525 E.01496
; LINE_WIDTH: 0.494485
G1 F7972.272
G1 X72.821 Y158.655 E.00483
; LINE_WIDTH: 0.451602
G1 F8808.81
G1 X72.799 Y158.784 E.00437
; LINE_WIDTH: 0.406048
G1 F9913.87
G1 X72.722 Y159.202 E.01258
; LINE_WIDTH: 0.357856
G1 F11430.898
G1 X72.644 Y159.62 E.01091
M204 S10000
G1 X72.457 Y160.326 F42000
; LINE_WIDTH: 0.108679
G1 F15000
M204 S6000
G1 X72.224 Y160.99 E.00377
; WIPE_START
G1 X72.457 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.837 Y160.759 Z1.6 F42000
G1 X60.776 Y160.99 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.108589
G1 F15000
M204 S6000
G1 X60.543 Y160.326 E.00376
M204 S10000
G1 X60.356 Y159.62 F42000
; LINE_WIDTH: 0.357894
G1 F11429.539
M204 S6000
G1 X60.278 Y159.202 E.01091
; LINE_WIDTH: 0.406058
G1 F9913.593
G1 X60.201 Y158.784 E.01258
; LINE_WIDTH: 0.451578
G1 F8809.332
G1 X60.179 Y158.655 E.00436
; LINE_WIDTH: 0.494446
G1 F7972.965
G1 X60.158 Y158.525 E.00482
; LINE_WIDTH: 0.533282
G1 F7341.52
G1 X60.104 Y158.155 E.01497
; WIPE_START
G1 X60.158 Y158.525 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.597 Y153.171 Z1.6 F42000
G1 X73.037 Y145.847 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.118727
G1 F15000
M204 S6000
G1 X73.063 Y146.163 E.00196
; LINE_WIDTH: 0.161356
G1 X73.088 Y146.478 E.00306
M204 S10000
G1 X73.374 Y146.804 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X73.153 Y146.822 E.00735
G1 X73.154 Y148.229 E.04667
G1 X73.621 Y148.174 E.0156
G1 X74.276 Y148.38 E.02278
G1 X74.931 Y148.944 E.02868
G2 X76.896 Y149.285 I1.209 J-1.133 E.07101
G1 X77.552 Y148.721 E.02868
G3 X79.517 Y148.38 I1.209 J1.133 E.07101
G2 X80.827 Y149.413 I6.437 J-6.811 E.05544
G1 X81.483 Y149.491 E.02189
G1 X81.842 Y149.378 E.01249
G1 X81.842 Y146.828 E.0846
G1 X81.483 Y146.871 E.01199
G1 X80.827 Y146.665 E.02278
G2 X80.113 Y146.058 I-3.751 J3.693 E.03113
G1 X77.86 Y146.058 E.07474
G1 X77.552 Y146.323 E.01349
G3 X75.586 Y146.665 I-1.209 J-1.133 E.07101
G2 X74.87 Y146.057 I-3.755 J3.698 E.03118
G1 X76.499 Y146.057 E.05401
M204 S10000
G1 X81.842 Y150.441 F42000
G1 F8843.478
M204 S6000
G1 X81.842 Y152.069 E.05401
G1 X81.483 Y152.112 E.01202
G1 X80.827 Y151.906 E.02278
G1 X80.172 Y151.342 E.02868
G2 X78.207 Y151 I-1.209 J1.133 E.07101
G1 X77.552 Y151.564 E.02868
G3 X75.586 Y151.906 I-1.209 J-1.133 E.07101
G2 X74.276 Y150.872 I-6.437 J6.811 E.05544
G1 X73.621 Y150.794 E.02189
G1 X73.155 Y150.941 E.0162
G1 X73.156 Y153.47 E.08391
G1 X73.621 Y153.415 E.01553
G1 X74.276 Y153.621 E.02278
G2 X75.15 Y154.342 I4.473 J-4.531 E.03766
G1 X77.111 Y154.342 E.06502
G1 X77.552 Y153.962 E.01931
G3 X79.517 Y153.621 I1.209 J1.133 E.07101
G2 X80.392 Y154.342 I4.473 J-4.531 E.03766
G1 X81.643 Y154.342 E.04152
G2 X81.843 Y154.09 I.019 J-.19 E.01267
; OBJECT_ID: 3
; WIPE_START
G1 X81.796 Y154.294 E-.07925
G1 X81.643 Y154.342 E-.06095
G1 X80.392 Y154.342 E-.4756
G1 X80.099 Y154.101 E-.14419
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X73.597 Y150.104 Z1.6 F42000
G1 X26.743 Y121.306 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X26.724 Y121.254 E.00186
G3 X26.391 Y119.01 I7.479 J-2.257 E.07553
G1 X26.391 Y95.99 E.76359
G3 X34.19 Y88.191 I7.812 J.013 E.40622
G1 X87.71 Y88.191 E1.77533
G3 X95.509 Y95.99 I-.024 J7.823 E.40607
G1 X95.509 Y119.01 E.76359
G3 X90.533 Y126.276 I-7.833 J-.027 E.31023
G3 X87.71 Y126.809 I-2.841 J-7.296 E.09587
G1 X34.19 Y126.809 E1.77533
G3 X26.986 Y121.988 I.013 J-7.812 E.30482
G1 X26.763 Y121.363 E.02202
M204 S10000
G1 X27.126 Y121.17 F42000
G1 F8843.478
M204 S6000
G1 X27.114 Y121.136 E.00123
G3 X26.798 Y119.006 I7.09 J-2.139 E.07168
G1 X26.798 Y95.994 E.76333
G3 X34.194 Y88.598 I7.405 J.009 E.38527
G1 X87.706 Y88.598 E1.77508
G3 X95.102 Y95.994 I-.019 J7.416 E.38512
G1 X95.102 Y119.006 E.76333
G3 X90.385 Y125.897 I-7.404 J-.009 E.2943
G3 X87.706 Y126.402 I-2.693 J-6.918 E.09096
G1 X34.194 Y126.402 E1.77508
G3 X27.362 Y121.832 I.009 J-7.405 E.28904
G1 X27.147 Y121.227 E.02132
M204 S250
G1 X27.496 Y121.04 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X27.491 Y121.021 E.00058
G3 X27.19 Y119.002 I6.722 J-2.034 E.06295
G1 X27.19 Y95.998 E.70685
G3 X34.198 Y88.99 I7.013 J.005 E.33818
G1 X87.702 Y88.99 E1.64403
G3 X94.71 Y95.998 I-.015 J7.023 E.33805
G1 X94.71 Y119.002 E.70685
G3 X87.702 Y126.01 I-7.013 J-.005 E.33818
G1 X34.198 Y126.01 E1.64403
G3 X27.727 Y121.681 I.015 J-7.023 E.25355
M73 P56 R10
G1 X27.516 Y121.096 E.01912
; WIPE_START
M204 S6000
G1 X27.491 Y121.021 E-.02997
G1 X27.325 Y120.368 E-.25625
G1 X27.239 Y119.824 E-.20926
G1 X27.197 Y119.129 E-.26452
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.303 Y114.548 Z1.6 F42000
G1 X68.941 Y87.809 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y87.809 E.62195
G3 X95.891 Y96.01 I-.006 J8.207 E.42723
G1 X95.891 Y118.99 E.76229
G3 X87.69 Y127.191 I-8.207 J-.006 E.42723
G1 X34.21 Y127.191 E1.77403
G3 X32.15 Y126.928 I.01 J-8.293 E.06907
G3 X26.009 Y118.99 I2.051 J-7.931 E.35832
M73 P57 R10
G1 X26.009 Y96.01 E.76229
G3 X34.21 Y87.809 I8.207 J.006 E.42723
G1 X52.959 Y87.809 E.62194
G1 X52.959 Y82.83 E.16518
G3 X53.475 Y82.309 I.498 J-.022 E.02732
G1 X68.448 Y82.31 E.49666
G3 X68.941 Y82.82 I-.002 J.496 E.02623
G1 X68.941 Y87.749 E.16352
M204 S10000
G1 X69.348 Y87.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y87.402 E.60858
G3 X96.298 Y96.006 I-.011 J8.614 E.44816
G1 X96.298 Y118.994 E.76256
G3 X87.694 Y127.598 I-8.614 J-.01 E.44816
G1 X34.206 Y127.598 E1.7743
G3 X25.602 Y118.994 I.01 J-8.614 E.44817
G1 X25.602 Y96.006 E.76256
G3 X34.206 Y87.402 I8.614 J.01 E.44816
G1 X52.552 Y87.402 E.60858
G1 X52.552 Y82.818 E.15207
G3 X53.465 Y81.902 I.904 J-.011 E.04779
G1 X68.461 Y81.903 E.49745
G3 X69.348 Y82.812 I-.019 J.905 E.04669
G1 X69.348 Y87.342 E.15028
M204 S250
G1 X69.74 Y87.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y87.01 E.5518
G3 X96.69 Y96.002 I-.002 J8.994 E.43398
G1 X96.69 Y118.998 E.7066
G3 X87.698 Y127.99 I-9.007 J-.015 E.43382
G1 X34.202 Y127.99 E1.64378
G3 X25.21 Y118.998 I.015 J-9.007 E.43382
G1 X25.21 Y96.002 E.7066
G3 X34.202 Y87.01 I9.007 J.015 E.43382
G1 X52.16 Y87.01 E.5518
G1 X52.16 Y82.806 E.12917
G3 X53.455 Y81.51 I1.296 J0 E.06254
G1 X68.475 Y81.511 E.4615
G3 X69.74 Y82.804 I-.034 J1.299 E.0615
G1 X69.74 Y86.95 E.12739
; WIPE_START
M204 S6000
G1 X71.74 Y86.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X68.59 Y82.924 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G2 X68.417 Y82.658 I-.176 J-.075 E.01241
G1 X67.159 Y82.659 E.04174
G3 X65.536 Y83.056 I-1.173 J-1.283 E.0578
G1 X64.985 Y82.66 E.02252
G1 X61.914 Y82.662 E.10187
G3 X60.295 Y83.056 I-1.17 J-1.285 E.05763
G1 X59.748 Y82.664 E.02232
G1 X56.668 Y82.666 E.10215
G3 X55.054 Y83.056 I-1.166 J-1.288 E.05745
G1 X54.511 Y82.667 E.02213
G1 X53.422 Y82.668 E.03612
G2 X53.312 Y82.786 I.055 J.161 E.00559
G1 X53.311 Y84.463 E.05562
G1 X53.743 Y84.515 E.01445
G1 X54.398 Y84.984 E.02674
G2 X56.364 Y85.676 I1.521 J-1.184 E.07303
G1 X57.019 Y85.207 E.02674
G3 X58.985 Y84.515 I1.521 J1.184 E.07303
G1 X59.64 Y84.984 E.02674
G2 X61.605 Y85.676 I1.521 J-1.184 E.07303
G1 X62.26 Y85.207 E.02674
G3 X64.226 Y84.515 I1.521 J1.184 E.07303
G1 X64.881 Y84.984 E.02674
G2 X66.847 Y85.676 I1.521 J-1.184 E.07303
G2 X68.157 Y84.642 I-5.128 J-7.847 E.05544
G1 X68.591 Y84.506 E.01509
G1 X68.592 Y87.083 E.0855
G1 X68.157 Y87.135 E.01454
G2 X67.226 Y87.843 I3.489 J5.561 E.03885
G1 X64.881 Y87.827 E.07777
G2 X62.916 Y87.135 I-1.521 J1.184 E.07303
G2 X61.984 Y87.843 I3.49 J5.561 E.03885
G1 X59.64 Y87.827 E.07777
G2 X57.674 Y87.135 I-1.521 J1.184 E.07303
G2 X56.743 Y87.843 I3.491 J5.563 E.03885
G1 X54.42 Y87.843 E.07707
G3 X53.743 Y87.263 I2.901 J-4.071 E.02958
G1 X53.308 Y87.126 E.01513
G1 X53.31 Y85.498 E.05401
; OBJECT_ID: 1
; WIPE_START
G1 X53.308 Y87.126 E-.61876
G1 X53.663 Y87.238 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X58.245 Y81.134 Z1.6 F42000
G1 X93.029 Y34.797 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X93.273 Y35.142 E.01401
G3 X94.509 Y39.19 I-6.086 J4.071 E.14243
G1 X94.509 Y62.21 E.76359
G3 X87.21 Y69.509 I-7.312 J-.013 E.38017
G1 X33.69 Y69.509 E1.77533
G3 X26.391 Y62.21 I.013 J-7.312 E.38017
G1 X26.391 Y39.19 E.76359
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.21 Y31.891 E1.77533
G3 X92.936 Y34.678 I-.023 J7.322 E.21857
G1 X92.992 Y34.75 E.00303
M204 S10000
G1 X92.7 Y35.037 F42000
G1 F8843.478
M204 S6000
G1 X92.935 Y35.368 E.01348
G3 X94.102 Y39.194 I-5.748 J3.844 E.13461
G1 X94.102 Y62.206 E.76333
G3 X87.206 Y69.102 I-6.905 J-.009 E.35922
G1 X33.694 Y69.102 E1.77508
G3 X26.798 Y62.206 I.009 J-6.905 E.35922
G1 X26.798 Y39.194 E.76333
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X92.616 Y34.93 I-.018 J6.915 E.2065
G1 X92.663 Y34.989 E.0025
M204 S250
G1 X92.377 Y35.272 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X92.609 Y35.586 E.01199
G3 X93.71 Y39.198 I-5.421 J3.626 E.11772
G1 X93.71 Y62.202 E.70685
G3 X87.202 Y68.71 I-6.513 J-.005 E.31405
G1 X33.698 Y68.71 E1.64403
G3 X27.19 Y62.202 I.005 J-6.513 E.31405
G1 X27.19 Y39.198 E.70685
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.202 Y32.69 E1.64403
G3 X92.146 Y34.975 I-.014 J6.522 E.17266
G1 X92.34 Y35.225 E.00971
; WIPE_START
M204 S6000
G1 X92.609 Y35.586 E-.17102
G1 X93 Y36.244 E-.29114
G1 X93.214 Y36.709 E-.19425
G1 X93.304 Y36.966 E-.10358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.849 Y35.33 Z1.6 F42000
G1 X68.441 Y31.509 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I-.001 J7.702 E.40125
G1 X94.891 Y62.19 E.76229
G3 X87.19 Y69.891 I-7.706 J-.005 E.40119
G1 X33.71 Y69.891 E1.77404
G3 X26.009 Y62.19 I-.006 J-7.695 E.40134
G1 X26.009 Y39.21 E.76229
G3 X33.71 Y31.509 I7.702 J.001 E.40125
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.53 E.16518
G3 X52.98 Y26.009 I.498 J-.022 E.02747
G1 X67.948 Y26.01 E.49651
G3 X68.441 Y26.52 I-.002 J.496 E.02622
G1 X68.441 Y31.449 E.16352
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I-.005 J8.109 E.42218
G1 X95.298 Y62.194 E.76256
G3 X87.194 Y70.298 I-8.113 J-.009 E.42212
G1 X33.706 Y70.298 E1.77431
G3 X25.602 Y62.194 I-.002 J-8.102 E.42228
G1 X25.602 Y39.206 E.76256
G3 X33.706 Y31.102 I8.109 J.005 E.42218
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.518 E.15207
G3 X52.968 Y25.602 I.904 J-.011 E.04788
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
G3 X95.559 Y37.725 I-.001 J8.492 E.36421
G3 X95.69 Y39.202 I-8.558 J1.503 E.04563
G1 X95.69 Y62.198 E.7066
G3 X87.198 Y70.69 I-8.506 J-.014 E.4097
G1 X33.702 Y70.69 E1.64378
G3 X32.191 Y70.553 I.025 J-8.683 E.04668
G3 X25.21 Y62.198 I1.527 J-8.37 E.36302
G1 X25.21 Y39.202 E.7066
G3 X33.702 Y30.71 I8.502 J.01 E.40975
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.506 E.12917
G3 X52.956 Y25.21 I1.296 J0 E.06256
G1 X67.975 Y25.211 E.46148
G3 X69.24 Y26.504 I-.034 J1.299 E.0615
G1 X69.24 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.65 Y29.85 Z1.6 F42000
G1 X52.81 Y28.698 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X52.809 Y30.327 E.05401
G1 X53.243 Y30.463 E.01512
G1 X53.898 Y31.027 E.02868
G2 X55.864 Y31.369 I1.206 J-1.111 E.07114
G1 X56.519 Y30.805 E.02868
G3 X58.485 Y30.463 I1.209 J1.133 E.07101
G1 X59.14 Y31.027 E.02868
G2 X61.105 Y31.369 I1.206 J-1.111 E.07114
G1 X61.76 Y30.805 E.02868
G3 X63.726 Y30.463 I1.209 J1.133 E.07101
G1 X64.381 Y31.027 E.02868
G2 X66.347 Y31.369 I1.206 J-1.111 E.07114
M73 P58 R10
G3 X67.657 Y30.335 I6.436 J6.81 E.05544
G1 X68.092 Y30.283 E.01453
G1 X68.091 Y27.706 E.08549
G1 X67.657 Y27.843 E.01509
G1 X67.002 Y28.407 E.02868
G3 X65.036 Y28.748 I-1.209 J-1.133 E.07101
G1 X64.381 Y28.184 E.02868
G2 X62.416 Y27.843 I-1.209 J1.133 E.07101
G1 X61.76 Y28.407 E.02868
G3 X59.795 Y28.748 I-1.209 J-1.133 E.07101
G1 X59.14 Y28.184 E.02868
G2 X57.174 Y27.843 I-1.209 J1.133 E.07101
G1 X56.519 Y28.407 E.02868
G3 X54.554 Y28.748 I-1.209 J-1.133 E.07101
G2 X53.243 Y27.715 I-6.437 J6.811 E.05544
G1 X52.811 Y27.663 E.01443
G1 X52.813 Y26.486 E.03904
G3 X53.201 Y26.367 I.248 J.117 E.01517
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X52.92 Y26.368 E-.10665
G1 X52.813 Y26.486 E-.06089
G1 X52.811 Y27.663 E-.44724
G1 X53.191 Y27.708 E-.14521
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 7/15
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S173.4
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I-.472 J1.122 P1  F42000
G1 X218.891 Y97.392 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G3 X218.886 Y100.336 I-76.942 J1.348 E.09764
G3 X218.728 Y101.51 I-6.447 J-.271 E.03937
G1 X218.509 Y101.487 E.00729
G1 X218.509 Y88.489 E.43116
G2 X206.891 Y88.489 I-5.809 J.012 E.60458
G1 X206.891 Y101.487 E.43116
G1 X206.672 Y101.51 E.00729
G3 X206.509 Y100.089 I6.228 J-1.435 E.04756
G1 X206.509 Y88.509 E.38412
G3 X212.945 Y82.314 I6.2 J.001 E.33088
G3 X218.843 Y87.734 I-.257 J6.198 E.28884
G1 X219 Y89.234 E.05002
G1 X220.271 Y88.826 E.04428
G3 X220.419 Y88.808 I.171 J.782 E.00497
G1 X227.419 Y88.809 E.23219
G3 X227.89 Y89.29 I-.024 J.494 E.02453
G1 X227.891 Y97.279 E.26502
G3 X227.37 Y97.79 I-.495 J.016 E.02719
G1 X220.419 Y97.79 E.23059
G3 X220.294 Y97.777 I-.003 J-.604 E.00417
G1 X218.949 Y97.408 E.04628
M204 S10000
G1 X219.298 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X219.293 Y100.351 I-63.475 J1.083 E.08044
G3 X218.279 Y103.619 I-6.716 J-.292 E.11474
G1 X218.102 Y103.568 E.00612
G1 X218.102 Y88.493 E.50007
G2 X207.298 Y88.493 I-5.402 J.008 E.56242
G1 X207.298 Y103.568 E.50006
G1 X207.121 Y103.619 E.00612
G3 X206.102 Y100.093 I5.688 J-3.553 E.12332
G1 X206.102 Y88.505 E.38438
G3 X212.961 Y81.908 I6.608 J.006 E.35244
G3 X219.247 Y87.684 I-.273 J6.606 E.30787
G1 X219.353 Y88.693 E.03366
G1 X220.162 Y88.434 E.0282
G3 X220.412 Y88.401 I.28 J1.171 E.00837
G1 X227.435 Y88.402 E.23298
G3 X228.297 Y89.27 I-.045 J.906 E.04451
G1 X228.298 Y97.287 E.26595
G3 X227.382 Y98.197 I-.901 J.009 E.04773
G1 X220.411 Y98.197 E.23124
G3 X220.202 Y98.174 I.006 J-1.038 E.00698
G1 X219.356 Y97.942 E.02912
M204 S250
G1 X219.69 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X219.67 Y100.633 I-28.776 J.828 E.06738
G3 X217.71 Y104.972 I-7.042 J-.568 E.14923
G1 X217.71 Y88.497 E.50624
G2 X207.69 Y88.497 I-5.01 J.005 E.48335
G1 X207.69 Y104.972 E.50624
G3 X205.812 Y101.282 I5.094 J-4.915 E.12912
G3 X205.71 Y100.096 I7.052 J-1.205 E.0366
G1 X205.71 Y88.501 E.3563
G3 X212.975 Y81.516 I7 J.01 E.34571
G3 X219.692 Y88.172 I-.284 J7.004 E.31893
G3 X220.404 Y88.009 I.849 J2.063 E.02254
G1 X227.451 Y88.01 E.21652
G3 X228.689 Y89.25 I-.064 J1.302 E.05905
G1 X228.69 Y97.295 E.24718
G3 X227.394 Y98.589 I-1.293 J.001 E.06255
G1 X220.404 Y98.589 E.21478
G3 X219.746 Y98.461 I.121 J-2.37 E.02066
; WIPE_START
M204 S6000
G1 X219.69 Y100.096 E-.62199
G1 X219.676 Y100.459 E-.13801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.877 Y101.748 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545341
G1 F7165.309
M204 S6000
G1 X218.557 Y101.95 E.01549
; LINE_WIDTH: 0.526734
G1 F7440.884
G1 X218.538 Y102.067 E.00468
; LINE_WIDTH: 0.488338
G1 F8082.299
G1 X218.519 Y102.184 E.00431
; LINE_WIDTH: 0.44737
G1 F8900.973
G1 X218.436 Y102.634 E.01508
; LINE_WIDTH: 0.40383
G1 F9974.785
G1 X218.353 Y103.084 E.01346
; WIPE_START
G1 X218.436 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X219.232 Y95.28 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X219.233 Y96.734 E.04823
G1 X219.401 Y96.78 E.00579
G1 X219.821 Y96.656 E.01451
G1 X220.476 Y96.746 E.02194
G1 X220.912 Y97.064 E.01792
G1 X224.106 Y97.064 E.10595
G3 X225.717 Y96.746 I1.132 J1.495 E.05637
G1 X226.154 Y97.064 E.01792
G1 X227.165 Y97.064 E.03356
G1 X227.165 Y95.28 E.0592
G1 X227.027 Y95.261 E.00461
G1 X226.372 Y94.783 E.02689
G2 X224.407 Y94.126 I-1.487 J1.178 E.07274
G1 X223.752 Y94.603 E.02689
G3 X221.786 Y95.261 I-1.487 J-1.178 E.07274
G1 X221.131 Y94.783 E.02689
G2 X219.232 Y94.116 I-1.473 J1.156 E.07048
G1 X219.231 Y91.589 E.08383
G3 X220.476 Y91.505 I.716 J1.336 E.04265
G1 X221.131 Y91.982 E.02689
G2 X223.096 Y92.64 I1.487 J-1.178 E.07274
G1 X223.752 Y92.163 E.02689
G3 X225.717 Y91.505 I1.487 J1.178 E.07274
G3 X227.027 Y92.536 I-6.475 J9.574 E.05536
G1 X227.165 Y92.577 E.00475
G1 X227.164 Y90.038 E.08421
G1 X227.027 Y90.019 E.00458
G3 X226.363 Y89.534 I3.024 J-4.838 E.0273
G1 X223.548 Y89.534 E.0934
G3 X221.786 Y90.019 I-1.282 J-1.214 E.06371
G1 X221.131 Y89.542 E.02689
G2 X220.266 Y89.59 I-.24 J3.518 E.02881
G1 X219.586 Y89.808 E.02369
G1 X219.59 Y89.858 E.00168
M204 S10000
G1 X218.769 Y89.522 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136294
G1 F15000
M204 S6000
G1 X218.754 Y89.229 E.00223
; LINE_WIDTH: 0.110041
G1 X218.738 Y88.935 E.00161
; WIPE_START
G1 X218.754 Y89.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X220.451 Y89.171 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383565
G1 F10568.201
M204 S6000
G1 X220.35 Y89.188 E.00284
G1 X219.322 Y89.511 E.02991
G1 X219.223 Y89.563 E.00311
G1 X219.196 Y89.834 E.00755
G1 X218.893 Y89.904 E.00863
G1 X218.868 Y90.03 E.00358
G1 X218.87 Y96.889 E.19039
G1 X218.888 Y96.997 E.00303
G1 X218.987 Y97.043 E.00303
G1 X220.348 Y97.416 E.03915
G1 X220.445 Y97.427 E.00272
G1 X227.342 Y97.427 E.19146
G1 X227.473 Y97.379 E.00387
G1 X227.528 Y97.255 E.00377
G1 X227.527 Y89.343 E.2196
G1 X227.453 Y89.204 E.00438
G1 X227.364 Y89.172 E.00262
G1 X220.511 Y89.171 E.19022
; WIPE_START
G1 X222.511 Y89.171 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X216.512 Y93.89 Z1.8 F42000
G1 X206.523 Y101.746 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.541061
G1 F7226.868
M204 S6000
G1 X206.843 Y101.95 E.0154
G1 X206.862 Y102.067 E.00482
; LINE_WIDTH: 0.488356
G1 F8081.983
G1 X206.881 Y102.184 E.00431
; LINE_WIDTH: 0.447416
G1 F8899.969
G1 X206.964 Y102.634 E.01508
; LINE_WIDTH: 0.403968
G1 F9970.99
G1 X207.047 Y103.084 E.01346
; OBJECT_ID: 6
; WIPE_START
G1 X206.964 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X199.549 Y100.824 Z1.8 F42000
G1 X185.491 Y97.392 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X185.486 Y100.336 I-76.652 J1.348 E.09764
G3 X185.328 Y101.51 I-6.899 J-.332 E.03937
G1 X185.109 Y101.487 E.00729
G1 X185.109 Y88.489 E.43116
G2 X173.491 Y88.489 I-5.809 J.012 E.60458
G1 X173.491 Y101.487 E.43116
G1 X173.272 Y101.51 E.00729
G1 X173.244 Y101.377 E.00451
G3 X173.109 Y100.089 I6.886 J-1.371 E.04303
G1 X173.109 Y88.509 E.38411
G3 X179.545 Y82.314 I6.192 J-.008 E.33101
G3 X185.443 Y87.734 I-.246 J6.187 E.28895
G1 X185.6 Y89.234 E.05001
G1 X186.871 Y88.826 E.04427
G3 X187.02 Y88.808 I.171 J.785 E.00498
G1 X194.013 Y88.809 E.23198
G3 X194.49 Y89.29 I-.017 J.494 E.02473
G1 X194.491 Y97.269 E.2647
G3 X193.97 Y97.79 I-.495 J.025 E.02752
G1 X187.019 Y97.79 E.23059
G3 X186.894 Y97.777 I-.003 J-.604 E.00417
G1 X185.549 Y97.408 E.04628
M204 S10000
G1 X185.898 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X185.893 Y100.351 I-63.237 J1.083 E.08045
G3 X184.879 Y103.619 I-6.613 J-.26 E.11478
G1 X184.702 Y103.568 E.00612
G1 X184.702 Y88.493 E.50006
G2 X173.898 Y88.493 I-5.402 J.008 E.56242
G1 X173.898 Y103.568 E.50007
G1 X173.721 Y103.619 E.00612
G3 X172.702 Y100.093 I5.689 J-3.553 E.12332
G1 X172.702 Y88.505 E.38438
G3 X179.561 Y81.908 I6.599 J-.004 E.35258
G3 X185.847 Y87.684 I-.262 J6.594 E.30798
G1 X185.953 Y88.693 E.03366
G1 X186.762 Y88.434 E.02819
G3 X187.012 Y88.401 I.28 J1.174 E.00837
G1 X194.031 Y88.402 E.23286
G3 X194.897 Y89.27 I-.04 J.906 E.04463
G1 X194.898 Y97.281 E.26576
G3 X193.982 Y98.197 I-.901 J.015 E.04793
G1 X187.011 Y98.197 E.23124
G3 X186.802 Y98.174 I.006 J-1.038 E.00699
G1 X185.956 Y97.942 E.02912
M204 S250
G1 X186.29 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X186.27 Y100.633 I-28.75 J.828 E.06738
G3 X186.188 Y101.282 I-7.484 J-.612 E.02011
G3 X184.31 Y104.972 I-6.895 J-1.185 E.12917
G1 X184.31 Y88.497 E.50624
G2 X174.29 Y88.497 I-5.01 J.005 E.48335
G1 X174.29 Y104.972 E.50624
G3 X172.31 Y100.097 I5.021 J-4.879 E.16577
G1 X172.31 Y88.501 E.3563
G3 X179.575 Y81.516 I6.991 J0 E.34585
G3 X186.052 Y86.697 I-.275 J6.983 E.27286
G3 X186.293 Y88.172 I-7.625 J1.998 E.046
G3 X187.004 Y88.009 I.849 J2.064 E.02254
G1 X194.049 Y88.01 E.21648
G3 X195.289 Y89.25 I-.063 J1.302 E.05909
G1 X195.29 Y97.293 E.24712
G3 X193.994 Y98.589 I-1.293 J.003 E.06261
G1 X187.004 Y98.589 E.21478
G3 X186.346 Y98.461 I.12 J-2.369 E.02066
; WIPE_START
M204 S6000
G1 X186.29 Y100.096 E-.62198
G1 X186.276 Y100.459 E-.13802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.833 Y95.28 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X185.833 Y96.734 E.04823
G1 X186.001 Y96.78 E.00579
G1 X186.421 Y96.656 E.01451
G1 X187.076 Y96.746 E.02194
G1 X187.512 Y97.064 E.01792
G1 X190.706 Y97.064 E.10595
G3 X192.317 Y96.746 I1.132 J1.495 E.05637
G1 X192.754 Y97.064 E.01792
G1 X193.765 Y97.064 E.03356
G1 X193.765 Y95.28 E.0592
G1 X193.627 Y95.261 E.00461
G1 X192.972 Y94.783 E.02689
G2 X191.007 Y94.126 I-1.487 J1.178 E.07274
G1 X190.352 Y94.603 E.02689
G3 X188.386 Y95.261 I-1.487 J-1.178 E.07274
G1 X187.731 Y94.783 E.02689
G2 X185.832 Y94.116 I-1.473 J1.156 E.07048
G1 X185.831 Y91.589 E.08383
G3 X187.076 Y91.505 I.716 J1.336 E.04265
G1 X187.731 Y91.982 E.02689
G2 X189.696 Y92.64 I1.487 J-1.178 E.07274
G1 X190.352 Y92.163 E.02689
G3 X192.317 Y91.505 I1.487 J1.178 E.07274
G3 X193.627 Y92.536 I-6.475 J9.574 E.05536
G1 X193.765 Y92.577 E.00475
G1 X193.764 Y90.038 E.08421
G1 X193.627 Y90.019 E.00458
G3 X192.963 Y89.534 I3.024 J-4.838 E.0273
G1 X190.148 Y89.534 E.0934
G3 X188.386 Y90.019 I-1.282 J-1.214 E.06371
G1 X187.731 Y89.542 E.02689
G2 X187.027 Y89.538 I-.407 J9.475 E.02336
G1 X186.179 Y89.81 E.02955
G1 X186.181 Y89.853 E.00143
M204 S10000
G1 X185.369 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.13634
G1 F15000
M204 S6000
G1 X185.354 Y89.228 E.00224
; LINE_WIDTH: 0.110058
G1 X185.338 Y88.935 E.00161
; WIPE_START
G1 X185.354 Y89.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X187.051 Y89.171 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383542
G1 F10568.921
M204 S6000
G1 X186.935 Y89.187 E.00327
G1 X185.919 Y89.512 E.02961
G1 X185.821 Y89.563 E.00305
G1 X185.789 Y89.835 E.00761
G1 X185.493 Y89.903 E.00843
G1 X185.468 Y90.031 E.0036
G1 X185.47 Y96.889 E.19037
G1 X185.489 Y96.997 E.00303
G1 X185.587 Y97.043 E.00303
G1 X186.948 Y97.416 E.03915
G1 X187.045 Y97.427 E.00272
G1 X193.942 Y97.427 E.19144
G1 X194.096 Y97.365 E.0046
G1 X194.128 Y97.234 E.00374
G1 X194.127 Y89.341 E.21908
G1 X194.051 Y89.203 E.00437
G1 X193.959 Y89.172 E.00268
G1 X187.111 Y89.171 E.19008
; WIPE_START
G1 X189.111 Y89.171 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X186.992 Y96.504 Z1.8 F42000
G1 X185.478 Y101.743 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545737
G1 F7159.666
M204 S6000
G1 X185.157 Y101.95 E.01565
; LINE_WIDTH: 0.526783
G1 F7440.125
G1 X185.138 Y102.067 E.00468
; LINE_WIDTH: 0.488408
G1 F8081.032
G1 X185.119 Y102.184 E.00431
; LINE_WIDTH: 0.447477
G1 F8898.628
G1 X185.036 Y102.634 E.01509
; LINE_WIDTH: 0.403959
G1 F9971.225
G1 X184.953 Y103.084 E.01347
; WIPE_START
G1 X185.036 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.41 Y102.936 Z1.8 F42000
G1 X173.647 Y103.084 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.403915
G1 F9972.457
M204 S6000
G1 X173.564 Y102.634 E.01346
; LINE_WIDTH: 0.447398
G1 F8900.359
G1 X173.481 Y102.184 E.01508
; LINE_WIDTH: 0.488351
G1 F8082.07
G1 X173.462 Y102.067 E.00431
; LINE_WIDTH: 0.541078
G1 F7226.631
G1 X173.443 Y101.95 E.00482
G1 X173.121 Y101.741 E.01557
; OBJECT_ID: 5
; WIPE_START
G1 X173.443 Y101.95 E-.58036
G1 X173.462 Y102.067 E-.17964
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X166.006 Y100.436 Z1.8 F42000
G1 X152.091 Y97.392 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.091 Y100.389 E.09942
G3 X151.927 Y101.778 I-6.64 J-.078 E.04649
G1 X151.709 Y101.755 E.00727
G1 X151.709 Y88.189 E.44999
G2 X140.691 Y88.189 I-5.509 J.011 E.57342
G1 X140.691 Y101.755 E.44999
G1 X140.473 Y101.778 E.00727
G3 X140.309 Y100.389 I6.476 J-1.467 E.04648
G1 X140.309 Y88.209 E.40403
G3 X146.431 Y82.314 I5.9 J0 E.31478
G3 X152.069 Y87.699 I-.232 J5.887 E.28263
G1 X152.17 Y89.234 E.05103
G1 X153.508 Y88.817 E.04652
G3 X153.628 Y88.808 I.109 J.63 E.00399
G1 X160.609 Y88.809 E.23157
G3 X161.09 Y89.28 I-.016 J.497 E.0245
G1 X161.091 Y97.279 E.26536
G3 X160.57 Y97.79 I-.495 J.016 E.02718
G1 X153.619 Y97.79 E.2306
G3 X153.494 Y97.777 I-.003 J-.599 E.00416
G1 X152.149 Y97.408 E.04629
M204 S10000
G1 X152.498 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X152.493 Y100.645 I-69.419 J1.234 E.0902
G3 X151.478 Y103.833 I-6.312 J-.254 E.11233
G1 X151.302 Y103.782 E.00608
G1 X151.302 Y88.193 E.51711
G2 X141.098 Y88.193 I-5.102 J.007 E.53126
G1 X141.098 Y103.782 E.51711
G1 X140.922 Y103.833 E.00608
G3 X139.902 Y100.393 I5.296 J-3.442 E.12068
G1 X139.902 Y88.205 E.4043
G3 X146.446 Y81.907 I6.307 J.005 E.33634
G3 X152.475 Y87.665 I-.247 J6.294 E.30219
G1 X152.542 Y88.691 E.03411
G1 X153.368 Y88.432 E.0287
G3 X153.617 Y88.401 I.247 J.964 E.00835
G1 X160.629 Y88.402 E.23262
G3 X161.497 Y89.264 I-.041 J.909 E.04447
G1 X161.498 Y97.287 E.26615
G3 X160.582 Y98.197 I-.901 J.009 E.04773
G1 X153.611 Y98.197 E.23124
G3 X153.402 Y98.174 I.006 J-1.033 E.00698
G1 X152.556 Y97.942 E.02912
M204 S250
M73 P59 R10
G1 X152.89 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.885 Y100.66 I-56.677 J.978 E.06822
G3 X150.91 Y105.149 I-6.693 J-.266 E.15426
G1 X150.91 Y88.197 E.52089
G2 X141.49 Y88.197 I-4.71 J.003 E.45448
G1 X141.49 Y105.149 E.52089
G3 X139.51 Y100.397 I4.72 J-4.755 E.16235
G1 X139.51 Y88.201 E.37474
G3 X146.461 Y81.515 I6.7 J.01 E.3308
G3 X148.284 Y81.843 I-.338 J7.114 E.05709
G3 X152.901 Y88.168 I-2.123 J6.397 E.25672
G3 X153.606 Y88.009 I.805 J1.931 E.02232
G1 X160.649 Y88.01 E.2164
G3 X161.889 Y89.249 I-.066 J1.306 E.05902
G1 X161.89 Y97.295 E.24724
G3 X160.594 Y98.589 I-1.293 J.001 E.06254
G1 X153.604 Y98.589 E.21478
G3 X152.946 Y98.461 I.12 J-2.365 E.02066
; WIPE_START
M204 S6000
G1 X152.89 Y100.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.435 Y95.59 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.435 Y96.734 E.03796
G2 X153.321 Y96.738 I.448 J-1.048 E.03019
G1 X153.976 Y96.828 E.02194
G1 X154.3 Y97.064 E.0133
G1 X157.721 Y97.064 E.1135
G3 X159.217 Y96.828 I1.017 J1.588 E.05169
G1 X159.541 Y97.064 E.0133
G1 X160.365 Y97.064 E.02734
G1 X160.365 Y95.225 E.06103
G1 X159.872 Y94.865 E.02023
G2 X157.907 Y94.208 I-1.487 J1.178 E.07274
G1 X157.252 Y94.685 E.02689
G3 X155.286 Y95.343 I-1.487 J-1.178 E.07274
G1 X154.631 Y94.865 E.02689
G2 X152.665 Y94.208 I-1.487 J1.178 E.07274
G1 X152.435 Y94.376 E.00948
G1 X152.435 Y91.886 E.08259
G3 X153.976 Y91.587 I1.061 J1.349 E.05409
G1 X154.631 Y92.064 E.02689
G2 X156.596 Y92.722 I1.487 J-1.178 E.07274
G1 X157.252 Y92.245 E.02689
G3 X159.217 Y91.587 I1.487 J1.178 E.07274
G3 X160.365 Y92.481 I-5.605 J8.38 E.04829
G1 X160.364 Y89.983 E.08287
G3 X159.766 Y89.535 I2.799 J-4.357 E.0248
G1 X157.145 Y89.534 E.08697
G3 X155.286 Y90.102 I-1.38 J-1.191 E.06799
G3 X154.524 Y89.534 I3.544 J-5.552 E.03155
G1 X153.669 Y89.534 E.02838
G2 X153.557 Y89.56 I.011 J.3 E.00384
G1 X152.929 Y89.756 E.0218
M204 S10000
G1 X153.657 Y89.171 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383494
G1 F10570.401
M204 S6000
G1 X153.448 Y89.214 E.00593
G1 X152.48 Y89.517 E.02815
G1 X152.383 Y89.566 E.00303
G1 X152.347 Y89.839 E.00763
G1 X152.098 Y89.901 E.00713
G1 X152.072 Y90.029 E.00363
G1 X152.072 Y96.889 E.19039
G1 X152.09 Y96.997 E.00303
G1 X152.189 Y97.043 E.00303
G1 X153.548 Y97.416 E.03911
G1 X153.645 Y97.427 E.00271
G1 X160.542 Y97.427 E.19142
G1 X160.673 Y97.379 E.00387
G1 X160.728 Y97.255 E.00376
G1 X160.727 Y89.331 E.2199
G2 X160.568 Y89.172 I-.215 J.056 E.00655
G1 X153.717 Y89.171 E.19012
; WIPE_START
G1 X155.717 Y89.171 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.939 Y89.225 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104368
G1 F15000
M204 S6000
G1 X151.948 Y89.517 E.00146
; WIPE_START
G1 X151.939 Y89.225 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.021 Y96.857 Z1.8 F42000
G1 X152.076 Y102.012 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.527599
G1 F7427.607
M204 S6000
G1 X151.755 Y102.215 E.01501
; LINE_WIDTH: 0.524114
G1 F7481.394
G1 X151.737 Y102.321 E.00418
; LINE_WIDTH: 0.488825
G1 F8073.476
G1 X151.72 Y102.426 E.00387
; LINE_WIDTH: 0.44946
G1 F8855.218
G1 X151.637 Y102.867 E.01488
; LINE_WIDTH: 0.405994
G1 F9915.352
G1 X151.554 Y103.308 E.01328
; WIPE_START
G1 X151.637 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.011 Y103.179 Z1.8 F42000
G1 X140.846 Y103.308 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.405945
G1 F9916.687
M204 S6000
G1 X140.763 Y102.867 E.01328
; LINE_WIDTH: 0.449395
G1 F8856.637
G1 X140.68 Y102.426 E.01487
; LINE_WIDTH: 0.488793
G1 F8074.053
G1 X140.663 Y102.321 E.00388
; LINE_WIDTH: 0.526847
G1 F7439.151
G1 X140.645 Y102.215 E.00421
G1 X140.324 Y102.012 E.01499
; OBJECT_ID: 4
; WIPE_START
G1 X140.645 Y102.215 E-.59337
G1 X140.663 Y102.321 E-.16663
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X133.225 Y100.606 Z1.8 F42000
G1 X119.291 Y97.393 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.291 Y100.589 E.10603
G3 X119.127 Y101.957 I-6.414 J-.076 E.04578
G1 X118.909 Y101.933 E.00726
G1 X118.909 Y87.99 E.46252
G2 X108.291 Y87.99 I-5.309 J.016 E.55221
G1 X108.291 Y101.933 E.46252
G1 X108.073 Y101.957 E.00726
G3 X107.909 Y100.589 I6.251 J-1.444 E.04578
G1 X107.909 Y88.01 E.41728
G3 X107.94 Y87.425 I6.151 J.027 E.01944
G3 X113.763 Y82.312 I5.669 J.584 E.28267
G3 X119.282 Y87.678 I-.173 J5.698 E.28027
G1 X119.337 Y89.194 E.05031
G1 X120.727 Y88.815 E.04778
G3 X120.819 Y88.809 I.087 J.613 E.00306
G1 X127.813 Y88.81 E.23201
G3 X128.29 Y89.287 I-.016 J.493 E.02464
G1 X128.291 Y97.27 E.26481
G3 X127.77 Y97.79 I-.495 J.025 E.02752
G1 X120.819 Y97.79 E.23058
G3 X120.695 Y97.778 I-.003 J-.603 E.00416
G1 X119.349 Y97.409 E.0463
M204 S10000
G1 X119.698 Y97.927 F42000
G1 F8843.478
M204 S6000
G1 X119.698 Y100.593 E.08846
G3 X118.677 Y103.976 I-6.169 J-.017 E.11886
G1 X118.502 Y103.924 E.00605
G1 X118.502 Y87.994 E.52843
G2 X108.698 Y87.994 I-4.902 J.012 E.51007
G1 X108.698 Y103.924 E.52843
G1 X108.523 Y103.976 E.00605
G3 X107.502 Y100.593 I5.095 J-3.383 E.11889
G1 X107.502 Y88.006 E.41756
G3 X113.776 Y81.905 I6.099 J-.004 E.32372
G3 X119.688 Y87.655 I-.187 J6.106 E.30029
G1 X119.725 Y88.665 E.03353
G1 X120.603 Y88.424 E.03018
G3 X120.811 Y88.402 I.215 J1.015 E.00698
G1 X127.831 Y88.403 E.23287
G3 X128.697 Y89.268 I-.038 J.903 E.04459
G1 X128.698 Y97.282 E.26583
G3 X127.782 Y98.198 I-.901 J.015 E.04793
G1 X120.811 Y98.198 E.23124
G3 X120.603 Y98.175 I.006 J-1.038 E.00697
G1 X119.756 Y97.942 E.02913
M204 S250
G1 X120.09 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X120.085 Y100.857 I-60.745 J1.078 E.07426
G3 X118.11 Y105.265 I-6.496 J-.264 E.15206
G1 X118.11 Y87.997 E.53059
G2 X109.09 Y87.997 I-4.51 J.008 E.43488
G1 X109.09 Y105.265 E.53059
G3 X108.015 Y103.904 I4.54 J-4.687 E.05346
G3 X107.11 Y100.597 I5.595 J-3.309 E.10659
G1 X107.11 Y88.002 E.38703
G3 X113.788 Y81.514 I6.491 J0 E.31904
G3 X120.099 Y88.156 I-.197 J6.506 E.3123
G3 X120.804 Y88.01 I.823 J2.193 E.02222
G1 X127.849 Y88.011 E.21649
G3 X129.089 Y89.25 I-.06 J1.299 E.0591
G1 X129.09 Y97.293 E.24714
G3 X127.794 Y98.59 I-1.293 J.003 E.06261
G1 X120.804 Y98.59 E.21478
G3 X120.146 Y98.461 I.12 J-2.363 E.02066
; WIPE_START
M204 S6000
G1 X120.095 Y100.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.635 Y95.795 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.635 Y96.735 E.03117
G1 X120.299 Y96.917 E.02284
G1 X120.721 Y96.792 E.0146
G1 X121.376 Y96.882 E.02194
G1 X121.627 Y97.065 E.01029
G1 X125.196 Y97.065 E.11841
G3 X126.617 Y96.882 I.943 J1.716 E.04865
G1 X126.868 Y97.065 E.01029
G1 X127.565 Y97.065 E.02314
G1 X127.565 Y95.133 E.06409
G1 X127.272 Y94.919 E.01202
G2 X125.307 Y94.262 I-1.487 J1.178 E.07274
G1 X124.652 Y94.739 E.02689
G3 X122.686 Y95.397 I-1.487 J-1.178 E.07274
G1 X122.031 Y94.919 E.02689
G2 X120.065 Y94.262 I-1.487 J1.178 E.07274
G1 X119.635 Y94.576 E.01769
G1 X119.635 Y92.109 E.08182
G3 X121.376 Y91.641 I1.262 J1.221 E.06281
G1 X122.031 Y92.118 E.02689
G2 X123.996 Y92.776 I1.487 J-1.178 E.07274
G1 X124.652 Y92.299 E.02689
G3 X126.617 Y91.641 I1.487 J1.178 E.07274
G3 X127.565 Y92.366 I-4.535 J6.913 E.0396
G1 X127.564 Y89.891 E.08209
G3 X127.103 Y89.535 I2.228 J-3.365 E.01933
G1 X124.608 Y89.535 E.08278
G3 X122.686 Y90.156 I-1.443 J-1.182 E.07079
G3 X121.861 Y89.534 I3.882 J-6.015 E.03429
G1 X120.855 Y89.534 E.03338
G2 X120.254 Y89.694 I.169 J1.839 E.02072
M204 S10000
G1 X120.837 Y89.172 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383018
G1 F10585.203
M204 S6000
G1 X120.748 Y89.183 E.00248
G1 X119.389 Y89.556 E.03905
G1 X119.29 Y89.602 E.00302
G1 X119.272 Y89.709 E.00302
G1 X119.272 Y96.89 E.199
G1 X119.29 Y96.997 E.00302
G1 X119.389 Y97.043 E.00302
G1 X120.748 Y97.417 E.03906
G1 X120.845 Y97.428 E.0027
G1 X127.742 Y97.428 E.19115
G1 X127.896 Y97.365 E.00459
G1 X127.928 Y97.235 E.00373
G1 X127.927 Y89.338 E.21886
G1 X127.852 Y89.206 E.00421
G1 X127.756 Y89.173 E.0028
G1 X120.897 Y89.172 E.1901
; WIPE_START
G1 X122.897 Y89.172 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.851 Y96.525 Z1.8 F42000
G1 X119.275 Y102.19 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.515228
G1 F7622.156
M204 S6000
G1 X118.954 Y102.392 E.0146
; LINE_WIDTH: 0.522235
G1 F7510.727
G1 X118.937 Y102.49 E.00386
; LINE_WIDTH: 0.488999
G1 F8070.335
G1 X118.92 Y102.587 E.00359
; LINE_WIDTH: 0.450744
G1 F8827.337
G1 X118.837 Y103.022 E.01472
; LINE_WIDTH: 0.407502
G1 F9874.34
G1 X118.754 Y103.457 E.01316
; WIPE_START
G1 X118.837 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.211 Y103.341 Z1.8 F42000
G1 X108.446 Y103.457 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.407454
G1 F9875.642
M204 S6000
G1 X108.363 Y103.022 E.01316
; LINE_WIDTH: 0.450711
G1 F8828.049
G1 X108.28 Y102.587 E.01472
; LINE_WIDTH: 0.488951
G1 F8071.201
G1 X108.263 Y102.49 E.0036
; LINE_WIDTH: 0.516472
G1 F7602.128
G1 X108.246 Y102.392 E.00382
G1 X107.925 Y102.19 E.01464
; OBJECT_ID: 2
; WIPE_START
G1 X108.246 Y102.392 E-.60282
G1 X108.263 Y102.49 E-.15718
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X108.186 Y94.858 Z1.8 F42000
G1 X107.886 Y65.323 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X107.863 Y65.273 E.0018
G3 X107.291 Y62.41 I6.94 J-2.876 E.0975
G1 X107.291 Y39.39 E.76359
G3 X114.79 Y31.891 I7.523 J.023 E.39045
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.013 J7.512 E.39059
G1 X175.809 Y62.41 E.76359
G3 X168.31 Y69.909 I-7.523 J-.023 E.39045
G1 X114.79 Y69.909 E1.77533
G3 X108.25 Y66.069 I.013 J-7.512 E.26374
G1 X107.912 Y65.376 E.02556
M204 S10000
G1 X108.249 Y65.115 F42000
G1 F8843.478
M204 S6000
G1 X108.046 Y64.594 E.01854
G3 X107.698 Y62.406 I6.759 J-2.198 E.07381
G1 X107.698 Y39.394 E.76333
G3 X114.794 Y32.298 I7.105 J.009 E.36964
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.009 J7.105 E.36964
G1 X175.402 Y62.406 E.76333
G3 X168.306 Y69.502 I-7.115 J-.019 E.3695
G1 X114.794 Y69.502 E1.77508
G3 X110.285 Y67.881 I.036 J-7.18 E.16205
G3 X108.351 Y65.373 I4.52 J-5.485 E.10596
G1 X108.271 Y65.171 E.0072
M204 S250
G1 X108.604 Y64.974 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X108.602 Y64.967 E.00022
G3 X108.09 Y62.402 I6.201 J-2.571 E.0809
G1 X108.09 Y39.398 E.70685
G3 X114.798 Y32.69 I6.713 J.005 E.3237
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.005 J6.713 E.3237
G1 X175.01 Y62.402 E.70685
G3 X168.302 Y69.11 I-6.722 J-.015 E.32357
G1 X114.798 Y69.11 E1.64403
G3 X108.947 Y65.678 I.005 J-6.713 E.21851
G1 X108.63 Y65.028 E.02222
; WIPE_START
M204 S6000
G1 X108.602 Y64.967 E-.02548
G1 X108.418 Y64.474 E-.2002
G1 X108.219 Y63.709 E-.30019
G1 X108.136 Y63.189 E-.20031
G1 X108.131 Y63.1 E-.03381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.199 Y58.47 Z1.8 F42000
G1 X149.541 Y31.509 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I.006 J7.895 E.41177
G1 X176.191 Y62.39 E.76229
G3 X168.29 Y70.291 I-7.901 J0 E.41168
G1 X114.81 Y70.291 E1.77403
G3 X106.909 Y62.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E.76229
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.53 E.16517
G3 X134.08 Y26.009 I.494 J-.026 E.02754
G1 X149.044 Y26.01 E.49638
G3 X149.541 Y26.52 I.002 J.496 E.02637
G1 X149.541 Y31.449 E.16351
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I.002 J8.302 E.43271
G1 X176.598 Y62.394 E.76256
G3 X168.294 Y70.698 I-8.308 J-.004 E.43262
G1 X114.806 Y70.698 E1.7743
G3 X106.502 Y62.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E.76256
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.518 E.15207
G3 X134.068 Y25.602 I.9 J-.016 E.04794
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
G3 X176.99 Y39.402 I-.002 J8.694 E.41951
G1 X176.99 Y62.398 E.7066
G3 X176.909 Y63.573 I-12.327 J-.262 E.03621
G3 X168.298 Y71.09 I-8.621 J-1.185 E.38318
G1 X114.802 Y71.09 E1.64378
G3 X106.11 Y62.398 I.014 J-8.706 E.41935
G1 X106.11 Y39.402 E.7066
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.506 E.12917
G3 X134.056 Y25.21 I1.292 J-.004 E.06262
G1 X149.07 Y25.211 E.46133
G3 X150.34 Y26.504 I-.03 J1.299 E.06164
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.814 Y29.007 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X148.815 Y30.635 E.05401
G1 X148.15 Y31.165 E.02821
G1 X145.646 Y31.165 E.08306
G2 X144.826 Y30.548 I-4.677 J5.363 E.03407
M73 P60 R10
G2 X142.909 Y31.165 I-.479 J1.8 E.07059
G1 X140.405 Y31.165 E.08306
G2 X139.585 Y30.548 I-4.674 J5.361 E.03407
G2 X137.667 Y31.165 I-.479 J1.8 E.07059
G1 X135.164 Y31.165 E.08306
G2 X134.286 Y30.541 I-4.086 J4.811 E.03579
G1 X134.288 Y28.015 E.08377
G1 X134.343 Y28.032 E.00191
G2 X135.654 Y29.063 I7.785 J-8.542 E.05536
G2 X137.619 Y28.405 I.478 J-1.836 E.07274
G1 X138.274 Y27.928 E.02689
G3 X140.24 Y28.586 I.478 J1.836 E.07274
G1 X140.895 Y29.063 E.02689
G2 X142.86 Y28.405 I.478 J-1.836 E.07274
G1 X143.516 Y27.928 E.02689
G3 X145.481 Y28.586 I.478 J1.836 E.07274
G1 X146.136 Y29.063 E.02689
G2 X148.102 Y28.405 I.478 J-1.836 E.07274
G1 X148.814 Y27.92 E.02858
G1 X148.813 Y26.735 E.0393
G1 X148.37 Y26.736 E.01471
M204 S10000
G1 X134.086 Y26.382 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38314
G1 F10581.391
M204 S6000
G1 X133.97 Y26.424 E.00342
G1 X133.927 Y26.541 E.00346
G1 X133.922 Y31.369 E.13384
G1 X133.949 Y31.501 E.00374
G1 X134.081 Y31.528 E.00374
G1 X149.019 Y31.528 E.41413
G1 X149.151 Y31.501 E.00373
G1 X149.178 Y31.369 E.00374
G1 X149.174 Y26.531 E.13411
G1 X149.09 Y26.399 E.00434
G1 X148.998 Y26.372 E.00266
G1 X134.146 Y26.382 E.41175
; OBJECT_ID: 8
; WIPE_START
G1 X136.146 Y26.381 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X131.523 Y32.454 Z1.8 F42000
G1 X38.791 Y154.292 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X38.786 Y157.051 I-69.879 J1.248 E.09153
G3 X38.627 Y158.232 I-7.194 J-.366 E.03957
G1 X38.409 Y158.209 E.00727
G1 X38.409 Y145.59 E.4186
G2 X26.391 Y145.59 I-6.009 J.011 E.62552
G1 X26.391 Y158.209 E.4186
G1 X26.173 Y158.232 E.00727
G3 X26.009 Y156.789 I7.014 J-1.528 E.04826
G1 X26.009 Y145.609 E.37086
G3 X32.422 Y139.21 I6.392 J-.007 E.33402
G3 X38.721 Y144.657 I-.024 J6.392 E.30081
G1 X38.912 Y146.141 E.04966
G1 X40.204 Y145.719 E.0451
G3 X40.33 Y145.708 I.115 J.635 E.00419
G1 X47.309 Y145.71 E.23152
G3 X47.79 Y146.19 I-.016 J.496 E.02482
G1 X47.791 Y154.17 E.2647
G3 X47.27 Y154.69 I-.495 J.025 E.02752
G1 X40.319 Y154.69 E.23059
G3 X40.194 Y154.678 I-.003 J-.603 E.00416
G1 X38.849 Y154.308 E.04629
M204 S10000
G1 X39.198 Y154.826 F42000
G1 F8843.478
M204 S6000
G3 X39.193 Y157.067 I-56.786 J.983 E.07435
G3 X38.182 Y160.374 I-6.954 J-.317 E.11592
G1 X38.002 Y160.325 E.00619
G1 X38.002 Y145.593 E.48868
G2 X26.798 Y145.593 I-5.602 J.007 E.58335
G1 X26.798 Y160.325 E.48868
G1 X26.618 Y160.374 E.00619
G3 X25.602 Y156.793 I5.819 J-3.586 E.12506
G1 X25.602 Y145.605 E.37112
G3 X32.425 Y138.803 I6.799 J-.004 E.35518
G3 X39.123 Y144.597 I-.026 J6.799 E.31995
G1 X39.253 Y145.6 E.03357
G1 X40.057 Y145.335 E.02808
G3 X40.318 Y145.301 I.258 J.961 E.00876
G1 X47.329 Y145.302 E.23258
G3 X48.197 Y146.17 I-.041 J.909 E.04466
G1 X48.198 Y154.182 E.26576
G3 X47.282 Y155.097 I-.901 J.015 E.04793
G1 X40.311 Y155.097 E.23124
G3 X40.103 Y155.075 I.006 J-1.038 E.00698
G1 X39.256 Y154.842 E.02913
M204 S250
G1 X39.59 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X39.568 Y157.366 I-25.706 J.728 E.06227
G3 X37.61 Y161.753 I-7.181 J-.575 E.15047
G1 X37.61 Y145.597 E.49641
G2 X27.19 Y145.597 I-5.21 J.003 E.50274
G1 X27.19 Y161.753 E.49641
G3 X25.21 Y156.797 I5.276 J-4.981 E.16791
G1 X25.21 Y145.601 E.34401
G3 X32.427 Y138.411 I7.191 J0 E.34788
G3 X39.437 Y144.13 I-.027 J7.189 E.30067
G3 X39.581 Y145.079 I-9.321 J1.901 E.02951
G3 X40.306 Y144.909 I.826 J1.891 E.02302
G1 X47.349 Y144.91 E.21639
G3 X48.589 Y146.151 I-.065 J1.306 E.05907
G1 X48.59 Y154.193 E.24712
G3 X47.294 Y155.489 I-1.293 J.003 E.06261
G1 X40.304 Y155.489 E.21478
G3 X39.646 Y155.361 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X39.59 Y156.797 E-.54618
G1 X39.568 Y157.359 E-.21382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.495 Y158.423 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532297
G1 F7356.304
M204 S6000
G1 X38.443 Y158.773 E.01412
; LINE_WIDTH: 0.495934
G1 F7946.776
G1 X38.421 Y158.899 E.00472
; LINE_WIDTH: 0.453218
G1 F8774.111
G1 X38.4 Y159.025 E.00428
; LINE_WIDTH: 0.407794
G1 F9866.428
G1 X38.322 Y159.436 E.01244
; LINE_WIDTH: 0.359678
G1 F11365.147
G1 X38.244 Y159.847 E.0108
; WIPE_START
G1 X38.322 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X39.132 Y151.987 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X39.133 Y153.615 E.05401
G1 X39.521 Y153.501 E.01341
G1 X40.176 Y153.591 E.02194
G1 X40.689 Y153.965 E.02107
G1 X43.728 Y153.965 E.10081
G3 X45.417 Y153.591 I1.21 J1.466 E.05957
G1 X45.93 Y153.965 E.02106
G1 X47.065 Y153.965 E.03766
G1 X47.065 Y152.152 E.06014
G1 X46.727 Y152.105 E.01131
G1 X46.072 Y151.628 E.02689
G2 X44.107 Y150.97 I-1.487 J1.178 E.07274
G1 X43.452 Y151.447 E.02689
G3 X41.486 Y152.105 I-1.487 J-1.178 E.07274
G3 X40.176 Y151.074 I6.475 J-9.574 E.05536
G1 X39.521 Y150.88 E.02266
G1 X39.132 Y150.933 E.01301
G1 X39.131 Y148.375 E.08488
G1 X39.521 Y148.259 E.01348
G1 X40.176 Y148.349 E.02194
G1 X40.831 Y148.827 E.02689
G2 X42.796 Y149.485 I1.487 J-1.178 E.07274
G1 X43.452 Y149.007 E.02689
G3 X45.417 Y148.349 I1.487 J1.178 E.07274
G3 X46.727 Y149.381 I-6.475 J9.574 E.05536
G1 X47.065 Y149.481 E.01167
G1 X47.065 Y146.91 E.08526
G1 X46.727 Y146.864 E.01131
G1 X46.137 Y146.434 E.02422
G1 X43.182 Y146.434 E.09803
G3 X41.486 Y146.864 I-1.216 J-1.238 E.06083
G1 X40.896 Y146.434 E.02422
G2 X40.325 Y146.439 I-.262 J2.438 E.01897
G1 X39.498 Y146.712 E.02892
G1 X39.509 Y146.898 E.00616
M204 S10000
G1 X38.793 Y146.814 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.3835
G1 F10570.224
M204 S6000
G1 X38.768 Y146.94 E.00356
G1 X38.77 Y153.789 E.1901
G1 X38.788 Y153.897 E.00303
G1 X38.887 Y153.943 E.00303
G1 X40.248 Y154.316 E.03915
G1 X40.345 Y154.327 E.00271
G1 X47.242 Y154.327 E.19143
G1 X47.395 Y154.265 E.00459
G1 X47.428 Y154.134 E.00373
G1 X47.428 Y146.244 E.21897
G1 X47.349 Y146.101 E.00453
G1 X47.259 Y146.072 E.00264
G1 X40.36 Y146.071 E.19145
G1 X40.231 Y146.088 E.00361
G1 X39.235 Y146.417 E.02913
G1 X39.137 Y146.469 E.00306
G1 X39.109 Y146.741 E.0076
G1 X38.851 Y146.8 E.00733
M204 S10000
G1 X38.678 Y146.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.148562
G1 F15000
M204 S6000
G1 X38.658 Y146.119 E.00271
; LINE_WIDTH: 0.114127
G1 X38.638 Y145.805 E.00182
; WIPE_START
G1 X38.658 Y146.119 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.25 Y151.505 Z1.8 F42000
G1 X26.305 Y158.423 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.532272
G1 F7356.68
M204 S6000
G1 X26.357 Y158.773 E.01413
; LINE_WIDTH: 0.495905
G1 F7947.287
G1 X26.379 Y158.899 E.00471
; LINE_WIDTH: 0.453275
G1 F8772.906
G1 X26.4 Y159.025 E.00427
; LINE_WIDTH: 0.407874
G1 F9864.261
G1 X26.478 Y159.436 E.01244
; LINE_WIDTH: 0.359702
G1 F11364.302
G1 X26.556 Y159.847 E.0108
; OBJECT_ID: 9
; WIPE_START
G1 X26.478 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X34.064 Y158.601 Z1.8 F42000
G1 X73.191 Y154.293 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X73.186 Y156.758 I-63.829 J1.098 E.08178
G3 X73.027 Y157.964 I-7.533 J-.375 E.04039
G1 X72.809 Y157.941 E.00728
G1 X72.809 Y145.89 E.39974
G2 X65.988 Y139.612 I-6.31 J.011 E.34537
G2 X60.191 Y145.89 I.513 J6.289 E.31139
G1 X60.191 Y157.941 E.39974
G1 X59.973 Y157.964 E.00728
G3 X59.809 Y156.49 I6.678 J-1.486 E.04929
G1 X59.809 Y145.91 E.35096
G3 X66.672 Y139.213 I6.701 J.002 E.35448
G3 X73.082 Y144.697 I-.185 J6.703 E.30262
G1 X73.322 Y146.177 E.04976
G1 X74.544 Y145.735 E.04311
G3 X74.729 Y145.709 I.168 J.515 E.00621
G1 X81.719 Y145.71 E.23188
G3 X82.19 Y146.181 I-.027 J.498 E.02417
G1 X82.191 Y154.17 E.26502
G3 X81.67 Y154.691 I-.498 J.023 E.02748
G1 X74.719 Y154.691 E.23059
G3 X74.594 Y154.678 I-.003 J-.606 E.00416
G1 X73.249 Y154.309 E.04629
M204 S10000
G1 X73.598 Y154.827 F42000
G1 F8843.478
M204 S6000
G3 X73.593 Y156.774 I-50.414 J.833 E.06459
G3 X72.583 Y160.157 I-7.126 J-.284 E.11833
G1 X72.402 Y160.108 E.00622
G1 X72.402 Y145.894 E.47152
G2 X66.021 Y140.018 I-5.903 J.007 E.32322
G2 X60.598 Y145.894 I.48 J5.883 E.29138
G1 X60.598 Y160.108 E.47152
G1 X60.417 Y160.157 E.00622
G1 X60.355 Y160.05 E.0041
G3 X59.402 Y156.494 I6.24 J-3.578 E.12349
G1 X59.402 Y145.906 E.35122
G3 X66.684 Y138.806 I7.109 J.006 E.37593
G3 X73.482 Y144.624 I-.197 J7.111 E.321
G1 X73.645 Y145.628 E.03375
G1 X74.425 Y145.346 E.02749
G3 X74.717 Y145.302 I.287 J.916 E.00985
G1 X81.735 Y145.303 E.2328
G3 X82.597 Y146.165 I-.048 J.91 E.04427
G1 X82.598 Y154.182 E.26595
G3 X81.682 Y155.098 I-.906 J.01 E.04785
G1 X74.711 Y155.098 E.23124
G3 X74.502 Y155.075 I.006 J-1.039 E.00698
G1 X73.656 Y154.843 E.02913
M204 S250
G1 X73.99 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X73.901 Y157.653 I-14.994 J.578 E.07117
G1 X73.873 Y157.81 E.0049
G3 X72.01 Y161.572 I-7.377 J-1.312 E.13072
G1 X72.01 Y145.898 E.48162
G2 X60.99 Y145.898 I-5.51 J.005 E.53157
G1 X60.99 Y161.572 E.48162
G3 X59.01 Y156.497 I5.522 J-5.078 E.17128
G1 X59.01 Y145.902 E.32557
G3 X62.509 Y139.563 I7.525 J.019 E.23208
G3 X66.695 Y138.414 I4.019 J6.436 E.13527
G3 X73.956 Y145.098 I-.203 J7.508 E.3309
G3 X74.706 Y144.91 I.87 J1.874 E.02389
G1 X81.751 Y144.911 E.21646
G3 X82.989 Y146.149 I-.068 J1.307 E.05895
G1 X82.99 Y154.194 E.24718
G3 X81.694 Y155.49 I-1.3 J-.004 E.06251
G1 X74.704 Y155.49 E.21478
G3 X74.046 Y155.361 I.12 J-2.365 E.02066
; WIPE_START
M204 S6000
G1 X73.984 Y156.789 E-.54308
G1 X73.929 Y157.357 E-.21692
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.896 Y158.155 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533315
G1 F7341.026
M204 S6000
G1 X72.842 Y158.525 E.01496
; LINE_WIDTH: 0.49448
G1 F7972.373
G1 X72.821 Y158.655 E.00483
; LINE_WIDTH: 0.451547
G1 F8810.001
G1 X72.799 Y158.784 E.00437
; LINE_WIDTH: 0.405995
G1 F9915.306
G1 X72.722 Y159.202 E.01257
; LINE_WIDTH: 0.357839
G1 F11431.535
G1 X72.644 Y159.62 E.01091
M204 S10000
G1 X72.457 Y160.326 F42000
; LINE_WIDTH: 0.108593
G1 F15000
M204 S6000
G1 X72.224 Y160.99 E.00376
; WIPE_START
G1 X72.457 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X73.414 Y152.754 Z1.8 F42000
G1 X73.532 Y151.814 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X73.533 Y153.442 E.05401
G1 X74.276 Y153.506 E.02474
G1 X74.906 Y153.965 E.02585
G1 X77.709 Y153.965 E.09299
G3 X79.517 Y153.506 I1.33 J1.449 E.06447
G1 X80.147 Y153.965 E.02585
G1 X81.465 Y153.965 E.04374
G1 X81.465 Y152.108 E.06159
G1 X80.827 Y152.021 E.02135
G1 X80.172 Y151.543 E.02689
G2 X78.207 Y150.885 I-1.487 J1.178 E.07274
G1 X77.552 Y151.363 E.02689
G3 X75.586 Y152.021 I-1.487 J-1.178 E.07274
G3 X74.276 Y150.989 I6.475 J-9.574 E.05536
G1 X73.532 Y150.808 E.0254
G1 X73.531 Y148.201 E.08645
G1 X74.276 Y148.265 E.0248
G1 X74.931 Y148.742 E.02689
G2 X76.896 Y149.4 I1.487 J-1.178 E.07274
G1 X77.552 Y148.923 E.02689
G3 X79.517 Y148.265 I1.487 J1.178 E.07274
G3 X80.827 Y149.296 I-6.475 J9.574 E.05536
G1 X81.465 Y149.485 E.02204
G1 X81.464 Y146.867 E.08684
G1 X80.827 Y146.779 E.02132
G1 X80.355 Y146.435 E.01938
G1 X77.181 Y146.435 E.10528
G3 X75.586 Y146.779 I-1.115 J-1.298 E.05643
G1 X75.113 Y146.434 E.01943
G1 X74.774 Y146.434 E.01124
G2 X73.929 Y146.729 I.318 J2.268 E.02988
G1 X73.974 Y147.12 E.01305
M204 S10000
G1 X73.088 Y146.478 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.161341
G1 F15000
M204 S6000
G1 X73.063 Y146.163 E.00305
; LINE_WIDTH: 0.118721
G1 X73.037 Y145.847 E.00196
; WIPE_START
G1 X73.063 Y146.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.591 Y151.425 Z1.8 F42000
G1 X81.642 Y154.328 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383615
G1 F10566.658
M204 S6000
G1 X81.769 Y154.295 E.00364
G1 X81.828 Y154.127 E.00494
G1 X81.827 Y146.236 E.21907
G1 X81.752 Y146.104 E.00421
G1 X81.665 Y146.073 E.00258
G1 X74.766 Y146.072 E.19152
G1 X74.617 Y146.095 E.00418
M73 P60 R9
G1 X73.654 Y146.443 E.02844
G1 X73.556 Y146.499 E.00312
G1 X73.54 Y146.777 E.00773
G1 X73.192 Y146.858 E.00993
G1 X73.168 Y146.983 E.00352
G1 X73.17 Y153.79 E.18898
G1 X73.188 Y153.897 E.00303
G1 X73.287 Y153.943 E.00303
G1 X74.648 Y154.317 E.03917
G1 X74.745 Y154.328 E.00271
G1 X81.582 Y154.328 E.18982
; WIPE_START
G1 X79.582 Y154.328 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.093 Y155.799 Z1.8 F42000
G1 X60.104 Y158.155 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533292
G1 F7341.37
M204 S6000
G1 X60.158 Y158.525 E.01497
; LINE_WIDTH: 0.494446
G1 F7972.965
G1 X60.179 Y158.655 E.00482
; LINE_WIDTH: 0.451578
G1 F8809.332
G1 X60.201 Y158.784 E.00436
; LINE_WIDTH: 0.406058
G1 F9913.593
G1 X60.278 Y159.202 E.01258
; LINE_WIDTH: 0.357894
G1 F11429.539
G1 X60.356 Y159.62 E.01091
M204 S10000
G1 X60.543 Y160.326 F42000
; LINE_WIDTH: 0.108591
G1 F15000
M204 S6000
G1 X60.776 Y160.99 E.00376
; OBJECT_ID: 3
; WIPE_START
G1 X60.543 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X55.545 Y154.557 Z1.8 F42000
G1 X26.738 Y121.298 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X26.687 Y121.119 E.00618
G3 X26.391 Y119.01 I7.527 J-2.133 E.07088
G1 X26.391 Y95.99 E.76359
G3 X34.19 Y88.191 I7.812 J.013 E.40622
G1 X87.71 Y88.191 E1.77533
G3 X95.509 Y95.99 I-.024 J7.823 E.40607
G1 X95.509 Y119.01 E.76359
G3 X87.71 Y126.809 I-7.812 J-.013 E.40622
G1 X34.19 Y126.809 E1.77533
G3 X26.777 Y121.412 I.024 J-7.823 E.32503
G1 X26.757 Y121.355 E.002
M204 S10000
G1 X27.139 Y121.191 F42000
G1 F8843.478
M204 S6000
G1 X27.079 Y121.008 E.00639
G3 X26.798 Y119.006 I7.135 J-2.022 E.06729
G1 X26.798 Y95.994 E.76333
G3 X34.194 Y88.598 I7.405 J.009 E.38527
G1 X87.706 Y88.598 E1.77508
G3 X95.102 Y95.994 I-.019 J7.416 E.38512
G1 X95.102 Y119.006 E.76333
G3 X87.706 Y126.402 I-7.405 J-.009 E.38527
G1 X34.194 Y126.402 E1.77508
G3 X27.365 Y121.831 I.019 J-7.416 E.28892
G1 X27.159 Y121.248 E.02051
M204 S250
G1 X27.503 Y121.065 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X27.499 Y121.047 E.00057
G3 X27.19 Y119.002 I6.714 J-2.06 E.06377
G1 X27.19 Y95.998 E.70685
G3 X34.198 Y88.99 I7.013 J.005 E.33818
G1 X87.702 Y88.99 E1.64403
G3 X94.71 Y95.998 I-.015 J7.023 E.33805
G1 X94.71 Y119.002 E.70685
G3 X87.702 Y126.01 I-7.013 J-.005 E.33817
G1 X34.198 Y126.01 E1.64403
G3 X27.727 Y121.681 I.015 J-7.023 E.25355
G1 X27.524 Y121.121 E.01831
; WIPE_START
M204 S6000
G1 X27.499 Y121.047 E-.02986
G1 X27.325 Y120.368 E-.26638
G1 X27.239 Y119.824 E-.20926
G1 X27.199 Y119.155 E-.25451
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.302 Y114.572 Z1.8 F42000
G1 X68.941 Y87.809 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y87.809 E.62194
G3 X95.891 Y96.01 I.006 J8.195 E.42739
G1 X95.891 Y118.99 E.76229
G3 X87.69 Y127.191 I-8.195 J.006 E.4274
G1 X34.21 Y127.191 E1.77403
G3 X26.009 Y118.99 I.006 J-8.207 E.42723
G1 X26.009 Y96.01 E.76229
M73 P61 R9
G3 X34.21 Y87.809 I8.195 J-.006 E.4274
G1 X52.959 Y87.809 E.62194
G1 X52.959 Y82.83 E.16517
G3 X53.48 Y82.309 I.496 J-.025 E.02752
G1 X68.444 Y82.31 E.49638
G3 X68.941 Y82.83 I.004 J.494 E.02674
G1 X68.941 Y87.749 E.16319
M204 S10000
G1 X69.348 Y87.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y87.402 E.60858
G3 X96.298 Y96.006 I.002 J8.602 E.44833
G1 X96.298 Y118.994 E.76256
G3 X87.694 Y127.598 I-8.602 J.002 E.44833
G1 X34.206 Y127.598 E1.7743
G3 X25.602 Y118.994 I.01 J-8.614 E.44816
G1 X25.602 Y96.006 E.76256
G3 X34.206 Y87.402 I8.602 J-.002 E.44834
G1 X52.552 Y87.402 E.60858
G1 X52.552 Y82.818 E.15207
G3 X53.468 Y81.902 I.903 J-.013 E.04791
G1 X68.457 Y81.903 E.49722
G3 X69.348 Y82.818 I-.009 J.9 E.0471
G1 X69.348 Y87.342 E.15008
M204 S250
G1 X69.74 Y87.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y87.01 E.5518
G3 X90.628 Y87.502 I-.014 J9.05 E.0917
G3 X96.69 Y96.002 I-2.954 J8.518 E.34214
G1 X96.69 Y118.998 E.7066
G3 X87.698 Y127.99 I-8.994 J-.002 E.43398
G1 X34.202 Y127.99 E1.64378
G3 X25.21 Y118.998 I.015 J-9.007 E.43382
G1 X25.21 Y96.002 E.7066
G3 X29.339 Y88.44 I8.996 J.003 E.27608
G3 X34.202 Y87.01 I4.87 J7.58 E.15789
G1 X52.16 Y87.01 E.5518
G1 X52.16 Y82.806 E.12917
G3 X53.456 Y81.51 I1.296 J-.001 E.06257
G1 X68.47 Y81.511 E.46133
G3 X69.74 Y82.806 I-.022 J1.292 E.0618
G1 X69.74 Y86.95 E.12733
; WIPE_START
M204 S6000
G1 X71.74 Y86.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X66.289 Y87.465 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X67.858 Y87.465 E.05205
G3 X68.215 Y87.235 I.512 J.402 E.01435
G1 X68.214 Y84.52 E.09006
G1 X67.502 Y85.005 E.02858
G3 X65.536 Y85.663 I-1.487 J-1.178 E.07274
G1 X64.881 Y85.186 E.02689
G2 X62.916 Y84.528 I-1.487 J1.178 E.07274
G1 X62.26 Y85.005 E.02689
G3 X60.295 Y85.663 I-1.487 J-1.178 E.07274
G1 X59.64 Y85.186 E.02689
G2 X57.674 Y84.528 I-1.487 J1.178 E.07274
G1 X57.019 Y85.005 E.02689
G3 X55.054 Y85.663 I-1.487 J-1.178 E.07274
G3 X53.743 Y84.632 I6.475 J-9.574 E.05536
G1 X53.688 Y84.615 E.00192
G1 X53.685 Y87.14 E.08377
G1 X54.178 Y87.465 E.01959
G1 X57.376 Y87.465 E.10606
G3 X58.985 Y87.148 I1.13 J1.496 E.0563
G1 X59.42 Y87.465 E.01785
G1 X62.617 Y87.465 E.10606
G3 X64.226 Y87.148 I1.13 J1.496 E.0563
G1 X64.661 Y87.465 E.01785
G1 X66.289 Y87.465 E.05401
M204 S10000
G1 X68.574 Y82.831 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38314
G1 F10581.385
M204 S6000
G1 X68.573 Y82.804 E.00077
G2 X68.398 Y82.672 I-.178 J.054 E.0065
G1 X53.486 Y82.68 E.4134
G1 X53.369 Y82.724 E.00346
G1 X53.327 Y82.839 E.0034
G1 X53.322 Y87.669 E.13389
G1 X53.349 Y87.801 E.00374
G1 X53.481 Y87.828 E.00374
G1 X68.419 Y87.828 E.41413
G1 X68.551 Y87.801 E.00374
G1 X68.578 Y87.669 E.00373
G1 X68.574 Y82.891 E.13245
M204 S10000
G1 X68.213 Y83.306 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X68.213 Y83.035 E.00898
G1 X66.855 Y83.036 E.04504
G1 X66.191 Y83.132 E.02226
G1 X65.867 Y83.036 E.01121
G1 X61.61 Y83.039 E.14122
G1 X60.95 Y83.132 E.02212
G1 X60.636 Y83.039 E.01088
G1 X56.365 Y83.042 E.14166
G1 X55.709 Y83.132 E.02197
G1 X55.404 Y83.042 E.01055
G1 X53.776 Y83.043 E.05401
; OBJECT_ID: 1
; WIPE_START
G1 X55.404 Y83.042 E-.61876
G1 X55.709 Y83.132 E-.12086
G1 X55.762 Y83.125 E-.02039
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X60.42 Y77.079 Z1.8 F42000
G1 X93.014 Y34.776 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X93.273 Y35.142 E.01489
G3 X94.509 Y39.19 I-6.087 J4.071 E.14243
G1 X94.509 Y62.21 E.76359
G3 X87.21 Y69.509 I-7.322 J-.023 E.38003
G1 X33.69 Y69.509 E1.77533
G3 X26.391 Y62.21 I.013 J-7.312 E.38017
G1 X26.391 Y39.19 E.76359
G3 X33.69 Y31.891 I7.312 J.013 E.38017
G1 X87.21 Y31.891 E1.77533
G3 X92.936 Y34.678 I-.023 J7.322 E.21855
G1 X92.976 Y34.729 E.00216
M204 S10000
G1 X92.685 Y35.015 F42000
G1 F8843.478
M204 S6000
G1 X92.935 Y35.368 E.01436
G3 X94.102 Y39.194 I-5.748 J3.844 E.13461
G1 X94.102 Y62.206 E.76333
G3 X87.206 Y69.102 I-6.915 J-.018 E.35908
G1 X33.694 Y69.102 E1.77508
G3 X26.798 Y62.206 I.009 J-6.905 E.35922
G1 X26.798 Y39.194 E.76333
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X92.616 Y34.93 I-.018 J6.915 E.20649
G1 X92.647 Y34.968 E.00163
M204 S250
G1 X92.368 Y35.246 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X92.612 Y35.584 E.01283
G3 X93.71 Y39.198 I-5.415 J3.619 E.11775
G1 X93.71 Y62.202 E.70685
G3 X87.202 Y68.71 I-6.522 J-.014 E.31393
G1 X33.698 Y68.71 E1.64403
G3 X27.19 Y62.202 I.005 J-6.513 E.31405
G1 X27.19 Y39.198 E.70685
G3 X33.698 Y32.69 I6.513 J.005 E.31405
G1 X87.202 Y32.69 E1.64403
G3 X92.312 Y35.171 I-.005 J6.513 E.18059
G1 X92.332 Y35.197 E.00103
; WIPE_START
M204 S6000
G1 X92.612 Y35.584 E-.18144
G1 X93 Y36.244 E-.29116
G1 X93.214 Y36.709 E-.19426
G1 X93.299 Y36.939 E-.09314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.843 Y35.31 Z1.8 F42000
G1 X68.441 Y31.509 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I.006 J7.695 E.40135
G1 X94.891 Y62.19 E.76229
G3 X87.19 Y69.891 I-7.706 J-.005 E.40119
G1 X33.71 Y69.891 E1.77404
G3 X26.009 Y62.19 I-.006 J-7.695 E.40134
G1 X26.009 Y39.21 E.76229
G3 X33.71 Y31.509 I7.695 J-.006 E.40135
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.53 E.16517
G3 X52.98 Y26.009 I.496 J-.025 E.02752
G1 X67.944 Y26.01 E.49638
G3 X68.441 Y26.53 I.004 J.494 E.02674
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I.002 J8.102 E.42228
G1 X95.298 Y62.194 E.76256
G3 X87.194 Y70.298 I-8.113 J-.009 E.42212
G1 X33.706 Y70.298 E1.77431
G3 X25.602 Y62.194 I-.002 J-8.102 E.42228
G1 X25.602 Y39.206 E.76256
G3 X33.706 Y31.102 I8.102 J-.002 E.42228
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.518 E.15207
G3 X52.968 Y25.602 I.903 J-.013 E.0479
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
G3 X95.553 Y37.691 I-.015 J8.508 E.36302
G3 X95.69 Y39.202 I-8.546 J1.536 E.04668
G1 X95.69 Y62.198 E.7066
G3 X94.358 Y66.762 I-8.509 J-.007 E.14806
G3 X88.709 Y70.553 I-7.191 J-4.611 E.21501
G3 X87.198 Y70.69 I-1.536 J-8.546 E.04668
G1 X33.702 Y70.69 E1.64378
G3 X25.21 Y62.198 I.002 J-8.494 E.40985
G1 X25.21 Y39.202 E.7066
G3 X33.702 Y30.71 I8.494 J.002 E.40985
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.506 E.12917
G3 X52.956 Y25.21 I1.296 J-.001 E.06257
G1 X67.97 Y25.211 E.46133
G3 X69.24 Y26.506 I-.022 J1.292 E.0618
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X67.712 Y28.807 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X67.714 Y30.435 E.05401
G1 X67.657 Y30.452 E.00198
M73 P62 R9
G3 X66.783 Y31.165 I-5.369 J-5.685 E.03744
G1 X64.783 Y31.165 E.06637
G2 X63.726 Y30.348 I-6.177 J6.897 E.04435
G2 X61.76 Y31.006 I-.478 J1.836 E.07274
G1 X61.542 Y31.165 E.00896
G1 X59.541 Y31.165 E.06637
G2 X58.485 Y30.348 I-6.176 J6.897 E.04435
G2 X56.519 Y31.006 I-.478 J1.836 E.07273
G1 X56.301 Y31.165 E.00896
G1 X54.3 Y31.165 E.06637
G2 X53.186 Y30.341 I-4.629 J5.088 E.04607
G1 X53.188 Y27.815 E.08377
G1 X53.243 Y27.832 E.0019
G2 X54.554 Y28.863 I7.785 J-8.542 E.05536
G2 X56.519 Y28.205 I.478 J-1.836 E.07274
G1 X57.174 Y27.728 E.02689
G3 X59.14 Y28.386 I.478 J1.836 E.07274
G1 X59.795 Y28.863 E.02689
G2 X61.76 Y28.205 I.478 J-1.836 E.07274
G1 X62.416 Y27.728 E.02689
G3 X64.381 Y28.386 I.478 J1.836 E.07274
G1 X65.036 Y28.863 E.02689
G2 X67.002 Y28.205 I.478 J-1.836 E.07274
G1 X67.711 Y27.72 E.0285
G1 X67.71 Y26.735 E.03268
G1 X67.067 Y26.735 E.02133
M204 S10000
G1 X52.986 Y26.377 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383141
G1 F10581.383
M204 S6000
G1 X52.868 Y26.421 E.0035
G1 X52.827 Y26.531 E.00325
G1 X52.822 Y31.369 E.13412
G1 X52.849 Y31.501 E.00374
G1 X52.981 Y31.528 E.00374
G1 X67.919 Y31.528 E.41413
G1 X68.051 Y31.501 E.00374
G1 X68.078 Y31.369 E.00374
G1 X68.073 Y26.531 E.13411
G1 X68.071 Y26.504 E.00075
G1 X67.99 Y26.4 E.00366
G1 X67.898 Y26.372 E.00268
G1 X53.046 Y26.377 E.41174
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10581.383
G1 X55.046 Y26.376 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 8/15
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S155.55
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z1.8 I-.484 J1.117 P1  F42000
G1 X218.891 Y97.392 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X218.886 Y100.336 I-76.941 J1.348 E.09764
G3 X218.728 Y101.51 I-6.783 J-.317 E.03937
G1 X218.509 Y101.487 E.00729
G1 X218.509 Y88.489 E.43116
G2 X206.891 Y88.489 I-5.809 J.012 E.6046
G1 X206.891 Y101.487 E.43116
G1 X206.672 Y101.51 E.00729
G3 X206.509 Y100.089 I6.81 J-1.502 E.04754
G1 X206.509 Y88.509 E.38412
G3 X212.974 Y82.315 I6.192 J-.008 E.33196
G3 X218.843 Y87.734 I-.286 J6.198 E.28788
G1 X219 Y89.233 E.05001
G1 X220.271 Y88.826 E.04428
G3 X220.42 Y88.808 I.171 J.788 E.00497
G1 X227.419 Y88.809 E.23219
G3 X227.89 Y89.287 I-.026 J.496 E.02441
G1 X227.891 Y97.269 E.26479
G3 X227.37 Y97.79 I-.495 J.025 E.02752
G1 X220.419 Y97.79 E.23059
G3 X220.294 Y97.777 I-.003 J-.605 E.00417
G1 X218.949 Y97.408 E.04628
M204 S10000
G1 X219.298 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X219.293 Y100.351 I-63.471 J1.083 E.08045
G3 X218.279 Y103.619 I-6.613 J-.261 E.11478
G1 X218.102 Y103.568 E.00612
G1 X218.102 Y88.493 E.50007
G2 X207.298 Y88.493 I-5.402 J.008 E.56244
G1 X207.298 Y103.568 E.50007
G1 X207.12 Y103.619 E.00612
G1 X207.069 Y103.536 E.00322
G3 X206.102 Y100.093 I5.65 J-3.445 E.12014
G1 X206.102 Y88.505 E.38438
G3 X212.989 Y81.909 I6.599 J-.004 E.35353
G3 X219.247 Y87.684 I-.302 J6.606 E.30691
G1 X219.353 Y88.693 E.03366
G1 X220.162 Y88.434 E.02819
G3 X220.412 Y88.401 I.28 J1.175 E.00837
G1 X227.435 Y88.402 E.23298
G3 X228.297 Y89.268 I-.047 J.909 E.04442
G1 X228.298 Y97.281 E.26582
G3 X227.382 Y98.197 I-.901 J.015 E.04793
G1 X220.411 Y98.197 E.23124
G3 X220.202 Y98.174 I.006 J-1.039 E.00698
G1 X219.356 Y97.942 E.02912
M204 S250
G1 X219.69 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X219.67 Y100.633 I-28.775 J.828 E.06738
G3 X219.593 Y101.255 I-7.597 J-.625 E.01926
G3 X217.71 Y104.972 I-6.975 J-1.197 E.12997
G1 X217.71 Y88.497 E.50624
G2 X207.69 Y88.497 I-5.01 J.004 E.48337
G1 X207.69 Y104.972 E.50624
G3 X205.807 Y101.255 I5.094 J-4.915 E.12997
G3 X205.71 Y100.096 I8.074 J-1.262 E.03574
G1 X205.71 Y88.501 E.3563
G3 X213.004 Y81.517 I6.991 J0 E.34673
G3 X219.692 Y88.172 I-.314 J7.004 E.31804
G3 X220.404 Y88.009 I.849 J2.067 E.02254
G1 X227.45 Y88.01 E.21652
G3 X228.689 Y89.25 I-.067 J1.306 E.059
G1 X228.69 Y97.293 E.24714
G3 X227.394 Y98.589 I-1.293 J.003 E.06261
G1 X220.404 Y98.589 E.21478
G3 X219.746 Y98.461 I.12 J-2.368 E.02066
; WIPE_START
M204 S6000
G1 X219.69 Y100.097 E-.62199
G1 X219.676 Y100.459 E-.13801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.877 Y101.747 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545399
G1 F7164.49
M204 S6000
G1 X218.557 Y101.95 E.01552
; LINE_WIDTH: 0.526763
G1 F7440.441
G1 X218.538 Y102.067 E.00468
; LINE_WIDTH: 0.488388
G1 F8081.399
G1 X218.519 Y102.184 E.00431
; LINE_WIDTH: 0.447438
G1 F8899.478
G1 X218.436 Y102.634 E.01508
; LINE_WIDTH: 0.403906
G1 F9972.686
G1 X218.353 Y103.084 E.01346
; WIPE_START
G1 X218.436 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X210.81 Y102.936 Z2 F42000
G1 X207.047 Y103.084 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.403968
G1 F9970.99
M204 S6000
G1 X206.964 Y102.634 E.01346
; LINE_WIDTH: 0.447416
G1 F8899.969
G1 X206.881 Y102.184 E.01508
; LINE_WIDTH: 0.488356
G1 F8081.983
G1 X206.862 Y102.067 E.00431
; LINE_WIDTH: 0.541108
G1 F7226.192
G1 X206.843 Y101.95 E.00482
G1 X206.521 Y101.739 E.01563
; WIPE_START
G1 X206.843 Y101.95 E-.58089
G1 X206.862 Y102.067 E-.17911
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X211.982 Y96.406 Z2 F42000
G1 X218.738 Y88.936 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.110021
G1 F15000
M204 S6000
G1 X218.753 Y89.228 E.0016
; LINE_WIDTH: 0.136234
G1 X218.769 Y89.521 E.00223
M204 S10000
G1 X218.675 Y96.11 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.41556
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X219.577 Y97.197 E.07807
G1 X220.361 Y97.412 E.0449
G1 X218.877 Y95.625 E.12836
G1 X218.877 Y94.896 E.04029
G1 X220.972 Y97.42 E.18128
G1 X221.577 Y97.42 E.03344
G1 X218.876 Y94.167 E.23365
G1 X218.876 Y93.438 E.04029
G1 X222.183 Y97.42 E.28602
G1 X222.788 Y97.42 E.03344
G1 X218.876 Y92.709 E.33839
G1 X218.876 Y91.98 E.04029
G1 X223.393 Y97.42 E.39076
G1 X223.998 Y97.42 E.03344
G1 X218.875 Y91.251 E.44312
G1 X218.875 Y90.522 E.04029
G1 X224.603 Y97.42 E.49549
G1 X225.208 Y97.42 E.03344
G1 X218.949 Y89.882 E.54144
G1 X219.234 Y89.867 E.01574
G1 X219.21 Y89.554 E.01734
G1 X219.267 Y89.536 E.00329
G1 X225.813 Y97.42 E.56628
G1 X226.419 Y97.42 E.03344
G1 X219.745 Y89.383 E.57729
G1 X220.223 Y89.23 E.02774
G1 X227.024 Y97.42 E.58829
G2 X227.44 Y97.405 I.159 J-1.341 E.02309
G2 X227.515 Y97.283 I-.031 J-.103 E.00867
G1 X220.785 Y89.178 E.58214
G1 X221.39 Y89.178 E.03344
G1 X227.521 Y96.562 E.53034
G1 X227.521 Y95.833 E.04028
G1 X221.995 Y89.178 E.47798
G1 X222.601 Y89.178 E.03344
G1 X227.521 Y95.104 E.42562
G1 X227.521 Y94.375 E.04028
G1 X223.206 Y89.178 E.37326
G1 X223.811 Y89.178 E.03344
G1 X227.521 Y93.646 E.32089
G1 X227.521 Y92.917 E.04028
G1 X224.416 Y89.178 E.26853
G1 X225.021 Y89.179 E.03344
G1 X227.52 Y92.188 E.21617
G1 X227.52 Y91.459 E.04028
G1 X225.627 Y89.179 E.16381
G1 X226.232 Y89.179 E.03344
G1 X227.52 Y90.73 E.11144
G1 X227.52 Y90.001 E.04028
G1 X226.837 Y89.179 E.05908
G1 X227.38 Y89.179 E.02999
G3 X227.474 Y89.217 I0 J.136 E.00575
G1 X227.723 Y89.516 E.0215
M106 S155.55
; OBJECT_ID: 6
; WIPE_START
G1 X227.474 Y89.217 E-.14784
G1 X227.38 Y89.179 E-.03861
G1 X226.837 Y89.179 E-.20622
G1 X227.455 Y89.923 E-.36733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X219.94 Y91.26 Z2 F42000
G1 X185.491 Y97.392 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X185.486 Y100.336 I-76.663 J1.348 E.09765
G3 X185.328 Y101.51 I-6.782 J-.317 E.03937
G1 X185.109 Y101.487 E.00729
G1 X185.109 Y88.489 E.43116
G2 X173.491 Y88.489 I-5.809 J.012 E.6046
G1 X173.491 Y101.487 E.43116
G1 X173.272 Y101.51 E.00729
G1 X173.238 Y101.35 E.00542
G3 X173.109 Y100.089 I6.952 J-1.348 E.04212
G1 X173.109 Y88.509 E.38412
G3 X179.574 Y82.315 I6.192 J-.008 E.33196
G3 X185.443 Y87.734 I-.286 J6.198 E.28789
G1 X185.6 Y89.234 E.05002
G1 X186.871 Y88.826 E.04428
G3 X187.02 Y88.808 I.171 J.786 E.00497
G1 X194.009 Y88.809 E.23186
G3 X194.49 Y89.28 I-.015 J.497 E.02451
G1 X194.491 Y97.269 E.26502
G3 X193.97 Y97.79 I-.495 J.025 E.02752
G1 X187.019 Y97.79 E.23059
G3 X186.894 Y97.777 I-.003 J-.601 E.00416
G1 X185.549 Y97.408 E.04628
M204 S10000
G1 X185.898 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X185.893 Y100.351 I-63.244 J1.083 E.08045
G3 X184.879 Y103.619 I-6.613 J-.26 E.11478
G1 X184.702 Y103.568 E.00612
G1 X184.702 Y88.493 E.50007
G2 X173.898 Y88.493 I-5.402 J.008 E.56244
G1 X173.898 Y103.568 E.50007
G1 X173.721 Y103.619 E.00612
G3 X172.702 Y100.093 I5.598 J-3.527 E.12336
G1 X172.702 Y88.505 E.38438
G3 X179.589 Y81.909 I6.599 J-.004 E.35353
G3 X185.847 Y87.684 I-.302 J6.605 E.30691
G1 X185.953 Y88.693 E.03367
G1 X186.762 Y88.434 E.0282
G3 X187.012 Y88.401 I.28 J1.174 E.00836
G1 X194.029 Y88.402 E.23278
G3 X194.897 Y89.264 I-.041 J.909 E.04448
G1 X194.898 Y97.281 E.26595
G3 X193.982 Y98.197 I-.901 J.015 E.04793
G1 X187.011 Y98.197 E.23124
G3 X186.802 Y98.174 I.006 J-1.037 E.00698
G1 X185.956 Y97.942 E.02912
M204 S250
G1 X186.29 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X186.27 Y100.633 I-28.752 J.828 E.06739
G3 X186.193 Y101.255 I-7.596 J-.624 E.01926
G3 X184.31 Y104.972 I-6.977 J-1.198 E.12997
G1 X184.31 Y88.497 E.50624
G2 X174.29 Y88.497 I-5.01 J.004 E.48337
G1 X174.29 Y104.972 E.50624
G3 X172.31 Y100.097 I5.021 J-4.879 E.16577
G1 X172.31 Y88.501 E.3563
G3 X179.604 Y81.517 I6.991 J0 E.34673
G3 X186.293 Y88.172 I-.313 J7.003 E.31805
G3 X187.004 Y88.009 I.849 J2.064 E.02254
G1 X194.048 Y88.01 E.21645
G3 X195.289 Y89.248 I-.065 J1.306 E.05903
G1 X195.29 Y97.293 E.24718
G3 X193.994 Y98.589 I-1.293 J.003 E.06261
G1 X187.004 Y98.589 E.21478
G3 X186.346 Y98.461 I.12 J-2.366 E.02066
; WIPE_START
M204 S6000
G1 X186.29 Y100.096 E-.62202
G1 X186.276 Y100.459 E-.13798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.275 Y96.107 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41548
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X186.175 Y97.196 E.07806
G1 X186.956 Y97.411 E.04474
M73 P63 R9
G1 X185.477 Y95.621 E.12825
G1 X185.477 Y94.89 E.04039
G1 X187.567 Y97.42 E.18129
G1 X188.171 Y97.42 E.03335
G1 X185.476 Y94.159 E.23368
G1 X185.476 Y93.428 E.04039
G1 X188.775 Y97.42 E.28607
G1 X189.378 Y97.42 E.03335
G1 X185.476 Y92.697 E.33845
G1 X185.476 Y91.965 E.04039
G1 X189.982 Y97.42 E.39084
G1 X190.586 Y97.42 E.03335
G1 X185.475 Y91.234 E.44323
G1 X185.475 Y90.503 E.04039
G1 X191.19 Y97.42 E.49562
G1 X191.794 Y97.42 E.03335
G1 X185.565 Y89.881 E.54017
G1 X185.825 Y89.868 E.01439
G1 X185.809 Y89.555 E.01731
G1 X185.88 Y89.532 E.00413
G1 X192.397 Y97.42 E.56521
G1 X193.001 Y97.42 E.03335
G1 X186.358 Y89.379 E.57618
G1 X186.835 Y89.226 E.02769
G1 X193.605 Y97.42 E.58714
G2 X194.04 Y97.405 I.168 J-1.4 E.02411
G2 X194.112 Y97.302 I-.024 J-.093 E.00753
G1 X187.399 Y89.178 E.58215
G1 X188.003 Y89.178 E.03336
G1 X194.121 Y96.583 E.5306
G1 X194.121 Y95.852 E.04038
G1 X188.607 Y89.178 E.47822
G1 X189.211 Y89.178 E.03336
G1 X194.121 Y95.121 E.42584
G1 X194.121 Y94.39 E.04038
G1 X189.815 Y89.178 E.37346
G1 X190.419 Y89.178 E.03336
G1 X194.121 Y93.659 E.32107
G1 X194.121 Y92.928 E.04038
G1 X191.022 Y89.178 E.26869
G1 X191.626 Y89.179 E.03336
G1 X194.12 Y92.197 E.21631
G1 X194.12 Y91.466 E.04038
G1 X192.23 Y89.179 E.16393
G1 X192.834 Y89.179 E.03336
G1 X194.12 Y90.735 E.11154
G1 X194.12 Y90.004 E.04038
G1 X193.438 Y89.179 E.05916
G1 X193.97 Y89.179 E.02937
G3 X194.071 Y89.214 I.008 J.141 E.00609
G1 X194.323 Y89.519 E.02181
M106 S155.55
M204 S10000
G1 X185.369 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136309
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X185.354 Y89.228 E.00223
; LINE_WIDTH: 0.110047
G1 X185.338 Y88.935 E.00161
; WIPE_START
G1 X185.354 Y89.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.43 Y96.86 Z2 F42000
G1 X185.478 Y101.743 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.545737
G1 F7159.666
M204 S6000
G1 X185.157 Y101.95 E.01565
; LINE_WIDTH: 0.526783
G1 F7440.125
G1 X185.138 Y102.067 E.00468
; LINE_WIDTH: 0.488408
G1 F8081.032
G1 X185.119 Y102.184 E.00431
; LINE_WIDTH: 0.447492
G1 F8898.296
G1 X185.036 Y102.634 E.01509
; LINE_WIDTH: 0.404004
G1 F9969.981
G1 X184.953 Y103.084 E.01347
; WIPE_START
G1 X185.036 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.41 Y102.936 Z2 F42000
G1 X173.647 Y103.084 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.403915
G1 F9972.461
M204 S6000
G1 X173.564 Y102.634 E.01346
; LINE_WIDTH: 0.447398
G1 F8900.359
G1 X173.481 Y102.184 E.01508
; LINE_WIDTH: 0.488337
G1 F8082.323
G1 X173.462 Y102.067 E.00431
; LINE_WIDTH: 0.540954
G1 F7228.434
G1 X173.443 Y101.95 E.00482
G1 X173.122 Y101.744 E.01545
; OBJECT_ID: 5
; WIPE_START
G1 X173.443 Y101.95 E-.57938
G1 X173.462 Y102.067 E-.18062
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X166.006 Y100.436 Z2 F42000
G1 X152.091 Y97.392 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.091 Y100.389 E.09942
G3 X151.927 Y101.778 I-6.092 J-.014 E.0465
G1 X151.709 Y101.755 E.00727
G1 X151.709 Y88.189 E.44999
G2 X140.691 Y88.189 I-5.509 J.011 E.57342
G1 X140.691 Y101.755 E.44999
G1 X140.473 Y101.778 E.00727
G3 X140.309 Y100.389 I6.475 J-1.467 E.04648
G1 X140.309 Y88.209 E.40403
G3 X146.459 Y82.315 I5.9 J0 E.31569
G3 X152.069 Y87.7 I-.26 J5.886 E.28172
G1 X152.169 Y89.234 E.051
G1 X153.509 Y88.817 E.04652
G3 X153.628 Y88.808 I.109 J.633 E.00399
G1 X160.619 Y88.809 E.2319
G3 X161.09 Y89.28 I-.026 J.497 E.02418
G1 X161.091 Y97.279 E.26536
G3 X160.57 Y97.79 I-.495 J.016 E.02719
G1 X153.619 Y97.79 E.23059
G3 X153.494 Y97.777 I-.003 J-.6 E.00416
G1 X152.149 Y97.408 E.04629
M204 S10000
G1 X152.498 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X152.493 Y100.645 I-69.419 J1.234 E.0902
G1 X152.488 Y100.728 E.00275
G3 X151.478 Y103.833 I-6.28 J-.326 E.10959
G1 X151.302 Y103.782 E.00608
G1 X151.302 Y88.193 E.51711
G2 X141.098 Y88.193 I-5.102 J.007 E.53126
G1 X141.098 Y103.782 E.51711
G1 X140.922 Y103.833 E.00608
G3 X139.902 Y100.393 I5.382 J-3.467 E.12064
G1 X139.902 Y88.205 E.4043
G3 X146.474 Y81.908 I6.308 J.005 E.33725
G3 X152.475 Y87.665 I-.285 J6.304 E.30118
G1 X152.542 Y88.69 E.03408
G1 X153.368 Y88.432 E.0287
G3 X153.617 Y88.401 I.247 J.965 E.00835
G1 X160.635 Y88.402 E.23281
G3 X161.497 Y89.264 I-.047 J.909 E.04429
G1 X161.498 Y97.287 E.26615
G3 X160.582 Y98.197 I-.901 J.009 E.04773
G1 X153.611 Y98.197 E.23124
G3 X153.402 Y98.174 I.006 J-1.034 E.00698
G1 X152.556 Y97.942 E.02912
M204 S250
G1 X152.89 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.885 Y100.66 I-56.627 J.978 E.06822
G1 X152.88 Y100.751 E.00279
G3 X150.91 Y105.149 I-6.737 J-.377 E.15142
G1 X150.91 Y88.197 E.52089
G2 X141.49 Y88.197 I-4.71 J.003 E.45448
G1 X141.49 Y105.149 E.52089
G3 X139.51 Y100.397 I4.767 J-4.775 E.16229
G1 X139.51 Y88.201 E.37474
G3 X146.488 Y81.516 I6.7 J.01 E.33164
G3 X152.901 Y88.167 I-.298 J6.704 E.31311
G3 X153.606 Y88.009 I.805 J1.935 E.02232
G1 X160.65 Y88.01 E.21646
G3 X161.889 Y89.249 I-.067 J1.306 E.05896
G1 X161.89 Y97.295 E.24724
G3 X160.594 Y98.589 I-1.293 J.001 E.06255
G1 X153.604 Y98.589 E.21478
G3 X152.946 Y98.461 I.12 J-2.365 E.02066
; WIPE_START
M204 S6000
G1 X152.89 Y100.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.076 Y102.012 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.527414
G1 F7430.433
M204 S6000
G1 X151.755 Y102.215 E.01501
; LINE_WIDTH: 0.52407
G1 F7482.085
G1 X151.737 Y102.321 E.00419
; LINE_WIDTH: 0.488717
G1 F8075.435
G1 X151.72 Y102.426 E.00388
; LINE_WIDTH: 0.449332
G1 F8858.018
G1 X151.637 Y102.867 E.01486
; LINE_WIDTH: 0.405951
G1 F9916.523
G1 X151.554 Y103.308 E.01328
; WIPE_START
G1 X151.637 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.204 Y98.978 Z2 F42000
G1 X160.491 Y97.623 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40834
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X160.715 Y97.326 E.01981
G1 X160.721 Y96.556 E.04109
G1 X160.07 Y97.42 E.05774
G1 X159.496 Y97.42 E.03062
G1 X160.721 Y95.795 E.10861
G1 X160.721 Y95.033 E.04063
G1 X158.922 Y97.42 E.15948
G1 X158.348 Y97.42 E.03062
G1 X160.721 Y94.272 E.21035
G1 X160.721 Y93.51 E.04063
G1 X157.774 Y97.42 E.26123
G1 X157.2 Y97.42 E.03062
G1 X160.72 Y92.749 E.3121
G1 X160.72 Y91.987 E.04063
G1 X156.626 Y97.42 E.36297
G1 X156.053 Y97.42 E.03062
G1 X160.72 Y91.226 E.41385
G1 X160.72 Y90.464 E.04063
G1 X155.479 Y97.42 E.46472
G1 X154.905 Y97.42 E.03062
G1 X160.72 Y89.703 E.51559
G1 X160.72 Y89.322 E.02032
G2 X160.541 Y89.179 I-.149 J.003 E.01396
G1 X154.331 Y97.42 E.55059
G1 X153.757 Y97.42 E.03062
G1 X159.967 Y89.179 E.5506
G1 X159.393 Y89.179 E.03062
G1 X153.253 Y97.328 E.54443
G1 X152.777 Y97.197 E.02631
G1 X158.819 Y89.179 E.53572
G1 X158.246 Y89.179 E.03062
G1 X152.302 Y97.067 E.527
G1 X152.079 Y97.005 E.01233
G1 X152.079 Y96.601 E.0216
G1 X157.672 Y89.179 E.49587
G1 X157.098 Y89.178 E.03062
G1 X152.079 Y95.839 E.445
G1 X152.079 Y95.077 E.04064
G1 X156.524 Y89.178 E.39412
G1 X155.95 Y89.178 E.03062
G1 X152.079 Y94.316 E.34324
G1 X152.079 Y93.554 E.04064
G1 X155.376 Y89.178 E.29237
G1 X154.803 Y89.178 E.03062
G1 X152.079 Y92.793 E.24149
G1 X152.079 Y92.031 E.04064
G1 X154.229 Y89.178 E.19061
G1 X153.655 Y89.178 E.03062
G1 X152.079 Y91.269 E.13974
G1 X152.079 Y90.508 E.04064
G1 X153.135 Y89.107 E.0936
M106 S155.55
; WIPE_START
G1 X152.079 Y90.508 E-.6666
G1 X152.079 Y90.754 E-.0934
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.939 Y89.226 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104307
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X151.948 Y89.516 E.00145
; WIPE_START
G1 X151.939 Y89.226 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.807 Y94.876 Z2 F42000
G1 X140.324 Y102.012 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.526758
G1 F7440.517
M204 S6000
G1 X140.645 Y102.215 E.01498
G1 X140.663 Y102.321 E.00421
; LINE_WIDTH: 0.488707
G1 F8075.606
G1 X140.68 Y102.426 E.00388
; LINE_WIDTH: 0.44933
G1 F8858.048
G1 X140.763 Y102.867 E.01487
; LINE_WIDTH: 0.40591
G1 F9917.626
G1 X140.846 Y103.308 E.01328
; OBJECT_ID: 4
; WIPE_START
G1 X140.763 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X133.367 Y100.982 Z2 F42000
G1 X119.291 Y97.393 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.291 Y100.589 E.10603
G3 X119.127 Y101.957 I-5.87 J-.011 E.0458
G1 X118.909 Y101.933 E.00726
G1 X118.909 Y87.99 E.46252
G2 X108.291 Y87.99 I-5.309 J.012 E.55251
G1 X108.291 Y101.933 E.46252
G1 X108.073 Y101.957 E.00726
G3 X107.909 Y100.589 I6.249 J-1.444 E.04578
G1 X107.909 Y88.01 E.41728
G3 X107.918 Y87.702 I3.868 J-.041 E.01022
G3 X113.737 Y82.312 I5.682 J.298 E.29113
G3 X119.282 Y87.678 I-.138 J5.69 E.28126
G1 X119.337 Y89.194 E.05032
G1 X120.727 Y88.815 E.04778
G3 X120.819 Y88.809 I.087 J.612 E.00306
G1 X127.809 Y88.81 E.23188
G3 X128.29 Y89.281 I-.014 J.495 E.02453
G1 X128.291 Y97.28 E.26536
G3 X127.77 Y97.79 I-.495 J.016 E.02719
G1 X120.819 Y97.79 E.23058
G3 X120.694 Y97.778 I-.003 J-.601 E.00417
G1 X119.349 Y97.409 E.04629
M204 S10000
G1 X119.698 Y97.927 F42000
G1 F8843.478
M204 S6000
G1 X119.698 Y100.593 E.08846
G3 X118.677 Y103.976 I-6.115 J-.001 E.11889
G1 X118.502 Y103.924 E.00605
G1 X118.502 Y87.994 E.52843
G2 X108.698 Y87.994 I-4.902 J.008 E.51034
G1 X108.698 Y103.924 E.52843
G1 X108.523 Y103.976 E.00605
G1 X108.465 Y103.887 E.00351
G3 X107.502 Y100.593 I5.216 J-3.313 E.11534
G1 X107.502 Y88.006 E.41756
G3 X113.75 Y81.905 I6.099 J-.004 E.32284
G3 X119.688 Y87.655 I-.158 J6.104 E.3012
G1 X119.725 Y88.665 E.03353
G1 X120.602 Y88.424 E.03017
G3 X120.811 Y88.402 I.215 J1.015 E.00698
G1 X127.829 Y88.403 E.23279
G3 X128.697 Y89.265 I-.039 J.907 E.04451
G1 X128.698 Y97.288 E.26615
G3 X127.782 Y98.198 I-.901 J.009 E.04773
G1 X120.811 Y98.198 E.23124
G3 X120.603 Y98.175 I.006 J-1.034 E.00698
G1 X119.756 Y97.943 E.02913
M204 S250
G1 X120.09 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X120.085 Y100.857 I-60.741 J1.078 E.07426
G3 X118.11 Y105.265 I-6.496 J-.264 E.15206
G1 X118.11 Y87.997 E.53059
G2 X109.09 Y87.997 I-4.51 J.004 E.43511
G1 X109.09 Y105.265 E.53059
G3 X107.11 Y100.597 I4.565 J-4.69 E.15999
G1 X107.11 Y88.002 E.38703
G3 X113.762 Y81.513 I6.491 J0 E.31823
G3 X120.099 Y88.156 I-.17 J6.507 E.31312
G3 X120.804 Y88.01 I.823 J2.193 E.02222
G1 X127.848 Y88.011 E.21645
G3 X129.089 Y89.249 I-.063 J1.304 E.05905
G1 X129.09 Y97.295 E.24724
G3 X127.794 Y98.59 I-1.293 J.001 E.06255
G1 X120.804 Y98.59 E.21477
G3 X120.146 Y98.461 I.12 J-2.365 E.02066
; WIPE_START
M204 S6000
G1 X120.095 Y100.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.275 Y102.19 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.515357
G1 F7620.063
M204 S6000
G1 X118.954 Y102.392 E.01461
; LINE_WIDTH: 0.522219
G1 F7510.973
G1 X118.937 Y102.49 E.00386
; LINE_WIDTH: 0.488967
G1 F8070.912
G1 X118.92 Y102.587 E.0036
; LINE_WIDTH: 0.45073
G1 F8827.649
G1 X118.837 Y103.022 E.01472
; LINE_WIDTH: 0.40751
G1 F9874.109
G1 X118.754 Y103.457 E.01316
; WIPE_START
G1 X118.837 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.211 Y103.341 Z2 F42000
G1 X108.446 Y103.457 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.407479
G1 F9874.949
M204 S6000
G1 X108.363 Y103.022 E.01316
; LINE_WIDTH: 0.45084
G1 F8825.268
G1 X108.28 Y102.587 E.01473
; LINE_WIDTH: 0.489106
G1 F8068.382
G1 X108.263 Y102.489 E.00359
; LINE_WIDTH: 0.516772
G1 F7597.321
M73 P64 R9
G1 X108.246 Y102.392 E.00381
G1 X107.925 Y102.19 E.01465
; WIPE_START
G1 X108.246 Y102.392 E-.60318
G1 X108.263 Y102.489 E-.15682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.337 Y96.787 Z2 F42000
G1 X120.134 Y89.148 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41404
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X119.279 Y90.278 E.07771
G1 X119.279 Y91.047 E.04219
G1 X120.668 Y89.212 E.12625
G1 X120.837 Y89.178 E.00948
G1 X121.275 Y89.179 E.024
G1 X119.279 Y91.816 E.18145
G1 X119.279 Y92.585 E.04219
G1 X121.857 Y89.179 E.23435
G1 X122.438 Y89.179 E.03192
G1 X119.279 Y93.354 E.28724
G1 X119.279 Y94.123 E.04219
G1 X123.02 Y89.179 E.34014
G1 X123.602 Y89.179 E.03192
G1 X119.279 Y94.892 E.39304
G1 X119.279 Y95.661 E.04219
G1 X124.184 Y89.179 E.44593
G1 X124.766 Y89.179 E.03192
G1 X119.279 Y96.43 E.49883
G1 X119.279 Y97.006 E.03158
G1 X119.4 Y97.039 E.00689
G1 X125.348 Y89.179 E.54072
G1 X125.93 Y89.179 E.03192
G1 X119.882 Y97.172 E.54981
G1 X120.364 Y97.304 E.02741
G1 X126.511 Y89.179 E.5589
G1 X127.093 Y89.179 E.03192
G1 X120.857 Y97.421 E.56694
G1 X121.439 Y97.421 E.03192
G1 X127.675 Y89.18 E.56693
G1 X127.767 Y89.18 E.00505
G3 X127.92 Y89.321 I-.003 J.156 E.01248
G1 X127.92 Y89.625 E.01669
G1 X122.021 Y97.421 E.5363
G1 X122.603 Y97.421 E.03192
G1 X127.92 Y90.394 E.48341
G1 X127.92 Y91.163 E.04218
G1 X123.185 Y97.421 E.43051
G1 X123.767 Y97.421 E.03192
G1 X127.92 Y91.931 E.37762
G1 X127.92 Y92.7 E.04218
G1 X124.349 Y97.421 E.32473
G1 X124.931 Y97.421 E.03192
G1 X127.921 Y93.469 E.27183
G1 X127.921 Y94.238 E.04218
G1 X125.512 Y97.421 E.21894
G1 X126.094 Y97.421 E.03192
G1 X127.921 Y95.007 E.16605
G1 X127.921 Y95.776 E.04218
G1 X126.676 Y97.421 E.11315
G1 X127.258 Y97.421 E.03192
G1 X127.921 Y96.545 E.06026
G1 X127.915 Y97.322 E.04262
G1 X127.687 Y97.623 E.02075
M106 S155.55
; OBJECT_ID: 2
; WIPE_START
G1 X127.915 Y97.322 E-.14372
G1 X127.921 Y96.545 E-.29522
G1 X127.411 Y97.219 E-.32106
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X123.426 Y90.709 Z2 F42000
G1 X107.884 Y65.319 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X107.863 Y65.273 E.00166
G3 X107.291 Y62.41 I6.94 J-2.876 E.0975
G1 X107.291 Y39.39 E.76359
G3 X114.79 Y31.891 I7.512 J.013 E.39059
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.013 J7.512 E.39059
G1 X175.809 Y62.41 E.76359
G3 X168.31 Y69.909 I-7.512 J-.013 E.3906
G1 X114.79 Y69.909 E1.77533
G3 X108.25 Y66.069 I.013 J-7.512 E.26374
G1 X107.91 Y65.373 E.02569
M204 S10000
G1 X108.25 Y65.141 F42000
G1 F8843.478
M204 S6000
G1 X108.239 Y65.118 E.00086
G3 X107.698 Y62.406 I6.564 J-2.721 E.09232
G1 X107.698 Y39.394 E.76333
G3 X114.794 Y32.298 I7.105 J.009 E.36964
G1 X168.306 Y32.298 E1.77507
G3 X175.402 Y39.394 I-.009 J7.105 E.36964
G1 X175.402 Y62.406 E.76333
G3 X168.306 Y69.502 I-7.105 J-.009 E.36964
G1 X114.794 Y69.502 E1.77508
G3 X108.605 Y65.87 I.009 J-7.105 E.24956
G1 X108.276 Y65.195 E.02489
M204 S250
G1 X108.602 Y64.971 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X108.604 Y64.966 E.00015
G3 X108.09 Y62.402 I6.208 J-2.579 E.08088
G1 X108.09 Y39.398 E.70685
G3 X114.798 Y32.69 I6.713 J.005 E.3237
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.015 J6.722 E.32357
G1 X175.01 Y62.402 E.70685
G3 X168.302 Y69.11 I-6.713 J-.005 E.3237
G1 X114.798 Y69.11 E1.64403
G3 X108.95 Y65.677 I.015 J-6.722 E.21842
G1 X108.629 Y65.024 E.02234
; WIPE_START
M204 S6000
G1 X108.604 Y64.966 E-.02389
G1 X108.418 Y64.473 E-.20023
G1 X108.219 Y63.709 E-.30014
G1 X108.136 Y63.189 E-.20032
G1 X108.131 Y63.095 E-.03544
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.2 Y58.466 Z2 F42000
G1 X149.541 Y31.509 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I.006 J7.895 E.41177
G1 X176.191 Y62.39 E.76229
G3 X168.29 Y70.291 I-7.895 J.006 E.41177
G1 X114.81 Y70.291 E1.77403
G3 X106.909 Y62.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E.76229
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.53 E.16517
G3 X134.07 Y26.009 I.495 J-.026 E.02719
G1 X149.039 Y26.01 E.49657
G3 X149.541 Y26.53 I.008 J.494 E.02688
G1 X149.541 Y31.449 E.16319
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I.002 J8.302 E.4327
G1 X176.598 Y62.394 E.76256
G3 X168.294 Y70.698 I-8.302 J.002 E.43271
G1 X114.806 Y70.698 E1.7743
G3 X106.502 Y62.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E.76256
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.518 E.15207
G3 X134.062 Y25.602 I.901 J-.015 E.04773
G1 X149.053 Y25.602 E.49727
G3 X149.948 Y26.518 I-.005 J.9 E.04725
G1 X149.948 Y31.042 E.15008
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.99 Y39.402 I-.002 J8.694 E.41951
G1 X176.99 Y62.398 E.7066
G3 X168.298 Y71.09 I-8.694 J-.002 E.41951
G1 X114.802 Y71.09 E1.64378
G3 X106.11 Y62.398 I.014 J-8.706 E.41935
G1 X106.11 Y39.402 E.7066
G3 X114.802 Y30.71 I8.694 J.002 E.4195
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.506 E.12917
G3 X134.054 Y25.21 I1.293 J-.003 E.06255
G1 X149.065 Y25.21 E.46125
G3 X150.34 Y26.506 I-.018 J1.292 E.06195
G1 X150.34 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.273 Y31.724 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41274
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X149.171 Y31.09 E.10904
G1 X149.17 Y30.602 E.02659
G1 X146.419 Y31.521 E.1581
G1 X144.959 Y31.521 E.07959
M73 P64 R8
G1 X149.17 Y30.114 E.24199
G1 X149.169 Y29.627 E.02659
G1 X143.499 Y31.521 E.32588
G1 X142.039 Y31.521 E.07959
G1 X149.168 Y29.139 E.40977
G1 X149.168 Y28.651 E.02659
G1 X140.579 Y31.521 E.49365
G1 X139.119 Y31.521 E.07959
G1 X149.167 Y28.163 E.57754
G1 X149.167 Y27.676 E.02659
G1 X137.659 Y31.521 E.66143
G1 X136.199 Y31.521 E.07959
G1 X149.166 Y27.188 E.74532
G1 X149.166 Y26.7 E.02659
G1 X134.739 Y31.521 E.82921
G1 X133.929 Y31.521 E.04415
G1 X133.929 Y31.304 E.01185
G1 X148.665 Y26.38 E.84699
G1 X147.202 Y26.381 E.07976
G1 X133.93 Y30.816 E.76287
G1 X133.93 Y30.328 E.02661
G1 X145.739 Y26.382 E.67874
G1 X144.276 Y26.383 E.07976
G1 X133.931 Y29.84 E.59461
G1 X133.931 Y29.352 E.02661
G1 X142.813 Y26.384 E.51049
G1 X141.35 Y26.385 E.07976
G1 X133.932 Y28.864 E.42636
G1 X133.932 Y28.375 E.02661
G1 X139.886 Y26.386 E.34223
G1 X138.423 Y26.387 E.07976
G1 X133.933 Y27.887 E.25811
G1 X133.933 Y27.399 E.02661
G1 X136.96 Y26.388 E.17398
G1 X135.497 Y26.389 E.07976
G1 X133.934 Y26.911 E.08985
G1 X133.934 Y26.493 E.02283
G3 X133.992 Y26.404 I.112 J.01 E.00603
G1 X134.641 Y26.187 E.03729
M106 S155.55
; OBJECT_ID: 8
; WIPE_START
G1 X133.992 Y26.404 E-.25992
G1 X133.946 Y26.451 E-.02513
G1 X133.934 Y26.493 E-.01655
G1 X133.934 Y26.911 E-.15912
G1 X134.681 Y26.662 E-.29928
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X130.096 Y32.764 Z2 F42000
G1 X38.791 Y154.292 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G3 X38.786 Y157.051 I-69.882 J1.248 E.09153
M73 P65 R8
G3 X38.627 Y158.232 I-7.318 J-.383 E.03957
G1 X38.409 Y158.209 E.00727
G1 X38.409 Y145.59 E.4186
G2 X26.391 Y145.59 I-6.009 J.011 E.62552
G1 X26.391 Y158.209 E.4186
G1 X26.173 Y158.232 E.00727
G3 X26.009 Y156.789 I7.014 J-1.528 E.04826
G1 X26.009 Y145.61 E.37084
G3 X32.393 Y139.21 I6.392 J-.008 E.33306
G3 X38.721 Y144.657 I.006 J6.392 E.3018
G1 X38.912 Y146.141 E.04966
G1 X40.204 Y145.719 E.04511
G3 X40.33 Y145.708 I.115 J.63 E.00419
G1 X47.27 Y145.708 E.23022
G3 X47.791 Y146.219 I.026 J.495 E.02719
G1 X47.79 Y154.208 E.26502
G3 X47.28 Y154.69 I-.496 J-.014 E.02583
G1 X40.319 Y154.69 E.23092
G3 X40.194 Y154.678 I-.003 J-.602 E.00416
G1 X38.849 Y154.308 E.04629
M204 S10000
G1 X39.198 Y154.826 F42000
G1 F8843.478
M204 S6000
G3 X39.193 Y157.067 I-56.787 J.984 E.07435
G3 X38.182 Y160.374 I-6.954 J-.317 E.11592
G1 X38.002 Y160.325 E.00619
G1 X38.002 Y145.593 E.48868
G2 X26.798 Y145.593 I-5.602 J.007 E.58335
G1 X26.798 Y160.325 E.48868
G1 X26.618 Y160.374 E.00619
G3 X25.602 Y156.793 I5.922 J-3.615 E.12501
G1 X25.602 Y145.605 E.37112
G3 X32.395 Y138.803 I6.799 J-.004 E.3542
G3 X39.123 Y144.597 I.003 J6.799 E.32094
G1 X39.253 Y145.6 E.03357
G1 X40.057 Y145.335 E.02808
G3 X40.318 Y145.301 I.258 J.961 E.00876
G1 X47.282 Y145.301 E.23102
G3 X48.198 Y146.211 I.015 J.901 E.04773
G1 X48.197 Y154.228 E.26595
G3 X47.288 Y155.097 I-.903 J-.035 E.04612
G1 X40.311 Y155.097 E.23143
G3 X40.102 Y155.075 I.006 J-1.036 E.00698
G1 X39.256 Y154.842 E.02913
M204 S250
G1 X39.59 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X39.568 Y157.366 I-25.706 J.728 E.06227
G3 X37.61 Y161.753 I-7.248 J-.605 E.15041
G1 X37.61 Y145.597 E.49641
G2 X27.19 Y145.597 I-5.21 J.003 E.50274
G1 X27.19 Y161.753 E.49641
G3 X25.21 Y156.797 I5.276 J-4.981 E.16791
G1 X25.21 Y145.601 E.34401
G3 X32.398 Y138.411 I7.191 J0 E.34697
G3 X39.581 Y145.079 I-.016 J7.221 E.33104
G3 X40.306 Y144.909 I.827 J1.892 E.02302
G1 X47.294 Y144.909 E.21471
G3 X48.59 Y146.203 I.003 J1.293 E.06255
G1 X48.589 Y154.248 E.24718
G3 X47.296 Y155.489 I-1.295 J-.055 E.06082
G1 X40.304 Y155.489 E.21484
G3 X39.646 Y155.361 I.12 J-2.365 E.02066
; WIPE_START
M204 S6000
G1 X39.59 Y156.797 E-.54619
G1 X39.568 Y157.359 E-.21381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.495 Y158.423 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532243
G1 F7357.11
M204 S6000
G1 X38.443 Y158.774 E.01414
; LINE_WIDTH: 0.495799
G1 F7949.151
G1 X38.421 Y158.9 E.00472
; LINE_WIDTH: 0.45308
G1 F8777.072
G1 X38.4 Y159.026 E.00428
; LINE_WIDTH: 0.407734
G1 F9868.041
G1 X38.322 Y159.436 E.01243
; LINE_WIDTH: 0.359752
G1 F11362.512
G1 X38.244 Y159.847 E.01079
; WIPE_START
G1 X38.322 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X44.995 Y155.731 Z2 F42000
G1 X47.17 Y154.523 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4091
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X47.399 Y154.252 E.019
G1 X47.42 Y154.165 E.00481
G1 X47.42 Y153.516 E.03474
G1 X46.74 Y154.32 E.05642
G1 X46.139 Y154.32 E.0322
G1 X47.42 Y152.805 E.1063
G1 X47.42 Y152.094 E.03809
G1 X45.537 Y154.32 E.15617
G1 X44.936 Y154.32 E.0322
G1 X47.42 Y151.382 E.20605
G1 X47.42 Y150.671 E.03809
G1 X44.335 Y154.32 E.25593
G1 X43.734 Y154.32 E.0322
G1 X47.421 Y149.96 E.30581
G1 X47.421 Y149.249 E.03809
G1 X43.133 Y154.32 E.35568
G1 X42.531 Y154.32 E.0322
G1 X47.421 Y148.538 E.40556
G1 X47.421 Y147.827 E.03809
G1 X41.93 Y154.32 E.45544
G1 X41.329 Y154.32 E.0322
G1 X47.421 Y147.115 E.50532
G1 X47.421 Y146.404 E.03809
G1 X40.728 Y154.32 E.55519
G3 X40.262 Y154.313 I-.195 J-2.351 E.02498
G1 X40.157 Y154.284 E.00582
G1 X47.096 Y146.078 E.57552
G1 X46.494 Y146.078 E.0322
G1 X39.669 Y154.15 E.56613
G1 X39.181 Y154.016 E.0271
G1 X45.893 Y146.078 E.55673
G1 X45.292 Y146.078 E.0322
G1 X38.777 Y153.783 E.54038
G1 X38.777 Y153.072 E.03806
G1 X44.691 Y146.078 E.49053
G1 X44.09 Y146.078 E.0322
G1 X38.777 Y152.362 E.44068
G1 X38.777 Y151.651 E.03806
G1 X43.488 Y146.078 E.39083
G1 X42.887 Y146.078 E.0322
G1 X38.776 Y150.94 E.34099
G1 X38.776 Y150.229 E.03806
G1 X42.286 Y146.078 E.29114
G1 X41.685 Y146.078 E.0322
G1 X38.776 Y149.519 E.24129
G1 X38.776 Y148.808 E.03806
G1 X41.083 Y146.078 E.19144
G1 X40.482 Y146.078 E.0322
G1 X38.775 Y148.097 E.14159
G1 X38.775 Y147.386 E.03807
G1 X39.975 Y145.967 E.09953
M106 S155.55
; WIPE_START
G1 X38.775 Y147.386 E-.70621
G1 X38.775 Y147.528 E-.05379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.638 Y145.805 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.114133
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X38.658 Y146.119 E.00182
; LINE_WIDTH: 0.148578
G1 X38.678 Y146.433 E.00271
; WIPE_START
G1 X38.658 Y146.119 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.25 Y151.505 Z2 F42000
G1 X26.305 Y158.423 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.532221
G1 F7357.445
M204 S6000
G1 X26.357 Y158.774 E.01415
; LINE_WIDTH: 0.495843
G1 F7948.376
G1 X26.379 Y158.899 E.0047
; LINE_WIDTH: 0.453288
G1 F8772.611
G1 X26.4 Y159.025 E.00426
; LINE_WIDTH: 0.407962
G1 F9861.892
G1 X26.478 Y159.436 E.01245
; LINE_WIDTH: 0.359845
G1 F11359.17
G1 X26.556 Y159.847 E.01081
; OBJECT_ID: 9
; WIPE_START
G1 X26.478 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X34.064 Y158.601 Z2 F42000
G1 X73.191 Y154.293 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X73.186 Y156.758 I-63.837 J1.099 E.08179
G3 X73.027 Y157.964 I-7.668 J-.393 E.04038
G1 X72.809 Y157.941 E.00728
G1 X72.809 Y145.89 E.39974
G2 X60.191 Y145.89 I-6.309 J.011 E.65678
G1 X60.191 Y157.941 E.39974
G1 X59.973 Y157.964 E.00728
G3 X59.809 Y156.49 I6.678 J-1.486 E.0493
G1 X59.809 Y145.91 E.35096
G3 X66.642 Y139.212 I6.692 J-.008 E.35361
G3 X73.082 Y144.697 I-.155 J6.704 E.30363
G1 X73.322 Y146.177 E.04976
G1 X74.544 Y145.735 E.04311
G3 X74.719 Y145.709 I.187 J.642 E.00588
G1 X81.719 Y145.71 E.2322
G3 X82.19 Y146.191 I-.029 J.499 E.02448
G1 X82.191 Y154.17 E.26469
G3 X81.67 Y154.691 I-.495 J.025 E.02752
G1 X74.719 Y154.691 E.23059
G3 X74.594 Y154.678 I-.003 J-.602 E.00416
G1 X73.249 Y154.309 E.04629
M204 S10000
G1 X73.598 Y154.827 F42000
G1 F8843.478
M204 S6000
G3 X73.593 Y156.774 I-50.419 J.834 E.0646
G3 X72.583 Y160.157 I-7.129 J-.285 E.11833
G1 X72.402 Y160.108 E.00622
G1 X72.402 Y145.894 E.47151
G2 X60.598 Y145.894 I-5.902 J.007 E.61462
G1 X60.598 Y160.108 E.47152
G1 X60.417 Y160.157 E.00622
G3 X59.402 Y156.494 I6.201 J-3.69 E.12759
G1 X59.402 Y145.906 E.35122
G3 X66.653 Y138.805 I7.099 J-.003 E.37506
G3 X73.482 Y144.624 I-.167 J7.112 E.32201
G1 X73.645 Y145.628 E.03375
G1 X74.425 Y145.346 E.0275
G3 X74.711 Y145.302 I.309 J1.06 E.00965
G1 X81.735 Y145.303 E.23299
G3 X82.597 Y146.17 I-.05 J.911 E.04444
G1 X82.598 Y154.182 E.26576
G3 X81.682 Y155.098 I-.901 J.015 E.04793
G1 X74.711 Y155.098 E.23124
G3 X74.502 Y155.075 I.006 J-1.037 E.00698
G1 X73.656 Y154.843 E.02913
M204 S250
G1 X73.99 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X73.901 Y157.653 I-14.994 J.578 E.07117
G1 X73.868 Y157.84 E.00582
G3 X72.01 Y161.572 I-7.374 J-1.342 E.12981
G1 X72.01 Y145.898 E.48162
G2 X60.99 Y145.898 I-5.51 J.003 E.5317
G1 X60.99 Y161.572 E.48162
G3 X59.01 Y156.497 I5.522 J-5.078 E.17128
G1 X59.01 Y145.902 E.32557
G3 X62.709 Y139.441 I7.516 J.014 E.23932
G3 X66.664 Y138.413 I3.792 J6.462 E.12717
G3 X73.956 Y145.098 I-.173 J7.509 E.33184
G3 X74.704 Y144.91 I.913 J2.046 E.02381
G1 X81.75 Y144.911 E.21652
G3 X82.989 Y146.151 I-.071 J1.309 E.05899
G1 X82.99 Y154.194 E.24712
G3 X81.694 Y155.49 I-1.293 J.003 E.06261
G1 X74.704 Y155.49 E.21478
G3 X74.046 Y155.361 I.12 J-2.363 E.02066
; WIPE_START
M204 S6000
G1 X73.984 Y156.789 E-.5431
G1 X73.929 Y157.357 E-.2169
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.896 Y158.155 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533251
G1 F7341.981
M204 S6000
G1 X72.842 Y158.526 E.01498
; LINE_WIDTH: 0.494396
G1 F7973.861
G1 X72.821 Y158.655 E.00482
; LINE_WIDTH: 0.451585
G1 F8809.17
G1 X72.799 Y158.784 E.00436
; LINE_WIDTH: 0.406062
G1 F9913.48
G1 X72.722 Y159.202 E.01258
; LINE_WIDTH: 0.357861
G1 F11430.725
G1 X72.644 Y159.62 E.01091
M204 S10000
G1 X72.457 Y160.326 F42000
; LINE_WIDTH: 0.108593
G1 F15000
M204 S6000
G1 X72.224 Y160.99 E.00376
; WIPE_START
G1 X72.457 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.837 Y160.759 Z2 F42000
G1 X60.776 Y160.99 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.108642
G1 F15000
M204 S6000
G1 X60.542 Y160.326 E.00377
M204 S10000
G1 X60.356 Y159.62 F42000
; LINE_WIDTH: 0.357785
G1 F11433.481
M204 S6000
G1 X60.278 Y159.202 E.01091
; LINE_WIDTH: 0.406089
G1 F9912.76
G1 X60.201 Y158.784 E.01258
; LINE_WIDTH: 0.451619
G1 F8808.438
G1 X60.179 Y158.655 E.00436
; LINE_WIDTH: 0.494407
G1 F7973.663
G1 X60.158 Y158.526 E.00481
; LINE_WIDTH: 0.53326
G1 F7341.848
G1 X60.104 Y158.155 E.01498
; WIPE_START
G1 X60.158 Y158.526 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.597 Y153.171 Z2 F42000
G1 X73.037 Y145.847 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.118721
G1 F15000
M204 S6000
G1 X73.063 Y146.163 E.00196
; LINE_WIDTH: 0.161341
G1 X73.088 Y146.478 E.00305
M204 S10000
G1 X72.974 Y151.529 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40069
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X73.64 Y154.033 E.1331
G1 X74.143 Y154.171 E.02681
G1 X73.176 Y150.536 E.19324
G1 X73.175 Y148.781 E.09016
G1 X74.646 Y154.309 E.29389
G2 X75.116 Y154.321 I.276 J-1.655 E.02421
G1 X73.175 Y147.026 E.38782
G1 X73.175 Y146.842 E.00945
G1 X73.58 Y146.809 E.02089
G1 X73.577 Y146.787 E.00115
G1 X75.582 Y154.321 E.40054
G1 X76.049 Y154.321 E.02396
G1 X73.928 Y146.352 E.42369
G1 X74.353 Y146.198 E.02324
G1 X76.515 Y154.321 E.43187
G1 X76.982 Y154.321 E.02396
G1 X74.788 Y146.079 E.4382
G1 X75.254 Y146.079 E.02396
G1 X77.448 Y154.321 E.4382
G1 X77.914 Y154.321 E.02396
G1 X75.721 Y146.079 E.43819
G1 X76.187 Y146.079 E.02396
G1 X78.381 Y154.321 E.43819
G1 X78.847 Y154.321 E.02396
G1 X76.654 Y146.079 E.43819
G1 X77.12 Y146.079 E.02396
G1 X79.313 Y154.321 E.43818
G1 X79.78 Y154.321 E.02396
G1 X77.586 Y146.079 E.43818
G1 X78.053 Y146.079 E.02396
G1 X80.246 Y154.321 E.43817
G1 X80.713 Y154.321 E.02396
G1 X78.519 Y146.079 E.43817
G1 X78.986 Y146.079 E.02396
G1 X81.179 Y154.321 E.43816
G1 X81.642 Y154.321 E.02378
G1 X79.452 Y146.079 E.43811
G1 X79.918 Y146.079 E.02396
G1 X81.821 Y153.229 E.38009
G1 X81.821 Y151.475 E.09008
G1 X80.385 Y146.08 E.28687
G1 X80.851 Y146.08 E.02396
G1 X81.82 Y149.722 E.19365
G1 X81.82 Y147.969 E.09008
G1 X81.264 Y145.877 E.1112
M106 S155.55
; OBJECT_ID: 3
; WIPE_START
G1 X81.778 Y147.81 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X74.901 Y144.498 Z2 F42000
G1 X26.743 Y121.308 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X26.609 Y120.822 E.0167
G3 X26.391 Y119.01 I7.605 J-1.837 E.06071
G1 X26.391 Y95.99 E.76359
G3 X34.19 Y88.191 I7.823 J.024 E.40607
G1 X87.71 Y88.191 E1.77533
G3 X95.509 Y95.99 I-.013 J7.812 E.40622
G1 X95.509 Y119.01 E.76359
M73 P66 R8
G3 X87.71 Y126.809 I-7.823 J-.024 E.40607
G1 X34.19 Y126.809 E1.77533
G3 X26.776 Y121.412 I.024 J-7.823 E.32503
G1 X26.761 Y121.365 E.00163
M204 S10000
G1 X27.135 Y121.19 F42000
G1 F8843.478
M204 S6000
G1 X26.943 Y120.444 E.02555
G3 X26.798 Y119.006 I7.271 J-1.457 E.04802
G1 X26.798 Y95.994 E.76333
G3 X30.176 Y89.789 I7.438 J.027 E.24423
G3 X34.194 Y88.598 I4.044 J6.272 E.14091
G1 X87.706 Y88.598 E1.77508
G3 X95.102 Y95.994 I-.009 J7.405 E.38527
G1 X95.102 Y119.006 E.76333
G3 X87.706 Y126.402 I-7.416 J-.019 E.38512
G1 X34.194 Y126.402 E1.77508
G3 X27.163 Y121.286 I.019 J-7.416 E.3082
G1 X27.152 Y121.247 E.00135
M204 S250
G1 X27.513 Y121.091 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X27.327 Y120.367 E.02296
G3 X27.19 Y119.002 I6.886 J-1.38 E.04223
G1 X27.19 Y95.998 E.70685
G3 X34.198 Y88.99 I7.023 J.015 E.33805
G1 X87.702 Y88.99 E1.64403
G3 X94.71 Y95.998 I-.005 J7.013 E.33818
G1 X94.71 Y119.002 E.70685
G3 X87.702 Y126.01 I-7.023 J-.015 E.33805
G1 X34.198 Y126.01 E1.64403
G3 X27.536 Y121.165 I.015 J-7.023 E.27046
G1 X27.531 Y121.148 E.00054
; WIPE_START
M204 S6000
G1 X27.327 Y120.367 E-.30674
G1 X27.239 Y119.824 E-.20923
G1 X27.201 Y119.183 E-.24403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.302 Y114.597 Z2 F42000
G1 X68.941 Y87.809 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y87.809 E.62195
G3 X95.891 Y96.01 I-.006 J8.207 E.42723
G1 X95.891 Y118.99 E.76229
G3 X87.69 Y127.191 I-8.195 J.006 E.4274
G1 X34.21 Y127.191 E1.77403
G3 X26.009 Y118.99 I-.006 J-8.195 E.4274
G1 X26.009 Y96.01 E.76229
G3 X34.21 Y87.809 I8.195 J-.006 E.4274
G1 X52.959 Y87.809 E.62194
G1 X52.959 Y82.83 E.16517
G3 X53.477 Y82.309 I.498 J-.023 E.02739
G1 X68.439 Y82.31 E.49633
G3 X68.941 Y82.82 I.006 J.496 E.02651
G1 X68.941 Y87.749 E.16351
M204 S10000
G1 X69.348 Y87.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y87.402 E.60858
G3 X96.298 Y96.006 I-.01 J8.614 E.44816
G1 X96.298 Y118.994 E.76256
G3 X87.694 Y127.598 I-8.602 J.002 E.44833
G1 X34.206 Y127.598 E1.7743
G3 X25.602 Y118.994 I-.002 J-8.602 E.44834
G1 X25.602 Y96.006 E.76256
G3 X34.206 Y87.402 I8.602 J-.002 E.44834
G1 X52.552 Y87.402 E.60858
G1 X52.552 Y82.818 E.15207
G3 X53.466 Y81.902 I.906 J-.01 E.0478
G1 X68.453 Y81.902 E.49712
G3 X69.348 Y82.812 I-.01 J.905 E.04699
G1 X69.348 Y87.342 E.15027
M204 S250
G1 X69.74 Y87.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y87.01 E.5518
G3 X96.69 Y96.002 I-.015 J9.007 E.43382
G1 X96.69 Y118.998 E.7066
G3 X88.985 Y127.896 I-8.992 J-.001 E.39428
G3 X87.698 Y127.99 I-1.533 J-12.13 E.03968
G1 X34.202 Y127.99 E1.64378
G3 X25.21 Y118.998 I.002 J-8.994 E.43398
G1 X25.21 Y96.002 E.7066
G3 X34.202 Y87.01 I8.994 J.002 E.43398
G1 X52.16 Y87.01 E.5518
G1 X52.16 Y82.806 E.12917
G3 X53.456 Y81.51 I1.3 J.004 E.0625
G1 X68.465 Y81.51 E.4612
G3 X69.74 Y82.804 I-.025 J1.299 E.06179
G1 X69.74 Y86.95 E.12739
; WIPE_START
M204 S6000
G1 X71.74 Y86.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X67.936 Y88.024 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41037
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X68.571 Y87.215 E.05541
G1 X68.571 Y86.47 E.04014
G1 X67.509 Y87.821 E.09257
G1 X66.924 Y87.821 E.03155
G1 X68.57 Y85.725 E.14362
G1 X68.57 Y84.98 E.04014
G1 X66.339 Y87.821 E.19466
G1 X65.753 Y87.821 E.03155
G1 X68.569 Y84.236 E.2457
G1 X68.569 Y83.491 E.04014
G1 X65.168 Y87.821 E.29674
G1 X64.582 Y87.821 E.03155
G1 X68.555 Y82.756 E.3469
G2 X68.408 Y82.679 I-.134 J.078 E.00942
G1 X68.035 Y82.68 E.02009
G1 X63.997 Y87.821 E.35232
G1 X63.412 Y87.821 E.03155
G1 X67.45 Y82.68 E.35229
G1 X66.864 Y82.68 E.03156
G1 X62.826 Y87.821 E.35226
G1 X62.241 Y87.821 E.03155
G1 X66.278 Y82.681 E.35223
G1 X65.692 Y82.681 E.03156
G1 X61.656 Y87.821 E.3522
G1 X61.07 Y87.821 E.03155
G1 X65.107 Y82.682 E.35217
G1 X64.521 Y82.682 E.03156
G1 X60.485 Y87.821 E.35215
G1 X59.899 Y87.821 E.03155
G1 X63.935 Y82.683 E.35212
G1 X63.35 Y82.683 E.03156
G1 X59.314 Y87.821 E.35209
G1 X58.729 Y87.821 E.03155
G1 X62.764 Y82.683 E.35206
G1 X62.178 Y82.684 E.03156
G1 X58.143 Y87.821 E.35203
G1 X57.558 Y87.821 E.03155
G1 X61.592 Y82.684 E.352
G1 X61.007 Y82.685 E.03156
G1 X56.972 Y87.821 E.35197
G1 X56.387 Y87.821 E.03155
G1 X60.421 Y82.685 E.35194
G1 X59.835 Y82.685 E.03156
G1 X55.802 Y87.821 E.35191
G1 X55.216 Y87.821 E.03155
G1 X59.25 Y82.686 E.35189
G1 X58.664 Y82.686 E.03156
G1 X54.631 Y87.821 E.35186
G1 X54.045 Y87.821 E.03155
G1 X58.078 Y82.687 E.35183
G1 X57.492 Y82.687 E.03156
G1 X53.46 Y87.821 E.3518
G1 X53.329 Y87.821 E.00707
G1 X53.329 Y87.242 E.0312
G1 X56.907 Y82.688 E.31209
G1 X56.321 Y82.688 E.03156
G1 X53.33 Y86.496 E.26093
G1 X53.331 Y85.75 E.04022
G1 X55.735 Y82.688 E.20976
G1 X55.149 Y82.689 E.03156
G1 X53.332 Y85.003 E.15859
G1 X53.332 Y84.257 E.04022
G1 X54.564 Y82.689 E.10742
G1 X53.978 Y82.69 E.03156
G1 X53.333 Y83.511 E.05626
G1 X53.334 Y82.793 E.03869
G1 X53.346 Y82.749 E.00243
G1 X53.551 Y82.487 E.01793
M106 S155.55
; OBJECT_ID: 1
; WIPE_START
G1 X53.346 Y82.749 E-.12646
G1 X53.334 Y82.793 E-.01712
G1 X53.333 Y83.511 E-.27285
G1 X53.892 Y82.8 E-.34358
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X58.71 Y76.88 Z2 F42000
G1 X92.998 Y34.755 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X93.273 Y35.142 E.01575
G3 X94.509 Y39.19 I-6.086 J4.071 E.14244
G1 X94.509 Y62.21 E.76359
G3 X87.21 Y69.509 I-7.322 J-.023 E.38003
G1 X33.69 Y69.509 E1.77533
G3 X26.391 Y62.21 I.013 J-7.312 E.38017
G1 X26.391 Y39.19 E.76359
G3 X33.69 Y31.891 I7.312 J.013 E.38017
G1 X87.21 Y31.891 E1.77533
G3 X92.936 Y34.678 I-.023 J7.322 E.21856
G1 X92.961 Y34.709 E.00129
M204 S10000
G1 X92.658 Y34.994 F42000
G1 F8843.478
M204 S6000
G1 X92.935 Y35.368 E.01545
G3 X94.102 Y39.194 I-5.748 J3.844 E.13461
G1 X94.102 Y62.206 E.76333
G3 X87.206 Y69.102 I-6.905 J-.009 E.35922
G1 X33.694 Y69.102 E1.77508
M73 P67 R8
G3 X26.798 Y62.206 I.009 J-6.905 E.35922
G1 X26.798 Y39.194 E.76333
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.206 Y32.298 E1.77508
G3 X92.445 Y34.721 I-.018 J6.915 E.19751
G1 X92.621 Y34.947 E.0095
M204 S250
G1 X92.346 Y35.23 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X92.609 Y35.586 E.0136
G3 X93.71 Y39.198 I-5.421 J3.626 E.11772
G1 X93.71 Y62.202 E.70685
G3 X87.202 Y68.71 I-6.522 J-.014 E.31393
G1 X33.698 Y68.71 E1.64403
G3 X27.19 Y62.202 I.005 J-6.513 E.31405
G1 X27.19 Y39.198 E.70685
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.202 Y32.69 E1.64403
G3 X92.146 Y34.975 I-.014 J6.522 E.17266
G1 X92.309 Y35.183 E.00809
; WIPE_START
M204 S6000
G1 X92.609 Y35.586 E-.19102
G1 X93 Y36.244 E-.29114
G1 X93.214 Y36.709 E-.19425
G1 X93.291 Y36.915 E-.08359
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.833 Y35.293 Z2 F42000
G1 X68.441 Y31.509 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I-.005 J7.706 E.40119
G1 X94.891 Y62.19 E.76229
G3 X87.19 Y69.891 I-7.706 J-.005 E.40119
G1 X33.71 Y69.891 E1.77403
G3 X26.009 Y62.19 I-.006 J-7.695 E.40134
G1 X26.009 Y39.21 E.76229
G3 X33.71 Y31.509 I7.706 J.005 E.40119
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.53 E.16517
G3 X52.97 Y26.009 I.497 J-.023 E.02715
G1 X67.939 Y26.01 E.49657
G3 X68.441 Y26.53 I.008 J.494 E.02688
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I-.01 J8.113 E.42212
G1 X95.298 Y62.194 E.76256
G3 X87.194 Y70.298 I-8.113 J-.01 E.42212
G1 X33.706 Y70.298 E1.77431
G3 X25.602 Y62.194 I-.002 J-8.102 E.42228
G1 X25.602 Y39.206 E.76256
G3 X33.706 Y31.102 I8.113 J.01 E.42212
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.518 E.15207
G3 X52.962 Y25.602 I.906 J-.01 E.04766
G1 X67.953 Y25.602 E.49727
G3 X68.848 Y26.518 I-.005 J.9 E.04725
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X95.69 Y39.202 I-.014 J8.506 E.4097
G1 X95.69 Y62.198 E.7066
G3 X87.198 Y70.69 I-8.506 J-.014 E.4097
G1 X33.702 Y70.69 E1.64378
G3 X25.21 Y62.198 I.002 J-8.494 E.40985
G1 X25.21 Y39.202 E.7066
G3 X33.702 Y30.71 I8.506 J.014 E.4097
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.506 E.12917
G3 X52.954 Y25.21 I1.3 J.004 E.06245
G1 X67.965 Y25.21 E.46125
G3 X69.24 Y26.506 I-.017 J1.292 E.06195
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.63 Y31.724 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41565
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X68.071 Y31.083 E.13948
G1 X68.07 Y30.602 E.02661
G1 X64.568 Y31.521 E.2002
G1 X62.733 Y31.521 E.10142
G1 X68.07 Y30.121 E.30502
G1 X68.069 Y29.639 E.02661
G1 X60.899 Y31.521 E.40984
G1 X59.064 Y31.521 E.10142
G1 X68.069 Y29.158 E.51466
G1 X68.068 Y28.677 E.02661
G1 X57.23 Y31.521 E.61948
G1 X55.395 Y31.521 E.10142
G1 X68.067 Y28.196 E.7243
G1 X68.067 Y27.714 E.02661
G1 X53.561 Y31.521 E.82912
G1 X52.829 Y31.521 E.04047
G1 X52.829 Y31.232 E.016
G1 X68.066 Y27.233 E.87091
G1 X68.066 Y26.752 E.02661
G1 X52.83 Y30.75 E.87085
G1 X52.83 Y30.269 E.02662
G1 X67.65 Y26.379 E.84708
G1 X65.816 Y26.379 E.1014
G1 X52.831 Y29.787 E.74222
G1 X52.831 Y29.306 E.02662
G1 X63.982 Y26.379 E.63735
G1 X62.148 Y26.379 E.1014
G1 X52.832 Y28.824 E.53248
G1 X52.832 Y28.342 E.02662
G1 X60.314 Y26.379 E.42762
G1 X58.479 Y26.379 E.1014
G1 X52.833 Y27.861 E.32275
G1 X52.833 Y27.379 E.02662
G1 X56.645 Y26.379 E.21788
G1 X54.811 Y26.379 E.10141
G1 X52.834 Y26.898 E.11302
G1 X52.834 Y26.493 E.0224
G3 X52.889 Y26.402 I.174 J.044 E.00598
G1 X53.748 Y26.176 E.04908
M106 S155.55
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X52.889 Y26.402 E-.33737
G1 X52.847 Y26.447 E-.02368
G1 X52.834 Y26.493 E-.01801
G1 X52.834 Y26.898 E-.15398
G1 X53.411 Y26.746 E-.22697
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 9/15
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S168.3
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z2 I-.478 J1.119 P1  F42000
G1 X218.891 Y97.392 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X218.886 Y100.336 I-76.937 J1.348 E.09764
G3 X218.728 Y101.51 I-6.757 J-.313 E.03937
G1 X218.509 Y101.487 E.00729
G1 X218.509 Y88.489 E.43116
G2 X206.891 Y88.489 I-5.809 J.011 E.60462
G1 X206.891 Y101.487 E.43116
G1 X206.672 Y101.51 E.00729
G3 X206.509 Y100.089 I6.808 J-1.501 E.04754
G1 X206.509 Y88.509 E.38412
G3 X213.054 Y82.318 I6.194 J-.007 E.33463
G3 X218.843 Y87.734 I-.358 J6.184 E.28535
G1 X219 Y89.234 E.05001
G1 X220.271 Y88.826 E.04428
G3 X220.427 Y88.808 I.15 J.614 E.00522
G1 X227.419 Y88.809 E.23195
G3 X227.89 Y89.28 I-.025 J.496 E.0242
G1 X227.891 Y97.279 E.26535
G3 X227.37 Y97.79 I-.495 J.016 E.02719
G1 X220.419 Y97.79 E.23059
G3 X220.294 Y97.777 I-.003 J-.602 E.00416
G1 X218.949 Y97.408 E.04629
M204 S10000
G1 X219.298 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X219.293 Y100.351 I-63.474 J1.083 E.08045
G3 X218.279 Y103.619 I-6.716 J-.292 E.11474
G1 X218.102 Y103.568 E.00612
G1 X218.102 Y88.493 E.50007
G2 X207.298 Y88.493 I-5.402 J.008 E.56246
G1 X207.298 Y103.568 E.50006
G1 X207.121 Y103.619 E.00612
G3 X206.102 Y100.093 I5.595 J-3.526 E.12336
G1 X206.102 Y88.505 E.38438
G3 X213.078 Y81.912 I6.601 J-.003 E.35648
G3 X219.247 Y87.684 I-.381 J6.591 E.30411
G1 X219.353 Y88.693 E.03366
G1 X220.162 Y88.434 E.0282
G3 X220.416 Y88.401 I.261 J1.025 E.00852
G1 X227.435 Y88.402 E.23284
G3 X228.297 Y89.264 I-.045 J.907 E.04431
G1 X228.298 Y97.287 E.26615
G3 X227.382 Y98.197 I-.901 J.009 E.04773
G1 X220.411 Y98.197 E.23123
G3 X220.203 Y98.174 I.006 J-1.036 E.00698
G1 X219.356 Y97.942 E.02913
M204 S250
G1 X219.69 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X219.67 Y100.633 I-28.774 J.828 E.06738
G3 X217.71 Y104.972 I-6.983 J-.541 E.14928
G1 X217.71 Y88.497 E.50624
G2 X207.69 Y88.497 I-5.01 J.004 E.48339
G1 X207.69 Y104.972 E.50624
G3 X205.71 Y100.096 I5.021 J-4.879 E.16577
G1 X205.71 Y88.501 E.3563
G3 X213.1 Y81.52 I6.993 J.001 E.3497
G3 X219.692 Y88.172 I-.424 J7.013 E.31498
G3 X220.406 Y88.009 I.824 J1.957 E.02259
G1 X227.45 Y88.01 E.21647
G3 X228.689 Y89.248 I-.065 J1.304 E.05898
G1 X228.69 Y97.295 E.24724
G3 X227.394 Y98.589 I-1.293 J.001 E.06255
G1 X220.404 Y98.589 E.21478
G3 X219.746 Y98.461 I.12 J-2.366 E.02066
; WIPE_START
M204 S6000
G1 X219.69 Y100.097 E-.62201
G1 X219.676 Y100.459 E-.13799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P68 R8
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.877 Y101.746 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545354
G1 F7165.129
M204 S6000
G1 X218.557 Y101.95 E.01553
; LINE_WIDTH: 0.526739
G1 F7440.803
G1 X218.538 Y102.067 E.00468
; LINE_WIDTH: 0.488367
G1 F8081.783
G1 X218.519 Y102.184 E.00431
; LINE_WIDTH: 0.447405
G1 F8900.22
G1 X218.436 Y102.634 E.01508
; LINE_WIDTH: 0.403882
G1 F9973.364
G1 X218.353 Y103.084 E.01346
; WIPE_START
G1 X218.436 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X219.731 Y97.453 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42098
G1 F9522.297
M204 S6000
G1 X218.841 Y96.563 E.0388
G1 X218.841 Y96.028 E.01648
G1 X220.226 Y97.413 E.06034
G2 X220.804 Y97.457 I.394 J-1.372 E.01799
G1 X218.84 Y95.493 E.08554
G1 X218.84 Y94.958 E.01648
G1 X221.338 Y97.457 E.10884
G1 X221.873 Y97.457 E.01647
G1 X218.84 Y94.423 E.13214
G1 X218.84 Y93.889 E.01648
G1 X222.408 Y97.457 E.15545
G1 X222.942 Y97.457 E.01647
G1 X218.84 Y93.354 E.17875
G1 X218.839 Y92.819 E.01648
G1 X223.477 Y97.457 E.20205
G1 X224.012 Y97.457 E.01647
G1 X218.839 Y92.284 E.22535
G1 X218.839 Y91.749 E.01648
G1 X224.546 Y97.457 E.24865
G1 X225.081 Y97.457 E.01647
G1 X218.839 Y91.214 E.27196
G1 X218.839 Y90.68 E.01648
G1 X225.616 Y97.457 E.29526
G1 X226.15 Y97.457 E.01647
G1 X218.839 Y90.145 E.31856
G1 X218.838 Y89.852 E.00903
G1 X219.068 Y89.84 E.00709
G1 X226.685 Y97.457 E.33184
G1 X227.22 Y97.457 E.01647
G1 X219.263 Y89.5 E.34667
G1 X219.668 Y89.37 E.0131
G1 X227.558 Y97.26 E.34376
G1 X227.558 Y96.725 E.01647
G1 X220.072 Y89.24 E.32612
G3 X220.508 Y89.141 I.431 J.894 E.01389
G1 X227.557 Y96.19 E.30711
G1 X227.557 Y95.656 E.01647
G1 X221.043 Y89.141 E.28381
G1 X221.578 Y89.141 E.01647
G1 X227.557 Y95.121 E.26051
G1 X227.557 Y94.586 E.01647
G1 X222.113 Y89.142 E.23721
G1 X222.647 Y89.142 E.01647
G1 X227.557 Y94.051 E.21391
G1 X227.557 Y93.517 E.01647
G1 X223.182 Y89.142 E.1906
G1 X223.717 Y89.142 E.01647
G1 X227.557 Y92.982 E.1673
G1 X227.557 Y92.447 E.01647
G1 X224.252 Y89.142 E.144
G1 X224.786 Y89.142 E.01647
G1 X227.557 Y91.912 E.1207
G1 X227.557 Y91.378 E.01647
G1 X225.321 Y89.142 E.0974
G1 X225.856 Y89.142 E.01647
G1 X227.557 Y90.843 E.0741
G1 X227.557 Y90.308 E.01647
G1 X226.391 Y89.142 E.0508
G1 X226.925 Y89.142 E.01647
G1 X227.726 Y89.943 E.03489
M204 S10000
G1 X218.769 Y89.522 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136233
G1 F15000
M204 S6000
G1 X218.753 Y89.229 E.00223
; LINE_WIDTH: 0.110018
G1 X218.738 Y88.936 E.0016
; WIPE_START
G1 X218.753 Y89.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X213.422 Y94.69 Z2.2 F42000
G1 X206.526 Y101.753 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.541142
G1 F7225.703
M204 S6000
G1 X206.843 Y101.95 E.01512
G1 X206.862 Y102.067 E.00482
; LINE_WIDTH: 0.488303
G1 F8082.932
G1 X206.881 Y102.184 E.00431
; LINE_WIDTH: 0.447381
G1 F8900.732
G1 X206.964 Y102.634 E.01508
; LINE_WIDTH: 0.403944
G1 F9971.652
G1 X207.047 Y103.084 E.01346
; OBJECT_ID: 6
; WIPE_START
G1 X206.964 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X199.549 Y100.824 Z2.2 F42000
G1 X185.491 Y97.392 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X185.486 Y100.336 I-76.651 J1.348 E.09764
G3 X185.328 Y101.51 I-6.75 J-.312 E.03937
G1 X185.109 Y101.487 E.00729
G1 X185.109 Y88.489 E.43116
G2 X173.491 Y88.489 I-5.809 J.011 E.60462
G1 X173.491 Y101.487 E.43117
G1 X173.272 Y101.51 E.00729
G3 X173.109 Y100.089 I6.805 J-1.501 E.04755
G1 X173.109 Y88.509 E.38412
G3 X179.654 Y82.318 I6.194 J-.007 E.33463
G3 X185.443 Y87.735 I-.358 J6.184 E.28536
G1 X185.6 Y89.234 E.05
G1 X186.871 Y88.826 E.04427
G3 X187.027 Y88.808 I.151 J.615 E.00522
G1 X194.019 Y88.809 E.23195
G3 X194.49 Y89.287 I-.025 J.495 E.02445
G1 X194.491 Y97.269 E.26477
G3 X193.97 Y97.79 I-.495 J.025 E.02752
G1 X187.019 Y97.79 E.23058
G3 X186.894 Y97.777 I-.003 J-.606 E.00416
G1 X185.549 Y97.408 E.04629
M204 S10000
G1 X185.898 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X185.893 Y100.351 I-63.244 J1.083 E.08045
G3 X184.879 Y103.619 I-6.715 J-.292 E.11474
G1 X184.702 Y103.568 E.00612
G1 X184.702 Y88.493 E.50006
G2 X173.898 Y88.493 I-5.402 J.008 E.56246
G1 X173.898 Y103.566 E.49999
G1 X173.72 Y103.616 E.00614
G3 X172.702 Y100.093 I5.587 J-3.522 E.12327
G1 X172.702 Y88.505 E.38438
G3 X179.678 Y81.912 I6.601 J-.003 E.35648
G3 X185.847 Y87.684 I-.381 J6.591 E.30412
G1 X185.953 Y88.693 E.03365
G1 X186.762 Y88.434 E.02819
G3 X187.016 Y88.401 I.261 J1.026 E.00852
G1 X194.035 Y88.402 E.23284
G3 X194.897 Y89.268 I-.045 J.907 E.04445
G1 X194.898 Y97.281 E.2658
G3 X193.982 Y98.197 I-.901 J.015 E.04793
G1 X187.011 Y98.197 E.23124
G3 X186.803 Y98.174 I.006 J-1.039 E.00698
G1 X185.956 Y97.942 E.02913
M204 S250
G1 X186.29 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X186.27 Y100.633 I-28.749 J.828 E.06738
G3 X184.31 Y104.972 I-6.983 J-.541 E.14928
G1 X184.31 Y88.497 E.50624
G2 X174.29 Y88.497 I-5.01 J.004 E.48339
G1 X174.29 Y104.972 E.50624
G3 X172.31 Y100.097 I5.021 J-4.879 E.16577
G1 X172.31 Y88.501 E.3563
G3 X179.7 Y81.52 I6.993 J.001 E.3497
G3 X186.292 Y88.172 I-.424 J7.013 E.31498
G3 X187.006 Y88.009 I.824 J1.958 E.02259
G1 X194.05 Y88.01 E.21647
G3 X195.289 Y89.25 I-.065 J1.303 E.05903
G1 X195.29 Y97.293 E.24713
G3 X193.994 Y98.589 I-1.293 J.003 E.06261
G1 X187.004 Y98.589 E.21478
G3 X186.346 Y98.461 I.12 J-2.366 E.02066
; WIPE_START
M204 S6000
G1 X186.29 Y100.096 E-.62199
G1 X186.276 Y100.459 E-.13801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X186.331 Y97.453 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42098
G1 F9522.297
M204 S6000
G1 X185.441 Y96.563 E.03879
G1 X185.441 Y96.028 E.01648
G1 X186.826 Y97.413 E.06034
G2 X187.404 Y97.457 I.394 J-1.372 E.01799
G1 X185.44 Y95.493 E.08554
G1 X185.44 Y94.958 E.01648
G1 X187.938 Y97.457 E.10884
G1 X188.473 Y97.457 E.01647
G1 X185.44 Y94.423 E.13214
G1 X185.44 Y93.889 E.01648
G1 X189.008 Y97.457 E.15544
G1 X189.542 Y97.457 E.01647
G1 X185.44 Y93.354 E.17875
G1 X185.439 Y92.819 E.01648
G1 X190.077 Y97.457 E.20205
G1 X190.612 Y97.457 E.01647
G1 X185.439 Y92.284 E.22535
G1 X185.439 Y91.749 E.01648
G1 X191.146 Y97.457 E.24865
G1 X191.681 Y97.457 E.01647
G1 X185.439 Y91.214 E.27195
G1 X185.439 Y90.68 E.01648
G1 X192.216 Y97.457 E.29525
G1 X192.75 Y97.457 E.01647
G1 X185.439 Y90.145 E.31856
M73 P68 R7
G1 X185.438 Y89.851 E.00904
G1 X185.668 Y89.839 E.00708
G1 X193.285 Y97.457 E.33186
G1 X193.82 Y97.457 E.01647
G1 X185.862 Y89.499 E.34668
G1 X186.267 Y89.37 E.0131
G1 X194.155 Y97.258 E.34367
G1 X194.158 Y96.725 E.01641
G1 X186.672 Y89.24 E.32612
G3 X187.108 Y89.141 I.431 J.895 E.01389
G1 X194.157 Y96.19 E.30711
G1 X194.157 Y95.656 E.01647
G1 X187.643 Y89.141 E.28381
G1 X188.178 Y89.141 E.01647
G1 X194.157 Y95.121 E.26051
G1 X194.157 Y94.586 E.01647
G1 X188.713 Y89.142 E.23721
G1 X189.247 Y89.142 E.01647
G1 X194.157 Y94.051 E.21391
G1 X194.157 Y93.517 E.01647
G1 X189.782 Y89.142 E.19061
G1 X190.317 Y89.142 E.01647
G1 X194.157 Y92.982 E.16731
G1 X194.157 Y92.447 E.01647
G1 X190.852 Y89.142 E.144
G1 X191.386 Y89.142 E.01647
G1 X194.157 Y91.912 E.1207
G1 X194.157 Y91.378 E.01647
G1 X191.921 Y89.142 E.0974
G1 X192.456 Y89.142 E.01647
G1 X194.157 Y90.843 E.0741
G1 X194.157 Y90.308 E.01647
G1 X192.991 Y89.142 E.0508
G1 X193.525 Y89.142 E.01647
G1 X194.326 Y89.943 E.03489
M204 S10000
G1 X185.369 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136294
G1 F15000
M204 S6000
G1 X185.354 Y89.228 E.00223
; LINE_WIDTH: 0.110042
G1 X185.338 Y88.935 E.00161
; WIPE_START
G1 X185.354 Y89.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.429 Y96.86 Z2.2 F42000
G1 X185.478 Y101.743 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.545507
G1 F7162.94
M204 S6000
G1 X185.157 Y101.95 E.01563
; LINE_WIDTH: 0.526754
G1 F7440.578
G1 X185.138 Y102.067 E.00468
; LINE_WIDTH: 0.488371
G1 F8081.694
G1 X185.119 Y102.184 E.00431
; LINE_WIDTH: 0.447418
G1 F8899.918
G1 X185.036 Y102.634 E.01509
; LINE_WIDTH: 0.403873
G1 F9973.606
G1 X184.953 Y103.084 E.01346
; WIPE_START
G1 X185.036 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.41 Y102.936 Z2.2 F42000
G1 X173.647 Y103.084 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.403971
G1 F9970.891
M204 S6000
G1 X173.564 Y102.634 E.01346
; LINE_WIDTH: 0.447391
G1 F8900.528
G1 X173.481 Y102.184 E.01508
; LINE_WIDTH: 0.488313
G1 F8082.764
G1 X173.462 Y102.067 E.00431
; LINE_WIDTH: 0.541348
G1 F7222.72
G1 X173.443 Y101.95 E.00482
G1 X173.121 Y101.736 E.0157
; OBJECT_ID: 5
; WIPE_START
G1 X173.443 Y101.95 E-.58136
G1 X173.462 Y102.067 E-.17864
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X166.006 Y100.436 Z2.2 F42000
G1 X152.091 Y97.392 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.091 Y100.385 E.09928
G3 X151.927 Y101.778 I-6.636 J-.073 E.04663
G1 X151.709 Y101.755 E.00727
G1 X151.709 Y88.189 E.44999
G2 X140.691 Y88.189 I-5.509 J.011 E.57342
G1 X140.691 Y101.755 E.44999
G1 X140.473 Y101.778 E.00727
G3 X140.309 Y100.389 I6.476 J-1.467 E.04648
G1 X140.309 Y88.209 E.40403
G3 X146.47 Y82.315 I5.892 J-.008 E.31619
G3 X152.069 Y87.699 I-.281 J5.896 E.28124
G1 X152.17 Y89.234 E.05103
G1 X153.508 Y88.817 E.04652
G3 X153.628 Y88.808 I.11 J.632 E.00399
G1 X160.615 Y88.809 E.23177
G3 X161.09 Y89.29 I-.018 J.492 E.02469
G1 X161.091 Y97.279 E.26502
G3 X160.57 Y97.79 I-.495 J.016 E.02718
G1 X153.619 Y97.79 E.23059
G3 X153.494 Y97.777 I-.003 J-.599 E.00416
G1 X152.149 Y97.408 E.04629
M204 S10000
G1 X152.498 Y97.926 F42000
G1 F8843.478
M204 S6000
G1 X152.498 Y100.39 E.08175
G3 X151.478 Y103.833 I-6.316 J.001 E.12078
G1 X151.302 Y103.782 E.00608
G1 X151.302 Y88.193 E.51711
G2 X141.098 Y88.193 I-5.102 J.007 E.53126
G1 X141.098 Y103.782 E.51711
G1 X140.922 Y103.833 E.00608
G3 X139.902 Y100.393 I5.296 J-3.442 E.12069
G1 X139.902 Y88.205 E.4043
G3 X146.491 Y81.909 I6.299 J-.004 E.33797
G3 X152.475 Y87.665 I-.303 J6.304 E.30059
G1 X152.542 Y88.691 E.03411
G1 X153.368 Y88.432 E.0287
G3 X153.617 Y88.401 I.247 J.965 E.00835
G1 X160.633 Y88.402 E.23273
G3 X161.497 Y89.27 I-.039 J.903 E.04463
G1 X161.498 Y97.287 E.26595
G3 X160.582 Y98.197 I-.901 J.009 E.04773
G1 X153.611 Y98.197 E.23124
G3 X153.402 Y98.174 I.006 J-1.033 E.00698
G1 X152.556 Y97.942 E.02912
M204 S250
G1 X152.89 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.881 Y100.727 I-41.742 J.978 E.07028
G3 X150.91 Y105.149 I-6.739 J-.354 E.15214
G1 X150.91 Y88.197 E.52089
G2 X141.49 Y88.197 I-4.71 J.003 E.45448
G1 X141.49 Y105.149 E.52089
G3 X139.51 Y100.397 I4.72 J-4.755 E.16235
G1 X139.51 Y88.201 E.37474
G3 X146.512 Y81.517 I6.691 J0 E.33251
G3 X152.901 Y88.168 I-.322 J6.703 E.31238
G3 X153.606 Y88.009 I.805 J1.931 E.02232
G1 X160.65 Y88.01 E.21644
G3 X161.889 Y89.251 I-.06 J1.299 E.05912
G1 X161.89 Y97.295 E.24718
G3 X160.594 Y98.589 I-1.293 J.001 E.06254
G1 X153.604 Y98.589 E.21478
G3 X152.946 Y98.461 I.12 J-2.365 E.02066
; WIPE_START
M204 S6000
G1 X152.889 Y100.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.933 Y97.454 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42096
G1 F9522.802
M204 S6000
G1 X152.042 Y96.563 E.03878
G1 X152.042 Y96.029 E.01647
G1 X153.427 Y97.413 E.06032
G1 X153.555 Y97.449 E.0041
G2 X154.005 Y97.457 I.265 J-2.259 E.01387
G1 X152.042 Y95.494 E.08549
G1 X152.042 Y94.96 E.01647
G1 X154.539 Y97.457 E.10879
G1 X155.074 Y97.457 E.01647
G1 X152.042 Y94.425 E.13208
G1 X152.042 Y93.89 E.01647
G1 X155.609 Y97.457 E.15537
G1 X156.143 Y97.457 E.01647
G1 X152.042 Y93.356 E.17866
G1 X152.042 Y92.821 E.01647
G1 X156.678 Y97.457 E.20195
G1 X157.213 Y97.457 E.01647
G1 X152.042 Y92.286 E.22524
G1 X152.042 Y91.752 E.01647
G1 X157.747 Y97.457 E.24853
G1 X158.282 Y97.457 E.01647
M73 P69 R7
G1 X152.042 Y91.217 E.27183
G1 X152.042 Y90.682 E.01647
G1 X158.816 Y97.457 E.29512
G1 X159.351 Y97.457 E.01647
G1 X152.042 Y90.148 E.31841
G1 X152.042 Y89.847 E.00926
G1 X152.269 Y89.84 E.00699
G1 X159.886 Y97.457 E.33182
G1 X160.42 Y97.457 E.01647
G1 X152.457 Y89.493 E.34692
G1 X152.864 Y89.366 E.01314
G1 X160.758 Y97.259 E.34388
G1 X160.758 Y96.724 E.01647
G1 X153.271 Y89.238 E.32614
G3 X153.709 Y89.141 I.432 J.915 E.01393
G1 X160.757 Y96.19 E.30707
G1 X160.757 Y95.655 E.01647
G1 X154.244 Y89.141 E.28377
G1 X154.779 Y89.142 E.01647
G1 X160.757 Y95.12 E.26047
G1 X160.757 Y94.586 E.01647
G1 X155.313 Y89.142 E.23717
G1 X155.848 Y89.142 E.01647
G1 X160.757 Y94.051 E.21387
G1 X160.757 Y93.516 E.01647
G1 X156.383 Y89.142 E.19057
G1 X156.917 Y89.142 E.01647
G1 X160.757 Y92.982 E.16727
G1 X160.757 Y92.447 E.01647
G1 X157.452 Y89.142 E.14398
G1 X157.987 Y89.142 E.01647
G1 X160.757 Y91.912 E.12068
G1 X160.757 Y91.377 E.01647
G1 X158.522 Y89.142 E.09738
G1 X159.056 Y89.142 E.01647
G1 X160.757 Y90.843 E.07408
G1 X160.757 Y90.308 E.01647
G1 X159.591 Y89.142 E.05078
G1 X160.126 Y89.142 E.01647
G1 X160.926 Y89.943 E.03488
M204 S10000
G1 X151.948 Y89.517 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104368
G1 F15000
M204 S6000
G1 X151.939 Y89.226 E.00146
; WIPE_START
G1 X151.948 Y89.517 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.026 Y97.149 Z2.2 F42000
G1 X152.076 Y102.012 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.527567
G1 F7428.09
M204 S6000
G1 X151.755 Y102.215 E.01501
; LINE_WIDTH: 0.524103
G1 F7481.559
G1 X151.737 Y102.321 E.00419
; LINE_WIDTH: 0.488768
G1 F8074.506
G1 X151.72 Y102.426 E.00388
; LINE_WIDTH: 0.449375
G1 F8857.086
G1 X151.637 Y102.867 E.01487
; LINE_WIDTH: 0.405938
G1 F9916.862
G1 X151.554 Y103.308 E.01328
; WIPE_START
G1 X151.637 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.011 Y103.179 Z2.2 F42000
G1 X140.846 Y103.308 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.40596
G1 F9916.27
M204 S6000
G1 X140.763 Y102.867 E.01328
; LINE_WIDTH: 0.449427
G1 F8855.946
G1 X140.68 Y102.426 E.01487
; LINE_WIDTH: 0.488821
G1 F8073.546
G1 X140.663 Y102.321 E.00388
; LINE_WIDTH: 0.526907
G1 F7438.22
G1 X140.645 Y102.215 E.00421
G1 X140.324 Y102.012 E.01499
; OBJECT_ID: 4
; WIPE_START
G1 X140.645 Y102.215 E-.59348
G1 X140.663 Y102.321 E-.16652
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X133.225 Y100.606 Z2.2 F42000
G1 X119.291 Y97.393 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.291 Y100.589 E.10604
G3 X119.127 Y101.957 I-6.296 J-.062 E.04579
G1 X118.909 Y101.933 E.00726
G1 X118.909 Y87.99 E.46252
G2 X108.291 Y87.99 I-5.309 J.011 E.55253
G1 X108.291 Y101.933 E.46252
G1 X108.073 Y101.957 E.00726
G3 X107.909 Y100.589 I6.252 J-1.444 E.04578
G1 X107.909 Y88.01 E.41728
G3 X113.889 Y82.316 I5.693 J-.007 E.30642
G3 X119.282 Y87.678 I-.292 J5.686 E.27621
G1 X119.337 Y89.194 E.05032
G1 X120.727 Y88.815 E.04778
G3 X120.819 Y88.809 I.087 J.613 E.00306
G1 X127.809 Y88.81 E.23188
G3 X128.29 Y89.29 I-.012 J.492 E.02487
G1 X128.291 Y97.28 E.26504
G3 X127.77 Y97.79 I-.495 J.016 E.02719
G1 X120.819 Y97.79 E.23058
G3 X120.694 Y97.778 I-.003 J-.606 E.00417
G1 X119.349 Y97.409 E.04629
M204 S10000
G1 X119.698 Y97.927 F42000
G1 F8843.478
M204 S6000
G1 X119.698 Y100.593 E.08847
G3 X118.677 Y103.976 I-6.116 J-.001 E.11889
G1 X118.502 Y103.924 E.00605
G1 X118.502 Y87.994 E.52843
G2 X108.698 Y87.994 I-4.902 J.007 E.51036
G1 X108.698 Y103.924 E.52843
G1 X108.523 Y103.976 E.00605
G3 X107.502 Y100.593 I5.095 J-3.383 E.11889
G1 X107.502 Y88.006 E.41756
G3 X113.91 Y81.91 I6.1 J-.003 E.32817
G3 X119.688 Y87.655 I-.313 J6.093 E.29598
G1 X119.725 Y88.665 E.03354
G1 X120.602 Y88.424 E.03018
G3 X120.811 Y88.402 I.215 J1.015 E.00698
G1 X127.829 Y88.403 E.2328
G3 X128.697 Y89.27 I-.036 J.903 E.04473
G1 X128.698 Y97.288 E.26596
G3 X127.782 Y98.198 I-.901 J.009 E.04773
G1 X120.811 Y98.198 E.23123
G3 X120.602 Y98.175 I.006 J-1.04 E.00698
G1 X119.756 Y97.942 E.02913
M204 S250
G1 X120.09 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X120.085 Y100.857 I-60.745 J1.078 E.07426
G3 X118.11 Y105.265 I-6.569 J-.297 E.15197
G1 X118.11 Y87.997 E.53059
G2 X109.09 Y87.997 I-4.51 J.004 E.43513
G1 X109.09 Y105.265 E.53059
G3 X107.11 Y100.597 I4.52 J-4.671 E.16005
G1 X107.11 Y88.002 E.38703
G3 X113.93 Y81.518 I6.493 J.001 E.32341
G3 X120.099 Y88.156 I-.351 J6.512 E.30784
G3 X120.804 Y88.01 I.823 J2.191 E.02222
G1 X127.848 Y88.011 E.21646
G3 X129.089 Y89.251 I-.059 J1.299 E.05915
G1 X129.09 Y97.295 E.24719
G3 X127.794 Y98.59 I-1.293 J.001 E.06255
G1 X120.804 Y98.59 E.21477
G3 X120.146 Y98.461 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X120.095 Y100.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.133 Y97.454 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42095
G1 F9523.053
M204 S6000
G1 X119.242 Y96.564 E.03879
G1 X119.242 Y96.029 E.01647
G1 X120.627 Y97.414 E.06033
G2 X121.205 Y97.457 I.393 J-1.374 E.01797
G1 X119.242 Y95.495 E.0855
G1 X119.242 Y94.96 E.01647
G1 X121.74 Y97.457 E.10879
G1 X122.274 Y97.457 E.01647
G1 X119.242 Y94.425 E.13208
G1 X119.242 Y93.891 E.01647
G1 X122.809 Y97.457 E.15537
G1 X123.343 Y97.457 E.01647
G1 X119.242 Y93.356 E.17866
G1 X119.242 Y92.822 E.01647
G1 X123.878 Y97.457 E.20195
G1 X124.413 Y97.457 E.01647
G1 X119.242 Y92.287 E.22524
G1 X119.242 Y91.752 E.01647
G1 X124.947 Y97.457 E.24853
G1 X125.482 Y97.457 E.01647
G1 X119.242 Y91.218 E.27182
G1 X119.242 Y90.683 E.01647
G1 X126.016 Y97.457 E.29511
G1 X126.551 Y97.457 E.01647
G1 X119.242 Y90.149 E.3184
G1 X119.242 Y89.614 E.01647
G1 X127.086 Y97.457 E.34169
G1 X127.62 Y97.457 E.01647
G1 X119.624 Y89.461 E.34836
G1 X120.043 Y89.346 E.0134
G1 X127.958 Y97.26 E.34478
G1 X127.958 Y96.725 E.01647
G1 X120.463 Y89.23 E.32651
G3 X120.909 Y89.142 I.427 J.984 E.01412
G1 X127.957 Y96.191 E.30706
G1 X127.957 Y95.656 E.01647
G1 X121.444 Y89.142 E.28377
G1 X121.978 Y89.142 E.01647
G1 X127.957 Y95.121 E.26047
G1 X127.957 Y94.586 E.01647
G1 X122.513 Y89.142 E.23717
G1 X123.048 Y89.142 E.01647
G1 X127.957 Y94.052 E.21387
G1 X127.957 Y93.517 E.01647
G1 X123.582 Y89.142 E.19058
G1 X124.117 Y89.143 E.01647
G1 X127.957 Y92.982 E.16728
G1 X127.957 Y92.448 E.01647
G1 X124.652 Y89.143 E.14398
G1 X125.187 Y89.143 E.01647
G1 X127.957 Y91.913 E.12069
G1 X127.957 Y91.378 E.01647
G1 X125.721 Y89.143 E.09739
G1 X126.256 Y89.143 E.01647
G1 X127.957 Y90.844 E.07409
G1 X127.957 Y90.309 E.01647
G1 X126.791 Y89.143 E.05079
G1 X127.325 Y89.143 E.01647
G1 X128.126 Y89.944 E.03489
; WIPE_START
G1 X127.325 Y89.143 E-.43038
G1 X126.791 Y89.143 E-.20319
G1 X127.026 Y89.378 E-.12643
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.075 Y95.909 Z2.2 F42000
G1 X119.275 Y102.19 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.515057
G1 F7624.916
M204 S6000
G1 X118.954 Y102.392 E.0146
; LINE_WIDTH: 0.522224
G1 F7510.901
G1 X118.937 Y102.49 E.00386
; LINE_WIDTH: 0.489008
G1 F8070.161
G1 X118.92 Y102.587 E.00359
; LINE_WIDTH: 0.456753
G1 F8699.172
G1 X118.837 Y103.022 E.01494
; LINE_WIDTH: 0.425478
G1 F9410.35
G1 X118.754 Y103.457 E.01381
; WIPE_START
G1 X118.837 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.211 Y103.341 Z2.2 F42000
G1 X108.446 Y103.457 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.407444
G1 F9875.91
M204 S6000
G1 X108.363 Y103.022 E.01316
; LINE_WIDTH: 0.450735
G1 F8827.544
G1 X108.28 Y102.587 E.01472
; LINE_WIDTH: 0.488998
G1 F8070.339
G1 X108.263 Y102.49 E.00359
; LINE_WIDTH: 0.516469
G1 F7602.175
G1 X108.246 Y102.392 E.00381
G1 X107.925 Y102.19 E.01464
; OBJECT_ID: 2
; WIPE_START
G1 X108.246 Y102.392 E-.60293
G1 X108.263 Y102.49 E-.15707
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X108.185 Y94.858 Z2.2 F42000
G1 X107.882 Y65.315 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X107.866 Y65.272 E.00153
G3 X107.291 Y62.41 I6.947 J-2.886 E.09747
G1 X107.291 Y39.39 E.76359
G3 X114.79 Y31.891 I7.527 J.028 E.39038
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.021 J7.521 E.39047
G1 X175.809 Y62.41 E.76359
G3 X168.31 Y69.909 I-7.523 J-.023 E.39044
G1 X114.786 Y69.909 E1.77548
G3 X108.253 Y66.067 I.028 J-7.523 E.2635
G1 X107.909 Y65.369 E.0258
M204 S10000
G1 X108.248 Y65.138 F42000
G1 F8843.478
M204 S6000
G1 X108.242 Y65.116 E.00074
G3 X107.698 Y62.406 I6.571 J-2.729 E.0923
G1 X107.698 Y39.394 E.76333
G3 X114.794 Y32.298 I7.12 J.023 E.36943
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.017 J7.113 E.36952
G1 X175.402 Y62.406 E.76333
G3 X168.306 Y69.502 I-7.115 J-.019 E.36949
G1 X114.792 Y69.502 E1.77516
G3 X108.607 Y65.868 I.021 J-7.115 E.24938
G1 X108.275 Y65.192 E.025
M204 S250
G1 X108.604 Y64.966 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X108.09 Y62.402 I6.208 J-2.579 E.08088
G1 X108.09 Y39.398 E.70685
G3 X114.798 Y32.69 I6.727 J.019 E.32352
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.013 J6.721 E.3236
G1 X175.01 Y62.402 E.70685
G3 X168.302 Y69.11 I-6.722 J-.015 E.32357
G1 X114.797 Y69.11 E1.64406
G3 X108.628 Y65.022 I.015 J-6.722 E.24083
; WIPE_START
M204 S6000
G1 X108.4 Y64.412 E-.24741
G1 X108.219 Y63.709 E-.27564
G1 X108.136 Y63.188 E-.20032
G1 X108.131 Y63.092 E-.03663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.2 Y58.464 Z2.2 F42000
G1 X149.541 Y31.509 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I.006 J7.895 E.41177
G1 X176.191 Y62.39 E.76229
G3 X168.29 Y70.291 I-7.895 J.006 E.41177
G1 X114.81 Y70.291 E1.77403
G3 X107.276 Y64.774 I-.006 J-7.895 E.33145
G3 X106.909 Y62.39 I8.029 J-2.456 E.08028
G1 X106.909 Y39.41 E.76229
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.53 E.16517
G3 X134.08 Y26.009 I.496 J-.025 E.02753
G1 X149.035 Y26.009 E.49609
G3 X149.541 Y26.52 I.012 J.494 E.02669
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I.002 J8.302 E.43271
G1 X176.598 Y62.394 E.76256
G3 X168.294 Y70.698 I-8.302 J.002 E.4327
G1 X114.806 Y70.698 E1.7743
G3 X106.886 Y64.892 I-.002 J-8.302 E.34854
G3 X106.502 Y62.394 I8.442 J-2.577 E.08412
G1 X106.502 Y39.406 E.76256
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.518 E.15207
G3 X134.068 Y25.602 I.903 J-.013 E.04791
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
G1 X176.99 Y62.398 E.7066
G3 X168.298 Y71.09 I-8.694 J-.002 E.41951
G1 X114.802 Y71.09 E1.64378
G3 X106.11 Y62.398 I.002 J-8.694 E.4195
G1 X106.11 Y39.402 E.7066
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.506 E.12917
G3 X134.056 Y25.21 I1.296 J-.001 E.06257
G1 X149.06 Y25.21 E.46104
G3 X150.34 Y26.504 I-.013 J1.292 E.06203
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P70 R7
G1 X149.149 Y31.499 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X149.147 Y26.564 E.15161
G1 X149.105 Y26.444 E.00391
G1 X148.952 Y26.402 E.00488
G1 X134.046 Y26.41 E.45802
G1 X133.956 Y26.511 E.00415
G1 X133.951 Y31.499 E.15326
G1 X149.089 Y31.499 E.46512
M204 S10000
G1 X136.499 Y29.189 F42000
; LINE_WIDTH: 0.51559
G1 F7616.32
M204 S6000
G1 X146.837 Y29.188 E.39818
G1 X146.837 Y28.714 E.01826
G1 X136.264 Y28.718 E.40724
G1 X136.263 Y29.189 E.01815
G1 X136.439 Y29.189 E.00677
M204 S10000
G1 X135.838 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.263 Y29.613 E.35102
G1 X147.262 Y28.288 E.04073
G1 X135.84 Y28.294 E.35096
G1 X135.839 Y29.553 E.03869
M204 S10000
G1 X135.461 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X147.64 Y29.991 E.37421
G1 X147.639 Y27.911 E.06391
G1 X135.463 Y27.917 E.37412
G1 X135.461 Y29.931 E.06186
M204 S10000
G1 X135.084 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X148.017 Y30.368 E.3974
G1 X148.016 Y27.533 E.08709
G1 X135.086 Y27.54 E.39727
G1 X135.084 Y30.308 E.08502
M204 S10000
G1 X134.706 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X148.394 Y30.745 E.42059
G1 X148.393 Y27.156 E.11027
G1 X134.71 Y27.164 E.42043
G1 X134.706 Y30.685 E.10819
M204 S10000
G1 X134.329 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X148.772 Y31.122 E.44378
G1 X148.77 Y26.779 E.13344
G1 X134.333 Y26.787 E.44358
G1 X134.329 Y31.062 E.13135
; OBJECT_ID: 8
; WIPE_START
G1 X134.331 Y29.062 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X129.701 Y35.13 Z2.2 F42000
G1 X38.791 Y154.292 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X38.786 Y157.051 I-69.884 J1.248 E.09154
G3 X38.628 Y158.224 I-6.447 J-.27 E.03931
G1 X38.409 Y158.201 E.0073
G1 X38.409 Y145.59 E.41836
G2 X26.391 Y145.59 I-6.009 J.011 E.62552
G1 X26.391 Y158.209 E.4186
G1 X26.173 Y158.232 E.00727
G3 X26.009 Y156.789 I7.017 J-1.528 E.04826
G1 X26.009 Y145.61 E.37084
G3 X32.564 Y139.211 I6.403 J.002 E.33862
G3 X38.721 Y144.657 I-.168 J6.393 E.29611
G1 X38.912 Y146.141 E.04966
G1 X40.204 Y145.719 E.0451
G3 X40.33 Y145.708 I.115 J.632 E.00419
G1 X47.27 Y145.708 E.23023
G3 X47.791 Y146.229 I.025 J.495 E.02752
G1 X47.79 Y154.218 E.26502
G3 X47.28 Y154.69 I-.496 J-.024 E.02552
G1 X40.319 Y154.69 E.23091
G3 X40.194 Y154.678 I-.003 J-.602 E.00416
G1 X38.849 Y154.308 E.04629
M204 S10000
G1 X39.198 Y154.826 F42000
G1 F8843.478
M204 S6000
G3 X39.193 Y157.067 I-56.789 J.984 E.07435
G3 X38.182 Y160.374 I-6.834 J-.28 E.11596
G1 X38.002 Y160.325 E.00619
G1 X38.002 Y145.593 E.48868
G2 X26.798 Y145.593 I-5.602 J.007 E.58336
G1 X26.798 Y160.325 E.48868
G1 X26.618 Y160.374 E.00619
G3 X25.602 Y156.793 I5.922 J-3.615 E.12501
G1 X25.602 Y145.605 E.37112
G3 X32.575 Y138.804 I6.811 J.007 E.36004
G3 X39.123 Y144.597 I-.179 J6.8 E.31498
G1 X39.253 Y145.601 E.03357
G1 X40.057 Y145.335 E.02808
G3 X40.318 Y145.301 I.258 J.961 E.00876
G1 X47.282 Y145.301 E.23102
G3 X48.198 Y146.217 I.015 J.901 E.04793
G1 X48.197 Y154.234 E.26595
G3 X47.288 Y155.097 I-.903 J-.041 E.04593
G1 X40.311 Y155.097 E.23143
G3 X40.102 Y155.075 I.006 J-1.036 E.00698
G1 X39.256 Y154.842 E.02912
M204 S250
G1 X39.59 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X39.568 Y157.366 I-25.707 J.728 E.06227
G3 X37.61 Y161.753 I-7.248 J-.605 E.15041
G1 X37.61 Y145.597 E.49641
G2 X27.19 Y145.597 I-5.21 J.003 E.50274
G1 X27.19 Y161.753 E.49641
G3 X25.21 Y156.797 I5.276 J-4.981 E.16791
G1 X25.21 Y145.601 E.34401
G3 X32.585 Y138.412 I7.203 J.012 E.35261
G3 X39.581 Y145.079 I-.208 J7.222 E.32528
G3 X40.306 Y144.909 I.827 J1.892 E.02302
G1 X47.294 Y144.909 E.21471
G3 X48.59 Y146.205 I.003 J1.293 E.06261
G1 X48.589 Y154.25 E.24718
G3 X47.296 Y155.489 I-1.295 J-.057 E.06076
G1 X40.304 Y155.489 E.21484
G3 X39.646 Y155.361 I.12 J-2.365 E.02066
; WIPE_START
M204 S6000
G1 X39.59 Y156.797 E-.54619
G1 X39.568 Y157.359 E-.21381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X39.631 Y154.353 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42102
G1 F9521.29
M204 S6000
G1 X38.741 Y153.463 E.03881
G1 X38.74 Y152.928 E.01648
G1 X40.126 Y154.313 E.06037
G2 X40.704 Y154.357 I.394 J-1.371 E.01799
G1 X38.74 Y152.393 E.08557
G1 X38.74 Y151.858 E.01648
G1 X41.239 Y154.357 E.10888
G1 X41.774 Y154.357 E.01647
G1 X38.74 Y151.323 E.13218
G1 X38.74 Y150.788 E.01648
G1 X42.308 Y154.357 E.15549
G1 X42.843 Y154.357 E.01647
G1 X38.74 Y150.253 E.1788
G1 X38.739 Y149.718 E.01648
G1 X43.378 Y154.357 E.20211
G1 X43.912 Y154.357 E.01647
G1 X38.739 Y149.184 E.22541
G1 X38.739 Y148.649 E.01648
G1 X44.447 Y154.357 E.24872
G1 X44.982 Y154.357 E.01647
G1 X38.739 Y148.114 E.27203
G1 X38.739 Y147.579 E.01648
G1 X45.517 Y154.357 E.29533
G1 X46.051 Y154.357 E.01647
G1 X38.738 Y147.044 E.31864
G1 X38.738 Y146.763 E.00866
G1 X38.977 Y146.748 E.00736
G1 X46.586 Y154.357 E.33156
G1 X47.121 Y154.357 E.01647
G1 X39.171 Y146.407 E.34639
G1 X39.573 Y146.274 E.01305
G1 X47.456 Y154.158 E.3435
G1 X47.457 Y153.623 E.01647
G1 X39.975 Y146.142 E.32598
G3 X40.41 Y146.042 I.431 J.877 E.01386
G1 X47.457 Y153.089 E.30705
G1 X47.457 Y152.554 E.01647
G1 X40.944 Y146.042 E.28376
G1 X41.479 Y146.042 E.01647
G1 X47.457 Y152.019 E.26046
G1 X47.457 Y151.485 E.01647
G1 X42.014 Y146.042 E.23717
G1 X42.548 Y146.042 E.01647
G1 X47.457 Y150.95 E.21387
G1 X47.457 Y150.415 E.01647
G1 X43.083 Y146.042 E.19058
G1 X43.618 Y146.042 E.01647
G1 X47.457 Y149.881 E.16728
G1 X47.457 Y149.346 E.01647
G1 X44.153 Y146.042 E.14399
G1 X44.687 Y146.042 E.01647
G1 X47.457 Y148.812 E.12069
G1 X47.457 Y148.277 E.01647
G1 X45.222 Y146.042 E.0974
G1 X45.757 Y146.042 E.01647
G1 X47.457 Y147.742 E.0741
G1 X47.457 Y147.208 E.01647
G1 X46.291 Y146.042 E.0508
G1 X46.826 Y146.042 E.01647
G1 X47.627 Y146.843 E.0349
M204 S10000
G1 X38.678 Y146.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.148577
G1 F15000
M204 S6000
G1 X38.658 Y146.119 E.00271
; LINE_WIDTH: 0.114132
G1 X38.638 Y145.805 E.00182
; WIPE_START
G1 X38.658 Y146.119 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.558 Y153.751 Z2.2 F42000
G1 X38.496 Y158.415 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.533165
G1 F7343.274
M204 S6000
G1 X38.443 Y158.774 E.01448
; LINE_WIDTH: 0.495817
G1 F7948.827
G1 X38.421 Y158.899 E.0047
; LINE_WIDTH: 0.453299
G1 F8772.377
G1 X38.4 Y159.025 E.00426
; LINE_WIDTH: 0.407947
G1 F9862.302
G1 X38.322 Y159.436 E.01245
; LINE_WIDTH: 0.359742
G1 F11362.843
G1 X38.244 Y159.847 E.0108
; WIPE_START
G1 X38.322 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X30.694 Y159.703 Z2.2 F42000
G1 X26.556 Y159.847 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.359745
G1 F11362.766
M204 S6000
G1 X26.478 Y159.436 E.0108
; LINE_WIDTH: 0.407928
G1 F9862.794
G1 X26.4 Y159.025 E.01245
; LINE_WIDTH: 0.453288
G1 F8772.611
G1 X26.379 Y158.899 E.00426
; LINE_WIDTH: 0.495843
G1 F7948.376
G1 X26.357 Y158.774 E.0047
; LINE_WIDTH: 0.532221
G1 F7357.445
G1 X26.305 Y158.423 E.01415
; OBJECT_ID: 9
; WIPE_START
G1 X26.357 Y158.774 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X33.955 Y158.047 Z2.2 F42000
G1 X73.191 Y154.293 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X73.186 Y156.758 I-63.833 J1.099 E.08179
G3 X73.028 Y157.956 I-6.743 J-.277 E.04012
G1 X72.809 Y157.933 E.00731
G1 X72.809 Y145.89 E.39949
G2 X60.191 Y145.89 I-6.309 J.011 E.65678
G1 X60.191 Y157.941 E.39974
G1 X59.973 Y157.964 E.00728
G3 X59.809 Y156.486 I7.336 J-1.56 E.04941
G1 X59.809 Y145.91 E.35082
G3 X66.819 Y139.217 I6.694 J-.007 E.35951
G3 X73.082 Y144.697 I-.335 J6.701 E.29776
G1 X73.322 Y146.177 E.04976
G1 X74.545 Y145.735 E.04312
G3 X74.729 Y145.709 I.168 J.516 E.00621
G1 X81.719 Y145.71 E.23188
G3 X82.19 Y146.181 I-.025 J.496 E.0242
G1 X82.191 Y154.17 E.26502
G3 X81.67 Y154.691 I-.494 J.027 E.02754
G1 X74.719 Y154.691 E.23059
G3 X74.594 Y154.678 I-.003 J-.603 E.00416
G1 X73.249 Y154.309 E.04629
M204 S10000
G1 X73.598 Y154.827 F42000
G1 F8843.478
M204 S6000
G3 X73.593 Y156.774 I-50.417 J.834 E.0646
G3 X72.583 Y160.157 I-7.134 J-.286 E.11833
G1 X72.402 Y160.108 E.00622
G1 X72.402 Y145.894 E.47151
G2 X60.598 Y145.894 I-5.902 J.007 E.61462
G1 X60.598 Y160.105 E.4714
G1 X60.418 Y160.154 E.0062
G3 X59.402 Y156.491 I6.195 J-3.69 E.12758
G1 X59.402 Y145.906 E.35115
G3 X66.839 Y138.81 I7.101 J-.003 E.38123
G3 X73.482 Y144.624 I-.355 J7.109 E.31587
G1 X73.645 Y145.628 E.03375
G1 X74.425 Y145.346 E.0275
G3 X74.717 Y145.302 I.287 J.918 E.00984
G1 X81.735 Y145.303 E.23279
G3 X82.597 Y146.165 I-.046 J.908 E.0443
G1 X82.598 Y154.182 E.26595
G3 X81.682 Y155.098 I-.9 J.016 E.04795
G1 X74.711 Y155.098 E.23124
G3 X74.503 Y155.075 I.006 J-1.038 E.00698
G1 X73.656 Y154.843 E.02913
M204 S250
G1 X73.99 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X73.901 Y157.653 I-14.994 J.578 E.07117
G3 X72.01 Y161.572 I-7.507 J-1.207 E.13558
G1 X72.01 Y145.898 E.48162
G2 X60.99 Y145.898 I-5.51 J.003 E.5317
G1 X60.99 Y161.572 E.48162
G3 X59.01 Y156.497 I5.579 J-5.1 E.17124
G1 X59.01 Y145.902 E.32555
G3 X66.857 Y138.418 I7.493 J.001 E.37251
G3 X73.956 Y145.098 I-.369 J7.505 E.32591
G3 X74.706 Y144.91 I.869 J1.873 E.02389
G1 X81.75 Y144.911 E.21645
G3 X82.989 Y146.149 I-.066 J1.304 E.05898
G1 X82.99 Y154.194 E.24718
G3 X81.694 Y155.49 I-1.291 J.005 E.06263
G1 X74.704 Y155.49 E.21478
G3 X74.046 Y155.361 I.12 J-2.362 E.02066
; WIPE_START
M204 S6000
G1 X73.984 Y156.789 E-.54309
G1 X73.929 Y157.357 E-.21691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X74.031 Y154.354 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42097
G1 F9522.549
M204 S6000
G1 X73.141 Y153.463 E.0388
G1 X73.14 Y152.929 E.01648
G1 X74.526 Y154.314 E.06035
G2 X75.104 Y154.357 I.394 J-1.37 E.01799
G1 X73.14 Y152.394 E.08555
G1 X73.14 Y151.859 E.01648
G1 X75.639 Y154.357 E.10885
G1 X76.173 Y154.357 E.01647
G1 X73.14 Y151.324 E.13215
G1 X73.14 Y150.789 E.01648
G1 X76.708 Y154.357 E.15546
G1 X77.242 Y154.357 E.01647
G1 X73.139 Y150.254 E.17876
G1 X73.139 Y149.719 E.01648
G1 X77.777 Y154.357 E.20206
G1 X78.312 Y154.357 E.01647
G1 X73.139 Y149.185 E.22536
G1 X73.139 Y148.65 E.01648
G1 X78.846 Y154.357 E.24866
G1 X79.381 Y154.357 E.01647
G1 X73.139 Y148.115 E.27197
G1 X73.138 Y147.58 E.01648
G1 X79.916 Y154.357 E.29527
G1 X80.45 Y154.357 E.01647
G1 X73.138 Y147.045 E.31857
G1 X73.138 Y146.809 E.00729
G1 X73.414 Y146.786 E.00852
G1 X80.985 Y154.357 E.32985
G1 X81.52 Y154.357 E.01647
G1 X73.595 Y146.433 E.34524
G1 X73.988 Y146.291 E.01286
G1 X81.855 Y154.158 E.34273
G1 X81.858 Y153.626 E.01638
G1 X74.381 Y146.149 E.32575
G3 X74.808 Y146.042 I.441 J.857 E.01371
G1 X81.857 Y153.091 E.30711
G1 X81.857 Y152.557 E.01647
G1 X75.343 Y146.042 E.28381
G1 X75.878 Y146.042 E.01647
G1 X81.857 Y152.022 E.26051
G1 X81.857 Y151.487 E.01647
G1 X76.413 Y146.042 E.23721
G1 X76.947 Y146.042 E.01647
G1 X81.857 Y150.952 E.21391
G1 X81.857 Y150.418 E.01647
G1 X77.482 Y146.043 E.19061
G1 X78.017 Y146.043 E.01647
G1 X81.857 Y149.883 E.16731
G1 X81.857 Y149.348 E.01647
G1 X78.551 Y146.043 E.14401
G1 X79.086 Y146.043 E.01647
G1 X81.857 Y148.813 E.12071
M73 P71 R7
G1 X81.857 Y148.279 E.01647
G1 X79.621 Y146.043 E.09741
G1 X80.156 Y146.043 E.01647
G1 X81.857 Y147.744 E.07411
G1 X81.857 Y147.209 E.01647
G1 X80.69 Y146.043 E.05081
G1 X81.225 Y146.043 E.01647
G1 X82.026 Y146.844 E.0349
M204 S10000
G1 X73.088 Y146.478 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.161341
G1 F15000
M204 S6000
G1 X73.063 Y146.163 E.00305
; LINE_WIDTH: 0.118721
G1 X73.037 Y145.847 E.00196
; WIPE_START
G1 X73.063 Y146.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.957 Y153.794 Z2.2 F42000
G1 X72.897 Y158.147 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.534207
G1 F7327.702
M204 S6000
G1 X72.842 Y158.526 E.01533
; LINE_WIDTH: 0.494338
G1 F7974.869
G1 X72.821 Y158.655 E.00482
; LINE_WIDTH: 0.451526
G1 F8810.443
G1 X72.799 Y158.784 E.00436
; LINE_WIDTH: 0.406053
G1 F9913.74
G1 X72.722 Y159.202 E.01258
; LINE_WIDTH: 0.357884
G1 F11429.873
G1 X72.644 Y159.62 E.01091
M204 S10000
G1 X72.458 Y160.326 F42000
; LINE_WIDTH: 0.108629
G1 F15000
M204 S6000
G1 X72.224 Y160.99 E.00377
; WIPE_START
G1 X72.458 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.837 Y160.759 Z2.2 F42000
G1 X60.776 Y160.99 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.108589
G1 F15000
M204 S6000
G1 X60.542 Y160.323 E.00378
M204 S10000
G1 X60.356 Y159.62 F42000
; LINE_WIDTH: 0.357917
G1 F11428.698
M204 S6000
G1 X60.278 Y159.202 E.01091
; LINE_WIDTH: 0.406106
G1 F9912.29
G1 X60.201 Y158.784 E.01258
; LINE_WIDTH: 0.451591
G1 F8809.04
G1 X60.179 Y158.655 E.00436
; LINE_WIDTH: 0.494411
G1 F7973.592
G1 X60.158 Y158.526 E.00482
; LINE_WIDTH: 0.533241
G1 F7342.141
G1 X60.104 Y158.155 E.01498
; OBJECT_ID: 3
; WIPE_START
G1 X60.158 Y158.526 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X55.058 Y152.847 Z2.2 F42000
G1 X26.75 Y121.332 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X26.609 Y120.822 E.01753
G3 X26.391 Y119.01 I7.605 J-1.837 E.06071
G1 X26.391 Y95.99 E.76359
G3 X34.19 Y88.191 I7.823 J.024 E.40607
G1 X87.71 Y88.191 E1.77533
G3 X95.509 Y95.99 I-.024 J7.823 E.40607
G1 X95.509 Y119.01 E.76359
G3 X87.71 Y126.809 I-7.823 J-.024 E.40607
G1 X34.19 Y126.809 E1.77533
G3 X26.777 Y121.412 I.024 J-7.823 E.32503
G1 X26.769 Y121.389 E.00081
M204 S10000
G1 X27.141 Y121.214 F42000
G1 F8843.478
M204 S6000
G1 X26.943 Y120.444 E.02637
G3 X26.798 Y119.006 I7.271 J-1.457 E.04802
G1 X26.798 Y95.994 E.76333
G3 X34.194 Y88.598 I7.416 J.019 E.38512
G1 X87.706 Y88.598 E1.77508
G3 X95.102 Y95.994 I-.019 J7.416 E.38512
G1 X95.102 Y119.006 E.76333
G3 X87.706 Y126.402 I-7.416 J-.019 E.38512
G1 X34.194 Y126.402 E1.77508
G3 X27.164 Y121.286 I.019 J-7.416 E.3082
G1 X27.159 Y121.271 E.00053
M204 S250
G1 X27.52 Y121.115 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X27.327 Y120.367 E.02373
G3 X27.19 Y119.002 I6.886 J-1.38 E.04223
G1 X27.19 Y95.998 E.70685
G3 X34.198 Y88.99 I7.023 J.015 E.33805
G1 X87.702 Y88.99 E1.64403
G3 X94.71 Y95.998 I-.015 J7.023 E.33805
G1 X94.71 Y119.002 E.70685
G3 X87.702 Y126.01 I-7.023 J-.015 E.33805
G1 X34.198 Y126.01 E1.64403
G3 X27.539 Y121.172 I.015 J-7.023 E.27024
; WIPE_START
M204 S6000
G1 X27.327 Y120.367 E-.31615
G1 X27.239 Y119.824 E-.20923
G1 X27.202 Y119.207 E-.23462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.301 Y114.619 Z2.2 F42000
G1 X68.941 Y87.809 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y87.809 E.62195
G3 X95.891 Y96.01 I.006 J8.195 E.4274
G1 X95.891 Y118.99 E.76229
G3 X87.69 Y127.191 I-8.195 J.006 E.4274
G1 X34.21 Y127.191 E1.77403
G3 X26.009 Y118.99 I.006 J-8.207 E.42724
G1 X26.009 Y96.01 E.76229
G3 X34.21 Y87.809 I8.195 J-.006 E.4274
G1 X52.959 Y87.809 E.62194
G1 X52.959 Y82.83 E.16517
G3 X53.478 Y82.309 I.498 J-.023 E.02741
G1 X68.435 Y82.309 E.49617
G3 X68.941 Y82.83 I.012 J.494 E.02702
G1 X68.941 Y87.749 E.16318
M204 S10000
G1 X69.348 Y87.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y87.402 E.60858
G3 X96.298 Y96.006 I.002 J8.602 E.44834
G1 X96.298 Y118.994 E.76256
G3 X87.694 Y127.598 I-8.602 J.002 E.44833
G1 X34.206 Y127.598 E1.7743
G3 X25.602 Y118.994 I.01 J-8.614 E.44817
G1 X25.602 Y96.006 E.76256
G3 X34.206 Y87.402 I8.602 J-.002 E.44833
G1 X52.552 Y87.402 E.60858
G1 X52.552 Y82.818 E.15207
G3 X53.466 Y81.902 I.906 J-.01 E.04781
G1 X68.448 Y81.902 E.49697
G3 X69.348 Y82.818 I0 J.9 E.0474
G1 X69.348 Y87.342 E.15008
M204 S250
G1 X69.74 Y87.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y87.01 E.5518
G3 X96.69 Y96.002 I-.002 J8.994 E.43399
G1 X96.69 Y118.998 E.7066
G3 X89.021 Y127.891 I-8.993 J-.002 E.39317
G3 X87.698 Y127.99 I-1.562 J-11.992 E.04079
G1 X34.202 Y127.99 E1.64378
G3 X25.21 Y118.998 I.015 J-9.007 E.43382
G1 X25.21 Y96.002 E.7066
G3 X34.202 Y87.01 I8.994 J.002 E.43398
G1 X52.16 Y87.01 E.5518
G1 X52.16 Y82.806 E.12917
G3 X53.456 Y81.51 I1.3 J.004 E.0625
G1 X68.46 Y81.51 E.46105
G3 X69.74 Y82.806 I-.013 J1.292 E.0621
G1 X69.74 Y86.95 E.12733
; WIPE_START
M204 S6000
G1 X71.74 Y86.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.14 Y86.253 Z2.2 F42000
G1 X55.898 Y85.49 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514991
G1 F7625.978
M204 S6000
G1 X66.235 Y85.488 E.39766
G1 X66.235 Y85.014 E.01824
G1 X55.663 Y85.02 E.40667
G1 X55.663 Y85.49 E.01808
G1 X55.838 Y85.49 E.00675
M204 S10000
G1 X66.661 Y85.913 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.66 Y84.588 E.04072
G1 X55.24 Y84.596 E.3509
G1 X55.238 Y85.913 E.04047
G1 X66.601 Y85.913 E.34914
M204 S10000
G1 X67.039 Y86.291 F42000
G1 F9547.299
M204 S6000
G1 X67.036 Y84.211 E.0639
G1 X54.863 Y84.22 E.37404
G1 X54.861 Y86.291 E.06363
G1 X66.979 Y86.291 E.37234
M204 S10000
G1 X67.416 Y86.668 F42000
G1 F9547.299
M204 S6000
G1 X67.413 Y83.833 E.08708
G1 X54.486 Y83.843 E.39719
G1 X54.484 Y86.668 E.0868
G1 X67.356 Y86.668 E.39553
M204 S10000
G1 X67.794 Y87.045 F42000
G1 F9547.299
M204 S6000
G1 X67.79 Y83.456 E.11026
G1 X54.11 Y83.466 E.42034
G1 X54.106 Y87.045 E.10996
G1 X67.734 Y87.045 E.41873
M204 S10000
G1 X68.171 Y87.422 F42000
G1 F9547.299
M204 S6000
G1 X68.166 Y83.079 E.13344
G1 X53.733 Y83.089 E.44348
G1 X53.729 Y87.422 E.13313
G1 X68.111 Y87.422 E.44193
M204 S10000
G1 X68.549 Y87.799 F42000
G1 F9547.299
M204 S6000
G1 X68.543 Y82.854 E.15192
G1 X68.496 Y82.734 E.00399
G1 X68.364 Y82.702 E.00417
G1 X53.44 Y82.712 E.45855
G1 X53.356 Y82.808 E.0039
G1 X53.351 Y87.799 E.15336
G1 X68.489 Y87.799 E.46512
; OBJECT_ID: 1
; WIPE_START
G1 X66.489 Y87.799 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X69.898 Y80.97 Z2.2 F42000
G1 X92.984 Y34.735 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X93.273 Y35.143 E.0166
G3 X94.509 Y39.19 I-6.087 J4.071 E.14242
G1 X94.509 Y62.21 E.76359
G3 X87.21 Y69.509 I-7.322 J-.023 E.38003
G1 X33.69 Y69.509 E1.77533
G3 X26.391 Y62.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E.76359
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.214 Y31.891 E1.77548
G3 X92.936 Y34.678 I-.027 J7.322 E.2184
G1 X92.945 Y34.689 E.00046
M204 S10000
G1 X92.654 Y34.974 F42000
G1 F8843.478
M204 S6000
G1 X92.935 Y35.368 E.01606
G3 X94.102 Y39.194 I-5.748 J3.844 E.1346
G1 X94.102 Y62.206 E.76333
G3 X87.206 Y69.102 I-6.915 J-.018 E.35908
G1 X33.694 Y69.102 E1.77508
G3 X26.798 Y62.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E.76333
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.208 Y32.298 E1.77516
G3 X92.615 Y34.929 I-.021 J6.915 E.20634
M204 S250
G1 X92.337 Y35.204 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X92.609 Y35.586 E.0144
G3 X93.71 Y39.198 I-5.421 J3.626 E.11771
G1 X93.71 Y62.202 E.70685
G3 X87.202 Y68.71 I-6.522 J-.014 E.31393
G1 X33.698 Y68.71 E1.64403
G3 X27.19 Y62.202 I.014 J-6.522 E.31393
G1 X27.19 Y39.198 E.70685
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.203 Y32.69 E1.64406
G3 X92.298 Y35.159 I-.015 J6.522 E.17995
; WIPE_START
M204 S6000
G1 X92.609 Y35.586 E-.20072
G1 X93 Y36.244 E-.2911
G1 X93.215 Y36.709 E-.19429
G1 X93.282 Y36.891 E-.07389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.822 Y35.275 Z2.2 F42000
G1 X68.441 Y31.509 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
M73 P72 R7
G3 X94.891 Y39.21 I.006 J7.695 E.40135
G1 X94.891 Y62.19 E.76229
G3 X87.19 Y69.891 I-7.706 J-.005 E.40119
G1 X33.71 Y69.891 E1.77403
G3 X26.009 Y62.19 I-.006 J-7.695 E.40134
G1 X26.009 Y39.21 E.76229
G3 X33.71 Y31.509 I7.706 J.005 E.40119
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.53 E.16517
G3 X52.978 Y26.009 I.495 J-.025 E.02745
G1 X67.935 Y26.009 E.49617
G3 X68.441 Y26.53 I.012 J.494 E.02702
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I.002 J8.102 E.42228
G1 X95.298 Y62.194 E.76256
G3 X87.194 Y70.298 I-8.113 J-.009 E.42212
G1 X33.706 Y70.298 E1.77431
G3 X25.602 Y62.194 I-.002 J-8.102 E.42228
G1 X25.602 Y39.206 E.76256
G3 X33.706 Y31.102 I8.113 J.01 E.42212
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.518 E.15207
G3 X52.966 Y25.602 I.903 J-.013 E.04786
G1 X67.948 Y25.602 E.49696
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
G1 X95.69 Y62.198 E.7066
G3 X87.198 Y70.69 I-8.506 J-.014 E.4097
G1 X33.702 Y70.69 E1.64378
G3 X25.21 Y62.198 I.002 J-8.494 E.40985
G1 X25.21 Y39.202 E.7066
G3 X33.702 Y30.71 I8.506 J.014 E.4097
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.506 E.12917
G3 X52.956 Y25.21 I1.296 J-.001 E.06256
G1 X67.96 Y25.21 E.46105
G3 X69.24 Y26.506 I-.013 J1.292 E.0621
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.64 Y29.953 Z2.2 F42000
G1 X55.398 Y29.19 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.514991
G1 F7625.978
M204 S6000
G1 X65.735 Y29.188 E.39766
G1 X65.735 Y28.714 E.01824
G1 X55.163 Y28.72 E.40667
G1 X55.163 Y29.19 E.01808
G1 X55.338 Y29.19 E.00675
M204 S10000
G1 X66.161 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.288 E.04072
G1 X54.74 Y28.296 E.3509
G1 X54.738 Y29.613 E.04047
G1 X66.101 Y29.613 E.34914
M204 S10000
G1 X66.539 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.911 E.0639
G1 X54.363 Y27.92 E.37404
G1 X54.361 Y29.991 E.06363
G1 X66.479 Y29.991 E.37234
M204 S10000
G1 X66.916 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.533 E.08708
G1 X53.986 Y27.543 E.39719
G1 X53.984 Y30.368 E.0868
G1 X66.856 Y30.368 E.39553
M204 S10000
G1 X67.294 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.156 E.11026
G1 X53.61 Y27.166 E.42034
G1 X53.606 Y30.745 E.10996
G1 X67.234 Y30.745 E.41873
M204 S10000
G1 X67.671 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.779 E.13344
G1 X53.233 Y26.789 E.44349
G1 X53.229 Y31.122 E.13313
G1 X67.611 Y31.122 E.44193
M204 S10000
G1 X68.049 Y31.499 F42000
G1 F9547.299
M204 S6000
G1 X68.043 Y26.555 E.15192
G1 X67.996 Y26.434 E.004
G1 X67.864 Y26.402 E.00417
G1 X52.936 Y26.412 E.45867
G1 X52.856 Y26.511 E.00392
G1 X52.851 Y31.499 E.15324
G1 X67.989 Y31.499 E.46512
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.989 Y31.499 E-.76
; WIPE_END
M73 P72 R6
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 10/15
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z2.2 I-.482 J1.118 P1  F42000
G1 X218.891 Y97.392 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X218.886 Y100.336 I-76.941 J1.348 E.09764
G3 X218.728 Y101.51 I-6.447 J-.271 E.03937
G1 X218.509 Y101.487 E.00729
G1 X218.509 Y88.489 E.43117
G2 X206.891 Y88.489 I-5.809 J.011 E.60465
G1 X206.891 Y101.487 E.43117
G1 X206.672 Y101.51 E.00729
G3 X206.509 Y100.089 I7.018 J-1.525 E.04754
G1 X206.509 Y88.509 E.38412
G3 X213.014 Y82.317 I6.193 J-.008 E.33329
G3 X218.843 Y87.735 I-.316 J6.185 E.28669
G1 X219 Y89.234 E.04999
G1 X220.271 Y88.826 E.04429
G3 X220.428 Y88.808 I.148 J.596 E.00524
G1 X227.419 Y88.809 E.23192
G3 X227.89 Y89.29 I-.023 J.493 E.02454
G1 X227.891 Y97.276 E.26494
G3 X227.37 Y97.79 I-.495 J.019 E.02728
G1 X220.419 Y97.79 E.23059
G3 X220.294 Y97.777 I-.003 J-.605 E.00417
G1 X218.949 Y97.408 E.04628
M204 S10000
G1 X219.298 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X219.293 Y100.351 I-63.472 J1.083 E.08045
G3 X218.279 Y103.619 I-6.716 J-.292 E.11474
G1 X218.102 Y103.568 E.00612
G1 X218.102 Y88.493 E.50007
G2 X207.298 Y88.493 I-5.402 J.007 E.56248
G1 X207.298 Y103.567 E.50002
G1 X207.12 Y103.617 E.00613
G3 X206.102 Y100.093 I5.593 J-3.524 E.1233
G1 X206.102 Y88.505 E.38438
G3 X213.036 Y81.91 I6.6 J-.003 E.35509
G3 X219.247 Y87.684 I-.339 J6.592 E.30549
G1 X219.353 Y88.693 E.03365
G1 X220.162 Y88.434 E.0282
G3 X220.416 Y88.401 I.258 J1.006 E.00853
G1 X227.435 Y88.402 E.23282
G3 X228.297 Y89.27 I-.043 J.905 E.04452
G1 X228.298 Y97.285 E.2659
G3 X227.382 Y98.197 I-.901 J.01 E.04779
G1 X220.411 Y98.197 E.23124
G3 X220.202 Y98.174 I.006 J-1.039 E.00698
G1 X219.356 Y97.942 E.02912
M204 S250
G1 X219.69 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X219.67 Y100.633 I-28.774 J.828 E.06738
G3 X217.71 Y104.972 I-6.983 J-.541 E.14928
G1 X217.71 Y88.497 E.50624
G2 X207.69 Y88.497 I-5.01 J.004 E.48341
G1 X207.69 Y104.972 E.50624
G3 X205.71 Y100.096 I5.021 J-4.879 E.16577
G1 X205.71 Y88.501 E.3563
G3 X213.057 Y81.519 I6.992 J.001 E.34838
G3 X219.692 Y88.172 I-.38 J7.013 E.31628
G3 X220.406 Y88.009 I.821 J1.945 E.0226
G1 X227.45 Y88.01 E.21646
G3 X228.689 Y89.25 I-.062 J1.301 E.05907
G1 X228.69 Y97.294 E.24717
G3 X227.394 Y98.589 I-1.293 J.002 E.06256
G1 X220.404 Y98.589 E.21478
G3 X219.746 Y98.461 I.12 J-2.367 E.02066
; WIPE_START
M204 S6000
G1 X219.69 Y100.097 E-.62199
G1 X219.676 Y100.459 E-.13801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.877 Y101.747 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545394
G1 F7164.56
M204 S6000
G1 X218.557 Y101.95 E.01552
; LINE_WIDTH: 0.526767
G1 F7440.366
G1 X218.538 Y102.067 E.00467
; LINE_WIDTH: 0.488416
G1 F8080.885
G1 X218.519 Y102.184 E.0043
; LINE_WIDTH: 0.447443
G1 F8899.387
G1 X218.436 Y102.634 E.01509
; LINE_WIDTH: 0.403854
G1 F9974.121
G1 X218.353 Y103.084 E.01346
; WIPE_START
G1 X218.436 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X225.079 Y98.875 Z2.4 F42000
G1 X227.287 Y97.626 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42755
G1 F9359.644
M204 S6000
G1 X227.529 Y97.384 E.01074
G2 X227.558 Y97.25 I-.195 J-.112 E.00437
G1 X227.558 Y96.811 E.01374
G1 X226.912 Y97.457 E.0286
G1 X226.368 Y97.457 E.01705
G1 X227.557 Y96.267 E.05271
G1 X227.557 Y95.724 E.01705
G1 X225.824 Y97.457 E.07681
G1 X225.281 Y97.457 E.01705
G1 X227.557 Y95.18 E.10092
G1 X227.557 Y94.636 E.01705
G1 X224.737 Y97.457 E.12503
G1 X224.193 Y97.457 E.01705
G1 X227.557 Y94.092 E.14913
G1 X227.557 Y93.548 E.01705
G1 X223.649 Y97.457 E.17324
G1 X223.105 Y97.457 E.01705
G1 X227.557 Y93.004 E.19735
G1 X227.557 Y92.46 E.01705
M73 P73 R6
G1 X222.561 Y97.457 E.22145
G1 X222.017 Y97.457 E.01705
G1 X227.557 Y91.916 E.24556
G1 X227.557 Y91.373 E.01705
G1 X221.473 Y97.457 E.26967
G1 X220.929 Y97.457 E.01705
G1 X227.557 Y90.829 E.29377
G1 X227.557 Y90.285 E.01705
G1 X220.39 Y97.452 E.31768
G1 X219.958 Y97.34 E.01398
G1 X227.557 Y89.741 E.33681
G1 X227.556 Y89.327 E.01297
G2 X227.53 Y89.224 I-.142 J-.018 E.00343
G1 X219.531 Y97.222 E.35454
G1 X219.104 Y97.105 E.01387
G1 X227.067 Y89.142 E.35296
G1 X226.523 Y89.142 E.01705
G1 X218.841 Y96.825 E.34053
G1 X218.841 Y96.281 E.01704
G1 X225.98 Y89.142 E.31643
G1 X225.436 Y89.142 E.01705
G1 X218.84 Y95.737 E.29233
G1 X218.84 Y95.194 E.01704
G1 X224.892 Y89.142 E.26823
G1 X224.348 Y89.142 E.01705
G1 X218.84 Y94.65 E.24414
G1 X218.84 Y94.106 E.01704
G1 X223.804 Y89.142 E.22004
G1 X223.26 Y89.142 E.01705
G1 X218.84 Y93.562 E.19594
G1 X218.84 Y93.018 E.01704
G1 X222.716 Y89.142 E.17184
G1 X222.173 Y89.142 E.01705
G1 X218.839 Y92.475 E.14774
G1 X218.839 Y91.931 E.01704
G1 X221.629 Y89.141 E.12364
G1 X221.085 Y89.141 E.01705
G1 X218.839 Y91.387 E.09954
G1 X218.839 Y90.843 E.01704
G1 X220.541 Y89.141 E.07545
G2 X220.342 Y89.153 I-.047 J.867 E.00627
G1 X219.817 Y89.322 E.01729
G1 X218.669 Y90.469 E.05086
M204 S10000
G1 X218.769 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136203
G1 F15000
M204 S6000
G1 X218.753 Y89.229 E.00223
; LINE_WIDTH: 0.110007
G1 X218.738 Y88.936 E.0016
; WIPE_START
G1 X218.753 Y89.229 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X213.419 Y94.688 Z2.4 F42000
G1 X206.523 Y101.746 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.540725
G1 F7231.759
M204 S6000
G1 X206.843 Y101.95 E.0154
G1 X206.862 Y102.067 E.00482
; LINE_WIDTH: 0.488317
G1 F8082.675
G1 X206.881 Y102.184 E.00431
; LINE_WIDTH: 0.447381
G1 F8900.732
G1 X206.964 Y102.634 E.01508
; LINE_WIDTH: 0.403944
G1 F9971.654
G1 X207.047 Y103.084 E.01346
; OBJECT_ID: 6
; WIPE_START
G1 X206.964 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X199.549 Y100.824 Z2.4 F42000
G1 X185.491 Y97.393 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X185.486 Y100.336 I-76.657 J1.348 E.09764
G3 X185.328 Y101.51 I-6.633 J-.297 E.03937
G1 X185.109 Y101.487 E.00729
G1 X185.109 Y88.489 E.43116
G2 X173.491 Y88.489 I-5.809 J.011 E.60465
G1 X173.491 Y101.487 E.43116
G1 X173.272 Y101.51 E.00729
G3 X173.109 Y100.089 I6.799 J-1.5 E.04754
G1 X173.109 Y88.509 E.38412
G3 X179.614 Y82.317 I6.193 J-.008 E.33329
G3 X185.443 Y87.735 I-.316 J6.185 E.28669
G1 X185.6 Y89.234 E.05
G1 X186.871 Y88.826 E.04427
G3 X187.028 Y88.808 I.149 J.597 E.00525
G1 X194.019 Y88.809 E.23192
G3 X194.49 Y89.28 I-.023 J.494 E.02421
G1 X194.491 Y97.269 E.26503
G3 X193.97 Y97.79 I-.495 J.025 E.02752
G1 X187.019 Y97.79 E.23059
G3 X186.894 Y97.777 I-.003 J-.603 E.00416
G1 X185.549 Y97.408 E.04628
M204 S10000
G1 X185.898 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X185.893 Y100.351 I-63.241 J1.083 E.08044
G3 X184.879 Y103.619 I-6.717 J-.293 E.11474
G1 X184.702 Y103.568 E.00612
G1 X184.702 Y88.493 E.50006
G2 X173.898 Y88.493 I-5.402 J.007 E.56248
G1 X173.898 Y103.567 E.50002
G1 X173.72 Y103.617 E.00613
G3 X172.702 Y100.093 I5.593 J-3.524 E.1233
G1 X172.702 Y88.505 E.38438
G3 X179.636 Y81.91 I6.6 J-.003 E.3551
G3 X185.847 Y87.684 I-.339 J6.592 E.30549
G1 X185.953 Y88.693 E.03365
G1 X186.762 Y88.434 E.02819
G3 X187.017 Y88.401 I.258 J1.006 E.00854
G1 X194.035 Y88.402 E.23282
G3 X194.897 Y89.264 I-.043 J.905 E.04433
G1 X194.898 Y97.281 E.26596
G3 X193.982 Y98.197 I-.901 J.015 E.04793
G1 X187.011 Y98.197 E.23124
G3 X186.803 Y98.174 I.006 J-1.036 E.00698
G1 X185.956 Y97.942 E.02912
M204 S250
G1 X186.29 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X186.27 Y100.633 I-28.749 J.828 E.06738
G3 X184.31 Y104.972 I-6.983 J-.541 E.14928
G1 X184.31 Y88.497 E.50624
G2 X174.29 Y88.497 I-5.01 J.004 E.48341
G1 X174.29 Y104.972 E.50624
G3 X172.31 Y100.097 I5.021 J-4.879 E.16577
G1 X172.31 Y88.501 E.3563
G3 X179.657 Y81.519 I6.992 J.001 E.34838
G3 X186.292 Y88.172 I-.38 J7.013 E.31628
G3 X187.006 Y88.009 I.821 J1.946 E.0226
G1 X194.05 Y88.01 E.21646
G3 X195.289 Y89.248 I-.062 J1.301 E.05901
G1 X195.29 Y97.293 E.24718
G3 X193.994 Y98.589 I-1.293 J.003 E.06261
G1 X187.004 Y98.589 E.21478
G3 X186.346 Y98.461 I.121 J-2.369 E.02066
; WIPE_START
M204 S6000
G1 X186.29 Y100.096 E-.62198
G1 X186.276 Y100.459 E-.13802
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.479 Y101.742 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.497538
G1 F7918.748
M204 S6000
G1 X185.318 Y101.845 E.0071
; LINE_WIDTH: 0.516566
G1 F7600.622
G1 X185.157 Y101.949 E.00739
G1 X185.118 Y102.186 E.00927
; LINE_WIDTH: 0.44676
G1 F8914.419
G1 X185.036 Y102.635 E.01502
; LINE_WIDTH: 0.403667
G1 F9979.302
G1 X184.953 Y103.084 E.01342
; WIPE_START
G1 X185.036 Y102.635 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X191.678 Y98.876 Z2.4 F42000
G1 X193.887 Y97.626 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42755
G1 F9359.644
M204 S6000
G1 X194.129 Y97.384 E.01074
G2 X194.158 Y97.243 I-.2 J-.114 E.00457
G1 X194.158 Y96.811 E.01354
G1 X193.512 Y97.457 E.0286
G1 X192.968 Y97.457 E.01705
G1 X194.157 Y96.267 E.05271
G1 X194.157 Y95.724 E.01705
G1 X192.424 Y97.457 E.07681
G1 X191.881 Y97.457 E.01705
G1 X194.157 Y95.18 E.10092
G1 X194.157 Y94.636 E.01705
G1 X191.337 Y97.457 E.12503
G1 X190.793 Y97.457 E.01705
G1 X194.157 Y94.092 E.14913
G1 X194.157 Y93.548 E.01705
G1 X190.249 Y97.457 E.17324
G1 X189.705 Y97.457 E.01705
G1 X194.157 Y93.004 E.19735
G1 X194.157 Y92.46 E.01705
G1 X189.161 Y97.457 E.22145
G1 X188.617 Y97.457 E.01705
G1 X194.157 Y91.916 E.24556
G1 X194.157 Y91.373 E.01705
G1 X188.073 Y97.457 E.26967
G1 X187.529 Y97.457 E.01705
G1 X194.157 Y90.829 E.29377
G1 X194.157 Y90.285 E.01705
G1 X186.99 Y97.452 E.31768
G1 X186.558 Y97.34 E.01398
G1 X194.157 Y89.741 E.33681
G1 X194.156 Y89.317 E.01329
G2 X194.128 Y89.226 I-.135 J-.008 E.00307
G1 X186.131 Y97.223 E.35447
G1 X185.704 Y97.105 E.01387
G1 X193.667 Y89.142 E.35296
G1 X193.123 Y89.142 E.01705
G1 X185.441 Y96.825 E.34053
G1 X185.441 Y96.281 E.01704
G1 X192.58 Y89.142 E.31643
G1 X192.036 Y89.142 E.01705
G1 X185.44 Y95.737 E.29233
G1 X185.44 Y95.194 E.01704
G1 X191.492 Y89.142 E.26823
G1 X190.948 Y89.142 E.01705
G1 X185.44 Y94.65 E.24414
G1 X185.44 Y94.106 E.01704
G1 X190.404 Y89.142 E.22004
G1 X189.86 Y89.142 E.01705
G1 X185.44 Y93.562 E.19594
G1 X185.44 Y93.018 E.01704
G1 X189.316 Y89.142 E.17184
G1 X188.773 Y89.142 E.01705
G1 X185.439 Y92.475 E.14774
G1 X185.439 Y91.931 E.01704
G1 X188.229 Y89.141 E.12364
G1 X187.685 Y89.141 E.01705
G1 X185.439 Y91.387 E.09954
G1 X185.439 Y90.843 E.01704
G1 X187.141 Y89.141 E.07545
G2 X186.941 Y89.153 I-.047 J.865 E.00628
G1 X186.417 Y89.322 E.01727
G1 X185.269 Y90.469 E.05086
M204 S10000
G1 X185.369 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136279
G1 F15000
M204 S6000
G1 X185.354 Y89.228 E.00223
; LINE_WIDTH: 0.110037
G1 X185.338 Y88.935 E.00161
; WIPE_START
G1 X185.354 Y89.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X180.019 Y94.687 Z2.4 F42000
G1 X173.122 Y101.744 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.541009
G1 F7227.625
M204 S6000
G1 X173.443 Y101.95 E.01548
G1 X173.462 Y102.067 E.00481
; LINE_WIDTH: 0.488441
G1 F8080.437
G1 X173.481 Y102.184 E.0043
; LINE_WIDTH: 0.447484
G1 F8898.483
G1 X173.564 Y102.634 E.01509
; LINE_WIDTH: 0.40393
G1 F9972.023
G1 X173.647 Y103.084 E.01346
; OBJECT_ID: 5
; WIPE_START
G1 X173.564 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X166.149 Y100.824 Z2.4 F42000
G1 X152.091 Y97.392 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.091 Y100.389 E.09942
G3 X151.927 Y101.778 I-6.64 J-.078 E.04649
G1 X151.709 Y101.755 E.00727
G1 X151.709 Y88.189 E.44999
G2 X140.691 Y88.189 I-5.509 J.011 E.57342
G1 X140.691 Y101.755 E.44999
G1 X140.473 Y101.778 E.00727
G3 X140.309 Y100.389 I6.474 J-1.467 E.04649
G1 X140.309 Y88.209 E.40403
G3 X146.496 Y82.316 I5.893 J-.008 E.31705
G3 X152.07 Y87.702 I-.308 J5.895 E.28047
G1 X152.169 Y89.234 E.05091
G1 X153.508 Y88.817 E.04651
G3 X153.628 Y88.808 I.11 J.632 E.00399
G1 X160.619 Y88.809 E.2319
G3 X161.09 Y89.28 I-.023 J.494 E.02422
G1 X161.091 Y97.279 E.26536
G3 X160.57 Y97.79 I-.495 J.016 E.02718
G1 X153.619 Y97.79 E.23059
G3 X153.494 Y97.777 I-.003 J-.6 E.00416
G1 X152.149 Y97.408 E.04629
M204 S10000
G1 X152.498 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X152.493 Y100.645 I-69.423 J1.234 E.0902
G3 X151.478 Y103.833 I-6.411 J-.285 E.11229
G1 X151.302 Y103.782 E.00608
G1 X151.302 Y88.193 E.51711
G2 X141.098 Y88.193 I-5.102 J.007 E.53126
G1 X141.098 Y103.782 E.51711
G1 X140.922 Y103.833 E.00608
G3 X139.902 Y100.393 I5.296 J-3.442 E.12069
G1 X139.902 Y88.205 E.4043
G3 X146.518 Y81.91 I6.3 J-.003 E.33886
G3 X152.475 Y87.667 I-.331 J6.303 E.29976
G1 X152.542 Y88.691 E.03404
G1 X153.368 Y88.432 E.0287
G3 X153.617 Y88.401 I.247 J.966 E.00836
G1 X160.635 Y88.402 E.23281
G3 X161.497 Y89.264 I-.043 J.905 E.04434
G1 X161.498 Y97.287 E.26615
G3 X160.582 Y98.197 I-.901 J.009 E.04773
G1 X153.611 Y98.197 E.23124
G3 X153.403 Y98.174 I.006 J-1.034 E.00698
G1 X152.556 Y97.942 E.02913
M204 S250
G1 X152.89 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.885 Y100.66 I-56.68 J.978 E.06822
G3 X150.91 Y105.149 I-6.747 J-.29 E.1542
G1 X150.91 Y88.197 E.52089
G2 X141.49 Y88.197 I-4.71 J.003 E.45448
G1 X141.49 Y105.149 E.52089
G3 X139.51 Y100.397 I4.72 J-4.755 E.16235
G1 X139.51 Y88.201 E.37474
G3 X146.539 Y81.518 I6.692 J.001 E.33334
G3 X152.901 Y88.167 I-.35 J6.703 E.31155
G3 X153.606 Y88.009 I.805 J1.936 E.02232
G1 X160.65 Y88.01 E.21646
G3 X161.889 Y89.249 I-.062 J1.301 E.05902
G1 X161.89 Y97.295 E.24724
G3 X160.594 Y98.589 I-1.293 J.001 E.06254
G1 X153.604 Y98.589 E.21478
G3 X152.946 Y98.461 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X152.89 Y100.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.076 Y102.012 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.527744
G1 F7425.384
M204 S6000
G1 X151.755 Y102.215 E.01501
; LINE_WIDTH: 0.524123
G1 F7481.252
G1 X151.737 Y102.321 E.00418
; LINE_WIDTH: 0.488828
G1 F8073.421
G1 X151.72 Y102.426 E.00388
; LINE_WIDTH: 0.449446
G1 F8855.526
G1 X151.637 Y102.867 E.01487
; LINE_WIDTH: 0.405989
G1 F9915.482
G1 X151.554 Y103.308 E.01328
; WIPE_START
G1 X151.637 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X158.204 Y98.977 Z2.4 F42000
G1 X160.485 Y97.626 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42761
G1 F9358.184
M204 S6000
G2 X160.745 Y97.35 I-.744 J-.963 E.01195
G2 X160.758 Y97.263 I-.188 J-.071 E.00279
G1 X160.758 Y96.809 E.01421
G1 X160.11 Y97.457 E.02869
G1 X159.566 Y97.457 E.01705
G1 X160.757 Y96.265 E.05281
G1 X160.757 Y95.721 E.01705
G1 X159.022 Y97.457 E.07692
G1 X158.478 Y97.457 E.01705
G1 X160.757 Y95.177 E.10104
G1 X160.757 Y94.634 E.01705
G1 X157.934 Y97.457 E.12515
G1 X157.39 Y97.457 E.01705
G1 X160.757 Y94.09 E.14927
G1 X160.757 Y93.546 E.01705
G1 X156.846 Y97.457 E.17338
G1 X156.302 Y97.457 E.01705
G1 X160.757 Y93.002 E.19749
G1 X160.757 Y92.458 E.01705
G1 X155.758 Y97.457 E.22161
G1 X155.214 Y97.457 E.01705
G1 X160.757 Y91.914 E.24572
G1 X160.757 Y91.37 E.01705
G1 X154.67 Y97.457 E.26984
G1 X154.126 Y97.457 E.01705
G1 X160.757 Y90.826 E.29395
G1 X160.757 Y90.282 E.01705
G1 X153.587 Y97.452 E.31785
G1 X153.156 Y97.339 E.01397
G1 X160.757 Y89.738 E.33696
G1 X160.756 Y89.318 E.01316
G2 X160.728 Y89.222 I-.144 J-.01 E.0032
G1 X152.729 Y97.222 E.35464
G1 X152.302 Y97.105 E.01388
G1 X160.264 Y89.142 E.35297
G1 X159.72 Y89.142 E.01705
G1 X152.042 Y96.82 E.34036
G1 X152.042 Y96.276 E.01705
G1 X159.176 Y89.142 E.31625
G1 X158.632 Y89.142 E.01705
G1 X152.042 Y95.732 E.29213
G1 X152.042 Y95.188 E.01705
G1 X158.088 Y89.142 E.26802
G1 X157.544 Y89.142 E.01705
G1 X152.042 Y94.644 E.24391
G1 X152.042 Y94.1 E.01705
G1 X157 Y89.142 E.21979
G1 X156.456 Y89.142 E.01705
G1 X152.042 Y93.556 E.19568
G1 X152.042 Y93.012 E.01705
G1 X155.912 Y89.142 E.17156
G1 X155.368 Y89.142 E.01705
G1 X152.042 Y92.468 E.14745
G1 X152.042 Y91.924 E.01705
G1 X154.824 Y89.142 E.12334
G1 X154.281 Y89.141 E.01705
G1 X152.042 Y91.38 E.09922
G1 X152.042 Y90.836 E.01705
G1 X153.737 Y89.141 E.07511
G2 X153.543 Y89.153 I-.045 J.869 E.0061
G1 X153.016 Y89.318 E.0173
G1 X151.873 Y90.461 E.05069
M204 S10000
G1 X151.948 Y89.516 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104318
G1 F15000
M204 S6000
G1 X151.939 Y89.226 E.00145
; WIPE_START
G1 X151.948 Y89.516 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.75 Y95.104 Z2.4 F42000
G1 X140.324 Y102.012 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.526932
G1 F7437.832
M204 S6000
G1 X140.645 Y102.215 E.01499
G1 X140.663 Y102.321 E.00421
; LINE_WIDTH: 0.488821
G1 F8073.546
G1 X140.68 Y102.426 E.00388
; LINE_WIDTH: 0.449416
G1 F8856.187
G1 X140.763 Y102.867 E.01487
; LINE_WIDTH: 0.405927
G1 F9917.18
G1 X140.846 Y103.308 E.01328
; OBJECT_ID: 4
; WIPE_START
G1 X140.763 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X133.367 Y100.981 Z2.4 F42000
G1 X119.291 Y97.393 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.291 Y100.589 E.10603
G3 X119.126 Y101.954 I-6.298 J-.068 E.04568
G1 X118.909 Y101.929 E.00724
G1 X118.909 Y87.99 E.46239
G2 X108.291 Y87.99 I-5.309 J.011 E.55255
G1 X108.291 Y101.929 E.46239
G1 X108.074 Y101.954 E.00724
G3 X107.909 Y100.589 I6.134 J-1.433 E.04568
G1 X107.909 Y88.01 E.41728
G3 X113.889 Y82.316 I5.693 J-.007 E.30641
G3 X119.282 Y87.678 I-.292 J5.686 E.27623
G1 X119.337 Y89.193 E.0503
G1 X120.727 Y88.815 E.04777
G3 X120.819 Y88.809 I.087 J.611 E.00306
G1 X127.809 Y88.81 E.23188
G3 X128.29 Y89.281 I-.012 J.493 E.02455
G1 X128.291 Y97.28 E.26536
G3 X127.77 Y97.79 I-.495 J.016 E.02718
G1 X120.819 Y97.79 E.23059
G3 X120.695 Y97.778 I-.003 J-.603 E.00416
G1 X119.349 Y97.409 E.0463
M204 S10000
G1 X119.698 Y97.927 F42000
G1 F8843.478
M204 S6000
M73 P74 R6
G1 X119.698 Y100.593 E.08846
G3 X118.677 Y103.976 I-6.116 J-.001 E.11889
G1 X118.502 Y103.924 E.00605
G1 X118.502 Y87.994 E.52843
G2 X108.698 Y87.994 I-4.902 J.007 E.51038
G1 X108.698 Y103.924 E.52843
G1 X108.523 Y103.976 E.00605
G3 X107.502 Y100.593 I5.095 J-3.383 E.11889
G1 X107.502 Y88.006 E.41756
G3 X113.91 Y81.91 I6.101 J-.003 E.32817
G3 X119.688 Y87.655 I-.313 J6.093 E.29598
G1 X119.725 Y88.665 E.03352
G1 X120.603 Y88.424 E.03018
G3 X120.811 Y88.402 I.215 J1.015 E.00697
G1 X127.829 Y88.403 E.2328
G3 X128.697 Y89.264 I-.036 J.904 E.04454
G1 X128.698 Y97.288 E.26615
G3 X127.782 Y98.198 I-.901 J.009 E.04773
G1 X120.811 Y98.198 E.23124
G3 X120.603 Y98.175 I.006 J-1.037 E.00698
G1 X119.756 Y97.942 E.02913
M204 S250
G1 X120.09 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X120.085 Y100.857 I-60.755 J1.078 E.07426
G3 X118.11 Y105.265 I-6.545 J-.286 E.152
G1 X118.11 Y87.997 E.53059
G2 X109.09 Y87.997 I-4.51 J.003 E.43515
G1 X109.09 Y105.265 E.53059
G3 X107.11 Y100.597 I4.52 J-4.671 E.16005
G1 X107.11 Y88.002 E.38703
G3 X113.93 Y81.518 I6.493 J.001 E.3234
G3 X120.099 Y88.156 I-.351 J6.512 E.30784
G3 X120.804 Y88.01 I.823 J2.197 E.02222
G1 X127.848 Y88.011 E.21646
G3 X129.089 Y89.249 I-.059 J1.299 E.05909
G1 X129.09 Y97.295 E.24725
G3 X127.794 Y98.59 I-1.293 J.001 E.06254
G1 X120.804 Y98.59 E.21478
G3 X120.146 Y98.461 I.12 J-2.363 E.02066
; WIPE_START
M204 S6000
G1 X120.095 Y100.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.275 Y102.187 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.518622
G1 F7567.773
M204 S6000
G1 X118.954 Y102.389 E.0147
; LINE_WIDTH: 0.523029
G1 F7498.301
G1 X118.937 Y102.488 E.00393
; LINE_WIDTH: 0.489303
G1 F8064.824
G1 X118.92 Y102.587 E.00365
; LINE_WIDTH: 0.450785
G1 F8826.452
G1 X118.837 Y103.022 E.01472
; LINE_WIDTH: 0.407475
G1 F9875.054
G1 X118.754 Y103.457 E.01316
; WIPE_START
G1 X118.837 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.241 Y98.869 Z2.4 F42000
G1 X127.155 Y97.627 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42096
G1 F9522.802
M204 S6000
G1 X127.958 Y96.824 E.03498
G1 X127.957 Y96.289 E.01647
G1 X126.79 Y97.457 E.05087
G1 X126.255 Y97.457 E.01647
G1 X127.957 Y95.755 E.07416
G1 X127.957 Y95.22 E.01647
G1 X125.721 Y97.457 E.09745
G1 X125.186 Y97.457 E.01647
G1 X127.957 Y94.686 E.12074
G1 X127.957 Y94.151 E.01647
G1 X124.651 Y97.457 E.14402
G1 X124.117 Y97.457 E.01647
G1 X127.957 Y93.617 E.16731
G1 X127.957 Y93.082 E.01647
G1 X123.582 Y97.457 E.1906
G1 X123.047 Y97.457 E.01647
G1 X127.957 Y92.548 E.21389
G1 X127.957 Y92.013 E.01647
G1 X122.513 Y97.457 E.23718
G1 X121.978 Y97.457 E.01647
G1 X127.957 Y91.479 E.26046
G1 X127.957 Y90.944 E.01647
G1 X121.443 Y97.457 E.28375
G1 X120.909 Y97.457 E.01647
G1 X127.957 Y90.409 E.30704
G1 X127.957 Y89.875 E.01647
G1 X120.463 Y97.369 E.32648
G1 X120.043 Y97.254 E.0134
G1 X127.956 Y89.34 E.34475
G2 X127.771 Y89.143 I-.179 J-.017 E.00944
G1 X127.619 Y89.143 E.00468
G1 X119.624 Y97.138 E.34832
G1 X119.242 Y97.034 E.01218
G1 X119.242 Y96.985 E.0015
G1 X127.085 Y89.143 E.34165
G1 X126.55 Y89.143 E.01647
G1 X119.242 Y96.45 E.31836
G1 X119.242 Y95.916 E.01647
G1 X126.015 Y89.143 E.29507
G1 X125.481 Y89.143 E.01647
G1 X119.242 Y95.381 E.27178
G1 X119.242 Y94.847 E.01647
G1 X124.946 Y89.143 E.2485
G1 X124.412 Y89.143 E.01647
G1 X119.242 Y94.312 E.22521
G1 X119.242 Y93.777 E.01647
G1 X123.877 Y89.142 E.20192
G1 X123.343 Y89.142 E.01647
G1 X119.242 Y93.243 E.17863
G1 X119.242 Y92.708 E.01647
G1 X122.808 Y89.142 E.15535
G1 X122.274 Y89.142 E.01647
G1 X119.242 Y92.173 E.13206
G1 X119.242 Y91.639 E.01647
G1 X121.739 Y89.142 E.10877
G1 X121.205 Y89.142 E.01647
G1 X119.242 Y91.104 E.08548
G1 X119.242 Y90.57 E.01647
G1 X120.627 Y89.185 E.06031
G1 X119.89 Y89.387 E.02354
G1 X119.073 Y90.205 E.0356
; WIPE_START
G1 X119.89 Y89.387 E-.43918
G1 X120.627 Y89.185 E-.29034
G1 X120.57 Y89.242 E-.03048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.237 Y94.702 Z2.4 F42000
G1 X107.925 Y102.188 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.519529
G1 F7553.375
M204 S6000
G1 X108.246 Y102.389 E.01473
G1 X108.263 Y102.488 E.00389
; LINE_WIDTH: 0.489315
G1 F8064.619
G1 X108.28 Y102.587 E.00365
; LINE_WIDTH: 0.450815
G1 F8825.8
G1 X108.362 Y103.02 E.01467
; LINE_WIDTH: 0.407525
G1 F9873.7
G1 X108.445 Y103.454 E.01311
; OBJECT_ID: 2
; WIPE_START
G1 X108.362 Y103.02 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X108.259 Y95.389 Z2.4 F42000
G1 X107.85 Y65.241 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X107.662 Y64.719 E.01839
G3 X107.291 Y62.41 I7.152 J-2.333 E.07792
G1 X107.291 Y39.39 E.76359
G3 X114.79 Y31.891 I7.526 J.026 E.39041
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.022 J7.522 E.39046
G1 X175.809 Y62.41 E.76359
G3 X168.31 Y69.909 I-7.523 J-.023 E.39045
G1 X114.787 Y69.909 E1.77543
G3 X107.876 Y65.295 I.026 J-7.523 E.29204
M204 S10000
G1 X108.23 Y65.093 F42000
G1 F8843.478
M204 S6000
G1 X107.967 Y64.327 E.02686
G3 X107.698 Y62.406 I6.846 J-1.94 E.06455
G1 X107.698 Y39.394 E.76333
G3 X114.794 Y32.298 I7.118 J.022 E.36946
G1 X168.306 Y32.298 E1.77507
G3 X175.402 Y39.394 I-.018 J7.114 E.36951
G1 X175.402 Y62.406 E.76333
G3 X168.306 Y69.502 I-7.115 J-.019 E.3695
G1 X114.792 Y69.502 E1.77514
G3 X108.255 Y65.147 I.021 J-7.115 E.27603
M204 S250
G1 X108.6 Y64.965 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X108.345 Y64.221 E.02417
G3 X108.09 Y62.402 I6.468 J-1.833 E.0566
G1 X108.09 Y39.398 E.70685
G3 X114.798 Y32.69 I6.725 J.017 E.32354
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.014 J6.721 E.32359
G1 X175.01 Y62.402 E.70685
G3 X168.302 Y69.11 I-6.722 J-.015 E.32357
G1 X114.797 Y69.11 E1.64405
G3 X108.626 Y65.017 I.015 J-6.722 E.24099
; WIPE_START
M204 S6000
G1 X108.345 Y64.221 E-.32094
G1 X108.219 Y63.709 E-.20013
G1 X108.136 Y63.188 E-.2003
G1 X108.13 Y63.087 E-.03863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.2 Y58.459 Z2.4 F42000
G1 X149.541 Y31.509 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I-.005 J7.906 E.41161
G1 X176.191 Y62.39 E.76229
G3 X168.287 Y70.291 I-7.91 J-.009 E.41165
G1 X114.81 Y70.291 E1.77394
G3 X106.909 Y62.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E.76229
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.53 E.16518
G3 X134.078 Y26.009 I.495 J-.025 E.02747
G1 X149.031 Y26.009 E.49601
G3 X149.541 Y26.52 I.016 J.494 E.02684
G1 X149.541 Y31.449 E.16351
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.01 J8.314 E.43254
G1 X176.598 Y62.394 E.76256
G3 X168.292 Y70.698 I-8.317 J-.013 E.43254
G1 X114.806 Y70.698 E1.77425
G3 X106.502 Y62.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E.76256
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.518 E.15207
G3 X134.067 Y25.602 I.903 J-.013 E.04788
G1 X149.044 Y25.602 E.4968
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
G1 X176.99 Y62.398 E.7066
G3 X168.297 Y71.09 I-8.71 J-.018 E.41932
G1 X114.802 Y71.09 E1.64376
G3 X106.11 Y62.398 I.014 J-8.706 E.41935
G1 X106.11 Y39.402 E.7066
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.506 E.12917
G3 X134.056 Y25.21 I1.296 J-.001 E.06257
G1 X149.056 Y25.21 E.4609
G3 X150.34 Y26.504 I-.008 J1.292 E.06217
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.149 Y31.499 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X149.147 Y26.564 E.15163
G1 X149.106 Y26.445 E.00388
G1 X148.949 Y26.401 E.005
G1 X134.044 Y26.411 E.45797
G1 X133.956 Y26.511 E.00409
G1 X133.951 Y31.499 E.15326
G1 X149.089 Y31.499 E.46512
M204 S10000
G1 X136.499 Y29.189 F42000
; LINE_WIDTH: 0.51544
G1 F7618.731
M204 S6000
G1 X146.837 Y29.188 E.39807
G1 X146.837 Y28.714 E.01826
G1 X136.263 Y28.719 E.40712
G1 X136.263 Y29.189 E.01813
G1 X136.439 Y29.189 E.00677
M204 S10000
G1 X135.838 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.263 Y29.613 E.35102
G1 X147.262 Y28.288 E.04073
G1 X135.84 Y28.295 E.35096
G1 X135.839 Y29.553 E.03867
M204 S10000
G1 X135.461 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X147.64 Y29.991 E.37421
G1 X147.639 Y27.911 E.06391
G1 X135.463 Y27.918 E.37412
G1 X135.461 Y29.931 E.06184
M204 S10000
G1 X135.084 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X148.017 Y30.368 E.3974
G1 X148.016 Y27.533 E.08709
G1 X135.086 Y27.541 E.39727
G1 X135.084 Y30.308 E.085
M204 S10000
G1 X134.706 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X148.394 Y30.745 E.42059
G1 X148.393 Y27.156 E.11027
G1 X134.71 Y27.164 E.42043
G1 X134.706 Y30.685 E.10817
M204 S10000
G1 X134.329 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X148.772 Y31.122 E.44378
G1 X148.77 Y26.779 E.13345
G1 X134.333 Y26.787 E.44358
M73 P75 R6
G1 X134.329 Y31.062 E.13133
; OBJECT_ID: 8
; WIPE_START
G1 X134.331 Y29.062 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X129.701 Y35.13 Z2.4 F42000
G1 X38.791 Y154.292 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X38.786 Y157.051 I-69.881 J1.248 E.09153
G3 X38.628 Y158.227 I-6.485 J-.274 E.03941
G1 X38.409 Y158.204 E.00729
G1 X38.409 Y145.59 E.41844
G2 X26.391 Y145.59 I-6.009 J.011 E.62552
G1 X26.391 Y158.209 E.4186
G1 X26.173 Y158.232 E.00727
G3 X26.009 Y156.789 I7.017 J-1.528 E.04826
G1 X26.009 Y145.61 E.37084
G3 X32.565 Y139.211 I6.403 J.002 E.33862
G3 X38.721 Y144.657 I-.168 J6.393 E.29612
G1 X38.912 Y146.141 E.04965
G1 X40.204 Y145.719 E.0451
G3 X40.33 Y145.708 I.115 J.63 E.00419
G1 X47.27 Y145.708 E.23022
G3 X47.791 Y146.229 I.025 J.495 E.02752
G1 X47.787 Y154.257 E.26631
G3 X47.28 Y154.69 I-.5 J-.072 E.02414
G1 X40.319 Y154.69 E.23092
G3 X40.194 Y154.678 I-.003 J-.603 E.00416
G1 X38.849 Y154.308 E.04629
M204 S10000
G1 X39.198 Y154.826 F42000
G1 F8843.478
M204 S6000
G3 X39.193 Y157.067 I-56.787 J.983 E.07435
G3 X38.182 Y160.374 I-6.834 J-.28 E.11596
G1 X38.002 Y160.325 E.00619
G1 X38.002 Y145.593 E.48868
G2 X26.798 Y145.593 I-5.602 J.007 E.58335
G1 X26.798 Y160.325 E.48868
G1 X26.618 Y160.374 E.00619
G3 X25.602 Y156.793 I5.922 J-3.615 E.12501
G1 X25.602 Y145.605 E.37112
G3 X32.575 Y138.804 I6.811 J.007 E.36004
G3 X39.123 Y144.597 I-.179 J6.8 E.31498
G1 X39.253 Y145.6 E.03356
G1 X40.057 Y145.335 E.02808
G3 X40.318 Y145.301 I.258 J.961 E.00876
G1 X47.282 Y145.301 E.23102
G3 X48.198 Y146.217 I.015 J.901 E.04793
G1 X48.197 Y154.234 E.26595
G3 X47.288 Y155.097 I-.903 J-.041 E.04593
G1 X40.311 Y155.097 E.23143
G3 X40.102 Y155.075 I.006 J-1.038 E.00698
G1 X39.256 Y154.842 E.02913
M204 S250
G1 X39.59 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X39.568 Y157.366 I-25.706 J.728 E.06227
G3 X37.61 Y161.753 I-7.248 J-.605 E.15041
G1 X37.61 Y145.597 E.49641
G2 X27.19 Y145.597 I-5.21 J.003 E.50274
G1 X27.19 Y161.753 E.49641
G3 X25.21 Y156.797 I5.276 J-4.981 E.16791
G1 X25.21 Y145.601 E.34401
G3 X32.585 Y138.412 I7.203 J.012 E.35261
G3 X39.581 Y145.079 I-.208 J7.222 E.32528
G3 X40.306 Y144.909 I.827 J1.893 E.02302
G1 X47.294 Y144.909 E.21471
G3 X48.59 Y146.205 I.003 J1.293 E.06261
G1 X48.589 Y154.25 E.24718
G3 X47.296 Y155.489 I-1.295 J-.057 E.06076
G1 X40.304 Y155.489 E.21484
G3 X39.646 Y155.361 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X39.59 Y156.797 E-.54619
G1 X39.568 Y157.359 E-.21381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.496 Y158.418 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.532922
G1 F7346.916
M204 S6000
G1 X38.443 Y158.773 E.01434
; LINE_WIDTH: 0.495919
G1 F7947.04
G1 X38.421 Y158.899 E.00473
; LINE_WIDTH: 0.453173
G1 F8775.073
G1 X38.4 Y159.026 E.00428
; LINE_WIDTH: 0.407767
G1 F9867.169
G1 X38.322 Y159.436 E.01243
; LINE_WIDTH: 0.359722
G1 F11363.561
G1 X38.244 Y159.847 E.0108
; WIPE_START
G1 X38.322 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X44.998 Y155.737 Z2.4 F42000
G1 X47.184 Y154.527 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42718
G1 F9368.656
M204 S6000
G2 X47.434 Y154.267 I-.772 J-.995 E.01132
G1 X47.456 Y154.177 E.00292
G1 X47.457 Y153.71 E.01461
G1 X46.81 Y154.357 E.02863
G1 X46.266 Y154.357 E.01702
G1 X47.457 Y153.167 E.0527
G1 X47.457 Y152.623 E.01702
G1 X45.723 Y154.357 E.07677
G1 X45.18 Y154.357 E.01702
G1 X47.457 Y152.08 E.10084
G1 X47.457 Y151.536 E.01702
G1 X44.636 Y154.357 E.1249
G1 X44.093 Y154.357 E.01702
G1 X47.457 Y150.993 E.14897
G1 X47.457 Y150.449 E.01702
G1 X43.549 Y154.357 E.17304
G1 X43.006 Y154.357 E.01702
G1 X47.457 Y149.906 E.19711
G1 X47.457 Y149.362 E.01702
G1 X42.462 Y154.357 E.22118
G1 X41.919 Y154.357 E.01702
G1 X47.457 Y148.819 E.24524
G1 X47.457 Y148.275 E.01702
G1 X41.376 Y154.357 E.26931
G1 X40.832 Y154.357 E.01702
G1 X47.457 Y147.732 E.29338
G1 X47.457 Y147.188 E.01702
G1 X40.293 Y154.353 E.31726
G1 X39.861 Y154.241 E.01396
G1 X47.458 Y146.645 E.33637
G2 X47.441 Y146.147 I-1.603 J-.195 E.01566
G1 X47.43 Y146.129 E.00066
G1 X39.435 Y154.124 E.35402
G1 X39.009 Y154.007 E.01384
G1 X46.974 Y146.042 E.35271
G1 X46.43 Y146.042 E.01702
G1 X38.741 Y153.731 E.34051
G1 X38.741 Y153.188 E.01701
G1 X45.887 Y146.042 E.31645
G1 X45.343 Y146.042 E.01702
G1 X38.74 Y152.645 E.2924
G1 X38.74 Y152.101 E.01701
G1 X44.8 Y146.042 E.26834
G1 X44.257 Y146.042 E.01702
G1 X38.74 Y151.558 E.24429
G1 X38.74 Y151.015 E.01701
G1 X43.713 Y146.042 E.22023
G1 X43.17 Y146.042 E.01702
G1 X38.74 Y150.472 E.19618
G1 X38.739 Y149.929 E.01701
G1 X42.626 Y146.042 E.17212
G1 X42.083 Y146.042 E.01702
G1 X38.739 Y149.385 E.14807
G1 X38.739 Y148.842 E.01701
G1 X41.539 Y146.042 E.12401
G1 X40.996 Y146.042 E.01702
G1 X38.739 Y148.299 E.09995
G1 X38.739 Y147.756 E.01701
G1 X40.453 Y146.042 E.0759
G2 X40.241 Y146.054 I-.052 J.913 E.00667
G1 X39.727 Y146.223 E.01692
G1 X38.569 Y147.382 E.0513
M204 S10000
G1 X38.678 Y146.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.148563
G1 F15000
M204 S6000
G1 X38.658 Y146.119 E.00271
; LINE_WIDTH: 0.114128
G1 X38.638 Y145.805 E.00182
; WIPE_START
G1 X38.658 Y146.119 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.25 Y151.505 Z2.4 F42000
G1 X26.305 Y158.423 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.532188
G1 F7357.93
M204 S6000
G1 X26.357 Y158.774 E.01415
; LINE_WIDTH: 0.495796
G1 F7949.209
G1 X26.379 Y158.9 E.0047
; LINE_WIDTH: 0.453226
G1 F8773.943
G1 X26.4 Y159.025 E.00426
; LINE_WIDTH: 0.407868
G1 F9864.417
G1 X26.478 Y159.436 E.01244
; LINE_WIDTH: 0.359725
G1 F11363.487
G1 X26.556 Y159.847 E.0108
; OBJECT_ID: 9
; WIPE_START
G1 X26.478 Y159.436 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X34.064 Y158.601 Z2.4 F42000
G1 X73.191 Y154.293 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X73.186 Y156.758 I-63.761 J1.099 E.08179
G3 X73.028 Y157.959 I-6.786 J-.28 E.04021
G1 X72.809 Y157.936 E.0073
G1 X72.809 Y145.89 E.39958
G2 X60.191 Y145.89 I-6.309 J.011 E.65678
G1 X60.191 Y157.941 E.39974
G1 X59.973 Y157.964 E.00728
G3 X59.809 Y156.49 I7.353 J-1.561 E.04928
G1 X59.809 Y145.91 E.35096
G3 X66.819 Y139.217 I6.694 J-.007 E.35951
G3 X73.082 Y144.697 I-.335 J6.701 E.29776
G1 X73.322 Y146.177 E.04974
G1 X74.544 Y145.735 E.0431
G3 X74.727 Y145.709 I.172 J.54 E.00617
G1 X81.757 Y145.713 E.2332
G3 X82.19 Y146.19 I-.063 J.491 E.02326
G1 X82.191 Y154.17 E.26469
G3 X81.67 Y154.691 I-.494 J.027 E.02754
G1 X74.719 Y154.691 E.23059
G3 X74.594 Y154.678 I-.003 J-.604 E.00416
G1 X73.249 Y154.309 E.04629
M204 S10000
G1 X73.598 Y154.827 F42000
G1 F8843.478
M204 S6000
G3 X73.593 Y156.774 I-50.345 J.833 E.0646
G3 X72.583 Y160.157 I-7.134 J-.287 E.11833
G1 X72.402 Y160.108 E.00622
G1 X72.402 Y145.894 E.47152
G2 X60.598 Y145.894 I-5.902 J.007 E.61462
G1 X60.598 Y160.106 E.47144
G1 X60.417 Y160.155 E.00621
G3 X59.402 Y156.494 I6.206 J-3.692 E.12753
G1 X59.402 Y145.906 E.35122
G3 X66.839 Y138.81 I7.101 J-.003 E.38123
G3 X73.482 Y144.623 I-.355 J7.109 E.31587
G1 X73.645 Y145.627 E.03374
G1 X74.425 Y145.346 E.0275
G3 X74.716 Y145.302 I.292 J.947 E.00982
G1 X81.735 Y145.303 E.23282
G3 X82.597 Y146.17 I-.047 J.909 E.04448
G1 X82.598 Y154.182 E.26576
G3 X81.682 Y155.098 I-.9 J.016 E.04795
G1 X74.711 Y155.098 E.23124
G3 X74.502 Y155.075 I.006 J-1.039 E.00698
G1 X73.656 Y154.843 E.02912
M204 S250
G1 X73.99 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X73.901 Y157.653 I-14.994 J.578 E.07117
G3 X72.01 Y161.572 I-7.507 J-1.207 E.13558
G1 X72.01 Y145.898 E.48162
G2 X60.99 Y145.898 I-5.51 J.003 E.5317
G1 X60.99 Y161.572 E.48162
G3 X59.01 Y156.497 I5.579 J-5.1 E.17122
G1 X59.01 Y145.902 E.32557
G3 X66.857 Y138.418 I7.493 J.001 E.37251
G3 X73.956 Y145.098 I-.369 J7.505 E.32591
G3 X74.706 Y144.91 I.878 J1.909 E.02387
G1 X81.75 Y144.911 E.21647
G3 X82.989 Y146.151 I-.067 J1.306 E.05902
G1 X82.99 Y154.194 E.24712
G3 X81.694 Y155.49 I-1.291 J.005 E.06263
G1 X74.704 Y155.49 E.21478
G3 X74.046 Y155.361 I.12 J-2.364 E.02066
; WIPE_START
M204 S6000
G1 X73.984 Y156.789 E-.5431
G1 X73.929 Y157.357 E-.2169
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.897 Y158.15 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.533865
G1 F7332.804
M204 S6000
G1 X72.842 Y158.526 E.0152
; LINE_WIDTH: 0.494362
G1 F7974.457
G1 X72.821 Y158.655 E.00482
; LINE_WIDTH: 0.451534
G1 F8810.275
G1 X72.799 Y158.784 E.00436
; LINE_WIDTH: 0.406038
G1 F9914.15
G1 X72.722 Y159.202 E.01258
; LINE_WIDTH: 0.357839
G1 F11431.508
G1 X72.644 Y159.62 E.01091
M204 S10000
G1 X72.457 Y160.326 F42000
; LINE_WIDTH: 0.108579
G1 F15000
M204 S6000
G1 X72.224 Y160.99 E.00376
; WIPE_START
G1 X72.457 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.783 Y156.054 Z2.4 F42000
G1 X81.044 Y154.527 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42613
G1 F9394.326
M204 S6000
G1 X81.858 Y153.714 E.03592
G1 X81.857 Y153.172 E.01692
G1 X80.672 Y154.357 E.05236
G1 X80.13 Y154.357 E.01692
G1 X81.857 Y152.63 E.07629
G1 X81.857 Y152.088 E.01692
G1 X79.588 Y154.357 E.10022
G1 X79.046 Y154.357 E.01692
G1 X81.857 Y151.546 E.12415
G1 X81.857 Y151.004 E.01692
G1 X78.504 Y154.357 E.14808
G1 X77.962 Y154.357 E.01692
G1 X81.857 Y150.462 E.17201
G1 X81.857 Y149.92 E.01692
G1 X77.42 Y154.357 E.19594
G1 X76.878 Y154.357 E.01692
G1 X81.857 Y149.379 E.21987
G1 X81.857 Y148.837 E.01692
G1 X76.336 Y154.357 E.2438
G1 X75.794 Y154.357 E.01692
G1 X81.857 Y148.295 E.26773
G1 X81.857 Y147.753 E.01692
G1 X75.252 Y154.357 E.29165
G1 X74.713 Y154.355 E.01685
G1 X81.857 Y147.211 E.31548
G1 X81.857 Y146.669 E.01692
G1 X74.28 Y154.246 E.33461
G1 X73.854 Y154.129 E.01377
G1 X81.838 Y146.146 E.35258
G2 X81.683 Y146.043 I-.16 J.074 E.00611
G1 X81.399 Y146.043 E.00889
G1 X73.429 Y154.013 E.35194
G1 X73.141 Y153.933 E.00934
G1 X73.141 Y153.759 E.00544
G1 X80.857 Y146.043 E.34076
G1 X80.315 Y146.043 E.01692
G1 X73.141 Y153.218 E.31684
G1 X73.14 Y152.676 E.01692
G1 X79.773 Y146.043 E.29292
G1 X79.231 Y146.043 E.01692
G1 X73.14 Y152.134 E.269
G1 X73.14 Y151.592 E.01692
G1 X78.689 Y146.043 E.24508
G1 X78.148 Y146.043 E.01692
G1 X73.14 Y151.051 E.22116
G1 X73.139 Y150.509 E.01692
G1 X77.606 Y146.043 E.19724
G1 X77.064 Y146.043 E.01692
G1 X73.139 Y149.967 E.17332
G1 X73.139 Y149.425 E.01692
G1 X76.522 Y146.042 E.1494
G1 X75.98 Y146.042 E.01692
G1 X73.139 Y148.884 E.12548
G1 X73.139 Y148.342 E.01692
G1 X75.438 Y146.042 E.10156
G1 X74.897 Y146.042 E.01692
G1 X73.138 Y147.8 E.07764
G1 X73.138 Y147.259 E.01692
G1 X74.455 Y145.942 E.05816
; WIPE_START
G1 X73.138 Y147.259 E-.70776
G1 X73.138 Y147.396 E-.05224
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X73.037 Y145.847 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.118731
G1 F15000
M204 S6000
G1 X73.063 Y146.162 E.00195
; LINE_WIDTH: 0.161322
G1 X73.088 Y146.478 E.00305
; WIPE_START
G1 X73.063 Y146.162 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X67.461 Y151.346 Z2.4 F42000
G1 X60.104 Y158.155 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.533241
G1 F7342.139
M204 S6000
G1 X60.158 Y158.526 E.01498
; LINE_WIDTH: 0.49435
G1 F7974.664
G1 X60.179 Y158.655 E.00482
; LINE_WIDTH: 0.451529
G1 F8810.38
G1 X60.201 Y158.784 E.00436
; LINE_WIDTH: 0.40605
G1 F9913.823
G1 X60.278 Y159.202 E.01258
; LINE_WIDTH: 0.357868
G1 F11430.458
G1 X60.356 Y159.62 E.01091
M204 S10000
G1 X60.542 Y160.324 F42000
; LINE_WIDTH: 0.108642
G1 F15000
M204 S6000
G1 X60.776 Y160.99 E.00378
; OBJECT_ID: 3
; WIPE_START
G1 X60.542 Y160.324 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X55.542 Y154.557 Z2.4 F42000
G1 X26.756 Y121.354 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X26.609 Y120.822 E.0183
G3 X26.391 Y119.01 I7.605 J-1.837 E.06071
G1 X26.391 Y95.99 E.76359
G3 X34.19 Y88.191 I7.823 J.024 E.40607
G1 X87.71 Y88.191 E1.77533
G3 X95.509 Y95.99 I-.024 J7.823 E.40607
G1 X95.509 Y119.01 E.76359
G3 X87.71 Y126.809 I-7.823 J-.024 E.40607
G1 X34.19 Y126.809 E1.77533
G3 X26.777 Y121.412 I.024 J-7.823 E.32503
G1 X26.776 Y121.411 E.00003
M204 S10000
G1 X27.147 Y121.236 F42000
G1 F8843.478
M204 S6000
G1 X26.943 Y120.444 E.02715
G3 X26.798 Y119.006 I7.271 J-1.457 E.04802
G1 X26.798 Y95.994 E.76333
G3 X34.194 Y88.598 I7.416 J.019 E.38512
G1 X87.706 Y88.598 E1.77508
G3 X95.102 Y95.994 I-.019 J7.416 E.38512
G1 X95.102 Y119.006 E.76333
G3 X87.706 Y126.402 I-7.416 J-.019 E.38512
G1 X34.194 Y126.402 E1.77508
G3 X27.166 Y121.293 I.019 J-7.416 E.30795
M204 S250
G1 X27.526 Y121.138 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X27.327 Y120.367 E.02445
G3 X27.19 Y119.002 I6.886 J-1.38 E.04222
G1 X27.19 Y95.998 E.70685
G3 X34.198 Y88.99 I7.023 J.015 E.33805
G1 X87.702 Y88.99 E1.64403
G3 X94.71 Y95.998 I-.015 J7.023 E.33805
G1 X94.71 Y119.002 E.70685
G3 X87.702 Y126.01 I-7.023 J-.015 E.33805
G1 X34.198 Y126.01 E1.64403
G3 X27.546 Y121.194 I.015 J-7.023 E.26953
; WIPE_START
M204 S6000
G1 X27.327 Y120.367 E-.32501
G1 X27.239 Y119.824 E-.20921
G1 X27.204 Y119.231 E-.22578
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.301 Y114.64 Z2.4 F42000
G1 X68.941 Y87.809 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y87.809 E.62194
G3 X95.891 Y96.01 I-.006 J8.207 E.42723
G1 X95.891 Y118.99 E.76229
G3 X87.69 Y127.191 I-8.207 J-.006 E.42723
G1 X34.21 Y127.191 E1.77403
M73 P76 R6
G3 X26.009 Y118.99 I.006 J-8.207 E.42724
G1 X26.009 Y96.01 E.76229
G3 X34.21 Y87.809 I8.207 J.006 E.42723
G1 X52.959 Y87.809 E.62194
G1 X52.959 Y82.83 E.16518
G3 X53.47 Y82.309 I.494 J-.026 E.02719
G1 X68.431 Y82.309 E.4963
G3 X68.941 Y82.83 I.016 J.495 E.02716
G1 X68.941 Y87.749 E.16319
M204 S10000
G1 X69.348 Y87.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y87.402 E.60858
G3 X96.298 Y96.006 I-.01 J8.614 E.44816
G1 X96.298 Y118.994 E.76256
G3 X87.694 Y127.598 I-8.614 J-.01 E.44816
G1 X34.206 Y127.598 E1.7743
G3 X25.602 Y118.994 I.01 J-8.614 E.44817
G1 X25.602 Y96.006 E.76256
G3 X34.206 Y87.402 I8.614 J.01 E.44816
G1 X52.552 Y87.402 E.60858
G1 X52.552 Y82.818 E.15207
G3 X53.462 Y81.902 I.901 J-.015 E.04773
G1 X68.444 Y81.902 E.49698
G3 X69.348 Y82.818 I.004 J.901 E.04755
G1 X69.348 Y87.342 E.15008
M204 S250
G1 X69.74 Y87.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y87.01 E.5518
G3 X96.69 Y96.002 I-.015 J9.007 E.43382
G1 X96.69 Y118.998 E.7066
G3 X87.698 Y127.99 I-9.007 J-.015 E.43382
G1 X34.202 Y127.99 E1.64378
G3 X25.21 Y118.998 I.015 J-9.007 E.43382
G1 X25.21 Y96.002 E.7066
G3 X34.202 Y87.01 I9.007 J.015 E.43382
G1 X52.16 Y87.01 E.5518
G1 X52.16 Y82.806 E.12917
G3 X53.454 Y81.51 I1.293 J-.004 E.06255
G1 X68.456 Y81.51 E.46096
G3 X69.74 Y82.806 I-.008 J1.292 E.06224
G1 X69.74 Y86.95 E.12733
; WIPE_START
M204 S6000
G1 X71.74 Y86.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.116 Y87.306 Z2.4 F42000
G1 X53.351 Y87.799 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X68.549 Y87.799 E.46697
G1 X68.543 Y82.854 E.15193
G1 X68.496 Y82.734 E.00396
G1 X68.36 Y82.701 E.00429
G1 X53.489 Y82.701 E.45693
G1 X53.391 Y82.738 E.00323
G1 X53.356 Y82.843 E.00341
G1 X53.351 Y87.739 E.15043
M204 S10000
G1 X65.997 Y85.488 F42000
; LINE_WIDTH: 0.517774
G1 F7581.277
M204 S6000
G1 X66.235 Y85.488 E.0092
G1 X66.234 Y85.013 E.01837
G1 X55.665 Y85.013 E.40896
G1 X55.665 Y85.487 E.01838
G1 X65.937 Y85.488 E.39748
M204 S10000
G1 X66.661 Y85.913 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.66 Y84.587 E.04076
G1 X55.24 Y84.587 E.3509
G1 X55.238 Y85.913 E.04077
G1 X66.601 Y85.913 E.34914
M204 S10000
G1 X67.039 Y86.291 F42000
G1 F9547.299
M204 S6000
G1 X67.036 Y84.21 E.06394
G1 X54.863 Y84.209 E.37404
G1 X54.861 Y86.291 E.06394
M73 P76 R5
G1 X66.979 Y86.291 E.37234
M204 S10000
G1 X67.416 Y86.668 F42000
G1 F9547.299
M204 S6000
G1 X67.413 Y83.833 E.08711
G1 X54.486 Y83.832 E.39719
G1 X54.484 Y86.668 E.08711
G1 X67.356 Y86.668 E.39553
M204 S10000
G1 X67.794 Y87.045 F42000
G1 F9547.299
M204 S6000
G1 X67.79 Y83.456 E.11028
G1 X54.11 Y83.455 E.42034
G1 X54.106 Y87.045 E.11029
G1 X67.734 Y87.045 E.41873
M204 S10000
G1 X68.171 Y87.422 F42000
G1 F9547.299
M204 S6000
G1 X68.166 Y83.078 E.13345
G1 X53.733 Y83.078 E.44349
G1 X53.729 Y87.422 E.13346
G1 X68.111 Y87.422 E.44193
; OBJECT_ID: 1
; WIPE_START
G1 X66.111 Y87.422 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X69.577 Y80.621 Z2.4 F42000
G1 X92.97 Y34.715 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X93.273 Y35.142 E.01736
G3 X94.509 Y39.19 I-6.086 J4.071 E.14245
G1 X94.509 Y62.21 E.76359
G3 X87.21 Y69.509 I-7.322 J-.023 E.38003
G1 X33.69 Y69.509 E1.77533
G3 X26.391 Y62.21 I.023 J-7.322 E.38003
G1 X26.391 Y39.19 E.76359
G3 X33.69 Y31.891 I7.322 J.023 E.38003
G1 X87.213 Y31.891 E1.77543
G3 X92.93 Y34.671 I-.026 J7.322 E.21813
M204 S10000
G1 X92.641 Y34.955 F42000
G1 F8843.478
M204 S6000
G1 X92.935 Y35.368 E.01683
G3 X94.102 Y39.194 I-5.747 J3.844 E.13462
G1 X94.102 Y62.206 E.76333
G3 X87.206 Y69.102 I-6.915 J-.018 E.35908
G1 X33.694 Y69.102 E1.77508
G3 X26.798 Y62.206 I.018 J-6.915 E.35908
G1 X26.798 Y39.194 E.76333
G3 X33.694 Y32.298 I6.915 J.018 E.35908
G1 X87.208 Y32.298 E1.77514
G3 X92.601 Y34.91 I-.02 J6.915 E.20559
M204 S250
G1 X92.324 Y35.185 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X92.609 Y35.586 E.01512
G3 X93.71 Y39.198 I-5.421 J3.626 E.11772
G1 X93.71 Y62.202 E.70685
G3 X87.202 Y68.71 I-6.522 J-.014 E.31393
G1 X33.698 Y68.71 E1.64403
G3 X27.19 Y62.202 I.014 J-6.522 E.31393
G1 X27.19 Y39.198 E.70685
G3 X33.698 Y32.69 I6.522 J.014 E.31393
G1 X87.203 Y32.69 E1.64405
G3 X92.283 Y35.141 I-.015 J6.522 E.17925
; WIPE_START
M204 S6000
G1 X92.609 Y35.586 E-.20953
G1 X92.88 Y36.019 E-.19419
G1 X93.214 Y36.709 E-.29124
G1 X93.274 Y36.869 E-.06503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.813 Y35.259 Z2.4 F42000
G1 X68.441 Y31.509 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I-.005 J7.706 E.40119
G1 X94.891 Y62.19 E.76229
G3 X87.19 Y69.891 I-7.706 J-.005 E.40119
G1 X33.71 Y69.891 E1.77403
G3 X26.009 Y62.187 I.005 J-7.706 E.40128
G1 X26.009 Y39.21 E.7622
G3 X33.71 Y31.509 I7.706 J.005 E.40119
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.53 E.16518
G3 X52.97 Y26.009 I.495 J-.025 E.02718
G1 X67.931 Y26.009 E.4963
G3 X68.441 Y26.53 I.016 J.495 E.02716
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I-.009 J8.113 E.42212
G1 X95.298 Y62.194 E.76256
G3 X87.194 Y70.298 I-8.113 J-.01 E.42212
G1 X33.706 Y70.298 E1.77431
G3 X25.602 Y62.192 I.01 J-8.113 E.42218
G1 X25.602 Y39.206 E.76251
G3 X33.706 Y31.102 I8.113 J.009 E.42212
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.518 E.15207
G3 X52.962 Y25.602 I.902 J-.013 E.0477
G1 X67.944 Y25.602 E.49698
G3 X68.848 Y26.518 I.004 J.901 E.04755
G1 X68.848 Y31.042 E.15008
M204 S250
G1 X69.24 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.198 Y30.71 E.5518
G3 X95.69 Y39.202 I-.014 J8.506 E.4097
G1 X95.69 Y62.198 E.7066
G3 X87.198 Y70.69 I-8.506 J-.014 E.4097
G1 X33.702 Y70.69 E1.64378
G3 X25.21 Y62.197 I.014 J-8.506 E.40972
G1 X25.21 Y39.202 E.70658
M73 P77 R5
G3 X33.702 Y30.71 I8.506 J.014 E.4097
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.506 E.12917
G3 X52.954 Y25.21 I1.296 J-.001 E.06251
G1 X67.956 Y25.21 E.46096
G3 X69.24 Y26.506 I-.008 J1.292 E.06224
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.497 Y29.188 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51777
G1 F7581.355
M204 S6000
G1 X65.735 Y29.188 E.0092
G1 X65.734 Y28.713 E.01837
G1 X55.165 Y28.713 E.40896
G1 X55.165 Y29.187 E.01838
G1 X65.437 Y29.188 E.39748
M204 S10000
G1 X66.161 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.287 E.04076
G1 X54.74 Y28.287 E.3509
G1 X54.738 Y29.613 E.04077
G1 X66.101 Y29.613 E.34914
M204 S10000
G1 X66.539 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.91 E.06394
G1 X54.363 Y27.91 E.37404
G1 X54.361 Y29.991 E.06394
G1 X66.479 Y29.991 E.37234
M204 S10000
G1 X66.916 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.533 E.08711
G1 X53.986 Y27.532 E.39719
G1 X53.984 Y30.368 E.08711
G1 X66.856 Y30.368 E.39553
M204 S10000
G1 X67.294 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.156 E.11028
G1 X53.61 Y27.155 E.42034
G1 X53.606 Y30.745 E.11029
G1 X67.234 Y30.745 E.41873
M204 S10000
G1 X67.671 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.779 E.13345
G1 X53.233 Y26.778 E.44348
G1 X53.229 Y31.122 E.13346
G1 X67.611 Y31.122 E.44193
M204 S10000
G1 X68.049 Y31.499 F42000
G1 F9547.299
M204 S6000
G1 X68.043 Y26.554 E.15194
G1 X67.996 Y26.434 E.00395
G1 X67.86 Y26.401 E.0043
G1 X52.989 Y26.401 E.45693
G1 X52.891 Y26.438 E.00323
G1 X52.856 Y26.543 E.00341
G1 X52.851 Y31.499 E.15227
G1 X67.989 Y31.499 E.46512
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.989 Y31.499 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 11/15
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z2.4 I-.482 J1.118 P1  F42000
G1 X218.891 Y97.392 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X218.886 Y100.336 I-76.926 J1.348 E.09764
G3 X218.728 Y101.51 I-6.446 J-.271 E.03937
G1 X218.509 Y101.487 E.00729
G1 X218.509 Y88.489 E.43116
G2 X206.891 Y88.489 I-5.809 J.011 E.60468
G1 X206.891 Y101.487 E.43116
G1 X206.672 Y101.51 E.00729
G3 X206.509 Y100.089 I6.877 J-1.509 E.04754
G1 X206.509 Y88.509 E.38412
G3 X213.041 Y82.318 I6.193 J-.007 E.33417
G3 X218.843 Y87.736 I-.344 J6.185 E.28584
G1 X219 Y89.233 E.04996
G1 X220.305 Y88.818 E.04542
G3 X220.428 Y88.808 I.115 J.645 E.00412
G1 X227.419 Y88.809 E.2319
G3 X227.89 Y89.29 I-.026 J.496 E.02451
G1 X227.891 Y97.269 E.26469
G3 X227.37 Y97.79 I-.495 J.025 E.02753
G1 X220.419 Y97.79 E.23059
G3 X220.294 Y97.777 I-.003 J-.603 E.00416
G1 X218.949 Y97.408 E.04628
M204 S10000
G1 X219.298 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X219.293 Y100.351 I-63.471 J1.083 E.08044
G3 X218.279 Y103.619 I-6.716 J-.292 E.11474
G1 X218.102 Y103.568 E.00612
G1 X218.102 Y88.493 E.50007
G2 X207.298 Y88.493 I-5.402 J.007 E.56252
G1 X207.298 Y103.568 E.50006
G1 X207.121 Y103.619 E.00612
G3 X206.102 Y100.093 I5.598 J-3.527 E.12336
G1 X206.102 Y88.505 E.38438
G3 X213.063 Y81.911 I6.601 J-.003 E.356
G3 X219.247 Y87.685 I-.367 J6.591 E.30461
G1 X219.353 Y88.693 E.03362
G1 X220.162 Y88.434 E.02819
G3 X220.417 Y88.401 I.256 J.99 E.00855
G1 X227.435 Y88.402 E.23281
G3 X228.297 Y89.27 I-.047 J.909 E.04448
G1 X228.298 Y97.281 E.26576
G3 X227.382 Y98.197 I-.901 J.015 E.04793
G1 X220.411 Y98.197 E.23124
G3 X220.202 Y98.174 I.006 J-1.037 E.00698
G1 X219.356 Y97.942 E.02912
M204 S250
G1 X219.69 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X219.67 Y100.633 I-28.759 J.828 E.06739
G3 X217.71 Y104.972 I-6.983 J-.541 E.14928
G1 X217.71 Y88.497 E.50624
G2 X207.69 Y88.497 I-5.01 J.003 E.48344
G1 X207.69 Y104.972 E.50624
G3 X205.71 Y100.096 I5.021 J-4.879 E.16577
G1 X205.71 Y88.501 E.3563
G3 X213.086 Y81.52 I6.993 J.001 E.34925
G3 X219.692 Y88.172 I-.409 J7.013 E.31541
G3 X220.406 Y88.009 I.819 J1.935 E.02261
G1 X227.451 Y88.01 E.21646
G3 X228.689 Y89.25 I-.067 J1.306 E.05902
G1 X228.69 Y97.293 E.24712
G3 X227.394 Y98.589 I-1.293 J.003 E.06261
G1 X220.404 Y98.589 E.21478
G3 X219.746 Y98.461 I.12 J-2.367 E.02066
; WIPE_START
M204 S6000
G1 X219.69 Y100.097 E-.62199
G1 X219.676 Y100.459 E-.13801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X218.877 Y101.747 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.545348
G1 F7165.212
M204 S6000
G1 X218.557 Y101.95 E.01551
; LINE_WIDTH: 0.526756
G1 F7440.539
G1 X218.538 Y102.067 E.00468
; LINE_WIDTH: 0.488346
G1 F8082.163
G1 X218.519 Y102.184 E.00431
; LINE_WIDTH: 0.447407
G1 F8900.172
G1 X218.436 Y102.634 E.01508
; LINE_WIDTH: 0.403963
G1 F9971.134
G1 X218.353 Y103.084 E.01346
; WIPE_START
G1 X218.436 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X219.731 Y97.453 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421
G1 F9521.794
M204 S6000
G1 X218.841 Y96.563 E.03877
G1 X218.841 Y96.028 E.01648
G1 X220.225 Y97.413 E.06032
G2 X220.803 Y97.457 I.394 J-1.371 E.018
G1 X218.84 Y95.494 E.08553
G1 X218.84 Y94.959 E.01648
G1 X221.338 Y97.457 E.10883
G1 X221.873 Y97.457 E.01647
G1 X218.84 Y94.424 E.13213
G1 X218.84 Y93.889 E.01648
G1 X222.407 Y97.457 E.15544
G1 X222.942 Y97.457 E.01647
G1 X218.84 Y93.354 E.17874
G1 X218.839 Y92.819 E.01648
G1 X223.477 Y97.457 E.20205
G1 X224.011 Y97.457 E.01647
G1 X218.839 Y92.284 E.22535
G1 X218.839 Y91.749 E.01648
G1 X224.546 Y97.457 E.24866
G1 X225.081 Y97.457 E.01647
G1 X218.839 Y91.215 E.27196
G1 X218.839 Y90.68 E.01648
G1 X225.616 Y97.457 E.29526
G1 X226.15 Y97.457 E.01647
G1 X218.839 Y90.145 E.31857
G1 X218.838 Y89.851 E.00905
G1 X219.068 Y89.839 E.00707
G1 X226.685 Y97.457 E.33189
G1 X227.22 Y97.457 E.01647
G1 X219.262 Y89.499 E.3467
G1 X219.667 Y89.369 E.0131
G1 X227.555 Y97.258 E.34369
G1 X227.558 Y96.725 E.01641
G1 X220.072 Y89.24 E.32614
G3 X220.508 Y89.141 I.432 J.901 E.0139
G1 X227.557 Y96.19 E.30713
G1 X227.557 Y95.656 E.01648
G1 X221.043 Y89.141 E.28382
G1 X221.578 Y89.141 E.01648
G1 X227.557 Y95.121 E.26052
G1 X227.557 Y94.586 E.01648
G1 X222.113 Y89.142 E.23722
G1 X222.648 Y89.142 E.01648
G1 X227.557 Y94.051 E.21391
G1 X227.557 Y93.517 E.01648
G1 X223.182 Y89.142 E.19061
G1 X223.717 Y89.142 E.01648
G1 X227.557 Y92.982 E.16731
G1 X227.557 Y92.447 E.01648
G1 X224.252 Y89.142 E.144
G1 X224.787 Y89.142 E.01648
G1 X227.557 Y91.912 E.1207
G1 X227.557 Y91.377 E.01648
G1 X225.321 Y89.142 E.0974
G1 X225.856 Y89.142 E.01648
G1 X227.557 Y90.843 E.07409
G1 X227.557 Y90.308 E.01648
G1 X226.391 Y89.142 E.05079
G1 X226.926 Y89.142 E.01648
G1 X227.726 Y89.943 E.03488
M204 S10000
G1 X218.769 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136188
G1 F15000
M204 S6000
G1 X218.753 Y89.228 E.00223
; LINE_WIDTH: 0.110002
G1 X218.738 Y88.936 E.0016
; WIPE_START
G1 X218.753 Y89.228 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X213.419 Y94.687 Z2.6 F42000
G1 X206.522 Y101.745 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.541125
G1 F7225.94
M204 S6000
G1 X206.843 Y101.95 E.01545
G1 X206.862 Y102.067 E.00481
; LINE_WIDTH: 0.488418
G1 F8080.852
G1 X206.881 Y102.184 E.00431
; LINE_WIDTH: 0.447436
G1 F8899.531
G1 X206.964 Y102.634 E.01509
; LINE_WIDTH: 0.403867
G1 F9973.761
G1 X207.047 Y103.084 E.01346
; OBJECT_ID: 6
; WIPE_START
G1 X206.964 Y102.634 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X199.549 Y100.824 Z2.6 F42000
G1 X185.491 Y97.392 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X185.486 Y100.336 I-76.702 J1.348 E.09764
G3 X185.328 Y101.51 I-6.507 J-.28 E.03936
G1 X185.109 Y101.487 E.00729
G1 X185.109 Y88.489 E.43116
G2 X173.491 Y88.489 I-5.809 J.011 E.60468
G1 X173.491 Y101.487 E.43116
G1 X173.272 Y101.51 E.00729
G3 X173.109 Y100.089 I6.873 J-1.509 E.04754
G1 X173.109 Y88.509 E.38411
G3 X179.641 Y82.318 I6.193 J-.007 E.33418
G3 X185.441 Y87.721 I-.343 J6.184 E.28536
G1 X185.602 Y89.233 E.05042
G1 X186.871 Y88.826 E.0442
G3 X187.02 Y88.808 I.171 J.786 E.00497
G1 X194.019 Y88.809 E.23219
G3 X194.49 Y89.28 I-.027 J.498 E.02417
G1 X194.491 Y97.269 E.26502
G3 X193.97 Y97.79 I-.495 J.025 E.02752
G1 X187.019 Y97.79 E.23059
G3 X186.894 Y97.777 I-.003 J-.605 E.00416
G1 X185.549 Y97.408 E.04628
M204 S10000
G1 X185.898 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X185.893 Y100.351 I-63.287 J1.083 E.08045
M73 P78 R5
G3 X184.879 Y103.619 I-6.716 J-.293 E.11474
G1 X184.702 Y103.568 E.00612
G1 X184.702 Y88.493 E.50007
G2 X173.898 Y88.493 I-5.402 J.007 E.56252
G1 X173.898 Y103.568 E.50007
G1 X173.721 Y103.619 E.00612
G3 X172.702 Y100.093 I5.598 J-3.527 E.12336
G1 X172.702 Y88.505 E.38438
G3 X179.663 Y81.911 I6.6 J-.003 E.356
G3 X185.845 Y87.671 I-.367 J6.591 E.30413
G1 X185.954 Y88.692 E.03409
G1 X186.762 Y88.434 E.02815
G3 X187.012 Y88.401 I.28 J1.173 E.00836
G1 X194.035 Y88.402 E.23298
G3 X194.897 Y89.264 I-.048 J.91 E.04428
G1 X194.898 Y97.281 E.26595
G3 X193.982 Y98.197 I-.901 J.015 E.04793
G1 X187.011 Y98.197 E.23124
G3 X186.803 Y98.174 I.006 J-1.039 E.00698
G1 X185.956 Y97.942 E.02913
M204 S250
G1 X186.29 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X186.27 Y100.633 I-28.734 J.828 E.06739
G3 X184.31 Y104.972 I-6.987 J-.543 E.14927
G1 X184.31 Y88.497 E.50624
G2 X174.29 Y88.497 I-5.01 J.003 E.48344
G1 X174.29 Y104.972 E.50624
G3 X172.31 Y100.096 I5.021 J-4.879 E.16577
G1 X172.31 Y88.501 E.3563
G3 X179.686 Y81.52 I6.993 J.001 E.34925
G3 X186.293 Y88.172 I-.409 J7.014 E.31541
G3 X187.004 Y88.009 I.849 J2.066 E.02252
G1 X194.051 Y88.01 E.21652
G3 X195.289 Y89.248 I-.069 J1.307 E.05895
G1 X195.29 Y97.293 E.24718
G3 X193.994 Y98.589 I-1.293 J.003 E.06261
G1 X187.004 Y98.589 E.21478
G3 X186.346 Y98.461 I.12 J-2.366 E.02066
; WIPE_START
M204 S6000
G1 X186.29 Y100.096 E-.62199
G1 X186.276 Y100.459 E-.13801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X186.331 Y97.453 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42097
G1 F9522.549
M204 S6000
G1 X185.441 Y96.563 E.03879
G1 X185.441 Y96.028 E.01648
G1 X186.825 Y97.413 E.06033
G2 X187.404 Y97.457 I.394 J-1.371 E.01799
G1 X185.44 Y95.493 E.08553
G1 X185.44 Y94.958 E.01648
G1 X187.938 Y97.457 E.10883
G1 X188.473 Y97.457 E.01647
G1 X185.44 Y94.424 E.13213
G1 X185.44 Y93.889 E.01648
G1 X189.008 Y97.457 E.15543
G1 X189.542 Y97.457 E.01647
G1 X185.44 Y93.354 E.17873
G1 X185.439 Y92.819 E.01648
G1 X190.077 Y97.457 E.20203
G1 X190.612 Y97.457 E.01647
G1 X185.439 Y92.284 E.22534
G1 X185.439 Y91.749 E.01648
G1 X191.146 Y97.457 E.24864
G1 X191.681 Y97.457 E.01647
G1 X185.439 Y91.215 E.27194
G1 X185.439 Y90.68 E.01648
G1 X192.215 Y97.457 E.29524
G1 X192.75 Y97.457 E.01647
G1 X185.439 Y90.145 E.31854
G1 X185.438 Y89.851 E.00907
G1 X185.667 Y89.839 E.00704
G1 X193.285 Y97.457 E.33189
G1 X193.819 Y97.457 E.01647
G1 X185.862 Y89.499 E.34667
G1 X186.267 Y89.37 E.0131
G1 X194.155 Y97.258 E.34367
G1 X194.158 Y96.725 E.0164
G1 X186.672 Y89.24 E.32612
G3 X187.108 Y89.141 I.427 J.874 E.0139
G1 X194.157 Y96.191 E.30712
G1 X194.157 Y95.656 E.01647
G1 X187.643 Y89.141 E.28382
G1 X188.178 Y89.141 E.01647
G1 X194.157 Y95.121 E.26052
G1 X194.157 Y94.587 E.01647
G1 X188.712 Y89.142 E.23722
G1 X189.247 Y89.142 E.01647
G1 X194.157 Y94.052 E.21392
G1 X194.157 Y93.517 E.01647
G1 X189.782 Y89.142 E.19062
G1 X190.316 Y89.142 E.01647
G1 X194.157 Y92.982 E.16732
G1 X194.157 Y92.448 E.01647
G1 X190.851 Y89.142 E.14402
G1 X191.386 Y89.142 E.01647
G1 X194.157 Y91.913 E.12072
G1 X194.157 Y91.378 E.01647
G1 X191.921 Y89.142 E.09742
G1 X192.455 Y89.142 E.01647
G1 X194.157 Y90.843 E.07412
G1 X194.157 Y90.309 E.01647
G1 X192.99 Y89.142 E.05082
G1 X193.525 Y89.142 E.01647
G1 X194.326 Y89.944 E.03491
M204 S10000
G1 X185.37 Y89.521 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.138139
G1 F15000
M204 S6000
G1 X185.354 Y89.22 E.00234
; LINE_WIDTH: 0.110657
G1 X185.338 Y88.919 E.00166
; WIPE_START
G1 X185.354 Y89.22 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.43 Y96.852 Z2.6 F42000
G1 X185.478 Y101.743 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.534986
G1 F7316.091
M204 S6000
G1 X185.157 Y101.95 E.0153
; LINE_WIDTH: 0.526398
G1 F7446.048
G1 X185.138 Y102.067 E.0047
; LINE_WIDTH: 0.488053
G1 F8087.477
G1 X185.119 Y102.185 E.00432
; LINE_WIDTH: 0.447214
G1 F8904.416
G1 X185.036 Y102.635 E.01506
; LINE_WIDTH: 0.403872
G1 F9973.645
G1 X184.953 Y103.084 E.01345
; WIPE_START
G1 X185.036 Y102.635 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.409 Y102.936 Z2.6 F42000
G1 X173.647 Y103.084 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.403924
G1 F9972.186
M204 S6000
G1 X173.564 Y102.634 E.01346
; LINE_WIDTH: 0.447375
G1 F8900.873
G1 X173.481 Y102.184 E.01508
; LINE_WIDTH: 0.488322
G1 F8082.589
G1 X173.462 Y102.067 E.00431
; LINE_WIDTH: 0.540942
G1 F7228.598
G1 X173.443 Y101.95 E.00482
G1 X173.122 Y101.743 E.01551
; OBJECT_ID: 5
; WIPE_START
G1 X173.443 Y101.95 E-.5798
G1 X173.462 Y102.067 E-.1802
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X166.006 Y100.436 Z2.6 F42000
G1 X152.091 Y97.392 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X152.091 Y100.389 E.09941
G3 X151.927 Y101.778 I-6.638 J-.078 E.04649
G1 X151.709 Y101.755 E.00727
G1 X151.709 Y88.189 E.44999
G2 X140.691 Y88.189 I-5.509 J.011 E.57342
G1 X140.691 Y101.755 E.44999
G1 X140.473 Y101.778 E.00727
G3 X140.309 Y100.389 I6.473 J-1.467 E.04648
G1 X140.309 Y88.209 E.40403
G3 X146.522 Y82.317 I5.893 J-.007 E.31792
G3 X152.069 Y87.699 I-.335 J5.895 E.27952
G1 X152.17 Y89.235 E.05105
G1 X153.508 Y88.817 E.04652
G3 X153.628 Y88.808 I.109 J.63 E.00399
G1 X160.619 Y88.809 E.2319
G3 X161.09 Y89.28 I-.022 J.493 E.02423
G1 X161.091 Y97.279 E.26536
G3 X160.57 Y97.79 I-.495 J.016 E.02718
G1 X153.619 Y97.79 E.23058
G3 X153.494 Y97.777 I-.003 J-.602 E.00416
G1 X152.149 Y97.408 E.04629
M204 S10000
G1 X152.498 Y97.926 F42000
G1 F8843.478
M204 S6000
G3 X152.493 Y100.645 I-69.43 J1.234 E.0902
G3 X151.478 Y103.833 I-6.41 J-.285 E.11229
G1 X151.302 Y103.782 E.00608
G1 X151.302 Y88.193 E.51711
G2 X141.098 Y88.193 I-5.102 J.007 E.53125
G1 X141.098 Y103.782 E.51711
G1 X140.922 Y103.833 E.00608
G3 X139.902 Y100.393 I5.296 J-3.442 E.12069
G1 X139.902 Y88.205 E.4043
G3 X146.544 Y81.911 I6.3 J-.003 E.33974
G3 X152.475 Y87.665 I-.358 J6.302 E.29883
G1 X152.542 Y88.691 E.03412
G1 X153.368 Y88.432 E.02871
G3 X153.617 Y88.401 I.247 J.964 E.00834
G1 X160.635 Y88.402 E.23281
G3 X161.497 Y89.264 I-.042 J.904 E.04435
G1 X161.498 Y97.287 E.26615
G3 X160.582 Y98.197 I-.901 J.009 E.04773
G1 X153.611 Y98.197 E.23123
G3 X153.403 Y98.174 I.006 J-1.036 E.00698
G1 X152.556 Y97.942 E.02913
M204 S250
G1 X152.89 Y98.44 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.885 Y100.66 I-56.687 J.978 E.06822
G3 X150.91 Y105.149 I-6.747 J-.29 E.1542
G1 X150.91 Y88.197 E.52089
G2 X141.49 Y88.197 I-4.71 J.003 E.45448
G1 X141.49 Y105.149 E.52089
G3 X139.51 Y100.397 I4.72 J-4.755 E.16235
G1 X139.51 Y88.201 E.37475
G3 X146.566 Y81.519 I6.693 J.001 E.33418
G3 X152.901 Y88.168 I-.378 J6.702 E.31073
G3 X153.606 Y88.009 I.804 J1.926 E.02232
G1 X160.651 Y88.01 E.21646
G3 X161.889 Y89.249 I-.061 J1.299 E.05903
G1 X161.89 Y97.295 E.24724
G3 X160.594 Y98.589 I-1.293 J.001 E.06255
G1 X153.604 Y98.589 E.21477
G3 X152.946 Y98.461 I.12 J-2.365 E.02066
; WIPE_START
M204 S6000
G1 X152.89 Y100.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.933 Y97.454 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42096
G1 F9522.802
M204 S6000
G1 X152.042 Y96.564 E.03878
G1 X152.042 Y96.029 E.01647
G1 X153.427 Y97.413 E.06032
G2 X154.005 Y97.457 I.393 J-1.374 E.01797
G1 X152.042 Y95.494 E.08549
G1 X152.042 Y94.96 E.01647
G1 X154.539 Y97.457 E.10878
G1 X155.074 Y97.457 E.01647
G1 X152.042 Y94.425 E.13207
G1 X152.042 Y93.89 E.01647
G1 X155.609 Y97.457 E.15536
G1 X156.143 Y97.457 E.01647
G1 X152.042 Y93.356 E.17865
G1 X152.042 Y92.821 E.01647
G1 X156.678 Y97.457 E.20195
G1 X157.212 Y97.457 E.01647
G1 X152.042 Y92.287 E.22524
G1 X152.042 Y91.752 E.01647
G1 X157.747 Y97.457 E.24853
G1 X158.282 Y97.457 E.01647
G1 X152.042 Y91.217 E.27182
G1 X152.042 Y90.683 E.01647
G1 X158.816 Y97.457 E.29511
G1 X159.351 Y97.457 E.01647
G1 X152.042 Y90.148 E.3184
G1 X152.042 Y89.848 E.00924
G1 X152.27 Y89.841 E.00701
G1 X159.886 Y97.457 E.33179
G1 X160.42 Y97.457 E.01647
G1 X152.458 Y89.494 E.3469
G1 X152.864 Y89.366 E.01314
G1 X160.758 Y97.259 E.34387
G1 X160.758 Y96.725 E.01647
G1 X153.271 Y89.238 E.32614
G3 X153.709 Y89.141 I.431 J.911 E.01393
G1 X160.757 Y96.19 E.30707
G1 X160.757 Y95.655 E.01647
G1 X154.244 Y89.141 E.28377
G1 X154.778 Y89.142 E.01647
G1 X160.757 Y95.12 E.26047
G1 X160.757 Y94.586 E.01647
G1 X155.313 Y89.142 E.23718
G1 X155.848 Y89.142 E.01647
G1 X160.757 Y94.051 E.21388
G1 X160.757 Y93.516 E.01647
G1 X156.383 Y89.142 E.19058
G1 X156.917 Y89.142 E.01647
G1 X160.757 Y92.982 E.16728
G1 X160.757 Y92.447 E.01647
G1 X157.452 Y89.142 E.14398
G1 X157.987 Y89.142 E.01647
G1 X160.757 Y91.912 E.12068
G1 X160.757 Y91.378 E.01647
G1 X158.521 Y89.142 E.09738
G1 X159.056 Y89.142 E.01647
G1 X160.757 Y90.843 E.07409
G1 X160.757 Y90.308 E.01647
G1 X159.591 Y89.142 E.05079
G1 X160.126 Y89.142 E.01647
G1 X160.926 Y89.943 E.03488
M204 S10000
G1 X151.948 Y89.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104378
G1 F15000
M204 S6000
G1 X151.939 Y89.226 E.00146
; WIPE_START
G1 X151.948 Y89.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X152.026 Y97.15 Z2.6 F42000
G1 X152.076 Y102.012 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.527474
G1 F7429.525
M204 S6000
G1 X151.755 Y102.215 E.01501
; LINE_WIDTH: 0.524111
G1 F7481.439
G1 X151.737 Y102.321 E.00418
; LINE_WIDTH: 0.488837
G1 F8073.252
G1 X151.72 Y102.426 E.00387
; LINE_WIDTH: 0.449445
G1 F8855.555
G1 X151.637 Y102.867 E.01488
; LINE_WIDTH: 0.405949
G1 F9916.585
G1 X151.554 Y103.308 E.01328
; WIPE_START
G1 X151.637 Y102.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.011 Y103.179 Z2.6 F42000
G1 X140.846 Y103.308 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.40594
G1 F9916.808
M204 S6000
G1 X140.763 Y102.867 E.01328
; LINE_WIDTH: 0.449367
G1 F8857.25
G1 X140.68 Y102.426 E.01487
; LINE_WIDTH: 0.488759
G1 F8074.663
G1 X140.663 Y102.321 E.00388
; LINE_WIDTH: 0.527034
G1 F7436.268
G1 X140.645 Y102.215 E.00421
G1 X140.324 Y102.012 E.01498
; OBJECT_ID: 4
; WIPE_START
G1 X140.645 Y102.215 E-.59312
G1 X140.663 Y102.321 E-.16688
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X133.225 Y100.606 Z2.6 F42000
G1 X119.291 Y97.392 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X119.291 Y100.589 E.10604
G3 X119.126 Y101.956 I-6.372 J-.073 E.04575
G1 X118.909 Y101.932 E.00725
G1 X118.909 Y87.99 E.46247
G2 X108.291 Y87.99 I-5.309 J.011 E.55257
G1 X108.291 Y101.933 E.46252
G1 X108.073 Y101.957 E.00726
G3 X107.909 Y100.589 I6.248 J-1.444 E.04578
G1 X107.909 Y88.01 E.41728
G3 X113.889 Y82.316 I5.694 J-.007 E.30641
G3 X119.282 Y87.678 I-.292 J5.686 E.27621
G1 X119.337 Y89.193 E.0503
G1 X120.727 Y88.815 E.04777
G3 X120.819 Y88.809 I.088 J.614 E.00307
G1 X127.809 Y88.81 E.23188
G3 X128.29 Y89.281 I-.012 J.493 E.02456
G1 X128.291 Y97.28 E.26535
G3 X127.77 Y97.79 I-.495 J.016 E.02719
G1 X120.819 Y97.79 E.23058
G3 X120.694 Y97.778 I-.003 J-.605 E.00417
G1 X119.349 Y97.408 E.04629
M204 S10000
G1 X119.698 Y97.926 F42000
G1 F8843.478
M204 S6000
G1 X119.698 Y100.593 E.08847
G3 X118.677 Y103.976 I-6.116 J-.001 E.11889
G1 X118.502 Y103.924 E.00605
G1 X118.502 Y87.994 E.52843
G2 X108.698 Y87.994 I-4.902 J.007 E.5104
G1 X108.698 Y103.924 E.52843
G1 X108.523 Y103.976 E.00605
G3 X107.502 Y100.593 I5.095 J-3.383 E.11889
G1 X107.502 Y88.006 E.41756
G3 X113.91 Y81.91 I6.101 J-.002 E.32816
G3 X119.688 Y87.655 I-.313 J6.093 E.29598
G1 X119.725 Y88.665 E.03352
G1 X120.602 Y88.424 E.03017
G3 X120.811 Y88.402 I.215 J1.017 E.00698
G1 X127.829 Y88.403 E.2328
G3 X128.697 Y89.265 I-.036 J.904 E.04455
G1 X128.698 Y97.288 E.26614
G3 X127.782 Y98.198 I-.901 J.009 E.04773
G1 X120.811 Y98.198 E.23123
G3 X120.603 Y98.175 I.006 J-1.04 E.00698
G1 X119.756 Y97.942 E.02913
M204 S250
G1 X120.09 Y98.441 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X120.085 Y100.857 I-60.753 J1.078 E.07426
G3 X118.11 Y105.265 I-6.545 J-.286 E.152
G1 X118.11 Y87.997 E.53059
G2 X109.09 Y87.997 I-4.51 J.003 E.43517
G1 X109.09 Y105.265 E.53059
G3 X107.11 Y100.597 I4.52 J-4.671 E.16005
G1 X107.11 Y88.002 E.38703
G3 X113.93 Y81.518 I6.493 J.002 E.3234
G3 X120.099 Y88.156 I-.351 J6.512 E.30783
G3 X120.804 Y88.01 I.823 J2.197 E.02222
G1 X127.849 Y88.011 E.21646
G3 X129.089 Y89.249 I-.059 J1.299 E.0591
G1 X129.09 Y97.295 E.24724
G3 X127.794 Y98.59 I-1.293 J.001 E.06255
G1 X120.804 Y98.59 E.21477
G3 X120.146 Y98.461 I.12 J-2.362 E.02066
; WIPE_START
M204 S6000
G1 X120.095 Y100.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.133 Y97.454 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42095
G1 F9523.053
M204 S6000
G1 X119.242 Y96.564 E.0388
G1 X119.242 Y96.029 E.01647
G1 X120.628 Y97.414 E.06035
G1 X120.755 Y97.449 E.00408
G2 X121.205 Y97.457 I.265 J-2.271 E.01389
G1 X119.242 Y95.494 E.08551
G1 X119.242 Y94.96 E.01647
G1 X121.74 Y97.457 E.1088
G1 X122.275 Y97.457 E.01647
G1 X119.242 Y94.425 E.13209
G1 X119.242 Y93.89 E.01647
G1 X122.809 Y97.457 E.15538
G1 X123.344 Y97.457 E.01647
G1 X119.242 Y93.356 E.17867
G1 X119.242 Y92.821 E.01647
G1 X123.878 Y97.457 E.20196
G1 X124.413 Y97.457 E.01647
G1 X119.242 Y92.287 E.22525
G1 X119.242 Y91.752 E.01647
G1 X124.948 Y97.457 E.24854
G1 X125.482 Y97.457 E.01647
G1 X119.242 Y91.217 E.27183
G1 X119.242 Y90.683 E.01647
G1 X126.017 Y97.457 E.29512
G1 X126.551 Y97.457 E.01647
G1 X119.242 Y90.148 E.31841
G1 X119.242 Y89.614 E.01647
G1 X127.086 Y97.457 E.3417
G1 X127.621 Y97.457 E.01647
G1 X119.624 Y89.46 E.34838
G1 X120.043 Y89.345 E.0134
G1 X127.958 Y97.26 E.34478
G1 X127.958 Y96.725 E.01647
G1 X120.463 Y89.23 E.3265
G3 X120.909 Y89.142 I.427 J.987 E.01413
G1 X127.957 Y96.19 E.30705
G1 X127.957 Y95.655 E.01647
G1 X121.444 Y89.142 E.28375
G1 X121.979 Y89.142 E.01647
G1 X127.957 Y95.121 E.26045
G1 X127.957 Y94.586 E.01647
G1 X122.513 Y89.142 E.23716
G1 X123.048 Y89.142 E.01647
G1 X127.957 Y94.051 E.21386
G1 X127.957 Y93.517 E.01647
G1 X123.583 Y89.142 E.19056
G1 X124.118 Y89.143 E.01647
G1 X127.957 Y92.982 E.16726
G1 X127.957 Y92.447 E.01647
G1 X124.652 Y89.143 E.14397
G1 X125.187 Y89.143 E.01647
M73 P79 R5
G1 X127.957 Y91.913 E.12067
G1 X127.957 Y91.378 E.01647
G1 X125.722 Y89.143 E.09737
G1 X126.256 Y89.143 E.01647
G1 X127.957 Y90.843 E.07407
G1 X127.957 Y90.309 E.01647
G1 X126.791 Y89.143 E.05078
G1 X127.326 Y89.143 E.01647
G1 X128.126 Y89.944 E.03487
; WIPE_START
G1 X127.326 Y89.143 E-.43017
G1 X126.791 Y89.143 E-.20319
G1 X127.027 Y89.379 E-.12664
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.075 Y95.909 Z2.6 F42000
G1 X119.275 Y102.189 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.516262
G1 F7605.494
M204 S6000
G1 X118.954 Y102.391 E.01463
; LINE_WIDTH: 0.522498
G1 F7506.606
G1 X118.937 Y102.489 E.00388
; LINE_WIDTH: 0.489086
G1 F8068.748
G1 X118.92 Y102.587 E.00361
; LINE_WIDTH: 0.450782
G1 F8826.521
G1 X118.837 Y103.022 E.01472
; LINE_WIDTH: 0.407554
G1 F9872.916
G1 X118.754 Y103.457 E.01316
; WIPE_START
G1 X118.837 Y103.022 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.211 Y103.341 Z2.6 F42000
G1 X108.446 Y103.457 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.40634
G1 F9905.891
M204 S6000
G1 X108.364 Y103.028 E.01293
; LINE_WIDTH: 0.44726
G1 F8903.397
G1 X108.282 Y102.599 E.01439
; LINE_WIDTH: 0.485468
G1 F8134.717
G1 X108.264 Y102.496 E.00379
; LINE_WIDTH: 0.51582
G1 F7612.605
G1 X108.246 Y102.392 E.00405
G1 X107.925 Y102.19 E.01461
; OBJECT_ID: 2
; WIPE_START
G1 X108.246 Y102.392 E-.59505
G1 X108.264 Y102.496 E-.16495
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X108.185 Y94.864 Z2.6 F42000
G1 X107.879 Y65.309 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X107.866 Y65.272 E.0013
G3 X107.291 Y62.41 I6.947 J-2.886 E.09747
G1 X107.291 Y39.39 E.76359
G3 X114.79 Y31.891 I7.524 J.024 E.39043
G1 X168.31 Y31.891 E1.77533
G3 X175.809 Y39.39 I-.023 J7.522 E.39045
G1 X175.809 Y62.41 E.76359
G3 X168.31 Y69.909 I-7.523 J-.023 E.39045
G1 X114.789 Y69.909 E1.77538
G3 X108.252 Y66.067 I.025 J-7.523 E.2636
G1 X107.906 Y65.363 E.02603
M204 S10000
G1 X108.231 Y65.097 F42000
G1 F8843.478
M204 S6000
G1 X108.049 Y64.593 E.01775
G3 X107.698 Y62.406 I6.764 J-2.206 E.0738
G1 X107.698 Y39.394 E.76333
G3 X114.794 Y32.298 I7.116 J.02 E.36948
G1 X168.306 Y32.298 E1.77508
G3 X175.402 Y39.394 I-.018 J7.115 E.3695
G1 X175.402 Y62.406 E.76333
G3 X168.306 Y69.502 I-7.115 J-.019 E.3695
G1 X114.793 Y69.502 E1.7751
G3 X108.257 Y65.15 I.02 J-7.115 E.27594
M204 S250
G1 X108.598 Y64.961 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X108.421 Y64.472 E.01596
G3 X108.09 Y62.402 I6.391 J-2.085 E.06469
G1 X108.09 Y39.398 E.70685
G3 X114.798 Y32.69 I6.723 J.015 E.32356
G1 X168.302 Y32.69 E1.64403
G3 X175.01 Y39.398 I-.014 J6.722 E.32358
G1 X175.01 Y62.402 E.70685
G3 X168.302 Y69.11 I-6.722 J-.015 E.32357
G1 X114.798 Y69.11 E1.64404
G3 X108.624 Y65.014 I.015 J-6.722 E.2411
; WIPE_START
M204 S6000
G1 X108.421 Y64.472 E-.21977
G1 X108.219 Y63.709 E-.30009
G1 X108.136 Y63.189 E-.20031
G1 X108.13 Y63.084 E-.03983
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.2 Y58.456 Z2.6 F42000
G1 X149.541 Y31.509 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X168.29 Y31.509 E.62194
G3 X176.191 Y39.41 I-.006 J7.907 E.41159
G1 X176.191 Y62.39 E.76229
G3 X168.289 Y70.291 I-7.907 J-.006 E.41164
G1 X114.81 Y70.291 E1.77399
G3 X106.909 Y62.39 I.005 J-7.906 E.41161
G1 X106.909 Y39.41 E.76229
G3 X114.81 Y31.509 I7.906 J.005 E.41161
G1 X133.559 Y31.509 E.62194
G1 X133.559 Y26.53 E.16518
G3 X134.079 Y26.009 I.495 J-.026 E.0275
G1 X149.027 Y26.009 E.49585
G3 X149.541 Y26.52 I.02 J.494 E.02697
G1 X149.541 Y31.449 E.16352
M204 S10000
G1 X149.948 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X168.294 Y31.102 E.60858
G3 X176.598 Y39.406 I-.011 J8.315 E.43252
G1 X176.598 Y62.394 E.76256
G3 X168.293 Y70.698 I-8.315 J-.011 E.43255
G1 X114.806 Y70.698 E1.77427
G3 X106.502 Y62.394 I.01 J-8.314 E.43254
G1 X106.502 Y39.406 E.76256
G3 X114.806 Y31.102 I8.314 J.01 E.43254
G1 X133.152 Y31.102 E.60858
G1 X133.152 Y26.518 E.15207
G3 X134.067 Y25.602 I.899 J-.016 E.04794
G1 X149.039 Y25.602 E.49664
G3 X149.948 Y26.512 I.008 J.901 E.04751
G1 X149.948 Y31.042 E.15027
M204 S250
G1 X150.34 Y30.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X168.298 Y30.71 E.5518
G3 X176.99 Y39.402 I-.015 J8.708 E.41933
G1 X176.99 Y62.398 E.7066
G3 X168.297 Y71.09 I-8.708 J-.015 E.41935
G1 X114.802 Y71.09 E1.64376
G3 X106.11 Y62.398 I.014 J-8.706 E.41935
G1 X106.11 Y39.402 E.7066
G3 X114.802 Y30.71 I8.706 J.014 E.41935
G1 X132.76 Y30.71 E.5518
G1 X132.76 Y26.506 E.12917
G3 X134.056 Y25.21 I1.291 J-.005 E.06263
G1 X149.051 Y25.21 E.46075
G3 X150.34 Y26.504 I-.004 J1.293 E.06232
G1 X150.34 Y30.65 E.12739
; WIPE_START
M204 S6000
G1 X152.34 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.149 Y31.499 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X149.147 Y26.564 E.15164
G1 X149.106 Y26.445 E.00386
G1 X148.945 Y26.401 E.00511
G1 X134.04 Y26.412 E.45799
G1 X133.956 Y26.511 E.00399
G1 X133.951 Y31.499 E.15325
G1 X149.089 Y31.499 E.46512
M204 S10000
G1 X136.498 Y29.19 F42000
; LINE_WIDTH: 0.515151
G1 F7623.397
M204 S6000
G1 X146.837 Y29.188 E.39784
G1 X146.837 Y28.714 E.01825
G1 X136.263 Y28.719 E.40688
G1 X136.263 Y29.19 E.0181
G1 X136.438 Y29.19 E.00675
M204 S10000
G1 X135.838 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X147.263 Y29.613 E.35102
G1 X147.262 Y28.288 E.04073
G1 X135.84 Y28.296 E.35096
G1 X135.839 Y29.553 E.03864
M204 S10000
G1 X135.461 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X147.64 Y29.991 E.37421
G1 X147.639 Y27.911 E.06391
G1 X135.463 Y27.919 E.37412
G1 X135.461 Y29.931 E.0618
M204 S10000
G1 X135.084 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X148.017 Y30.368 E.3974
G1 X148.016 Y27.533 E.08709
G1 X135.086 Y27.542 E.39727
G1 X135.084 Y30.308 E.08497
M204 S10000
G1 X134.706 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X148.394 Y30.745 E.42059
G1 X148.393 Y27.156 E.11027
G1 X134.71 Y27.165 E.42043
G1 X134.706 Y30.685 E.10813
M204 S10000
G1 X134.329 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X148.772 Y31.122 E.44378
G1 X148.77 Y26.779 E.13345
G1 X134.333 Y26.789 E.44358
G1 X134.329 Y31.062 E.1313
; OBJECT_ID: 8
; WIPE_START
G1 X134.331 Y29.062 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X129.701 Y35.13 Z2.6 F42000
G1 X38.791 Y154.292 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X38.786 Y157.051 I-69.861 J1.248 E.09153
G3 X38.627 Y158.232 I-6.555 J-.28 E.03958
G1 X38.409 Y158.209 E.00727
G1 X38.409 Y145.59 E.4186
G2 X26.391 Y145.59 I-6.009 J.011 E.62552
G1 X26.391 Y158.209 E.4186
G1 X26.173 Y158.232 E.00727
G3 X26.009 Y156.789 I7.014 J-1.528 E.04827
G1 X26.009 Y145.609 E.37086
G3 X32.565 Y139.211 I6.403 J.002 E.33861
G3 X38.721 Y144.657 I-.168 J6.393 E.29611
G1 X38.912 Y146.142 E.04966
G1 X40.168 Y145.727 E.04388
G3 X40.329 Y145.708 I.15 J.578 E.00539
G1 X47.27 Y145.708 E.23025
G3 X47.791 Y146.229 I.025 J.495 E.02752
G1 X47.79 Y154.208 E.2647
G3 X47.28 Y154.69 I-.496 J-.014 E.02584
G1 X40.319 Y154.69 E.23091
G3 X40.194 Y154.678 I-.003 J-.605 E.00416
G1 X38.849 Y154.308 E.04629
M204 S10000
G1 X39.198 Y154.826 F42000
G1 F8843.478
M204 S6000
G3 X39.193 Y157.067 I-56.775 J.983 E.07435
G3 X38.182 Y160.374 I-6.834 J-.28 E.11596
G1 X38.002 Y160.325 E.00619
G1 X38.002 Y145.593 E.48868
G2 X26.798 Y145.593 I-5.602 J.007 E.58336
G1 X26.798 Y160.325 E.48868
G1 X26.618 Y160.374 E.00619
G3 X25.602 Y156.793 I5.922 J-3.615 E.12501
G1 X25.602 Y145.605 E.37112
G3 X32.575 Y138.804 I6.811 J.007 E.36004
G3 X39.123 Y144.597 I-.179 J6.8 E.31497
G1 X39.253 Y145.601 E.03358
G1 X40.057 Y145.335 E.02808
G3 X40.317 Y145.301 I.262 J.987 E.00875
G1 X47.282 Y145.301 E.23104
G3 X48.198 Y146.217 I.015 J.901 E.04793
G1 X48.197 Y154.228 E.26575
G3 X47.288 Y155.097 I-.903 J-.035 E.04612
G1 X40.311 Y155.097 E.23143
G3 X40.103 Y155.075 I.006 J-1.038 E.00698
G1 X39.256 Y154.842 E.02913
M204 S250
G1 X39.59 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X39.568 Y157.366 I-25.693 J.728 E.06227
G3 X37.61 Y161.753 I-7.246 J-.604 E.15042
G1 X37.61 Y145.597 E.49641
G2 X27.19 Y145.597 I-5.21 J.003 E.50274
G1 X27.19 Y161.753 E.49641
G3 X25.21 Y156.797 I5.276 J-4.981 E.16791
G1 X25.21 Y145.601 E.34401
G3 X32.585 Y138.412 I7.203 J.012 E.35261
G3 X39.581 Y145.079 I-.208 J7.222 E.32528
G3 X40.306 Y144.909 I.831 J1.909 E.02301
G1 X47.294 Y144.909 E.21471
G3 X48.59 Y146.205 I.003 J1.293 E.06261
G1 X48.589 Y154.248 E.24712
G3 X47.296 Y155.489 I-1.295 J-.055 E.06082
G1 X40.304 Y155.489 E.21484
G3 X39.646 Y155.361 I.12 J-2.363 E.02066
; WIPE_START
M204 S6000
G1 X39.59 Y156.797 E-.54618
M73 P80 R5
G1 X39.568 Y157.359 E-.21382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X39.631 Y154.354 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42102
G1 F9521.29
M204 S6000
G1 X38.741 Y153.463 E.03881
G1 X38.74 Y152.928 E.01648
G1 X40.126 Y154.313 E.06037
G2 X40.704 Y154.357 I.394 J-1.371 E.01799
G1 X38.74 Y152.393 E.08557
G1 X38.74 Y151.858 E.01648
G1 X41.239 Y154.357 E.10888
G1 X41.774 Y154.357 E.01647
G1 X38.74 Y151.323 E.13218
G1 X38.74 Y150.788 E.01648
G1 X42.308 Y154.357 E.15549
G1 X42.843 Y154.357 E.01647
G1 X38.74 Y150.253 E.1788
G1 X38.739 Y149.719 E.01648
G1 X43.378 Y154.357 E.2021
G1 X43.912 Y154.357 E.01647
G1 X38.739 Y149.184 E.22541
G1 X38.739 Y148.649 E.01648
G1 X44.447 Y154.357 E.24872
G1 X44.982 Y154.357 E.01647
G1 X38.739 Y148.114 E.27203
G1 X38.739 Y147.579 E.01648
G1 X45.517 Y154.357 E.29533
G1 X46.051 Y154.357 E.01647
G1 X38.738 Y147.044 E.31864
G1 X38.738 Y146.763 E.00866
G1 X38.977 Y146.748 E.00736
G1 X46.586 Y154.357 E.33155
G1 X47.121 Y154.357 E.01647
G1 X39.171 Y146.407 E.34639
G1 X39.573 Y146.274 E.01305
G1 X47.456 Y154.158 E.3435
G1 X47.457 Y153.623 E.01647
G1 X39.975 Y146.142 E.32598
G3 X40.41 Y146.042 I.431 J.875 E.01386
G1 X47.457 Y153.089 E.30705
G1 X47.457 Y152.554 E.01647
G1 X40.944 Y146.042 E.28376
G1 X41.479 Y146.042 E.01647
G1 X47.457 Y152.019 E.26046
G1 X47.457 Y151.485 E.01647
G1 X42.014 Y146.042 E.23717
G1 X42.548 Y146.042 E.01647
G1 X47.457 Y150.95 E.21387
G1 X47.457 Y150.415 E.01647
G1 X43.083 Y146.042 E.19058
G1 X43.618 Y146.042 E.01647
G1 X47.457 Y149.881 E.16728
G1 X47.457 Y149.346 E.01647
G1 X44.153 Y146.042 E.14399
G1 X44.687 Y146.042 E.01647
G1 X47.457 Y148.812 E.12069
G1 X47.457 Y148.277 E.01647
G1 X45.222 Y146.042 E.0974
G1 X45.757 Y146.042 E.01647
G1 X47.457 Y147.742 E.0741
G1 X47.457 Y147.208 E.01647
G1 X46.291 Y146.042 E.0508
G1 X46.826 Y146.042 E.01647
G1 X47.627 Y146.843 E.0349
M204 S10000
G1 X38.678 Y146.433 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.148608
G1 F15000
M204 S6000
G1 X38.658 Y146.119 E.00271
; LINE_WIDTH: 0.114143
G1 X38.638 Y145.805 E.00183
; WIPE_START
G1 X38.658 Y146.119 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.557 Y153.751 Z2.6 F42000
G1 X38.495 Y158.423 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.532244
G1 F7357.091
M204 S6000
G1 X38.443 Y158.774 E.01414
; LINE_WIDTH: 0.495929
G1 F7946.864
G1 X38.421 Y158.899 E.00469
; LINE_WIDTH: 0.45347
G1 F8768.733
G1 X38.4 Y159.024 E.00425
; LINE_WIDTH: 0.415191
G1 F9670.391
G1 X38.348 Y159.299 E.00847
; LINE_WIDTH: 0.381099
G1 F10645.273
G1 X38.296 Y159.573 E.00769
; LINE_WIDTH: 0.347006
G1 F11838.753
G1 X38.243 Y159.847 E.00692
; WIPE_START
G1 X38.296 Y159.573 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X30.665 Y159.751 Z2.6 F42000
G1 X26.556 Y159.847 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.359705
G1 F11364.175
M204 S6000
G1 X26.478 Y159.436 E.0108
; LINE_WIDTH: 0.407795
G1 F9866.393
G1 X26.4 Y159.025 E.01243
; LINE_WIDTH: 0.453194
G1 F8774.632
G1 X26.379 Y158.899 E.00427
; LINE_WIDTH: 0.495878
G1 F7947.759
G1 X26.357 Y158.773 E.00472
; LINE_WIDTH: 0.532252
G1 F7356.972
G1 X26.305 Y158.423 E.01413
; OBJECT_ID: 9
; WIPE_START
G1 X26.357 Y158.773 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X33.955 Y158.047 Z2.6 F42000
G1 X73.191 Y154.293 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X73.186 Y156.758 I-63.826 J1.098 E.08178
G3 X73.028 Y157.962 I-6.836 J-.285 E.04033
G1 X72.809 Y157.939 E.00729
G1 X72.809 Y145.89 E.39968
G2 X60.191 Y145.89 I-6.309 J.011 E.65678
G1 X60.191 Y157.941 E.39974
G1 X59.973 Y157.964 E.00728
G3 X59.809 Y156.489 I7.353 J-1.561 E.0493
G1 X59.809 Y145.91 E.35093
G3 X66.819 Y139.217 I6.694 J-.007 E.35951
G3 X73.082 Y144.697 I-.335 J6.701 E.29778
G1 X73.322 Y146.177 E.04974
G1 X74.544 Y145.735 E.04311
G3 X74.729 Y145.709 I.168 J.515 E.00621
G1 X81.719 Y145.71 E.23188
G3 X82.19 Y146.181 I-.026 J.497 E.02418
G1 X82.191 Y154.17 E.26502
G3 X81.67 Y154.691 I-.497 J.023 E.02749
G1 X74.719 Y154.691 E.23058
G3 X74.594 Y154.678 I-.003 J-.606 E.00417
G1 X73.249 Y154.309 E.04629
M204 S10000
G1 X73.598 Y154.827 F42000
G1 F8843.478
M204 S6000
G3 X73.593 Y156.774 I-50.412 J.833 E.06459
G3 X72.583 Y160.157 I-7.134 J-.286 E.11833
G1 X72.402 Y160.108 E.00622
G1 X72.402 Y145.894 E.47151
G2 X60.598 Y145.894 I-5.902 J.007 E.61462
G1 X60.598 Y160.107 E.47149
G1 X60.417 Y160.156 E.00622
G3 X59.402 Y156.493 I6.22 J-3.695 E.12757
G1 X59.402 Y145.906 E.35121
G3 X66.839 Y138.81 I7.101 J-.002 E.38123
G3 X73.482 Y144.624 I-.356 J7.109 E.31588
G1 X73.645 Y145.628 E.03374
G1 X74.425 Y145.346 E.0275
G3 X74.717 Y145.302 I.287 J.917 E.00985
G1 X81.735 Y145.303 E.2328
G3 X82.597 Y146.165 I-.047 J.909 E.04429
G1 X82.598 Y154.182 E.26595
G3 X81.682 Y155.098 I-.906 J.01 E.04786
G1 X74.711 Y155.098 E.23124
G3 X74.502 Y155.075 I.006 J-1.039 E.00698
G1 X73.656 Y154.843 E.02912
M204 S250
G1 X73.99 Y155.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X73.901 Y157.653 I-14.993 J.578 E.07116
G3 X72.01 Y161.572 I-7.516 J-1.211 E.13558
G1 X72.01 Y145.898 E.48162
G2 X60.99 Y145.898 I-5.51 J.003 E.5317
G1 X60.99 Y161.572 E.48162
G3 X59.01 Y156.497 I5.579 J-5.1 E.17122
G1 X59.01 Y145.902 E.32557
G3 X66.857 Y138.418 I7.493 J.001 E.37251
G3 X73.956 Y145.098 I-.37 J7.505 E.32591
G3 X74.706 Y144.91 I.87 J1.873 E.02389
G1 X81.751 Y144.911 E.21646
G3 X82.989 Y146.149 I-.068 J1.306 E.05896
G1 X82.99 Y154.193 E.24718
G3 X81.694 Y155.49 I-1.3 J-.004 E.06252
G1 X74.704 Y155.49 E.21478
G3 X74.046 Y155.361 I.12 J-2.366 E.02066
; WIPE_START
M204 S6000
G1 X73.984 Y156.789 E-.54307
G1 X73.929 Y157.357 E-.21693
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X74.031 Y154.354 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42097
G1 F9522.549
M204 S6000
G1 X73.141 Y153.464 E.0388
G1 X73.14 Y152.929 E.01648
G1 X74.526 Y154.314 E.06034
M73 P80 R4
G2 X75.104 Y154.357 I.394 J-1.372 E.01799
G1 X73.14 Y152.394 E.08554
G1 X73.14 Y151.859 E.01648
G1 X75.638 Y154.357 E.10885
G1 X76.173 Y154.357 E.01647
G1 X73.14 Y151.324 E.13215
G1 X73.14 Y150.789 E.01648
G1 X76.708 Y154.357 E.15545
G1 X77.242 Y154.357 E.01647
G1 X73.139 Y150.254 E.17875
G1 X73.139 Y149.72 E.01648
G1 X77.777 Y154.357 E.20205
G1 X78.312 Y154.357 E.01647
G1 X73.139 Y149.185 E.22535
G1 X73.139 Y148.65 E.01648
G1 X78.846 Y154.357 E.24866
G1 X79.381 Y154.357 E.01647
G1 X73.139 Y148.115 E.27196
G1 X73.138 Y147.58 E.01648
G1 X79.916 Y154.357 E.29526
G1 X80.45 Y154.357 E.01647
G1 X73.138 Y147.045 E.31856
G1 X73.138 Y146.809 E.00729
G1 X73.414 Y146.786 E.00852
G1 X80.985 Y154.357 E.32984
G1 X81.519 Y154.357 E.01647
G1 X73.595 Y146.433 E.34523
G1 X73.988 Y146.291 E.01286
G1 X81.855 Y154.158 E.34273
G1 X81.858 Y153.626 E.01638
G1 X74.38 Y146.149 E.32575
G3 X74.808 Y146.042 I.442 J.858 E.0137
G1 X81.857 Y153.091 E.30711
G1 X81.857 Y152.557 E.01647
G1 X75.343 Y146.042 E.28381
G1 X75.878 Y146.042 E.01647
G1 X81.857 Y152.022 E.26051
G1 X81.857 Y151.487 E.01647
G1 X76.412 Y146.042 E.23721
G1 X76.947 Y146.042 E.01647
G1 X81.857 Y150.953 E.21391
G1 X81.857 Y150.418 E.01647
G1 X77.482 Y146.043 E.19061
G1 X78.017 Y146.043 E.01647
G1 X81.857 Y149.883 E.16732
G1 X81.857 Y149.348 E.01647
G1 X78.551 Y146.043 E.14402
G1 X79.086 Y146.043 E.01647
G1 X81.857 Y148.814 E.12072
G1 X81.857 Y148.279 E.01647
G1 X79.621 Y146.043 E.09742
G1 X80.155 Y146.043 E.01647
G1 X81.857 Y147.744 E.07412
G1 X81.857 Y147.21 E.01647
G1 X80.69 Y146.043 E.05082
G1 X81.225 Y146.043 E.01647
G1 X82.026 Y146.844 E.03491
M204 S10000
G1 X73.088 Y146.478 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.161371
G1 F15000
M204 S6000
G1 X73.063 Y146.163 E.00306
; LINE_WIDTH: 0.118732
G1 X73.037 Y145.847 E.00196
; WIPE_START
G1 X73.063 Y146.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.957 Y153.795 Z2.6 F42000
G1 X72.896 Y158.153 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.535509
G1 F7308.325
M204 S6000
G1 X72.844 Y158.512 E.01455
; LINE_WIDTH: 0.497367
G1 F7921.727
G1 X72.822 Y158.648 E.00512
; LINE_WIDTH: 0.452376
G1 F8792.165
G1 X72.799 Y158.785 E.00462
; LINE_WIDTH: 0.405876
G1 F9918.579
G1 X72.722 Y159.202 E.01256
; LINE_WIDTH: 0.357865
G1 F11430.564
G1 X72.644 Y159.62 E.0109
M204 S10000
G1 X72.457 Y160.326 F42000
; LINE_WIDTH: 0.108507
G1 F15000
M204 S6000
G1 X72.224 Y160.99 E.00376
; WIPE_START
G1 X72.457 Y160.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.837 Y160.759 Z2.6 F42000
G1 X60.776 Y160.99 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.108701
G1 F15000
M204 S6000
G1 X60.542 Y160.325 E.00377
M204 S10000
G1 X60.356 Y159.62 F42000
; LINE_WIDTH: 0.357871
G1 F11430.376
M204 S6000
G1 X60.278 Y159.202 E.01091
; LINE_WIDTH: 0.40613
G1 F9911.619
G1 X60.201 Y158.784 E.01259
; LINE_WIDTH: 0.451628
G1 F8808.256
G1 X60.179 Y158.655 E.00435
; LINE_WIDTH: 0.494343
G1 F7974.791
G1 X60.158 Y158.526 E.0048
; LINE_WIDTH: 0.533187
G1 F7342.946
G1 X60.104 Y158.155 E.01499
; OBJECT_ID: 3
; WIPE_START
G1 X60.158 Y158.526 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X55.055 Y152.85 Z2.6 F42000
G1 X26.766 Y121.39 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X26.687 Y121.119 E.00937
G3 X26.391 Y119.01 I7.527 J-2.133 E.07087
G1 X26.391 Y95.99 E.76359
G3 X34.19 Y88.191 I7.823 J.024 E.40607
G1 X87.711 Y88.191 E1.77538
G3 X95.509 Y95.99 I-.026 J7.824 E.40601
G1 X95.509 Y119.01 E.76359
G3 X87.71 Y126.809 I-7.823 J-.024 E.40607
G1 X34.189 Y126.809 E1.77538
G3 X26.788 Y121.446 I.025 J-7.823 E.3238
M204 S10000
G1 X27.152 Y121.257 F42000
G1 F8843.478
M204 S6000
G1 X26.942 Y120.444 E.02787
G3 X26.798 Y119.006 I7.271 J-1.457 E.04801
G1 X26.798 Y95.994 E.76333
G3 X34.194 Y88.598 I7.416 J.019 E.38512
G1 X87.707 Y88.598 E1.7751
G3 X95.102 Y95.994 I-.021 J7.417 E.38508
G1 X95.102 Y119.006 E.76333
G3 X87.706 Y126.402 I-7.416 J-.019 E.38512
G1 X34.193 Y126.402 E1.7751
G3 X27.172 Y121.314 I.02 J-7.416 E.30721
M204 S250
G1 X27.54 Y121.155 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X27.456 Y120.902 E.00819
G3 X27.19 Y119.002 I6.757 J-1.915 E.05913
G1 X27.19 Y95.998 E.70685
G3 X34.198 Y88.99 I7.023 J.015 E.33805
G1 X87.702 Y88.99 E1.64404
G3 X94.71 Y95.998 I-.016 J7.024 E.33803
G1 X94.71 Y119.002 E.70685
G3 X87.702 Y126.01 I-7.023 J-.015 E.33805
G1 X34.198 Y126.01 E1.64404
G3 X27.727 Y121.681 I.015 J-7.023 E.25355
G1 X27.561 Y121.211 E.01532
; WIPE_START
M204 S6000
G1 X27.456 Y120.902 E-.12404
G1 X27.325 Y120.368 E-.20911
G1 X27.239 Y119.824 E-.20921
G1 X27.205 Y119.252 E-.21764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.301 Y114.659 Z2.6 F42000
G1 X68.941 Y87.809 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.69 Y87.809 E.62195
G3 X95.891 Y96.01 I-.005 J8.206 E.42724
G1 X95.891 Y118.99 E.76229
G3 X87.69 Y127.191 I-8.207 J-.006 E.42723
G1 X34.21 Y127.191 E1.77403
G3 X26.009 Y118.99 I.007 J-8.208 E.42722
G1 X26.009 Y96.01 E.76229
G3 X34.21 Y87.809 I8.207 J.006 E.42723
G1 X52.959 Y87.809 E.62194
G1 X52.959 Y82.83 E.16517
G3 X53.479 Y82.309 I.495 J-.026 E.0275
G1 X68.427 Y82.309 E.49584
G3 X68.941 Y82.83 I.02 J.495 E.02731
G1 X68.941 Y87.749 E.16319
M204 S10000
G1 X69.348 Y87.402 F42000
G1 F8843.478
M204 S6000
G1 X87.694 Y87.402 E.60858
G3 X96.298 Y96.006 I-.01 J8.614 E.44817
G1 X96.298 Y118.994 E.76256
G3 X87.694 Y127.598 I-8.614 J-.01 E.44816
G1 X34.206 Y127.598 E1.7743
G3 X25.602 Y118.994 I.012 J-8.616 E.44815
G1 X25.602 Y96.006 E.76256
G3 X34.206 Y87.402 I8.614 J.01 E.44816
G1 X52.552 Y87.402 E.60858
G1 X52.552 Y82.818 E.15207
G3 X53.467 Y81.902 I.902 J-.013 E.04789
G1 X68.439 Y81.902 E.49664
G3 X69.348 Y82.818 I.008 J.901 E.04771
G1 X69.348 Y87.342 E.15008
M204 S250
G1 X69.74 Y87.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X87.698 Y87.01 E.5518
G3 X96.69 Y96.002 I-.014 J9.006 E.43382
G1 X96.69 Y118.998 E.7066
G3 X87.698 Y127.99 I-9.007 J-.015 E.43382
G1 X34.202 Y127.99 E1.64378
G3 X25.21 Y118.998 I.016 J-9.008 E.4338
G1 X25.21 Y96.002 E.7066
G3 X34.202 Y87.01 I9.007 J.015 E.43382
G1 X52.16 Y87.01 E.5518
M73 P81 R4
G1 X52.16 Y82.806 E.12917
G3 X53.456 Y81.51 I1.296 J-.001 E.06257
G1 X68.451 Y81.51 E.46075
G3 X69.74 Y82.806 I-.003 J1.293 E.06239
G1 X69.74 Y86.95 E.12733
; WIPE_START
M204 S6000
G1 X71.74 Y86.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.14 Y86.253 Z2.6 F42000
G1 X55.899 Y85.489 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51554
G1 F7617.121
M204 S6000
G1 X66.235 Y85.488 E.39808
G1 X66.235 Y85.014 E.01827
G1 X55.663 Y85.018 E.40712
G1 X55.663 Y85.489 E.01814
G1 X55.839 Y85.489 E.00677
M204 S10000
G1 X66.661 Y85.913 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.66 Y84.588 E.04073
G1 X55.24 Y84.595 E.3509
G1 X55.238 Y85.913 E.04053
G1 X66.601 Y85.913 E.34914
M204 S10000
G1 X67.039 Y86.291 F42000
G1 F9547.299
M204 S6000
G1 X67.036 Y84.21 E.06391
G1 X54.863 Y84.218 E.37404
G1 X54.861 Y86.291 E.06369
G1 X66.979 Y86.291 E.37234
M204 S10000
G1 X67.416 Y86.668 F42000
G1 F9547.299
M204 S6000
G1 X67.413 Y83.833 E.08709
G1 X54.486 Y83.841 E.39719
G1 X54.484 Y86.668 E.08686
G1 X67.356 Y86.668 E.39553
M204 S10000
G1 X67.794 Y87.045 F42000
G1 F9547.299
M204 S6000
G1 X67.79 Y83.456 E.11027
G1 X54.11 Y83.464 E.42034
G1 X54.106 Y87.045 E.11002
G1 X67.734 Y87.045 E.41873
M204 S10000
G1 X68.171 Y87.422 F42000
G1 F9547.299
M204 S6000
G1 X68.166 Y83.079 E.13345
G1 X53.733 Y83.087 E.44349
G1 X53.729 Y87.422 E.13319
G1 X68.111 Y87.422 E.44193
M204 S10000
G1 X68.549 Y87.799 F42000
G1 F9547.299
M204 S6000
G1 X68.543 Y82.853 E.15198
G1 X68.498 Y82.736 E.00384
G1 X68.358 Y82.701 E.00444
G1 X53.443 Y82.71 E.45827
G1 X53.356 Y82.81 E.00407
G1 X53.351 Y87.799 E.15327
G1 X68.489 Y87.799 E.46512
; OBJECT_ID: 1
; WIPE_START
G1 X66.489 Y87.799 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X69.885 Y80.964 Z2.6 F42000
G1 X92.907 Y34.638 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X92.935 Y34.678 E.00162
G3 X94.509 Y39.19 I-5.749 J4.536 E.1615
G1 X94.509 Y62.21 E.76359
G3 X87.21 Y69.509 I-7.322 J-.023 E.38003
G1 X33.69 Y69.509 E1.77533
G3 X26.391 Y62.211 I.023 J-7.322 E.37998
G1 X26.391 Y39.19 E.76363
G3 X33.69 Y31.891 I7.323 J.024 E.38001
G1 X87.211 Y31.891 E1.77538
G3 X92.364 Y34.035 I-.024 J7.322 E.18996
G1 X92.867 Y34.593 E.0249
M204 S10000
G1 X92.603 Y34.908 F42000
G1 F8843.478
M204 S6000
G1 X92.616 Y34.93 E.00085
G3 X94.102 Y39.194 I-5.429 J4.283 E.1526
G1 X94.102 Y62.206 E.76333
G3 X87.206 Y69.102 I-6.915 J-.018 E.35908
G1 X33.694 Y69.102 E1.77508
G3 X26.798 Y62.207 I.018 J-6.915 E.35905
G1 X26.798 Y39.194 E.76336
G3 X33.694 Y32.298 I6.916 J.019 E.35907
G1 X87.207 Y32.298 E1.7751
G3 X92.077 Y34.323 I-.019 J6.915 E.17951
G1 X92.563 Y34.863 E.02411
M204 S250
G1 X92.311 Y35.168 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X92.309 Y35.173 E.00017
G3 X93.71 Y39.198 I-5.121 J4.039 E.13342
G1 X93.71 Y62.202 E.70685
G3 X87.202 Y68.71 I-6.522 J-.014 E.31392
G1 X33.698 Y68.71 E1.64404
G3 X27.19 Y62.202 I.014 J-6.522 E.31392
G1 X27.19 Y39.198 E.70686
G3 X33.698 Y32.69 I6.523 J.015 E.31391
G1 X87.202 Y32.69 E1.64404
G3 X91.8 Y34.6 I-.014 J6.522 E.15696
G1 X92.271 Y35.123 E.02162
; WIPE_START
M204 S6000
G1 X92.309 Y35.173 E-.02369
G1 X92.613 Y35.583 E-.19417
G1 X92.88 Y36.019 E-.19432
G1 X93.214 Y36.709 E-.29119
G1 X93.266 Y36.848 E-.05663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.804 Y35.244 Z2.6 F42000
G1 X68.441 Y31.509 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X87.19 Y31.509 E.62194
G3 X94.891 Y39.21 I-.005 J7.706 E.40119
G1 X94.891 Y62.19 E.76229
G3 X87.19 Y69.891 I-7.706 J-.005 E.40119
G1 X33.71 Y69.891 E1.77403
G3 X26.009 Y62.19 I.005 J-7.706 E.40119
G1 X26.009 Y39.21 E.76229
G3 X33.71 Y31.509 I7.706 J.005 E.40119
G1 X52.459 Y31.509 E.62194
G1 X52.459 Y26.53 E.16518
G3 X52.97 Y26.009 I.494 J-.026 E.02719
G1 X67.927 Y26.009 E.49615
G3 X68.441 Y26.53 I.02 J.495 E.0273
G1 X68.441 Y31.449 E.16319
M204 S10000
G1 X68.848 Y31.102 F42000
G1 F8843.478
M204 S6000
G1 X87.194 Y31.102 E.60858
G3 X95.298 Y39.206 I-.01 J8.113 E.42212
G1 X95.298 Y62.194 E.76256
G3 X87.194 Y70.298 I-8.113 J-.01 E.42212
G1 X33.706 Y70.298 E1.7743
G3 X25.602 Y62.194 I.01 J-8.113 E.42212
G1 X25.602 Y39.206 E.76256
G3 X33.706 Y31.102 I8.113 J.01 E.42212
G1 X52.052 Y31.102 E.60858
G1 X52.052 Y26.518 E.15207
G3 X52.962 Y25.602 I.902 J-.013 E.04771
G1 X67.939 Y25.602 E.49682
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
G1 X95.69 Y62.198 E.7066
G3 X87.198 Y70.69 I-8.506 J-.014 E.4097
G1 X33.702 Y70.69 E1.64378
G3 X25.21 Y62.198 I.014 J-8.506 E.4097
G1 X25.21 Y39.202 E.7066
G3 X33.702 Y30.71 I8.506 J.014 E.4097
G1 X51.66 Y30.71 E.5518
G1 X51.66 Y26.506 E.12917
G3 X52.954 Y25.21 I1.296 J-.001 E.06251
G1 X67.951 Y25.21 E.46081
G3 X69.24 Y26.506 I-.003 J1.293 E.06239
G1 X69.24 Y30.65 E.12733
; WIPE_START
M204 S6000
G1 X71.24 Y30.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.616 Y31.006 Z2.6 F42000
G1 X52.851 Y31.499 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X68.049 Y31.499 E.46697
G1 X68.043 Y26.553 E.15198
G1 X67.998 Y26.436 E.00384
G1 X67.858 Y26.401 E.00444
G1 X52.989 Y26.401 E.45685
G1 X52.891 Y26.437 E.00321
G1 X52.856 Y26.544 E.00345
G1 X52.851 Y31.439 E.15041
M204 S10000
G1 X65.497 Y29.187 F42000
; LINE_WIDTH: 0.517795
G1 F7580.952
M204 S6000
G1 X65.735 Y29.187 E.0092
G1 X65.734 Y28.713 E.01837
G1 X55.165 Y28.713 E.40898
G1 X55.165 Y29.187 E.01838
G1 X65.437 Y29.187 E.3975
M204 S10000
G1 X66.161 Y29.613 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X66.16 Y28.287 E.04077
G1 X54.74 Y28.287 E.3509
G1 X54.738 Y29.613 E.04077
G1 X66.101 Y29.613 E.34914
M204 S10000
G1 X66.539 Y29.991 F42000
G1 F9547.299
M204 S6000
G1 X66.536 Y27.91 E.06394
G1 X54.363 Y27.91 E.37404
G1 X54.361 Y29.991 E.06394
M73 P82 R4
G1 X66.479 Y29.991 E.37234
M204 S10000
G1 X66.916 Y30.368 F42000
G1 F9547.299
M204 S6000
G1 X66.913 Y27.533 E.08711
G1 X53.986 Y27.532 E.39719
G1 X53.984 Y30.368 E.08711
G1 X66.856 Y30.368 E.39553
M204 S10000
G1 X67.294 Y30.745 F42000
G1 F9547.299
M204 S6000
G1 X67.29 Y27.155 E.11028
G1 X53.61 Y27.155 E.42034
G1 X53.606 Y30.745 E.11029
G1 X67.234 Y30.745 E.41873
M204 S10000
G1 X67.671 Y31.122 F42000
G1 F9547.299
M204 S6000
G1 X67.666 Y26.778 E.13345
G1 X53.233 Y26.778 E.44349
G1 X53.229 Y31.122 E.13346
G1 X67.611 Y31.122 E.44193
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X65.611 Y31.122 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 12/15
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S160.65
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z2.6 I-.487 J1.115 P1  F42000
G1 X219.59 Y98.375 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X219.585 Y100.364 I-51.721 J.86 E.06112
G3 X217.81 Y104.72 I-6.894 J-.27 E.14748
G1 X217.81 Y88.497 E.49849
G2 X207.59 Y88.497 I-5.11 J.003 E.49311
G1 X207.59 Y104.72 E.49849
G3 X205.81 Y100.096 I5.124 J-4.627 E.1557
G1 X205.81 Y88.501 E.35629
G3 X212.838 Y81.61 I6.903 J.011 E.3367
G3 X219.595 Y88.226 I-.15 J6.912 E.31998
G3 X220.406 Y88.009 I.933 J1.859 E.02597
G1 X227.449 Y88.01 E.2164
G3 X228.689 Y89.25 I-.059 J1.299 E.05914
G1 X228.69 Y97.293 E.24712
G3 X227.394 Y98.589 I-1.293 J.003 E.06261
G1 X220.406 Y98.589 E.21472
G3 X219.644 Y98.401 I.129 J-2.157 E.02424
; WIPE_START
M204 S6000
G1 X219.585 Y100.364 E-.74645
G1 X219.582 Y100.4 E-.01355
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 7
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X207.383 Y102.933 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X206.9 Y103.416 E.02096
G1 X206.714 Y103.069
G1 X207.383 Y102.4 E.02906
G1 X207.383 Y101.867
G1 X206.547 Y102.703 E.03632
G1 X206.398 Y102.319
G1 X207.383 Y101.334 E.0428
G1 X207.383 Y100.8
G1 X206.269 Y101.914 E.04838
G1 X206.164 Y101.486
G1 X207.383 Y100.267 E.05295
G1 X207.383 Y99.734
G1 X206.084 Y101.032 E.05643
G1 X206.034 Y100.55
G1 X207.383 Y99.201 E.05862
G1 X207.383 Y98.667
G1 X206.017 Y100.033 E.05933
G1 X206.017 Y99.499
G1 X207.383 Y98.134 E.05933
G1 X207.383 Y97.601
G1 X206.017 Y98.966 E.05933
G1 X206.017 Y98.433
G1 X207.383 Y97.068 E.05933
G1 X207.383 Y96.534
G1 X206.017 Y97.9 E.05933
G1 X206.017 Y97.366
G1 X207.383 Y96.001 E.05933
G1 X207.383 Y95.468
G1 X206.017 Y96.833 E.05933
G1 X206.017 Y96.3
G1 X207.383 Y94.935 E.05933
G1 X207.383 Y94.401
G1 X206.017 Y95.767 E.05933
G1 X206.017 Y95.233
G1 X207.383 Y93.868 E.05933
G1 X207.383 Y93.335
G1 X206.017 Y94.7 E.05933
G1 X206.017 Y94.167
G1 X207.383 Y92.802 E.05933
G1 X207.383 Y92.268
G1 X206.017 Y93.634 E.05933
G1 X206.017 Y93.1
G1 X207.383 Y91.735 E.05933
G1 X207.383 Y91.202
G1 X206.017 Y92.567 E.05933
G1 X206.017 Y92.034
G1 X207.383 Y90.669 E.05933
G1 X207.383 Y90.135
G1 X206.017 Y91.5 E.05933
G1 X206.017 Y90.967
G1 X207.383 Y89.602 E.05933
G1 X207.383 Y89.069
G1 X206.017 Y90.434 E.05933
G1 X206.017 Y89.901
G1 X207.383 Y88.535 E.05933
G1 X207.409 Y87.975
G1 X206.017 Y89.367 E.06049
G1 X206.017 Y88.834
G1 X207.511 Y87.34 E.06492
G1 X207.744 Y86.574
G1 X206.021 Y88.297 E.07485
G1 X206.063 Y87.722
G1 X208.368 Y85.417 E.10015
; WIPE_START
M204 S6000
G1 X206.954 Y86.831 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X211.553 Y92.922 Z2.8 F42000
G1 X218.884 Y102.63 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X218.017 Y103.497 E.03766
G1 X218.017 Y102.964
G1 X219.155 Y101.827 E.04942
G1 X219.299 Y101.149
G1 X218.017 Y102.431 E.0557
G1 X218.017 Y101.897
G1 X219.366 Y100.548 E.05862
G1 X219.383 Y99.999
G1 X218.017 Y101.364 E.05933
G1 X218.017 Y100.831
G1 X219.383 Y99.466 E.05933
G1 X219.383 Y98.932
G1 X218.017 Y100.298 E.05933
G1 X218.017 Y99.764
G1 X219.383 Y98.399 E.05933
; WIPE_START
M204 S6000
G1 X218.017 Y99.764 E-.73368
G1 X218.017 Y99.834 E-.02632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X225.56 Y98.666 Z2.8 F42000
G1 X227.4 Y98.381 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X228.482 Y97.299 E.04703
G1 X228.483 Y96.765
G1 X226.866 Y98.382 E.07026
G1 X226.332 Y98.382
G1 X228.482 Y96.232 E.09343
G1 X228.482 Y95.698
G1 X225.799 Y98.382 E.1166
G1 X225.266 Y98.382
G1 X228.482 Y95.165 E.13977
G1 X228.482 Y94.632
G1 X224.733 Y98.382 E.16294
G1 X224.199 Y98.382
G1 X228.482 Y94.099 E.1861
G1 X228.482 Y93.566
G1 X223.666 Y98.382 E.20927
G1 X223.133 Y98.382
G1 X228.482 Y93.032 E.23244
G1 X228.482 Y92.499
G1 X222.6 Y98.382 E.25561
G1 X222.066 Y98.382
G1 X228.482 Y91.966 E.27878
G1 X228.482 Y91.433
G1 X221.533 Y98.382 E.30195
G1 X221 Y98.382
G1 X228.482 Y90.9 E.32512
G1 X228.482 Y90.367
G1 X220.467 Y98.382 E.34829
G1 X220.008 Y98.307
G1 X228.482 Y89.833 E.3682
G1 X228.481 Y89.3
G1 X219.617 Y98.165 E.3852
; WIPE_START
M204 S6000
G1 X221.031 Y96.75 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X218.017 Y99.231 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X224.007 Y93.242 E.26026
G1 X224.1 Y93.149
G1 X228.389 Y88.86 E.18637
G1 X228.173 Y88.542
G1 X218.017 Y98.698 E.44131
G1 X218.017 Y98.164
G1 X227.86 Y88.322 E.42772
G1 X227.431 Y88.217
G1 X218.017 Y97.631 E.40907
G1 X218.017 Y97.098
G1 X226.898 Y88.217 E.38591
G1 X226.365 Y88.217
G1 X218.017 Y96.565 E.36274
G1 X218.017 Y96.031
G1 X225.832 Y88.217 E.33957
G1 X225.298 Y88.217
G1 X218.017 Y95.498 E.3164
G1 X218.017 Y94.965
G1 X224.765 Y88.217 E.29323
G1 X224.232 Y88.217
G1 X218.017 Y94.432 E.27006
G1 X218.017 Y93.898
G1 X223.699 Y88.217 E.24689
G1 X223.166 Y88.217
G1 X218.017 Y93.365 E.22372
G1 X218.017 Y92.832
G1 X222.633 Y88.217 E.20056
G1 X222.099 Y88.217
G1 X218.017 Y92.299 E.17739
G1 X218.017 Y91.765
G1 X221.566 Y88.216 E.15422
G1 X221.033 Y88.216
G1 X218.017 Y91.232 E.13105
G1 X218.017 Y90.699
G1 X220.5 Y88.216 E.10788
G1 X219.82 Y88.363
G1 X218.017 Y90.166 E.07833
G1 X218.017 Y89.632
G1 X219.39 Y88.259 E.05966
G1 X219.342 Y87.774
G1 X218.017 Y89.099 E.05756
G1 X218.017 Y88.566
G1 X219.274 Y87.309 E.05462
G1 X219.18 Y86.87
G1 X217.998 Y88.052 E.05137
G1 X217.937 Y87.58
G1 X219.061 Y86.455 E.04889
G1 X218.921 Y86.062
G1 X217.841 Y87.143 E.04695
G1 X217.715 Y86.735
G1 X218.762 Y85.688 E.04549
G1 X218.584 Y85.333
G1 X217.564 Y86.353 E.0443
G1 X217.39 Y85.994
G1 X218.389 Y84.994 E.04345
G1 X218.177 Y84.673
G1 X217.194 Y85.657 E.04275
G1 X216.977 Y85.34
G1 X217.951 Y84.367 E.04229
G1 X217.708 Y84.076
G1 X216.741 Y85.043 E.04204
G1 X216.485 Y84.766
G1 X217.45 Y83.801 E.04194
G1 X217.178 Y83.539
G1 X216.211 Y84.507 E.04203
G1 X215.918 Y84.266
G1 X216.89 Y83.295 E.04223
G1 X216.587 Y83.064
G1 X215.605 Y84.046 E.04266
G1 X215.272 Y83.846
G1 X216.268 Y82.85 E.04327
G1 X215.933 Y82.651
G1 X214.917 Y83.667 E.04413
G1 X214.54 Y83.511
G1 X215.581 Y82.47 E.04522
M73 P83 R4
G1 X215.211 Y82.307
G1 X214.137 Y83.38 E.04665
G1 X213.706 Y83.278
G1 X214.821 Y82.163 E.04845
G1 X214.412 Y82.039
G1 X213.242 Y83.209 E.05084
G1 X212.736 Y83.182
G1 X213.978 Y81.941 E.05397
G1 X213.517 Y81.868
G1 X212.178 Y83.207 E.05821
G1 X211.543 Y83.309
G1 X213.026 Y81.825 E.06447
G1 X212.498 Y81.82
G1 X210.776 Y83.542 E.07483
; WIPE_START
M204 S6000
G1 X212.19 Y82.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.622 Y84.163 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X211.922 Y81.863 E.09992
G1 X211.283 Y81.969
G1 X206.171 Y87.081 E.22214
G1 X206.376 Y86.342
G1 X210.544 Y82.175 E.18111
G1 X209.61 Y82.575
G1 X206.774 Y85.411 E.12325
; WIPE_START
M204 S6000
G1 X208.188 Y83.997 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X214.516 Y88.265 Z2.8 F42000
G1 X228.431 Y97.649 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.144811
G1 F15000
M204 S6000
G3 X228.262 Y97.875 I-2.969 J-2.033 E.00234
; LINE_WIDTH: 0.179614
G3 X227.912 Y98.212 I-1.772 J-1.494 E.00543
; LINE_WIDTH: 0.138188
G1 X227.844 Y98.262 E.00065
; LINE_WIDTH: 0.10357
G3 X227.747 Y98.325 I-.863 J-1.215 E.00057
M204 S10000
G1 X228.426 Y97.646 F42000
; LINE_WIDTH: 0.0899645
G1 F15000
M204 S6000
G1 X228.139 Y98.114 E.00211
; WIPE_START
G1 X228.426 Y97.646 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X228.088 Y90.021 Z2.8 F42000
G1 X228.018 Y88.431 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0995876
G1 F15000
M204 S6000
G2 X227.913 Y88.346 I-.927 J1.038 E.00062
; WIPE_START
G1 X228.018 Y88.431 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X220.506 Y87.08 Z2.8 F42000
G1 X219.175 Y86.841 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.095115
G1 F15000
M204 S6000
G1 X219.09 Y86.693 E.00072
; WIPE_START
G1 X219.175 Y86.841 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X218.919 Y94.469 Z2.8 F42000
G1 X218.628 Y103.181 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.106109
G1 F15000
M204 S6000
G1 X218.544 Y103.294 E.00073
; LINE_WIDTH: 0.141214
G1 X218.466 Y103.397 E.00104
; LINE_WIDTH: 0.175525
G1 X218.387 Y103.5 E.0014
; LINE_WIDTH: 0.207401
G1 X218.306 Y103.602 E.00175
; LINE_WIDTH: 0.226796
G1 X218.224 Y103.704 E.00196
G3 X217.999 Y103.634 I-.033 J-.291 E.00365
; WIPE_START
G1 X218.092 Y103.689 E-.2221
G1 X218.224 Y103.704 E-.27118
G1 X218.306 Y103.602 E-.26673
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X210.687 Y103.145 Z2.8 F42000
G1 X206.613 Y102.9 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.110073
G1 F15000
M204 S6000
G1 X206.625 Y102.836 E.00036
G1 X206.565 Y102.747 E.00059
; WIPE_START
G1 X206.625 Y102.836 E-.47238
G1 X206.613 Y102.9 E-.28762
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.212 Y95.291 Z2.8 F42000
G1 X207.932 Y86.146 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.103041
G1 F15000
M204 S6000
G1 X207.866 Y86.239 E.00056
; LINE_WIDTH: 0.137665
G1 X207.805 Y86.327 E.00083
; LINE_WIDTH: 0.1775
G1 X207.743 Y86.419 E.00121
; LINE_WIDTH: 0.203235
G1 X207.681 Y86.512 E.00146
; WIPE_START
G1 X207.743 Y86.419 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X206.835 Y85.473 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.203416
G1 F15000
M204 S6000
G1 X206.759 Y85.579 E.00171
; LINE_WIDTH: 0.175271
G1 X206.683 Y85.685 E.00141
; LINE_WIDTH: 0.142942
G1 X206.62 Y85.776 E.00091
; LINE_WIDTH: 0.106432
G1 X206.558 Y85.868 E.00058
; WIPE_START
G1 X206.62 Y85.776 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X208.849 Y83.04 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107304
G1 F15000
M204 S6000
G1 X208.638 Y83.222 E.00147
; LINE_WIDTH: 0.152756
G2 X208.248 Y83.578 I8.757 J9.971 E.00473
; LINE_WIDTH: 0.171248
G2 X207.512 Y84.337 I12.331 J12.706 E.01105
; LINE_WIDTH: 0.125291
G1 X207.337 Y84.536 E.00178
; LINE_WIDTH: 0.0981722
G1 X207.246 Y84.644 E.00064
; WIPE_START
G1 X207.337 Y84.536 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X209.562 Y84.102 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.217419
G1 F15000
M204 S6000
G1 X209.253 Y84.375 E.00586
; LINE_WIDTH: 0.184944
G1 X208.795 Y84.819 E.00738
G1 X208.502 Y85.133 E.00498
; LINE_WIDTH: 0.217368
G1 X208.369 Y85.284 E.00285
G1 X208.38 Y85.429 E.00207
; WIPE_START
G1 X208.369 Y85.284 E-.31987
G1 X208.502 Y85.133 E-.44013
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X210.713 Y83.48 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.196154
G1 F15000
M204 S6000
G1 X210.621 Y83.541 E.00138
; LINE_WIDTH: 0.169482
G1 X210.527 Y83.605 E.00117
; LINE_WIDTH: 0.13882
G1 X210.438 Y83.667 E.00085
; LINE_WIDTH: 0.105056
G1 X210.349 Y83.73 E.00055
; WIPE_START
G1 X210.438 Y83.667 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X211.477 Y83.243 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.146624
G1 F15000
M204 S6000
G1 X211.211 Y83.395 E.00258
; WIPE_START
G1 X211.477 Y83.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X214.993 Y82.258 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0986145
G1 F15000
M204 S6000
G1 X214.856 Y82.173 E.00073
; OBJECT_ID: 6
; WIPE_START
G1 X214.993 Y82.258 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X208.333 Y85.985 Z2.8 F42000
G1 X186.19 Y98.375 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X186.185 Y100.364 I-51.511 J.861 E.06112
G3 X184.41 Y104.72 I-6.894 J-.27 E.14748
G1 X184.41 Y88.497 E.49849
G2 X174.19 Y88.497 I-5.11 J.003 E.49309
G1 X174.19 Y104.72 E.49849
G3 X172.41 Y100.096 I5.124 J-4.627 E.1557
G1 X172.41 Y88.501 E.35629
G3 X179.438 Y81.61 I6.903 J.011 E.3367
G3 X186.195 Y88.226 I-.15 J6.911 E.31998
G3 X187.006 Y88.009 I.933 J1.859 E.02597
G1 X194.051 Y88.01 E.21646
G3 X195.289 Y89.248 I-.061 J1.3 E.05903
G1 X195.29 Y97.293 E.24718
G3 X193.994 Y98.589 I-1.293 J.003 E.06261
G1 X187.004 Y98.589 E.21477
G3 X186.245 Y98.4 I.168 J-2.301 E.02417
; WIPE_START
M204 S6000
G1 X186.185 Y100.364 E-.74669
G1 X186.182 Y100.399 E-.01331
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X193.572 Y98.491 Z2.8 F42000
G1 X194 Y98.381 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X195.082 Y97.299 E.04703
G1 X195.083 Y96.765
G1 X193.466 Y98.382 E.07026
G1 X192.932 Y98.382
G1 X195.082 Y96.232 E.09343
G1 X195.082 Y95.698
G1 X192.399 Y98.382 E.1166
G1 X191.866 Y98.382
G1 X195.082 Y95.165 E.13977
G1 X195.082 Y94.632
G1 X191.333 Y98.382 E.16294
G1 X190.799 Y98.382
G1 X195.082 Y94.099 E.1861
G1 X195.082 Y93.566
G1 X190.266 Y98.382 E.20927
G1 X189.733 Y98.382
G1 X195.082 Y93.032 E.23244
G1 X195.082 Y92.499
G1 X189.2 Y98.382 E.25561
G1 X188.666 Y98.382
G1 X195.082 Y91.966 E.27878
G1 X195.082 Y91.433
G1 X188.133 Y98.382 E.30195
G1 X187.6 Y98.382
G1 X195.082 Y90.9 E.32512
G1 X195.082 Y90.367
G1 X187.067 Y98.382 E.34829
G1 X186.608 Y98.307
G1 X195.082 Y89.833 E.3682
G1 X195.081 Y89.3
G1 X186.217 Y98.165 E.3852
; WIPE_START
M204 S6000
G1 X187.631 Y96.75 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.484 Y102.63 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X184.617 Y103.497 E.03766
G1 X184.617 Y102.964
G1 X185.755 Y101.827 E.04942
G1 X185.899 Y101.149
G1 X184.617 Y102.431 E.0557
G1 X184.617 Y101.897
G1 X185.966 Y100.548 E.05862
G1 X185.983 Y99.999
G1 X184.617 Y101.364 E.05933
G1 X184.617 Y100.831
G1 X185.983 Y99.466 E.05933
G1 X185.983 Y98.932
G1 X184.617 Y100.298 E.05933
G1 X184.617 Y99.764
G1 X185.983 Y98.399 E.05933
; WIPE_START
M204 S6000
G1 X184.617 Y99.764 E-.73368
G1 X184.617 Y99.834 E-.02632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X184.617 Y99.231 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X194.988 Y88.86 E.45066
G1 X194.773 Y88.542
G1 X184.617 Y98.698 E.44131
G1 X184.617 Y98.164
G1 X194.46 Y88.322 E.42772
G1 X194.031 Y88.217
G1 X184.617 Y97.631 E.40907
G1 X184.617 Y97.098
G1 X193.498 Y88.217 E.38591
G1 X192.965 Y88.217
G1 X184.617 Y96.565 E.36274
G1 X184.617 Y96.031
G1 X192.432 Y88.217 E.33957
G1 X191.898 Y88.217
G1 X184.617 Y95.498 E.3164
G1 X184.617 Y94.965
G1 X191.365 Y88.217 E.29323
G1 X190.832 Y88.217
G1 X184.617 Y94.432 E.27006
G1 X184.617 Y93.898
G1 X190.299 Y88.217 E.24689
G1 X189.766 Y88.217
G1 X184.617 Y93.365 E.22372
G1 X184.617 Y92.832
G1 X189.233 Y88.217 E.20056
G1 X188.699 Y88.217
G1 X184.617 Y92.299 E.17739
G1 X184.617 Y91.765
G1 X188.166 Y88.216 E.15422
G1 X187.633 Y88.216
G1 X184.617 Y91.232 E.13105
G1 X184.617 Y90.699
G1 X187.1 Y88.216 E.10788
G1 X186.42 Y88.363
G1 X184.617 Y90.166 E.07833
G1 X184.617 Y89.632
G1 X185.99 Y88.26 E.05965
G1 X185.942 Y87.774
G1 X184.617 Y89.099 E.05756
G1 X184.617 Y88.566
G1 X185.874 Y87.309 E.05462
G1 X185.78 Y86.87
G1 X184.598 Y88.052 E.05137
G1 X184.537 Y87.58
G1 X185.661 Y86.455 E.04889
G1 X185.521 Y86.062
G1 X184.441 Y87.143 E.04695
G1 X184.315 Y86.735
G1 X185.362 Y85.688 E.04549
G1 X185.184 Y85.333
G1 X184.164 Y86.353 E.04431
G1 X183.99 Y85.994
G1 X184.989 Y84.994 E.04345
G1 X184.777 Y84.673
G1 X183.794 Y85.657 E.04275
G1 X183.577 Y85.34
G1 X184.551 Y84.367 E.04229
G1 X184.308 Y84.076
G1 X183.341 Y85.043 E.04204
G1 X183.085 Y84.766
G1 X184.05 Y83.801 E.04194
G1 X183.778 Y83.539
G1 X182.811 Y84.507 E.04204
G1 X182.518 Y84.266
G1 X183.49 Y83.295 E.04223
G1 X183.187 Y83.064
G1 X182.205 Y84.045 E.04266
G1 X181.872 Y83.846
G1 X182.868 Y82.85 E.04327
G1 X182.533 Y82.651
G1 X181.517 Y83.667 E.04413
G1 X181.14 Y83.511
G1 X182.181 Y82.47 E.04522
G1 X181.811 Y82.307
G1 X180.737 Y83.38 E.04665
G1 X180.306 Y83.278
G1 X181.421 Y82.163 E.04845
G1 X181.012 Y82.039
G1 X179.842 Y83.209 E.05084
G1 X179.336 Y83.182
G1 X180.578 Y81.941 E.05397
G1 X180.117 Y81.868
G1 X178.778 Y83.207 E.05821
G1 X178.143 Y83.309
G1 X179.626 Y81.825 E.06447
G1 X179.098 Y81.82
G1 X177.376 Y83.542 E.07483
; WIPE_START
M204 S6000
G1 X178.79 Y82.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X176.222 Y84.163 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X178.522 Y81.863 E.09992
; WIPE_START
M204 S6000
G1 X177.108 Y83.277 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X175.762 Y90.79 Z2.8 F42000
G1 X173.5 Y103.416 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X173.983 Y102.933 E.02096
G1 X173.983 Y102.4
G1 X173.314 Y103.069 E.02906
G1 X173.147 Y102.703
G1 X173.983 Y101.867 E.03632
G1 X173.983 Y101.334
G1 X172.998 Y102.319 E.0428
G1 X172.869 Y101.914
G1 X173.983 Y100.8 E.04838
G1 X173.983 Y100.267
G1 X172.764 Y101.486 E.05295
G1 X172.684 Y101.032
G1 X173.983 Y99.734 E.05643
G1 X173.983 Y99.201
G1 X172.634 Y100.55 E.05862
G1 X172.617 Y100.033
G1 X173.983 Y98.667 E.05933
G1 X173.983 Y98.134
G1 X172.617 Y99.499 E.05933
G1 X172.617 Y98.966
G1 X173.983 Y97.601 E.05933
G1 X173.983 Y97.068
G1 X172.617 Y98.433 E.05933
G1 X172.617 Y97.9
G1 X173.983 Y96.534 E.05933
G1 X173.983 Y96.001
G1 X172.617 Y97.366 E.05933
G1 X172.617 Y96.833
G1 X173.983 Y95.468 E.05933
G1 X173.983 Y94.935
G1 X172.617 Y96.3 E.05933
G1 X172.617 Y95.767
G1 X173.983 Y94.401 E.05933
G1 X173.983 Y93.868
G1 X172.617 Y95.233 E.05933
G1 X172.617 Y94.7
G1 X173.983 Y93.335 E.05933
G1 X173.983 Y92.802
G1 X172.617 Y94.167 E.05933
G1 X172.617 Y93.633
G1 X173.983 Y92.268 E.05933
G1 X173.983 Y91.735
G1 X172.617 Y93.1 E.05933
G1 X172.617 Y92.567
G1 X173.983 Y91.202 E.05933
G1 X173.983 Y90.668
G1 X172.617 Y92.034 E.05933
G1 X172.617 Y91.5
G1 X173.983 Y90.135 E.05933
G1 X173.983 Y89.602
G1 X172.617 Y90.967 E.05933
G1 X172.617 Y90.434
G1 X173.983 Y89.069 E.05933
G1 X173.983 Y88.535
G1 X172.617 Y89.901 E.05933
G1 X172.617 Y89.367
G1 X174.009 Y87.975 E.06049
G1 X174.111 Y87.34
G1 X172.617 Y88.834 E.06492
G1 X172.621 Y88.297
G1 X174.344 Y86.574 E.07485
; WIPE_START
M204 S6000
G1 X172.93 Y87.989 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X174.968 Y85.417 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X172.663 Y87.722 E.10015
G1 X172.771 Y87.081
G1 X177.883 Y81.969 E.22214
G1 X177.144 Y82.175
G1 X172.976 Y86.342 E.1811
G1 X173.374 Y85.411
G1 X176.21 Y82.575 E.12325
; WIPE_START
M204 S6000
G1 X174.796 Y83.989 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X178.441 Y90.695 Z2.8 F42000
M73 P84 R4
G1 X185.228 Y103.181 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106084
G1 F15000
M204 S6000
G1 X185.144 Y103.294 E.00072
; LINE_WIDTH: 0.141157
G1 X185.066 Y103.397 E.00104
; LINE_WIDTH: 0.1755
G1 X184.987 Y103.5 E.0014
; LINE_WIDTH: 0.207384
G1 X184.906 Y103.602 E.00175
; LINE_WIDTH: 0.226797
G1 X184.824 Y103.704 E.00196
G3 X184.599 Y103.634 I-.033 J-.291 E.00365
; WIPE_START
G1 X184.692 Y103.689 E-.22214
G1 X184.824 Y103.704 E-.27117
G1 X184.906 Y103.602 E-.26669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.007 Y95.97 Z2.8 F42000
G1 X185.15 Y85.272 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0986645
G1 F15000
M204 S6000
G3 X185.103 Y85.149 I.038 J-.085 E.00067
; WIPE_START
G1 X185.096 Y85.2 E-.27763
G1 X185.15 Y85.272 E-.48237
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.775 Y86.841 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0953964
G1 F15000
M204 S6000
G1 X185.69 Y86.693 E.00073
; WIPE_START
G1 X185.775 Y86.841 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X193.287 Y88.192 Z2.8 F42000
G1 X194.617 Y88.431 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0996021
G1 F15000
M204 S6000
G2 X194.513 Y88.346 I-.895 J.998 E.00062
; WIPE_START
G1 X194.617 Y88.431 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X194.955 Y96.056 Z2.8 F42000
G1 X195.026 Y97.646 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.103581
G1 F15000
M204 S6000
G3 X194.963 Y97.743 I-1.245 J-.744 E.00057
; LINE_WIDTH: 0.14948
G3 X194.862 Y97.875 I-1.735 J-1.209 E.00144
; LINE_WIDTH: 0.179619
G3 X194.512 Y98.212 I-1.772 J-1.493 E.00543
; LINE_WIDTH: 0.138155
G1 X194.444 Y98.262 E.00065
; LINE_WIDTH: 0.10355
G3 X194.347 Y98.325 I-.86 J-1.21 E.00057
; WIPE_START
G1 X194.444 Y98.262 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X187.571 Y94.941 Z2.8 F42000
G1 X173.911 Y88.341 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0922633
G1 F15000
M204 S6000
G1 X174.001 Y88.552 E.00093
; WIPE_START
G1 X173.911 Y88.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X174.532 Y86.146 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.103071
G1 F15000
M204 S6000
G1 X174.466 Y86.239 E.00056
; LINE_WIDTH: 0.137711
G1 X174.405 Y86.327 E.00083
; LINE_WIDTH: 0.177459
G1 X174.343 Y86.418 E.00121
; LINE_WIDTH: 0.203203
G1 X174.282 Y86.512 E.00146
; WIPE_START
G1 X174.343 Y86.418 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X176.669 Y82.357 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.100434
G1 F15000
M204 S6000
G1 X176.598 Y82.405 E.0004
; LINE_WIDTH: 0.135949
G1 X176.488 Y82.482 E.00102
; LINE_WIDTH: 0.182422
G1 X176.378 Y82.559 E.00152
; LINE_WIDTH: 0.212225
G1 X176.272 Y82.636 E.00182
M204 S10000
G1 X175.449 Y83.04 F42000
; LINE_WIDTH: 0.107298
G1 F15000
M204 S6000
G1 X175.238 Y83.222 E.00146
; LINE_WIDTH: 0.152749
G2 X174.848 Y83.578 I8.75 J9.963 E.00473
; LINE_WIDTH: 0.171226
G2 X174.112 Y84.337 I12.329 J12.704 E.01105
; LINE_WIDTH: 0.125263
G1 X173.937 Y84.536 E.00178
; LINE_WIDTH: 0.0981784
G1 X173.846 Y84.644 E.00064
; WIPE_START
G1 X173.937 Y84.536 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X176.162 Y84.102 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.217441
G1 F15000
M204 S6000
G1 X175.853 Y84.374 E.00586
; LINE_WIDTH: 0.184956
G1 X175.395 Y84.819 E.00738
G1 X175.102 Y85.133 E.00498
; LINE_WIDTH: 0.21742
G1 X174.969 Y85.284 E.00285
G1 X174.98 Y85.429 E.00207
; WIPE_START
G1 X174.969 Y85.284 E-.31996
G1 X175.102 Y85.133 E-.44004
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.313 Y83.48 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.196177
G1 F15000
M204 S6000
G1 X177.221 Y83.541 E.00138
; LINE_WIDTH: 0.169555
G1 X177.127 Y83.604 E.00117
; LINE_WIDTH: 0.13892
G1 X177.038 Y83.667 E.00085
; LINE_WIDTH: 0.10509
G1 X176.949 Y83.73 E.00055
; WIPE_START
G1 X177.038 Y83.667 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X178.077 Y83.243 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.146624
G1 F15000
M204 S6000
G1 X177.811 Y83.395 E.00258
; OBJECT_ID: 5
; WIPE_START
G1 X178.077 Y83.243 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X171.528 Y87.163 Z2.8 F42000
G1 X152.79 Y98.375 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X152.785 Y100.658 I-57.908 J1.011 E.07015
G3 X151.01 Y104.903 I-6.593 J-.263 E.14441
G1 X151.01 Y88.197 E.51333
G2 X141.39 Y88.197 I-4.81 J.006 E.46396
G1 X141.39 Y104.903 E.51332
G3 X139.61 Y100.397 I4.823 J-4.51 E.15242
G1 X139.61 Y88.201 E.37474
G3 X146.332 Y81.61 I6.602 J.01 E.32202
G3 X152.803 Y88.219 I-.154 J6.623 E.31458
G3 X153.606 Y88.009 I.928 J1.907 E.02567
G1 X160.651 Y88.01 E.21646
G3 X161.889 Y89.249 I-.062 J1.3 E.05903
G1 X161.89 Y97.293 E.24719
G3 X160.594 Y98.589 I-1.293 J.003 E.0626
G1 X153.604 Y98.589 E.21477
G3 X152.845 Y98.4 I.169 J-2.303 E.02417
; WIPE_START
M204 S6000
G1 X152.792 Y100.4 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.172 Y98.454 Z2.8 F42000
G1 X160.448 Y98.382 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X161.683 Y97.147 E.05366
G1 X161.683 Y96.614
G1 X159.914 Y98.382 E.07683
G1 X159.381 Y98.382
G1 X161.682 Y96.08 E.1
G1 X161.682 Y95.547
G1 X158.848 Y98.382 E.12317
G1 X158.315 Y98.382
G1 X161.682 Y95.014 E.14634
G1 X161.682 Y94.481
G1 X157.781 Y98.382 E.16951
G1 X157.248 Y98.382
G1 X161.682 Y93.948 E.19268
G1 X161.682 Y93.415
G1 X156.715 Y98.382 E.21585
G1 X156.182 Y98.382
G1 X161.682 Y92.881 E.23901
G1 X161.682 Y92.348
G1 X155.648 Y98.382 E.26218
G1 X155.115 Y98.382
G1 X161.682 Y91.815 E.28535
G1 X161.682 Y91.282
G1 X154.582 Y98.382 E.30852
G1 X154.049 Y98.382
G1 X161.682 Y90.749 E.33169
G1 X161.682 Y90.215
G1 X153.519 Y98.378 E.3547
G1 X153.097 Y98.266
G1 X161.682 Y89.682 E.37302
G1 X161.672 Y89.158
G1 X152.706 Y98.124 E.38961
; WIPE_START
M204 S6000
G1 X154.12 Y96.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X151.969 Y103.128 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X151.217 Y103.879 E.03265
G1 X151.217 Y103.346
G1 X152.304 Y102.259 E.04723
G1 X152.476 Y101.554
G1 X151.217 Y102.813 E.05469
G1 X151.217 Y102.279
G1 X152.559 Y100.938 E.05831
G1 X152.583 Y100.381
G1 X151.217 Y101.746 E.05933
G1 X151.217 Y101.213
G1 X152.583 Y99.848 E.05933
G1 X152.583 Y99.314
G1 X151.217 Y100.68 E.05933
G1 X151.217 Y100.146
M73 P84 R3
G1 X152.583 Y98.781 E.05933
G1 X152.583 Y98.248
G1 X151.217 Y99.613 E.05933
G1 X151.217 Y99.08
G1 X161.538 Y88.759 E.44847
G1 X161.294 Y88.47
G1 X151.217 Y98.547 E.43789
G1 X151.217 Y98.013
G1 X160.953 Y88.277 E.42307
G1 X160.48 Y88.218
G1 X151.217 Y97.48 E.4025
G1 X151.217 Y96.947
G1 X159.947 Y88.217 E.37934
G1 X159.414 Y88.217
G1 X151.217 Y96.414 E.35617
G1 X151.217 Y95.88
G1 X158.88 Y88.217 E.333
G1 X158.347 Y88.217
G1 X151.217 Y95.347 E.30983
G1 X151.217 Y94.814
G1 X157.814 Y88.217 E.28666
G1 X157.281 Y88.217
G1 X151.217 Y94.281 E.26349
G1 X151.217 Y93.747
G1 X156.748 Y88.217 E.24032
G1 X156.215 Y88.217
G1 X151.217 Y93.214 E.21715
G1 X151.217 Y92.681
G1 X155.681 Y88.217 E.19399
G1 X155.148 Y88.217
G1 X151.217 Y92.148 E.17082
G1 X151.217 Y91.614
G1 X154.615 Y88.217 E.14765
G1 X154.082 Y88.216
G1 X151.217 Y91.081 E.12448
G1 X151.217 Y90.548
G1 X153.545 Y88.22 E.10115
G1 X152.786 Y88.446
G1 X151.217 Y90.014 E.06816
G1 X151.217 Y89.481
G1 X152.588 Y88.11 E.05957
G1 X152.554 Y87.611
G1 X151.217 Y88.948 E.05809
G1 X151.217 Y88.415
G1 X152.493 Y87.139 E.05543
G1 X152.403 Y86.696
G1 X151.207 Y87.892 E.05196
G1 X151.155 Y87.411
G1 X152.286 Y86.28 E.04914
G1 X152.147 Y85.885
G1 X151.064 Y86.969 E.04708
G1 X150.941 Y86.558
G1 X151.988 Y85.511 E.04553
G1 X151.809 Y85.157
G1 X150.79 Y86.176 E.04428
G1 X150.615 Y85.817
G1 X151.614 Y84.819 E.04339
G1 X151.4 Y84.5
G1 X150.417 Y85.482 E.04271
G1 X150.198 Y85.168
G1 X151.171 Y84.196 E.04227
G1 X150.924 Y83.909
G1 X149.958 Y84.875 E.04199
G1 X149.697 Y84.602
G1 X150.663 Y83.637 E.04196
G1 X150.385 Y83.382
G1 X149.416 Y84.351 E.04211
G1 X149.115 Y84.118
G1 X150.092 Y83.141 E.04247
G1 X149.782 Y82.918
G1 X148.794 Y83.905 E.04291
G1 X148.451 Y83.716
G1 X149.456 Y82.71 E.04369
G1 X149.112 Y82.521
G1 X148.084 Y83.549 E.04468
G1 X147.691 Y83.409
G1 X148.751 Y82.349 E.04605
G1 X148.369 Y82.197
G1 X147.27 Y83.297 E.04779
G1 X146.813 Y83.22
G1 X147.966 Y82.067 E.0501
G1 X147.541 Y81.96
G1 X146.317 Y83.183 E.05317
G1 X145.765 Y83.202
G1 X147.088 Y81.879 E.05751
G1 X146.604 Y81.83
G1 X145.136 Y83.298 E.06381
G1 X144.375 Y83.526
G1 X146.083 Y81.818 E.07423
G1 X145.513 Y81.854
G1 X143.157 Y84.21 E.10235
; WIPE_START
M204 S6000
G1 X144.571 Y82.796 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.324 Y90.325 Z2.8 F42000
G1 X141.183 Y103.249 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X140.736 Y103.696 E.01942
G1 X140.544 Y103.354
G1 X141.183 Y102.716 E.02776
G1 X141.183 Y102.182
G1 X140.37 Y102.995 E.0353
G1 X140.215 Y102.616
G1 X141.183 Y101.649 E.04204
G1 X141.183 Y101.116
G1 X140.082 Y102.216 E.04781
G1 X139.973 Y101.792
G1 X141.183 Y100.583 E.05258
G1 X141.183 Y100.049
G1 X139.889 Y101.343 E.05623
G1 X139.835 Y100.864
G1 X141.183 Y99.516 E.05856
G1 X141.183 Y98.983
G1 X139.817 Y100.348 E.05933
G1 X139.817 Y99.815
G1 X141.183 Y98.449 E.05933
G1 X141.183 Y97.916
G1 X139.817 Y99.281 E.05933
G1 X139.817 Y98.748
G1 X141.183 Y97.383 E.05933
G1 X141.183 Y96.85
G1 X139.817 Y98.215 E.05933
G1 X139.817 Y97.682
G1 X141.183 Y96.316 E.05933
G1 X141.183 Y95.783
G1 X139.817 Y97.148 E.05933
G1 X139.817 Y96.615
G1 X141.183 Y95.25 E.05933
G1 X141.183 Y94.717
G1 X139.817 Y96.082 E.05933
G1 X139.817 Y95.549
G1 X141.183 Y94.183 E.05933
G1 X141.183 Y93.65
G1 X139.817 Y95.015 E.05933
G1 X139.817 Y94.482
G1 X141.183 Y93.117 E.05933
G1 X141.183 Y92.584
G1 X139.817 Y93.949 E.05933
G1 X139.817 Y93.416
G1 X141.183 Y92.05 E.05933
G1 X141.183 Y91.517
G1 X139.817 Y92.882 E.05933
G1 X139.817 Y92.349
G1 X141.183 Y90.984 E.05933
G1 X141.183 Y90.451
G1 X139.817 Y91.816 E.05933
G1 X139.817 Y91.283
G1 X141.183 Y89.917 E.05933
G1 X141.183 Y89.384
G1 X139.817 Y90.749 E.05933
G1 X139.817 Y90.216
G1 X141.183 Y88.851 E.05933
G1 X141.183 Y88.318
G1 X139.817 Y89.683 E.05933
G1 X139.817 Y89.15
G1 X141.202 Y87.765 E.06017
G1 X141.299 Y87.134
G1 X139.817 Y88.616 E.06439
G1 X139.82 Y88.081
G1 X141.528 Y86.373 E.07421
; WIPE_START
M204 S6000
G1 X140.113 Y87.787 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.22 Y85.147 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X139.856 Y87.512 E.10273
G1 X139.957 Y86.877
G1 X144.878 Y81.956 E.21385
G1 X144.142 Y82.158
G1 X140.159 Y86.141 E.17309
G1 X140.567 Y85.201
G1 X143.202 Y82.565 E.11452
; WIPE_START
M204 S6000
G1 X141.788 Y83.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X148.103 Y88.265 Z2.8 F42000
G1 X161.685 Y97.482 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.251535
G1 F15000
M204 S6000
G3 X161.418 Y97.845 I-4.744 J-3.216 E.00767
; LINE_WIDTH: 0.287081
G1 F14744.383
G3 X161.085 Y98.165 I-1.68 J-1.415 E.00919
; LINE_WIDTH: 0.247782
G1 F15000
G1 X161.021 Y98.212 E.00133
; LINE_WIDTH: 0.219546
G1 X160.756 Y98.388 E.00458
; WIPE_START
G1 X161.021 Y98.212 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.382 Y90.606 Z2.8 F42000
G1 X160.18 Y88.199 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.117176
G1 F15000
M204 S6000
G1 X160.054 Y88.324 E.00108
; WIPE_START
G1 X160.18 Y88.199 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.855 Y88.243 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.132694
G1 F15000
M204 S6000
G1 X154.641 Y88.243 E.00157
; WIPE_START
G1 X154.855 Y88.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X153.454 Y95.745 Z2.8 F42000
G1 X152.154 Y102.705 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.160788
G1 F15000
M204 S6000
G1 X152.031 Y102.886 E.0021
; LINE_WIDTH: 0.196412
G1 X151.908 Y103.066 E.00274
M204 S10000
G1 X151.61 Y103.782 F42000
; LINE_WIDTH: 0.113015
G1 F15000
M204 S6000
G1 X151.416 Y104.023 E.00177
; WIPE_START
G1 X151.61 Y103.782 E-.76
; WIPE_END
M73 P85 R3
G1 E-.04 F1800
M204 S10000
G1 X143.979 Y103.924 Z2.8 F42000
G1 X141.139 Y103.976 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.174767
G1 F15000
M204 S6000
G1 X140.993 Y103.914 E.00171
; LINE_WIDTH: 0.12807
G1 X140.847 Y103.851 E.0011
; LINE_WIDTH: 0.0964513
G1 X140.785 Y103.773 E.00044
; WIPE_START
G1 X140.847 Y103.851 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.019 Y96.22 Z2.8 F42000
G1 X141.203 Y88.03 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.108682
G1 F15000
M204 S6000
G1 X141.113 Y88.248 E.00126
; WIPE_START
G1 X141.203 Y88.03 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.218 Y86.2 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0966086
G1 F15000
M204 S6000
G1 X140.048 Y86.496 E.00149
; WIPE_START
G1 X140.218 Y86.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.387 Y86.814 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.190165
G1 F15000
M204 S6000
G1 X141.271 Y87.001 E.00264
G1 X141.312 Y87.148 E.00183
; WIPE_START
G1 X141.271 Y87.001 E-.3107
G1 X141.387 Y86.814 E-.4493
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.72 Y85.94 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.109235
G1 F15000
M204 S6000
G1 X141.632 Y86.064 E.00082
; LINE_WIDTH: 0.148926
G1 X141.575 Y86.147 E.00087
; LINE_WIDTH: 0.196218
G1 X141.465 Y86.31 E.00245
; WIPE_START
G1 X141.575 Y86.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.384 Y83.087 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107583
G1 F15000
M204 S6000
G2 X142.123 Y83.318 I5.642 J6.628 E.00184
; LINE_WIDTH: 0.140578
G2 X141.235 Y84.215 I8.947 J9.748 E.01005
; LINE_WIDTH: 0.101208
G1 X141.087 Y84.384 E.00107
; WIPE_START
G1 X141.235 Y84.215 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.097 Y84.149 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.218837
G1 F15000
M204 S6000
G1 X142.643 Y84.573 E.0089
G1 X142.16 Y85.087 E.01012
; WIPE_START
G1 X142.643 Y84.573 E-.40428
G1 X143.097 Y84.149 E-.35572
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.312 Y83.463 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.188027
G1 F15000
M204 S6000
G1 X144.147 Y83.574 E.00235
; LINE_WIDTH: 0.148248
G1 X144.063 Y83.633 E.00088
; LINE_WIDTH: 0.106241
G1 X143.942 Y83.719 E.00077
; WIPE_START
G1 X144.063 Y83.633 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.667 Y82.341 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.095522
G1 F15000
M204 S6000
G1 X143.617 Y82.375 E.00026
; LINE_WIDTH: 0.124992
G1 X143.512 Y82.448 E.00085
; LINE_WIDTH: 0.169237
G1 X143.407 Y82.522 E.00132
; LINE_WIDTH: 0.205062
G1 X143.264 Y82.627 E.00235
; OBJECT_ID: 4
; WIPE_START
G1 X143.407 Y82.522 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X137.087 Y86.801 Z2.8 F42000
G1 X119.99 Y98.376 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X119.985 Y100.849 I-63.411 J1.11 E.076
G3 X118.21 Y105.024 I-6.454 J-.28 E.14242
G1 X118.21 Y87.997 E.52318
G2 X108.99 Y87.997 I-4.61 J.006 E.44466
G1 X108.99 Y105.024 E.52317
G1 X108.973 Y105.006 E.00075
G3 X107.21 Y100.598 I4.693 J-4.433 E.1494
G1 X107.21 Y88.002 E.38704
G3 X113.82 Y81.614 I6.392 J0 E.3152
G3 X120 Y88.219 I-.251 J6.429 E.30822
G3 X120.806 Y88.01 I.933 J1.93 E.02575
G1 X127.849 Y88.011 E.21641
G3 X129.089 Y89.249 I-.059 J1.299 E.05909
G1 X129.09 Y97.293 E.24717
G3 X127.794 Y98.59 I-1.293 J.003 E.06261
G1 X120.804 Y98.59 E.21477
G3 X120.045 Y98.401 I.171 J-2.312 E.02417
; WIPE_START
M204 S6000
G1 X119.996 Y100.4 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.39 Y98.508 Z2.8 F42000
G1 X127.908 Y98.375 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X128.876 Y97.408 E.04203
G1 X128.883 Y96.868
G1 X127.368 Y98.382 E.06582
G1 X126.835 Y98.382
G1 X128.882 Y96.334 E.08899
G1 X128.882 Y95.801
G1 X126.301 Y98.382 E.11216
G1 X125.768 Y98.382
G1 X128.882 Y95.268 E.13533
G1 X128.882 Y94.735
G1 X125.235 Y98.382 E.1585
G1 X124.702 Y98.382
G1 X128.882 Y94.202 E.18167
G1 X128.882 Y93.668
G1 X124.168 Y98.382 E.20484
G1 X123.635 Y98.382
G1 X128.882 Y93.135 E.228
G1 X128.882 Y92.602
G1 X123.102 Y98.382 E.25117
G1 X122.569 Y98.382
G1 X128.882 Y92.069 E.27434
G1 X128.882 Y91.536
G1 X122.035 Y98.382 E.29751
G1 X121.502 Y98.382
G1 X128.882 Y91.003 E.32068
G1 X128.882 Y90.469
G1 X120.969 Y98.382 E.34385
G1 X120.484 Y98.334
G1 X128.882 Y89.936 E.36493
G1 X128.881 Y89.403
G1 X120.092 Y98.193 E.38195
; WIPE_START
M204 S6000
G1 X121.506 Y96.778 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.465 Y102.552 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X118.417 Y103.6 E.04553
G1 X118.417 Y103.067
G1 X119.659 Y101.825 E.05397
G1 X119.752 Y101.199
G1 X118.417 Y102.533 E.05801
G1 X118.417 Y102
G1 X119.782 Y100.636 E.05929
G1 X119.783 Y100.102
G1 X118.417 Y101.467 E.05933
G1 X118.417 Y100.934
G1 X119.783 Y99.568 E.05933
G1 X119.783 Y99.035
G1 X118.417 Y100.4 E.05933
G1 X118.417 Y99.867
G1 X119.783 Y98.502 E.05933
; WIPE_START
M204 S6000
G1 X118.417 Y99.867 E-.73368
G1 X118.417 Y99.936 E-.02632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.417 Y99.334 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X128.818 Y88.934 E.45194
G1 X128.622 Y88.596
G1 X118.417 Y98.801 E.44342
G1 X118.417 Y98.267
G1 X128.328 Y88.357 E.43065
G1 X127.925 Y88.227
G1 X118.417 Y97.734 E.41314
G1 X118.417 Y97.201
G1 X127.4 Y88.218 E.39035
G1 X126.867 Y88.218
G1 X118.417 Y96.668 E.36718
G1 X118.417 Y96.134
G1 X126.334 Y88.218 E.34401
G1 X125.801 Y88.218
G1 X118.417 Y95.601 E.32084
G1 X118.417 Y95.068
G1 X125.267 Y88.218 E.29767
G1 X124.734 Y88.218
G1 X118.417 Y94.535 E.2745
G1 X118.417 Y94.001
G1 X124.201 Y88.218 E.25133
G1 X123.668 Y88.217
G1 X118.417 Y93.468 E.22816
G1 X118.417 Y92.935
G1 X123.135 Y88.217 E.20499
G1 X122.602 Y88.217
G1 X118.417 Y92.401 E.18183
G1 X118.417 Y91.868
G1 X122.068 Y88.217 E.15866
G1 X121.535 Y88.217
G1 X118.417 Y91.335 E.13549
G1 X118.417 Y90.802
G1 X121.002 Y88.217 E.11232
G1 X120.386 Y88.3
G1 X118.417 Y90.268 E.08554
G1 X118.417 Y89.735
G1 X119.797 Y88.356 E.05994
G1 X119.78 Y87.84
G1 X118.417 Y89.202 E.0592
G1 X118.417 Y88.669
G1 X119.747 Y87.339 E.05776
G1 X119.678 Y86.875
G1 X118.417 Y88.135 E.05478
G1 X118.402 Y87.617
G1 X119.581 Y86.438 E.05124
G1 X119.459 Y86.027
G1 X118.339 Y87.147 E.04866
G1 X118.241 Y86.712
G1 X119.314 Y85.639 E.04659
G1 X119.147 Y85.272
G1 X118.109 Y86.311 E.04512
G1 X117.952 Y85.935
G1 X118.963 Y84.924 E.04391
G1 X118.759 Y84.594
G1 X117.768 Y85.585 E.04306
G1 X117.56 Y85.26
G1 X118.539 Y84.281 E.04255
G1 X118.301 Y83.986
G1 X117.332 Y84.955 E.0421
G1 X117.081 Y84.673
G1 X118.048 Y83.706 E.04201
G1 X117.777 Y83.443
G1 X116.811 Y84.409 E.04197
G1 X116.519 Y84.168
G1 X117.491 Y83.196 E.04223
G1 X117.188 Y82.966
G1 X116.204 Y83.95 E.04275
G1 X115.87 Y83.751
G1 X116.868 Y82.753 E.04338
G1 X116.531 Y82.556
G1 X115.509 Y83.578 E.04439
G1 X115.123 Y83.431
G1 X116.174 Y82.38 E.0457
G1 X115.799 Y82.222
G1 X114.708 Y83.312 E.04737
G1 X114.26 Y83.228
G1 X115.402 Y82.086 E.04962
G1 X114.98 Y81.974
G1 X113.768 Y83.186 E.05268
G1 X113.223 Y83.198
G1 X114.532 Y81.889 E.05688
G1 X114.053 Y81.835
G1 X112.598 Y83.29 E.06324
G1 X111.838 Y83.516
G1 X113.536 Y81.819 E.07377
G1 X112.972 Y81.849
G1 X110.536 Y84.286 E.10587
; WIPE_START
M204 S6000
G1 X111.95 Y82.871 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.695 Y90.4 Z2.8 F42000
G1 X108.432 Y103.987 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X108.783 Y103.636 E.01525
G1 X108.783 Y103.103
G1 X108.228 Y103.657 E.0241
G1 X108.044 Y103.308
G1 X108.783 Y102.57 E.0321
G1 X108.783 Y102.036
G1 X107.878 Y102.941 E.0393
G1 X107.735 Y102.551
G1 X108.783 Y101.503 E.04554
G1 X108.783 Y100.97
G1 X107.613 Y102.139 E.05081
G1 X107.518 Y101.701
G1 X108.783 Y100.436 E.05497
G1 X108.783 Y99.903
G1 X107.451 Y101.235 E.05785
G1 X107.42 Y100.733
G1 X108.783 Y99.37 E.05921
G1 X108.783 Y98.837
G1 X107.417 Y100.202 E.05933
G1 X107.417 Y99.669
G1 X108.783 Y98.303 E.05933
G1 X108.783 Y97.77
G1 X107.417 Y99.135 E.05933
G1 X107.417 Y98.602
G1 X108.783 Y97.237 E.05933
G1 X108.783 Y96.704
G1 X107.417 Y98.069 E.05933
G1 X107.417 Y97.536
G1 X108.783 Y96.17 E.05933
G1 X108.783 Y95.637
G1 X107.417 Y97.002 E.05933
G1 X107.417 Y96.469
G1 X108.783 Y95.104 E.05933
G1 X108.783 Y94.571
G1 X107.417 Y95.936 E.05933
G1 X107.417 Y95.403
G1 X108.783 Y94.037 E.05933
G1 X108.783 Y93.504
G1 X107.417 Y94.869 E.05933
G1 X107.417 Y94.336
G1 X108.783 Y92.971 E.05933
G1 X108.783 Y92.438
G1 X107.417 Y93.803 E.05933
G1 X107.417 Y93.27
G1 X108.783 Y91.904 E.05933
G1 X108.783 Y91.371
G1 X107.417 Y92.736 E.05933
G1 X107.417 Y92.203
G1 X108.783 Y90.838 E.05933
G1 X108.783 Y90.305
G1 X107.417 Y91.67 E.05933
G1 X107.417 Y91.137
G1 X108.783 Y89.771 E.05933
G1 X108.783 Y89.238
G1 X107.417 Y90.603 E.05933
G1 X107.417 Y90.07
G1 X108.783 Y88.705 E.05933
G1 X108.783 Y88.172
G1 X107.417 Y89.537 E.05933
G1 X107.417 Y89.004
G1 X108.797 Y87.624 E.05997
G1 X108.888 Y86.999
G1 X107.417 Y88.47 E.06392
G1 X107.419 Y87.936
G1 X109.118 Y86.236 E.07384
; WIPE_START
M204 S6000
G1 X107.704 Y87.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.873 Y84.948 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X107.451 Y87.37 E.10528
G1 X107.548 Y86.74
G1 X112.34 Y81.948 E.20823
G1 X111.606 Y82.149
G1 X107.749 Y86.006 E.16762
G1 X108.164 Y85.058
G1 X110.66 Y82.561 E.10849
; WIPE_START
M204 S6000
G1 X109.246 Y83.976 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.046 Y91.605 Z2.8 F42000
G1 X108.717 Y104.12 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0951339
G1 F15000
M204 S6000
G1 X108.544 Y104.141 E.00074
G1 X108.489 Y104.074 E.00037
; WIPE_START
G1 X108.544 Y104.141 E-.25315
G1 X108.717 Y104.12 E-.50685
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.757 Y96.488 Z2.8 F42000
G1 X108.802 Y87.886 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.133205
G1 F15000
M204 S6000
G1 X108.712 Y88.101 E.00172
; WIPE_START
G1 X108.802 Y87.886 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.807 Y86.064 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0973769
G1 F15000
M204 S6000
G1 X107.638 Y86.36 E.00151
; WIPE_START
G1 X107.807 Y86.064 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.969 Y86.673 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.183246
G1 F15000
M204 S6000
G2 X108.823 Y86.934 I15.052 J8.546 E.00342
; WIPE_START
G1 X108.969 Y86.673 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.314 Y85.801 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.101082
G1 F15000
M204 S6000
G1 X109.261 Y85.874 E.00043
; LINE_WIDTH: 0.127287
G1 X109.207 Y85.95 E.00064
; LINE_WIDTH: 0.158254
G1 X109.131 Y86.062 E.00127
; LINE_WIDTH: 0.193286
G1 X109.056 Y86.174 E.00166
; WIPE_START
G1 X109.131 Y86.062 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.475 Y84.226 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.233209
G1 F15000
M204 S6000
G1 X109.813 Y84.888 E.01452
; WIPE_START
G1 X110.475 Y84.226 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.789 Y83.135 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.115739
G1 F15000
M204 S6000
G2 X108.735 Y84.19 I8.266 J9.317 E.00886
; WIPE_START
G1 X109.278 Y83.614 E-.40336
G1 X109.789 Y83.135 E-.35664
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.129 Y82.333 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0962389
G1 F15000
M204 S6000
G1 X111.076 Y82.369 E.00028
; LINE_WIDTH: 0.125531
G1 X110.974 Y82.44 E.00084
; LINE_WIDTH: 0.168027
G1 X110.873 Y82.512 E.00127
; LINE_WIDTH: 0.204217
G1 X110.721 Y82.623 E.00246
; WIPE_START
G1 X110.873 Y82.512 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.776 Y83.454 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.192144
G1 F15000
M204 S6000
G1 X111.626 Y83.554 E.00219
; LINE_WIDTH: 0.156912
G1 X111.547 Y83.61 E.0009
; LINE_WIDTH: 0.123125
G1 X111.467 Y83.666 E.00064
; LINE_WIDTH: 0.097153
G1 X111.401 Y83.714 E.00036
; WIPE_START
G1 X111.467 Y83.666 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.185 Y83.153 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.109577
M73 P86 R3
G1 F15000
M204 S6000
G1 X114.004 Y83.217 E.00104
; WIPE_START
G1 X114.185 Y83.153 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.574 Y82.18 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0987503
G1 F15000
M204 S6000
G1 X115.435 Y82.095 E.00074
; WIPE_START
G1 X115.574 Y82.18 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.206 Y86.48 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.10078
G1 F15000
M204 S6000
G1 X118.123 Y86.35 E.00073
M204 S10000
G1 X118.416 Y87.224 F42000
; LINE_WIDTH: 0.10058
G1 F15000
M204 S6000
G1 X118.36 Y87.393 E.00084
; WIPE_START
G1 X118.416 Y87.224 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.836 Y94.845 Z2.8 F42000
G1 X119.287 Y103.023 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.101924
G1 F15000
M204 S6000
G1 X119.239 Y103.094 E.00041
; LINE_WIDTH: 0.129426
G1 X119.191 Y103.164 E.0006
; LINE_WIDTH: 0.163128
G1 X119.124 Y103.259 E.00114
; LINE_WIDTH: 0.203053
G1 X119.053 Y103.359 E.00159
; LINE_WIDTH: 0.241024
G1 X118.981 Y103.456 E.00196
; LINE_WIDTH: 0.27697
G1 X118.908 Y103.554 E.00232
; LINE_WIDTH: 0.310277
G1 F13465.161
G1 X118.836 Y103.648 E.0026
; LINE_WIDTH: 0.340993
G1 F12077.606
G1 X118.763 Y103.743 E.0029
; LINE_WIDTH: 0.372045
G1 F10938.103
G1 X118.673 Y103.855 E.00386
; LINE_WIDTH: 0.409405
G1 F9823.054
G1 X118.606 Y103.919 E.00276
; LINE_WIDTH: 0.4298
G1 F9305.224
G1 X118.53 Y104.136 E.00723
; WIPE_START
G1 X118.606 Y103.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.152 Y99.994 Z2.8 F42000
G1 X128.732 Y97.846 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.106748
G1 F15000
M204 S6000
G3 X128.347 Y98.231 I-1.699 J-1.313 E.00284
; WIPE_START
G1 X128.581 Y98.022 E-.4381
G1 X128.732 Y97.846 E-.3219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.49 Y91.501 Z2.8 F42000
G1 X122.311 Y88.241 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.128494
G1 F15000
M204 S6000
G1 X122.092 Y88.241 E.00152
; OBJECT_ID: 2
; WIPE_START
G1 X122.311 Y88.241 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X118.414 Y81.679 Z2.8 F42000
G1 X108.503 Y64.991 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X108.283 Y64.375 E.02011
G3 X107.99 Y62.402 I6.52 J-1.978 E.0615
G1 X107.99 Y39.398 E.70685
G3 X114.798 Y32.59 I6.823 J.015 E.3284
G1 X168.302 Y32.59 E1.64403
G3 X175.11 Y39.398 I-.005 J6.813 E.32852
G1 X175.11 Y62.402 E.70685
G3 X168.302 Y69.21 I-6.813 J-.005 E.32852
G1 X114.798 Y69.21 E1.64403
G3 X108.526 Y65.047 I.005 J-6.813 E.24506
; WIPE_START
M204 S6000
G1 X108.283 Y64.375 E-.27147
G1 X108.121 Y63.729 E-.25314
G1 X108.037 Y63.2 E-.20331
G1 X108.032 Y63.116 E-.03208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.098 Y58.484 Z2.8 F42000
G1 X150.338 Y30.81 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X168.298 Y30.81 E.55187
G3 X176.89 Y39.402 I-.014 J8.606 E.41452
G1 X176.89 Y62.398 E.7066
G3 X168.298 Y70.99 I-8.606 J-.014 E.41452
G1 X114.802 Y70.99 E1.64378
G3 X106.686 Y65.216 I.001 J-8.591 E.32646
G3 X106.21 Y62.398 I8.551 J-2.895 E.08818
G1 X106.21 Y39.402 E.7066
G3 X114.802 Y30.81 I8.606 J.014 E.41452
G1 X132.762 Y30.81 E.55187
G1 X132.76 Y26.506 E.13224
G3 X134.056 Y25.21 I1.3 J.004 E.06251
G1 X149.046 Y25.21 E.4606
G3 X150.34 Y26.506 I.001 J1.293 E.06253
G1 X150.338 Y30.75 E.1304
; WIPE_START
M204 S6000
G1 X152.338 Y30.757 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X156.459 Y37.181 Z2.8 F42000
G1 X175.449 Y66.777 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X172.677 Y69.549 E.12048
G1 X171.579 Y70.113
G1 X176.013 Y65.679 E.19267
G1 X176.317 Y64.842
G1 X170.742 Y70.417 E.24227
G1 X170.024 Y70.602
G1 X176.502 Y64.124 E.2815
G1 X176.611 Y63.482
G1 X174.596 Y65.497 E.08758
G1 X174.965 Y64.595
G1 X176.666 Y62.893 E.07393
G1 X176.683 Y62.344
G1 X175.162 Y63.865 E.06609
G1 X175.269 Y63.224
G1 X176.683 Y61.81 E.06143
G1 X176.683 Y61.277
G1 X175.313 Y62.647 E.05953
G1 X175.317 Y62.109
G1 X176.683 Y60.744 E.05933
G1 X176.683 Y60.211
G1 X175.317 Y61.576 E.05933
G1 X175.317 Y61.043
G1 X176.683 Y59.677 E.05933
G1 X176.683 Y59.144
G1 X175.317 Y60.509 E.05933
G1 X175.317 Y59.976
G1 X176.683 Y58.611 E.05933
G1 X176.683 Y58.078
G1 X175.317 Y59.443 E.05933
G1 X175.317 Y58.91
G1 X176.683 Y57.544 E.05933
G1 X176.683 Y57.011
G1 X175.317 Y58.376 E.05933
G1 X175.317 Y57.843
G1 X176.683 Y56.478 E.05933
G1 X176.683 Y55.945
G1 X175.317 Y57.31 E.05933
G1 X175.317 Y56.777
G1 X176.683 Y55.411 E.05933
G1 X176.683 Y54.878
G1 X175.317 Y56.243 E.05933
G1 X175.317 Y55.71
G1 X176.683 Y54.345 E.05933
G1 X176.683 Y53.812
G1 X175.317 Y55.177 E.05933
G1 X175.317 Y54.643
G1 X176.683 Y53.278 E.05933
G1 X176.683 Y52.745
G1 X175.317 Y54.11 E.05933
G1 X175.317 Y53.577
G1 X176.683 Y52.212 E.05933
G1 X176.683 Y51.678
G1 X175.317 Y53.044 E.05933
G1 X175.317 Y52.51
G1 X176.683 Y51.145 E.05933
G1 X176.683 Y50.612
G1 X175.317 Y51.977 E.05933
G1 X175.317 Y51.444
G1 X176.683 Y50.079 E.05933
G1 X176.683 Y49.545
G1 X175.317 Y50.911 E.05932
G1 X175.317 Y50.377
G1 X176.683 Y49.012 E.05933
G1 X176.683 Y48.479
G1 X175.317 Y49.844 E.05933
G1 X175.317 Y49.311
G1 X176.683 Y47.946 E.05933
G1 X176.683 Y47.412
G1 X175.317 Y48.778 E.05932
G1 X175.317 Y48.244
G1 X176.683 Y46.879 E.05933
G1 X176.683 Y46.346
G1 X175.317 Y47.711 E.05933
G1 X175.317 Y47.178
G1 X176.683 Y45.813 E.05933
G1 X176.683 Y45.279
G1 X175.317 Y46.645 E.05933
G1 X175.317 Y46.111
G1 X176.683 Y44.746 E.05933
G1 X176.683 Y44.213
G1 X175.317 Y45.578 E.05933
G1 X175.317 Y45.045
G1 X176.683 Y43.68 E.05933
G1 X176.683 Y43.146
G1 X175.317 Y44.512 E.05933
G1 X175.317 Y43.978
G1 X176.683 Y42.613 E.05933
G1 X176.683 Y42.08
G1 X175.317 Y43.445 E.05933
G1 X175.317 Y42.912
G1 X176.683 Y41.547 E.05933
G1 X176.683 Y41.013
G1 X175.317 Y42.379 E.05933
G1 X175.317 Y41.845
G1 X176.683 Y40.48 E.05933
G1 X176.683 Y39.947
G1 X175.317 Y41.312 E.05933
G1 X175.317 Y40.779
G1 X176.683 Y39.414 E.05933
G1 X176.666 Y38.897
G1 X175.317 Y40.246 E.0586
G1 X175.317 Y39.712
G1 X176.623 Y38.406 E.05675
G1 X176.553 Y37.943
G1 X175.313 Y39.183 E.05389
G1 X175.28 Y38.684
G1 X176.463 Y37.5 E.05144
G1 X176.353 Y37.077
G1 X175.215 Y38.214 E.04945
G1 X175.126 Y37.771
G1 X176.225 Y36.672 E.04776
G1 X176.08 Y36.283
G1 X175.011 Y37.353 E.04647
G1 X174.877 Y36.953
G1 X175.921 Y35.909 E.04537
G1 X175.746 Y35.551
G1 X174.722 Y36.575 E.04448
G1 X174.552 Y36.212
G1 X175.557 Y35.207 E.04368
G1 X175.355 Y34.876
G1 X174.362 Y35.868 E.04313
G1 X174.159 Y35.538
G1 X175.14 Y34.557 E.04265
G1 X174.913 Y34.251
G1 X173.939 Y35.225 E.04234
G1 X173.705 Y34.926
G1 X174.674 Y33.956 E.04214
G1 X174.422 Y33.675
G1 X173.457 Y34.641 E.04195
G1 X173.193 Y34.371
G1 X174.158 Y33.406 E.04194
G1 X173.882 Y33.149
G1 X172.915 Y34.115 E.04201
G1 X172.624 Y33.874
G1 X173.594 Y32.903 E.04217
G1 X173.295 Y32.67
G1 X172.317 Y33.648 E.0425
G1 X171.996 Y33.435
G1 X172.983 Y32.448 E.0429
G1 X172.658 Y32.24
G1 X171.658 Y33.24 E.04344
G1 X171.305 Y33.06
G1 X172.319 Y32.045 E.04408
G1 X171.967 Y31.864
G1 X170.935 Y32.897 E.04488
G1 X170.545 Y32.753
G1 X171.602 Y31.696 E.0459
G1 X171.221 Y31.543
G1 X170.137 Y32.628 E.04714
G1 X169.706 Y32.525
G1 X170.824 Y31.408 E.04858
G1 X170.409 Y31.289
G1 X169.25 Y32.448 E.05039
G1 X168.766 Y32.399
G1 X169.977 Y31.188 E.05264
G1 X169.523 Y31.108
G1 X168.249 Y32.383 E.05537
G1 X167.716 Y32.383
G1 X169.046 Y31.052 E.05782
G1 X168.543 Y31.022
G1 X167.183 Y32.383 E.05911
G1 X166.649 Y32.383
G1 X168.015 Y31.017 E.05933
G1 X167.481 Y31.017
G1 X166.116 Y32.383 E.05933
G1 X165.583 Y32.383
G1 X166.948 Y31.017 E.05933
G1 X166.415 Y31.017
G1 X165.05 Y32.383 E.05933
G1 X164.516 Y32.383
G1 X165.882 Y31.017 E.05933
G1 X165.348 Y31.017
G1 X163.983 Y32.383 E.05933
G1 X163.45 Y32.383
G1 X164.815 Y31.017 E.05933
G1 X164.282 Y31.017
G1 X162.917 Y32.383 E.05933
G1 X162.383 Y32.383
G1 X163.749 Y31.017 E.05933
G1 X163.215 Y31.017
G1 X161.85 Y32.383 E.05933
G1 X161.317 Y32.383
G1 X162.682 Y31.017 E.05933
G1 X162.149 Y31.017
G1 X160.784 Y32.383 E.05933
G1 X160.25 Y32.383
G1 X161.615 Y31.017 E.05933
G1 X161.082 Y31.017
G1 X159.717 Y32.383 E.05933
G1 X159.184 Y32.383
G1 X160.549 Y31.017 E.05933
G1 X160.016 Y31.017
G1 X158.65 Y32.383 E.05933
G1 X158.117 Y32.383
G1 X159.482 Y31.017 E.05933
G1 X158.949 Y31.017
G1 X157.584 Y32.383 E.05933
G1 X157.051 Y32.383
G1 X158.416 Y31.017 E.05933
G1 X157.883 Y31.017
G1 X156.517 Y32.383 E.05933
G1 X155.984 Y32.383
G1 X157.349 Y31.017 E.05933
G1 X156.816 Y31.017
G1 X155.451 Y32.383 E.05933
G1 X154.918 Y32.383
G1 X156.283 Y31.017 E.05933
G1 X155.75 Y31.017
G1 X154.384 Y32.383 E.05933
G1 X153.851 Y32.383
G1 X155.216 Y31.017 E.05933
G1 X154.683 Y31.017
G1 X153.318 Y32.383 E.05933
G1 X152.785 Y32.383
G1 X154.15 Y31.017 E.05933
G1 X153.617 Y31.017
G1 X152.251 Y32.383 E.05933
G1 X151.718 Y32.383
G1 X153.083 Y31.017 E.05933
G1 X152.55 Y31.017
G1 X151.185 Y32.383 E.05933
G1 X150.652 Y32.383
G1 X152.017 Y31.017 E.05933
G1 X151.484 Y31.017
G1 X150.118 Y32.383 E.05933
G1 X149.585 Y32.383
G1 X150.95 Y31.017 E.05933
G1 X150.417 Y31.017
G1 X149.052 Y32.383 E.05933
G1 X148.519 Y32.383
G1 X150.13 Y30.771 E.07004
G1 X150.131 Y30.237
G1 X147.985 Y32.383 E.09322
G1 X147.452 Y32.383
G1 X150.131 Y29.704 E.11641
G1 X150.131 Y29.17
G1 X146.919 Y32.383 E.13959
G1 X146.386 Y32.383
G1 X150.131 Y28.637 E.16278
G1 X150.132 Y28.103
G1 X145.852 Y32.383 E.18596
G1 X145.319 Y32.383
G1 X150.132 Y27.57 E.20915
G1 X150.132 Y27.036
G1 X144.786 Y32.383 E.23233
G1 X144.253 Y32.383
G1 X150.132 Y26.503 E.25549
G1 X150.039 Y26.063
G1 X143.719 Y32.383 E.27464
G1 X143.186 Y32.383
G1 X149.824 Y25.745 E.28845
G1 X149.513 Y25.522
G1 X142.653 Y32.383 E.29812
G1 X142.119 Y32.383
G1 X149.082 Y25.42 E.30256
G1 X148.551 Y25.417
G1 X141.586 Y32.383 E.30267
G1 X141.053 Y32.383
G1 X148.018 Y25.417 E.30267
G1 X147.485 Y25.417
G1 X140.52 Y32.383 E.30267
G1 X139.986 Y32.383
G1 X146.952 Y25.417 E.30267
G1 X146.418 Y25.417
G1 X139.453 Y32.383 E.30267
G1 X138.92 Y32.383
G1 X145.885 Y25.417 E.30267
G1 X145.352 Y25.417
G1 X138.387 Y32.383 E.30267
G1 X137.853 Y32.383
G1 X144.819 Y25.417 E.30267
G1 X144.285 Y25.417
G1 X137.32 Y32.383 E.30267
G1 X136.787 Y32.383
G1 X143.752 Y25.417 E.30267
G1 X143.219 Y25.417
G1 X136.254 Y32.383 E.30267
G1 X135.72 Y32.383
G1 X142.686 Y25.417 E.30267
G1 X142.152 Y25.417
G1 X135.187 Y32.383 E.30267
G1 X134.654 Y32.383
G1 X141.619 Y25.417 E.30267
G1 X141.086 Y25.417
G1 X134.121 Y32.383 E.30267
G1 X133.587 Y32.383
G1 X140.553 Y25.417 E.30267
G1 X140.019 Y25.417
G1 X133.054 Y32.383 E.30267
G1 X132.521 Y32.383
G1 X139.486 Y25.417 E.30267
G1 X138.953 Y25.417
G1 X131.988 Y32.383 E.30267
G1 X131.454 Y32.383
G1 X132.82 Y31.017 E.05933
M73 P87 R3
G1 X132.286 Y31.017
G1 X130.921 Y32.383 E.05933
G1 X130.388 Y32.383
G1 X131.753 Y31.017 E.05933
G1 X131.22 Y31.017
G1 X129.855 Y32.383 E.05933
G1 X129.321 Y32.383
G1 X130.687 Y31.017 E.05933
G1 X130.153 Y31.017
G1 X128.788 Y32.383 E.05933
G1 X128.255 Y32.383
G1 X129.62 Y31.017 E.05933
G1 X129.087 Y31.017
G1 X127.722 Y32.383 E.05933
G1 X127.188 Y32.383
G1 X128.554 Y31.017 E.05933
G1 X128.02 Y31.017
G1 X126.655 Y32.383 E.05933
G1 X126.122 Y32.383
G1 X127.487 Y31.017 E.05933
G1 X126.954 Y31.017
G1 X125.589 Y32.383 E.05933
G1 X125.055 Y32.383
G1 X126.42 Y31.017 E.05933
G1 X125.887 Y31.017
G1 X124.522 Y32.383 E.05933
G1 X123.989 Y32.383
G1 X125.354 Y31.017 E.05933
G1 X124.821 Y31.017
G1 X123.455 Y32.383 E.05933
G1 X122.922 Y32.383
G1 X124.287 Y31.017 E.05933
G1 X123.754 Y31.017
G1 X122.389 Y32.383 E.05933
G1 X121.856 Y32.383
G1 X123.221 Y31.017 E.05933
G1 X122.688 Y31.017
G1 X121.322 Y32.383 E.05933
G1 X120.789 Y32.383
G1 X122.154 Y31.017 E.05933
G1 X121.621 Y31.017
G1 X120.256 Y32.383 E.05933
G1 X119.723 Y32.383
G1 X121.088 Y31.017 E.05933
G1 X120.555 Y31.017
G1 X119.189 Y32.383 E.05933
G1 X118.656 Y32.383
G1 X120.021 Y31.017 E.05933
G1 X119.488 Y31.017
G1 X118.123 Y32.383 E.05933
G1 X117.59 Y32.383
G1 X118.955 Y31.017 E.05933
G1 X118.422 Y31.017
G1 X117.056 Y32.383 E.05933
G1 X116.523 Y32.383
G1 X117.888 Y31.017 E.05933
G1 X117.355 Y31.017
G1 X115.99 Y32.383 E.05933
G1 X115.457 Y32.383
G1 X116.822 Y31.017 E.05933
G1 X116.289 Y31.017
G1 X114.923 Y32.383 E.05933
G1 X114.376 Y32.397
G1 X115.755 Y31.017 E.05994
G1 X115.222 Y31.017
G1 X113.781 Y32.458 E.0626
G1 X113.118 Y32.588
G1 X114.686 Y31.02 E.06814
G1 X114.128 Y31.045
G1 X112.347 Y32.826 E.07739
G1 X111.35 Y33.29
G1 X113.524 Y31.116 E.09447
; WIPE_START
M204 S6000
G1 X112.11 Y32.53 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.718 Y31.924 Z2.8 F42000
G1 X132.97 Y30.867 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X138.42 Y25.417 E.23682
G1 X137.886 Y25.417
G1 X132.969 Y30.334 E.21366
G1 X132.969 Y29.801
G1 X137.353 Y25.417 E.1905
G1 X136.82 Y25.417
G1 X132.969 Y29.268 E.16734
G1 X132.969 Y28.735
G1 X136.287 Y25.417 E.14418
G1 X135.753 Y25.417
G1 X132.968 Y28.202 E.12102
G1 X132.968 Y27.669
G1 X135.22 Y25.417 E.09786
G1 X134.687 Y25.417
G1 X132.968 Y27.136 E.0747
G1 X132.967 Y26.603
G1 X134.154 Y25.417 E.05154
; WIPE_START
M204 S6000
G1 X132.967 Y26.603 E-.6374
G1 X132.968 Y26.926 E-.12261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.848 Y32.794 Z2.8 F42000
G1 X169.382 Y70.711 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X171.397 Y68.696 E.08758
G1 X170.495 Y69.065
G1 X168.793 Y70.766 E.07393
G1 X168.244 Y70.783
G1 X169.765 Y69.262 E.06609
G1 X169.124 Y69.369
G1 X167.71 Y70.783 E.06143
G1 X167.177 Y70.783
G1 X168.547 Y69.413 E.05953
G1 X168.009 Y69.417
G1 X166.644 Y70.783 E.05933
G1 X166.111 Y70.783
G1 X167.476 Y69.417 E.05933
G1 X166.943 Y69.417
G1 X165.577 Y70.783 E.05933
G1 X165.044 Y70.783
G1 X166.409 Y69.417 E.05933
G1 X165.876 Y69.417
G1 X164.511 Y70.783 E.05933
G1 X163.978 Y70.783
G1 X165.343 Y69.417 E.05933
G1 X164.81 Y69.417
G1 X163.444 Y70.783 E.05933
G1 X162.911 Y70.783
G1 X164.276 Y69.417 E.05933
G1 X163.743 Y69.417
G1 X162.378 Y70.783 E.05933
G1 X161.845 Y70.783
G1 X163.21 Y69.417 E.05933
G1 X162.677 Y69.417
G1 X161.311 Y70.783 E.05933
G1 X160.778 Y70.783
G1 X162.143 Y69.417 E.05933
G1 X161.61 Y69.417
G1 X160.245 Y70.783 E.05933
G1 X159.712 Y70.783
G1 X161.077 Y69.417 E.05933
G1 X160.543 Y69.417
G1 X159.178 Y70.783 E.05933
G1 X158.645 Y70.783
G1 X160.01 Y69.417 E.05933
G1 X159.477 Y69.417
G1 X158.112 Y70.783 E.05933
G1 X157.578 Y70.783
G1 X158.944 Y69.417 E.05933
G1 X158.41 Y69.417
G1 X157.045 Y70.783 E.05933
G1 X156.512 Y70.783
G1 X157.877 Y69.417 E.05933
G1 X157.344 Y69.417
G1 X155.979 Y70.783 E.05933
G1 X155.445 Y70.783
G1 X156.811 Y69.417 E.05933
G1 X156.277 Y69.417
G1 X154.912 Y70.783 E.05933
G1 X154.379 Y70.783
G1 X155.744 Y69.417 E.05933
G1 X155.211 Y69.417
G1 X153.846 Y70.783 E.05933
G1 X153.312 Y70.783
G1 X154.678 Y69.417 E.05933
G1 X154.144 Y69.417
G1 X152.779 Y70.783 E.05933
G1 X152.246 Y70.783
G1 X153.611 Y69.417 E.05933
G1 X153.078 Y69.417
G1 X151.713 Y70.783 E.05933
G1 X151.179 Y70.783
G1 X152.545 Y69.417 E.05933
G1 X152.011 Y69.417
G1 X150.646 Y70.783 E.05933
G1 X150.113 Y70.783
G1 X151.478 Y69.417 E.05933
G1 X150.945 Y69.417
G1 X149.58 Y70.783 E.05933
G1 X149.046 Y70.783
G1 X150.412 Y69.417 E.05933
G1 X149.878 Y69.417
G1 X148.513 Y70.783 E.05933
G1 X147.98 Y70.783
G1 X149.345 Y69.417 E.05933
G1 X148.812 Y69.417
G1 X147.447 Y70.783 E.05933
G1 X146.913 Y70.783
G1 X148.279 Y69.417 E.05933
G1 X147.745 Y69.417
G1 X146.38 Y70.783 E.05933
G1 X145.847 Y70.783
G1 X147.212 Y69.417 E.05933
G1 X146.679 Y69.417
G1 X145.314 Y70.783 E.05933
G1 X144.78 Y70.783
G1 X146.146 Y69.417 E.05933
G1 X145.612 Y69.417
G1 X144.247 Y70.783 E.05933
G1 X143.714 Y70.783
G1 X145.079 Y69.417 E.05933
G1 X144.546 Y69.417
G1 X143.181 Y70.783 E.05933
G1 X142.647 Y70.783
G1 X144.013 Y69.417 E.05933
G1 X143.479 Y69.417
G1 X142.114 Y70.783 E.05933
G1 X141.581 Y70.783
G1 X142.946 Y69.417 E.05933
G1 X142.413 Y69.417
G1 X141.048 Y70.783 E.05933
G1 X140.514 Y70.783
G1 X141.879 Y69.417 E.05933
G1 X141.346 Y69.417
G1 X139.981 Y70.783 E.05933
G1 X139.448 Y70.783
G1 X140.813 Y69.417 E.05933
G1 X140.28 Y69.417
G1 X138.914 Y70.783 E.05933
G1 X138.381 Y70.783
G1 X139.746 Y69.417 E.05933
G1 X139.213 Y69.417
G1 X137.848 Y70.783 E.05933
G1 X137.315 Y70.783
G1 X138.68 Y69.417 E.05933
G1 X138.147 Y69.417
G1 X136.781 Y70.783 E.05933
G1 X136.248 Y70.783
G1 X137.613 Y69.417 E.05933
G1 X137.08 Y69.417
G1 X135.715 Y70.783 E.05933
G1 X135.182 Y70.783
G1 X136.547 Y69.417 E.05933
G1 X136.014 Y69.417
G1 X134.648 Y70.783 E.05933
G1 X134.115 Y70.783
G1 X135.48 Y69.417 E.05933
G1 X134.947 Y69.417
G1 X133.582 Y70.783 E.05933
G1 X133.049 Y70.783
G1 X134.414 Y69.417 E.05933
G1 X133.881 Y69.417
G1 X132.515 Y70.783 E.05933
G1 X131.982 Y70.783
G1 X133.347 Y69.417 E.05933
G1 X132.814 Y69.417
G1 X131.449 Y70.783 E.05933
G1 X130.916 Y70.783
G1 X132.281 Y69.417 E.05933
G1 X131.748 Y69.417
G1 X130.382 Y70.783 E.05933
G1 X129.849 Y70.783
G1 X131.214 Y69.417 E.05933
G1 X130.681 Y69.417
G1 X129.316 Y70.783 E.05933
G1 X128.783 Y70.783
G1 X130.148 Y69.417 E.05933
G1 X129.615 Y69.417
G1 X128.249 Y70.783 E.05933
G1 X127.716 Y70.783
G1 X129.081 Y69.417 E.05933
G1 X128.548 Y69.417
G1 X127.183 Y70.783 E.05933
G1 X126.65 Y70.783
G1 X128.015 Y69.417 E.05933
G1 X127.482 Y69.417
G1 X126.116 Y70.783 E.05933
G1 X125.583 Y70.783
G1 X126.948 Y69.417 E.05933
G1 X126.415 Y69.417
G1 X125.05 Y70.783 E.05933
G1 X124.517 Y70.783
G1 X125.882 Y69.417 E.05933
G1 X125.348 Y69.417
G1 X123.983 Y70.783 E.05933
G1 X123.45 Y70.783
G1 X124.815 Y69.417 E.05933
G1 X124.282 Y69.417
G1 X122.917 Y70.783 E.05933
G1 X122.383 Y70.783
G1 X123.749 Y69.417 E.05933
G1 X123.215 Y69.417
G1 X121.85 Y70.783 E.05933
G1 X121.317 Y70.783
G1 X122.682 Y69.417 E.05933
G1 X122.149 Y69.417
G1 X120.784 Y70.783 E.05933
G1 X120.25 Y70.783
G1 X121.616 Y69.417 E.05933
G1 X121.082 Y69.417
G1 X119.717 Y70.783 E.05933
G1 X119.184 Y70.783
G1 X120.549 Y69.417 E.05933
G1 X120.016 Y69.417
G1 X118.651 Y70.783 E.05933
G1 X118.117 Y70.783
G1 X119.483 Y69.417 E.05933
G1 X118.949 Y69.417
G1 X117.584 Y70.783 E.05933
G1 X117.051 Y70.783
G1 X118.416 Y69.417 E.05933
G1 X117.883 Y69.417
G1 X116.518 Y70.783 E.05933
G1 X115.984 Y70.783
G1 X117.35 Y69.417 E.05933
G1 X116.816 Y69.417
G1 X115.451 Y70.783 E.05933
G1 X114.918 Y70.783
G1 X116.283 Y69.417 E.05933
G1 X115.75 Y69.417
G1 X114.396 Y70.772 E.05885
G1 X113.901 Y70.733
G1 X115.217 Y69.417 E.05717
G1 X114.686 Y69.415
G1 X113.432 Y70.669 E.05449
G1 X112.985 Y70.582
G1 X114.179 Y69.389 E.05185
G1 X113.703 Y69.331
G1 X112.558 Y70.476 E.04977
G1 X112.15 Y70.351
G1 X113.257 Y69.244 E.04811
G1 X112.833 Y69.135
G1 X111.758 Y70.209 E.04669
G1 X111.382 Y70.053
G1 X112.43 Y69.004 E.04555
G1 X112.047 Y68.854
G1 X111.02 Y69.881 E.04464
G1 X110.673 Y69.695
G1 X111.682 Y68.686 E.04387
G1 X111.334 Y68.501
G1 X110.339 Y69.495 E.04322
G1 X110.018 Y69.283
G1 X111.002 Y68.299 E.04275
G1 X110.684 Y68.084
G1 X109.71 Y69.058 E.04235
G1 X109.414 Y68.821
M73 P88 R3
G1 X110.383 Y67.852 E.04214
G1 X110.096 Y67.606
G1 X109.129 Y68.573 E.04201
G1 X108.857 Y68.311
G1 X109.822 Y67.346 E.04195
G1 X109.564 Y67.071
G1 X108.598 Y68.037 E.04201
G1 X108.35 Y67.752
G1 X109.32 Y66.782 E.04214
G1 X109.09 Y66.478
G1 X108.115 Y67.454 E.04241
G1 X107.891 Y67.144
G1 X108.876 Y66.159 E.0428
G1 X108.676 Y65.826
G1 X107.68 Y66.822 E.04328
G1 X107.482 Y66.487
G1 X108.494 Y65.475 E.04398
G1 X108.327 Y65.109
G1 X107.298 Y66.137 E.04471
G1 X107.128 Y65.774
G1 X108.18 Y64.723 E.04568
G1 X108.05 Y64.319
G1 X106.973 Y65.396 E.04682
G1 X106.832 Y65.003
G1 X107.944 Y63.892 E.04832
G1 X107.861 Y63.441
G1 X106.71 Y64.592 E.05
G1 X106.607 Y64.163
G1 X107.805 Y62.964 E.0521
G1 X107.784 Y62.452
G1 X106.521 Y63.715 E.05485
G1 X106.461 Y63.241
G1 X107.783 Y61.92 E.05741
G1 X107.783 Y61.387
G1 X106.425 Y62.745 E.059
G1 X106.417 Y62.219
G1 X107.783 Y60.854 E.05933
G1 X107.783 Y60.32
G1 X106.417 Y61.686 E.05933
G1 X106.417 Y61.152
G1 X107.783 Y59.787 E.05933
G1 X107.783 Y59.254
G1 X106.417 Y60.619 E.05933
G1 X106.417 Y60.086
G1 X107.783 Y58.721 E.05933
G1 X107.783 Y58.187
G1 X106.417 Y59.553 E.05933
G1 X106.417 Y59.019
G1 X107.783 Y57.654 E.05933
G1 X107.783 Y57.121
G1 X106.417 Y58.486 E.05933
G1 X106.417 Y57.953
G1 X107.783 Y56.588 E.05933
G1 X107.783 Y56.054
G1 X106.417 Y57.42 E.05933
G1 X106.417 Y56.886
G1 X107.783 Y55.521 E.05933
G1 X107.783 Y54.988
G1 X106.417 Y56.353 E.05933
G1 X106.417 Y55.82
G1 X107.783 Y54.455 E.05933
G1 X107.783 Y53.921
G1 X106.417 Y55.287 E.05933
G1 X106.417 Y54.753
G1 X107.783 Y53.388 E.05933
G1 X107.783 Y52.855
G1 X106.417 Y54.22 E.05933
G1 X106.417 Y53.687
G1 X107.783 Y52.322 E.05933
G1 X107.783 Y51.788
G1 X106.417 Y53.153 E.05933
G1 X106.417 Y52.62
G1 X107.783 Y51.255 E.05933
G1 X107.783 Y50.722
G1 X106.417 Y52.087 E.05933
G1 X106.417 Y51.554
G1 X107.783 Y50.189 E.05933
G1 X107.783 Y49.655
G1 X106.417 Y51.02 E.05933
G1 X106.417 Y50.487
G1 X107.783 Y49.122 E.05933
G1 X107.783 Y48.589
G1 X106.417 Y49.954 E.05933
G1 X106.417 Y49.421
G1 X107.783 Y48.055 E.05932
G1 X107.783 Y47.522
G1 X106.417 Y48.887 E.05933
G1 X106.417 Y48.354
G1 X107.783 Y46.989 E.05933
G1 X107.783 Y46.456
G1 X106.417 Y47.821 E.05933
G1 X106.417 Y47.288
G1 X107.783 Y45.922 E.05932
G1 X107.783 Y45.389
G1 X106.417 Y46.754 E.05933
G1 X106.417 Y46.221
G1 X107.783 Y44.856 E.05933
G1 X107.783 Y44.323
G1 X106.417 Y45.688 E.05933
G1 X106.417 Y45.155
G1 X107.783 Y43.789 E.05932
G1 X107.783 Y43.256
G1 X106.417 Y44.621 E.05933
G1 X106.417 Y44.088
G1 X107.783 Y42.723 E.05933
G1 X107.783 Y42.19
M73 P88 R2
G1 X106.417 Y43.555 E.05933
G1 X106.417 Y43.022
G1 X107.783 Y41.656 E.05932
G1 X107.783 Y41.123
G1 X106.417 Y42.488 E.05933
G1 X106.417 Y41.955
G1 X107.783 Y40.59 E.05933
G1 X107.783 Y40.057
G1 X106.417 Y41.422 E.05933
G1 X106.417 Y40.889
G1 X107.783 Y39.523 E.05933
G1 X107.797 Y38.976
G1 X106.417 Y40.355 E.05994
G1 X106.417 Y39.822
G1 X107.858 Y38.381 E.0626
G1 X107.988 Y37.718
G1 X106.42 Y39.286 E.06814
G1 X106.445 Y38.728
G1 X108.226 Y36.947 E.07739
G1 X108.69 Y35.95
G1 X106.516 Y38.124 E.09446
G1 X106.645 Y37.461
G1 X112.861 Y31.245 E.27013
G1 X112.111 Y31.462
G1 X106.862 Y36.711 E.22812
G1 X107.223 Y35.817
G1 X111.217 Y31.823 E.17352
; WIPE_START
M204 S6000
G1 X109.802 Y33.238 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.444 Y36.998 Z2.8 F42000
G1 X171.919 Y68.412 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10081
G1 F15000
M204 S6000
G1 X171.831 Y68.48 E.00052
; LINE_WIDTH: 0.126325
G1 X171.742 Y68.549 E.00077
; LINE_WIDTH: 0.158637
G1 X171.636 Y68.627 E.00124
; LINE_WIDTH: 0.196527
G1 X171.53 Y68.706 E.00165
G1 X171.385 Y68.683 E.00184
; WIPE_START
G1 X171.53 Y68.706 E-.40099
G1 X171.636 Y68.627 E-.35901
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X174.593 Y67.931 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0990323
G1 F15000
M204 S6000
G3 X173.831 Y68.693 I-16.911 J-16.149 E.00493
; WIPE_START
G1 X174.593 Y67.931 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X175.754 Y66.233 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.108543
G1 F15000
M204 S6000
G1 X175.664 Y66.353 E.0008
; LINE_WIDTH: 0.149308
G1 X175.575 Y66.474 E.0013
; LINE_WIDTH: 0.183316
G1 X175.482 Y66.595 E.00175
; LINE_WIDTH: 0.21054
G1 X175.388 Y66.716 E.00208
; WIPE_START
G1 X175.482 Y66.595 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X174.583 Y65.485 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.195861
G1 F15000
M204 S6000
G1 X174.606 Y65.63 E.00184
; LINE_WIDTH: 0.197385
G1 X174.527 Y65.736 E.00166
; LINE_WIDTH: 0.158427
G1 X174.448 Y65.844 E.00126
; LINE_WIDTH: 0.12617
G1 X174.38 Y65.931 E.00075
; LINE_WIDTH: 0.100834
G1 X174.312 Y66.019 E.00052
; WIPE_START
G1 X174.38 Y65.931 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X174.635 Y58.303 Z2.8 F42000
G1 X175.299 Y38.398 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.11613
G1 F15000
M204 S6000
G1 X175.217 Y38.238 E.00107
; WIPE_START
G1 X175.299 Y38.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X175.278 Y46.03 Z2.8 F42000
G1 X175.228 Y63.931 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.160175
G1 F15000
M204 S6000
G1 X175.084 Y64.187 E.00281
; WIPE_START
G1 X175.228 Y63.931 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X169.639 Y58.733 Z2.8 F42000
G1 X133.828 Y25.422 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.211715
G1 F15000
M204 S6000
G1 X133.561 Y25.616 E.00454
; LINE_WIDTH: 0.248902
G2 X133.166 Y26.01 I1.31 J1.705 E.00939
; LINE_WIDTH: 0.211721
G1 X132.972 Y26.278 E.00454
; WIPE_START
G1 X133.166 Y26.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.794 Y25.739 Z2.8 F42000
G1 X149.327 Y25.435 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.143065
G1 F15000
M204 S6000
G1 X149.215 Y25.471 E.00095
G1 X149.078 Y25.401 E.00126
; WIPE_START
G1 X149.215 Y25.471 E-.4327
G1 X149.327 Y25.435 E-.3273
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X150.014 Y26.01 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0982455
G1 F15000
M204 S6000
G2 X149.932 Y25.903 I-1.409 J.997 E.00061
; WIPE_START
G1 X150.014 Y26.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.398 Y27.94 Z2.8 F42000
G1 X170.157 Y31.275 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0959491
G1 F15000
M204 S6000
G1 X170.003 Y31.191 E.00076
; WIPE_START
G1 X170.157 Y31.275 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X170.998 Y31.5 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0898251
G1 F15000
M204 S6000
G1 X170.856 Y31.416 E.00063
; WIPE_START
G1 X170.998 Y31.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X168.693 Y32.326 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.112703
G1 F15000
M204 S6000
G1 X168.495 Y32.403 E.00121
; WIPE_START
G1 X168.693 Y32.326 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X161.061 Y32.353 Z2.8 F42000
G1 X113.053 Y32.522 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.137203
G1 F15000
M204 S6000
G1 X112.781 Y32.681 E.00242
; WIPE_START
G1 X113.053 Y32.522 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.659 Y31.883 Z2.8 F42000
G1 X132.954 Y30.851 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.168274
G1 F15000
M204 S6000
G1 X133.014 Y31 E.00165
G1 X132.953 Y31.062 E.00088
G1 X132.802 Y31 E.00166
; WIPE_START
G1 X132.953 Y31.062 E-.30151
G1 X133.014 Y31 E-.16003
G1 X132.954 Y30.851 E-.29846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.326 Y31.131 Z2.8 F42000
G1 X111.648 Y31.633 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.096195
G1 F15000
M204 S6000
G1 X111.597 Y31.666 E.00027
; LINE_WIDTH: 0.122692
G1 X111.514 Y31.723 E.00065
; LINE_WIDTH: 0.159624
G1 X111.432 Y31.779 E.00095
; LINE_WIDTH: 0.193606
G1 X111.35 Y31.835 E.00122
G1 X111.206 Y31.808 E.0018
M204 S10000
G1 X110.592 Y32.153 F42000
; LINE_WIDTH: 0.110756
G1 F15000
M204 S6000
G1 X110.434 Y32.275 E.00111
; LINE_WIDTH: 0.151116
G1 X110.306 Y32.378 E.00145
; LINE_WIDTH: 0.186628
G1 X110.177 Y32.482 E.00193
; LINE_WIDTH: 0.218831
G1 X110.052 Y32.587 E.00235
; LINE_WIDTH: 0.24773
G1 X109.926 Y32.692 E.00273
; LINE_WIDTH: 0.284551
G1 F14898.763
G1 X109.68 Y32.906 E.00642
; LINE_WIDTH: 0.322868
G1 F12859.543
G1 X109.44 Y33.124 E.00741
; LINE_WIDTH: 0.354713
G1 F11546.153
G2 X108.524 Y34.04 I15.072 J15.988 E.03291
; LINE_WIDTH: 0.322869
G1 F12859.486
G1 X108.306 Y34.281 E.00741
; LINE_WIDTH: 0.284538
G1 F14899.605
G1 X108.092 Y34.526 E.00642
; LINE_WIDTH: 0.247732
G1 F15000
G1 X107.987 Y34.652 E.00273
; LINE_WIDTH: 0.218863
G1 X107.882 Y34.777 E.00235
; LINE_WIDTH: 0.186649
G1 X107.778 Y34.906 E.00193
; LINE_WIDTH: 0.151099
G1 X107.675 Y35.034 E.00145
; LINE_WIDTH: 0.110755
G1 X107.553 Y35.192 E.00111
; WIPE_START
G1 X107.675 Y35.034 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.289 Y33.229 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.206167
G1 F15000
M204 S6000
G1 X111.104 Y33.372 E.00311
; LINE_WIDTH: 0.17307
G1 X110.997 Y33.458 E.00146
; LINE_WIDTH: 0.143117
G1 X110.888 Y33.546 E.00114
; LINE_WIDTH: 0.108121
G1 X110.697 Y33.706 E.00132
; WIPE_START
G1 X110.888 Y33.546 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.106 Y35.297 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.108236
G1 F15000
M204 S6000
G1 X108.945 Y35.489 E.00133
; LINE_WIDTH: 0.143266
G1 X108.858 Y35.596 E.00113
; LINE_WIDTH: 0.173389
G1 X108.77 Y35.706 E.0015
; LINE_WIDTH: 0.206407
G1 X108.629 Y35.889 E.00308
; WIPE_START
G1 X108.77 Y35.706 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.081 Y37.381 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.137198
G1 F15000
M204 S6000
G1 X107.922 Y37.653 E.00242
; WIPE_START
G1 X108.081 Y37.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.724 Y45.005 Z2.8 F42000
G1 X106.8 Y64.769 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0974986
G1 F15000
M204 S6000
G1 X106.716 Y64.621 E.00076
; WIPE_START
G1 X106.8 Y64.769 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.803 Y62.472 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0977737
G1 F15000
M204 S6000
G1 X107.712 Y62.258 E.00104
; WIPE_START
G1 X107.803 Y62.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.292 Y68.644 Z2.8 F42000
G1 X112.576 Y69.035 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.093451
G1 F15000
M204 S6000
G3 X112.466 Y69.015 I-.039 J-.097 E.00048
; WIPE_START
G1 X112.497 Y69.035 E-.24156
G1 X112.576 Y69.035 E-.51844
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.368 Y69.466 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.11059
G1 F15000
M204 S6000
G1 X114.16 Y69.37 E.00127
; WIPE_START
G1 X114.368 Y69.466 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122 Y69.427 Z2.8 F42000
G1 X170.087 Y69.184 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.160143
G1 F15000
M204 S6000
G1 X169.831 Y69.328 E.00281
; OBJECT_ID: 8
; WIPE_START
G1 X170.087 Y69.184 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X163.715 Y73.385 Z2.8 F42000
G1 X39.49 Y155.276 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X39.469 Y157.349 I-26.747 J.76 E.06373
G3 X37.71 Y161.496 I-7.121 J-.573 E.14082
G1 X37.71 Y145.597 E.48854
G2 X27.09 Y145.597 I-5.31 J.003 E.51241
G1 X27.09 Y161.496 E.48852
G3 X25.31 Y156.797 I5.383 J-4.726 E.15776
G1 X25.31 Y145.601 E.344
G3 X32.809 Y138.521 I7.093 J.001 E.35481
G3 X39.486 Y145.135 I-.423 J7.103 E.31539
G3 X40.306 Y144.909 I.942 J1.826 E.02634
G1 X47.351 Y144.91 E.21645
G3 X48.589 Y146.149 I-.068 J1.306 E.05896
G1 X48.59 Y154.193 E.24718
G3 X47.294 Y155.489 I-1.3 J-.004 E.06251
G1 X40.306 Y155.489 E.21472
G3 X39.544 Y155.301 I.129 J-2.159 E.02424
; WIPE_START
M204 S6000
G1 X39.49 Y156.797 E-.56866
G1 X39.47 Y157.3 E-.19134
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X43.715 Y150.956 Z2.8 F42000
G1 X44.144 Y150.315 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.22121
G1 F15000
M204 S6000
G1 X43.976 Y150.028 E.00483
G1 X44.021 Y149.926 E.00162
; WIPE_START
G1 X43.976 Y150.028 E-.19103
G1 X44.144 Y150.315 E-.56897
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X47.043 Y155.282 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X48.383 Y153.942 E.0582
G1 X48.383 Y153.409
G1 X46.51 Y155.282 E.08137
G1 X45.977 Y155.282
G1 X48.382 Y152.876 E.10454
G1 X48.382 Y152.343
G1 X45.443 Y155.282 E.12771
G1 X44.91 Y155.282
G1 X48.382 Y151.81 E.15088
G1 X48.382 Y151.277
G1 X44.377 Y155.282 E.17405
G1 X43.844 Y155.282
G1 X48.382 Y150.743 E.19722
G1 X48.382 Y150.21
G1 X43.31 Y155.282 E.22039
G1 X42.777 Y155.282
G1 X48.382 Y149.677 E.24356
G1 X48.382 Y149.144
G1 X42.244 Y155.282 E.26673
G1 X41.711 Y155.282
G1 X48.382 Y148.611 E.2899
G1 X48.382 Y148.077
G1 X41.177 Y155.282 E.31307
G1 X40.644 Y155.282
G1 X48.382 Y147.544 E.33624
G1 X48.382 Y147.011
G1 X40.126 Y155.267 E.35875
G1 X39.721 Y155.139
G1 X48.382 Y146.478 E.37636
G1 X48.356 Y145.97
G1 X44.181 Y150.145 E.18144
G1 X43.881 Y149.911
G1 X48.198 Y145.595 E.18756
; WIPE_START
M204 S6000
G1 X46.784 Y147.009 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X44.009 Y150.317 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X39.329 Y154.997 E.20337
; WIPE_START
M204 S6000
G1 X40.743 Y153.583 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.843 Y159.216 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X37.917 Y160.142 E.04023
G1 X37.917 Y159.608
G1 X39.082 Y158.443 E.05062
G1 X39.211 Y157.782
G1 X37.917 Y159.075 E.05621
G1 X37.917 Y158.542
G1 X39.27 Y157.189 E.05879
G1 X39.283 Y156.643
G1 X37.917 Y158.009 E.05933
G1 X37.917 Y157.475
G1 X39.283 Y156.11 E.05933
G1 X39.283 Y155.577
G1 X37.917 Y156.942 E.05933
G1 X37.917 Y156.409
G1 X39.283 Y155.044 E.05933
; WIPE_START
M204 S6000
G1 X37.917 Y156.409 E-.73367
G1 X37.917 Y156.478 E-.02633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X37.917 Y155.876 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X43.812 Y149.981 E.25613
; WIPE_START
M204 S6000
G1 X42.397 Y151.395 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X47.541 Y145.757 Z2.8 F42000
G1 X47.936 Y145.324 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X37.917 Y155.342 E.43536
G1 X37.917 Y154.809
M73 P89 R2
G1 X47.574 Y145.153 E.41961
G1 X47.075 Y145.118
G1 X37.917 Y154.276 E.39796
G1 X37.917 Y153.742
G1 X46.542 Y145.118 E.37479
G1 X46.009 Y145.118
G1 X37.917 Y153.209 E.35162
G1 X37.917 Y152.676
G1 X45.476 Y145.118 E.32845
G1 X44.943 Y145.117
G1 X37.917 Y152.143 E.30528
G1 X37.917 Y151.609
G1 X44.41 Y145.117 E.28211
G1 X43.876 Y145.117
G1 X37.917 Y151.076 E.25895
G1 X37.917 Y150.543
G1 X43.343 Y145.117 E.23578
G1 X42.81 Y145.117
G1 X37.917 Y150.01 E.21261
G1 X37.917 Y149.476
G1 X42.277 Y145.117 E.18944
G1 X41.744 Y145.117
G1 X37.917 Y148.943 E.16627
G1 X37.917 Y148.41
G1 X41.211 Y145.117 E.1431
G1 X40.677 Y145.117
G1 X37.917 Y147.877 E.11993
G1 X37.917 Y147.343
G1 X40.128 Y145.133 E.09606
G1 X39.312 Y145.416
G1 X37.917 Y146.81 E.06059
G1 X37.917 Y146.277
G1 X39.252 Y144.942 E.05802
G1 X39.188 Y144.473
G1 X37.917 Y145.744 E.05523
G1 X37.904 Y145.224
G1 X39.1 Y144.028 E.05197
G1 X38.987 Y143.607
G1 X37.85 Y144.744 E.0494
G1 X37.762 Y144.299
G1 X38.853 Y143.209 E.04739
G1 X38.699 Y142.829
G1 X37.644 Y143.884 E.04586
G1 X37.5 Y143.495
G1 X38.527 Y142.467 E.04465
G1 X38.339 Y142.123
G1 X37.332 Y143.129 E.04372
G1 X37.144 Y142.784
G1 X38.134 Y141.794 E.04302
G1 X37.914 Y141.481
G1 X36.936 Y142.459 E.0425
G1 X36.709 Y142.153
G1 X37.678 Y141.183 E.04214
G1 X37.428 Y140.901
G1 X36.462 Y141.867 E.04196
G1 X36.197 Y141.598
G1 X37.163 Y140.633 E.04195
G1 X36.884 Y140.378
G1 X35.915 Y141.347 E.04209
G1 X35.614 Y141.115
G1 X36.589 Y140.14 E.04236
G1 X36.28 Y139.916
G1 X35.293 Y140.902 E.04288
G1 X34.953 Y140.709
G1 X35.955 Y139.707 E.04353
G1 X35.614 Y139.515
G1 X34.592 Y140.537 E.04441
G1 X34.209 Y140.387
G1 X35.257 Y139.338 E.04557
G1 X34.882 Y139.181
G1 X33.8 Y140.263 E.047
G1 X33.362 Y140.167
G1 X34.487 Y139.042 E.04886
G1 X34.072 Y138.924
G1 X32.891 Y140.105 E.05129
G1 X32.38 Y140.083
G1 X33.634 Y138.829 E.0545
G1 X33.168 Y138.761
G1 X31.816 Y140.113 E.05876
G1 X31.176 Y140.22
G1 X32.672 Y138.724 E.06501
G1 X32.14 Y138.723
G1 X30.408 Y140.455 E.07524
; WIPE_START
M204 S6000
G1 X31.822 Y139.04 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X29.279 Y141.051 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X31.56 Y138.77 E.09911
; WIPE_START
M204 S6000
G1 X30.146 Y140.184 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X28.904 Y147.715 Z2.8 F42000
G1 X26.883 Y159.978 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X26.507 Y160.354 E.01633
G1 X26.315 Y160.012
G1 X26.883 Y159.445 E.02466
G1 X26.883 Y158.911
G1 X26.138 Y159.656 E.03234
G1 X25.981 Y159.279
G1 X26.883 Y158.378 E.03916
G1 X26.883 Y157.845
G1 X25.842 Y158.886 E.04523
G1 X25.724 Y158.47
G1 X26.883 Y157.312 E.05033
G1 X26.883 Y156.778
G1 X25.63 Y158.031 E.05444
G1 X25.561 Y157.567
G1 X26.883 Y156.245 E.05743
G1 X26.883 Y155.712
G1 X25.523 Y157.072 E.05908
G1 X25.517 Y156.544
G1 X26.883 Y155.179 E.05933
G1 X26.883 Y154.645
G1 X25.517 Y156.011 E.05933
G1 X25.517 Y155.477
G1 X26.883 Y154.112 E.05933
G1 X26.883 Y153.579
G1 X25.517 Y154.944 E.05933
G1 X25.517 Y154.411
G1 X26.883 Y153.046 E.05933
G1 X26.883 Y152.512
G1 X25.517 Y153.878 E.05933
G1 X25.517 Y153.344
G1 X26.883 Y151.979 E.05933
G1 X26.883 Y151.446
G1 X25.517 Y152.811 E.05933
G1 X25.517 Y152.278
G1 X26.883 Y150.913 E.05933
G1 X26.883 Y150.379
G1 X25.517 Y151.745 E.05933
G1 X25.517 Y151.211
G1 X26.883 Y149.846 E.05933
G1 X26.883 Y149.313
G1 X25.517 Y150.678 E.05933
G1 X25.517 Y150.145
G1 X26.883 Y148.78 E.05933
G1 X26.883 Y148.246
G1 X25.517 Y149.612 E.05933
G1 X25.517 Y149.078
G1 X26.883 Y147.713 E.05933
G1 X26.883 Y147.18
G1 X25.517 Y148.545 E.05933
G1 X25.517 Y148.012
G1 X26.883 Y146.647 E.05933
G1 X26.883 Y146.113
G1 X25.517 Y147.478 E.05933
G1 X25.517 Y146.945
G1 X26.883 Y145.58 E.05934
G1 X26.915 Y145.015
G1 X25.517 Y146.412 E.06071
G1 X25.517 Y145.879
G1 X27.021 Y144.375 E.06535
G1 X27.256 Y143.607
G1 X25.523 Y145.34 E.07531
G1 X25.569 Y144.76
G1 X27.849 Y142.481 E.09907
; WIPE_START
M204 S6000
G1 X26.435 Y143.895 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X25.681 Y144.116 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X30.917 Y138.879 E.22756
G1 X30.176 Y139.087
G1 X25.888 Y143.375 E.18633
G1 X26.281 Y142.449
G1 X29.246 Y139.483 E.12886
; WIPE_START
M204 S6000
G1 X27.832 Y140.898 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.853 Y144.809 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126484
G1 F15000
M204 S6000
G1 X26.931 Y145.031 E.0016
; WIPE_START
G1 X26.853 Y144.809 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.877 Y152.442 Z2.8 F42000
G1 X26.901 Y160.427 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.124505
G1 F15000
M204 S6000
G1 X26.649 Y160.531 E.00181
G3 X26.559 Y160.434 I.13 J-.211 E.00089
; WIPE_START
G1 X26.649 Y160.531 E-.24821
G1 X26.901 Y160.427 E-.51179
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X27.14 Y152.799 Z2.8 F42000
G1 X27.441 Y143.182 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.099392
G1 F15000
M204 S6000
G1 X27.388 Y143.256 E.00042
; LINE_WIDTH: 0.131057
G1 X27.325 Y143.348 E.0008
; LINE_WIDTH: 0.172237
G1 X27.261 Y143.442 E.0012
; LINE_WIDTH: 0.200934
G1 X27.193 Y143.545 E.00158
; WIPE_START
G1 X27.261 Y143.442 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X29.702 Y139.269 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.105342
G1 F15000
M204 S6000
G1 X29.609 Y139.331 E.00057
; LINE_WIDTH: 0.146266
G1 X29.496 Y139.41 E.00116
; LINE_WIDTH: 0.203666
G2 X29.308 Y139.545 I3.392 J4.952 E.00303
M204 S10000
G1 X28.506 Y139.928 F42000
; LINE_WIDTH: 0.096352
G1 F15000
M204 S6000
G1 X28.422 Y139.998 E.00048
; LINE_WIDTH: 0.124709
G1 X28.215 Y140.176 E.00182
; LINE_WIDTH: 0.171627
G2 X27.814 Y140.543 I9.053 J10.294 E.0057
; LINE_WIDTH: 0.189789
G2 X27.059 Y141.322 I12.667 J13.039 E.01299
; LINE_WIDTH: 0.141912
G1 X26.879 Y141.527 E.0022
; LINE_WIDTH: 0.106189
G1 X26.727 Y141.707 E.00121
; WIPE_START
G1 X26.879 Y141.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X29.291 Y141.063 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.206937
G1 F15000
M204 S6000
G1 X29.146 Y141.051 E.00195
G1 X28.996 Y141.18 E.00265
; LINE_WIDTH: 0.170211
G1 X28.512 Y141.631 E.00686
G1 X28.053 Y142.114 E.00691
; LINE_WIDTH: 0.213619
G1 X27.789 Y142.42 E.00563
; WIPE_START
G1 X28.053 Y142.114 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X30.345 Y140.392 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.194512
G1 F15000
M204 S6000
G1 X30.247 Y140.458 E.00146
; LINE_WIDTH: 0.165041
G1 X30.147 Y140.525 E.0012
; LINE_WIDTH: 0.134478
G1 X30.065 Y140.582 E.00075
; LINE_WIDTH: 0.10361
G1 X29.983 Y140.64 E.0005
; WIPE_START
G1 X30.065 Y140.582 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X31.11 Y140.154 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.155378
G1 F15000
M204 S6000
G1 X30.845 Y140.307 E.00281
; WIPE_START
G1 X31.11 Y140.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X32.396 Y140.099 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.132967
G1 F15000
M204 S6000
G1 X32.182 Y140.014 E.00169
; WIPE_START
G1 X32.396 Y140.099 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.286 Y140.091 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0905447
G1 F15000
M204 S6000
G1 X33.116 Y140.147 E.0007
; WIPE_START
G1 X33.286 Y140.091 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X31.225 Y138.816 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.101234
G1 F15000
M204 S6000
G1 X30.98 Y138.941 E.00131
; WIPE_START
G1 X31.225 Y138.816 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X36.968 Y143.843 Z2.8 F42000
G1 X44.265 Y150.23 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.144723
G1 F15000
M204 S6000
G1 X44.196 Y150.332 E.00102
; LINE_WIDTH: 0.115123
G1 X44.126 Y150.434 E.00073
; WIPE_START
G1 X44.196 Y150.332 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X39.301 Y155.016 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.108774
G1 F15000
M204 S6000
G1 X39.173 Y154.887 E.00098
; WIPE_START
G1 X39.301 Y155.016 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.972 Y158.844 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0987063
G1 F15000
M204 S6000
G1 X38.785 Y159.158 E.00166
M204 S10000
G1 X38.631 Y159.721 F42000
; LINE_WIDTH: 0.101936
G1 F15000
M204 S6000
G1 X38.576 Y159.799 E.00046
; LINE_WIDTH: 0.129956
G1 X38.521 Y159.877 E.00068
; LINE_WIDTH: 0.164098
G1 X38.441 Y159.985 E.00133
; LINE_WIDTH: 0.20436
G1 X38.361 Y160.094 E.00177
; LINE_WIDTH: 0.241953
G1 X38.279 Y160.2 E.00218
; LINE_WIDTH: 0.276887
G1 X38.197 Y160.307 E.00256
; LINE_WIDTH: 0.316828
G1 F13143.119
G3 X38.032 Y160.407 I-.141 J-.045 E.0047
; LINE_WIDTH: 0.287221
G1 F14735.97
G1 X37.965 Y160.303 E.00246
; LINE_WIDTH: 0.243261
G1 F15000
G1 X37.899 Y160.199 E.00202
; WIPE_START
G1 X37.965 Y160.303 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X37.946 Y152.67 Z2.8 F42000
G1 X37.925 Y144.819 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0922748
G1 F15000
M204 S6000
G1 X37.866 Y144.995 E.00074
; WIPE_START
G1 X37.925 Y144.819 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.98 Y143.576 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.088449
G1 F15000
M204 S6000
G1 X38.895 Y143.433 E.00062
; WIPE_START
G1 X38.98 Y143.576 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X45.721 Y145.139 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.122835
G1 F15000
M204 S6000
G1 X45.497 Y145.139 E.00146
; WIPE_START
G1 X45.721 Y145.139 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X47.749 Y145.244 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0902258
G1 F15000
M204 S6000
G1 X47.604 Y145.159 E.00065
; WIPE_START
G1 X47.749 Y145.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.293 Y152.857 Z2.8 F42000
G1 X48.395 Y154.291 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.314518
G1 F13254.878
M204 S6000
G3 X48.11 Y154.696 I-5.294 J-3.434 E.01096
; LINE_WIDTH: 0.35819
G1 F11418.814
G3 X47.736 Y155.055 I-1.506 J-1.194 E.01336
; LINE_WIDTH: 0.3109
G1 F13433.879
G1 X47.392 Y155.295 E.00916
; OBJECT_ID: 9
; WIPE_START
G1 X47.736 Y155.055 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X55.368 Y155.119 Z2.8 F42000
G1 X73.89 Y155.276 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G3 X73.839 Y157.362 I-17.183 J.627 E.06416
G3 X72.11 Y161.309 I-7.363 J-.874 E.13434
G1 X72.11 Y145.898 E.47355
G2 X60.89 Y145.898 I-5.61 J.006 E.54115
G1 X60.89 Y161.309 E.47354
G3 X59.11 Y156.497 I5.624 J-4.816 E.16097
G1 X59.11 Y145.902 E.32557
G3 X66.726 Y138.514 I7.392 J.001 E.36364
G3 X73.863 Y145.155 I-.236 J7.409 E.32686
G3 X74.653 Y144.911 I.993 J1.817 E.02558
G1 X81.751 Y144.911 E.2181
G3 X82.989 Y146.151 I-.076 J1.314 E.05893
G1 X82.99 Y154.194 E.24712
G3 X81.694 Y155.49 I-1.3 J-.004 E.06251
G1 X74.706 Y155.49 E.21472
G3 X73.944 Y155.302 I.128 J-2.156 E.02424
; WIPE_START
M204 S6000
G1 X73.884 Y156.788 E-.5652
G1 X73.844 Y157.299 E-.1948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.158 Y151.002 Z2.8 F42000
G1 X78.581 Y150.384 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.216844
G1 F15000
M204 S6000
G1 X78.373 Y150.027 E.00586
G1 X78.419 Y149.928 E.00155
; WIPE_START
G1 X78.373 Y150.027 E-.15918
G1 X78.581 Y150.384 E-.60082
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.591 Y155.282 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X82.783 Y154.091 E.05176
G1 X82.783 Y153.558
G1 X81.058 Y155.282 E.07493
G1 X80.525 Y155.282
G1 X82.782 Y153.025 E.0981
G1 X82.782 Y152.492
G1 X79.992 Y155.282 E.12127
G1 X79.458 Y155.282
G1 X82.782 Y151.958 E.14444
G1 X82.782 Y151.425
G1 X78.925 Y155.282 E.16761
G1 X78.392 Y155.282
G1 X82.782 Y150.892 E.19078
G1 X82.782 Y150.359
G1 X77.859 Y155.282 E.21395
G1 X77.325 Y155.282
G1 X82.782 Y149.826 E.23712
G1 X82.782 Y149.293
G1 X76.792 Y155.282 E.26029
G1 X76.259 Y155.282
G1 X82.782 Y148.759 E.28346
G1 X82.782 Y148.226
G1 X75.726 Y155.282 E.30663
G1 X75.192 Y155.282
G1 X82.782 Y147.693 E.3298
G1 X82.782 Y147.16
G1 X74.662 Y155.28 E.35284
G1 X74.229 Y155.179
G1 X82.782 Y146.627 E.37163
G1 X82.775 Y146.099
G1 X78.631 Y150.244 E.18009
G1 X78.437 Y149.905
G1 X82.653 Y145.689 E.1832
; WIPE_START
M204 S6000
G1 X81.238 Y147.103 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.464 Y150.411 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X73.838 Y155.037 E.20103
; WIPE_START
M204 S6000
G1 X75.252 Y153.623 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.326 Y160.281 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X72.949 Y159.658 E.02707
G1 X73.318 Y158.757
G1 X72.317 Y159.757 E.04347
G1 X72.317 Y159.224
G1 X73.518 Y158.024 E.05216
G1 X73.628 Y157.38
G1 X72.317 Y158.691 E.05694
G1 X72.317 Y158.157
G1 X73.676 Y156.799 E.05904
G1 X73.683 Y156.259
G1 X72.317 Y157.624 E.05933
G1 X72.317 Y157.091
G1 X73.683 Y155.726 E.05933
G1 X73.683 Y155.192
G1 X72.317 Y156.557 E.05933
G1 X72.317 Y156.024
G1 X78.267 Y150.075 E.25853
; WIPE_START
M204 S6000
G1 X76.853 Y151.489 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.997 Y145.851 Z2.8 F42000
G1 X82.417 Y145.392 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X72.317 Y155.491 E.43886
G1 X72.317 Y154.958
G1 X82.086 Y145.189 E.42448
G1 X81.624 Y145.118
G1 X72.317 Y154.424 E.4044
M73 P90 R2
G1 X72.317 Y153.891
G1 X81.09 Y145.118 E.38123
G1 X80.557 Y145.118
G1 X72.317 Y153.358 E.35805
G1 X72.317 Y152.825
G1 X80.024 Y145.118 E.33488
G1 X79.491 Y145.118
G1 X72.317 Y152.291 E.31171
G1 X72.317 Y151.758
G1 X78.957 Y145.118 E.28854
G1 X78.424 Y145.118
G1 X72.317 Y151.225 E.26536
G1 X72.317 Y150.692
G1 X77.891 Y145.118 E.24219
G1 X77.358 Y145.118
G1 X72.317 Y150.158 E.21902
G1 X72.317 Y149.625
G1 X76.824 Y145.118 E.19585
G1 X76.291 Y145.118
G1 X72.317 Y149.092 E.17267
G1 X72.317 Y148.559
G1 X75.758 Y145.118 E.1495
G1 X75.225 Y145.118
G1 X72.317 Y148.025 E.12633
G1 X72.317 Y147.492
G1 X74.691 Y145.118 E.10316
G1 X73.921 Y145.355
G1 X72.317 Y146.959 E.0697
G1 X72.317 Y146.426
G1 X73.644 Y145.099 E.05764
G1 X73.571 Y144.639
G1 X72.317 Y145.892 E.05447
G1 X72.294 Y145.383
G1 X73.477 Y144.2 E.05142
G1 X73.362 Y143.781
G1 X72.232 Y144.911 E.04912
G1 X72.139 Y144.471
G1 X73.226 Y143.384 E.04726
G1 X73.073 Y143.004
G1 X72.018 Y144.059 E.04583
G1 X71.873 Y143.671
G1 X72.9 Y142.643 E.04464
G1 X72.713 Y142.297
G1 X71.705 Y143.305 E.04378
G1 X71.518 Y142.959
G1 X72.509 Y141.968 E.04307
G1 X72.291 Y141.653
G1 X71.312 Y142.631 E.04251
G1 X71.087 Y142.323
G1 X72.059 Y141.352 E.04222
G1 X71.811 Y141.066
G1 X70.845 Y142.032 E.042
G1 X70.585 Y141.759
G1 X71.55 Y140.794 E.04191
G1 X71.275 Y140.535
G1 X70.308 Y141.503 E.04205
G1 X70.013 Y141.264
G1 X70.986 Y140.292 E.04226
G1 X70.682 Y140.062
G1 X69.701 Y141.043 E.04262
G1 X69.37 Y140.841
G1 X70.365 Y139.846 E.04322
G1 X70.031 Y139.646
G1 X69.02 Y140.657 E.04393
G1 X68.65 Y140.494
G1 X69.682 Y139.462 E.04485
G1 X69.318 Y139.293
G1 X68.257 Y140.355 E.04611
G1 X67.838 Y140.239
G1 X68.934 Y139.144 E.04761
G1 X68.533 Y139.011
G1 X67.392 Y140.152 E.04958
G1 X66.913 Y140.098
G1 X68.11 Y138.901 E.05199
G1 X67.665 Y138.813
G1 X66.395 Y140.083 E.0552
G1 X65.822 Y140.123
G1 X67.193 Y138.752 E.0596
G1 X66.691 Y138.721
G1 X65.176 Y140.236 E.06584
G1 X64.405 Y140.474
G1 X66.151 Y138.727 E.07589
G1 X65.565 Y138.78
G1 X63.309 Y141.036 E.09805
; WIPE_START
M204 S6000
G1 X64.723 Y139.622 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.215 Y147.104 Z2.8 F42000
G1 X60.683 Y159.66 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X60.27 Y160.072 E.01791
G1 X60.083 Y159.726
G1 X60.683 Y159.127 E.02605
G1 X60.683 Y158.594
G1 X59.914 Y159.362 E.0334
G1 X59.761 Y158.982
G1 X60.683 Y158.06 E.04007
G1 X60.683 Y157.527
G1 X59.627 Y158.582 E.04585
G1 X59.513 Y158.164
G1 X60.683 Y156.994 E.05083
G1 X60.683 Y156.461
G1 X59.423 Y157.72 E.05473
G1 X59.358 Y157.252
G1 X60.683 Y155.927 E.05756
G1 X60.683 Y155.394
G1 X59.322 Y156.754 E.05911
G1 X59.317 Y156.226
G1 X60.683 Y154.861 E.05933
G1 X60.683 Y154.328
G1 X59.317 Y155.693 E.05933
G1 X59.317 Y155.16
G1 X60.683 Y153.794 E.05933
G1 X60.683 Y153.261
G1 X59.317 Y154.626 E.05933
G1 X59.317 Y154.093
G1 X60.683 Y152.728 E.05933
G1 X60.683 Y152.195
G1 X59.317 Y153.56 E.05933
G1 X59.317 Y153.027
G1 X60.683 Y151.661 E.05933
G1 X60.683 Y151.128
G1 X59.317 Y152.493 E.05933
G1 X59.317 Y151.96
G1 X60.683 Y150.595 E.05933
G1 X60.683 Y150.062
G1 X59.317 Y151.427 E.05933
G1 X59.317 Y150.893
G1 X60.683 Y149.528 E.05933
G1 X60.683 Y148.995
G1 X59.317 Y150.36 E.05933
G1 X59.317 Y149.827
G1 X60.683 Y148.462 E.05933
G1 X60.683 Y147.928
G1 X59.317 Y149.294 E.05933
G1 X59.317 Y148.76
G1 X60.683 Y147.395 E.05933
G1 X60.683 Y146.862
G1 X59.317 Y148.227 E.05933
G1 X59.317 Y147.694
G1 X60.683 Y146.329 E.05933
G1 X60.685 Y145.793
G1 X59.317 Y147.161 E.05941
G1 X59.317 Y146.627
G1 X60.722 Y145.222 E.06105
G1 X60.836 Y144.575
G1 X59.317 Y146.094 E.066
G1 X59.327 Y145.551
G1 X61.074 Y143.804 E.07592
G1 X61.639 Y142.706
G1 X59.38 Y144.965 E.09816
G1 X59.496 Y144.316
G1 X64.917 Y138.894 E.23561
G1 X64.172 Y139.106
G1 X59.706 Y143.572 E.19406
G1 X60.095 Y142.65
G1 X63.25 Y139.495 E.13708
; WIPE_START
M204 S6000
G1 X61.836 Y140.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X61.39 Y148.529 Z2.8 F42000
G1 X60.701 Y160.293 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.21806
G1 F15000
M204 S6000
G1 X60.465 Y160.266 E.00339
; LINE_WIDTH: 0.197191
G1 X60.436 Y160.254 E.00039
; LINE_WIDTH: 0.162636
G1 X60.408 Y160.242 E.0003
; LINE_WIDTH: 0.123568
G3 X60.374 Y160.222 I.002 J-.043 E.00027
; LINE_WIDTH: 0.0983892
G1 X60.312 Y160.141 E.00046
; WIPE_START
G1 X60.374 Y160.222 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.103 Y154.231 Z2.8 F42000
G1 X72.315 Y145.094 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.100609
G1 F15000
M204 S6000
G1 X72.233 Y144.935 E.00084
; WIPE_START
G1 X72.315 Y145.094 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.946 Y145.248 Z2.8 F42000
G1 X82.248 Y145.294 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.103145
G1 F15000
M204 S6000
G2 X82.13 Y145.207 I-.948 J1.161 E.00072
; WIPE_START
G1 X82.248 Y145.294 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.692 Y152.913 Z2.8 F42000
G1 X82.779 Y154.408 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.2075
G1 F15000
M204 S6000
G3 X82.558 Y154.72 I-4.09 J-2.664 E.00512
; LINE_WIDTH: 0.254598
G3 X82.193 Y155.079 I-1.703 J-1.367 E.00887
; LINE_WIDTH: 0.21616
G1 X82.127 Y155.127 E.00114
; LINE_WIDTH: 0.187495
G1 X81.902 Y155.277 E.00319
; WIPE_START
G1 X82.127 Y155.127 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.765 Y154.398 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0998109
G1 F15000
M204 S6000
G1 X82.445 Y155.01 E.0032
; WIPE_START
G1 X82.765 Y154.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.15 Y154.925 Z2.8 F42000
G1 X73.804 Y155.018 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.126777
G1 F15000
M204 S6000
G1 X73.705 Y154.964 E.00077
G1 X73.577 Y155.086 E.00121
; WIPE_START
G1 X73.705 Y154.964 E-.46331
G1 X73.804 Y155.018 E-.29669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.307 Y149.775 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0968279
G1 F15000
M204 S6000
G1 X78.176 Y149.942 E.00093
G1 X78.224 Y150.004 E.00035
; WIPE_START
G1 X78.176 Y149.942 E-.20676
G1 X78.307 Y149.775 E-.55324
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X72.454 Y144.877 Z2.8 F42000
G1 X65.227 Y138.829 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.101747
G1 F15000
M204 S6000
G1 X64.98 Y138.957 E.00134
; WIPE_START
G1 X65.227 Y138.829 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X66.932 Y140.116 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.108705
G1 F15000
M204 S6000
G1 X66.722 Y140.022 E.00123
; WIPE_START
G1 X66.932 Y140.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X67.811 Y140.235 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.101867
G1 F15000
M204 S6000
G1 X67.66 Y140.152 E.00083
; WIPE_START
G1 X67.811 Y140.235 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.342 Y140.411 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.192303
G1 F15000
M204 S6000
G1 X64.235 Y140.482 E.00156
; LINE_WIDTH: 0.158949
G1 X64.127 Y140.555 E.00123
; LINE_WIDTH: 0.128486
G1 X64.054 Y140.606 E.00062
; LINE_WIDTH: 0.101612
G1 X63.982 Y140.657 E.00043
M204 S10000
G1 X63.249 Y140.976 F42000
; LINE_WIDTH: 0.221478
G1 F15000
M204 S6000
G1 X63.098 Y141.1 E.00285
; LINE_WIDTH: 0.194408
G1 X62.92 Y141.253 E.00289
; LINE_WIDTH: 0.143195
G1 X62.411 Y141.728 E.00569
G1 X61.929 Y142.235 E.00572
; LINE_WIDTH: 0.178533
G1 X61.775 Y142.411 E.00259
; LINE_WIDTH: 0.206418
G1 X61.637 Y142.573 E.00283
G1 X61.651 Y142.719 E.00195
; WIPE_START
G1 X61.637 Y142.573 E-.30955
G1 X61.775 Y142.411 E-.45045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.539 Y139.911 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.110874
G1 F15000
M204 S6000
G1 X62.33 Y140.084 E.0015
; LINE_WIDTH: 0.153868
G1 X62.117 Y140.269 E.00256
; LINE_WIDTH: 0.200752
G2 X61.701 Y140.651 I9.448 J10.697 E.00726
; LINE_WIDTH: 0.216375
G2 X60.92 Y141.459 I13.262 J13.598 E.0159
; LINE_WIDTH: 0.164394
G1 X60.733 Y141.672 E.0028
; LINE_WIDTH: 0.121047
G1 X60.55 Y141.89 E.00181
; LINE_WIDTH: 0.0923375
G1 X60.511 Y141.939 E.00025
; WIPE_START
G1 X60.55 Y141.89 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.699 Y139.287 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.102329
G1 F15000
M204 S6000
G1 X63.628 Y139.335 E.00042
; LINE_WIDTH: 0.130638
G1 X63.556 Y139.383 E.00062
; LINE_WIDTH: 0.162789
G1 X63.434 Y139.47 E.00147
; LINE_WIDTH: 0.198796
G1 X63.311 Y139.556 E.00191
; WIPE_START
G1 X63.434 Y139.47 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.786 Y144.359 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.113647
G1 F15000
M204 S6000
G1 X60.851 Y144.59 E.00138
M204 S10000
G1 X60.926 Y144.243 F42000
; LINE_WIDTH: 0.105861
G1 F15000
M204 S6000
G2 X60.769 Y144.509 I12.555 J7.594 E.00158
; OBJECT_ID: 3
; WIPE_START
G1 X60.926 Y144.243 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X54.638 Y139.917 Z2.8 F42000
G1 X27.449 Y121.207 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X27.399 Y121.061 E.00475
G3 X27.09 Y119.002 I6.815 J-2.074 E.0642
G1 X27.09 Y95.998 E.70685
G3 X34.198 Y88.89 I7.119 J.011 E.34293
G1 X87.702 Y88.89 E1.64403
G3 X94.81 Y95.998 I-.005 J7.113 E.343
G1 X94.81 Y119.002 E.70685
G3 X87.702 Y126.11 I-7.112 J-.004 E.34301
G1 X34.198 Y126.11 E1.64403
G3 X27.635 Y121.719 I.015 J-7.123 E.25717
G1 X27.469 Y121.264 E.0149
; WIPE_START
M204 S6000
G1 X27.399 Y121.061 E-.08152
G1 X27.227 Y120.387 E-.26429
G1 X27.139 Y119.836 E-.21224
G1 X27.108 Y119.305 E-.20195
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.199 Y114.705 Z2.8 F42000
G1 X69.738 Y87.11 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X87.698 Y87.11 E.55187
G3 X96.59 Y96.002 I-.015 J8.907 E.42899
G1 X96.59 Y118.998 E.7066
G3 X90.614 Y127.397 I-8.893 J-.002 E.33785
G3 X87.698 Y127.89 I-2.967 J-8.678 E.09127
G1 X34.202 Y127.89 E1.64378
G3 X25.31 Y118.998 I.015 J-8.907 E.42899
G1 X25.31 Y96.002 E.7066
G3 X34.202 Y87.11 I8.894 J.002 E.42916
G1 X52.162 Y87.11 E.55187
G1 X52.16 Y82.804 E.13231
G3 X53.456 Y81.51 I1.306 J.012 E.06237
G1 X68.446 Y81.51 E.4606
G3 X69.74 Y82.804 I.001 J1.293 E.06247
G1 X69.738 Y87.05 E.13046
; WIPE_START
M204 S6000
G1 X71.738 Y87.057 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.109 Y93.904 Z2.8 F42000
G1 X91.346 Y126.88 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X95.58 Y122.646 E.18396
G1 X95.93 Y121.763
G1 X90.463 Y127.23 E.23759
G1 X89.714 Y127.446
G1 X96.146 Y121.014 E.27949
G1 X96.277 Y120.349
G1 X94.123 Y122.503 E.09358
G1 X94.568 Y121.525
G1 X96.35 Y119.743 E.07743
G1 X96.379 Y119.181
G1 X94.803 Y120.757 E.0685
G1 X94.935 Y120.092
G1 X96.383 Y118.644 E.06292
G1 X96.383 Y118.11
G1 X95 Y119.493 E.0601
G1 X95.017 Y118.942
G1 X96.383 Y117.577 E.05933
G1 X96.383 Y117.044
G1 X95.017 Y118.409 E.05933
G1 X95.017 Y117.876
G1 X96.383 Y116.511 E.05933
G1 X96.383 Y115.977
G1 X95.017 Y117.343 E.05933
G1 X95.017 Y116.809
G1 X96.383 Y115.444 E.05933
G1 X96.383 Y114.911
G1 X95.017 Y116.276 E.05933
G1 X95.017 Y115.743
G1 X96.383 Y114.378 E.05933
G1 X96.383 Y113.844
G1 X95.017 Y115.21 E.05933
G1 X95.017 Y114.676
G1 X96.383 Y113.311 E.05933
G1 X96.383 Y112.778
G1 X95.017 Y114.143 E.05933
G1 X95.017 Y113.61
G1 X96.383 Y112.245 E.05933
G1 X96.383 Y111.711
G1 X95.017 Y113.077 E.05933
G1 X95.017 Y112.543
G1 X96.383 Y111.178 E.05933
G1 X96.383 Y110.645
G1 X95.017 Y112.01 E.05933
G1 X95.017 Y111.477
G1 X96.383 Y110.112 E.05933
G1 X96.383 Y109.578
G1 X95.017 Y110.943 E.05933
G1 X95.017 Y110.41
G1 X96.383 Y109.045 E.05933
G1 X96.383 Y108.512
G1 X95.017 Y109.877 E.05933
G1 X95.017 Y109.344
G1 X96.383 Y107.978 E.05933
M73 P91 R2
G1 X96.383 Y107.445
G1 X95.017 Y108.81 E.05933
G1 X95.017 Y108.277
G1 X96.383 Y106.912 E.05933
G1 X96.383 Y106.379
G1 X95.017 Y107.744 E.05933
G1 X95.017 Y107.211
G1 X96.383 Y105.845 E.05933
G1 X96.383 Y105.312
G1 X95.017 Y106.677 E.05933
G1 X95.017 Y106.144
G1 X96.383 Y104.779 E.05933
G1 X96.383 Y104.246
G1 X95.017 Y105.611 E.05933
G1 X95.017 Y105.078
G1 X96.383 Y103.712 E.05933
G1 X96.383 Y103.179
G1 X95.017 Y104.544 E.05933
G1 X95.017 Y104.011
G1 X96.383 Y102.646 E.05933
G1 X96.383 Y102.113
G1 X95.017 Y103.478 E.05933
G1 X95.017 Y102.945
G1 X96.383 Y101.579 E.05933
G1 X96.383 Y101.046
G1 X95.017 Y102.411 E.05933
G1 X95.017 Y101.878
G1 X96.383 Y100.513 E.05933
G1 X96.383 Y99.98
G1 X95.017 Y101.345 E.05933
G1 X95.017 Y100.812
G1 X96.383 Y99.446 E.05933
G1 X96.383 Y98.913
G1 X95.017 Y100.278 E.05933
G1 X95.017 Y99.745
G1 X96.383 Y98.38 E.05933
G1 X96.383 Y97.847
G1 X95.017 Y99.212 E.05933
G1 X95.017 Y98.679
G1 X96.383 Y97.313 E.05933
G1 X96.383 Y96.78
G1 X95.017 Y98.145 E.05933
G1 X95.017 Y97.612
G1 X96.383 Y96.247 E.05933
G1 X96.377 Y95.719
G1 X95.017 Y97.079 E.05908
G1 X95.017 Y96.546
G1 X96.346 Y95.217 E.05772
G1 X96.289 Y94.74
G1 X95.017 Y96.012 E.05527
G1 X94.999 Y95.497
G1 X96.211 Y94.285 E.05267
G1 X96.111 Y93.852
G1 X94.949 Y95.014 E.05048
G1 X94.873 Y94.557
G1 X95.994 Y93.436 E.04869
G1 X95.86 Y93.036
G1 X94.772 Y94.125 E.0473
G1 X94.65 Y93.713
G1 X95.711 Y92.653 E.04608
G1 X95.546 Y92.284
G1 X94.508 Y93.322 E.04509
G1 X94.35 Y92.947
G1 X95.367 Y91.929 E.04421
G1 X95.176 Y91.588
G1 X94.173 Y92.59 E.04358
G1 X93.982 Y92.249
G1 X94.972 Y91.258 E.04304
G1 X94.756 Y90.941
G1 X93.775 Y91.922 E.0426
G1 X93.553 Y91.611
G1 X94.527 Y90.636 E.04234
G1 X94.287 Y90.344
G1 X93.318 Y91.313 E.04211
G1 X93.069 Y91.028
G1 X94.034 Y90.063 E.04194
G1 X93.77 Y89.794
G1 X92.805 Y90.759 E.04194
G1 X92.528 Y90.503
G1 X93.495 Y89.536 E.04201
G1 X93.208 Y89.29
G1 X92.238 Y90.26 E.04214
G1 X91.932 Y90.032
G1 X92.909 Y89.055 E.04244
G1 X92.598 Y88.833
G1 X91.613 Y89.818 E.04282
G1 X91.28 Y89.618
G1 X92.276 Y88.622 E.04328
G1 X91.941 Y88.424
G1 X90.929 Y89.435 E.04395
G1 X90.564 Y89.267
G1 X91.592 Y88.24 E.04466
G1 X91.229 Y88.069
G1 X90.181 Y89.117 E.04555
G1 X89.779 Y88.985
G1 X90.853 Y87.912 E.04665
G1 X90.462 Y87.77
G1 X89.358 Y88.874 E.04797
G1 X88.913 Y88.785
G1 X90.055 Y87.643 E.04962
G1 X89.629 Y87.536
G1 X88.443 Y88.722 E.05153
G1 X87.944 Y88.687
G1 X89.185 Y87.447 E.0539
G1 X88.721 Y87.378
G1 X87.416 Y88.683 E.05671
G1 X86.883 Y88.683
G1 X88.23 Y87.335 E.05855
G1 X87.714 Y87.318
G1 X86.349 Y88.683 E.05931
G1 X85.816 Y88.683
G1 X87.181 Y87.317 E.05933
G1 X86.648 Y87.317
G1 X85.283 Y88.683 E.05933
G1 X84.75 Y88.683
G1 X86.115 Y87.317 E.05933
G1 X85.582 Y87.317
G1 X84.216 Y88.683 E.05933
G1 X83.683 Y88.683
G1 X85.048 Y87.317 E.05933
G1 X84.515 Y87.317
G1 X83.15 Y88.683 E.05933
G1 X82.617 Y88.683
G1 X83.982 Y87.317 E.05933
G1 X83.449 Y87.317
G1 X82.083 Y88.683 E.05933
G1 X81.55 Y88.683
G1 X82.915 Y87.317 E.05933
G1 X82.382 Y87.317
G1 X81.017 Y88.683 E.05933
G1 X80.484 Y88.683
G1 X81.849 Y87.317 E.05933
G1 X81.315 Y87.317
G1 X79.95 Y88.683 E.05933
G1 X79.417 Y88.683
G1 X80.782 Y87.317 E.05933
G1 X80.249 Y87.317
G1 X78.884 Y88.683 E.05933
G1 X78.35 Y88.683
G1 X79.716 Y87.317 E.05933
G1 X79.182 Y87.317
G1 X77.817 Y88.683 E.05933
G1 X77.284 Y88.683
G1 X78.649 Y87.317 E.05933
G1 X78.116 Y87.317
G1 X76.751 Y88.683 E.05933
G1 X76.217 Y88.683
G1 X77.583 Y87.317 E.05933
G1 X77.049 Y87.317
G1 X75.684 Y88.683 E.05933
G1 X75.151 Y88.683
G1 X76.516 Y87.317 E.05933
G1 X75.983 Y87.317
G1 X74.618 Y88.683 E.05933
G1 X74.084 Y88.683
G1 X75.45 Y87.317 E.05933
G1 X74.916 Y87.317
G1 X73.551 Y88.683 E.05933
G1 X73.018 Y88.683
G1 X74.383 Y87.317 E.05933
G1 X73.85 Y87.317
G1 X72.485 Y88.683 E.05933
G1 X71.951 Y88.683
G1 X73.317 Y87.317 E.05933
G1 X72.783 Y87.317
G1 X71.418 Y88.683 E.05933
G1 X70.885 Y88.683
G1 X72.25 Y87.317 E.05933
G1 X71.717 Y87.317
G1 X70.352 Y88.683 E.05933
G1 X69.818 Y88.683
G1 X71.184 Y87.317 E.05933
G1 X70.65 Y87.317
G1 X69.285 Y88.683 E.05933
G1 X68.752 Y88.683
G1 X70.117 Y87.317 E.05933
G1 X69.584 Y87.317
G1 X68.219 Y88.683 E.05933
G1 X67.685 Y88.683
G1 X69.53 Y86.838 E.08018
G1 X69.531 Y86.304
G1 X67.152 Y88.683 E.10336
G1 X66.619 Y88.683
G1 X69.531 Y85.77 E.12655
G1 X69.531 Y85.237
G1 X66.086 Y88.683 E.14973
G1 X65.552 Y88.683
G1 X69.532 Y84.703 E.17292
G1 X69.532 Y84.17
G1 X65.019 Y88.683 E.1961
G1 X64.486 Y88.683
G1 X69.532 Y83.636 E.21929
G1 X69.532 Y83.103
G1 X63.953 Y88.683 E.24247
G1 X63.419 Y88.683
G1 X69.51 Y82.592 E.26467
G1 X69.357 Y82.211
G1 X62.886 Y88.683 E.28122
G1 X62.353 Y88.683
G1 X69.1 Y81.935 E.2932
G1 X68.744 Y81.758
G1 X61.82 Y88.683 E.30089
G1 X61.286 Y88.683
G1 X68.251 Y81.717 E.30267
G1 X67.718 Y81.717
G1 X60.753 Y88.683 E.30267
G1 X60.22 Y88.683
G1 X67.185 Y81.717 E.30267
G1 X66.652 Y81.717
G1 X59.686 Y88.683 E.30267
G1 X59.153 Y88.683
G1 X66.118 Y81.717 E.30267
G1 X65.585 Y81.717
G1 X58.62 Y88.683 E.30267
G1 X58.087 Y88.683
G1 X65.052 Y81.717 E.30267
G1 X64.519 Y81.717
G1 X57.553 Y88.683 E.30267
G1 X57.02 Y88.683
G1 X63.985 Y81.717 E.30267
G1 X63.452 Y81.717
G1 X56.487 Y88.683 E.30267
G1 X55.954 Y88.683
G1 X62.919 Y81.717 E.30267
G1 X62.386 Y81.717
G1 X55.42 Y88.683 E.30267
G1 X54.887 Y88.683
G1 X61.852 Y81.717 E.30267
G1 X61.319 Y81.717
G1 X54.354 Y88.683 E.30267
G1 X53.821 Y88.683
G1 X60.786 Y81.717 E.30267
G1 X60.253 Y81.717
G1 X53.287 Y88.683 E.30267
G1 X52.754 Y88.683
G1 X59.719 Y81.717 E.30267
G1 X59.186 Y81.717
G1 X52.221 Y88.683 E.30267
G1 X51.688 Y88.683
G1 X58.653 Y81.717 E.30267
G1 X58.12 Y81.717
G1 X51.154 Y88.683 E.30267
G1 X50.621 Y88.683
G1 X51.986 Y87.317 E.05933
G1 X51.453 Y87.317
G1 X50.088 Y88.683 E.05933
G1 X49.555 Y88.683
G1 X50.92 Y87.317 E.05933
G1 X50.387 Y87.317
G1 X49.021 Y88.683 E.05933
G1 X48.488 Y88.683
G1 X49.853 Y87.317 E.05933
G1 X49.32 Y87.317
G1 X47.955 Y88.683 E.05933
G1 X47.422 Y88.683
G1 X48.787 Y87.317 E.05933
G1 X48.254 Y87.317
G1 X46.888 Y88.683 E.05933
G1 X46.355 Y88.683
G1 X47.72 Y87.317 E.05933
G1 X47.187 Y87.317
G1 X45.822 Y88.683 E.05933
G1 X45.289 Y88.683
G1 X46.654 Y87.317 E.05933
G1 X46.12 Y87.317
G1 X44.755 Y88.683 E.05933
G1 X44.222 Y88.683
G1 X45.587 Y87.317 E.05933
G1 X45.054 Y87.317
G1 X43.689 Y88.683 E.05933
G1 X43.155 Y88.683
G1 X44.521 Y87.317 E.05933
G1 X43.987 Y87.317
G1 X42.622 Y88.683 E.05933
G1 X42.089 Y88.683
G1 X43.454 Y87.317 E.05933
G1 X42.921 Y87.317
G1 X41.556 Y88.683 E.05933
G1 X41.022 Y88.683
G1 X42.388 Y87.317 E.05933
G1 X41.854 Y87.317
G1 X40.489 Y88.683 E.05933
G1 X39.956 Y88.683
G1 X41.321 Y87.317 E.05933
G1 X40.788 Y87.317
G1 X39.423 Y88.683 E.05933
G1 X38.889 Y88.683
G1 X40.255 Y87.317 E.05933
G1 X39.721 Y87.317
G1 X38.356 Y88.683 E.05933
G1 X37.823 Y88.683
G1 X39.188 Y87.317 E.05933
G1 X38.655 Y87.317
G1 X37.29 Y88.683 E.05933
G1 X36.756 Y88.683
G1 X38.122 Y87.317 E.05933
G1 X37.588 Y87.317
G1 X36.223 Y88.683 E.05933
G1 X35.69 Y88.683
G1 X37.055 Y87.317 E.05933
G1 X36.522 Y87.317
G1 X35.157 Y88.683 E.05933
G1 X34.623 Y88.683
G1 X35.989 Y87.317 E.05933
G1 X35.455 Y87.317
G1 X34.088 Y88.685 E.05942
G1 X33.524 Y88.715
G1 X34.922 Y87.317 E.06074
G1 X34.389 Y87.317
G1 X32.907 Y88.799 E.06439
G1 X32.216 Y88.957
G1 X33.848 Y87.325 E.07091
G1 X33.271 Y87.369
G1 X31.4 Y89.239 E.08129
G1 X30.29 Y89.816
G1 X32.647 Y87.459 E.10242
; WIPE_START
M204 S6000
G1 X31.233 Y88.873 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.834 Y88.176 Z2.8 F42000
G1 X52.37 Y86.934 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X57.586 Y81.717 E.22669
G1 X57.053 Y81.717
G1 X52.369 Y86.401 E.20353
G1 X52.369 Y85.868
G1 X56.52 Y81.717 E.18037
G1 X55.987 Y81.717
G1 X52.369 Y85.335 E.15721
G1 X52.368 Y84.802
G1 X55.453 Y81.717 E.13405
G1 X54.92 Y81.717
G1 X52.368 Y84.269 E.11089
G1 X52.368 Y83.736
G1 X54.387 Y81.717 E.08773
G1 X53.854 Y81.717
G1 X52.368 Y83.203 E.06457
M73 P92 R2
G1 X52.379 Y82.658
G1 X53.31 Y81.727 E.04046
; WIPE_START
M204 S6000
G1 X52.379 Y82.658 E-.50037
G1 X52.368 Y83.203 E-.20713
G1 X52.465 Y83.106 E-.0525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X57.619 Y88.735 Z2.8 F42000
G1 X91.203 Y125.423 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X89.049 Y127.577 E.09358
G1 X88.443 Y127.65
G1 X90.225 Y125.868 E.07743
G1 X89.457 Y126.103
G1 X87.881 Y127.679 E.0685
G1 X87.344 Y127.683
G1 X88.792 Y126.235 E.06292
G1 X88.193 Y126.3
G1 X86.81 Y127.683 E.0601
G1 X86.277 Y127.683
G1 X87.642 Y126.317 E.05933
G1 X87.109 Y126.317
G1 X85.744 Y127.683 E.05933
G1 X85.211 Y127.683
G1 X86.576 Y126.317 E.05933
G1 X86.043 Y126.317
G1 X84.677 Y127.683 E.05933
G1 X84.144 Y127.683
G1 X85.509 Y126.317 E.05933
G1 X84.976 Y126.317
G1 X83.611 Y127.683 E.05933
G1 X83.078 Y127.683
G1 X84.443 Y126.317 E.05933
G1 X83.91 Y126.317
G1 X82.544 Y127.683 E.05933
G1 X82.011 Y127.683
G1 X83.376 Y126.317 E.05933
G1 X82.843 Y126.317
G1 X81.478 Y127.683 E.05933
G1 X80.945 Y127.683
G1 X82.31 Y126.317 E.05933
G1 X81.777 Y126.317
G1 X80.411 Y127.683 E.05933
G1 X79.878 Y127.683
G1 X81.243 Y126.317 E.05933
G1 X80.71 Y126.317
G1 X79.345 Y127.683 E.05933
G1 X78.812 Y127.683
G1 X80.177 Y126.317 E.05933
G1 X79.643 Y126.317
G1 X78.278 Y127.683 E.05933
G1 X77.745 Y127.683
G1 X79.11 Y126.317 E.05933
G1 X78.577 Y126.317
G1 X77.212 Y127.683 E.05933
G1 X76.678 Y127.683
G1 X78.044 Y126.317 E.05933
G1 X77.51 Y126.317
G1 X76.145 Y127.683 E.05933
G1 X75.612 Y127.683
G1 X76.977 Y126.317 E.05933
G1 X76.444 Y126.317
G1 X75.079 Y127.683 E.05933
M73 P92 R1
G1 X74.545 Y127.683
G1 X75.911 Y126.317 E.05933
G1 X75.377 Y126.317
G1 X74.012 Y127.683 E.05933
G1 X73.479 Y127.683
G1 X74.844 Y126.317 E.05933
G1 X74.311 Y126.317
G1 X72.946 Y127.683 E.05933
G1 X72.412 Y127.683
G1 X73.778 Y126.317 E.05933
G1 X73.244 Y126.317
G1 X71.879 Y127.683 E.05933
G1 X71.346 Y127.683
G1 X72.711 Y126.317 E.05933
G1 X72.178 Y126.317
G1 X70.813 Y127.683 E.05933
G1 X70.279 Y127.683
G1 X71.645 Y126.317 E.05933
G1 X71.111 Y126.317
G1 X69.746 Y127.683 E.05933
G1 X69.213 Y127.683
G1 X70.578 Y126.317 E.05933
G1 X70.045 Y126.317
G1 X68.68 Y127.683 E.05933
G1 X68.146 Y127.683
G1 X69.512 Y126.317 E.05933
G1 X68.978 Y126.317
G1 X67.613 Y127.683 E.05933
G1 X67.08 Y127.683
G1 X68.445 Y126.317 E.05933
G1 X67.912 Y126.317
G1 X66.547 Y127.683 E.05933
G1 X66.013 Y127.683
G1 X67.379 Y126.317 E.05933
G1 X66.845 Y126.317
G1 X65.48 Y127.683 E.05933
G1 X64.947 Y127.683
G1 X66.312 Y126.317 E.05933
G1 X65.779 Y126.317
G1 X64.414 Y127.683 E.05933
G1 X63.88 Y127.683
G1 X65.246 Y126.317 E.05933
G1 X64.712 Y126.317
G1 X63.347 Y127.683 E.05933
G1 X62.814 Y127.683
G1 X64.179 Y126.317 E.05933
G1 X63.646 Y126.317
G1 X62.281 Y127.683 E.05933
G1 X61.747 Y127.683
G1 X63.113 Y126.317 E.05933
G1 X62.579 Y126.317
G1 X61.214 Y127.683 E.05933
G1 X60.681 Y127.683
G1 X62.046 Y126.317 E.05933
G1 X61.513 Y126.317
G1 X60.147 Y127.683 E.05933
G1 X59.614 Y127.683
G1 X60.979 Y126.317 E.05933
G1 X60.446 Y126.317
G1 X59.081 Y127.683 E.05933
G1 X58.548 Y127.683
G1 X59.913 Y126.317 E.05933
G1 X59.38 Y126.317
G1 X58.014 Y127.683 E.05933
G1 X57.481 Y127.683
G1 X58.846 Y126.317 E.05933
G1 X58.313 Y126.317
G1 X56.948 Y127.683 E.05933
G1 X56.415 Y127.683
G1 X57.78 Y126.317 E.05933
G1 X57.247 Y126.317
G1 X55.881 Y127.683 E.05933
G1 X55.348 Y127.683
G1 X56.713 Y126.317 E.05933
G1 X56.18 Y126.317
G1 X54.815 Y127.683 E.05933
G1 X54.282 Y127.683
G1 X55.647 Y126.317 E.05933
G1 X55.114 Y126.317
G1 X53.748 Y127.683 E.05933
G1 X53.215 Y127.683
G1 X54.58 Y126.317 E.05933
G1 X54.047 Y126.317
G1 X52.682 Y127.683 E.05933
G1 X52.149 Y127.683
G1 X53.514 Y126.317 E.05933
G1 X52.981 Y126.317
G1 X51.615 Y127.683 E.05933
G1 X51.082 Y127.683
G1 X52.447 Y126.317 E.05933
G1 X51.914 Y126.317
G1 X50.549 Y127.683 E.05933
G1 X50.016 Y127.683
G1 X51.381 Y126.317 E.05933
G1 X50.848 Y126.317
G1 X49.482 Y127.683 E.05933
G1 X48.949 Y127.683
G1 X50.314 Y126.317 E.05933
G1 X49.781 Y126.317
G1 X48.416 Y127.683 E.05933
G1 X47.883 Y127.683
G1 X49.248 Y126.317 E.05933
G1 X48.715 Y126.317
G1 X47.349 Y127.683 E.05933
G1 X46.816 Y127.683
G1 X48.181 Y126.317 E.05933
G1 X47.648 Y126.317
G1 X46.283 Y127.683 E.05933
G1 X45.75 Y127.683
G1 X47.115 Y126.317 E.05933
G1 X46.582 Y126.317
G1 X45.216 Y127.683 E.05933
G1 X44.683 Y127.683
G1 X46.048 Y126.317 E.05933
G1 X45.515 Y126.317
G1 X44.15 Y127.683 E.05933
G1 X43.617 Y127.683
G1 X44.982 Y126.317 E.05933
G1 X44.448 Y126.317
G1 X43.083 Y127.683 E.05933
G1 X42.55 Y127.683
G1 X43.915 Y126.317 E.05933
G1 X43.382 Y126.317
G1 X42.017 Y127.683 E.05933
G1 X41.483 Y127.683
G1 X42.849 Y126.317 E.05933
G1 X42.315 Y126.317
G1 X40.95 Y127.683 E.05933
G1 X40.417 Y127.683
G1 X41.782 Y126.317 E.05933
G1 X41.249 Y126.317
G1 X39.884 Y127.683 E.05933
G1 X39.35 Y127.683
G1 X40.716 Y126.317 E.05933
G1 X40.182 Y126.317
G1 X38.817 Y127.683 E.05933
G1 X38.284 Y127.683
G1 X39.649 Y126.317 E.05933
G1 X39.116 Y126.317
G1 X37.751 Y127.683 E.05933
G1 X37.217 Y127.683
G1 X38.583 Y126.317 E.05933
G1 X38.049 Y126.317
G1 X36.684 Y127.683 E.05933
G1 X36.151 Y127.683
G1 X37.516 Y126.317 E.05933
G1 X36.983 Y126.317
G1 X35.618 Y127.683 E.05933
G1 X35.084 Y127.683
G1 X36.45 Y126.317 E.05933
G1 X35.916 Y126.317
G1 X34.551 Y127.683 E.05933
G1 X34.021 Y127.679
G1 X35.383 Y126.317 E.05917
G1 X34.85 Y126.317
G1 X33.512 Y127.655 E.05813
G1 X33.032 Y127.602
G1 X34.317 Y126.317 E.05582
G1 X33.796 Y126.305
G1 X32.573 Y127.528 E.05313
G1 X32.135 Y127.433
G1 X33.305 Y126.262 E.05087
G1 X32.844 Y126.19
G1 X31.716 Y127.318 E.04903
G1 X31.314 Y127.187
G1 X32.408 Y126.093 E.04753
G1 X31.992 Y125.976
G1 X30.927 Y127.041 E.0463
G1 X30.555 Y126.88
G1 X31.597 Y125.838 E.04529
G1 X31.22 Y125.682
G1 X30.197 Y126.704 E.04441
G1 X29.853 Y126.514
G1 X30.858 Y125.509 E.04367
G1 X30.515 Y125.32
G1 X29.522 Y126.313 E.04313
G1 X29.203 Y126.098
G1 X30.185 Y125.116 E.04267
G1 X29.87 Y124.898
G1 X28.896 Y125.872 E.04234
G1 X28.6 Y125.634
G1 X29.57 Y124.665 E.04214
G1 X29.283 Y124.418
G1 X28.317 Y125.385 E.04201
G1 X28.045 Y125.123
G1 X29.01 Y124.158 E.04194
G1 X28.752 Y123.883
G1 X27.785 Y124.85 E.04201
G1 X27.537 Y124.565
G1 X28.507 Y123.595 E.04214
G1 X28.275 Y123.294
G1 X27.3 Y124.268 E.04235
G1 X27.076 Y123.96
G1 X28.059 Y122.976 E.04273
G1 X27.857 Y122.645
G1 X26.863 Y123.639 E.04319
G1 X26.662 Y123.307
G1 X27.669 Y122.3 E.04376
G1 X27.499 Y121.936
G1 X26.474 Y122.961 E.04453
G1 X26.3 Y122.602
G1 X27.345 Y121.558 E.04537
G1 X27.21 Y121.159
G1 X26.141 Y122.228 E.04643
G1 X25.997 Y121.839
G1 X27.094 Y120.742 E.04767
G1 X27.001 Y120.302
G1 X25.867 Y121.435 E.04925
G1 X25.755 Y121.015
G1 X26.931 Y119.838 E.05112
G1 X26.892 Y119.344
G1 X25.663 Y120.573 E.0534
G1 X25.59 Y120.112
G1 X26.883 Y118.82 E.05615
G1 X26.883 Y118.287
G1 X25.541 Y119.628 E.05829
G1 X25.52 Y119.117
G1 X26.883 Y117.754 E.05922
G1 X26.883 Y117.22
G1 X25.517 Y118.586 E.05933
G1 X25.517 Y118.052
G1 X26.883 Y116.687 E.05933
G1 X26.883 Y116.154
G1 X25.517 Y117.519 E.05933
G1 X25.517 Y116.986
G1 X26.883 Y115.621 E.05933
G1 X26.883 Y115.087
G1 X25.517 Y116.453 E.05933
G1 X25.517 Y115.919
G1 X26.883 Y114.554 E.05933
G1 X26.883 Y114.021
G1 X25.517 Y115.386 E.05933
G1 X25.517 Y114.853
G1 X26.883 Y113.488 E.05933
G1 X26.883 Y112.954
G1 X25.517 Y114.32 E.05933
G1 X25.517 Y113.786
G1 X26.883 Y112.421 E.05933
G1 X26.883 Y111.888
G1 X25.517 Y113.253 E.05933
G1 X25.517 Y112.72
G1 X26.883 Y111.355 E.05933
G1 X26.883 Y110.821
G1 X25.517 Y112.187 E.05933
G1 X25.517 Y111.653
G1 X26.883 Y110.288 E.05933
G1 X26.883 Y109.755
G1 X25.517 Y111.12 E.05933
G1 X25.517 Y110.587
G1 X26.883 Y109.222 E.05933
G1 X26.883 Y108.688
G1 X25.517 Y110.053 E.05933
G1 X25.517 Y109.52
G1 X26.883 Y108.155 E.05933
G1 X26.883 Y107.622
G1 X25.517 Y108.987 E.05933
G1 X25.517 Y108.454
G1 X26.883 Y107.088 E.05933
G1 X26.883 Y106.555
G1 X25.517 Y107.92 E.05933
G1 X25.517 Y107.387
G1 X26.883 Y106.022 E.05933
G1 X26.883 Y105.489
G1 X25.517 Y106.854 E.05933
G1 X25.517 Y106.321
G1 X26.883 Y104.955 E.05933
G1 X26.883 Y104.422
G1 X25.517 Y105.787 E.05933
G1 X25.517 Y105.254
G1 X26.883 Y103.889 E.05933
G1 X26.883 Y103.356
G1 X25.517 Y104.721 E.05933
G1 X25.517 Y104.188
G1 X26.883 Y102.822 E.05933
G1 X26.883 Y102.289
G1 X25.517 Y103.654 E.05933
G1 X25.517 Y103.121
G1 X26.883 Y101.756 E.05933
G1 X26.883 Y101.223
G1 X25.517 Y102.588 E.05933
G1 X25.517 Y102.055
G1 X26.883 Y100.689 E.05933
G1 X26.883 Y100.156
G1 X25.517 Y101.521 E.05933
G1 X25.517 Y100.988
G1 X26.883 Y99.623 E.05933
G1 X26.883 Y99.09
G1 X25.517 Y100.455 E.05933
G1 X25.517 Y99.922
G1 X26.883 Y98.556 E.05933
G1 X26.883 Y98.023
G1 X25.517 Y99.388 E.05933
G1 X25.517 Y98.855
G1 X26.883 Y97.49 E.05933
G1 X26.883 Y96.957
G1 X25.517 Y98.322 E.05933
G1 X25.517 Y97.789
G1 X26.883 Y96.423 E.05933
G1 X26.885 Y95.888
G1 X25.517 Y97.255 E.05942
G1 X25.517 Y96.722
G1 X26.915 Y95.324 E.06074
G1 X26.999 Y94.707
G1 X25.517 Y96.189 E.06439
G1 X25.525 Y95.648
G1 X27.157 Y94.016 E.07091
G1 X27.439 Y93.2
G1 X25.569 Y95.071 E.08129
G1 X25.659 Y94.447
G1 X28.016 Y92.09 E.10242
; WIPE_START
M204 S6000
G1 X26.602 Y93.505 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X25.813 Y93.76 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X31.96 Y87.613 E.26713
G1 X31.18 Y87.86
G1 X26.06 Y92.98 E.22249
G1 X26.481 Y92.025
G1 X30.225 Y88.281 E.16268
; WIPE_START
M204 S6000
G1 X28.811 Y89.696 E-.76
; WIPE_END
M73 P93 R1
G1 E-.04 F1800
M204 S10000
G1 X35.372 Y93.595 Z2.8 F42000
G1 X91.284 Y126.818 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.190338
G1 F15000
M204 S6000
G1 X91.104 Y126.94 E.00262
; LINE_WIDTH: 0.14576
G1 X90.925 Y127.063 E.00183
; WIPE_START
G1 X91.104 Y126.94 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.63 Y125.703 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.125443
G1 F15000
M204 S6000
G3 X90.29 Y125.933 I-18.277 J-26.649 E.00276
; WIPE_START
G1 X90.63 Y125.703 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.804 Y125.06 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0901941
G1 F15000
M204 S6000
G1 X91.768 Y125.089 E.00018
; LINE_WIDTH: 0.107877
G1 X91.656 Y125.18 E.00076
; LINE_WIDTH: 0.139173
G1 X91.542 Y125.271 E.00115
; LINE_WIDTH: 0.171541
G1 X91.439 Y125.351 E.00136
; LINE_WIDTH: 0.192115
G1 X91.336 Y125.431 E.00158
G1 X91.19 Y125.411 E.00179
; WIPE_START
G1 X91.336 Y125.431 E-.40368
G1 X91.439 Y125.351 E-.35632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.111 Y122.49 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.18126
G1 F15000
M204 S6000
G1 X94.131 Y122.636 E.00166
; LINE_WIDTH: 0.204662
G1 X94.051 Y122.739 E.00171
; LINE_WIDTH: 0.171259
G1 X93.97 Y122.844 E.00138
; LINE_WIDTH: 0.138908
G1 X93.88 Y122.956 E.00113
; LINE_WIDTH: 0.103573
G1 X93.76 Y123.103 E.00094
; WIPE_START
G1 X93.88 Y122.956 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.269 Y123.251 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107861
G1 F15000
M204 S6000
G1 X95.168 Y123.383 E.00088
; LINE_WIDTH: 0.147252
G1 X95.066 Y123.514 E.00141
; LINE_WIDTH: 0.185322
G1 X94.96 Y123.647 E.00198
; LINE_WIDTH: 0.222051
G1 X94.853 Y123.779 E.00249
; LINE_WIDTH: 0.255332
G1 X94.744 Y123.909 E.00293
; LINE_WIDTH: 0.285174
G1 F14860.454
G1 X94.636 Y124.039 E.00334
; LINE_WIDTH: 0.323226
G1 F12843.111
G1 X94.414 Y124.293 E.0077
; LINE_WIDTH: 0.36287
G1 F11251.776
G1 X94.189 Y124.542 E.00876
; LINE_WIDTH: 0.395799
G1 F10201.805
G3 X93.242 Y125.489 I-16.553 J-15.606 E.0385
; LINE_WIDTH: 0.362878
G1 F11251.504
G1 X92.993 Y125.714 E.00876
; LINE_WIDTH: 0.323265
G1 F12841.314
G1 X92.739 Y125.935 E.00769
; LINE_WIDTH: 0.285209
G1 F14858.317
G1 X92.609 Y126.044 E.00334
; LINE_WIDTH: 0.255337
G1 F15000
G1 X92.479 Y126.153 E.00293
; LINE_WIDTH: 0.222045
G1 X92.347 Y126.26 E.00249
; LINE_WIDTH: 0.185313
G1 X92.214 Y126.366 E.00198
; LINE_WIDTH: 0.147258
G1 X92.083 Y126.468 E.00141
; LINE_WIDTH: 0.10786
G1 X91.951 Y126.569 E.00088
; WIPE_START
G1 X92.083 Y126.468 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y120.823 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.133861
G1 F15000
M204 S6000
G1 X94.71 Y121.094 E.00233
; WIPE_START
G1 X94.868 Y120.823 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.064 Y119.695 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.131066
G1 F15000
M204 S6000
G1 X94.984 Y119.477 E.00167
; WIPE_START
G1 X95.064 Y119.695 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.762 Y112.175 Z2.8 F42000
G1 X89.747 Y88.978 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.105138
G1 F15000
M204 S6000
G1 X89.605 Y88.893 E.00084
M204 S10000
G1 X88.89 Y88.784 F42000
; LINE_WIDTH: 0.101701
G1 F15000
M204 S6000
G1 X88.73 Y88.702 E.00086
; WIPE_START
G1 X88.89 Y88.784 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.257 Y88.765 Z2.8 F42000
G1 X33.456 Y88.646 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.138946
G1 F15000
M204 S6000
G1 X33.245 Y88.749 E.00184
; WIPE_START
G1 X33.456 Y88.646 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X32.151 Y88.892 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.115349
G1 F15000
M204 S6000
G1 X31.862 Y89.067 E.002
; WIPE_START
G1 X32.151 Y88.892 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X39.384 Y86.454 Z2.8 F42000
G1 X52.813 Y81.929 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0934219
G1 F15000
M204 S6000
G2 X52.58 Y82.161 I2.434 J2.675 E.00135
; WIPE_START
G1 X52.813 Y81.929 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X45.457 Y83.967 Z2.8 F42000
G1 X30.685 Y88.062 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.108672
G1 F15000
M204 S6000
G1 X30.575 Y88.137 E.00071
; LINE_WIDTH: 0.151249
G1 X30.431 Y88.24 E.00156
; LINE_WIDTH: 0.195401
G1 X30.286 Y88.343 E.0022
M204 S10000
G1 X29.523 Y88.688 F42000
; LINE_WIDTH: 0.104465
G1 F15000
M204 S6000
G1 X29.387 Y88.797 E.00087
; LINE_WIDTH: 0.1358
G1 X29.257 Y88.907 E.00129
; LINE_WIDTH: 0.16591
G1 X29.126 Y89.016 E.00171
; LINE_WIDTH: 0.204239
G1 X28.87 Y89.239 E.00446
; LINE_WIDTH: 0.244117
G1 X28.62 Y89.466 E.00554
; LINE_WIDTH: 0.277274
G2 X27.666 Y90.419 I15.703 J16.656 E.02575
; LINE_WIDTH: 0.244121
G1 X27.439 Y90.67 E.00555
; LINE_WIDTH: 0.204206
G1 X27.216 Y90.926 E.00446
; LINE_WIDTH: 0.16586
G1 X27.107 Y91.057 E.00171
; LINE_WIDTH: 0.135799
G1 X26.997 Y91.187 E.00129
; LINE_WIDTH: 0.104463
G1 X26.888 Y91.323 E.00087
; WIPE_START
G1 X26.997 Y91.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X30.23 Y89.755 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.219981
G1 F15000
M204 S6000
G1 X30.097 Y89.862 E.00246
; LINE_WIDTH: 0.198806
G1 X29.986 Y89.955 E.00183
; LINE_WIDTH: 0.173211
G1 X29.874 Y90.049 E.00155
; LINE_WIDTH: 0.140556
G1 X29.657 Y90.238 E.00229
; LINE_WIDTH: 0.102555
G1 X29.373 Y90.498 E.00187
M204 S10000
G1 X28.698 Y91.173 F42000
; LINE_WIDTH: 0.102628
G1 F15000
M204 S6000
G1 X28.437 Y91.458 E.00188
; LINE_WIDTH: 0.140835
G1 X28.247 Y91.676 E.00231
; LINE_WIDTH: 0.17346
G1 X28.155 Y91.787 E.00153
; LINE_WIDTH: 0.210322
G1 X27.955 Y92.03 E.00429
M204 S10000
G1 X27.641 Y92.759 F42000
; LINE_WIDTH: 0.102854
G1 F15000
M204 S6000
G1 X27.583 Y92.84 E.00049
; LINE_WIDTH: 0.132522
G1 X27.524 Y92.923 E.00074
; LINE_WIDTH: 0.163759
G1 X27.451 Y93.031 E.00128
; LINE_WIDTH: 0.196045
G1 X27.377 Y93.138 E.00162
; WIPE_START
G1 X27.451 Y93.031 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.911 Y95.595 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.136308
G1 F15000
M204 S6000
G1 X26.814 Y95.818 E.00185
; WIPE_START
G1 X26.911 Y95.595 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X28.117 Y103.131 Z2.8 F42000
G1 X31.766 Y125.935 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.092131
G1 F15000
M204 S6000
G1 X31.637 Y125.852 E.00061
; WIPE_START
G1 X31.766 Y125.935 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X32.585 Y126.182 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.104231
G1 F15000
M204 S6000
G1 X32.437 Y126.099 E.00085
; WIPE_START
G1 X32.585 Y126.182 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X40.218 Y126.197 Z2.8 F42000
G1 X89.001 Y126.292 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.110817
G1 F15000
M204 S6000
G1 X88.776 Y126.22 E.00131
; OBJECT_ID: 1
; WIPE_START
G1 X89.001 Y126.292 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X89.283 Y118.665 Z2.8 F42000
G1 X92.371 Y35.098 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X92.695 Y35.528 E.01656
G3 X93.81 Y39.198 I-5.498 J3.675 E.11956
G1 X93.81 Y62.202 E.70685
G3 X87.202 Y68.81 I-6.618 J-.011 E.3188
G1 X33.698 Y68.81 E1.64403
G3 X27.09 Y62.202 I.005 J-6.613 E.31887
G1 X27.09 Y39.198 E.70685
G3 X33.698 Y32.59 I6.613 J.005 E.31887
G1 X87.202 Y32.59 E1.64403
G3 X92.225 Y34.908 I-.005 J6.613 E.17539
G1 X92.334 Y35.05 E.00551
; WIPE_START
M204 S6000
G1 X92.695 Y35.528 E-.22754
G1 X93.089 Y36.199 E-.29565
G1 X93.307 Y36.67 E-.19729
G1 X93.343 Y36.768 E-.03953
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.933 Y34.937 Z2.8 F42000
G1 X69.238 Y30.81 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S5000
G1 X87.198 Y30.81 E.55187
G3 X95.59 Y39.202 I-.002 J8.394 E.40503
G1 X95.59 Y62.198 E.7066
G3 X87.198 Y70.59 I-8.394 J-.002 E.40503
G1 X33.702 Y70.59 E1.64378
G3 X25.31 Y62.198 I.009 J-8.401 E.40494
G1 X25.31 Y39.202 E.7066
G3 X33.702 Y30.81 I8.394 J.002 E.40503
G1 X51.662 Y30.81 E.55187
G1 X51.66 Y26.506 E.13224
G3 X52.956 Y25.21 I1.306 J.01 E.06243
G1 X67.946 Y25.21 E.4606
G3 X69.24 Y26.504 I.001 J1.293 E.06247
G1 X69.238 Y30.75 E.13046
; WIPE_START
M204 S6000
G1 X71.238 Y30.757 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.452 Y37.12 Z2.8 F42000
G1 X94.503 Y65.89 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X90.89 Y69.503 E.15701
G1 X89.956 Y69.903
G1 X94.903 Y64.956 E.21497
G1 X95.135 Y64.191
G1 X89.191 Y70.135 E.25834
; WIPE_START
M204 S6000
G1 X90.605 Y68.721 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.812 Y67.981 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X88.518 Y70.275 E.09968
G1 X87.909 Y70.351
G1 X89.73 Y68.529 E.07915
G1 X88.934 Y68.792
G1 X87.347 Y70.38 E.069
G1 X86.81 Y70.383
G1 X88.258 Y68.935 E.06292
G1 X87.659 Y69.001
G1 X86.277 Y70.383 E.06004
G1 X85.744 Y70.383
G1 X87.109 Y69.017 E.05933
G1 X86.576 Y69.017
G1 X85.211 Y70.383 E.05933
G1 X84.677 Y70.383
G1 X86.043 Y69.017 E.05933
G1 X85.509 Y69.017
G1 X84.144 Y70.383 E.05933
G1 X83.611 Y70.383
G1 X84.976 Y69.017 E.05933
G1 X84.443 Y69.017
G1 X83.078 Y70.383 E.05933
G1 X82.544 Y70.383
G1 X83.91 Y69.017 E.05933
G1 X83.376 Y69.017
G1 X82.011 Y70.383 E.05933
G1 X81.478 Y70.383
G1 X82.843 Y69.017 E.05933
G1 X82.31 Y69.017
G1 X80.945 Y70.383 E.05933
G1 X80.411 Y70.383
G1 X81.777 Y69.017 E.05933
G1 X81.243 Y69.017
G1 X79.878 Y70.383 E.05933
G1 X79.345 Y70.383
G1 X80.71 Y69.017 E.05933
G1 X80.177 Y69.017
G1 X78.812 Y70.383 E.05933
G1 X78.278 Y70.383
G1 X79.643 Y69.017 E.05933
G1 X79.11 Y69.017
G1 X77.745 Y70.383 E.05933
G1 X77.212 Y70.383
G1 X78.577 Y69.017 E.05933
G1 X78.044 Y69.017
G1 X76.678 Y70.383 E.05933
G1 X76.145 Y70.383
G1 X77.51 Y69.017 E.05933
G1 X76.977 Y69.017
G1 X75.612 Y70.383 E.05933
G1 X75.079 Y70.383
G1 X76.444 Y69.017 E.05933
G1 X75.911 Y69.017
G1 X74.545 Y70.383 E.05933
G1 X74.012 Y70.383
G1 X75.377 Y69.017 E.05933
G1 X74.844 Y69.017
G1 X73.479 Y70.383 E.05933
G1 X72.946 Y70.383
G1 X74.311 Y69.017 E.05933
G1 X73.778 Y69.017
G1 X72.412 Y70.383 E.05933
G1 X71.879 Y70.383
G1 X73.244 Y69.017 E.05933
G1 X72.711 Y69.017
G1 X71.346 Y70.383 E.05933
G1 X70.813 Y70.383
G1 X72.178 Y69.017 E.05933
G1 X71.645 Y69.017
G1 X70.279 Y70.383 E.05933
G1 X69.746 Y70.383
G1 X71.111 Y69.017 E.05933
G1 X70.578 Y69.017
G1 X69.213 Y70.383 E.05933
G1 X68.68 Y70.383
G1 X70.045 Y69.017 E.05933
G1 X69.512 Y69.017
G1 X68.146 Y70.383 E.05933
G1 X67.613 Y70.383
G1 X68.978 Y69.017 E.05933
G1 X68.445 Y69.017
G1 X67.08 Y70.383 E.05933
G1 X66.547 Y70.383
G1 X67.912 Y69.017 E.05933
G1 X67.379 Y69.017
G1 X66.013 Y70.383 E.05933
G1 X65.48 Y70.383
G1 X66.845 Y69.017 E.05933
G1 X66.312 Y69.017
G1 X64.947 Y70.383 E.05933
G1 X64.414 Y70.383
G1 X65.779 Y69.017 E.05933
G1 X65.246 Y69.017
G1 X63.88 Y70.383 E.05933
G1 X63.347 Y70.383
G1 X64.712 Y69.017 E.05933
G1 X64.179 Y69.017
G1 X62.814 Y70.383 E.05933
G1 X62.281 Y70.383
G1 X63.646 Y69.017 E.05933
G1 X63.113 Y69.017
G1 X61.747 Y70.383 E.05933
G1 X61.214 Y70.383
G1 X62.579 Y69.017 E.05933
G1 X62.046 Y69.017
G1 X60.681 Y70.383 E.05933
G1 X60.148 Y70.383
G1 X61.513 Y69.017 E.05933
G1 X60.979 Y69.017
G1 X59.614 Y70.383 E.05933
G1 X59.081 Y70.383
G1 X60.446 Y69.017 E.05933
G1 X59.913 Y69.017
G1 X58.548 Y70.383 E.05933
G1 X58.014 Y70.383
G1 X59.38 Y69.017 E.05933
G1 X58.846 Y69.017
G1 X57.481 Y70.383 E.05933
G1 X56.948 Y70.383
G1 X58.313 Y69.017 E.05933
G1 X57.78 Y69.017
G1 X56.415 Y70.383 E.05933
G1 X55.881 Y70.383
G1 X57.247 Y69.017 E.05933
G1 X56.713 Y69.017
G1 X55.348 Y70.383 E.05933
G1 X54.815 Y70.383
G1 X56.18 Y69.017 E.05933
G1 X55.647 Y69.017
G1 X54.282 Y70.383 E.05933
G1 X53.748 Y70.383
G1 X55.114 Y69.017 E.05933
G1 X54.58 Y69.017
G1 X53.215 Y70.383 E.05933
G1 X52.682 Y70.383
G1 X54.047 Y69.017 E.05933
G1 X53.514 Y69.017
G1 X52.149 Y70.383 E.05933
G1 X51.615 Y70.383
G1 X52.981 Y69.017 E.05933
G1 X52.447 Y69.017
G1 X51.082 Y70.383 E.05933
G1 X50.549 Y70.383
G1 X51.914 Y69.017 E.05933
G1 X51.381 Y69.017
G1 X50.016 Y70.383 E.05933
G1 X49.482 Y70.383
G1 X50.848 Y69.017 E.05933
G1 X50.314 Y69.017
G1 X48.949 Y70.383 E.05933
G1 X48.416 Y70.383
G1 X49.781 Y69.017 E.05933
G1 X49.248 Y69.017
G1 X47.883 Y70.383 E.05933
G1 X47.349 Y70.383
G1 X48.715 Y69.017 E.05933
G1 X48.181 Y69.017
G1 X46.816 Y70.383 E.05933
G1 X46.283 Y70.383
G1 X47.648 Y69.017 E.05933
G1 X47.115 Y69.017
G1 X45.75 Y70.383 E.05933
G1 X45.216 Y70.383
G1 X46.582 Y69.017 E.05933
G1 X46.048 Y69.017
G1 X44.683 Y70.383 E.05933
G1 X44.15 Y70.383
G1 X45.515 Y69.017 E.05933
G1 X44.982 Y69.017
G1 X43.617 Y70.383 E.05933
G1 X43.083 Y70.383
G1 X44.448 Y69.017 E.05933
G1 X43.915 Y69.017
G1 X42.55 Y70.383 E.05933
G1 X42.017 Y70.383
G1 X43.382 Y69.017 E.05933
G1 X42.849 Y69.017
G1 X41.483 Y70.383 E.05933
G1 X40.95 Y70.383
G1 X42.315 Y69.017 E.05933
G1 X41.782 Y69.017
G1 X40.417 Y70.383 E.05933
G1 X39.884 Y70.383
G1 X41.249 Y69.017 E.05933
G1 X40.716 Y69.017
G1 X39.35 Y70.383 E.05933
G1 X38.817 Y70.383
G1 X40.182 Y69.017 E.05933
G1 X39.649 Y69.017
G1 X38.284 Y70.383 E.05933
G1 X37.751 Y70.383
G1 X39.116 Y69.017 E.05933
G1 X38.583 Y69.017
G1 X37.217 Y70.383 E.05933
G1 X36.684 Y70.383
G1 X38.049 Y69.017 E.05933
G1 X37.516 Y69.017
G1 X36.151 Y70.383 E.05933
G1 X35.618 Y70.383
G1 X36.983 Y69.017 E.05933
G1 X36.45 Y69.017
M73 P94 R1
G1 X35.084 Y70.383 E.05933
G1 X34.551 Y70.383
G1 X35.916 Y69.017 E.05933
G1 X35.383 Y69.017
G1 X34.018 Y70.383 E.05933
G1 X33.489 Y70.378
G1 X34.85 Y69.017 E.05914
G1 X34.317 Y69.017
G1 X32.984 Y70.35 E.05791
G1 X32.507 Y70.294
G1 X33.783 Y69.017 E.05547
G1 X33.265 Y69.002
G1 X32.053 Y70.214 E.05266
G1 X31.622 Y70.113
G1 X32.78 Y68.954 E.05035
G1 X32.324 Y68.876
G1 X31.208 Y69.993 E.04852
G1 X30.813 Y69.855
G1 X31.894 Y68.773 E.04701
G1 X31.487 Y68.647
G1 X30.434 Y69.701 E.04578
G1 X30.07 Y69.532
G1 X31.099 Y68.502 E.04475
G1 X30.732 Y68.336
G1 X29.719 Y69.349 E.044
G1 X29.384 Y69.151
G1 X30.38 Y68.154 E.0433
G1 X30.047 Y67.955
G1 X29.062 Y68.939 E.0428
G1 X28.753 Y68.716
G1 X29.728 Y67.74 E.04239
G1 X29.425 Y67.51
G1 X28.456 Y68.479 E.04214
G1 X28.171 Y68.231
G1 X29.137 Y67.264 E.04201
G1 X28.864 Y67.005
G1 X27.899 Y67.97 E.04194
G1 X27.639 Y67.696
G1 X28.606 Y66.729 E.04201
G1 X28.362 Y66.44
G1 X27.392 Y67.41 E.04214
G1 X27.157 Y67.111
G1 X28.134 Y66.135 E.04244
G1 X27.921 Y65.815
G1 X26.935 Y66.801 E.04285
G1 X26.725 Y66.477
G1 X27.724 Y65.478 E.04341
G1 X27.543 Y65.125
G1 X26.529 Y66.139 E.04406
G1 X26.348 Y65.788
G1 X27.38 Y64.755 E.04488
G1 X27.237 Y64.366
G1 X26.18 Y65.422 E.04591
G1 X26.027 Y65.042
G1 X27.114 Y63.955 E.04722
G1 X27.012 Y63.523
G1 X25.892 Y64.644 E.04868
G1 X25.774 Y64.228
G1 X26.938 Y63.064 E.05059
G1 X26.894 Y62.575
G1 X25.674 Y63.795 E.053
G1 X25.599 Y63.338
G1 X26.883 Y62.053 E.0558
G1 X26.883 Y61.52
G1 X25.544 Y62.858 E.05816
G1 X25.52 Y62.349
G1 X26.883 Y60.987 E.0592
G1 X26.883 Y60.454
G1 X25.517 Y61.819 E.05933
G1 X25.517 Y61.286
G1 X26.883 Y59.92 E.05933
G1 X26.883 Y59.387
G1 X25.517 Y60.752 E.05933
G1 X25.517 Y60.219
G1 X26.883 Y58.854 E.05933
G1 X26.883 Y58.321
G1 X25.517 Y59.686 E.05933
G1 X25.517 Y59.153
G1 X26.883 Y57.787 E.05933
G1 X26.883 Y57.254
G1 X25.517 Y58.619 E.05933
G1 X25.517 Y58.086
G1 X26.883 Y56.721 E.05933
G1 X26.883 Y56.188
G1 X25.517 Y57.553 E.05933
G1 X25.517 Y57.02
G1 X26.883 Y55.654 E.05933
G1 X26.883 Y55.121
G1 X25.517 Y56.486 E.05933
G1 X25.517 Y55.953
G1 X26.883 Y54.588 E.05933
G1 X26.883 Y54.055
G1 X25.517 Y55.42 E.05933
G1 X25.517 Y54.887
G1 X26.883 Y53.521 E.05933
G1 X26.883 Y52.988
G1 X25.517 Y54.353 E.05933
G1 X25.517 Y53.82
G1 X26.883 Y52.455 E.05933
G1 X26.883 Y51.922
G1 X25.517 Y53.287 E.05933
G1 X25.517 Y52.754
G1 X26.883 Y51.388 E.05933
G1 X26.883 Y50.855
G1 X25.517 Y52.22 E.05933
G1 X25.517 Y51.687
G1 X26.883 Y50.322 E.05933
G1 X26.883 Y49.789
G1 X25.517 Y51.154 E.05933
G1 X25.517 Y50.62
G1 X26.883 Y49.255 E.05933
G1 X26.883 Y48.722
G1 X25.517 Y50.087 E.05933
G1 X25.517 Y49.554
G1 X26.883 Y48.189 E.05933
G1 X26.883 Y47.655
G1 X25.517 Y49.021 E.05933
G1 X25.517 Y48.487
G1 X26.883 Y47.122 E.05933
G1 X26.883 Y46.589
G1 X25.517 Y47.954 E.05933
G1 X25.517 Y47.421
G1 X26.883 Y46.056 E.05933
G1 X26.883 Y45.522
G1 X25.517 Y46.888 E.05933
G1 X25.517 Y46.354
G1 X26.883 Y44.989 E.05933
G1 X26.883 Y44.456
G1 X25.517 Y45.821 E.05933
G1 X25.517 Y45.288
G1 X26.883 Y43.923 E.05933
G1 X26.883 Y43.389
G1 X25.517 Y44.755 E.05933
G1 X25.517 Y44.221
G1 X26.883 Y42.856 E.05933
G1 X26.883 Y42.323
G1 X25.517 Y43.688 E.05933
G1 X25.517 Y43.155
G1 X26.883 Y41.79 E.05933
G1 X26.883 Y41.256
G1 X25.517 Y42.622 E.05933
G1 X25.517 Y42.088
G1 X26.883 Y40.723 E.05933
G1 X26.883 Y40.19
G1 X25.517 Y41.555 E.05933
G1 X25.517 Y41.022
G1 X26.883 Y39.657 E.05933
G1 X26.884 Y39.122
G1 X25.517 Y40.489 E.05939
G1 X25.517 Y39.955
G1 X26.914 Y38.559 E.06069
G1 X27.001 Y37.938
G1 X25.517 Y39.422 E.06449
G1 X25.524 Y38.882
G1 X27.174 Y37.232 E.07172
G1 X27.494 Y36.378
G1 X25.568 Y38.305 E.08373
G1 X25.661 Y37.678
G1 X28.302 Y35.038 E.11475
; WIPE_START
M204 S6000
G1 X26.888 Y36.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.863 Y39.55 Z2.8 F42000
G1 X92.981 Y65.812 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X95.275 Y63.518 E.09968
G1 X95.351 Y62.909
G1 X93.529 Y64.73 E.07915
G1 X93.792 Y63.934
G1 X95.38 Y62.347 E.069
G1 X95.383 Y61.81
G1 X93.935 Y63.258 E.06292
G1 X94.001 Y62.659
G1 X95.383 Y61.277 E.06004
G1 X95.383 Y60.744
G1 X94.017 Y62.109 E.05933
G1 X94.017 Y61.576
G1 X95.383 Y60.211 E.05933
G1 X95.383 Y59.677
G1 X94.017 Y61.043 E.05933
G1 X94.017 Y60.509
G1 X95.383 Y59.144 E.05933
G1 X95.383 Y58.611
G1 X94.017 Y59.976 E.05933
G1 X94.017 Y59.443
G1 X95.383 Y58.078 E.05933
G1 X95.383 Y57.544
G1 X94.017 Y58.91 E.05933
G1 X94.017 Y58.376
G1 X95.383 Y57.011 E.05933
G1 X95.383 Y56.478
G1 X94.017 Y57.843 E.05933
G1 X94.017 Y57.31
G1 X95.383 Y55.945 E.05933
G1 X95.383 Y55.411
G1 X94.017 Y56.777 E.05933
G1 X94.017 Y56.243
G1 X95.383 Y54.878 E.05933
G1 X95.383 Y54.345
G1 X94.017 Y55.71 E.05933
G1 X94.017 Y55.177
G1 X95.383 Y53.812 E.05933
G1 X95.383 Y53.278
G1 X94.017 Y54.643 E.05933
G1 X94.017 Y54.11
G1 X95.383 Y52.745 E.05933
G1 X95.383 Y52.212
G1 X94.017 Y53.577 E.05933
G1 X94.017 Y53.044
G1 X95.383 Y51.679 E.05933
G1 X95.383 Y51.145
G1 X94.017 Y52.51 E.05933
G1 X94.017 Y51.977
G1 X95.383 Y50.612 E.05933
G1 X95.383 Y50.079
G1 X94.017 Y51.444 E.05933
G1 X94.017 Y50.911
G1 X95.383 Y49.545 E.05933
G1 X95.383 Y49.012
G1 X94.017 Y50.377 E.05933
G1 X94.017 Y49.844
G1 X95.383 Y48.479 E.05933
G1 X95.383 Y47.946
G1 X94.017 Y49.311 E.05933
G1 X94.017 Y48.778
G1 X95.383 Y47.412 E.05933
G1 X95.383 Y46.879
G1 X94.017 Y48.244 E.05933
G1 X94.017 Y47.711
G1 X95.383 Y46.346 E.05933
G1 X95.383 Y45.813
G1 X94.017 Y47.178 E.05933
G1 X94.017 Y46.645
G1 X95.383 Y45.279 E.05933
G1 X95.383 Y44.746
G1 X94.017 Y46.111 E.05933
G1 X94.017 Y45.578
G1 X95.383 Y44.213 E.05933
G1 X95.383 Y43.68
G1 X94.017 Y45.045 E.05933
G1 X94.017 Y44.512
G1 X95.383 Y43.146 E.05933
G1 X95.383 Y42.613
G1 X94.017 Y43.978 E.05933
G1 X94.017 Y43.445
G1 X95.383 Y42.08 E.05933
G1 X95.383 Y41.547
G1 X94.017 Y42.912 E.05933
G1 X94.017 Y42.379
G1 X95.383 Y41.013 E.05933
G1 X95.383 Y40.48
G1 X94.017 Y41.845 E.05933
G1 X94.017 Y41.312
G1 X95.383 Y39.947 E.05933
G1 X95.383 Y39.414
G1 X94.017 Y40.779 E.05933
G1 X94.017 Y40.246
G1 X95.376 Y38.887 E.05905
G1 X95.341 Y38.389
G1 X94.017 Y39.712 E.0575
G1 X94.017 Y39.179
G1 X95.281 Y37.915 E.05492
G1 X95.195 Y37.468
G1 X93.997 Y38.667 E.0521
G1 X93.941 Y38.189
G1 X95.091 Y37.039 E.04996
G1 X94.967 Y36.629
G1 X93.858 Y37.739 E.04822
G1 X93.75 Y37.313
G1 X94.826 Y36.238 E.04673
G1 X94.669 Y35.861
G1 X93.62 Y36.91 E.04557
G1 X93.47 Y36.527
G1 X94.498 Y35.499 E.04464
G1 X94.311 Y35.153
G1 X93.302 Y36.162 E.04383
G1 X93.116 Y35.814
G1 X94.11 Y34.82 E.04319
G1 X93.897 Y34.501
G1 X92.914 Y35.483 E.0427
G1 X92.696 Y35.168
G1 X93.671 Y34.193 E.04234
G1 X93.432 Y33.898
G1 X92.463 Y34.868 E.04214
G1 X92.215 Y34.582
G1 X93.181 Y33.617 E.04196
G1 X92.917 Y33.347
G1 X91.951 Y34.313 E.04194
G1 X91.674 Y34.057
G1 X92.641 Y33.09 E.04201
G1 X92.352 Y32.845
G1 X91.381 Y33.816 E.0422
G1 X91.073 Y33.591
G1 X92.052 Y32.612 E.04254
G1 X91.739 Y32.392
G1 X90.751 Y33.38 E.04295
G1 X90.41 Y33.187
G1 X91.412 Y32.186 E.04351
G1 X91.071 Y31.993
G1 X90.055 Y33.009 E.04416
G1 X89.68 Y32.851
G1 X90.718 Y31.814 E.04508
G1 X90.35 Y31.648
G1 X89.288 Y32.71 E.04615
G1 X88.873 Y32.592
G1 X89.965 Y31.5 E.04746
G1 X89.564 Y31.368
G1 X88.435 Y32.497 E.04905
G1 X87.971 Y32.427
G1 X89.145 Y31.253 E.05102
G1 X88.706 Y31.159
G1 X87.477 Y32.388 E.05344
G1 X86.949 Y32.383
G1 X88.246 Y31.086 E.05635
G1 X87.761 Y31.038
G1 X86.416 Y32.383 E.05844
G1 X85.883 Y32.383
G1 X87.247 Y31.018 E.05928
G1 X86.715 Y31.017
G1 X85.349 Y32.383 E.05933
G1 X84.816 Y32.383
G1 X86.181 Y31.017 E.05933
G1 X85.648 Y31.017
G1 X84.283 Y32.383 E.05933
G1 X83.75 Y32.383
G1 X85.115 Y31.017 E.05933
G1 X84.582 Y31.017
G1 X83.216 Y32.383 E.05933
G1 X82.683 Y32.383
G1 X84.048 Y31.017 E.05933
G1 X83.515 Y31.017
G1 X82.15 Y32.383 E.05933
G1 X81.617 Y32.383
G1 X82.982 Y31.017 E.05933
G1 X82.449 Y31.017
G1 X81.083 Y32.383 E.05933
G1 X80.55 Y32.383
G1 X81.915 Y31.017 E.05933
G1 X81.382 Y31.017
G1 X80.017 Y32.383 E.05933
G1 X79.484 Y32.383
G1 X80.849 Y31.017 E.05933
G1 X80.315 Y31.017
G1 X78.95 Y32.383 E.05933
G1 X78.417 Y32.383
G1 X79.782 Y31.017 E.05933
G1 X79.249 Y31.017
G1 X77.884 Y32.383 E.05933
G1 X77.35 Y32.383
G1 X78.716 Y31.017 E.05933
G1 X78.182 Y31.017
G1 X76.817 Y32.383 E.05933
G1 X76.284 Y32.383
G1 X77.649 Y31.017 E.05933
G1 X77.116 Y31.017
G1 X75.751 Y32.383 E.05933
G1 X75.217 Y32.383
G1 X76.583 Y31.017 E.05933
G1 X76.049 Y31.017
G1 X74.684 Y32.383 E.05933
G1 X74.151 Y32.383
G1 X75.516 Y31.017 E.05933
G1 X74.983 Y31.017
G1 X73.618 Y32.383 E.05933
G1 X73.084 Y32.383
G1 X74.45 Y31.017 E.05933
G1 X73.916 Y31.017
G1 X72.551 Y32.383 E.05933
G1 X72.018 Y32.383
G1 X73.383 Y31.017 E.05933
G1 X72.85 Y31.017
G1 X71.485 Y32.383 E.05933
G1 X70.951 Y32.383
G1 X72.317 Y31.017 E.05933
G1 X71.783 Y31.017
G1 X70.418 Y32.383 E.05933
G1 X69.885 Y32.383
G1 X71.25 Y31.017 E.05933
G1 X70.717 Y31.017
G1 X69.352 Y32.383 E.05933
G1 X68.818 Y32.383
G1 X70.184 Y31.017 E.05933
G1 X69.65 Y31.017
G1 X68.285 Y32.383 E.05933
G1 X67.752 Y32.383
G1 X69.117 Y31.017 E.05933
G1 X69.03 Y30.571
G1 X67.219 Y32.383 E.07873
G1 X66.685 Y32.383
G1 X69.031 Y30.037 E.10192
G1 X69.031 Y29.504
G1 X66.152 Y32.383 E.1251
G1 X65.619 Y32.383
G1 X69.031 Y28.97 E.14829
M73 P95 R1
G1 X69.032 Y28.437
G1 X65.086 Y32.383 E.17147
G1 X64.552 Y32.383
G1 X69.032 Y27.903 E.19466
G1 X69.032 Y27.37
G1 X64.019 Y32.383 E.21784
G1 X63.486 Y32.383
G1 X69.032 Y26.836 E.24103
G1 X69.016 Y26.319
G1 X62.953 Y32.383 E.26348
G1 X62.419 Y32.383
G1 X68.87 Y25.932 E.28032
G1 X68.619 Y25.649
G1 X61.886 Y32.383 E.29259
G1 X61.353 Y32.383
G1 X68.269 Y25.466 E.30054
G1 X67.785 Y25.417
G1 X60.819 Y32.383 E.30267
G1 X60.286 Y32.383
G1 X67.251 Y25.417 E.30267
G1 X66.718 Y25.417
G1 X59.753 Y32.383 E.30267
G1 X59.22 Y32.383
G1 X66.185 Y25.417 E.30267
G1 X65.652 Y25.417
G1 X58.686 Y32.383 E.30267
G1 X58.153 Y32.383
G1 X65.118 Y25.417 E.30267
G1 X64.585 Y25.417
G1 X57.62 Y32.383 E.30267
G1 X57.087 Y32.383
G1 X64.052 Y25.417 E.30267
G1 X63.519 Y25.417
G1 X56.553 Y32.383 E.30267
G1 X56.02 Y32.383
G1 X62.985 Y25.417 E.30267
G1 X62.452 Y25.417
G1 X55.487 Y32.383 E.30267
G1 X54.954 Y32.383
G1 X61.919 Y25.417 E.30267
G1 X61.386 Y25.417
G1 X54.42 Y32.383 E.30267
G1 X53.887 Y32.383
G1 X60.852 Y25.417 E.30267
G1 X60.319 Y25.417
G1 X53.354 Y32.383 E.30267
G1 X52.821 Y32.383
G1 X59.786 Y25.417 E.30267
G1 X59.253 Y25.417
G1 X52.287 Y32.383 E.30267
G1 X51.754 Y32.383
G1 X58.719 Y25.417 E.30267
G1 X58.186 Y25.417
G1 X51.221 Y32.383 E.30267
G1 X50.688 Y32.383
G1 X57.653 Y25.417 E.30267
G1 X57.12 Y25.417
G1 X51.87 Y30.667 E.22813
G1 X51.869 Y30.134
G1 X56.586 Y25.417 E.20497
G1 X56.053 Y25.417
G1 X51.869 Y29.601 E.18181
G1 X51.869 Y29.068
G1 X55.52 Y25.417 E.15865
G1 X54.987 Y25.417
G1 X51.868 Y28.535 E.13549
G1 X51.868 Y28.002
G1 X54.453 Y25.417 E.11233
G1 X53.92 Y25.417
G1 X51.868 Y27.469 E.08917
G1 X51.868 Y26.937
G1 X53.387 Y25.417 E.06601
G1 X52.847 Y25.424
G1 X51.874 Y26.397 E.04226
; WIPE_START
M204 S6000
G1 X52.847 Y25.424 E-.52261
G1 X53.387 Y25.417 E-.20525
G1 X53.327 Y25.477 E-.03214
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X51.52 Y31.017 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X50.154 Y32.383 E.05933
G1 X49.621 Y32.383
G1 X50.986 Y31.017 E.05933
G1 X50.453 Y31.017
G1 X49.088 Y32.383 E.05933
G1 X48.555 Y32.383
G1 X49.92 Y31.017 E.05933
G1 X49.387 Y31.017
G1 X48.021 Y32.383 E.05933
G1 X47.488 Y32.383
G1 X48.853 Y31.017 E.05933
G1 X48.32 Y31.017
G1 X46.955 Y32.383 E.05933
G1 X46.422 Y32.383
G1 X47.787 Y31.017 E.05933
G1 X47.254 Y31.017
G1 X45.888 Y32.383 E.05933
G1 X45.355 Y32.383
G1 X46.72 Y31.017 E.05933
G1 X46.187 Y31.017
G1 X44.822 Y32.383 E.05933
G1 X44.289 Y32.383
G1 X45.654 Y31.017 E.05933
G1 X45.12 Y31.017
G1 X43.755 Y32.383 E.05933
G1 X43.222 Y32.383
G1 X44.587 Y31.017 E.05933
G1 X44.054 Y31.017
G1 X42.689 Y32.383 E.05933
G1 X42.155 Y32.383
G1 X43.521 Y31.017 E.05933
G1 X42.987 Y31.017
G1 X41.622 Y32.383 E.05933
G1 X41.089 Y32.383
G1 X42.454 Y31.017 E.05933
G1 X41.921 Y31.017
G1 X40.556 Y32.383 E.05933
G1 X40.022 Y32.383
G1 X41.388 Y31.017 E.05933
G1 X40.854 Y31.017
G1 X39.489 Y32.383 E.05933
G1 X38.956 Y32.383
G1 X40.321 Y31.017 E.05933
G1 X39.788 Y31.017
G1 X38.423 Y32.383 E.05933
G1 X37.889 Y32.383
G1 X39.255 Y31.017 E.05933
G1 X38.721 Y31.017
G1 X37.356 Y32.383 E.05933
G1 X36.823 Y32.383
G1 X38.188 Y31.017 E.05933
G1 X37.655 Y31.017
G1 X36.29 Y32.383 E.05933
G1 X35.756 Y32.383
G1 X37.122 Y31.017 E.05933
G1 X36.588 Y31.017
G1 X35.223 Y32.383 E.05933
G1 X34.69 Y32.383
G1 X36.055 Y31.017 E.05933
G1 X35.522 Y31.017
G1 X34.157 Y32.383 E.05933
G1 X33.622 Y32.384
G1 X34.989 Y31.017 E.05939
G1 X34.455 Y31.017
G1 X33.059 Y32.414 E.06069
G1 X32.438 Y32.501
G1 X33.922 Y31.017 E.06449
G1 X33.382 Y31.024
G1 X31.732 Y32.674 E.07172
G1 X30.878 Y32.994
G1 X32.805 Y31.068 E.08373
G1 X32.178 Y31.161
G1 X29.538 Y33.802 E.11474
; WIPE_START
M204 S6000
G1 X30.952 Y32.388 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X31.483 Y31.324 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X25.824 Y36.983 E.24592
G1 X26.099 Y36.174
G1 X30.674 Y31.599 E.19881
G1 X29.647 Y32.093
G1 X26.593 Y35.147 E.13271
; WIPE_START
M204 S6000
G1 X28.007 Y33.733 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X34.676 Y37.446 Z2.8 F42000
G1 X90.159 Y68.341 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104148
G1 F15000
M204 S6000
G1 X90.062 Y68.41 E.00059
; LINE_WIDTH: 0.142513
G1 X89.963 Y68.477 E.00097
; LINE_WIDTH: 0.178257
G1 X89.863 Y68.545 E.00132
G1 X89.717 Y68.516 E.00164
; WIPE_START
G1 X89.863 Y68.545 E-.42081
G1 X89.963 Y68.477 E-.33919
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.739 Y67.289 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.102742
G1 F15000
M204 S6000
G1 X91.433 Y67.571 E.00203
; LINE_WIDTH: 0.140443
G1 X91.23 Y67.748 E.00214
; LINE_WIDTH: 0.182956
G1 X91.021 Y67.922 E.0031
; LINE_WIDTH: 0.217559
G1 X90.872 Y68.042 E.00272
; WIPE_START
G1 X91.021 Y67.922 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.109 Y66.579 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107059
G1 F15000
M204 S6000
G1 X93.985 Y66.733 E.00103
; LINE_WIDTH: 0.140129
G1 X93.882 Y66.857 E.00127
; LINE_WIDTH: 0.168501
G1 X93.778 Y66.98 E.00165
; LINE_WIDTH: 0.204599
G1 X93.569 Y67.22 E.00421
; LINE_WIDTH: 0.254641
G3 X93.137 Y67.688 I-12.148 J-10.796 E.01098
; LINE_WIDTH: 0.275465
G3 X92.457 Y68.355 I-13.068 J-12.647 E.01805
; LINE_WIDTH: 0.24214
G1 X92.22 Y68.569 E.00518
; LINE_WIDTH: 0.204583
G1 X91.98 Y68.778 E.0042
; LINE_WIDTH: 0.168507
G1 X91.857 Y68.882 E.00165
; LINE_WIDTH: 0.140125
G1 X91.733 Y68.985 E.00127
; LINE_WIDTH: 0.107052
G1 X91.579 Y69.109 E.00103
; WIPE_START
G1 X91.733 Y68.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.042 Y65.872 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.217377
G1 F15000
M204 S6000
G1 X92.92 Y66.024 E.00276
; LINE_WIDTH: 0.182519
G1 X92.746 Y66.231 E.00307
; LINE_WIDTH: 0.14022
G1 X92.569 Y66.434 E.00214
; LINE_WIDTH: 0.102665
G1 X92.289 Y66.739 E.00202
; WIPE_START
G1 X92.569 Y66.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.516 Y64.717 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.171077
G1 F15000
M204 S6000
G1 X93.545 Y64.863 E.00156
; LINE_WIDTH: 0.187075
G1 X93.477 Y64.963 E.00141
; LINE_WIDTH: 0.14228
G1 X93.409 Y65.063 E.00098
; LINE_WIDTH: 0.103971
G1 X93.34 Y65.159 E.00059
; WIPE_START
G1 X93.409 Y65.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.713 Y65.439 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.105219
G1 F15000
M204 S6000
G1 X94.655 Y65.524 E.00052
; LINE_WIDTH: 0.139333
G1 X94.597 Y65.61 E.00081
; LINE_WIDTH: 0.171339
G1 X94.519 Y65.719 E.0014
; LINE_WIDTH: 0.20126
G1 X94.441 Y65.828 E.00173
; WIPE_START
G1 X94.519 Y65.719 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.789 Y62.119 Z2.8 F42000
G1 X32.453 Y32.516 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.129461
G1 F15000
M204 S6000
G1 X32.226 Y32.447 E.00168
; WIPE_START
G1 X32.453 Y32.516 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.551 Y32.313 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.124891
G1 F15000
M204 S6000
G1 X33.329 Y32.411 E.00162
; WIPE_START
G1 X33.551 Y32.313 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X41.184 Y32.351 Z2.8 F42000
G1 X88.844 Y32.587 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.10305
G1 F15000
M204 S6000
G2 X88.695 Y32.504 I-2.269 J3.9 E.00084
; WIPE_START
G1 X88.844 Y32.587 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.136 Y31.596 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0908461
G1 F15000
M204 S6000
G1 X90.001 Y31.511 E.00062
; WIPE_START
G1 X90.136 Y31.596 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.599 Y30.39 Z2.8 F42000
G1 X52.415 Y25.561 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.108785
G1 F15000
M204 S6000
G2 X52.014 Y25.962 I1.518 J1.921 E.00305
; WIPE_START
G1 X52.196 Y25.753 E-.37079
G1 X52.415 Y25.561 E-.38921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X45.192 Y28.026 Z2.8 F42000
G1 X30.816 Y32.932 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.199101
G1 F15000
M204 S6000
G1 X30.703 Y33.013 E.00177
; LINE_WIDTH: 0.1671
G1 X30.588 Y33.095 E.00143
; LINE_WIDTH: 0.135145
G1 X30.493 Y33.165 E.00089
; LINE_WIDTH: 0.103831
G1 X30.398 Y33.236 E.00059
; WIPE_START
G1 X30.493 Y33.165 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X29.55 Y33.814 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.176857
G1 F15000
M204 S6000
G1 X29.448 Y33.808 E.00112
; LINE_WIDTH: 0.193722
G1 X29.426 Y33.807 E.00027
; LINE_WIDTH: 0.208647
G1 X29.405 Y33.806 E.00029
G1 X29.031 Y34.152 E.00687
G1 X28.306 Y34.904 E.01411
; LINE_WIDTH: 0.222835
G1 X28.307 Y34.926 E.00032
; LINE_WIDTH: 0.17987
G1 X28.314 Y35.05 E.00139
; WIPE_START
G1 X28.307 Y34.926 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X28.767 Y32.677 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0979109
G1 F15000
M204 S6000
G1 X28.643 Y32.785 E.00074
; LINE_WIDTH: 0.123401
G1 X28.405 Y33 E.0021
; LINE_WIDTH: 0.154848
G2 X27.5 Y33.905 I14.889 J15.794 E.01167
; LINE_WIDTH: 0.123388
G1 X27.285 Y34.143 E.0021
; LINE_WIDTH: 0.097902
G1 X27.177 Y34.267 E.00074
; WIPE_START
G1 X27.285 Y34.143 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.653 Y35.207 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.202401
G1 F15000
M204 S6000
G1 X26.545 Y35.353 E.00236
; LINE_WIDTH: 0.162406
G1 X26.437 Y35.499 E.00177
; LINE_WIDTH: 0.128862
G1 X26.383 Y35.575 E.00065
; LINE_WIDTH: 0.101738
G1 X26.329 Y35.651 E.00045
; WIPE_START
G1 X26.383 Y35.575 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X27.736 Y35.898 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.103831
G1 F15000
M204 S6000
G1 X27.665 Y35.993 E.00059
; LINE_WIDTH: 0.135455
G1 X27.594 Y36.09 E.00091
; LINE_WIDTH: 0.167377
G1 X27.513 Y36.203 E.00141
; LINE_WIDTH: 0.199108
G1 X27.432 Y36.316 E.00177
; WIPE_START
G1 X27.513 Y36.203 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.947 Y37.726 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.129246
G1 F15000
M204 S6000
G1 X27.016 Y37.953 E.00167
; WIPE_START
G1 X26.947 Y37.726 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X27.106 Y45.357 Z2.8 F42000
G1 X27.518 Y65.074 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.104142
G1 F15000
M204 S6000
G1 X27.462 Y64.992 E.00049
G1 X27.464 Y64.939 E.00027
M204 S10000
G1 X27.226 Y64.33 F42000
; LINE_WIDTH: 0.0894683
G1 F15000
M204 S6000
G1 X27.142 Y64.193 E.00061
; WIPE_START
G1 X27.226 Y64.33 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X27.132 Y56.698 Z2.8 F42000
G1 X26.912 Y38.828 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.124878
G1 F15000
M204 S6000
G1 X26.813 Y39.051 E.00163
; WIPE_START
G1 X26.912 Y38.828 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.64 Y46.455 Z2.8 F42000
G1 X25.985 Y64.817 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0964477
G1 F15000
M204 S6000
G1 X25.9 Y64.676 E.00072
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X25.985 Y64.817 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1
M625
; layer num/total_layer_count: 13/15
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S201.45
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
M204 S10000
G17
G3 Z2.8 I-.176 J1.204 P1  F42000
G1 X222.087 Y93.539 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F5495
M204 S5000
G3 X221.905 Y94.587 I-.264 J.494 E.03839
G3 X220.773 Y94.599 I-.701 J-13.038 E.03096
G1 X220.773 Y93.457 E.03123
G3 X221.875 Y93.475 I.346 J12.465 E.03014
G3 X222.033 Y93.514 I-.051 J.558 E.00447
M204 S250
G1 X221.537 Y93.327 F42000
G1 F5495
M204 S5000
G1 X222.167 Y93.463 E.01761
G3 X222.523 Y94.447 I-.178 J.621 E.03335
G3 X221.944 Y94.717 I-.543 J-.41 E.01816
G3 X220.544 Y94.729 I-.858 J-18.724 E.03829
G1 X220.544 Y92.101 E.07186
G1 X220.773 Y92.101 E.00625
G1 X220.773 Y93.359 E.0344
G2 X221.454 Y93.312 I.189 J-2.218 E.01873
G2 X221.904 Y92.885 I-.414 J-.889 E.01727
G1 X222.433 Y92.101 E.02587
G1 X222.716 Y92.101 E.00775
G3 X222.144 Y92.919 I-3.451 J-1.808 E.02738
G1 X221.587 Y93.293 E.01834
; WIPE_START
G1 F10727.314
M204 S6000
G1 X222.167 Y93.463 E-.22954
G1 X222.333 Y93.532 E-.06839
G1 X222.432 Y93.601 E-.04592
G1 X222.525 Y93.709 E-.05396
G1 X222.587 Y93.834 E-.05321
G1 X222.615 Y93.948 E-.04473
G1 X222.619 Y94.169 E-.08398
G1 X222.585 Y94.32 E-.05881
G1 X222.523 Y94.447 E-.05368
G1 X222.415 Y94.573 E-.063
G1 X222.404 Y94.58 E-.00478
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X223.822 Y94.41 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X223.766 Y94.293 I.411 J-.265 E.00355
G3 X223.721 Y92.654 I4.123 J-.934 E.04512
G3 X224.134 Y92.158 I.58 J.064 E.01868
G3 X224.664 Y92.416 I.097 J.475 E.01734
G3 X224.796 Y93.394 I-2.349 J.814 E.02717
G3 X224.704 Y94.275 I-3.188 J.112 E.0243
G3 X223.857 Y94.458 I-.471 J-.131 E.02908
; WIPE_START
G1 F10727.314
M204 S6000
G1 X223.766 Y94.293 E-.07177
G1 X223.723 Y94.141 E-.05987
G1 X223.679 Y93.73 E-.1573
G1 X223.68 Y93.013 E-.2724
G1 X223.721 Y92.654 E-.13731
G1 X223.763 Y92.513 E-.05577
G1 X223.77 Y92.5 E-.00557
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X223.598 Y92.441 Z3 F42000
M73 P96 R1
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X224.257 Y92.051 I.631 J.316 E.02214
G3 X224.92 Y92.594 I-.002 J.679 E.02538
G3 X224.893 Y94.271 I-3.075 J.789 E.04642
G3 X223.546 Y94.196 I-.663 J-.225 E.04977
G3 X223.579 Y92.498 I2.923 J-.792 E.04709
; WIPE_START
G1 F10727.314
M204 S6000
G1 X223.673 Y92.317 E-.07761
G1 X223.832 Y92.166 E-.08286
G1 X223.984 Y92.089 E-.06498
G1 X224.124 Y92.057 E-.05448
G1 X224.257 Y92.051 E-.05067
G1 X224.488 Y92.088 E-.08907
G1 X224.592 Y92.134 E-.04306
G1 X224.703 Y92.217 E-.05275
G1 X224.809 Y92.347 E-.06365
G1 X224.92 Y92.594 E-.10304
G1 X224.961 Y92.795 E-.07783
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X226.959 Y93.799 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G2 X226.814 Y93.659 I-.44 J.31 E.00556
G2 X226.545 Y93.558 I-.494 J.908 E.00788
G1 X226.537 Y93.498 E.00167
G1 X226.583 Y93.5 E.00127
G1 X227.02 Y93.761 E.01392
G3 X226.939 Y94.647 I-.29 J.42 E.02952
G3 X225.941 Y94.473 I-.391 J-.708 E.02994
G3 X225.855 Y94.297 I.628 J-.416 E.0054
G1 X226.006 Y94.271 E.0042
G2 X226.991 Y93.85 I.514 J-.161 E.04916
M204 S250
G1 X226.971 Y93.342 F42000
G1 F5495
M204 S5000
G2 X226.794 Y92.196 I-.52 J-.506 E.03673
G2 X225.988 Y92.569 I-.223 J.577 E.02711
G1 X225.803 Y92.546 E.00509
G3 X226.672 Y92.055 I.728 J.273 E.02963
G3 X227.295 Y93.125 I-.039 J.739 E.04011
G3 X227.029 Y93.324 I-.466 J-.347 E.00923
; OBJECT_ID: 6
; WIPE_START
G1 F10727.314
M204 S6000
G1 X227.076 Y93.216 E-.04488
G1 X227.149 Y93.036 E-.07366
G1 X227.171 Y92.838 E-.07595
G1 X227.163 Y92.714 E-.04707
G1 X227.112 Y92.523 E-.07504
G1 X227.062 Y92.428 E-.04074
G1 X226.924 Y92.274 E-.07872
G1 X226.794 Y92.196 E-.05747
G1 X226.622 Y92.151 E-.06757
G1 X226.502 Y92.15 E-.04572
G1 X226.287 Y92.211 E-.08477
G1 X226.146 Y92.323 E-.06841
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X218.519 Y92.609 Z3 F42000
G1 X192.806 Y93.572 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G1 X192.9 Y93.526 E.00286
G1 X192.698 Y93.433 E.00608
G1 X192.806 Y93.466 E.00308
G2 X193.175 Y93.433 I.122 J-.723 E.01024
G1 X193.007 Y93.508 E.00503
G1 X193.188 Y93.614 E.00573
G2 X192.866 Y93.564 I-.26 J.61 E.00901
M204 S250
G1 X192.559 Y93.693 F42000
G1 F5495
M204 S5000
G2 X193.448 Y94.322 I.375 J.413 E.05455
G2 X193.222 Y93.634 I-.541 J-.204 E.0214
G1 X193.443 Y93.763 E.00699
G3 X193.122 Y94.727 I-.346 J.42 E.03584
G3 X192.352 Y94.53 I-.199 J-.824 E.02262
G3 X192.504 Y93.716 I.377 J-.35 E.02627
M204 S250
G1 X193.176 Y93.433 F42000
G1 F5495
M204 S5000
G2 X193.541 Y92.686 I-.292 J-.606 E.0245
G2 X192.342 Y92.68 I-.6 J.052 E.04874
G2 X192.668 Y93.419 I.682 J.14 E.02354
G3 X192.165 Y92.953 I.178 J-.697 E.01954
G3 X192.855 Y92.052 I.688 J-.188 E.03588
G3 X193.072 Y92.053 I.098 J1.646 E.00594
G3 X193.581 Y93.21 I-.039 J.707 E.04267
G3 X193.233 Y93.414 I-.702 J-.795 E.01111
; WIPE_START
G1 F10727.314
M204 S6000
G1 X193.333 Y93.334 E-.04874
G1 X193.458 Y93.185 E-.07413
G1 X193.54 Y92.95 E-.09459
G1 X193.541 Y92.686 E-.10006
G1 X193.493 Y92.499 E-.07348
G1 X193.38 Y92.319 E-.08077
G1 X193.289 Y92.237 E-.04647
G1 X193.19 Y92.181 E-.04351
G1 X193.079 Y92.145 E-.04407
G1 X192.928 Y92.133 E-.05763
G1 X192.701 Y92.182 E-.08843
G1 X192.682 Y92.193 E-.00811
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X190.188 Y94.41 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X190.133 Y94.293 I.41 J-.265 E.00355
G3 X190.087 Y92.654 I4.124 J-.934 E.04513
G3 X190.514 Y92.156 I.577 J.063 E.01905
G3 X191.066 Y92.498 I.07 J.505 E.01927
G3 X191.162 Y93.394 I-3.501 J.827 E.02472
G3 X191.066 Y94.284 I-3.119 J.115 E.02457
G3 X190.223 Y94.458 I-.468 J-.139 E.02881
; WIPE_START
G1 F10727.314
M204 S6000
G1 X190.133 Y94.293 E-.07177
G1 X190.089 Y94.141 E-.05987
G1 X190.045 Y93.73 E-.1573
G1 X190.046 Y93.013 E-.2724
G1 X190.087 Y92.654 E-.1374
G1 X190.131 Y92.509 E-.05752
G1 X190.136 Y92.5 E-.00374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X190.201 Y92.171 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X190.623 Y92.051 I.394 J.585 E.01221
G3 X191.287 Y92.594 I-.002 J.679 E.02537
G3 X191.26 Y94.271 I-3.074 J.79 E.04643
M73 P96 R0
G3 X189.912 Y94.196 I-.663 J-.225 E.04978
G3 X189.964 Y92.441 I2.923 J-.792 E.04873
G3 X190.152 Y92.206 I.631 J.316 E.00829
; WIPE_START
G1 F10727.314
M204 S6000
G1 X190.35 Y92.089 E-.08739
G1 X190.49 Y92.057 E-.05448
G1 X190.623 Y92.051 E-.05067
G1 X190.855 Y92.088 E-.08907
G1 X190.958 Y92.134 E-.04306
G1 X191.069 Y92.217 E-.05275
G1 X191.175 Y92.347 E-.06365
G1 X191.287 Y92.594 E-.10287
G1 X191.365 Y92.984 E-.15128
G1 X191.374 Y93.154 E-.06478
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X187.621 Y92.229 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G1 X187.621 Y94.704 E.06769
G1 X187.393 Y94.704 E.00625
G1 X187.393 Y92.101 E.07119
G1 X189.131 Y92.101 E.04753
G1 X189.131 Y92.229 E.0035
G1 X187.681 Y92.229 E.03964
; OBJECT_ID: 5
; WIPE_START
G1 F10727.314
M204 S6000
G1 X187.633 Y94.228 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X180.003 Y94.039 Z3 F42000
G1 X159.034 Y93.519 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G1 X159.212 Y94.527 E.02799
G1 X160.269 Y94.527 E.02889
G1 X160.269 Y94.688 E.0044
G1 X159.091 Y94.688 E.0322
G1 X158.862 Y93.471 E.03385
G1 X159.04 Y93.445 E.00494
G2 X160.188 Y92.909 I.487 J-.455 E.04577
G2 X159.697 Y92.146 I-.715 J-.079 E.02686
G2 X159.002 Y92.539 I-.125 J.591 E.02387
G1 X158.804 Y92.519 E.00543
G3 X159.598 Y92.053 I.696 J.277 E.0271
G3 X160.396 Y93.037 I-.028 J.838 E.03927
G3 X159.447 Y93.693 I-.73 J-.042 E.03637
G1 X159.09 Y93.542 E.01059
; WIPE_START
G1 F10727.314
M204 S6000
G1 X159.212 Y94.527 E-.37703
G1 X160.22 Y94.527 E-.38297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.041 Y94.608 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X156.733 Y94.293 I.158 J-.463 E.0125
G3 X156.687 Y92.654 I4.122 J-.934 E.04512
G3 X157.114 Y92.156 I.577 J.062 E.01906
G3 X157.666 Y92.498 I.07 J.505 E.01927
G3 X157.762 Y93.394 I-3.503 J.827 E.02472
G3 X157.67 Y94.276 I-3.188 J.112 E.02431
G3 X157.099 Y94.623 I-.471 J-.131 E.02012
M204 S250
G1 X157.462 Y94.694 F42000
G1 F5495
M204 S5000
G3 X156.512 Y94.196 I-.266 J-.648 E.03342
G3 X156.564 Y92.441 I2.922 J-.792 E.04874
G3 X157.223 Y92.051 I.631 J.316 E.02213
G3 X157.887 Y92.594 I-.002 J.679 E.02537
G3 X157.86 Y94.272 I-3.074 J.789 E.04643
G3 X157.516 Y94.669 I-.663 J-.225 E.01473
; WIPE_START
G1 F10727.314
M204 S6000
G1 X157.306 Y94.735 E-.08386
G1 X157.093 Y94.735 E-.08074
G1 X156.905 Y94.688 E-.07356
G1 X156.73 Y94.573 E-.07973
G1 X156.591 Y94.388 E-.08809
G1 X156.512 Y94.196 E-.07863
G1 X156.427 Y93.742 E-.17554
G1 X156.422 Y93.48 E-.09984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.221 Y92.229 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G1 X154.221 Y94.704 E.06769
G1 X153.993 Y94.704 E.00625
G1 X153.993 Y92.101 E.07119
G1 X155.731 Y92.101 E.04753
G1 X155.731 Y92.229 E.0035
G1 X154.281 Y92.229 E.03964
; OBJECT_ID: 4
; WIPE_START
G1 F10727.314
M204 S6000
G1 X154.233 Y94.228 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X146.601 Y94.106 Z3 F42000
G1 X127.122 Y93.795 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G2 X126.98 Y93.66 I-.436 J.316 E.00537
G2 X126.711 Y93.559 I-.497 J.911 E.00789
G1 X126.703 Y93.498 E.00166
G1 X126.75 Y93.501 E.00127
G1 X127.186 Y93.762 E.01392
G3 X127.193 Y94.587 I-.264 J.415 E.02678
G3 X126.108 Y94.474 I-.481 J-.653 E.03273
G3 X126.021 Y94.297 I1.093 J-.645 E.0054
G1 X126.172 Y94.271 E.0042
G2 X127.154 Y93.845 I.514 J-.161 E.04934
M204 S250
G1 X127.138 Y93.342 F42000
G1 F5495
M204 S5000
G2 X126.96 Y92.196 I-.52 J-.506 E.03675
G2 X126.154 Y92.569 I-.222 J.578 E.02709
G1 X125.97 Y92.547 E.00508
G3 X126.838 Y92.056 I.727 J.273 E.02963
G3 X127.462 Y93.126 I-.04 J.74 E.04009
G3 X127.195 Y93.325 I-.457 J-.334 E.00924
; WIPE_START
G1 F10727.314
M204 S6000
G1 X127.242 Y93.217 E-.04502
G1 X127.313 Y93.043 E-.07114
G1 X127.337 Y92.839 E-.07803
G1 X127.329 Y92.715 E-.04749
G1 X127.276 Y92.517 E-.07774
G1 X127.225 Y92.424 E-.04052
G1 X127.09 Y92.275 E-.07628
G1 X126.96 Y92.196 E-.05775
G1 X126.784 Y92.152 E-.06904
G1 X126.668 Y92.151 E-.0441
G1 X126.453 Y92.212 E-.08463
G1 X126.313 Y92.323 E-.06826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.988 Y94.41 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X123.933 Y94.293 I.411 J-.265 E.00355
G3 X123.887 Y92.654 I4.124 J-.934 E.04513
G3 X124.314 Y92.156 I.577 J.063 E.01904
G3 X124.866 Y92.498 I.07 J.505 E.01927
G3 X124.962 Y93.395 I-3.5 J.827 E.02472
G3 X124.866 Y94.285 I-3.116 J.116 E.02457
G3 X124.023 Y94.459 I-.468 J-.139 E.0288
; WIPE_START
G1 F10727.314
M204 S6000
G1 X123.933 Y94.293 E-.07173
G1 X123.889 Y94.142 E-.05993
G1 X123.845 Y93.73 E-.15728
G1 X123.846 Y93.013 E-.2724
G1 X123.887 Y92.654 E-.13742
G1 X123.931 Y92.509 E-.05749
G1 X123.936 Y92.5 E-.00374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124 Y92.172 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X124.423 Y92.052 I.395 J.585 E.01222
G3 X125.087 Y92.595 I-.002 J.679 E.02537
G3 X125.06 Y94.272 I-3.074 J.79 E.04644
G3 X123.712 Y94.197 I-.663 J-.225 E.04978
G3 X123.764 Y92.441 I2.923 J-.792 E.04873
G3 X123.952 Y92.207 I.631 J.316 E.00827
; WIPE_START
G1 F10727.314
M204 S6000
G1 X124.15 Y92.09 E-.08766
G1 X124.29 Y92.057 E-.05438
G1 X124.423 Y92.052 E-.05067
G1 X124.655 Y92.089 E-.08911
G1 X124.758 Y92.135 E-.04306
G1 X124.869 Y92.218 E-.05272
G1 X124.975 Y92.348 E-.0636
G1 X125.087 Y92.595 E-.10294
G1 X125.165 Y92.985 E-.15129
G1 X125.174 Y93.155 E-.06459
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.421 Y92.229 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G1 X121.421 Y94.705 E.06769
G1 X121.193 Y94.705 E.00625
G1 X121.193 Y92.101 E.07119
G1 X122.931 Y92.101 E.04753
G1 X122.931 Y92.229 E.0035
G1 X121.481 Y92.229 E.03964
; OBJECT_ID: 2
; WIPE_START
G1 F10727.314
M204 S6000
G1 X121.433 Y94.229 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X123.498 Y86.881 Z3 F42000
G1 X140.052 Y27.98 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G2 X138.382 Y28.131 I-.817 J.272 E.06311
G2 X138.431 Y29.27 I2.405 J.468 E.03149
G2 X140.03 Y29.371 I.821 J-.301 E.05536
G1 X140.256 Y29.431 E.0064
G3 X139.303 Y29.981 I-.87 J-.407 E.03205
G3 X138.107 Y28.891 I-.036 J-1.162 E.04894
G3 X138.336 Y27.701 I1.621 J-.305 E.03394
G3 X139.299 Y27.252 I.915 J.705 E.03018
G3 X140.273 Y27.91 I.058 J.965 E.03455
G1 X140.11 Y27.961 E.0047
; WIPE_START
G1 F10727.314
M204 S6000
G1 X139.936 Y27.745 E-.10564
G1 X139.743 Y27.545 E-.10554
G1 X139.61 Y27.465 E-.0588
G1 X139.484 Y27.419 E-.05117
G1 X139.34 Y27.394 E-.05554
G1 X139.161 Y27.395 E-.06804
G1 X138.89 Y27.466 E-.10609
G1 X138.738 Y27.554 E-.06677
G1 X138.65 Y27.628 E-.04384
G1 X138.493 Y27.83 E-.09746
G1 X138.492 Y27.833 E-.0011
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.471 Y29.61 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X141.416 Y29.494 I.411 J-.264 E.00353
G3 X141.371 Y27.854 I4.124 J-.934 E.04514
G3 X141.797 Y27.357 I.577 J.063 E.01902
G3 X142.35 Y27.699 I.071 J.505 E.0193
G3 X142.446 Y28.595 I-3.502 J.827 E.02472
G3 X142.352 Y29.481 I-3.152 J.113 E.02444
G3 X141.507 Y29.659 I-.47 J-.135 E.02896
M204 S250
G1 X141.305 Y29.647 F42000
G1 F5495
M204 S5000
G3 X141.196 Y29.398 I.575 J-.4 E.00746
G3 X141.247 Y27.642 I2.92 J-.793 E.04875
G3 X141.907 Y27.252 I.631 J.316 E.02214
G3 X142.57 Y27.795 I-.002 J.679 E.02537
G3 X142.543 Y29.473 I-3.074 J.789 E.04643
G3 X141.341 Y29.694 I-.663 J-.225 E.04064
; WIPE_START
G1 F10727.314
M204 S6000
G1 X141.196 Y29.398 E-.12533
G1 X141.111 Y28.943 E-.1759
G1 X141.099 Y28.433 E-.19386
G1 X141.152 Y27.945 E-.18656
G1 X141.214 Y27.748 E-.07835
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.718 Y28.722 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G1 X143.896 Y29.728 E.02794
G1 X144.953 Y29.728 E.02889
G1 X144.953 Y29.889 E.0044
G1 X143.775 Y29.889 E.0322
G1 X143.546 Y28.672 E.03385
G1 X143.724 Y28.646 E.00494
G2 X144.872 Y28.111 I.487 J-.455 E.04575
G2 X144.381 Y27.347 I-.714 J-.08 E.02687
G2 X143.686 Y27.74 I-.125 J.591 E.02387
G1 X143.488 Y27.72 E.00543
G3 X144.282 Y27.254 I.696 J.277 E.0271
G3 X145.08 Y28.238 I-.028 J.838 E.03927
G3 X144.134 Y28.895 I-.731 J-.042 E.03628
G1 X143.774 Y28.745 E.01066
; OBJECT_ID: 8
; WIPE_START
G1 F10727.314
M204 S6000
G1 X143.896 Y29.728 E-.37645
G1 X144.906 Y29.728 E-.38355
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X139.957 Y35.539 Z3 F42000
G1 X42.065 Y150.489 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X41.806 Y151.488 I-.34 J.445 E.03589
G3 X40.673 Y151.5 I-.703 J-13.054 E.03101
G1 X40.673 Y150.358 E.03123
G3 X41.779 Y150.376 I.347 J12.19 E.03026
G3 X42.015 Y150.455 I-.054 J.557 E.00687
M204 S250
G1 X41.437 Y150.227 F42000
G1 F5495
M204 S5000
G1 X42.064 Y150.363 E.01755
G3 X42.463 Y151.273 I-.172 J.618 E.03109
G3 X41.926 Y151.61 I-.534 J-.255 E.01829
G3 X40.444 Y151.629 I-.931 J-14.841 E.04054
G1 X40.444 Y149.001 E.07187
G1 X40.673 Y149.001 E.00625
G1 X40.673 Y150.259 E.0344
G2 X41.354 Y150.212 I.189 J-2.223 E.01873
G2 X41.804 Y149.785 I-.412 J-.887 E.01728
G1 X42.333 Y149.001 E.02586
G1 X42.616 Y149.001 E.00775
G3 X42.043 Y149.819 I-3.449 J-1.807 E.02738
G1 X41.487 Y150.194 E.01835
; WIPE_START
G1 F10727.314
M204 S6000
G1 X42.064 Y150.363 E-.22863
G1 X42.24 Y150.436 E-.07223
G1 X42.313 Y150.487 E-.0339
G1 X42.373 Y150.542 E-.03111
G1 X42.468 Y150.685 E-.06486
G1 X42.515 Y150.849 E-.065
G1 X42.524 Y150.975 E-.0482
G1 X42.502 Y151.165 E-.07233
G1 X42.463 Y151.273 E-.04391
G1 X42.372 Y151.416 E-.06438
G1 X42.301 Y151.476 E-.03544
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X44.6 Y149.398 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X44.696 Y150.295 I-3.501 J.827 E.02473
G3 X44.604 Y151.176 I-3.189 J.112 E.02431
G3 X43.666 Y151.193 I-.471 J-.131 E.03428
G3 X43.621 Y149.554 I4.123 J-.934 E.04512
G3 X44.034 Y149.059 I.58 J.064 E.01868
G3 X44.578 Y149.342 I.085 J.501 E.01801
; WIPE_START
G1 F10727.314
M204 S6000
G1 X44.643 Y149.549 E-.08258
G1 X44.676 Y149.776 E-.08685
G1 X44.696 Y150.295 E-.19733
G1 X44.678 Y150.802 E-.19307
G1 X44.645 Y151.035 E-.08932
G1 X44.604 Y151.176 E-.05574
G1 X44.547 Y151.301 E-.05239
G1 X44.542 Y151.307 E-.00271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X43.497 Y149.341 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X44.157 Y148.951 I.631 J.315 E.02215
G3 X44.821 Y149.496 I-.002 J.679 E.02541
G3 X44.793 Y151.172 I-3.076 J.788 E.04639
G3 X43.446 Y151.096 I-.663 J-.225 E.04978
G3 X43.479 Y149.398 I2.923 J-.792 E.04707
; WIPE_START
G1 F10727.314
M204 S6000
G1 X43.573 Y149.217 E-.07779
G1 X43.731 Y149.067 E-.08279
G1 X43.884 Y148.989 E-.0651
G1 X44.024 Y148.957 E-.0544
G1 X44.157 Y148.951 E-.05067
G1 X44.388 Y148.988 E-.08904
G1 X44.492 Y149.035 E-.04309
G1 X44.603 Y149.118 E-.05277
G1 X44.742 Y149.304 E-.08808
G1 X44.821 Y149.496 E-.07897
G1 X44.861 Y149.695 E-.07731
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X45.968 Y150.42 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G1 X46.146 Y151.427 E.02796
G1 X47.203 Y151.427 E.02889
G1 X47.203 Y151.588 E.0044
G1 X46.025 Y151.588 E.0322
G1 X45.795 Y150.372 E.03385
G1 X45.974 Y150.346 E.00494
G2 X47.122 Y149.81 I.487 J-.455 E.04576
G2 X46.631 Y149.046 I-.714 J-.08 E.02686
G2 X45.936 Y149.44 I-.125 J.591 E.02387
G1 X45.738 Y149.419 E.00543
G3 X46.532 Y148.953 I.696 J.277 E.0271
G3 X47.33 Y149.937 I-.037 J.846 E.03915
G3 X46.384 Y150.594 I-.731 J-.042 E.03627
G1 X46.024 Y150.444 E.01067
; OBJECT_ID: 9
; WIPE_START
G1 F10727.314
M204 S6000
G1 X46.146 Y151.427 E-.37667
G1 X47.155 Y151.427 E-.38333
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X54.786 Y151.301 Z3 F42000
G1 X76.685 Y150.938 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X76.207 Y151.488 I-.56 J-.004 E.02172
G3 X75.073 Y151.5 I-.703 J-13.081 E.03101
G1 X75.073 Y150.358 E.03123
G3 X76.175 Y150.376 I.345 J12.476 E.03014
G3 X76.682 Y150.878 I-.05 J.558 E.02116
; WIPE_START
G1 F10727.314
M204 S6000
G1 X76.654 Y151.118 E-.09173
G1 X76.552 Y151.305 E-.08115
G1 X76.431 Y151.408 E-.06057
G1 X76.207 Y151.488 E-.09038
G1 X75.073 Y151.5 E-.43076
G1 X75.073 Y151.486 E-.00542
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.837 Y150.228 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G1 X76.467 Y150.364 E.01761
G3 X76.823 Y151.348 I-.178 J.621 E.03336
G3 X76.244 Y151.618 I-.543 J-.41 E.01817
G3 X74.844 Y151.63 I-.857 J-18.729 E.03829
G1 X74.844 Y149.002 E.07187
G1 X75.073 Y149.002 E.00625
G1 X75.073 Y150.26 E.0344
G2 X75.754 Y150.213 I.189 J-2.222 E.01873
G2 X76.204 Y149.786 I-.414 J-.889 E.01727
G1 X76.733 Y149.002 E.02586
G1 X77.016 Y149.002 E.00775
G3 X76.444 Y149.819 I-3.453 J-1.809 E.02737
G1 X75.887 Y150.194 E.01835
; WIPE_START
G1 F10727.314
M204 S6000
G1 X76.467 Y150.364 E-.22952
G1 X76.638 Y150.436 E-.07051
G1 X76.732 Y150.502 E-.0438
G1 X76.825 Y150.609 E-.05378
G1 X76.887 Y150.735 E-.05346
G1 X76.915 Y150.849 E-.04468
G1 X76.919 Y151.07 E-.084
G1 X76.885 Y151.221 E-.05884
G1 X76.823 Y151.348 E-.0536
G1 X76.715 Y151.474 E-.06305
G1 X76.704 Y151.481 E-.00474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.122 Y151.311 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X78.067 Y151.194 I.411 J-.265 E.00354
G3 X78.021 Y149.554 I4.122 J-.934 E.04513
G3 X78.434 Y149.059 I.58 J.064 E.01868
G3 X78.964 Y149.317 I.097 J.475 E.01734
G3 X79.096 Y150.295 I-2.348 J.814 E.02717
G3 X79.004 Y151.176 I-3.189 J.112 E.02431
G3 X78.157 Y151.359 I-.471 J-.131 E.02908
; WIPE_START
G1 F10727.314
M204 S6000
G1 X78.067 Y151.194 E-.07164
G1 X78.023 Y151.042 E-.06003
G1 X77.979 Y150.63 E-.1573
G1 X77.98 Y149.914 E-.2724
G1 X78.021 Y149.554 E-.13735
G1 X78.063 Y149.414 E-.05571
G1 X78.07 Y149.401 E-.00558
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.898 Y149.341 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X78.557 Y148.952 I.631 J.316 E.02214
G3 X79.22 Y149.495 I-.002 J.679 E.02538
G3 X79.193 Y151.172 I-3.074 J.789 E.04642
G3 X77.846 Y151.097 I-.663 J-.226 E.04977
G3 X77.879 Y149.399 I2.923 J-.792 E.04709
; WIPE_START
G1 F10727.314
M204 S6000
G1 X77.973 Y149.217 E-.07763
G1 X78.131 Y149.067 E-.08279
G1 X78.284 Y148.99 E-.06493
G1 X78.424 Y148.957 E-.05458
G1 X78.557 Y148.952 E-.05068
G1 X78.788 Y148.989 E-.08907
G1 X78.892 Y149.035 E-.04299
G1 X79.003 Y149.118 E-.05282
G1 X79.109 Y149.248 E-.06362
G1 X79.22 Y149.495 E-.10308
G1 X79.261 Y149.696 E-.0778
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.72 Y150.477 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G1 X80.825 Y150.422 E.00324
G1 X80.639 Y150.337 E.0056
G2 X81.483 Y149.722 I.221 J-.583 E.03384
G2 X80.635 Y149.083 I-.612 J-.07 E.03502
G2 X80.303 Y149.959 I.333 J.627 E.02799
G2 X80.619 Y150.327 I.579 J-.177 E.01364
G3 X80.172 Y150.024 I.216 J-.801 E.01504
G3 X80.789 Y148.953 I.607 J-.364 E.04115
G3 X81.006 Y148.954 I.098 J1.643 E.00594
G3 X81.515 Y150.11 I-.039 J.707 E.04267
G3 X81.374 Y150.215 I-.431 J-.432 E.00482
G1 X80.94 Y150.409 E.01299
G1 X81.12 Y150.514 E.00568
G2 X80.779 Y150.467 I-.258 J.608 E.00951
M204 S250
G1 X80.492 Y150.595 F42000
G1 F5495
M204 S5000
G2 X81.379 Y151.232 I.376 J.412 E.05426
G2 X81.163 Y150.539 I-.541 J-.211 E.02143
G1 X81.377 Y150.663 E.00675
G3 X81.055 Y151.628 I-.346 J.421 E.03585
G3 X80.396 Y151.527 I-.184 J-1.008 E.01857
G3 X80.437 Y150.617 I.264 J-.444 E.03049
; OBJECT_ID: 3
; WIPE_START
G1 F10727.314
M204 S6000
G1 X80.373 Y150.75 E-.05602
G1 X80.339 Y150.844 E-.03776
G1 X80.319 Y151.012 E-.06434
G1 X80.338 Y151.175 E-.0624
G1 X80.374 Y151.273 E-.03965
G1 X80.434 Y151.367 E-.04254
G1 X80.513 Y151.447 E-.04277
G1 X80.704 Y151.543 E-.08089
G1 X80.811 Y151.561 E-.04135
G1 X81.03 Y151.544 E-.08372
G1 X81.217 Y151.452 E-.07895
G1 X81.323 Y151.339 E-.05899
G1 X81.379 Y151.232 E-.04579
G1 X81.39 Y151.168 E-.02482
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X78.964 Y143.931 Z3 F42000
G1 X59.429 Y85.671 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G1 X59.656 Y85.731 E.00642
G3 X58.702 Y86.281 I-.87 J-.407 E.03208
G3 X57.507 Y85.191 I-.035 J-1.161 E.04889
G3 X57.736 Y84.001 I1.621 J-.305 E.03395
G3 X58.699 Y83.552 I.915 J.705 E.03018
G3 X59.673 Y84.21 I.058 J.965 E.03455
G1 X59.452 Y84.28 E.00634
G2 X57.782 Y84.431 I-.817 J.272 E.06311
G2 X57.831 Y85.571 I2.405 J.468 E.03149
G2 X59.4 Y85.723 I.821 J-.3 E.05371
; WIPE_START
G1 F10727.314
M204 S6000
G1 X59.656 Y85.731 E-.09741
G1 X59.51 Y85.964 E-.10446
G1 X59.323 Y86.121 E-.09279
G1 X59.143 Y86.209 E-.07608
G1 X59.014 Y86.248 E-.05114
G1 X58.702 Y86.281 E-.11949
G1 X58.554 Y86.274 E-.05598
G1 X58.309 Y86.228 E-.09488
G1 X58.144 Y86.159 E-.06775
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.871 Y85.91 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X60.816 Y85.794 I.411 J-.264 E.00353
G3 X60.771 Y84.155 I4.124 J-.934 E.04513
G3 X61.197 Y83.657 I.577 J.063 E.01902
G3 X61.75 Y83.999 I.071 J.504 E.0193
G3 X61.846 Y84.895 I-3.502 J.827 E.02472
G3 X61.752 Y85.781 I-3.153 J.114 E.02444
G3 X60.907 Y85.959 I-.47 J-.135 E.02896
M204 S250
G1 X61.741 Y86.074 F42000
G1 F5495
M204 S5000
G3 X60.596 Y85.697 I-.461 J-.527 E.03973
G3 X60.648 Y83.942 I2.923 J-.792 E.04873
G3 X61.307 Y83.552 I.633 J.319 E.02212
G3 X61.97 Y84.095 I-.002 J.679 E.02538
G3 X61.943 Y85.773 I-3.074 J.789 E.04643
G3 X61.785 Y86.033 I-.663 J-.226 E.0084
; WIPE_START
G1 F10727.314
M204 S6000
G1 X61.635 Y86.16 E-.07483
G1 X61.547 Y86.2 E-.03642
G1 X61.39 Y86.236 E-.06153
G1 X61.177 Y86.236 E-.08075
G1 X60.979 Y86.185 E-.07782
G1 X60.813 Y86.074 E-.07553
G1 X60.675 Y85.888 E-.0881
G1 X60.596 Y85.697 E-.07869
G1 X60.511 Y85.243 E-.1755
G1 X60.51 Y85.215 E-.01084
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.242 Y85.195 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G2 X64.128 Y85.834 I.376 J.412 E.05421
G2 X63.897 Y85.13 I-.539 J-.213 E.022
G1 X64.127 Y85.264 E.00728
G3 X63.806 Y86.228 I-.347 J.42 E.03579
G3 X63.146 Y86.127 I-.184 J-1.008 E.01858
G3 X63.187 Y85.218 I.264 J-.444 E.03049
M204 S250
G1 X63.692 Y85.01 F42000
G1 F5495
M204 S5000
G1 X63.87 Y85.114 E.00565
G2 X63.47 Y85.077 I-.258 J.609 E.01118
G1 X63.576 Y85.022 E.00326
G1 X63.381 Y84.933 E.00587
G2 X64.233 Y84.322 I.238 J-.569 E.03431
G2 X63.186 Y83.828 I-.606 J-.072 E.04166
G2 X63.341 Y84.914 I.558 J.475 E.03392
G3 X62.838 Y84.404 I.174 J-.675 E.02057
G3 X63.539 Y83.553 I.695 J-.143 E.03456
G3 X63.756 Y83.554 I.098 J1.641 E.00594
G3 X64.265 Y84.711 I-.039 J.707 E.04267
G3 X64.123 Y84.816 I-.432 J-.433 E.00484
G1 X63.746 Y84.985 E.0113
; OBJECT_ID: 1
; WIPE_START
G1 F10727.314
M204 S6000
G1 X63.87 Y85.114 E-.06787
G1 X63.68 Y85.063 E-.07489
G1 X63.47 Y85.077 E-.08
G1 X63.576 Y85.022 E-.04536
G1 X63.381 Y84.933 E-.08154
G1 X63.495 Y84.967 E-.04547
G1 X63.624 Y84.979 E-.04911
G1 X63.752 Y84.966 E-.04892
G1 X63.959 Y84.88 E-.0853
G1 X64.066 Y84.788 E-.05349
G1 X64.163 Y84.646 E-.06535
G1 X64.212 Y84.488 E-.06268
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X63.324 Y76.908 Z3 F42000
G1 X57.804 Y29.772 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G2 X58.929 Y29.371 I.349 J-.802 E.03598
G1 X59.156 Y29.431 E.00642
G3 X58.201 Y29.981 I-.87 J-.407 E.03209
G3 X57.007 Y28.891 I-.034 J-1.161 E.04889
G3 X57.236 Y27.701 I1.621 J-.305 E.03395
G3 X58.199 Y27.252 I.915 J.705 E.03018
G3 X59.173 Y27.91 I.058 J.965 E.03455
G1 X58.952 Y27.98 E.00634
G2 X57.282 Y28.131 I-.817 J.272 E.06311
G2 X57.331 Y29.271 I2.405 J.468 E.03149
G2 X57.75 Y29.746 I.821 J-.3 E.01773
; WIPE_START
G1 F10727.314
M204 S6000
G1 X57.916 Y29.808 E-.06735
G1 X58.172 Y29.841 E-.09819
G1 X58.46 Y29.796 E-.11068
G1 X58.647 Y29.705 E-.0793
G1 X58.821 Y29.547 E-.08895
G1 X58.929 Y29.371 E-.07877
G1 X59.156 Y29.431 E-.08921
G1 X59.011 Y29.664 E-.10429
G1 X58.923 Y29.737 E-.04327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.371 Y29.61 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X60.316 Y29.494 I.411 J-.264 E.00353
G3 X60.271 Y27.855 I4.124 J-.934 E.04512
G3 X60.697 Y27.357 I.577 J.063 E.01902
G3 X61.25 Y27.699 I.071 J.504 E.0193
G3 X61.346 Y28.595 I-3.502 J.828 E.02472
G3 X61.252 Y29.481 I-3.15 J.114 E.02444
G3 X60.407 Y29.659 I-.47 J-.135 E.02896
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.316 Y29.494 E-.0715
G1 X60.273 Y29.342 E-.05981
G1 X60.229 Y28.931 E-.1573
G1 X60.23 Y28.214 E-.2724
G1 X60.271 Y27.855 E-.13742
G1 X60.315 Y27.709 E-.05756
G1 X60.32 Y27.7 E-.00401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.147 Y27.642 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G3 X60.807 Y27.252 I.631 J.316 E.02215
G3 X61.47 Y27.795 I-.002 J.679 E.02538
G3 X61.443 Y29.473 I-3.074 J.789 E.04643
G3 X60.096 Y29.397 I-.663 J-.226 E.04977
G3 X60.129 Y27.699 I2.924 J-.792 E.04707
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.223 Y27.518 E-.07778
G1 X60.381 Y27.368 E-.08278
G1 X60.534 Y27.29 E-.06511
G1 X60.674 Y27.258 E-.05439
G1 X60.807 Y27.252 E-.05068
G1 X61.039 Y27.289 E-.08913
G1 X61.142 Y27.335 E-.0429
G1 X61.253 Y27.418 E-.05285
G1 X61.359 Y27.548 E-.06364
G1 X61.47 Y27.795 E-.10301
G1 X61.511 Y27.996 E-.07773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.96 Y29.844 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G2 X63.596 Y29.377 I.106 J-.521 E.02427
G2 X63.095 Y28.759 I-.558 J-.06 E.02418
G1 X63.087 Y28.699 E.00166
G1 X63.133 Y28.701 E.00127
G1 X63.57 Y28.962 E.01391
G3 X63.576 Y29.788 I-.264 J.415 E.02679
G3 X62.491 Y29.675 I-.481 J-.653 E.03273
G3 X62.405 Y29.498 I1.104 J-.65 E.0054
G1 X62.556 Y29.472 E.0042
G2 X62.903 Y29.829 I.511 J-.149 E.01416
; WIPE_START
G1 F10727.314
M204 S6000
G1 X63.13 Y29.846 E-.08642
G1 X63.315 Y29.798 E-.07264
G1 X63.484 Y29.667 E-.08149
G1 X63.565 Y29.526 E-.06157
G1 X63.596 Y29.377 E-.05772
G1 X63.574 Y29.151 E-.08655
G1 X63.459 Y28.945 E-.08937
G1 X63.301 Y28.822 E-.0764
G1 X63.095 Y28.759 E-.08164
G1 X63.087 Y28.699 E-.02311
G1 X63.133 Y28.701 E-.01764
G1 X63.191 Y28.735 E-.02547
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.521 Y28.543 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5495
M204 S5000
G2 X63.344 Y27.397 I-.52 J-.506 E.03676
G2 X62.538 Y27.77 I-.222 J.577 E.02709
G1 X62.354 Y27.748 E.00508
G3 X63.222 Y27.256 I.727 J.273 E.02963
G3 X63.845 Y28.327 I-.04 J.74 E.04009
G3 X63.578 Y28.525 I-.467 J-.348 E.00923
; WIPE_START
G1 F10727.314
M204 S6000
G1 X63.626 Y28.417 E-.04499
G1 X63.699 Y28.236 E-.07407
G1 X63.721 Y28.037 E-.07613
G1 X63.712 Y27.903 E-.05098
G1 X63.66 Y27.718 E-.07312
G1 X63.6 Y27.611 E-.04654
G1 X63.473 Y27.476 E-.0705
G1 X63.344 Y27.397 E-.05775
G1 X63.168 Y27.352 E-.06899
G1 X63.051 Y27.352 E-.04433
G1 X62.845 Y27.409 E-.08134
G1 X62.738 Y27.476 E-.048
G1 X62.694 Y27.519 E-.02327
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X222.325 Y94.282 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X221.906 Y94.587 I-.504 J-.253 E.01474
G3 X220.773 Y94.599 I-.69 J-11.598 E.031
G1 X220.773 Y93.457 E.03123
G3 X221.78 Y93.467 I.32 J19.4 E.02754
G3 X222.349 Y94.227 I.041 J.563 E.03088
; WIPE_START
G1 F10727.314
M204 S6000
G1 X222.284 Y94.362 E-.05702
G1 X222.136 Y94.504 E-.0779
G1 X221.906 Y94.587 E-.09297
G1 X220.773 Y94.599 E-.43055
G1 X220.773 Y94.332 E-.10156
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X221.546 Y93.329 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G1 X222.172 Y93.465 E.01751
G3 X222.523 Y94.447 I-.183 J.619 E.03321
G3 X222.027 Y94.709 I-.511 J-.366 E.01589
G3 X220.544 Y94.729 I-.922 J-13.886 E.04056
G1 X220.544 Y92.101 E.07186
G1 X220.773 Y92.101 E.00625
G1 X220.773 Y93.356 E.03432
G2 X221.453 Y93.312 I.16 J-2.816 E.01869
G2 X221.849 Y92.964 I-.304 J-.744 E.01468
G2 X222.433 Y92.101 I-34.93 J-24.274 E.0285
G1 X222.716 Y92.101 E.00775
G3 X222.15 Y92.913 I-5.565 J-3.278 E.02711
G1 X221.595 Y93.295 E.01841
; WIPE_START
G1 F10727.314
M204 S6000
G1 X222.172 Y93.465 E-.22833
G1 X222.338 Y93.535 E-.06868
G1 X222.433 Y93.602 E-.04408
G1 X222.509 Y93.686 E-.04318
G1 X222.586 Y93.83 E-.06199
G1 X222.623 Y94.036 E-.07938
G1 X222.618 Y94.18 E-.05489
G1 X222.598 Y94.276 E-.03725
G1 X222.523 Y94.447 E-.07115
G1 X222.469 Y94.52 E-.03426
G1 X222.394 Y94.581 E-.0368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X224.001 Y92.217 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X224.155 Y92.154 I.293 J.496 E.00458
G1 X224.275 Y92.15 E.00327
G3 X224.745 Y92.659 I-.09 J.555 E.02043
G3 X224.746 Y94.131 I-5.412 J.739 E.0404
G3 X224.316 Y94.636 I-.577 J-.057 E.01929
G3 X223.721 Y94.131 I-.054 J-.54 E.02379
G3 X223.72 Y92.657 I4.616 J-.739 E.04049
G3 X223.951 Y92.25 I.574 J.056 E.01316
M204 S250
G1 X223.746 Y92.236 F42000
G1 F5262
M204 S5000
G3 X224.317 Y92.054 I.473 J.498 E.01696
G3 X224.881 Y92.487 I-.038 J.634 E.02064
G3 X224.893 Y94.272 I-2.936 J.912 E.04953
G3 X223.575 Y94.275 I-.66 J-.217 E.0475
G3 X223.603 Y92.429 I2.781 J-.88 E.05138
G3 X223.704 Y92.279 I.615 J.305 E.00496
; WIPE_START
M73 P97 R0
G1 F10727.314
M204 S6000
G1 X223.918 Y92.116 E-.10244
G1 X224.124 Y92.057 E-.08131
G1 X224.317 Y92.054 E-.07323
G1 X224.493 Y92.09 E-.06822
G1 X224.649 Y92.172 E-.0671
G1 X224.764 Y92.284 E-.06115
G1 X224.881 Y92.487 E-.08895
G1 X224.951 Y92.706 E-.08734
G1 X225 Y92.997 E-.11223
G1 X225.003 Y93.045 E-.01803
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X226.537 Y93.498 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G1 X226.584 Y93.5 E.0013
G1 X227.019 Y93.76 E.01384
G3 X226.971 Y94.628 I-.28 J.42 E.02864
G3 X225.941 Y94.473 I-.424 J-.681 E.03098
G3 X225.855 Y94.296 I.751 J-.473 E.00538
G1 X226.007 Y94.271 E.0042
G2 X226.814 Y93.659 I.512 J-.162 E.05622
G2 X226.545 Y93.558 I-.553 J1.059 E.00788
G1 X226.545 Y93.557 E.00002
; WIPE_START
G1 F10727.314
M204 S6000
G1 X226.584 Y93.5 E-.02639
G1 X227.019 Y93.76 E-.19236
G1 X227.142 Y93.871 E-.06315
G1 X227.196 Y93.95 E-.03639
G1 X227.24 Y94.075 E-.05032
G1 X227.245 Y94.21 E-.05111
G1 X227.209 Y94.35 E-.05507
G1 X227.16 Y94.44 E-.03879
G1 X227.089 Y94.528 E-.04297
G1 X226.971 Y94.628 E-.05899
G1 X226.864 Y94.683 E-.04552
G1 X226.672 Y94.732 E-.07534
G1 X226.61 Y94.733 E-.02362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X226.622 Y92.156 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G2 X225.988 Y92.569 I-.05 J.616 E.02225
G1 X225.804 Y92.546 E.00507
G3 X226.656 Y92.055 I.72 J.264 E.02922
G3 X227.296 Y93.125 I-.021 J.739 E.04058
G3 X226.966 Y93.347 I-.447 J-.306 E.01115
G2 X226.802 Y92.199 I-.509 J-.513 E.03684
G2 X226.681 Y92.164 I-.23 J.574 E.00344
; OBJECT_ID: 6
; WIPE_START
G1 F10727.314
M204 S6000
G1 X226.502 Y92.15 E-.06834
G1 X226.285 Y92.212 E-.08579
G1 X226.103 Y92.358 E-.08853
G1 X225.988 Y92.569 E-.09122
G1 X225.804 Y92.546 E-.0705
G1 X225.87 Y92.404 E-.05981
G1 X225.952 Y92.296 E-.05148
G1 X226.166 Y92.134 E-.10211
G1 X226.348 Y92.072 E-.07294
G1 X226.53 Y92.061 E-.06927
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X218.902 Y92.328 Z3.2 F42000
G1 X192.47 Y93.251 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X192.34 Y92.939 I.474 J-.38 E.00935
G3 X192.825 Y92.144 I.666 J-.14 E.02806
G3 X193.55 Y92.822 I.113 J.606 E.03156
G3 X192.509 Y93.296 I-.606 J.049 E.04068
M204 S250
G1 X193.095 Y93.58 F42000
G1 F5262
M204 S5000
G2 X192.8 Y93.574 I-.161 J.7 E.00813
G1 X192.879 Y93.535 E.00239
G1 X192.431 Y93.31 E.01371
G3 X192.74 Y92.067 I.392 J-.562 E.04518
G3 X193.047 Y92.052 I.216 J1.227 E.00842
G3 X193.572 Y93.218 I-.015 J.708 E.04364
G3 X193.444 Y93.312 I-.423 J-.442 E.00438
G1 X192.993 Y93.527 E.01364
G1 X193.042 Y93.552 E.0015
; WIPE_START
G1 F10727.314
M204 S6000
G1 X192.993 Y93.562 E-.01904
G1 X192.8 Y93.574 E-.07329
G1 X192.879 Y93.535 E-.03322
G1 X192.431 Y93.31 E-.19045
G1 X192.287 Y93.191 E-.07092
G1 X192.196 Y93.04 E-.06702
G1 X192.15 Y92.874 E-.06573
G1 X192.163 Y92.58 E-.11157
G1 X192.231 Y92.406 E-.07097
G1 X192.331 Y92.292 E-.05779
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X192.472 Y94.423 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G2 X193.473 Y94.225 I.458 J-.315 E.03537
G2 X193.294 Y93.682 I-.608 J-.1 E.01626
G1 X193.414 Y93.744 E.00369
G3 X193.155 Y94.721 I-.311 J.44 E.03584
G3 X192.351 Y94.529 I-.226 J-.832 E.02356
G3 X192.558 Y93.694 I.379 J-.349 E.02786
G2 X192.441 Y94.372 I.371 J.414 E.02029
; WIPE_START
G1 F10727.314
M204 S6000
G1 X192.624 Y94.578 E-.10474
G1 X192.827 Y94.654 E-.08248
G1 X193.046 Y94.654 E-.08319
G1 X193.149 Y94.626 E-.04079
G1 X193.245 Y94.578 E-.04083
G1 X193.397 Y94.426 E-.08175
G1 X193.473 Y94.225 E-.08159
G1 X193.473 Y94.004 E-.08406
G1 X193.447 Y93.902 E-.04003
G1 X193.365 Y93.753 E-.06472
G1 X193.294 Y93.682 E-.03806
G1 X193.336 Y93.703 E-.01777
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X190.519 Y94.627 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X190.087 Y94.131 I.11 J-.531 E.0193
G3 X190.086 Y92.662 I4.613 J-.739 E.04036
G3 X190.478 Y92.163 I.6 J.068 E.01825
G3 X191.112 Y92.659 I.096 J.531 E.02483
G3 X191.112 Y94.132 I-5.411 J.739 E.04042
G3 X190.682 Y94.636 I-.579 J-.059 E.01926
G3 X190.578 Y94.636 I-.054 J-.54 E.00285
; WIPE_START
G1 F10727.314
M204 S6000
G1 X190.437 Y94.615 E-.05435
G1 X190.295 Y94.534 E-.06198
G1 X190.195 Y94.422 E-.0571
G1 X190.133 Y94.294 E-.05404
G1 X190.087 Y94.131 E-.06411
G1 X190.052 Y93.863 E-.10296
G1 X190.037 Y93.46 E-.15334
G1 X190.051 Y92.933 E-.20002
G1 X190.055 Y92.902 E-.0121
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X190.112 Y92.236 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X190.683 Y92.054 I.473 J.498 E.01696
G3 X191.247 Y92.487 I-.039 J.635 E.02064
G3 X191.259 Y94.272 I-2.936 J.912 E.04953
G3 X189.941 Y94.275 I-.66 J-.217 E.0475
G3 X189.969 Y92.429 I2.781 J-.88 E.05137
G3 X190.07 Y92.279 I.615 J.304 E.00497
; WIPE_START
G1 F10727.314
M204 S6000
G1 X190.285 Y92.116 E-.10244
G1 X190.49 Y92.057 E-.08131
G1 X190.683 Y92.054 E-.07323
G1 X190.859 Y92.09 E-.06822
G1 X191.015 Y92.172 E-.06718
G1 X191.13 Y92.284 E-.06106
G1 X191.247 Y92.487 E-.08895
G1 X191.317 Y92.706 E-.08734
G1 X191.367 Y92.997 E-.11223
G1 X191.369 Y93.045 E-.01803
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X187.621 Y92.229 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G1 X187.621 Y94.704 E.06769
G1 X187.393 Y94.704 E.00625
G1 X187.393 Y92.101 E.07119
G1 X189.131 Y92.101 E.04753
G1 X189.131 Y92.229 E.0035
G1 X187.681 Y92.229 E.03964
; OBJECT_ID: 5
; WIPE_START
G1 F10727.314
M204 S6000
G1 X187.633 Y94.228 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X180.003 Y94.037 Z3.2 F42000
G1 X159.033 Y93.513 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G1 X159.212 Y94.527 E.02817
G1 X160.269 Y94.527 E.02889
G1 X160.269 Y94.688 E.0044
G1 X159.091 Y94.688 E.0322
G1 X158.862 Y93.471 E.03385
G1 X159.04 Y93.446 E.00493
G2 X160.096 Y93.338 I.488 J-.446 E.03369
G2 X160.016 Y92.343 I-.89 J-.429 E.02861
G2 X159.002 Y92.539 I-.45 J.394 E.0341
G1 X158.804 Y92.519 E.00543
G3 X159.698 Y92.06 I.719 J.302 E.02985
G3 X160.396 Y93.036 I-.143 J.84 E.03639
G3 X159.444 Y93.691 I-.717 J-.022 E.03678
G1 X159.088 Y93.537 E.0106
; WIPE_START
G1 F10727.314
M204 S6000
G1 X159.212 Y94.527 E-.37926
G1 X160.214 Y94.527 E-.38074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.119 Y94.627 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X156.687 Y94.131 I.11 J-.531 E.0193
G3 X156.686 Y92.662 I4.612 J-.739 E.04036
G3 X157.078 Y92.163 I.6 J.068 E.01826
G3 X157.712 Y92.659 I.096 J.531 E.02483
G3 X157.712 Y94.131 I-5.412 J.739 E.04038
G3 X157.282 Y94.636 I-.579 J-.058 E.0193
G3 X157.178 Y94.636 I-.053 J-.54 E.00285
M204 S250
G1 X156.941 Y94.699 F42000
G1 F5262
M204 S5000
G3 X156.551 Y94.301 I.259 J-.644 E.01567
G3 X156.569 Y92.429 I2.742 J-.909 E.05213
G3 X157.283 Y92.055 I.615 J.304 E.02357
G3 X157.847 Y92.487 I-.038 J.634 E.02064
G3 X157.859 Y94.272 I-2.935 J.912 E.04953
G3 X156.997 Y94.719 I-.659 J-.217 E.02942
; WIPE_START
G1 F10727.314
M204 S6000
G1 X156.784 Y94.619 E-.0895
G1 X156.667 Y94.505 E-.0618
G1 X156.551 Y94.301 E-.08919
G1 X156.481 Y94.086 E-.08614
G1 X156.432 Y93.794 E-.11238
G1 X156.415 Y93.252 E-.2059
G1 X156.433 Y92.971 E-.10724
G1 X156.437 Y92.95 E-.00786
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.221 Y92.229 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G1 X154.221 Y94.704 E.06769
G1 X153.993 Y94.704 E.00625
G1 X153.993 Y92.101 E.07119
G1 X155.731 Y92.101 E.04753
G1 X155.731 Y92.229 E.0035
G1 X154.281 Y92.229 E.03964
; OBJECT_ID: 4
; WIPE_START
G1 F10727.314
M204 S6000
G1 X154.233 Y94.228 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X146.603 Y94.026 Z3.2 F42000
G1 X126.751 Y93.501 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G1 X127.185 Y93.76 E.01385
G3 X127.137 Y94.628 I-.28 J.42 E.02864
G3 X126.107 Y94.474 I-.421 J-.701 E.03087
G3 X126.022 Y94.297 I.753 J-.474 E.00538
G1 X126.173 Y94.271 E.0042
G2 X126.917 Y93.622 I.512 J-.164 E.05822
G2 X126.711 Y93.558 I-.331 J.707 E.00591
G1 X126.705 Y93.511 E.00131
M204 S250
G1 X127.132 Y93.348 F42000
G1 F5262
M204 S5000
G2 X126.904 Y92.176 I-.504 J-.51 E.03859
G2 X126.154 Y92.57 I-.177 J.574 E.02572
G1 X125.97 Y92.547 E.00508
G3 X126.822 Y92.055 I.72 J.264 E.02922
G3 X127.462 Y93.125 I-.021 J.739 E.04058
G3 X127.19 Y93.332 I-.447 J-.306 E.00951
; WIPE_START
G1 F10727.314
M204 S6000
G1 X127.214 Y93.259 E-.02915
G1 X127.299 Y93.091 E-.07151
G1 X127.337 Y92.84 E-.09675
G1 X127.328 Y92.702 E-.05261
G1 X127.271 Y92.507 E-.07704
G1 X127.211 Y92.402 E-.04606
G1 X127.074 Y92.262 E-.07419
G1 X126.904 Y92.176 E-.07247
G1 X126.668 Y92.151 E-.09049
G1 X126.451 Y92.213 E-.08562
G1 X126.319 Y92.318 E-.06413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.319 Y94.628 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X123.887 Y94.132 I.11 J-.531 E.0193
G3 X123.886 Y92.662 I4.612 J-.739 E.04036
G3 X124.278 Y92.164 I.6 J.068 E.01825
G3 X124.912 Y92.659 I.096 J.531 E.02483
G3 X124.912 Y94.133 I-5.412 J.739 E.04042
G3 X124.482 Y94.636 I-.575 J-.056 E.01927
G3 X124.378 Y94.637 I-.054 J-.54 E.00285
M204 S250
G1 X124.141 Y94.7 F42000
G1 F5262
M204 S5000
G3 X123.741 Y94.276 I.259 J-.645 E.01644
G3 X123.771 Y92.426 I2.777 J-.88 E.0515
G3 X124.483 Y92.055 I.613 J.309 E.02343
G3 X125.047 Y92.488 I-.039 J.635 E.02064
G3 X125.059 Y94.273 I-2.936 J.912 E.04952
G3 X124.197 Y94.72 I-.66 J-.217 E.02943
; WIPE_START
G1 F10727.314
M204 S6000
G1 X123.984 Y94.619 E-.08949
G1 X123.831 Y94.456 E-.08489
G1 X123.741 Y94.276 E-.07654
G1 X123.682 Y94.087 E-.07537
G1 X123.632 Y93.796 E-.11194
G1 X123.615 Y93.253 E-.20676
G1 X123.633 Y92.971 E-.1071
G1 X123.637 Y92.951 E-.00792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.421 Y92.229 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G1 X121.421 Y94.705 E.06769
G1 X121.193 Y94.705 E.00625
G1 X121.193 Y92.101 E.07119
G1 X122.931 Y92.101 E.04753
G1 X122.931 Y92.229 E.0035
G1 X121.481 Y92.229 E.03964
; OBJECT_ID: 2
; WIPE_START
G1 F10727.314
M204 S6000
G1 X121.433 Y94.229 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X123.498 Y86.881 Z3.2 F42000
G1 X140.053 Y27.98 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G2 X138.39 Y28.099 I-.816 J.271 E.06219
G2 X138.445 Y29.304 I2.255 J.501 E.03339
G2 X140.028 Y29.371 I.807 J-.329 E.05441
G1 X140.257 Y29.425 E.00643
G3 X139.302 Y29.981 I-.878 J-.41 E.03216
G3 X138.138 Y29.071 I-.053 J-1.131 E.04402
G3 X138.266 Y27.808 I1.844 J-.45 E.03538
G3 X139.373 Y27.255 I.976 J.569 E.0358
G3 X140.274 Y27.909 I-.022 J.978 E.0324
G1 X140.11 Y27.961 E.00471
; WIPE_START
G1 F10727.314
M204 S6000
G1 X139.909 Y27.708 E-.12308
G1 X139.803 Y27.592 E-.05948
G1 X139.683 Y27.504 E-.0564
G1 X139.551 Y27.441 E-.05568
G1 X139.405 Y27.402 E-.05737
G1 X139.162 Y27.395 E-.09246
G1 X138.885 Y27.468 E-.10894
G1 X138.649 Y27.629 E-.10829
G1 X138.494 Y27.829 E-.09624
G1 X138.492 Y27.834 E-.00206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.479 Y29.623 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X141.371 Y29.332 I.434 J-.326 E.00859
G3 X141.37 Y27.863 I4.615 J-.739 E.04036
G3 X141.762 Y27.364 I.6 J.068 E.01826
G3 X142.395 Y27.86 I.096 J.531 E.02483
G3 X142.396 Y29.333 I-5.412 J.739 E.04041
G3 X141.966 Y29.837 I-.575 J-.056 E.01928
G3 X141.518 Y29.669 I-.053 J-.54 E.01356
M204 S250
G1 X142.451 Y29.656 F42000
G1 F5262
M204 S5000
G3 X141.235 Y29.505 I-.568 J-.4 E.04105
G3 X141.229 Y27.684 I2.954 J-.92 E.05054
G3 X141.967 Y27.256 I.639 J.25 E.02517
G3 X142.531 Y27.688 I-.038 J.634 E.02064
G3 X142.543 Y29.473 I-2.936 J.912 E.04952
G3 X142.484 Y29.605 I-.66 J-.217 E.00397
; WIPE_START
G1 F10727.314
M204 S6000
G1 X142.302 Y29.816 E-.10569
G1 X142.144 Y29.901 E-.06837
G1 X141.883 Y29.942 E-.10019
G1 X141.624 Y29.902 E-.09975
G1 X141.468 Y29.82 E-.06706
G1 X141.352 Y29.707 E-.0612
G1 X141.235 Y29.505 E-.08888
G1 X141.165 Y29.287 E-.0871
G1 X141.129 Y29.074 E-.08177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.717 Y28.714 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G1 X143.896 Y29.728 E.02816
G1 X144.953 Y29.728 E.02889
G1 X144.953 Y29.889 E.0044
G1 X143.775 Y29.889 E.0322
G1 X143.546 Y28.672 E.03385
G1 X143.724 Y28.647 E.00493
G2 X144.78 Y28.539 I.488 J-.446 E.03369
G2 X144.7 Y27.544 I-.911 J-.428 E.02855
G2 X143.686 Y27.74 I-.45 J.394 E.03411
G1 X143.488 Y27.72 E.00544
G3 X144.382 Y27.261 I.72 J.303 E.02985
G3 X145.08 Y28.237 I-.143 J.84 E.03639
G3 X144.127 Y28.892 I-.717 J-.022 E.03679
G1 X143.772 Y28.738 E.0106
; OBJECT_ID: 8
; WIPE_START
G1 F10727.314
M204 S6000
G1 X143.896 Y29.728 E-.37919
G1 X144.898 Y29.728 E-.38081
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X139.945 Y35.535 Z3.2 F42000
G1 X41.96 Y150.419 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X41.806 Y151.488 I-.24 J.511 E.03932
G3 X40.673 Y151.5 I-.69 J-11.58 E.031
G1 X40.673 Y150.358 E.03123
G3 X41.679 Y150.367 I.32 J19.361 E.02753
G3 X41.905 Y150.397 I.04 J.563 E.00625
M204 S250
G1 X41.446 Y150.229 F42000
G1 F5262
M204 S5000
G1 X42.072 Y150.365 E.01752
G3 X42.423 Y151.348 I-.183 J.619 E.03321
G3 X41.927 Y151.61 I-.511 J-.366 E.01589
G3 X40.444 Y151.629 I-.922 J-13.892 E.04056
G1 X40.444 Y149.001 E.07186
G1 X40.673 Y149.001 E.00625
G1 X40.673 Y150.256 E.03432
G2 X41.353 Y150.212 I.16 J-2.821 E.01868
G2 X41.749 Y149.864 I-.308 J-.75 E.01468
G2 X42.333 Y149.001 I-34.842 J-24.214 E.02851
G1 X42.616 Y149.001 E.00775
G3 X42.05 Y149.814 I-5.563 J-3.276 E.02711
G1 X41.495 Y150.195 E.01841
; WIPE_START
G1 F10727.314
M204 S6000
G1 X42.072 Y150.365 E-.22841
G1 X42.238 Y150.435 E-.06859
G1 X42.333 Y150.502 E-.04408
G1 X42.409 Y150.586 E-.04322
G1 X42.486 Y150.73 E-.06204
G1 X42.523 Y150.936 E-.0793
G1 X42.518 Y151.08 E-.05493
G1 X42.498 Y151.176 E-.03724
G1 X42.423 Y151.348 E-.07115
G1 X42.369 Y151.42 E-.03426
G1 X42.294 Y151.482 E-.03678
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X43.83 Y149.167 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X44.055 Y149.054 I.35 J.418 E.00694
G3 X44.645 Y149.559 I.048 J.541 E.02366
G3 X44.646 Y151.032 I-5.411 J.739 E.0404
G3 X44.216 Y151.536 I-.577 J-.057 E.01929
G3 X43.621 Y151.032 I-.051 J-.542 E.02376
G3 X43.584 Y149.834 I6.065 J-.786 E.03283
G3 X43.663 Y149.412 I1.357 J.037 E.01177
G3 X43.787 Y149.208 I.517 J.172 E.00659
M204 S250
G1 X43.645 Y149.136 F42000
G1 F5262
M204 S5000
G3 X44.217 Y148.955 I.473 J.498 E.01696
G3 X44.792 Y149.416 I-.044 J.645 E.02145
G3 X44.793 Y151.173 I-2.969 J.88 E.04872
G3 X43.485 Y151.202 I-.659 J-.217 E.04672
G3 X43.503 Y149.33 I2.743 J-.909 E.05214
G3 X43.604 Y149.179 I.615 J.305 E.00496
; WIPE_START
G1 F10727.314
M204 S6000
G1 X43.818 Y149.016 E-.10243
G1 X44.024 Y148.957 E-.08133
G1 X44.217 Y148.955 E-.07323
G1 X44.393 Y148.99 E-.06821
G1 X44.549 Y149.072 E-.06706
G1 X44.701 Y149.235 E-.08477
G1 X44.792 Y149.416 E-.07676
G1 X44.851 Y149.606 E-.07559
G1 X44.9 Y149.898 E-.11252
G1 X44.903 Y149.945 E-.01812
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X45.968 Y150.42 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G1 X46.146 Y151.427 E.02798
G1 X47.203 Y151.427 E.02889
G1 X47.203 Y151.588 E.0044
G1 X46.025 Y151.588 E.0322
G1 X45.795 Y150.372 E.03385
G1 X45.974 Y150.346 E.00493
G2 X46.993 Y150.298 I.488 J-.476 E.03152
G2 X46.904 Y149.195 I-.813 J-.489 E.03231
G2 X45.936 Y149.44 I-.406 J.433 E.03247
G1 X45.738 Y149.419 E.00543
G3 X46.632 Y148.961 I.726 J.315 E.02976
G3 X47.33 Y149.936 I-.142 J.839 E.03641
G3 X46.384 Y150.594 I-.717 J-.022 E.03659
G1 X46.024 Y150.443 E.01069
; OBJECT_ID: 9
; WIPE_START
G1 F10727.314
M204 S6000
G1 X46.146 Y151.427 E-.377
G1 X47.154 Y151.427 E-.383
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X54.783 Y151.188 Z3.2 F42000
G1 X76.496 Y150.508 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X76.206 Y151.488 I-.374 J.422 E.03495
G3 X75.073 Y151.5 I-.69 J-11.603 E.031
G1 X75.073 Y150.358 E.03123
G3 X76.08 Y150.368 I.32 J19.379 E.02754
G3 X76.449 Y150.471 I.041 J.563 E.01069
M204 S250
G1 X75.846 Y150.23 F42000
G1 F5262
M204 S5000
G1 X76.472 Y150.366 E.01751
G3 X76.823 Y151.348 I-.183 J.619 E.03321
G3 X76.327 Y151.61 I-.511 J-.366 E.0159
G3 X74.844 Y151.63 I-.922 J-13.884 E.04056
G1 X74.844 Y149.002 E.07186
G1 X75.073 Y149.002 E.00625
G1 X75.073 Y150.257 E.03432
G2 X75.753 Y150.213 I.16 J-2.82 E.01868
G2 X76.149 Y149.865 I-.304 J-.744 E.01468
G2 X76.733 Y149.002 I-34.842 J-24.214 E.02851
G1 X77.016 Y149.002 E.00775
G3 X76.45 Y149.814 I-5.566 J-3.278 E.02711
G1 X75.895 Y150.196 E.01841
; WIPE_START
G1 F10727.314
M204 S6000
G1 X76.472 Y150.366 E-.22837
G1 X76.638 Y150.436 E-.06867
G1 X76.733 Y150.503 E-.04404
G1 X76.809 Y150.587 E-.04319
G1 X76.886 Y150.731 E-.06199
G1 X76.923 Y150.936 E-.07938
G1 X76.918 Y151.081 E-.05491
G1 X76.898 Y151.177 E-.03722
G1 X76.823 Y151.348 E-.07115
G1 X76.769 Y151.42 E-.03429
G1 X76.694 Y151.482 E-.03678
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.234 Y151.428 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X78.021 Y151.032 I.329 J-.431 E.01267
G3 X77.984 Y149.834 I6.063 J-.786 E.03283
G3 X78.063 Y149.413 I1.357 J.037 E.01177
G3 X78.455 Y149.055 I.517 J.172 E.01516
G1 X78.575 Y149.05 E.00328
G3 X79.045 Y149.56 I-.09 J.555 E.02043
G3 X79.046 Y151.032 I-5.412 J.739 E.0404
G3 X78.616 Y151.536 I-.577 J-.057 E.01929
G3 X78.283 Y151.462 I-.054 J-.54 E.00948
M204 S250
G1 X78.274 Y151.6 F42000
G1 F5262
M204 S5000
G3 X77.885 Y151.205 I.259 J-.644 E.0156
G3 X77.903 Y149.33 I2.744 J-.912 E.0522
G3 X78.617 Y148.955 I.615 J.304 E.02358
G3 X79.181 Y149.388 I-.038 J.634 E.02064
G3 X79.193 Y151.173 I-2.936 J.912 E.04953
G3 X78.331 Y151.62 I-.66 J-.217 E.02942
; WIPE_START
G1 F10727.314
M204 S6000
G1 X78.117 Y151.52 E-.08947
G1 X78 Y151.404 E-.06277
G1 X77.885 Y151.205 E-.08728
G1 X77.815 Y150.986 E-.08713
G1 X77.766 Y150.697 E-.11166
G1 X77.749 Y150.153 E-.20677
G1 X77.767 Y149.872 E-.10711
G1 X77.77 Y149.851 E-.00783
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.808 Y150.375 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X80.274 Y149.84 I.069 J-.604 E.02233
G3 X80.758 Y149.045 I.656 J-.146 E.02815
G3 X81.483 Y149.722 I.111 J.608 E.03151
G3 X80.868 Y150.379 I-.606 J.049 E.02771
M204 S250
G1 X80.725 Y150.476 F42000
G1 F5262
M204 S5000
G1 X80.809 Y150.434 E.00256
G1 X80.365 Y150.211 E.01358
G3 X80.674 Y148.968 I.392 J-.562 E.04518
G3 X80.98 Y148.953 I.216 J1.228 E.00841
G3 X81.506 Y150.119 I-.015 J.708 E.04364
G3 X81.377 Y150.213 I-.423 J-.442 E.00437
G1 X80.927 Y150.428 E.01365
G1 X81.033 Y150.483 E.00328
G2 X80.785 Y150.471 I-.178 J1.096 E.00682
M204 S250
G1 X80.492 Y150.594 F42000
G1 F5262
M204 S5000
G2 X81.379 Y151.23 I.376 J.413 E.0544
G2 X81.228 Y150.583 I-.559 J-.211 E.01928
G1 X81.348 Y150.645 E.00368
G3 X81.089 Y151.622 I-.31 J.44 E.03584
G3 X80.285 Y151.43 I-.227 J-.83 E.02357
G3 X80.437 Y150.617 I.381 J-.349 E.0262
; OBJECT_ID: 3
; WIPE_START
G1 F10727.314
M204 S6000
G1 X80.402 Y150.697 E-.03301
G1 X80.354 Y150.796 E-.0419
G1 X80.318 Y151.015 E-.08441
G1 X80.355 Y151.228 E-.08216
G1 X80.402 Y151.324 E-.04044
G1 X80.557 Y151.479 E-.08327
G1 X80.757 Y151.554 E-.08107
G1 X80.979 Y151.555 E-.0846
G1 X81.083 Y151.527 E-.04069
G1 X81.263 Y151.411 E-.08145
G1 X81.379 Y151.23 E-.08164
G1 X81.397 Y151.166 E-.02537
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X78.969 Y143.93 Z3.2 F42000
G1 X59.428 Y85.671 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G1 X59.657 Y85.725 E.00643
G3 X58.702 Y86.281 I-.883 J-.42 E.03211
G3 X57.538 Y85.371 I-.053 J-1.131 E.04403
G3 X57.666 Y84.108 I1.844 J-.45 E.03538
G3 X58.773 Y83.555 I.976 J.569 E.0358
G3 X59.674 Y84.209 I-.022 J.978 E.0324
G1 X59.452 Y84.28 E.00635
G2 X57.79 Y84.399 I-.816 J.271 E.06219
G2 X57.845 Y85.604 I2.255 J.501 E.03338
G2 X59.399 Y85.723 I.807 J-.329 E.05277
; WIPE_START
G1 F10727.314
M204 S6000
G1 X59.657 Y85.725 E-.09798
G1 X59.509 Y85.965 E-.10705
G1 X59.337 Y86.112 E-.08603
G1 X59.138 Y86.211 E-.0842
G1 X59.025 Y86.245 E-.04491
G1 X58.702 Y86.281 E-.12366
G1 X58.557 Y86.274 E-.055
G1 X58.311 Y86.228 E-.09529
G1 X58.15 Y86.163 E-.06587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X61.366 Y86.137 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X60.771 Y85.632 I-.051 J-.542 E.02376
G3 X60.77 Y84.163 I4.614 J-.739 E.04036
G3 X61.162 Y83.664 I.6 J.068 E.01826
G3 X61.795 Y84.16 I.096 J.531 E.02483
G3 X61.796 Y85.633 I-5.412 J.739 E.04041
G3 X61.423 Y86.119 I-.575 J-.056 E.01764
M204 S250
G1 X61.024 Y86.2 F42000
G1 F5262
M204 S5000
G3 X60.635 Y85.805 I.259 J-.644 E.0156
G3 X60.629 Y83.984 I2.954 J-.92 E.05054
G3 X61.367 Y83.556 I.639 J.25 E.02518
G3 X61.931 Y83.988 I-.038 J.634 E.02064
G3 X61.943 Y85.773 I-2.936 J.912 E.04953
G3 X61.081 Y86.22 I-.66 J-.217 E.02942
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.867 Y86.12 E-.08946
G1 X60.749 Y86.004 E-.0628
G1 X60.635 Y85.805 E-.08724
G1 X60.565 Y85.587 E-.08713
G1 X60.516 Y85.297 E-.11168
G1 X60.499 Y85.045 E-.09603
G1 X60.517 Y84.472 E-.21783
G1 X60.52 Y84.452 E-.00783
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.046 Y85.321 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X63.244 Y85.193 I.372 J.361 E.0065
G2 X64.156 Y85.732 I.37 J.415 E.05716
G2 X63.978 Y85.183 I-.607 J-.106 E.01641
G1 X64.098 Y85.245 E.00369
G3 X63.839 Y86.222 I-.311 J.44 E.03584
G3 X63.035 Y86.03 I-.227 J-.83 E.02356
G3 X63.007 Y85.366 I.382 J-.349 E.01975
M204 S250
G1 X63.558 Y84.976 F42000
G1 F5262
M204 S5000
G3 X63.024 Y84.44 I.069 J-.604 E.02233
G3 X63.508 Y83.645 I.668 J-.139 E.02804
G3 X64.233 Y84.323 I.113 J.606 E.03155
G3 X63.618 Y84.98 I-.606 J.049 E.02771
M204 S250
G1 X63.671 Y85.064 F42000
G1 F5262
M204 S5000
G2 X63.475 Y85.076 I-.053 J.723 E.00538
G1 X63.559 Y85.034 E.00256
G1 X63.115 Y84.811 E.01358
G3 X63.424 Y83.569 I.392 J-.562 E.04519
G3 X63.731 Y83.553 I.216 J1.227 E.00842
G3 X64.256 Y84.719 I-.015 J.708 E.04364
G3 X64.134 Y84.81 I-.419 J-.437 E.00416
G1 X63.684 Y85.032 E.01372
G1 X63.778 Y85.08 E.00288
G2 X63.73 Y85.071 I-.16 J.707 E.00131
; OBJECT_ID: 1
; WIPE_START
G1 F10727.314
M204 S6000
G1 X63.475 Y85.076 E-.09706
G1 X63.559 Y85.034 E-.03561
G1 X63.115 Y84.811 E-.18877
G1 X62.97 Y84.692 E-.07101
G1 X62.879 Y84.541 E-.06697
G1 X62.835 Y84.383 E-.06274
G1 X62.826 Y84.27 E-.0427
G1 X62.847 Y84.081 E-.07224
G1 X62.913 Y83.91 E-.06968
G1 X63.005 Y83.805 E-.05322
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X62.261 Y76.209 Z3.2 F42000
G1 X57.706 Y29.724 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G2 X58.928 Y29.371 I.445 J-.749 E.03899
G1 X59.157 Y29.425 E.00643
G3 X58.202 Y29.981 I-.883 J-.42 E.03211
G3 X57.038 Y29.071 I-.053 J-1.131 E.04403
G3 X57.166 Y27.808 I1.844 J-.45 E.03538
G3 X58.273 Y27.255 I.976 J.569 E.0358
G3 X59.174 Y27.909 I-.022 J.978 E.0324
G1 X58.952 Y27.98 E.00635
G2 X57.29 Y28.099 I-.816 J.271 E.06218
G2 X57.345 Y29.304 I2.255 J.501 E.03338
G2 X57.656 Y29.692 I.807 J-.329 E.01379
; WIPE_START
G1 F10727.314
M204 S6000
G1 X57.883 Y29.799 E-.09519
G1 X58.175 Y29.841 E-.11228
G1 X58.456 Y29.798 E-.10794
G1 X58.585 Y29.742 E-.05344
G1 X58.702 Y29.665 E-.0535
G1 X58.804 Y29.568 E-.05337
G1 X58.928 Y29.371 E-.08844
G1 X59.157 Y29.425 E-.08937
G1 X59.01 Y29.664 E-.10647
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.379 Y29.623 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G3 X60.271 Y29.332 I.434 J-.326 E.00859
G3 X60.27 Y27.863 I4.614 J-.739 E.04036
G3 X60.662 Y27.364 I.6 J.068 E.01825
G3 X61.295 Y27.86 I.096 J.531 E.02484
G3 X61.296 Y29.333 I-5.412 J.739 E.04041
G3 X60.866 Y29.837 I-.575 J-.056 E.01928
G3 X60.418 Y29.669 I-.053 J-.54 E.01356
M204 S250
G1 X60.252 Y29.702 F42000
G1 F5262
M204 S5000
G3 X60.135 Y29.505 I.532 J-.446 E.00629
G3 X60.129 Y27.684 I2.954 J-.92 E.05054
G3 X60.867 Y27.256 I.639 J.25 E.02518
G3 X61.431 Y27.688 I-.038 J.634 E.02064
G3 X61.443 Y29.473 I-2.936 J.912 E.04953
G3 X60.292 Y29.747 I-.659 J-.217 E.03872
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.135 Y29.505 E-.1095
G1 X60.065 Y29.287 E-.08712
G1 X60.016 Y28.997 E-.11168
G1 X59.999 Y28.745 E-.09603
G1 X60.017 Y28.172 E-.21783
G1 X60.059 Y27.91 E-.10097
G1 X60.088 Y27.817 E-.03689
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.501 Y28.991 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5262
M204 S5000
G2 X63.406 Y28.893 I-.432 J.32 E.00375
G2 X63.095 Y28.759 I-.53 J.803 E.0093
G1 X63.087 Y28.699 E.00166
G1 X63.134 Y28.701 E.0013
G1 X63.569 Y28.961 E.01385
G3 X63.521 Y29.829 I-.28 J.42 E.02864
G3 X62.491 Y29.674 I-.424 J-.68 E.03099
G3 X62.405 Y29.498 I.748 J-.471 E.00538
G1 X62.557 Y29.472 E.00419
G2 X63.534 Y29.041 I.512 J-.161 E.0494
M204 S250
G1 X63.525 Y28.54 F42000
G1 F5262
M204 S5000
G2 X63.293 Y27.377 I-.515 J-.502 E.03811
G2 X62.538 Y27.77 I-.181 J.574 E.02587
G1 X62.354 Y27.748 E.00507
G3 X63.197 Y27.255 I.719 J.263 E.02896
G3 X63.869 Y28.288 I-.025 J.751 E.0395
G3 X63.583 Y28.525 I-.441 J-.242 E.01038
; WIPE_START
G1 F10727.314
M204 S6000
G1 X63.597 Y28.46 E-.02528
G1 X63.683 Y28.292 E-.0715
G1 X63.721 Y28.04 E-.09676
G1 X63.711 Y27.902 E-.05259
G1 X63.682 Y27.776 E-.0493
G1 X63.597 Y27.606 E-.07236
G1 X63.462 Y27.466 E-.0737
G1 X63.293 Y27.377 E-.0724
G1 X63.172 Y27.352 E-.04701
G1 X63.051 Y27.352 E-.04593
G1 X62.833 Y27.415 E-.08646
G1 X62.696 Y27.524 E-.06671
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
; OBJECT_ID: 7
; start printing object, unique label id: 7
M624 QAAAAAAAAAA=
G1 X222.242 Y94.399 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X221.907 Y94.587 I-.426 J-.366 E.01071
G3 X220.773 Y94.599 I-.696 J-12.119 E.03103
G1 X220.773 Y93.457 E.03123
G3 X221.901 Y93.478 I.351 J11.318 E.03087
G3 X222.279 Y94.352 I-.085 J.555 E.03104
; WIPE_START
G1 F10727.314
M204 S6000
G1 X222.09 Y94.53 E-.09863
G1 X221.907 Y94.587 E-.07272
G1 X220.773 Y94.599 E-.43105
G1 X220.773 Y94.184 E-.15761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X221.544 Y93.332 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X222.155 Y93.46 E.01708
G3 X222.566 Y94.367 I-.164 J.621 E.03116
G3 X222.124 Y94.695 I-.5 J-.211 E.01579
G3 X221.644 Y94.729 I-.443 J-2.9 E.01317
G1 X220.544 Y94.729 E.03007
G1 X220.544 Y92.101 E.07186
G1 X220.773 Y92.101 E.00625
G1 X220.773 Y93.356 E.03432
G2 X221.453 Y93.312 I.16 J-2.81 E.01868
G2 X221.861 Y92.947 I-.317 J-.765 E.01527
G2 X222.433 Y92.101 I-38.203 J-26.444 E.02792
G1 X222.716 Y92.101 E.00775
G3 X222.144 Y92.918 I-3.623 J-1.928 E.02737
G1 X221.593 Y93.298 E.01828
; WIPE_START
G1 F10727.314
M204 S6000
G1 X222.155 Y93.46 E-.22222
G1 X222.287 Y93.508 E-.05321
G1 X222.425 Y93.596 E-.0624
G1 X222.509 Y93.685 E-.04656
G1 X222.566 Y93.78 E-.04206
G1 X222.612 Y93.926 E-.0581
G1 X222.625 Y94.072 E-.05559
G1 X222.614 Y94.208 E-.0517
G1 X222.566 Y94.367 E-.06331
G1 X222.472 Y94.516 E-.06684
G1 X222.413 Y94.575 E-.03173
G1 X222.399 Y94.583 E-.00628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X223.871 Y92.323 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X224.145 Y92.156 I.428 J.394 E.0089
G3 X224.584 Y92.3 I.066 J.54 E.01304
G3 X224.787 Y93.04 I-1.064 J.689 E.02131
G3 X224.704 Y94.275 I-3.668 J.373 E.03401
G3 X223.766 Y94.29 I-.471 J-.13 E.03438
G3 X223.72 Y92.658 I4.11 J-.931 E.04493
G3 X223.833 Y92.369 I.578 J.059 E.00859
M204 S250
G1 X223.855 Y92.153 F42000
G1 F5333
M204 S5000
G3 X224.278 Y92.052 I.362 J.584 E.01208
G3 X224.917 Y92.582 I-.017 J.671 E.02447
G3 X224.881 Y94.304 I-3.072 J.798 E.04769
G3 X223.55 Y94.209 I-.651 J-.256 E.04846
G3 X223.577 Y92.488 I2.989 J-.814 E.0477
G3 X223.806 Y92.186 I.64 J.249 E.01049
; WIPE_START
G1 F10727.314
M204 S6000
G1 X224.014 Y92.08 E-.08872
G1 X224.278 Y92.052 E-.10092
G1 X224.458 Y92.079 E-.06929
G1 X224.542 Y92.109 E-.03389
G1 X224.703 Y92.217 E-.07358
G1 X224.834 Y92.389 E-.08204
G1 X224.917 Y92.582 E-.07991
G1 X225.002 Y93.012 E-.16655
G1 X225.008 Y93.183 E-.06511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X226.545 Y93.558 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X226.537 Y93.497 E.00167
G1 X226.583 Y93.5 E.00126
G1 X227.019 Y93.76 E.01389
G3 X227.017 Y94.594 I-.265 J.416 E.02716
G3 X225.941 Y94.474 I-.47 J-.665 E.03237
G3 X225.855 Y94.297 I.625 J-.415 E.00541
G1 X226.006 Y94.271 E.00421
G2 X227.046 Y94.175 I.511 J-.149 E.04009
G2 X226.604 Y93.569 I-.581 J-.041 E.02229
M204 S250
G1 X226.965 Y93.347 F42000
G1 F5333
M204 S5000
G2 X226.803 Y92.2 I-.514 J-.513 E.0367
G2 X225.988 Y92.569 I-.233 J.572 E.02738
G1 X225.803 Y92.546 E.00508
G3 X226.609 Y92.052 I.724 J.276 E.02781
G3 X227.295 Y93.125 I.021 J.742 E.04186
G3 X227.022 Y93.329 I-.482 J-.361 E.00945
; OBJECT_ID: 6
; WIPE_START
G1 F10727.314
M204 S6000
M73 P98 R0
G1 X227.077 Y93.214 E-.04848
G1 X227.147 Y93.041 E-.07093
G1 X227.171 Y92.838 E-.07756
G1 X227.163 Y92.711 E-.04838
G1 X227.11 Y92.516 E-.07676
G1 X227.05 Y92.409 E-.04686
G1 X226.923 Y92.274 E-.07005
G1 X226.803 Y92.2 E-.05368
G1 X226.627 Y92.152 E-.06947
G1 X226.502 Y92.15 E-.04739
G1 X226.295 Y92.207 E-.08185
G1 X226.194 Y92.271 E-.04528
G1 X226.149 Y92.313 E-.0233
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 7
M625
; start printing object, unique label id: 6
M624 IAAAAAAAAAA=
M204 S10000
G1 X218.519 Y92.507 Z3.4 F42000
G1 X192.411 Y93.172 Z3.4
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X192.331 Y92.828 I.529 J-.304 E.00978
G3 X192.841 Y92.141 I.649 J-.051 E.02553
G3 X193.55 Y92.821 I.092 J.613 E.03098
G3 X192.444 Y93.222 I-.609 J.047 E.04339
M204 S250
G1 X192.193 Y93.014 F42000
G1 F5333
M204 S5000
G3 X192.746 Y92.066 I.634 J-.265 E.03475
G3 X193.007 Y92.05 I.205 J1.196 E.00716
G3 X193.577 Y93.214 I.022 J.711 E.04457
G3 X193.44 Y93.315 I-.433 J-.444 E.00466
G1 X193.018 Y93.514 E.01277
G1 X193.186 Y93.613 E.00534
G2 X192.782 Y93.577 I-.258 J.614 E.01129
G1 X192.885 Y93.523 E.00318
G1 X192.428 Y93.308 E.0138
G3 X192.219 Y93.068 I.398 J-.56 E.00879
; WIPE_START
G1 F10727.314
M204 S6000
G1 X192.143 Y92.768 E-.11747
G1 X192.169 Y92.555 E-.08181
G1 X192.258 Y92.363 E-.08042
G1 X192.395 Y92.221 E-.07482
G1 X192.575 Y92.116 E-.07927
G1 X192.746 Y92.066 E-.06769
G1 X193.007 Y92.05 E-.09924
G1 X193.19 Y92.072 E-.07032
G1 X193.382 Y92.143 E-.07762
G1 X193.406 Y92.161 E-.01134
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X192.584 Y94.541 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G2 X193.465 Y94.264 I.348 J-.435 E.0298
G2 X193.216 Y93.63 I-.578 J-.138 E.01984
G1 X193.446 Y93.765 E.0073
G3 X193.126 Y94.726 I-.352 J.417 E.03553
G3 X192.465 Y94.628 I-.189 J-1.008 E.01862
G3 X192.56 Y93.692 I.275 J-.445 E.03198
G2 X192.539 Y94.501 I.372 J.414 E.02477
; WIPE_START
G1 F10727.314
M204 S6000
G1 X192.775 Y94.643 E-.1047
G1 X192.992 Y94.661 E-.08274
G1 X193.098 Y94.643 E-.04069
G1 X193.289 Y94.547 E-.0812
G1 X193.366 Y94.47 E-.04131
G1 X193.424 Y94.38 E-.04088
G1 X193.465 Y94.264 E-.04658
G1 X193.482 Y94.114 E-.05732
G1 X193.452 Y93.916 E-.07619
G1 X193.366 Y93.753 E-.07009
G1 X193.216 Y93.63 E-.07364
G1 X193.317 Y93.689 E-.04467
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X190.434 Y94.605 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X190.132 Y94.29 I.164 J-.459 E.01238
G3 X190.087 Y92.657 I4.112 J-.931 E.04495
G3 X190.512 Y92.156 I.578 J.059 E.01911
G3 X190.964 Y92.316 I.067 J.531 E.01361
G3 X191.153 Y93.04 I-1.079 J.668 E.02079
G3 X191.065 Y94.289 I-3.579 J.373 E.03441
G3 X190.492 Y94.622 I-.466 J-.143 E.01992
; WIPE_START
G1 F10727.314
M204 S6000
G1 X190.291 Y94.532 E-.08347
G1 X190.189 Y94.411 E-.06013
G1 X190.132 Y94.29 E-.05092
G1 X190.085 Y94.119 E-.06754
G1 X190.045 Y93.718 E-.15312
G1 X190.045 Y93.045 E-.25553
G1 X190.07 Y92.812 E-.0893
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X190.222 Y92.153 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X190.644 Y92.052 I.362 J.584 E.01207
G3 X191.283 Y92.582 I-.016 J.669 E.02449
G3 X191.247 Y94.304 I-3.072 J.798 E.04769
G3 X189.916 Y94.209 I-.651 J-.256 E.04847
G3 X189.943 Y92.488 I2.989 J-.814 E.0477
G3 X190.172 Y92.186 I.64 J.249 E.01049
; WIPE_START
G1 F10727.314
M204 S6000
G1 X190.38 Y92.08 E-.08873
G1 X190.644 Y92.052 E-.10078
G1 X190.824 Y92.079 E-.06942
G1 X191.031 Y92.184 E-.08797
G1 X191.131 Y92.285 E-.0541
G1 X191.2 Y92.389 E-.04744
G1 X191.283 Y92.582 E-.0799
G1 X191.368 Y93.012 E-.16655
G1 X191.374 Y93.183 E-.06512
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X189.131 Y92.229 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X187.621 Y92.229 E.04128
G1 X187.621 Y94.704 E.06769
G1 X187.393 Y94.704 E.00625
G1 X187.393 Y92.101 E.07119
G1 X189.131 Y92.101 E.04753
G1 X189.131 Y92.169 E.00186
; OBJECT_ID: 5
; WIPE_START
G1 F10727.314
M204 S6000
G1 X187.621 Y92.229 E-.57402
G1 X187.621 Y92.718 E-.18598
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 6
M625
; start printing object, unique label id: 5
M624 EAAAAAAAAAA=
M204 S10000
G1 X179.992 Y92.931 Z3.4 F42000
G1 X159.034 Y93.515 Z3.4
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X159.212 Y94.527 E.02809
G1 X160.269 Y94.527 E.02889
G1 X160.269 Y94.688 E.0044
G1 X159.091 Y94.688 E.0322
G1 X158.862 Y93.471 E.03385
G1 X159.04 Y93.445 E.00494
G2 X160.016 Y93.453 I.492 J-.483 E.02965
G2 X160.152 Y92.609 I-.791 J-.561 E.0242
G2 X159.002 Y92.539 I-.585 J.129 E.04239
G1 X158.804 Y92.519 E.00544
G3 X159.635 Y92.056 I.707 J.291 E.02809
G3 X160.395 Y93.049 I-.075 J.845 E.03846
G3 X159.444 Y93.691 I-.719 J-.039 E.03633
G1 X159.089 Y93.539 E.01056
; WIPE_START
G1 F10727.314
M204 S6000
G1 X159.212 Y94.527 E-.37836
G1 X160.217 Y94.527 E-.38164
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X157.034 Y94.606 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X156.732 Y94.29 I.164 J-.46 E.01238
G3 X156.687 Y92.658 I4.111 J-.931 E.04495
G3 X157.112 Y92.156 I.578 J.059 E.01911
G3 X157.564 Y92.316 I.067 J.531 E.01362
G3 X157.753 Y93.041 I-1.08 J.668 E.02078
G3 X157.665 Y94.289 I-3.578 J.373 E.03441
G3 X157.092 Y94.622 I-.466 J-.143 E.01991
M204 S250
G1 X156.887 Y94.675 F42000
G1 F5333
M204 S5000
G3 X156.516 Y94.209 I.309 J-.627 E.01684
G3 X156.543 Y92.488 I2.989 J-.814 E.04771
G3 X157.244 Y92.052 I.64 J.249 E.0242
G3 X157.883 Y92.582 I-.017 J.671 E.02447
G3 X157.815 Y94.375 I-2.718 J.794 E.04991
G3 X156.942 Y94.699 I-.618 J-.327 E.02785
; WIPE_START
G1 F10727.314
M204 S6000
G1 X156.73 Y94.573 E-.09382
G1 X156.599 Y94.402 E-.082
G1 X156.516 Y94.209 E-.07972
G1 X156.431 Y93.781 E-.16588
G1 X156.414 Y93.274 E-.19277
G1 X156.432 Y92.98 E-.11173
G1 X156.446 Y92.892 E-.03408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X154.221 Y92.229 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X154.221 Y94.704 E.06769
G1 X153.993 Y94.704 E.00625
G1 X153.993 Y92.101 E.07119
G1 X155.731 Y92.101 E.04753
G1 X155.731 Y92.229 E.0035
G1 X154.281 Y92.229 E.03964
; OBJECT_ID: 4
; WIPE_START
G1 F10727.314
M204 S6000
G1 X154.233 Y94.228 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 5
M625
; start printing object, unique label id: 4
M624 CAAAAAAAAAA=
M204 S10000
G1 X146.603 Y94.026 Z3.4 F42000
G1 X126.703 Y93.498 Z3.4
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X126.749 Y93.501 E.00126
G1 X127.185 Y93.761 E.01389
G3 X127.183 Y94.594 I-.265 J.416 E.02717
G3 X126.108 Y94.474 I-.47 J-.665 E.03237
G3 X126.021 Y94.297 I.624 J-.415 E.00541
G1 X126.173 Y94.271 E.00421
G2 X127.022 Y93.692 I.513 J-.16 E.05485
G2 X126.711 Y93.558 I-.5 J.735 E.00931
G1 X126.711 Y93.558 E.00002
M204 S250
G1 X127.238 Y93.212 F42000
G1 F5333
M204 S5000
G2 X126.96 Y92.196 I-.62 J-.376 E.03223
G2 X126.154 Y92.57 I-.222 J.578 E.02708
G1 X125.969 Y92.547 E.00509
G3 X126.776 Y92.053 I.724 J.276 E.02781
G3 X127.462 Y93.126 I.021 J.742 E.04186
G3 X127.131 Y93.348 I-.482 J-.361 E.01108
G2 X127.205 Y93.262 I-.513 J-.512 E.0031
; WIPE_START
G1 F10727.314
M204 S6000
G1 X127.316 Y93.032 E-.09705
G1 X127.337 Y92.837 E-.07463
G1 X127.328 Y92.705 E-.05008
G1 X127.276 Y92.517 E-.07434
G1 X127.215 Y92.409 E-.04696
G1 X127.09 Y92.275 E-.06972
G1 X126.96 Y92.196 E-.05781
G1 X126.784 Y92.152 E-.06893
G1 X126.668 Y92.151 E-.04408
G1 X126.455 Y92.211 E-.08383
G1 X126.272 Y92.355 E-.0886
G1 X126.267 Y92.364 E-.00397
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.234 Y94.606 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X123.932 Y94.291 I.164 J-.46 E.01238
G3 X123.887 Y92.658 I4.11 J-.931 E.04494
G3 X124.312 Y92.157 I.578 J.059 E.01912
G3 X124.765 Y92.317 I.067 J.531 E.01362
G3 X124.953 Y93.041 I-1.081 J.668 E.02078
G3 X124.865 Y94.29 I-3.578 J.373 E.03441
G3 X124.292 Y94.623 I-.466 J-.143 E.01992
M204 S250
G1 X124.544 Y94.732 F42000
G1 F5333
M204 S5000
G3 X123.716 Y94.21 I-.147 J-.684 E.02965
G3 X123.743 Y92.488 I2.989 J-.813 E.0477
G3 X124.444 Y92.053 I.64 J.248 E.0242
G3 X125.083 Y92.583 I-.016 J.669 E.02449
G3 X125.047 Y94.305 I-3.072 J.798 E.04769
G3 X124.602 Y94.717 I-.651 J-.256 E.01718
; WIPE_START
G1 F10727.314
M204 S6000
G1 X124.293 Y94.735 E-.11764
G1 X124.085 Y94.68 E-.08155
G1 X123.93 Y94.574 E-.07148
G1 X123.801 Y94.406 E-.08058
G1 X123.716 Y94.21 E-.08125
G1 X123.631 Y93.782 E-.16585
G1 X123.617 Y93.356 E-.16165
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.421 Y92.229 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X121.421 Y94.705 E.06769
G1 X121.193 Y94.705 E.00625
G1 X121.193 Y92.101 E.07119
G1 X122.931 Y92.101 E.04753
G1 X122.931 Y92.229 E.0035
G1 X121.481 Y92.229 E.03964
; OBJECT_ID: 2
; WIPE_START
G1 F10727.314
M204 S6000
G1 X121.433 Y94.229 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 4
M625
; start printing object, unique label id: 2
M624 AgAAAAAAAAA=
M204 S10000
G1 X123.498 Y86.881 Z3.4 F42000
G1 X140.053 Y27.98 Z3.4
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G2 X138.383 Y28.128 I-.817 J.276 E.06293
G2 X138.435 Y29.279 I2.405 J.468 E.03181
G2 X140.028 Y29.371 I.817 J-.304 E.05514
G1 X140.258 Y29.426 E.00649
G3 X139.302 Y29.981 I-.87 J-.398 E.03225
G3 X138.099 Y28.838 I-.03 J-1.173 E.05041
G3 X138.327 Y27.714 I1.694 J-.241 E.03199
G3 X139.325 Y27.253 I.922 J.687 E.03135
G3 X140.275 Y27.909 I.016 J.992 E.03368
G1 X140.11 Y27.961 E.00473
; WIPE_START
G1 F10727.314
M204 S6000
G1 X139.939 Y27.75 E-.10312
G1 X139.86 Y27.649 E-.04897
G1 X139.741 Y27.543 E-.06055
G1 X139.628 Y27.474 E-.05043
G1 X139.434 Y27.408 E-.07775
G1 X139.161 Y27.395 E-.10382
G1 X138.872 Y27.474 E-.11379
G1 X138.651 Y27.627 E-.10231
G1 X138.492 Y27.834 E-.09925
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.471 Y29.611 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X141.416 Y29.491 I.411 J-.264 E.00362
G3 X141.37 Y27.859 I4.111 J-.931 E.04494
G3 X141.796 Y27.357 I.578 J.059 E.01911
G3 X142.318 Y27.625 I.075 J.496 E.01715
G3 X142.446 Y28.595 I-2.259 J.791 E.02694
G3 X142.348 Y29.49 I-3.231 J.101 E.0247
G3 X141.507 Y29.659 I-.466 J-.144 E.02867
M204 S250
G1 X142.417 Y29.698 F42000
G1 F5333
M204 S5000
G3 X141.2 Y29.41 I-.537 J-.448 E.04236
G3 X141.227 Y27.69 I2.99 J-.813 E.04768
G3 X141.928 Y27.253 I.65 J.263 E.02413
G3 X142.567 Y27.783 I-.017 J.671 E.02448
G3 X142.531 Y29.505 I-3.071 J.798 E.0477
G3 X142.453 Y29.651 I-.651 J-.254 E.00453
; WIPE_START
G1 F10727.314
M204 S6000
G1 X142.357 Y29.769 E-.05812
G1 X142.227 Y29.864 E-.06098
G1 X141.992 Y29.936 E-.09334
G1 X141.776 Y29.936 E-.08193
G1 X141.569 Y29.88 E-.08154
G1 X141.414 Y29.774 E-.07148
G1 X141.283 Y29.603 E-.08199
G1 X141.2 Y29.41 E-.07983
G1 X141.122 Y29.021 E-.15078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.718 Y28.716 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X143.896 Y29.728 E.0281
G1 X144.953 Y29.728 E.02889
G1 X144.953 Y29.889 E.0044
G1 X143.775 Y29.889 E.0322
G1 X143.546 Y28.672 E.03385
G1 X143.724 Y28.646 E.00494
G2 X144.872 Y28.11 I.487 J-.455 E.04579
G2 X144.447 Y27.366 I-.739 J-.071 E.02496
G2 X143.685 Y27.74 I-.185 J.586 E.02562
G1 X143.488 Y27.72 E.00544
G3 X144.319 Y27.257 I.701 J.28 E.02816
G3 X145.079 Y28.25 I-.071 J.841 E.03852
G3 X144.127 Y28.892 I-.719 J-.039 E.03633
G1 X143.773 Y28.74 E.01056
; OBJECT_ID: 8
; WIPE_START
G1 F10727.314
M204 S6000
G1 X143.896 Y29.728 E-.37837
G1 X144.901 Y29.728 E-.38163
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 2
M625
; start printing object, unique label id: 8
M624 gAAAAAAAAAA=
M204 S10000
G1 X139.974 Y35.557 Z3.4 F42000
G1 X42.116 Y151.335 Z3.4
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X41.805 Y151.488 I-.39 J-.401 E.00962
G3 X40.673 Y151.5 I-.694 J-12.101 E.03098
G1 X40.673 Y150.358 E.03123
G3 X41.798 Y150.379 I.351 J11.35 E.03077
G3 X42.157 Y151.291 I-.072 J.555 E.03266
; WIPE_START
G1 F10727.314
M204 S6000
G1 X41.953 Y151.445 E-.09729
G1 X41.805 Y151.488 E-.05822
G1 X40.673 Y151.5 E-.43037
G1 X40.673 Y151.041 E-.17413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X41.444 Y150.232 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X42.056 Y150.36 E.01709
G3 X42.466 Y151.268 I-.165 J.621 E.03115
G3 X42.024 Y151.596 I-.5 J-.212 E.01578
G3 X41.529 Y151.629 I-.447 J-2.937 E.01359
G1 X40.444 Y151.629 E.02965
G1 X40.444 Y149.001 E.07187
G1 X40.673 Y149.001 E.00625
G1 X40.673 Y150.256 E.03432
G2 X41.353 Y150.212 I.16 J-2.817 E.01868
G2 X41.761 Y149.847 I-.321 J-.769 E.01527
G2 X42.333 Y149.001 I-38.078 J-26.359 E.02792
G1 X42.616 Y149.001 E.00775
G3 X42.044 Y149.819 I-3.623 J-1.928 E.02737
G1 X41.493 Y150.198 E.01828
; WIPE_START
G1 F10727.314
M204 S6000
G1 X42.056 Y150.36 E-.22235
G1 X42.186 Y150.408 E-.05283
G1 X42.325 Y150.496 E-.06264
G1 X42.409 Y150.586 E-.0465
G1 X42.466 Y150.681 E-.0421
G1 X42.512 Y150.827 E-.05809
G1 X42.525 Y150.972 E-.05561
G1 X42.514 Y151.108 E-.05171
G1 X42.466 Y151.268 E-.06335
G1 X42.372 Y151.416 E-.06671
G1 X42.313 Y151.475 E-.03174
G1 X42.299 Y151.484 E-.00638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X43.968 Y151.506 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X43.666 Y151.19 I.165 J-.46 E.01238
G3 X43.62 Y149.559 I4.109 J-.931 E.04492
G3 X44.046 Y149.056 I.578 J.058 E.01914
G3 X44.498 Y149.216 I.067 J.531 E.01362
G3 X44.687 Y149.941 I-1.08 J.668 E.02078
G3 X44.604 Y151.175 I-3.665 J.373 E.03399
G3 X44.026 Y151.522 I-.471 J-.13 E.02036
; WIPE_START
G1 F10727.314
M204 S6000
G1 X43.825 Y151.432 E-.08354
G1 X43.723 Y151.312 E-.06009
G1 X43.666 Y151.19 E-.05091
G1 X43.619 Y151.019 E-.06754
G1 X43.578 Y150.618 E-.15311
G1 X43.579 Y149.946 E-.25553
G1 X43.604 Y149.712 E-.08928
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X43.574 Y149.217 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X44.178 Y148.953 I.544 J.42 E.01881
G3 X44.817 Y149.483 I-.014 J.668 E.0245
G3 X44.781 Y151.204 I-3.072 J.798 E.04769
G3 X43.45 Y151.109 I-.651 J-.254 E.04853
G3 X43.477 Y149.388 I2.989 J-.814 E.0477
G3 X43.539 Y149.266 I.64 J.249 E.00375
; WIPE_START
G1 F10727.314
M204 S6000
G1 X43.755 Y149.051 E-.11567
G1 X43.914 Y148.98 E-.06632
G1 X44.178 Y148.953 E-.10068
G1 X44.358 Y148.979 E-.0694
G1 X44.442 Y149.01 E-.03393
G1 X44.603 Y149.118 E-.07355
G1 X44.732 Y149.286 E-.08054
G1 X44.817 Y149.483 E-.08142
G1 X44.888 Y149.84 E-.1385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X45.964 Y150.396 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X46.146 Y151.427 E.02865
G1 X47.203 Y151.427 E.02889
G1 X47.203 Y151.588 E.0044
G1 X46.025 Y151.588 E.0322
G1 X45.795 Y150.372 E.03385
G1 X45.974 Y150.346 E.00494
G2 X47.013 Y150.267 I.487 J-.464 E.03257
G2 X46.952 Y149.246 I-.926 J-.458 E.02928
G2 X45.935 Y149.44 I-.454 J.384 E.03436
G1 X45.738 Y149.419 E.00544
G3 X46.569 Y148.956 I.702 J.282 E.02815
G3 X47.329 Y149.95 I-.071 J.841 E.03852
G3 X46.381 Y150.593 I-.718 J-.039 E.03623
G1 X46.018 Y150.421 E.01097
; OBJECT_ID: 9
; WIPE_START
G1 F10727.314
M204 S6000
G1 X46.146 Y151.427 E-.3854
G1 X47.132 Y151.427 E-.3746
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 8
M625
; start printing object, unique label id: 9
M624 AAEAAAAAAAA=
M204 S10000
G1 X54.761 Y151.207 Z3.4 F42000
G1 X76.549 Y150.576 Z3.4
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X76.207 Y151.488 I-.432 J.358 E.03223
G3 X75.073 Y151.5 I-.696 J-12.123 E.03103
G1 X75.073 Y150.358 E.03123
G3 X76.201 Y150.379 I.351 J11.315 E.03087
G3 X76.508 Y150.532 I-.085 J.555 E.00953
M204 S250
G1 X75.844 Y150.233 F42000
G1 F5333
M204 S5000
G1 X76.455 Y150.361 E.01708
G3 X76.866 Y151.268 I-.164 J.621 E.03117
G3 X76.424 Y151.596 I-.5 J-.212 E.01578
G3 X75.929 Y151.63 I-.447 J-2.935 E.01359
G1 X74.844 Y151.63 E.02965
G1 X74.844 Y149.002 E.07187
G1 X75.073 Y149.002 E.00625
G1 X75.073 Y150.257 E.03432
G2 X75.753 Y150.213 I.16 J-2.814 E.01868
G2 X76.161 Y149.847 I-.317 J-.765 E.01528
G2 X76.733 Y149.002 I-38.105 J-26.377 E.02792
G1 X77.016 Y149.002 E.00775
G3 X76.444 Y149.819 I-3.624 J-1.929 E.02737
G1 X75.893 Y150.199 E.01828
; WIPE_START
G1 F10727.314
M204 S6000
G1 X76.455 Y150.361 E-.22219
G1 X76.586 Y150.409 E-.05317
G1 X76.725 Y150.497 E-.06247
G1 X76.809 Y150.586 E-.04651
G1 X76.866 Y150.682 E-.04231
G1 X76.912 Y150.827 E-.05791
G1 X76.925 Y150.973 E-.05555
G1 X76.914 Y151.109 E-.05185
G1 X76.866 Y151.268 E-.06328
G1 X76.772 Y151.417 E-.0667
G1 X76.713 Y151.476 E-.03168
G1 X76.699 Y151.484 E-.00639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.368 Y151.506 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X78.066 Y151.191 I.165 J-.46 E.01238
G3 X78.02 Y149.559 I4.111 J-.931 E.04493
G3 X78.446 Y149.057 I.578 J.059 E.01913
G3 X78.884 Y149.201 I.066 J.54 E.01304
G3 X79.087 Y149.94 I-1.064 J.689 E.02131
G3 X79.004 Y151.175 I-3.668 J.374 E.03401
G3 X78.426 Y151.523 I-.471 J-.13 E.02036
M204 S250
G1 X78.221 Y151.576 F42000
G1 F5333
M204 S5000
G3 X77.85 Y151.11 I.309 J-.627 E.01684
G3 X77.877 Y149.388 I2.989 J-.813 E.0477
G3 X78.578 Y148.953 I.64 J.248 E.0242
G3 X79.217 Y149.483 I-.017 J.671 E.02447
G3 X79.181 Y151.205 I-3.072 J.798 E.0477
G3 X78.276 Y151.6 I-.651 J-.256 E.02999
; WIPE_START
G1 F10727.314
M204 S6000
G1 X78.064 Y151.474 E-.09379
G1 X77.933 Y151.303 E-.082
G1 X77.85 Y151.11 E-.07981
G1 X77.764 Y150.682 E-.16581
G1 X77.748 Y150.175 E-.19278
G1 X77.766 Y149.881 E-.11174
G1 X77.78 Y149.793 E-.03407
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.45 Y150.201 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X80.275 Y149.846 I.427 J-.432 E.01104
G3 X80.775 Y149.042 I.652 J-.152 E.02876
G3 X81.483 Y149.721 I.095 J.61 E.031
G3 X80.495 Y150.241 I-.606 J.048 E.03875
M204 S250
G1 X80.922 Y150.464 F42000
G1 F5333
M204 S5000
G2 X80.716 Y150.478 I-.06 J.66 E.00568
G1 X80.819 Y150.424 E.0032
G1 X80.362 Y150.209 E.01382
G3 X80.68 Y148.967 I.398 J-.56 E.04519
G3 X80.941 Y148.951 I.205 J1.194 E.00716
G3 X81.511 Y150.114 I.022 J.711 E.04457
G3 X81.374 Y150.215 I-.433 J-.444 E.00467
G1 X80.951 Y150.416 E.01279
G1 X81.118 Y150.513 E.00528
G2 X80.981 Y150.472 I-.256 J.612 E.0039
M204 S250
G1 X81.289 Y150.655 F42000
G1 F5333
M204 S5000
G2 X81.159 Y150.537 I-.451 J.365 E.00484
G1 X81.38 Y150.666 E.007
G3 X81.06 Y151.627 I-.351 J.417 E.03555
G3 X80.281 Y151.425 I-.203 J-.821 E.02295
G3 X80.494 Y150.593 I.378 J-.346 E.02783
G2 X81.379 Y151.232 I.375 J.413 E.05431
G2 X81.325 Y150.704 I-.541 J-.212 E.01508
; OBJECT_ID: 3
; WIPE_START
G1 F10727.314
M204 S6000
G1 X81.159 Y150.537 E-.08949
G1 X81.38 Y150.666 E-.09728
G1 X81.501 Y150.79 E-.06579
G1 X81.557 Y150.908 E-.04991
G1 X81.578 Y151.057 E-.05719
G1 X81.553 Y151.236 E-.06864
G1 X81.487 Y151.374 E-.05792
G1 X81.349 Y151.515 E-.07495
G1 X81.246 Y151.573 E-.04502
G1 X81.06 Y151.627 E-.07359
G1 X80.849 Y151.634 E-.08022
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 9
M625
; start printing object, unique label id: 3
M624 BAAAAAAAAAA=
M204 S10000
G1 X78.492 Y144.375 Z3.4 F42000
G1 X59.428 Y85.671 Z3.4
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X59.658 Y85.726 E.00649
G3 X58.703 Y86.281 I-.882 J-.419 E.03213
G3 X57.499 Y85.138 I-.031 J-1.173 E.05044
G3 X57.727 Y84.013 I1.695 J-.241 E.03199
G3 X58.725 Y83.553 I.922 J.687 E.03135
G3 X59.675 Y84.209 I.016 J.992 E.03368
G1 X59.453 Y84.28 E.00637
G2 X57.783 Y84.428 I-.817 J.276 E.06293
G2 X57.835 Y85.579 I2.406 J.468 E.03181
G2 X59.399 Y85.723 I.817 J-.304 E.0535
; WIPE_START
G1 F10727.314
M204 S6000
G1 X59.658 Y85.726 E-.09868
G1 X59.512 Y85.962 E-.10573
G1 X59.406 Y86.062 E-.05519
G1 X59.259 Y86.157 E-.06669
G1 X59.034 Y86.243 E-.09148
G1 X58.703 Y86.281 E-.12671
G1 X58.561 Y86.275 E-.054
G1 X58.317 Y86.23 E-.09419
G1 X58.153 Y86.163 E-.06732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X61.121 Y86.108 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X60.816 Y85.791 I.161 J-.46 E.01249
G3 X60.77 Y84.159 I4.113 J-.931 E.04494
G3 X61.196 Y83.657 I.578 J.059 E.01911
G3 X61.718 Y83.925 I.072 J.502 E.01712
G3 X61.846 Y84.895 I-2.258 J.791 E.02694
G3 X61.748 Y85.79 I-3.231 J.101 E.02471
G3 X61.179 Y86.124 I-.466 J-.143 E.01983
M204 S250
G1 X60.971 Y86.176 F42000
G1 F5333
M204 S5000
G3 X60.6 Y85.71 I.309 J-.627 E.01684
G3 X60.627 Y83.99 I2.99 J-.814 E.04768
G3 X61.328 Y83.553 I.65 J.263 E.02414
G3 X61.967 Y84.083 I-.017 J.671 E.02447
G3 X61.931 Y85.805 I-3.072 J.798 E.0477
G3 X61.026 Y86.2 I-.651 J-.256 E.02999
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.814 Y86.074 E-.09377
G1 X60.685 Y85.906 E-.0805
G1 X60.6 Y85.71 E-.08129
G1 X60.514 Y85.282 E-.16587
G1 X60.498 Y84.775 E-.19278
G1 X60.516 Y84.481 E-.11174
G1 X60.53 Y84.393 E-.03405
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.913 Y85.14 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X64.13 Y85.266 E.00686
G3 X63.81 Y86.227 I-.351 J.417 E.03555
G3 X63.031 Y86.025 I-.203 J-.821 E.02294
G3 X63.243 Y85.194 I.381 J-.346 E.02775
G2 X64.156 Y85.732 I.371 J.414 E.05712
G2 X63.962 Y85.175 I-.542 J-.124 E.01702
M204 S250
G1 X63.384 Y84.928 F42000
G1 F5333
M204 S5000
G2 X63.476 Y84.963 I.28 J-.593 E.00268
G2 X63.811 Y84.948 I.126 J-.927 E.00922
G1 X63.68 Y85.004 E.00389
G1 X63.866 Y85.113 E.0059
G2 X63.468 Y85.078 I-.254 J.612 E.01111
G1 X63.57 Y85.025 E.00313
G1 X63.112 Y84.809 E.01383
G3 X63.43 Y83.567 I.398 J-.56 E.04519
G3 X63.69 Y83.551 I.205 J1.195 E.00715
G3 X64.242 Y84.732 I.028 J.707 E.04535
G3 X63.917 Y84.902 I-.574 J-.7 E.01011
G2 X64.198 Y84.058 I-.386 J-.597 E.02628
G2 X63.023 Y84.198 I-.574 J.178 E.04565
G2 X63.331 Y84.9 I.641 J.138 E.02239
; OBJECT_ID: 1
; WIPE_START
G1 F10727.314
M204 S6000
G1 X63.476 Y84.963 E-.05985
G1 X63.628 Y84.978 E-.05809
G1 X63.811 Y84.948 E-.07045
G1 X63.68 Y85.004 E-.05401
G1 X63.866 Y85.113 E-.08205
G1 X63.672 Y85.063 E-.07637
G1 X63.468 Y85.078 E-.07762
G1 X63.57 Y85.025 E-.04345
G1 X63.112 Y84.809 E-.19218
G1 X63.018 Y84.733 E-.04594
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 3
M625
; start printing object, unique label id: 1
M624 AQAAAAAAAAA=
M204 S10000
G1 X62.367 Y77.128 Z3.4 F42000
G1 X58.315 Y29.831 Z3.4
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G2 X58.928 Y29.371 I-.164 J-.856 E.0217
G1 X59.158 Y29.426 E.00649
G3 X58.203 Y29.981 I-.882 J-.419 E.03213
G3 X56.999 Y28.838 I-.031 J-1.173 E.05044
G3 X57.227 Y27.714 I1.695 J-.241 E.03199
G3 X58.225 Y27.253 I.922 J.687 E.03134
G3 X59.175 Y27.909 I.016 J.992 E.03368
G1 X58.953 Y27.98 E.00637
G2 X57.283 Y28.128 I-.817 J.276 E.06293
G2 X57.335 Y29.279 I2.406 J.468 E.03181
G2 X58.256 Y29.84 I.817 J-.304 E.0318
; WIPE_START
G1 F10727.314
M204 S6000
G1 X58.561 Y29.754 E-.12054
G1 X58.756 Y29.617 E-.09068
G1 X58.888 Y29.452 E-.07996
G1 X58.928 Y29.371 E-.03464
G1 X59.158 Y29.426 E-.09014
G1 X59.012 Y29.663 E-.10575
G1 X58.906 Y29.762 E-.05514
G1 X58.759 Y29.857 E-.06666
G1 X58.534 Y29.943 E-.09168
G1 X58.469 Y29.95 E-.0248
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.478 Y29.729 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G3 X60.316 Y29.491 I.304 J-.382 E.00801
G3 X60.27 Y27.859 I4.113 J-.931 E.04494
G3 X60.696 Y27.357 I.578 J.059 E.01911
G3 X61.218 Y27.625 I.072 J.502 E.01713
G3 X61.346 Y28.595 I-2.259 J.791 E.02694
G3 X61.248 Y29.49 I-3.231 J.101 E.0247
G3 X60.528 Y29.764 I-.466 J-.143 E.02431
M204 S250
G1 X60.181 Y29.609 F42000
G1 F5333
M204 S5000
G3 X60.1 Y29.41 I.6 J-.36 E.00589
G3 X60.127 Y27.69 I2.99 J-.814 E.04768
G3 X60.828 Y27.253 I.65 J.263 E.02415
G3 X61.467 Y27.783 I-.017 J.671 E.02447
G3 X61.431 Y29.505 I-3.072 J.798 E.0477
G3 X60.214 Y29.659 I-.651 J-.256 E.04093
; WIPE_START
G1 F10727.314
M204 S6000
G1 X60.1 Y29.41 E-.10399
G1 X60.014 Y28.982 E-.16589
G1 X59.998 Y28.475 E-.19276
G1 X60.016 Y28.181 E-.11174
G1 X60.055 Y27.928 E-.09765
G1 X60.122 Y27.706 E-.08798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.095 Y28.759 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5333
M204 S5000
G1 X63.087 Y28.699 E.00167
G1 X63.133 Y28.701 E.00126
G1 X63.569 Y28.961 E.01389
G3 X63.567 Y29.795 I-.265 J.416 E.02716
G3 X62.491 Y29.675 I-.47 J-.665 E.03237
G3 X62.405 Y29.498 I.622 J-.414 E.00541
G1 X62.556 Y29.472 E.00421
G2 X63.595 Y29.382 I.51 J-.151 E.03984
G2 X63.154 Y28.768 I-.558 J-.065 E.02268
M204 S250
G1 X63.521 Y28.543 F42000
G1 F5333
M204 S5000
G2 X63.343 Y27.397 I-.519 J-.507 E.03678
G2 X62.536 Y27.77 I-.221 J.582 E.02709
G1 X62.353 Y27.748 E.00504
G3 X63.159 Y27.253 I.724 J.276 E.02781
G3 X63.845 Y28.327 I.021 J.743 E.04186
G3 X63.578 Y28.527 I-.443 J-.312 E.00928
; WIPE_START
G1 F10727.314
M204 S6000
G1 X63.627 Y28.415 E-.04628
G1 X63.697 Y28.242 E-.07094
G1 X63.721 Y28.04 E-.07758
G1 X63.713 Y27.912 E-.04845
G1 X63.658 Y27.713 E-.07856
G1 X63.608 Y27.623 E-.03887
G1 X63.473 Y27.475 E-.0761
G1 X63.343 Y27.397 E-.05776
G1 X63.168 Y27.352 E-.06896
G1 X63.052 Y27.352 E-.04406
G1 X62.83 Y27.416 E-.08767
G1 X62.697 Y27.523 E-.06477
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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
G1 X0 Y93.5111 F18000 ; move to safe pos
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

