 /// @description Insert description here

scr_init_phases();

scr_add_phase(enum_phase_type.miscellaneous, "Miscellaneous", c_navy, c_white);
scr_add_phase(enum_phase_type.ask_questions, "Ask Questions", c_red, c_black);
scr_add_phase(enum_phase_type.collect_clues, "Collect Clues", c_green, c_white);
scr_add_phase(enum_phase_type.analyze_clues, "Analyze Clues", c_purple, c_white);

scr_init_objectives();

scr_add_objective(enum_objective_type.start, "", enum_phase_type.miscellaneous);
scr_add_objective(enum_objective_type.find_weeraway, "Find Weeraway", enum_phase_type.ask_questions);
scr_add_objective(enum_objective_type.find_poppy, "Find out why the crops are dying", enum_phase_type.ask_questions);
scr_add_objective(enum_objective_type.examine_crops, "0/1 clues found", enum_phase_type.collect_clues);
scr_add_objective(enum_objective_type.report_crops_to_poppy, "1/1 clues found", enum_phase_type.ask_questions);
scr_add_objective(enum_objective_type.measure_soil_moisture, "Measure the soil's moisture", enum_phase_type.collect_clues);
scr_add_objective(enum_objective_type.prompt_measure_soil_moisture, "", enum_phase_type.collect_clues);

scr_activate_objective(enum_objective_type.start);

objective_text = "";
objective = enum_objective_type.start;
objective_phase = scr_get_objective_phase(objective);

objective_phase_text = scr_get_phase_state(objective_phase, enum_phase_state.text);

show_debug_message(objective_phase_text);

objective_change = false;
objective_update = false;

progress = 0;
max_progress = enum_objective_type.length;

coins = 0;
hearts = 3;

time = 1200;
paused_time = -1;
alarm[0] = room_speed;