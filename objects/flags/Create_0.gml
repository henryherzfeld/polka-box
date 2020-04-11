 /// @description Insert description here

scr_init_objectives();

scr_add_objective(enum_objective_type.start, "", enum_objective_phase.miscellaneous);
scr_add_objective(enum_objective_type.find_weeraway, "Find Weeraway", enum_objective_phase.ask_questions);
scr_add_objective(enum_objective_type.find_poppy, "Find out why the crops are dying", enum_objective_phase.ask_questions);
scr_add_objective(enum_objective_type.examine_crops, "0/1 clues found", enum_objective_phase.collect_clues);
scr_add_objective(enum_objective_type.report_crops_to_poppy, "1/1 clues found", enum_objective_phase.ask_questions);
scr_add_objective(enum_objective_type.measure_soil_moisture, "Measure the soil's moisture", enum_objective_phase.collect_clues);
scr_add_objective(enum_objective_type.prompt_measure_soil_moisture, "", enum_objective_phase.collect_clues);

scr_activate_objective(enum_objective_type.start);

objective_text = "";
objective = 0;
objective_phase = 0;
objective_phase_texts = ["Miscellaneous", "Ask Questions", "Collect Clues", "Analyze Clues"];
objective_phase_text = objective_phase_texts[0];

objective_change = false;
objective_update = false;

progress = 0;
max_progress = enum_objective_type.length;

coins = 0;
hearts = 3;

time = 1200;
paused_time = -1;
alarm[0] = room_speed;