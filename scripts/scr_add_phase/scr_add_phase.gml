///@description scr_add_phase
///@arg0 type
///@arg1 text
///@arg2 color

var type = argument[0];
var text = argument[1];
var bg_color = argument[2];
var text_color = argument[3];

ds_grid_set(phases, type, enum_phase_state.text, text);
ds_grid_set(phases, type, enum_phase_state.bg_color, bg_color);
ds_grid_set(phases, type, enum_phase_state.text_color, text_color);