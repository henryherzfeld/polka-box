///@description create instance
///@arg x
///@arg y
///@arg layer_id
///@arg obj
function scr_cutscene_instance_create(argument0, argument1, argument2, argument3) {

	var inst = instance_create_layer(argument0, argument1, argument2, argument3);

	scr_cutscene_end_action();

	return inst;


}
