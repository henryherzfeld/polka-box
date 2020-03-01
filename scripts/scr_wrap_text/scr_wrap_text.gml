///@description scr_wrap_text
///@arg0 text
///@arg1 max_length

str = argument0;
max_len = argument1;
str_len = string_length(str);
count = 0;

repeat(str_len){
	substr = string_copy(str, 0, count);

	if(string_width(substr) > max_len){
		str = string_insert("\n", str, count);
		count += 1;
	}
	count += 1;
}

return str;