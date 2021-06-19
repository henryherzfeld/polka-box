///@description scr_convert_array_to_list
///@arg array
function scr_convert_array_to_list(argument0) {
	var array_ = argument0;

	var list_ = ds_list_create();

	for(var i = 0; i < array_length_1d(array_); i++){
		ds_list_add(list_, array_[i]);
	}

	return list_


}
