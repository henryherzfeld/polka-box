////@description scr_dia_string_mods
///@arg0 string_mods

var string_mods = argument0;
var n_mods = array_length_1d(string_mods);

with ds_factory {
	var segment = map_ptr[? key];
	var line = segment[idx];
	var new_line = [line];
	array_copy(new_line, 1, string_mods, 0, n_mods);
	line = new_line;
	segment[idx] = line;
}