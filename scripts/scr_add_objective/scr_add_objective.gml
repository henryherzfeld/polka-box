///@description scr_add_objective
///@arg0 type
///@arg1 text
///@arg2 phase

var type = argument[0];
var text = argument[1];
var phase = argument[2];

ds_grid_set(objectives, type, enum_objective_state.text, text)
ds_grid_set(objectives, type, enum_objective_state.phase, phase)
ds_grid_set(objectives, type, enum_objective_state.active, false)