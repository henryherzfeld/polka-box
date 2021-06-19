///@description scr_save_string_to_JSON
///@arg0 filename
///@arg1 string
function scr_save_string_to_JSON(argument0, argument1) {

	var filename = argument0;
	var string_ = argument1;

	var buffer = buffer_create(string_byte_length(string_)+1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, string_)
	buffer_save(buffer, filename);
	buffer_delete(buffer);


}
