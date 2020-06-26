////@description scr_quiz_list
///@arg0 list

if not instance_exists(ds_factory) { instance_create_layer(0, 0, "Meta", ds_factory); }

with ds_factory {
	list_ptr = argument0;
}