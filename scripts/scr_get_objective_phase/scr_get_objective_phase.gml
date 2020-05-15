///@description scr_get_objective_phase
///@arg0 type

var type = argument[0];

return ds_grid_get(flags.objectives, type, enum_objective_state.phase);
