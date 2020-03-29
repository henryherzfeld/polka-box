///@description scr_load_string_from_JSON
///@arg filename

var filename = argument0;

var buffer = buffer_load(filename);
var string_ = buffer_read(buffer, buffer_string);
buffer_delete(buffer);

var json = json_decode(string_);

return json;