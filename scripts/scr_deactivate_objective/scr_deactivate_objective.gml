///@description scr_deactivate_objective
///@arg0 objective type
function scr_deactivate_objective() {

	var type = argument[0];

	ds_grid_set(flags.objectives, type, enum_objective_state.active, false);


}
