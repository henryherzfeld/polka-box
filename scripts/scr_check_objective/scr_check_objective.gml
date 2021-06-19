///@description scr_check_objective
///@arg0 type
function scr_check_objective() {

	var type = argument[0];

	if(ds_grid_get(flags.objectives, type, enum_objective_state.active)){
		return true;
	} else {
		return false;
	}


}
