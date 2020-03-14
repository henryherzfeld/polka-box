///@description scr_activate_objective
///@arg0 objective type

var type = argument[0];

ds_grid_set(flags.objectives, type, enum_objective_state.active, true);
flags.objective_change = true;