 /// @description Insert description here

scr_init_phases();

scr_add_phase(enum_phase_type.miscellaneous, "Miscellaneous", c_navy, c_white);
scr_add_phase(enum_phase_type.ask_questions, "Ask Questions", c_red, c_black);
scr_add_phase(enum_phase_type.collect_clues, "Collect Clues", c_green, c_white);
scr_add_phase(enum_phase_type.analyze_clues, "Analyze Clues", c_purple, c_white);

scr_init_objectives();
scr_activate_objective(enum_objective_type.tut_start);

objective_text = "";
objective = enum_objective_type.ero_start;
objective_phase = scr_get_objective_phase(objective);

objective_phase_text = scr_get_phase_state(objective_phase, enum_phase_state.text);

objective_change = false;

progress = 0;
max_progress = enum_objective_type.length;

coins = 0;
hearts = 3;

time = 1200;
paused_time = -1;
alarm[0] = room_speed;