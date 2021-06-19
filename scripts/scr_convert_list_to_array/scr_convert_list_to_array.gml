///@description scr_convert_list_to_array
///@arg0 list
function scr_convert_list_to_array(argument0) {

	var list_ = argument0;
	var length = ds_list_size(list_)

	var array = array_create(length, 0);

	for(var i = 0; i < length; i++){
		array[i] = list_[| i];
	}

	return array


}
