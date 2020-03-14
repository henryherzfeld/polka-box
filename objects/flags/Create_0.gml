 /// @description Insert description here

scr_init_objectives();

scr_add_objective(enum_objective_type.start, "", enum_objective_phase.miscellaneous);
scr_add_objective(enum_objective_type.find_weeraway, "Find Weeraway", enum_objective_phase.ask_questions);
scr_add_objective(enum_objective_type.find_poppy, "Find out why the crops are dying", enum_objective_phase.ask_questions);
scr_add_objective(enum_objective_type.examine_crops, "0/1 clues found", enum_objective_phase.collect_clues);
scr_add_objective(enum_objective_type.report_crops_to_poppy, "1/1 clues found", enum_objective_phase.ask_questions);
scr_add_objective(enum_objective_type.measure_soil_moisture, "Measure the soil's moisture", enum_objective_phase.collect_clues);
scr_add_objective(enum_objective_type.prompt_measure_soil_moisture, "", enum_objective_phase.collect_clues);


//FLAGS

find_weeraway = false; 
find_poppy = false;
examine_crops = false;
report_crops_to_poppy = false;
measure_soil_moisture = false;
prompt_measure_soil_moisture = false;

objective = "";

objective_change = false;

progress = 0;
max_progress = enum_objective_type.length;

