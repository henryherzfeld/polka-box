////@description scr_dia_string_mods
///@arg0 string_mods

var string_mods = [argument0];
var n_mods = array_length_1d(string_mods);

with ds_factory {
	var segment = map_ptr[? key];
	var line = segment[idx-1];
	
	if is_array(line) {
		var n_mods_exist = array_length_1d(line);
		var new_line = line;
		array_copy(new_line, n_mods_exist, string_mods, 0, n_mods);
	} else {
		var new_line = [line];
		array_copy(new_line, 1, string_mods, 0, n_mods);
	}
	
	segment[idx-1] = new_line;
	map_ptr[? key] = segment;
}