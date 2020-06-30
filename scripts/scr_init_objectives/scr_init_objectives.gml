///@description scr_init_objectives

//defining objectives and objective types
enum enum_objective_type {
	ero_start = 0,
	ero_weeraway0 = 1,
	ero_poppy0 = 2,
	ero_examine_crops0 = 3,
	ero_poppy1 = 4,
	ero_measure_soil0 = 5,
	ero_poppy2 = 6,
	ero_poppy3,
	ero_weeraway_fields_erode,
	ero_poppy4,
	length,
}

enum enum_objective_state {
	text = 0,
	phase = 1,
	active = 2,
	length = 3
}

objectives = ds_grid_create(enum_objective_type.length, enum_objective_state.length);

scr_add_objective(enum_objective_type.ero_start, "", enum_phase_type.miscellaneous);
scr_add_objective(enum_objective_type.ero_weeraway0, "Find Weeraway", enum_phase_type.ask_questions);
scr_add_objective(enum_objective_type.ero_poppy0, "Find out why the crops are dying", enum_phase_type.ask_questions);
scr_add_objective(enum_objective_type.ero_examine_crops0, "0/1 clues found", enum_phase_type.collect_clues);
scr_add_objective(enum_objective_type.ero_poppy1, "1/1 clues found", enum_phase_type.ask_questions);
scr_add_objective(enum_objective_type.ero_measure_soil0, "0/1 clues found", enum_phase_type.collect_clues);
scr_add_objective(enum_objective_type.ero_poppy2, "1/1 clues found", enum_phase_type.collect_clues);
scr_add_objective(enum_objective_type.ero_poppy3, "", enum_phase_type.collect_clues);
scr_add_objective(enum_objective_type.ero_weeraway_fields_erode, "", enum_phase_type.collect_clues);
scr_add_objective(enum_objective_type.ero_poppy4, "", enum_phase_type.collect_clues);