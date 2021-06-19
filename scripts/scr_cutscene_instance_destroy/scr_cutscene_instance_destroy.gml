///@description cutscene_instance_destroy
///arg obj_id
function scr_cutscene_instance_destroy(argument0) {

	with(argument0){
		instance_destroy();
	}

	scr_cutscene_end_action();



}
