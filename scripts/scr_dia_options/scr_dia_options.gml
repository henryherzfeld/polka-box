////@description scr_dia_options
///@arg option1...*

var options = [];
var i = 0; repeat(argument_count) {
	options[i] = argument[i];
	i++;
}

with ds_factory {
	var segment = map_ptr[? key];
	var n = array_length_1d(segment);

	var temp = [];
	array_copy(temp, 0, segment, 0, n-2);
	temp[n-2] = options;
	temp[n-1] = segment[n-1];
	
	map_ptr[? key] = temp;
}