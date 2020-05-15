///@description scr_init_objectives

//defining objectives and objective types
enum enum_objective_type {
	start = 0,
	find_weeraway = 1,
	find_poppy = 2,
	examine_crops = 3,
	report_crops_to_poppy = 4,
	measure_soil_moisture = 5,
	prompt_measure_soil_moisture = 6,
	length = 7,
}

enum enum_objective_state {
	text = 0,
	phase = 1,
	active = 2,
	length = 3
}

objectives = ds_grid_create(enum_objective_type.length, enum_objective_state.length);