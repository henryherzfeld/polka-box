///@description scr_init_phases

enum enum_phase_type {
	miscellaneous = 0,
	ask_questions = 1,
	collect_clues = 2,
	analyze_clues = 3,
	length = 4,
}

enum enum_phase_state {
	text = 0,
	bg_color = 1,
	text_color = 2,
	length = 3
}

phases = ds_grid_create(enum_phase_type.length, enum_phase_state.length)