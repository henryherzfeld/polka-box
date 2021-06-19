///@description scr_get_phase_state
///@arg0 type
///@arg1 state
function scr_get_phase_state() {

	var type = argument[0];
	var state = argument[1];

	var ret = ds_grid_get(flags.phases, type, state);

	return ret


}
