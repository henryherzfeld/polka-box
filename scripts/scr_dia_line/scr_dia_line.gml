////@description scr_dia_line
///@arg0 line
///@arg1 speaker
function scr_dia_line(argument0, argument1) {

	var line = argument0;
	var speaker = argument1;

	with ds_factory {
		var segment = map_ptr[? key];
		var n = array_length_1d(segment);
	
		var speakers = segment[n-1];
	
		speakers[idx] = speaker;
	
		segment[n-1] = speakers;
	
		var temp = [];
		array_copy(temp, 0, segment, 0, n-2);
		temp[n-2] = line;
		array_copy(temp, n-1, segment, n-2, 2);
	
		map_ptr[? key] = temp;

		idx++;
	}


}
