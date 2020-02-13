///@description scr_wrap_text
///@arg0 text
///@arg1 max_length

text = argument0;
max_len = argument1;
str_len = string_length(text);
count = 0;

repeat(str_len){
	substr = string_copy(str_len, 0, count);
	show_debug_message(substr);
	if(string_width(substr) > max_len){
		string_insert("\n", text, count);
		count += 1;
	}
	count += 1;
}