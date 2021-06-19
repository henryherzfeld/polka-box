///@description scr_init_objectives
function scr_init_objectives() {

	enum enum_objective_state {
		text = 0,
		phase = 1,
		active = 2,
		length = 3
	}

	//defining objectives and objective types
	enum enum_objective_type {
		tut_start,
		tut_try_to_leave,
		tut_find_key,
	
		ero_start,
		ero_weeraway0,
		ero_poppy0,
		ero_examine_crops0,
		ero_examine_crops1,
		ero_poppy1,
		ero_measure_soil0,
		ero_poppy2,
		ero_measure_soil1,
		ero_poppy3,
		ero_weeraway_fields_erode,
		ero_poppy4,
	
		ero_ex_start,
		ero_ex_weeraway0,
	
		ero_ca_start,
		ero_ca_cheiftain0,
	
		ero_end,
		length,
	}

	objectives = ds_grid_create(enum_objective_type.length, enum_objective_state.length);

	// TUTORIAL
	scr_add_objective(enum_objective_type.tut_start, "", enum_phase_type.miscellaneous);
	scr_add_objective(enum_objective_type.tut_try_to_leave, "The door is locked..?", enum_phase_type.ask_questions);
	scr_add_objective(enum_objective_type.tut_find_key, "Where is the key?", enum_phase_type.collect_clues);

	// EROSION QUEST
	scr_add_objective(enum_objective_type.ero_start, "", enum_phase_type.miscellaneous);
	scr_add_objective(enum_objective_type.ero_weeraway0, "Find Weeraway", enum_phase_type.ask_questions);
	scr_add_objective(enum_objective_type.ero_poppy0, "Find out why the crops are dying, maybe \na botanist might know", enum_phase_type.ask_questions);
	scr_add_objective(enum_objective_type.ero_examine_crops0, "Go to the farmer's fields with the \ncamera and see how the crops look", enum_phase_type.collect_clues);
	scr_add_objective(enum_objective_type.ero_examine_crops1, "Go to the farmer's fields with the \ncamera and see how the crops look", enum_phase_type.collect_clues);
	scr_add_objective(enum_objective_type.ero_poppy1, "1/1 clues found", enum_phase_type.ask_questions);
	scr_add_objective(enum_objective_type.ero_measure_soil0, "Go to the farmer's fields with the \ntensiometer and measure the soil moisture", enum_phase_type.collect_clues);
	scr_add_objective(enum_objective_type.ero_poppy2, "1/1 clues found", enum_phase_type.ask_questions);
	scr_add_objective(enum_objective_type.ero_measure_soil1, "Go to the farmer's fields with the \ntape measure and measure the topsoil depth", enum_phase_type.collect_clues);
	scr_add_objective(enum_objective_type.ero_poppy3, "1/1 clues found", enum_phase_type.ask_questions);
	scr_add_objective(enum_objective_type.ero_weeraway_fields_erode, "", enum_phase_type.collect_clues);
	scr_add_objective(enum_objective_type.ero_poppy4, "1/1 clues found", enum_phase_type.ask_questions);

	scr_add_objective(enum_objective_type.ero_ex_start, "", enum_phase_type.miscellaneous);
	scr_add_objective(enum_objective_type.ero_ex_weeraway0, "Talk to Weeraway", enum_phase_type.analyze_clues);

	scr_add_objective(enum_objective_type.ero_ca_start, "Go to the courthouse", enum_phase_type.analyze_clues);
	scr_add_objective(enum_objective_type.ero_ca_cheiftain0, "Make your case to the Chieftain", enum_phase_type.analyze_clues);

	scr_add_objective(enum_objective_type.ero_end, "", enum_phase_type.miscellaneous);




}
