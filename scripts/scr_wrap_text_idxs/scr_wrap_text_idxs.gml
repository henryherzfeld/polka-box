///@description scr_wrap_text
///@arg0 text
///@arg1 max_length
function scr_wrap_text_idxs(argument0, argument1) {

	var str = argument0;
	var max_len = argument1;

	var idxs = [];

	var str_len = string_length(str);
	var last_space = 1;

	var count = 0;
	var substr;

	repeat(str_len){
		substr = string_copy(str, 0, count);
		if(string_char_at(str, count) == " ") {last_space = count;}

		if(string_width(substr) > max_len){
			str = string_delete(str, last_space, 1)
			str = string_insert("\n", str, last_space);
			idxs[array_length_1d(idxs)] = count;
		}
		count += 1;
	}

	return idxs;


}
