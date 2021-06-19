////@description scr_dia_segment
///@arg0 ds_map_id
///@arg1 ds_map_key
function scr_dia_segment(argument0, argument1) {

	if not instance_exists(ds_factory) { instance_create_layer(0, 0, "Meta", ds_factory); }

	with ds_factory {
		map_ptr = argument0;
		key = argument1;
	
		map_ptr[? key] = [[], []];
		idx = 0;
	}


}
