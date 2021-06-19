///@description cutscene_change_variable
///@arg obj
///@arg var_name_string
///@arg value
function scr_cutscene_change_variable(argument0, argument1, argument2) {

	with(argument0){
		variable_instance_set(id, argument1, argument2)	
	}

	scr_cutscene_end_action();


}
